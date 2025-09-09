package demo.parallel;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ComplexTest {

    @Test
    void testAddition() {
        Complex a = new Complex(2, 3);
        Complex b = new Complex(1, 4);
        a.plus(b);
        assertEquals(3, a.re, 1e-9);
        assertEquals(7, a.im, 1e-9);
    }

    @Test
    void testSubtraction() {
        Complex a = new Complex(5, 6);
        Complex b = new Complex(2, 3);
        a.minus(b);
        assertEquals(3, a.re, 1e-9);
        assertEquals(3, a.im, 1e-9);
    }

    @Test
    void testMultiplication() {
        Complex a = new Complex(1, 2);
        Complex b = new Complex(3, 4);
        a.times(b);
        assertEquals(-5, a.re, 1e-9);
        assertEquals(10, a.im, 1e-9);
    }

    @Test
    void testDivision() {
        Complex a = new Complex(1, 2);
        Complex b = new Complex(3, 4);
        a.dividedBy(b);
        assertEquals(0.44, a.re, 1e-2);
        assertEquals(0.08, a.im, 1e-2);
    }

    @Test
    void testLengthSQ() {
        Complex a = new Complex(3, 4);
        assertEquals(25, a.lengthSQ(), 1e-9);
    }

    @Test
    void testModulus() {
        Complex a = new Complex(3, 4);
        assertEquals(5, a.modulus(), 1e-9);
    }
}
