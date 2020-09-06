Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB7825EF2F
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Sep 2020 18:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgIFQwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 12:52:32 -0400
Received: from mout.gmx.net ([212.227.17.20]:60277 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbgIFQwa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Sep 2020 12:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1599411149;
        bh=kZQLLbYsq767EIjLTBiEDMzOcs47sXVYxgWtNQrlijo=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=BcRPdT/Bby0f74cpKsXZIhlOreSB6vRjC2kJM7OaPNtco7AwOZua30AR44XrSBR0G
         wMukHbhkThLOF4pIo7q7FEckiRIKwBKW6EXiyVsnpAw9LZELXbXtyqoZ5UFRy4Y88i
         T+voZy4I1VBb2pDan0zmPJFmH++e9JNW65HzX79I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from waterstation.localnet ([91.45.211.182]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MhU9j-1kk9ex3KYV-00eblX for <linux-gpio@vger.kernel.org>; Sun, 06 Sep 2020
 18:52:28 +0200
From:   Florian Evers <florian-evers@gmx.de>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod] Integer overflow in C++ binding on 32bit systems causes wrong event timestamps
Date:   Sun, 06 Sep 2020 18:52:21 +0200
Message-ID: <2572959.mvXUDI8C0e@waterstation>
Organization: http://www.florian-evers.de
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11620110.O9o76ZdvQC"; micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Provags-ID: V03:K1:B4JAs+j+e+MSr/CW/LZD50aMCrpSzZF86pY2Hv4Ti+KSu3PJ02M
 3rbZVTsiPEUki1kf4pSw0gkuM4oojMcm2TJwrEQ3ajQm6IA8hxOvjwhs2xHX7QkpEXWGdg5
 jkEDh8OsaslJmXxQsXqN6F+XdxRgE3O3GR2jUDGeSzMWDzVwQs66JQiY8HFXThdZX4JxIeC
 G10jV4OYtx2FfKPfkH0RA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:O+af9l1VkpU=:KsY8EuTMfuLnx4qfNdkzZS
 v8TmIkNcRdo9/nejk4bjtOTUOGkPAwk8HL6J7vA/HRy0C+bIQhgdFZVhrtLNpXDyLesufxYMu
 OYsoCyaGxuSNjLg6j1a5OPOY5M4tGmWAEQQqvtw0IO9TbB4bUu+YzT+P6tfgFwaa2AUcBeh0L
 HA7IoH7sPfEotk9PHmy4oi9XjOw5aa229lRTCtBsuae4S4SPV2Wx0OvLRKJR6EheHaBZ/HlkX
 xsDJGdLJSQYlPyPapDq4rTSPXD/URD5X23lvWsBoH6vrj/PVLlq2bU6tXDf8Q6YCIrEXJPjYd
 iZiAHt9UECn6Nefx0JXUyot6YOQqhxUUMFkiHTBqnrseYnO/M1wLS9SSzgolW3oc/q5Z/sfSu
 e6mijcNJkT1ful0qp3Nb8hVG2NgbN3t906F8ehZ2Q7m0VGkZH3lIPnFhHstYT/mo/IC7Okvcy
 z1TAyRpDL6qMEvJCIkl59geHiRbRnijgWXC7XisQsLWPMlxJb55CGZL2+YVyZSFe8K6CdKfte
 CSl8DaQtkFIRuR3sMZ4CV1plTkklJQ6/Oy+wd2lDRb0ql88uIOvckDTWHlJ57xj89SukULEro
 X5cmGrNuhEFKn1glc4Z64YeH1csZWgMEocY04S3egJ4Mzf48s88cWley/VQnGb7/lnwlF1kj+
 fxOmc375ckWKJC/w7CldqIQF556I4XM409i/UUxiZvZRkwcp2TbmlLyo2j2IlliXhVx0NTx/A
 N2E6II5Nb7g8148mvOF8+GGikPEyMAkcV1TP6pkfw0WRktIjIwopsz7OPln5UNNLLdqznmucm
 VZ4Zh0Y4bK+ENKzLyXBupyPF9iqwBU6Rnaw2Q3nXm84XBGocscBe1+FiBHWNI5wLrSv3ly+Qg
 wbgSUEg82QDiCBRDQyhRN5EZUpVwtSVev5aPUv6ODYECFd5qy6m91HaaEnlyVtyP/m3AxscwF
 RnGSeOL0IfJxpJVfWc6nIdo7EYf4W7rlRGMzAeMTTe1siQRflx4ifWrTfKlIjMVUKPVHmGkhp
 ncu3/8zMzPXZ7tD8YlfJWsJ6qAZpo7RP23gsugdYuW2ziohF28mE+MIR5E5w3IuFabi0Vf5q9
 +bfe4NtJIU6+dAmSqhFM47kDcxzBoo5UUTD8mQ7xz4y4BOkrmh3MzTcbwhzlaCYa+iJGZTIg6
 ercTFecQoJlfAwPdPjL6w2xz82QWbMKLIsD5adChVqXlsS8wjJt+vq+8xr0DOhg2xt5Da0wiw
 vwsjakM5RTPqSn02AIcUAcPx2L9PMK9HZef1iyw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--nextPart11620110.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Florian Evers <florian-evers@gmx.de>
To: linux-gpio@vger.kernel.org
Subject: [libgpiod] Integer overflow in C++ binding on 32bit systems causes wrong event timestamps
Date: Sun, 06 Sep 2020 18:52:21 +0200
Message-ID: <2572959.mvXUDI8C0e@waterstation>
Organization: http://www.florian-evers.de

Hello,

I found a bug in the c++ bindings of libgpiod that affects 32bit systems.

Observation:

Only the c++ bindings lib is affected. For input events, the time stamp
delivered in the event object is wrong. Instead of providing a complete
"system time", it delivers time stamps of of a range "-2.1"...+2.1 seconds
(which relates to the time stamp range of a signed 32bit value, in
nanoseconds).

Cause:

The bug is in line 219 of file "/tree/bindings/cxx/line.cpp":

event.ts.tv_nsec + (event.ts.tv_sec * 1000000000));

"event.ts.tv_sec" is of type signed long, which is 32 bit on my device. Th=
us,
that multiplication to convert total seconds of a system time to nanosecon=
ds
causes an overflow.

Fix:

There should be a cast to uint64_t before the multiplication.

Thank you for fixing this!

Regards,
Florian

--nextPart11620110.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEhKFNjXl3cTz1YyjaJLtLMH/ftD8FAl9VE8UACgkQJLtLMH/f
tD8RlRAAlp3jkwxw6RkWBPqzMOyj/IeBSZj8PERsD2s4XF+ALdJBTtTBp6X2fJFY
EEEVlONxgXq1zy6GpNgnVGWfq//Oo2Xe3fXaMGOwmVWbdjcheaXkC/Vl4PsUorvj
ZdeZAY2RVgy7O3JLZt2IWcGlY6+4zCN7LD9UTe6vD1TpQn3xJZLMWHpBzE9jA5X0
enABTFUmhd1AtGA0NOOCeV9t6eWRLyK9IFnvHUZWUa8c3U6Mw3tJoPKjKngzZ0wm
c46PlSUNbo29nD1QWuJl8+/DCbRhg2DKfYgzQxNcI/ZZfJ9QimMc2wzIp6Y+rH0g
OS+rbKmOmNrDTV/dv3SCceejgYZRgqZliRN++3JAVRDqSKVV61LuY+k0wE7bCLmF
D9ZwjgycjFUvhlzT8ml3FCEBvtjTd8HLseUgEzMhHAUGejP97n6tAs0jzOOvyZ3U
/ddSpuH83gZF/Z8wMqPdXbRW58StRG7vzQVLx2IDuw4YkWQrUE4kSCXAwKDeJV6Y
0vuq/vRHSEo8DQWUDqKCIQrKqSSVckEHh1ZLegqAhXqb613+8wrdV91IjGeaTYfc
Jq7TbuKXgV94DL6V8sY1FHDFpASbG5VahsdtPTWrQ0qm/OkE4yQBeVIGxQyP/Gqq
/kvRltKeoXdLczoP5XX7kSdfMZrvJBoVdaHHnQGCXE3UdAYdyVM=
=IlnP
-----END PGP SIGNATURE-----

--nextPart11620110.O9o76ZdvQC--



