Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B39BA17838E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 21:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731009AbgCCUBx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 15:01:53 -0500
Received: from mout.gmx.net ([212.227.15.19]:41979 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727604AbgCCUBx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Mar 2020 15:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1583265711;
        bh=jv/j6Yf8i9cGXsU5FvFqYYqK9msqey0zt7TE3cfdcHk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=bJ/02EdpYiAsQVYrzKv7fLg484CYd/RY1bOGfxyfr9ytiQqLN1dCZPr0O0NlVlYK/
         lCaY3QA8fwzEjsnHjz8bQO3YHQSAzfrPnt1/iwa6z9K/m4ZFa38IR9cMAXgV7A7z9A
         oj9qG/Fl66If1pb/3FkT+flHaBLW3d7j3OytuZD0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.177]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17UW-1jWlvB2y0A-012VDH; Tue, 03
 Mar 2020 21:01:51 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: uapi: Improve phrasing around arrays representing empty strings
Date:   Tue,  3 Mar 2020 21:01:48 +0100
Message-Id: <20200303200149.27370-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:upu+vLIIss57IUNt/w8STuFzssxSLFOyM6rrm6WsWKGPrfU9zEI
 h6mRx2Jvy0XTmQJX0DLh7kRa1tFUpXtalJuYByEpdLO5Krn6eB9owzAA8E4yb9I8mAo2Lec
 CheYLmSIXsScul53zOIV465YP6mlOy17HL3VycVKsuvTgGGTXhMjYFrNMxQQMhFZVmK74FJ
 dOWDnJ7JzKNY8POOLorbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uTLupxLZDbo=:+O9hnbdmKZ+dJ2ToDWyV+r
 B+EvhpSrZybqqtGlzngpng7FwKmG0Zl4+A/uRFkpdrJY+xRwZFSXD5RWm1UfKiX3LQyN8iRah
 Z/BQ68DHUz+ck1TjlwJRYr6VznMR4Lm+zbQJMlhvK9/0hQEDvvXE++5pKwhq2++XehIlkzgXH
 Nnvo9BEGDFlTorHAKIzSkzHxpqjcNoYDmCbzE93sa4Dxxs0V10Nudl6ro5IZ6VEx58EiC45Mt
 ldNaFGhmokW+9WVhe/6+I8HZ2NMrEZn4FDrImHjoK3nO3klG8kAqxwnnBeSX92730/lE6UjbW
 j2vLtKuDh5r5tNr1706kW0mkxj5SpT/18V/4am6zaNzp2DeGnG5DwSgkVCOauYaefXS6PNH1b
 Zh/NEFXzykHwfPRJgt3wpLv9X1jew7bsO4YG+MvAhDd2043YkKsOJ/VjT+BzeS/doRI3lM2et
 nwrQ9a6FHFWB8yvDVnMOT+AzEzOcthH9+gty+aa9mIiduDysgIaUBvivbI2+IWD5yfiATVpkV
 uh4xE10wk2z2ZmMSp1aWZ2D2HvBs+/Mb7sKLb9e+ZoDIXOY6zneJbIQo4d9NmIuG9VRRho+8B
 3NHxrOyl8fldWkne3xWLTiWB5tHaR2N9U5f2TXVWvdq/3PzjTCdJv5g7Darb2m9u5nksfMHN2
 v/ajvnnRCT+ltA7x/yhfsPaU52+7o4Or7/Lya4UboywdhFP3uS778f7ymAuNtWI3goNQnw7Bv
 PMs5mdst7Rr8mQIDbRTIigJKk+yTTCyp+I4kPGMtVMDYO2aHDxvPy9VB6rlJdCZKQVC2rzNBn
 6ImAVN3EiNdcQO9cn1EqUS1zcbu1zzKXBMDeH1fqyyWUbjVi/oETVLGLgoPJ0H881yUuY/CqH
 6/zg8X0enjLW/mE1GaEgU/e7YY3ij2/LecEu6QOAbypkEkukkT6qz65VlDPiTC2q0BxLLMa5q
 dlJwgQ7yxr36n4dubujQcxEldOgefr1MNlRll1fOpnafaiFueBcf2VlsXMyJICwnGUh0hycCH
 KgIY/wma8NDrVBBuhfq0GLRFEAVaw1Q4K/FnEDdcMyAwGp48D2dDmymI8fWl2ngOriRJUttAb
 K53jmO0XyuGMB+5ipk3GmY15rLhARxiGHZUSAKxUoAVZZNYz70rNF5yln2vs2RLDep+mvaGcU
 P7arEx9nGVcUzJFwIz+KDE6RfiOmdori7Af9PB9QwJ0WU8BF4T5jEnt4/2g/mjcbmwZGoXA6f
 PY+eLDf78KQ5Ng3QN
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Character arrays can be considered empty strings (if they are
immediately terminated), but they cannot be NULL.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 include/uapi/linux/gpio.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 799cf823d493..cd88599ea3ea 100644
=2D-- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -18,7 +18,7 @@
  * struct gpiochip_info - Information about a certain GPIO chip
  * @name: the Linux kernel name of this GPIO chip
  * @label: a functional name for this GPIO chip, such as a product
- * number, may be NULL
+ * number, may be empty
  * @lines: number of GPIO lines on this chip
  */
 struct gpiochip_info {
@@ -44,10 +44,10 @@ struct gpiochip_info {
  * @flags: various flags for this line
  * @name: the name of this GPIO line, such as the output pin of the line =
on the
  * chip, a rail or a pin header name on a board, as specified by the gpio
- * chip, may be NULL
+ * chip, may be empty
  * @consumer: a functional name for the consumer of this GPIO line as set=
 by
- * whatever is using it, will be NULL if there is no current user but may
- * also be NULL if the consumer doesn't set this up
+ * whatever is using it, will be empty if there is no current user but ma=
y
+ * also be empty if the consumer doesn't set this up
  */
 struct gpioline_info {
 	__u32 line_offset;
=2D-
2.20.1

