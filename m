Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4684E30F2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 13:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439208AbfJXLm5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 07:42:57 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46189 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439196AbfJXLm5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 07:42:57 -0400
Received: by mail-lj1-f193.google.com with SMTP id d1so24618299ljl.13;
        Thu, 24 Oct 2019 04:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iHrUaZ4QstA0A5h8AOun5nDY0whyQItP1kSFFnCdNYg=;
        b=AnUSRmFsp6qvC4PPsWFXad5oFZ15Cb8fay4UL02moPg4deIpnh2kw+JmfpGYtS+f8J
         7Fr4XxuHtem5xsz+Ss9tsSYWunK5l6RbsYfQ2fy+ApNpZ6MCUP5G1zn457pZ7vbfkRk2
         GqvzkcsVzm94ZkAizOwfwZjmivf2vqR902isSCU9M6tPLQoNwM9VlWYQnLw6744hLvlh
         IMyBXuFO5VzdppY3NSJFVJ72657DiYZ5aJt7pZEyQQP1ucLWI88RFeVM4jI5nrhb7/wa
         MocaHSN4HybY1XSs7wX0dX6qD3AopYYMic57Rb2Yu7xRCoLo+0N3XnwKKerGotCiJTyH
         RGAQ==
X-Gm-Message-State: APjAAAUhwY3pT5BsmW4ckRTft4Isg7qWySM0bHS8aMkSZzv+FqGRAaiM
        7+HDmDjNqdO6pLaEsmdGVj8=
X-Google-Smtp-Source: APXvYqzSWtNXk7N5AvqLikmK+54/TI15t1pRwymcVZtHkO1OED/6sDVhBu8I48d4ZmF4x+sB35qlaw==
X-Received: by 2002:a2e:29dd:: with SMTP id p90mr26102526ljp.26.1571917373202;
        Thu, 24 Oct 2019 04:42:53 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id n11sm14774030lfd.88.2019.10.24.04.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 04:42:52 -0700 (PDT)
Date:   Thu, 24 Oct 2019 14:42:40 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH v2 03/13] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <8df1ed73e9d14f89e428039b0f5d7761c7d840a1.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document ROHM BD71828 PMIC regulator device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Only commit title changed since v1

 .../regulator/rohm,bd71828-regulator.txt      | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.txt b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.txt
new file mode 100644
index 000000000000..cf6a5123b98d
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.txt
@@ -0,0 +1,164 @@
+ROHM BD71828 Power Management Integrated Circuit regulator bindings
+
+Required properties:
+ - regulator-name: should be "buck1", ..., "buck7", and "ldo1", ..., "ldo7"
+
+List of regulators provided by this controller. BD71828 regulators node
+should be sub node of the BD71828 MFD node. See BD71828 MFD bindings at
+Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
+Regulator nodes should be named to BUCK_<number> and LDO_<number>. The
+definition for each of these nodes is defined using the standard
+binding for regulators at
+Documentation/devicetree/bindings/regulator/regulator.txt.
+
+The valid names for BD71828 regulator nodes are:
+BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6, BUCK7
+LDO1, LDO2, LDO3, LDO4, LDO5, LDO6, LDO7
+
+Optional properties:
+- rohm,dvs-run-voltage		: PMIC default "RUN" state voltage in uV.
+				  See below table for bucks which support this.
+- rohm,dvs-idle-voltage		: PMIC default "IDLE" state voltage in uV.
+				  See below table for bucks which support this.
+- rohm,dvs-suspend-voltage	: PMIC default "SUSPEND" state voltage in uV.
+				  See below table for bucks which support this.
+- rohm,dvs-lpsr-voltage		: PMIC default "LPSR" state voltage in uV.
+- rohm,dvs-runlvl-ctrl		: buck control is done based on run-level.
+				  Regulator is not individually controllable.
+				  See ../mfd/rohm,bd71828-pmic.txt for how to
+				  specify run-level control mechanism. Only
+				  bucks 1, 2, 6 and 7 support this.
+- rohm,dvs-runlevel0-voltage    : voltage for run-level 0. Microvolts.
+- rohm,dvs-runlevel1-voltage	: voltage for run-level 1. Microvolts.
+- rohm,dvs-runlevel2-voltage	: voltage for run-level 2. Microvolts.
+- rohm,dvs-runlevel3-voltage	: voltage for run-level 3. Microvolts.
+
+- Any optional property defined in bindings/regulator/regulator.txt
+
+Supported default DVS states:
+
+buck		| run		| idle		| suspend	| lpsr
+-----------------------------------------------------------------------------
+1, 2, 6, and 7	| supported	| supported	| 	supported (*)
+----------------------------------------------------------------------------
+3, 4, and 5	| 			supported (**)
+----------------------------------------------------------------------------
+(*)  LPSR and SUSPEND states use same voltage but both states have own enable /
+     disable settings. Voltage 0 can be specified for a state to make regulator
+     disabled on that state.
+(**) All states use same voltage but have own enable / disable settings. Voltage
+     0 can be specified for a state to make regulator disabled on that state.
+
+Example:
+regulators {
+	buck1: BUCK1 {
+		regulator-name = "buck1";
+		regulator-min-microvolt = <500000>;
+		regulator-max-microvolt = <2000000>;
+		regulator-ramp-delay = <2500>;
+		rohm,dvs-runlvl-ctrl;
+		rohm,dvs-runlevel0-voltage = <500000>;
+		rohm,dvs-runlevel1-voltage = <506250>;
+		rohm,dvs-runlevel2-voltage = <512500>;
+		rohm,dvs-runlevel3-voltage = <518750>;
+		regulator-boot-on;
+	};
+	buck2: BUCK2 {
+		regulator-name = "buck2";
+		regulator-min-microvolt = <500000>;
+		regulator-max-microvolt = <2000000>;
+		regulator-ramp-delay = <2500>;
+		rohm,dvs-runlvl-ctrl;
+		rohm,dvs-runlevel0-voltage = <500000>;
+		rohm,dvs-runlevel1-voltage = <506250>;
+		rohm,dvs-runlevel2-voltage = <512500>;
+		rohm,dvs-runlevel3-voltage = <518750>;
+		regulator-boot-on;
+	};
+	buck3: BUCK3 {
+		regulator-name = "buck3";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <2000000>;
+		regulator-boot-on;
+	};
+	buck4: BUCK4 {
+		regulator-name = "buck4";
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+	};
+	buck5: BUCK5 {
+		regulator-name = "buck5";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+	buck6: BUCK6 {
+		regulator-name = "buck6";
+		regulator-min-microvolt = <500000>;
+		regulator-max-microvolt = <2000000>;
+		regulator-ramp-delay = <2500>;
+		rohm,dvs-runlvl-ctrl;
+		rohm,dvs-runlevel0-voltage = <500000>;
+		rohm,dvs-runlevel1-voltage = <506250>;
+		rohm,dvs-runlevel2-voltage = <512500>;
+		rohm,dvs-runlevel3-voltage = <518750>;
+		regulator-boot-on;
+	};
+	buck7: BUCK7 {
+		regulator-name = "buck7";
+		regulator-min-microvolt = <500000>;
+		regulator-max-microvolt = <2000000>;
+		regulator-ramp-delay = <2500>;
+		rohm,dvs-runlvl-ctrl;
+		rohm,dvs-runlevel0-voltage = <500000>;
+		rohm,dvs-runlevel1-voltage = <506250>;
+		rohm,dvs-runlevel2-voltage = <512500>;
+		rohm,dvs-runlevel3-voltage = <518750>;
+		regulator-boot-on;
+	};
+	ldo1: LDO1 {
+		regulator-name = "ldo1";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+	ldo2: LDO2 {
+		regulator-name = "ldo2";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+	ldo3: LDO3 {
+		regulator-name = "ldo3";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+	ldo4: LDO4 {
+		regulator-name = "ldo4";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+	ldo5: LDO5 {
+		regulator-name = "ldo5";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+	ldo6: LDO6 {
+		regulator-name = "ldo6";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+	};
+	ldo7_reg: LDO7 {
+		regulator-name = "ldo7";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+};
+
+
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
