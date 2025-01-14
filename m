Return-Path: <linux-gpio+bounces-14798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 067E7A1121D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 21:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19BBA188B09A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 20:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3E320C037;
	Tue, 14 Jan 2025 20:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SESh8x1q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62561FCD05
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 20:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736886970; cv=none; b=STVZGnMmBgERmtDrzTtDgaO/dqItL4hqr/T2DHHFaLt02RFQevmecXUwhyGv4X1neMfay8yJFTaqwxgtcHwP7Z6vNS+PKg9hM1jasC6qp7rSeDbQNbBQzaTMEGUL65t9rUJ+kK6GmrmenxloTozBcKGLcn/Uw//qWS3tgPQd2bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736886970; c=relaxed/simple;
	bh=ukkkIja32iI6alXYqQ/IJwbxkrTfoSw4yAFk/qnS/hA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZSCGRQ7yWLt2eFo2ltJ+agIjFzlA97vLn5Yw1mhRb/xH/qcIVL2K9l9pwGOrjrOZl18KNIpEP5uabKhxEhBaCDPHLRxoMygGpKc/poy9Q77WN8MpZtPedr/bEwaM9vntCXpGAGmo89KoCLZMn1GPlE9YBavrQu5L6Q/wcwqJ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SESh8x1q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so7482325e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 12:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736886966; x=1737491766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HbH/voKF25Fs4JYbEAVD7Vza/rm5Lq/+qQ/NpgvqfSw=;
        b=SESh8x1qfGcz5JwBhx/WH2gzgXklEyeeiMcU8OapbMBlekRwbo3mWyZDgLknt0jvfE
         rV9QWakWe/fwec6O+kyt2xDz6lWexTUVq9lt7oHbNziQix651Jj6Ny3OSOvxFr7YkK9b
         AeV6Rx8nQZ2vqO1DA0O/uL14ccX7SrLlZrOZ9dkD5VAcTx66CXiYtzP+KzhteCsvldZ3
         /AIrlQ1chy31ArtCsjiJBQGU6U1gwqsbFi09DoPTiNQ13hJ/rDg2vJnpH0YLIMLY+8fU
         9DayfLRdr0ozeiMLHFWHhphz2Ox5fuh9lnZgYEQYuNXH8dNNJ82PLOhca951tKeekcM8
         JfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736886966; x=1737491766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbH/voKF25Fs4JYbEAVD7Vza/rm5Lq/+qQ/NpgvqfSw=;
        b=c/FzRtWRYXZPinxlhwe5dajzZcMg5pkbJk5CqXmnBzbp39UoHn3phkOtDLLnMtdSji
         X6LU3kgfSuzHfqc/n4S4GvLYO5IsvkqN2sfSbcaFVb4wrft3M53oKVAlOO0AqPLC4jSE
         WKLwISYgeE1kMlxDZZI0bP8fLUrecfQoRCX5MZ1mOF8HeC/Zm9CLDJIcNnG2bmrkIH4U
         tFoQA5n8AIxq8ehp/ALWz6pvtv0TLkYv03MjXUT6BvyB85Ze/I9vPMd5TwiyF31caNYi
         9w/UNDv4FrFBuUlInhHGz+r3AFd67m/YclmI6OnqL6M2ASS8EnurOEZHfXCO2LBHQRiZ
         9FrA==
X-Forwarded-Encrypted: i=1; AJvYcCW9sBXM6UNjXcZpj+gHvKYBc0q1z8ZxLdr+EUMcneLIMLZbhmYCBRVk9GwAoe8IiW6L1NSjn/rzfQ9J@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7l1FQbV4Rd97UNiwQvnVJJHWMchI4tfO5hxkIjYzacCMUBWL+
	P9ONS6juDnO57Kzmo3jtGE6xE44gDOn0B+u+LkqY7O8F39HIoWgfHdI8+/su4AI=
X-Gm-Gg: ASbGnctg4aj22HBqGKpmSTksuvEFihR5rmTOP6Vu45i6FYldPiMs8xcjD9732Q4v98n
	No6E9NGIQjNwlmpOxHLeOZAT2EFVzmbnBy3C0bpLkCf9r2YNMXv6WgmH/8RxchV1vVW2PECiyKR
	sG5UvtoQGaVKHW590goB3hlQH6ITbLSiSPxKfn2DhcbJ3Pb5mPCVDQTnCv1WpxdXiBeCGuIUPzO
	+Ufihr+lBgknippjS4lYdfPUFdfZJ1r4ZouKKHqoGYDcFiIuIVE+Nid7VULXlQVn1EbZ1E=
X-Google-Smtp-Source: AGHT+IEmnDRCiFUzVpMMNcRLd0A3Y1MS6nFOyUmHSYtTVhJ7ylQMchNI3gHDhJrSomau6Vg1xNwZJg==
X-Received: by 2002:a05:600c:1c1a:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-436e26867ebmr101130925e9.1.1736886966041;
        Tue, 14 Jan 2025 12:36:06 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc05a1sm224190415e9.15.2025.01.14.12.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:36:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 21:36:02 +0100
Message-ID: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c     |  3 ++-
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c |  3 ++-
 drivers/pinctrl/nomadik/pinctrl-abx500.c   |  5 +++--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c  |  7 ++++---
 drivers/pinctrl/pinctrl-amd.c              |  3 ++-
 drivers/pinctrl/pinctrl-gemini.c           | 11 ++++++-----
 drivers/pinctrl/pinctrl-stmfx.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c         |  3 ++-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c   |  3 ++-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c    |  3 ++-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c   |  3 ++-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c    | 10 ++++------
 drivers/pinctrl/samsung/pinctrl-exynos.c   |  3 ++-
 drivers/pinctrl/stm32/pinctrl-stm32.c      |  5 +++--
 14 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 84af6aae36d1..a96be8f244e0 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -21,6 +21,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include "../pinctrl-utils.h"
 
@@ -254,7 +255,7 @@ static int nsp_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	dev_dbg(chip->dev, "gpio:%u level_low:%s falling:%s\n", gpio,
-		level_low ? "true" : "false", falling ? "true" : "false");
+		str_true_false(level_low), str_true_false(falling));
 	return 0;
 }
 
diff --git a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
index 014297a3fbd2..0f32866a4aef 100644
--- a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
+++ b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinconf-generic.h>
@@ -1068,7 +1069,7 @@ static void lochnagar_gpio_set(struct gpio_chip *chip,
 	value = !!value;
 
 	dev_dbg(priv->dev, "Set GPIO %s to %s\n",
-		pin->name, value ? "high" : "low");
+		pin->name, str_high_low(value));
 
 	switch (pin->type) {
 	case LN_PTYPE_MUX:
diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 4ce2e35a6373..8cd4ba5cf0bd 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -22,6 +22,7 @@
 #include <linux/property.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 #include <linux/mfd/abx500.h>
@@ -496,7 +497,7 @@ static void abx500_gpio_dbg_show_one(struct seq_file *s,
 
 		seq_printf(s, " %-9s", pull_up_down[pd]);
 	} else
-		seq_printf(s, " %-9s", chip->get(chip, offset) ? "hi" : "lo");
+		seq_printf(s, " %-9s", str_hi_lo(chip->get(chip, offset)));
 
 	mode = abx500_get_mode(pctldev, chip, offset);
 
@@ -865,7 +866,7 @@ static int abx500_pin_config_set(struct pinctrl_dev *pctldev,
 			pin, configs[i],
 			(param == PIN_CONFIG_OUTPUT) ? "output " : "input",
 			(param == PIN_CONFIG_OUTPUT) ?
-			(argument ? "high" : "low") :
+			str_high_low(argument) :
 			(argument ? "pull up" : "pull down"));
 
 		/* on ABx500, there is no GPIO0, so adjust the offset */
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index dcc662be0800..8940e04fcf4c 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -28,6 +28,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 /* Since we request GPIOs from ourself */
@@ -1125,15 +1126,15 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				slpm_pull ? pullnames[pull] : "same",
 				slpm_output ? (output ? "output" : "input")
 				: "same",
-				slpm_val ? (val ? "high" : "low") : "same");
+				slpm_val ? str_high_low(val) : "same");
 		}
 
 		dev_dbg(nmk_chip->chip.parent,
 			"pin %d [%#lx]: pull %s, slpm %s (%s%s), lowemi %s\n",
 			pin, cfg, pullnames[pull], slpmnames[slpm],
 			output ? "output " : "input",
-			output ? (val ? "high" : "low") : "",
-			lowemi ? "on" : "off");
+			output ? str_high_low(val) : "",
+			str_on_off(lowemi));
 
 		ret = clk_enable(nmk_chip->clk);
 		if (ret)
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index fff6d4209ad5..6d395a528f55 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/string_choices.h>
 #include <linux/suspend.h>
 
 #include "core.h"
@@ -458,7 +459,7 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 
 	if (err)
 		dev_err(&gpio_dev->pdev->dev, "failed to %s wake-up interrupt\n",
-			on ? "enable" : "disable");
+			str_enable_disable(on));
 
 	return 0;
 }
diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index 631612539af7..e9f61927858d 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -14,6 +14,7 @@
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf-generic.h>
@@ -2237,7 +2238,7 @@ static int gemini_pmx_set_mux(struct pinctrl_dev *pctldev,
 				"pin group %s could not be %s: "
 				"probably a hardware limitation\n",
 				gemini_padgroups[i],
-				enabled ? "enabled" : "disabled");
+				str_enabled_disabled(enabled));
 			dev_err(pmx->dev,
 				"GLOBAL MISC CTRL before: %08x, after %08x, expected %08x\n",
 				before, after, expected);
@@ -2245,7 +2246,7 @@ static int gemini_pmx_set_mux(struct pinctrl_dev *pctldev,
 			dev_dbg(pmx->dev,
 				"padgroup %s %s\n",
 				gemini_padgroups[i],
-				enabled ? "enabled" : "disabled");
+				str_enabled_disabled(enabled));
 		}
 	}
 
@@ -2259,7 +2260,7 @@ static int gemini_pmx_set_mux(struct pinctrl_dev *pctldev,
 				"pin group %s could not be %s: "
 				"probably a hardware limitation\n",
 				gemini_padgroups[i],
-				enabled ? "enabled" : "disabled");
+				str_enabled_disabled(enabled));
 			dev_err(pmx->dev,
 				"GLOBAL MISC CTRL before: %08x, after %08x, expected %08x\n",
 				before, after, expected);
@@ -2267,7 +2268,7 @@ static int gemini_pmx_set_mux(struct pinctrl_dev *pctldev,
 			dev_dbg(pmx->dev,
 				"padgroup %s %s\n",
 				gemini_padgroups[i],
-				enabled ? "enabled" : "disabled");
+				str_enabled_disabled(enabled));
 		}
 	}
 
@@ -2588,7 +2589,7 @@ static int gemini_pmx_probe(struct platform_device *pdev)
 	tmp = val;
 	for_each_set_bit(i, &tmp, PADS_MAXBIT) {
 		dev_dbg(dev, "pad group %s %s\n", gemini_padgroups[i],
-			(val & BIT(i)) ? "enabled" : "disabled");
+			str_enabled_disabled(val & BIT(i)));
 	}
 
 	/* Check if flash pin is set */
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 521f6fef0b9f..aae01120dc52 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -380,7 +380,7 @@ static void stmfx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 		seq_printf(s, "input %s ", str_high_low(val));
 		if (type)
 			seq_printf(s, "with internal pull-%s ",
-				   pupd ? "up" : "down");
+				   str_up_down(pupd));
 		else
 			seq_printf(s, "%s ", pupd ? "floating" : "analog");
 	}
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index ec913c2e200f..47daa47153c9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -19,6 +19,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf-generic.h>
@@ -714,7 +715,7 @@ static void msm_gpio_dbg_show_one(struct seq_file *s,
 	}
 
 	seq_printf(s, " %-8s: %-3s", g->grp.name, is_out ? "out" : "in");
-	seq_printf(s, " %-4s func%d", val ? "high" : "low", func);
+	seq_printf(s, " %-4s func%d", str_high_low(val), func);
 	seq_printf(s, " %dmA", msm_regval_to_drive(drive));
 	if (pctrl->soc->pull_no_keeper)
 		seq_printf(s, " %s", pulls_no_keeper[pull]);
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 0c806b8128b6..c8ce61066070 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -14,6 +14,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spmi.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 #include <linux/pinctrl/pinconf-generic.h>
@@ -702,7 +703,7 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 		else
 			seq_printf(s, " %-4s",
 					pad->output_enabled ? "out" : "in");
-		seq_printf(s, " %-4s", pad->out_value ? "high" : "low");
+		seq_printf(s, " %-4s", str_high_low(pad->out_value));
 		seq_printf(s, " %-7s", pmic_gpio_functions[function]);
 		seq_printf(s, " vin-%d", pad->power_source);
 		seq_printf(s, " %-27s", biases[pad->pullup]);
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 84de584cf7eb..7b28c5fb2402 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 #include <linux/pinctrl/pinconf-generic.h>
@@ -544,7 +545,7 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
 		seq_printf(s, " %d", pad->aout_level);
 		if (pad->has_pullup)
 			seq_printf(s, " %-8s", biases[pad->pullup]);
-		seq_printf(s, " %-4s", pad->out_value ? "high" : "low");
+		seq_printf(s, " %-4s", str_high_low(pad->out_value));
 		if (pad->dtest)
 			seq_printf(s, " dtest%d", pad->dtest);
 		if (pad->paired)
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index 2225dc49d477..82679417e25f 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
@@ -569,7 +570,7 @@ static void pm8xxx_gpio_dbg_show_one(struct seq_file *s,
 		seq_printf(s, " VIN%d", pin->power_source);
 		seq_printf(s, " %-27s", biases[pin->bias]);
 		seq_printf(s, " %-10s", buffer_types[pin->open_drain]);
-		seq_printf(s, " %-4s", pin->output_value ? "high" : "low");
+		seq_printf(s, " %-4s", str_high_low(pin->output_value));
 		seq_printf(s, " %-7s", strengths[pin->output_strength]);
 		if (pin->inverted)
 			seq_puts(s, " inverted");
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 9b1039c08aa6..4841bbfe4864 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
@@ -576,8 +577,7 @@ static void pm8xxx_mpp_dbg_show_one(struct seq_file *s,
 			seq_puts(s, "out ");
 
 			if (!pin->paired) {
-				seq_puts(s, pin->output_value ?
-					 "high" : "low");
+				seq_puts(s, str_high_low(pin->output_value));
 			} else {
 				seq_puts(s, pin->output_value ?
 					 "inverted" : "follow");
@@ -589,8 +589,7 @@ static void pm8xxx_mpp_dbg_show_one(struct seq_file *s,
 		if (pin->output) {
 			seq_printf(s, "out %s ", aout_lvls[pin->aout_level]);
 			if (!pin->paired) {
-				seq_puts(s, pin->output_value ?
-					 "high" : "low");
+				seq_puts(s, str_high_low(pin->output_value));
 			} else {
 				seq_puts(s, pin->output_value ?
 					 "inverted" : "follow");
@@ -605,8 +604,7 @@ static void pm8xxx_mpp_dbg_show_one(struct seq_file *s,
 			seq_printf(s, "dtest%d", pin->dtest);
 		} else {
 			if (!pin->paired) {
-				seq_puts(s, pin->output_value ?
-					 "high" : "low");
+				seq_puts(s, str_high_low(pin->output_value));
 			} else {
 				seq_puts(s, pin->output_value ?
 					 "inverted" : "follow");
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ac6dc22b37c9..42093bae8bb7 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -23,6 +23,7 @@
 #include <linux/of_irq.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/regmap.h>
 #include <linux/err.h>
 #include <linux/soc/samsung/exynos-pmu.h>
@@ -442,7 +443,7 @@ static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
 	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
 	unsigned long bit = 1UL << (2 * bank->eint_offset + irqd->hwirq);
 
-	pr_info("wake %s for irq %u (%s-%lu)\n", on ? "enabled" : "disabled",
+	pr_info("wake %s for irq %u (%s-%lu)\n", str_enabled_disabled(on),
 		irqd->irq, bank->name, irqd->hwirq);
 
 	if (!on)
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..563dd3abd428 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -22,6 +22,7 @@
 #include <linux/reset.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
@@ -1217,7 +1218,7 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 	case 0:
 		val = stm32_pconf_get(bank, offset, true);
 		seq_printf(s, "- %s - %s",
-			   val ? "high" : "low",
+			   str_high_low(val),
 			   biasing[bias]);
 		break;
 
@@ -1227,7 +1228,7 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 		speed = stm32_pconf_get_speed(bank, offset);
 		val = stm32_pconf_get(bank, offset, false);
 		seq_printf(s, "- %s - %s - %s - %s %s",
-			   val ? "high" : "low",
+			   str_high_low(val),
 			   drive ? "open drain" : "push pull",
 			   biasing[bias],
 			   speeds[speed], "speed");
-- 
2.43.0


