Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 919BE6F97E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 08:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfGVGYA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 02:24:00 -0400
Received: from mout.gmx.net ([212.227.17.22]:36443 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbfGVGX7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 02:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563776616;
        bh=p7EuEN+WXnzmcDfw8Q5gWYTDfwT+rrLjIA0t4iR5+DU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Fs7+OVDivi+bxt7RG4MgsXL9iMFsdsFLsu8M/Ofw0D3bG2jayz7C5BLqxT0Jz7ChV
         xfSd9tEIGIK0/QkidlIkkj75mePWfRAai0gs2I1knyTADe0T6oKDWoRHiy6gawpFiA
         JqIYS6XbhH7MFrv06OwjEF/7cW4bl9/PpAgNiDvo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MaV3V-1i8uWX2ZBZ-00KCgz; Mon, 22
 Jul 2019 08:23:36 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 11/18] dt-bindings: pinctrl: bcm2835: Add brcm,bcm2711 compatible
Date:   Mon, 22 Jul 2019 08:23:24 +0200
Message-Id: <1563776607-8368-2-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563776607-8368-1-git-send-email-wahrenst@gmx.net>
References: <1563776607-8368-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:L6MvCiJSUEBAg1rTPB7ACRbeRDXsOwcCOZcjaEYDTpcasQM/U5z
 3+lW4tcXkM8Ok5cyjtm399i4Fiin6mdeNhwTW8WSrDg4LkG9sXABaWVT7PNX5VjBaS2Oe+m
 qfJNByhfka/+Pn7gu74tdiZ60bAd+LH3IleO0W+0Rr1Ut2+3yAGprJDmJMjKR+1P54l7v2I
 DFjYVlyuh3cTv0FNKCGIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MJTh9r2apxo=:iwLc9ZJ3pv2oOMTOXOcVge
 I9yPnQoAGYB7VvLujM0XRTWRzYaDGW4JBSR/9CVMI/KP9szSSAFVsF1IFFeJXqD0Sc60mwSLF
 BwO4AhkEUbvo4tdx/7dhG780XfC9wNkSE4Hld9prwxaZW7Mw6+coZBi6pfxmRKDB8PEI++dy+
 SXHt9d9A2jTwY1k7xamdHOBDkgrxVIaywxHvImhzCxx82RvZCAg7xgb2faAVHLUMF45Jp41Ap
 B97Y8dBBk43dejfqln2C8iKdbH04YnTxzARdUZInRacl6JyO5px44kJhG9meTJ7zXISls5mhB
 Xw7gAwZF65p7eqhhM8ELp3lRE4omt8XCrXWmxgO2H0j1edeKFdZ4QWBLYw000UoL8LmSxD6ia
 c19xye46n7nWEE/bCuXPgYrepKyZlmaz0YZHUZ9E+tru35fOm1gMZk+Dj0r0Mc9mO1O1Fey64
 fVZMwREad/Pko4gXl3mSeVzECi/GUNn+UPASk8yJXUY1mP8Vh6wnkefdWVomTtGsu7aa+fSLb
 JzWLq2hYWAMYLQRW3ioihAQVgsp+2EoZwKiEg/AIB1JY9UbRjPg3+RLNGS9eDWTIHF1cpoPVC
 HaNrIqDL9YBxl9pTmk6V2jRAwqsHe+LpwXPH20Ug5VzWstd3tMbbO+U9twwVBAuLW2t1LRZY9
 2f1nS2+UWqCRgKTpyyP5mYjShHKzpOcn11lUomyoDj261j6AotDFCGIHnasTbOjXAvoDXqMfi
 DcyYFJYLj1a4AnFBZ5tr89H/HZy3xNrjWiaxKEEW7furQ9U9kS8pUGVsD7qW4n2a2cS22d0T/
 CPveiO/8mgjF6ApfsVWCuFZn84if6SmqUewB1Yrv93ZZpsgMOcLgU0H/iiOVGUh5GtHHKKDca
 w0ySOjNFi2LKkRF4iwQHJe6DQuOi42H9Sou+fQmkm0nDCBPa4WtCfTmQSHDbS/zquaTXcUzP3
 B8qwWJMDZGekfEmnBIf2OvFDQ38pjdb3XOOeCP37b+VyYD13j66Zgtq28LamiEbwlnyZgWcuv
 OmbTgKBzmetHA/mjgkR5vpNQF6ShB88cLDK19LNIiImiTVfVeX9/35OwHVMfwCUr5CpRp3elI
 sshxoWksxyjM38=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a new compatible for the BCM2711.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.t=
xt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
index ac6d614..3cab733 100644
=2D-- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
@@ -8,6 +8,7 @@ Required properties:
 - compatible: should be one of:
   "brcm,bcm2835-gpio" - BCM2835 compatible pinctrl
   "brcm,bcm7211-gpio" - BCM7211 compatible pinctrl
+  "brcm,bcm2711-gpio" - BCM2711 compatible pinctrl
 - reg: Should contain the physical address of the GPIO module's registers=
.
 - gpio-controller: Marks the device node as a GPIO controller.
 - #gpio-cells : Should be two. The first cell is the pin number and the
=2D-
2.7.4

