Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B93DFCC0FC
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 18:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbfJDQl4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 12:41:56 -0400
Received: from mout.gmx.net ([212.227.17.22]:37241 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbfJDQl4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Oct 2019 12:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570207294;
        bh=eFr7a8OZETIn8xG0qail3KyCHLTVqHhYrjKexW97lX8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Yf5Pa5vHgQY7HIjWtZZ4knzzkUnAan0UU1AoZmbF1iD0Mvi5I1Mi9+TiiaTJeUF0U
         jJcZZi2mkdqBjNDletLrpBEnSTe4DK+RWhBipKZzK7xn4tKNGlTjcbb9Ikr3A3b6nL
         VVJQLW9sXCLtxQsVckkOzSEGc39NvK/xngfxcShM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([89.0.25.131]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sit-1i3We922Ot-018NUU; Fri, 04
 Oct 2019 18:41:34 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     Michael Buesch <m@bues.ch>, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] docs: driver-api: Move bt8xxgpio to the gpio directory
Date:   Fri,  4 Oct 2019 18:40:55 +0200
Message-Id: <20191004164059.10397-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yfsD6jNuHAIbkUh5UzDF+8NaYHabqBLXETfcVTlqX/IfAg3kA0t
 EDmj1YQTZp+ySRJIRhUzJ8VwqfPy09Y15WE8RzzwSbxbkWj3Ht6589uiv+ui93hX/YIII+Q
 c9uzbaZkeZtyGKjdNpumIip9txpQfXFoTgMOI/iw0EIJ6xIFrwM0ywi0tHe3MqwAP1Lq0Vg
 dUGKTkcco3HOgZOv1WxKw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p4dfBfkoXqw=:UkZtJOMZwGJNsNehqS7KjJ
 OuEd/dsrZU5cDr1Ekx+QGR7PAHf3vp3kou/HBu1eBHAeWxukQKfOzCHp2bkBjc1dj9dh/HM4I
 8k4vTaDQHjeOq5J65VDC3QPorh5FsbVNHtKgc7+h3RCwzHRb//2XNEQaX+JliVULgtxk+9y5/
 QCoqB5SGGSrts8N1Q7rmyIGbjsnMXTsgRGWREggFt5eaNh+5Qm6ieoOHQdKMdD+VNhV4670BK
 fWDCuJO+auVc70QIfRxxPBVQH4rrAocCEe0o6SQj/eDqGKsgWUvfkWtfXX/y0GPPW/PK0/ZfI
 kvZ6It5znlyru/dAJ2kCz9nSqWjd4AJDd01wzkHe7JY+doLKAH0fXACAQcuJyBc9dS7VmnMe2
 4g2Ba3WTmXqLISSsb9BrTYImW9oxnpd0pfmjrkKBqC9dHh9LmJi7RmYcUg8NoWANrmGhZ2Qjc
 VX3/XJEAoG9BkcTpt2BMaEk/x/z1Z/rzp9rimoQ5R/f5JT9Y8ImRbQe1F1KZySCOaREi38ZtJ
 qOtTmp5p1iRhSE5zeJF0ANJzr5ym4M471Ta8bpMxperm+2QZ6xhGBWmd4KZgZudZ0kE9pT56c
 p32ODIQY5ZyjZlXdAnb9j0xq8DiOXO24earL10PmQvBN372b/f4OkklO8rYoMhK/qMcFGSM53
 kUeZaY39Y/ESWTxUM7QHyCC3jH+vZ09RtqEAq0TfMqV/DRSFQJH/SI8uld2cnmyPtiuVOZB+G
 DP4s7Ft2LFjdXZicqd42O5GErm2i+eMI4VW2+21aUNv32NyHpYgDt3tFGUcFs54UfoTmZz4rd
 Xe+PdoQrLXJhbWEV3F/mWHqsioHyOMPs6aQ7S2VArjkgTAxqoIjhYaq414WvEoiUjODIPgTJ5
 LoNJXdIo8aXk2XLX0pF36N2k3oM8Ox+8K3JNDaavpnlybRmDDICaorFJYQv3oXwrGZJE57IDW
 OtiDw5SFYr1QtuajiKnBpGtPkSUJSnlwxQFVZwRQEyf/3jHtJP4OMZreE6Ev1qB9NKeMrIb/i
 WJZ+C3NpwX7IhSC/qWfVTZVXNUl9nyYBff6JGfTt8CQcXIu3Co+h8f01k27aHGubQDQuhgwGn
 to7UvndKuhhWa4XQw3KPJ2K6IdaDY+EmTbbx0gnxXTJ4hj42NJ17ViBXe5y/vedkZkz9lre4X
 RzZCPMju8yXfbRl6TSf/n1SUqQaBx0+u4M0s8v8QpsP/hio3mL58y4MdgOjZBqNa8+nno5Q2J
 I2yJb4/jXPOuzqMk2FqMQerYcFcZHhjWd97zFk9wXXnEA6WTPhKvcqyk0ANI=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Let's declutter Documentation/driver-api a bit.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

Is this where we want to put documentation about specific GPIO
drivers/chips? Or perhaps under a subheading?
=2D--
 Documentation/driver-api/{ =3D> gpio}/bt8xxgpio.rst | 0
 Documentation/driver-api/gpio/index.rst           | 1 +
 Documentation/driver-api/index.rst                | 1 -
 drivers/gpio/Kconfig                              | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/driver-api/{ =3D> gpio}/bt8xxgpio.rst (100%)

diff --git a/Documentation/driver-api/bt8xxgpio.rst b/Documentation/driver=
-api/gpio/bt8xxgpio.rst
similarity index 100%
rename from Documentation/driver-api/bt8xxgpio.rst
rename to Documentation/driver-api/gpio/bt8xxgpio.rst
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/drive=
r-api/gpio/index.rst
index c5b8467f9104..5b61032aa4ea 100644
=2D-- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -13,6 +13,7 @@ Contents:
    board
    drivers-on-gpio
    legacy
+   bt8xxgpio

 Core
 =3D=3D=3D=3D
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api=
/index.rst
index 38e638abe3eb..2b3b6949381e 100644
=2D-- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -69,7 +69,6 @@ available subsections can be seen below.
    fpga/index
    acpi/index
    backlight/lp855x-driver.rst
-   bt8xxgpio
    connector
    console
    dcdbas
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 38e096e6925f..d96fb9923d30 100644
=2D-- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1320,7 +1320,7 @@ config GPIO_BT8XX
 	  The card needs to be physically altered for using it as a
 	  GPIO card. For more information on how to build a GPIO card
 	  from a BT8xx TV card, see the documentation file at
-	  Documentation/driver-api/bt8xxgpio.rst
+	  Documentation/driver-api/gpio/bt8xxgpio.rst

 	  If unsure, say N.

=2D-
2.20.1

