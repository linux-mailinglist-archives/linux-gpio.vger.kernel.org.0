Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFD57C8B7B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 16:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbfJBOlu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 10:41:50 -0400
Received: from mout.gmx.net ([212.227.15.18]:58165 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728322AbfJBOlu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Oct 2019 10:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570027304;
        bh=LEhTMKW5en/jej5WrXelG7JFpmCLnLL3D9Fno0SqqiE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=ZzXRNOW+ZhSDxD/PHTD7oPaHkJX6SKVzNwPSQDWltGhgozJ8789ySKvST1l8vzEzC
         6yadNZn9jATrP7drL9DQtMW3k+JkhVLKaHa+7+AqhVfaHUpN9K8X6fTOXKxmSDIS+9
         EaSdEh1Aa1M/Yh+wLu1vGf8mFtW6nGUf8bR1mJSo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvbFs-1hxRz437yw-00siDI; Wed, 02
 Oct 2019 16:41:44 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: gpio: driver: Format code blocks properly
Date:   Wed,  2 Oct 2019 16:41:41 +0200
Message-Id: <20191002144141.9732-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YFez/7mfyanK8mMCrXHvqTnhrX6cN+9wLIY25EBKnAxkL3cgsh9
 7qafulLSxZIx20FSFlPX6o9yd9y9ZoDrSx3BncrhWl2V9n0HG5ES0x6XSCCSKsliCAR7Yp7
 Vh6yNmCbZN5bVqpqwY8ja5uQcpm4B/CJWLUDkKQ3nWT3k7goBNCaGp5SsLFf7/HKAn9yAMl
 xx8AZXJRK6PlcAP1YkBsg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:34aLev9KuC8=:KnTFspfp4RsaTlnHrzoorr
 yd/9iE+D3j6WGB6LbHcN8pT+jqwTJcGPQGKt4uSqhU24NUeZ8f4XHYP6Y3S3m3U2OZdesqnbZ
 HvXA3NqSHhM5J/qGMg7lw9h+fCt1VRRHwO5SFTPikob5qwQ07/wbtMKNRRzIe77+A9mLKAxpe
 DudyktU9ArLNzCL9dysvfml+6vFU0US72sIlSg6b2FwJrBgsqND16gEIab60Dc2ZwdPL1ryzw
 Cbh+ZSyNyhJcHdSor0C7NJSgr/OfhfqQvKdKgKW966PIbyiAWLKBHHXDNZqUwaz7COktjT1Fh
 EzBvG2CgTqp+Wqe+uoVl/GhePnNjQlLyO6xE2zM6VU8srxwol3L2wDH2y+yYLy6qxyoI9J6zl
 G/unlI20blLaArgVb6yh72pKtsQHXe0Sho5WvZb7PRDs6QEWtdQ70y7zxxRCCWtjY3aW4BCtk
 fVx5CsBSl2ER/Ra9k047ux77i2Kjp5ycQ7Ti/JjcU+3BUdHGnFwGGnhrjcCTdBIekohBHi3qo
 kSsVYvri5gZ3f26GldDadEXQRASuOIuukOGVRzW2cmGEpiQMjcmkytBw8dQWq6ErnyHPNSumA
 5+qcU5sy4EeLnvjFGMnNa2aQhaP9q420XbB3hfpuL5Ym6PRhAv5CtSKGKYvLr9H81askQH2WE
 +aYJL3UF7/3MYMIGKPpahH0pzSl5I16D8Kc8uzXddoxw8Dd/NujBH9IIBOTZX+nVeXBDVoLop
 5XuAXTRjKVspATyoZrxqlhrgGzB9+xFFQ6UZw8HbKhi6dxBb2nOsqfWR3BgVIdwTdjXJplatb
 QvdpEL3fnbMpHN/XaJAuwG0RqcrdIGJSFHq/5SPW3JBQyifnV4ezcJTfeMcUqOD0AGFmvl2xC
 SDV4lEtCAtHU7FeNK4ztaBvliwOzZATK8zcF5EO3kg1NtZ8CT9ZCFq3qTfrgGwGZSE6bl8q4o
 nIL2J+lIbv3T8rLuEY+/35HeSTx9icIVxK3uvsALWA7h54MojeCBcBC7M9volxWb5LIR2eeEB
 a58OFPc7HZ+Vj3ODokdDBKMfrHe4QS/ckPZ3hUKf6lGNs1HPstS+kMS78MXB5A8eVvjLBIUBa
 gWhjd8aXkAT4KkVK3LCXSrgyzGOj3T78bHRMl4uVs+iRvPyqF4c1pFrsU+07qG0Cm9T3Zr5aa
 Xo9aBZ8fV9Rpg/xH3K/enlcv0LCP2xhJfiockuVd1QH8DtyPCwKJrViI+MMe1dA8Ti3ruYBMK
 tpti6OwcW2Oh3EDDQ90jCJUvchiCEP/uY26m9V1s5GngUvNjzUOqTcy30XBg=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This fixes a lot of Sphinx warnings, and makes the code blocks look nice
in HTML.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/driver-api/gpio/driver.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driv=
er-api/gpio/driver.rst
index 3fdb32422f8a..18dca55eddfd 100644
=2D-- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -415,6 +415,8 @@ If you do this, the additional irq_chip will be set up=
 by gpiolib at the
 same time as setting up the rest of the GPIO functionality. The following
 is a typical example of a cascaded interrupt handler using gpio_irq_chip:

+.. code-block:: c
+
   /* Typical state container with dynamic irqchip */
   struct my_gpio {
       struct gpio_chip gc;
@@ -450,6 +452,8 @@ is a typical example of a cascaded interrupt handler u=
sing gpio_irq_chip:
 The helper support using hierarchical interrupt controllers as well.
 In this case the typical set-up will look like this:

+.. code-block:: c
+
   /* Typical state container with dynamic irqchip */
   struct my_gpio {
       struct gpio_chip gc;
=2D-
2.20.1

