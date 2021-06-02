Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA203988E8
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 14:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhFBMGX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 08:06:23 -0400
Received: from mout.gmx.net ([212.227.15.19]:34647 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229871AbhFBMGS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Jun 2021 08:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622635470;
        bh=P4/CfhOzE9qRlABqP08JDSxbRq009BHSNhR9z95OX2w=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lgQKeGjRVV6tsRoM8dHKW++3Uf3CpH6WhKM1AT4f1qaapS9x6dn9fS/sg/wZ4uAGJ
         uLMVc9flkSrAz0qMZHFH06d1wqMUJTfpB52VIXTii3qg4tAEiDLpINRmLQ4t7RN1br
         BfDrHqc5auxijmpSZYGz0rA7bgQ5NR3HASU5B/iY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKKh-1ld5st2CCn-00FmqE; Wed, 02
 Jun 2021 14:04:30 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 8/8] ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and buttons
Date:   Wed,  2 Jun 2021 14:03:29 +0200
Message-Id: <20210602120329.2444672-9-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yAIGTz3cD7aDJ3+2ETP6l+xFmX749yXxCxe42nbjAlS00V6VR85
 6vyW3FtqEUrdgJuACoVtyPMbP8wR1VBJCDJVkqP0qa7lv+VasFSyn7CYEUQ0s0kt9YpQw1v
 9UPEgaqUuOwvmfl5HpUMHkdFbvMfOxaL6Idqx8PNe9m4Q/wQJblQ2Z5mdqypNAj30FiYW1k
 oXSMU/CzqHfMiNOum7H/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CopH+5nNWnI=:noLlRC8oYJ46PYECr24XOz
 kZcl4CxGxpi/L6w3Jp39hM5bIoo4rAa94qKCWCehQW23sFQdUKGnlsu1eW4blVOOGOIhinxqY
 eS7kYrTaVFmG5PJGrTZB3w/hxdTHsOsg3uGTDtvCJv9AfmJm/eROAh8Fi3JNkok1tK78HXBpP
 4g5tjIHPyvijXFoO8ncloC2kgd3RD2KMHAYp8jr9KDV/7O5A+S9mcYbJIYMiGnQO9D/h3Wq2X
 XOLIgBVaVzA4d1gEPQQ400EJ2sUjyr5UMRMRJf2ySiOov3jQe+MbixFhu8a7TiWejLW9qVnIV
 5pjmBFy0s1zoCPVoAytvlp/BO4MbRQJVsjKEUSb61aUDEqx1YJr47BrDBsvIlFNybYy7CWlQc
 6FDdWIPJNco7PabJODHN/Ls6iJZnVlfbcTrBflVeW34fLcDG+Qav119Yn+L5GL8GTdcq9+fqc
 uc5nKx8vmV3FYfobJnB0fepFGqpKiGHuj5zX69z1WkfB+dWeQjaYL40t5I1ktjEtABx8BVZPy
 kC5sG83PgMawaPOsKcRrfzskAUmDM6d/wrKCKrEIyIsKNAVYClVNtnNJxiVG2XZXf1t40+K1G
 X1oTUJxy77uLUF3Bqf6bGFZBkJuk/5b2007gVPMDJWpJX752n3iEmzB3dgDhZSf/brNZoME0H
 1fB9uf2lFIKOdS0uaMBfKAAdfjfbyuzS1g2PTuO9+jozDCIyQiMKITo6/81Ryl3RX5JF95x1B
 BkFQr4wkv7DGmljY8gNbt+xXZZyUcm/zaZPRTGsxfrk7t2d7h6DncJyJfti9TWY6hTkrRZC2t
 iRBjzr5RaFlHr5aVqP9FOOyudnvblXQOlxnj3JNGT2Z1evaSdrNLCth23ei7OHLLCc+w+aH5Z
 6auUkCihSsL4SawvnbWGwi+Gl8wkfbFWlg+Kf8ZFCOGJp4jFPzJMHc+WVdJwHYI4hqsR1lrP9
 GDMtz2ZQthNcUVQ1P2T//KOxAeHrFBqGNLQesFynjYe4Lbi+ioKFv1NUj4NLACm+ejkD8enUC
 D8W4OPUlxFxprmACq0jb7CnngzyKwbtDENuoIE91ey8LMWtgEIi/tY9jj8BfOIR9GQOkCX9eQ
 52kA1jtON+8Prtpo64ppNdK6lF5wadOqHbUZktJe2tDFPgRQpdUhE4Lqw==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Supermicro X9SCi-LN4F server mainboard has a two LEDs and a button
under the control of the BMC. This patch makes them accessible under
Linux running on the BMC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts b=
/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
index 83f27fbf4e939..176e22216a75e 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
+++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
@@ -8,6 +8,9 @@

 #include "nuvoton-wpcm450.dtsi"

+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model =3D "Supermicro X9SCi-LN4F BMC";
 	compatible =3D "supermicro,x9sci-ln4f-bmc", "nuvoton,wpcm450";
@@ -20,6 +23,30 @@ memory@0 {
 		device_type =3D "memory";
 		reg =3D <0 0x08000000>; /* 128 MiB */
 	};
+
+	gpio-keys {
+		compatible =3D "gpio-keys";
+
+		uid {
+			label =3D "UID button";
+			linux,code =3D <KEY_HOME>;
+			gpios =3D <&pinctrl 14 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-leds {
+		compatible =3D "gpio-leds";
+
+		uid {
+			label =3D "UID";
+			gpios =3D <&pinctrl 23 GPIO_ACTIVE_HIGH>;
+		};
+
+		heartbeat {
+			label =3D "heartbeat";
+			gpios =3D <&pinctrl 20 GPIO_ACTIVE_LOW>;
+		};
+	};
 };

 &serial0 {
=2D-
2.30.2

