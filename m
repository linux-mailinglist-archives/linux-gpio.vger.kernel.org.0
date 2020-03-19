Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7148518B36C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 13:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgCSM2G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 08:28:06 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33072 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbgCSM2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 08:28:06 -0400
Received: by mail-wr1-f68.google.com with SMTP id a25so2750943wrd.0;
        Thu, 19 Mar 2020 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VkO1g8ia5B6Hejwxvp+dLoxc7nhwOT1xQpHpINjJpOY=;
        b=F8mX6SCDKlX9sQ60S1C8BfuuYgS7dj1tkfWw7Pf30CeWZluEcGnNwtgmExyMsTjVlV
         KcYJt8Z+5ybRumItiDsQJo11skJmVuXGqPJ9iJAatgrpqObGwzI2nR25Om6OmwgZHrDj
         XdFzWMIuZ+xFK8SS09ts33oMpoLStRQGNId6sYc+NNZH8zvbAkzaXoC2ENg5fFWO1t82
         hwtgX9BHjY98mzAj1+UwGeXsYYCu2aYrq63w9qE8zWy4SyHpMEKo7nAbjanHwLd0hGqK
         g6xSZAl10XdEHL3Pe30TvDViz7bNb2v2Wr+bd2y2vveHyAaZeVqrsYyUZ/c1xncuYW67
         rw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VkO1g8ia5B6Hejwxvp+dLoxc7nhwOT1xQpHpINjJpOY=;
        b=kvBA/QBe25tnKazuyGLtfxZpRlZNikmXEgISnJMD0J2vU47PK0HD3frQfd1cJpqL95
         MvDabSYPqnJTlxoWeXK5YbI3jr6wFEpU4Nl/XDOvX9Yl9mwpY8yDNEWD5OPANae/kDJe
         JpuGTculYeuJJiSeBrrv4/DY2CkOaJG22/kmITN2xNbWDLjQ+741HrsGPuThZePNR7Ag
         erZKlQBB22v2nE/QqeXvTJvaO2W7MOJP83D4S43Mmy5EqnH+7YiqHAqSHehclA+u3d9F
         C3Uq2WHvcyCfn3VI+ncWGBe9mE6yfEtZ0wvdOyab7AnagtUYVMo/YINIvhFHUb+W+SJ9
         sz6g==
X-Gm-Message-State: ANhLgQ3ETagNrKMeWwEQxkkQ1/5gEaZkwAKBOUKpJRu1KZfhG/u7Gp4m
        BKCQtH5MJtqerrGTbiKKfBA=
X-Google-Smtp-Source: ADFU+vtQEGzTtBN7eglOXY1xYI76BH/o7sYcWlD/HEFWGDyakTd5EUhBGfzhoFlvYCv7AFrBL5FLRA==
X-Received: by 2002:a5d:6388:: with SMTP id p8mr3888569wru.51.1584620883405;
        Thu, 19 Mar 2020 05:28:03 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id f15sm2919786wmj.25.2020.03.19.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:28:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 9/9] pinctrl: tegra: Add SFIO/GPIO programming on Tegra194
Date:   Thu, 19 Mar 2020 13:27:37 +0100
Message-Id: <20200319122737.3063291-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319122737.3063291-1-thierry.reding@gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Prior to Tegra186, the selection of SFIO vs. GPIO modes was done as part
of the GPIO controller's register programming. Starting with Tegra186, a
pin is configured as GPIO or SFIO with a bit in a configuration register
of the pin controller.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 46 ++++++++++++++++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
 drivers/pinctrl/tegra/pinctrl-tegra194.c |  2 ++
 3 files changed, 51 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 65511bf27d34..21661f6490d6 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -275,11 +275,57 @@ static int tegra_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
+					     struct pinctrl_gpio_range *range,
+					     unsigned int offset)
+{
+	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
+	const struct tegra_pingroup *group;
+	u32 value;
+
+	if (!pmx->soc->sfsel_in_mux)
+		return 0;
+
+	group = &pmx->soc->groups[offset];
+
+	if (group->mux_reg < 0 || group->sfsel_bit < 0)
+		return -EINVAL;
+
+	value = pmx_readl(pmx, group->mux_bank, group->mux_reg);
+	value &= ~BIT(group->sfsel_bit);
+	pmx_writel(pmx, value, group->mux_bank, group->mux_reg);
+
+	return 0;
+}
+
+static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pctldev,
+					    struct pinctrl_gpio_range *range,
+					    unsigned int offset)
+{
+	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
+	const struct tegra_pingroup *group;
+	u32 value;
+
+	if (!pmx->soc->sfsel_in_mux)
+		return;
+
+	group = &pmx->soc->groups[offset];
+
+	if (group->mux_reg < 0 || group->sfsel_bit < 0)
+		return;
+
+	value = pmx_readl(pmx, group->mux_bank, group->mux_reg);
+	value |= BIT(group->sfsel_bit);
+	pmx_writel(pmx, value, group->mux_bank, group->mux_reg);
+}
+
 static const struct pinmux_ops tegra_pinmux_ops = {
 	.get_functions_count = tegra_pinctrl_get_funcs_count,
 	.get_function_name = tegra_pinctrl_get_func_name,
 	.get_function_groups = tegra_pinctrl_get_func_groups,
 	.set_mux = tegra_pinctrl_set_mux,
+	.gpio_request_enable = tegra_pinctrl_gpio_request_enable,
+	.gpio_disable_free = tegra_pinctrl_gpio_disable_free,
 };
 
 static int tegra_pinconf_reg(struct tegra_pmx *pmx,
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 520865979d4a..fcad7f74c5a2 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -107,6 +107,7 @@ struct tegra_function {
  *			drvup, slwr, slwf, and drvtype parameters.
  * @drv_bank:		Drive fields register bank.
  * @hsm_bit:		High Speed Mode register bit.
+ * @sfsel_bit:		GPIO/SFIO selection register bit.
  * @schmitt_bit:	Schmitt register bit.
  * @lpmd_bit:		Low Power Mode register bit.
  * @drvdn_bit:		Drive Down register bit.
@@ -153,6 +154,7 @@ struct tegra_pingroup {
 	s32 ioreset_bit:6;
 	s32 rcv_sel_bit:6;
 	s32 hsm_bit:6;
+	s32 sfsel_bit:6;
 	s32 schmitt_bit:6;
 	s32 lpmd_bit:6;
 	s32 drvdn_bit:6;
@@ -192,6 +194,7 @@ struct tegra_pinctrl_soc_data {
 	bool hsm_in_mux;
 	bool schmitt_in_mux;
 	bool drvtype_in_mux;
+	bool sfsel_in_mux;
 };
 
 extern const struct dev_pm_ops tegra_pinctrl_pm;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
index 61afe5fe9dec..2e0b5f7bb095 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -95,6 +95,7 @@ static struct tegra_function tegra194_functions[] = {
 		.tri_bit = 4,					\
 		.einput_bit = e_input,				\
 		.odrain_bit = e_od,				\
+		.sfsel_bit = 10,				\
 		.schmitt_bit = schmitt_b,			\
 		.drvtype_bit = 13,				\
 		.drv_reg = -1,					\
@@ -140,6 +141,7 @@ static const struct tegra_pinctrl_soc_data tegra194_pinctrl = {
 	.hsm_in_mux = true,
 	.schmitt_in_mux = true,
 	.drvtype_in_mux = true,
+	.sfsel_in_mux = true,
 };
 
 static int tegra194_pinctrl_probe(struct platform_device *pdev)
-- 
2.24.1

