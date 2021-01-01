Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2022F2E859A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jan 2021 21:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbhAAUpT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jan 2021 15:45:19 -0500
Received: from mout.gmx.net ([212.227.17.21]:54237 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727345AbhAAUpT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Jan 2021 15:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609533823;
        bh=o8W97Be/ykZnAzyMvVqtdQHDaTrw9TAT29KA6tDK23I=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=QgEOIEAhZxzaEDO1UGqNyjD86vOF2K+m5aOhlC3SDQ8ip6Fj/bu2kNPJ6Xq+Fjogc
         wIzRTS7R1RQZa6gOGy5lSnnMKRRIJQnP1KBKcSY9MaIwfVoQkTl7ZLM1bcsvIIuj8t
         Na283rc41BToHptZ4kavZf33wH2QrsymF5Yl3Cfk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpex-1k9D8q2LMN-00mLYj; Fri, 01
 Jan 2021 21:43:43 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-doc@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: gpio: intro: Improve HTML formatting
Date:   Fri,  1 Jan 2021 21:43:25 +0100
Message-Id: <20210101204325.998256-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SVNAo+wQIW7ce7SfiBlJZAfjfyEWJGCSSaJ4Zv2QFZi3tYkBleh
 uoMA/0Gh96VJMKUoF+tXMEBhC7QXvIgMe8JGSr7bOWA/oUvcdfSm/V8g4DrTJMq829acLpl
 acGMB2Dve63tny12FMQHlvT+96C/rz0+mbTWn2Tm4IJvIsyVJeh918BiKB4alTc2FIUeSbB
 hXFnZ5EgaMxK4HG1Y9a3w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vKUjyiX+a0c=:JoXGkyBCflpttYhKrsUudn
 rPIO6oRzvZOEPfJ6Lo1FKMDOksSSQwMJNDfgnOWEpb+cLgala1lZxOYjnHRHcHX0Y180oscWm
 9oHEiZNF+RCS90JLKHfjRrVlfc0qUqvSqbxfTuZv/cYc1W8DYA2qzjyxSVrfNqHIJxoxq5UJB
 AI+xl247Pxsaz72d/7OAcmYLjho6IgtHik4hh2xXiLDG+gTIMpdIr3sCaT6Frht/FkRtSsL35
 6qBbkj1T3RMd2TnMPTA+8/MkOI3S6hc9Tl0nwGJ5aB/xM0SF/yVAU7Q4PK7Xe3i9a+o96K/YS
 ragwLjdh0KpRF6N4h+H0J6MdcDD/nk1d02DzEv+jsFF72gj2TMtp9RmXyu6Ao+uR7HZEjlhd2
 3eH6WY9UPFVYosubIvB9lCpGJUSLjZPLagbiEALd+66b0ts1Mspn45uFKU0f1ZlLvURX+QPDo
 Y/RqmEFS3k9Z6PJ0U65xyN2ZgqW3mvJZXIpQfKGnHrx+NE/fCjrmYKHPHV+R9ViGanMM6Sng1
 5/tjCM0NXhbNFFYurTvBb93A7pPsyvLiu6cSZEzpqr8THB425tvYOmpjcR2NL+vntZqg9fkG+
 AxXK9rjTAG6TaY9zLPIa2fG7t0/n7IV+0NY3SmAsGkeL122deo1a0bTQfudxvSTIGB2cPLxc0
 J+Pp/DLV/8OTUw3Zd9Qj+Qw2eBu3orAFgc4Zpqaj/pQZo/0kgkx2DtrcNjv1RAPEB1i8JC3X6
 drFZsXqG7vrGGbm+QMDFzTHd+87R/B1uyV9sYX3nqdFaFyyRO5pfpjj3a4Vin9ShIAtChtX82
 jbQj/j7q3YZ3n72lzwZJZ260GSaQwe/tXB38G/9eZ+YhTq3blpEp7jQ/XoXRMx6ZEtWS1Xmy1
 38XCO1lPDoXGbgRQ61cg==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently the HTML output for Documentation/driver-api/gpio/intro.rst
doesn't look right. The lines that start with LOW or HIGH are formatted
in bold, while the next line after each is not bold.

With this patch, the HTML looks better.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/driver-api/gpio/intro.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/gpio/intro.rst b/Documentation/drive=
r-api/gpio/intro.rst
index 74591489d0b55..94dd7185e76eb 100644
=2D-- a/Documentation/driver-api/gpio/intro.rst
+++ b/Documentation/driver-api/gpio/intro.rst
@@ -106,11 +106,11 @@ don't. When you need open drain signaling but your h=
ardware doesn't directly
 support it, there's a common idiom you can use to emulate it with any GPI=
O pin
 that can be used as either an input or an output:

- LOW:	gpiod_direction_output(gpio, 0) ... this drives the signal and over=
rides
-	the pullup.
+ **LOW**: ``gpiod_direction_output(gpio, 0)`` ... this drives the signal =
and
+ overrides the pullup.

- HIGH:	gpiod_direction_input(gpio) ... this turns off the output, so the =
pullup
-	(or some other device) controls the signal.
+ **HIGH**: ``gpiod_direction_input(gpio)`` ... this turns off the output,=
 so
+ the pullup (or some other device) controls the signal.

 The same logic can be applied to emulate open source signaling, by drivin=
g the
 high signal and configuring the GPIO as input for low. This open drain/op=
en
=2D-
2.29.2

