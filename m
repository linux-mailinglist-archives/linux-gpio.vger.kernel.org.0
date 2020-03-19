Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B86D618B36B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 13:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgCSM2E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 08:28:04 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50343 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgCSM2D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 08:28:03 -0400
Received: by mail-wm1-f65.google.com with SMTP id z13so2087310wml.0;
        Thu, 19 Mar 2020 05:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ok5T8nOrOvJjiHNCN+eqISks4zosVhn1uXl3HafWgc=;
        b=UZE/Hfp2ubu9c97pvpxV+JCba4jHL7/oeLdORRiGpuelT/Xjf5EFeIDPpiMMWjt0JJ
         XtPgZ5wU0T8qFaSapOcXvGFyIWEoe+s2qwxiutiTTE1wIOUef5uyvxE37NrcDSPyfGa5
         UAjvrvTcFOU7mLLV8Op2rz8EpLeh72FlQ5GjUaGyVBbbVszPNIMRxbff7weS91ALZMi9
         cyi2qviC4PJvXlLlkzrYRD7cHdYIAIeN/PrJsXPop/csPXXUUMGRP6+2sC9AOi78x9pg
         csB0RJ/oiXcZ5F9Mo66CAynwheCz66ddxWr5jGOauQ1fj5JZxkp7o1MfnI7M8JnCfyx4
         3orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ok5T8nOrOvJjiHNCN+eqISks4zosVhn1uXl3HafWgc=;
        b=RUPwk6+mbZRu/ZJU2L37g96rgzuOy+ElL8KE70EiJyoJYg4HUhdMtChg57dIq4C/gi
         Jo0IBvdJSJCr9/yyJRUtJ4RP6tzw3NbHL1cCtw/O6eaeb2g3iW0/Ns5HP5BlhBJokLc1
         U/vHo5iGvqm7IGRaXY1mrqYJ8BhmglGEDvt+ScT3FpfeyRl4nQNjDTATLYBZXY1FZgAD
         2wYgUgyNjsT15/lH7E5+LHb8MxRelPTsuN/BMzWvEYXZdiT/IFjBuoZjrVhihZPOV/ye
         sS0c1NFgBw4PugitAU3uiEjLs2RSMrnBqi0krCBplILg581iCt04QzLQW8Ceau676md1
         IN2g==
X-Gm-Message-State: ANhLgQ3cJHAGt/szyvcMflnMwE4AGSTse4aNdExYSa3O8p5gYYiAzqsp
        xtEUBDdSH2WW1WQOMdHksVg=
X-Google-Smtp-Source: ADFU+vsCRi/h9UhqEDYtI8hhpzVZ9R4rmZr0ET/+3CveIO2W0TXmt6eHEygu79WH6FwKSc/+LzaMxA==
X-Received: by 2002:a1c:ab07:: with SMTP id u7mr3351885wme.23.1584620881275;
        Thu, 19 Mar 2020 05:28:01 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id b15sm3159798wru.70.2020.03.19.05.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:28:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 8/9] pinctrl: tegra: Renumber the GG.0 and GG.1 pins
Date:   Thu, 19 Mar 2020 13:27:36 +0100
Message-Id: <20200319122737.3063291-9-thierry.reding@gmail.com>
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

There is no need to define these at a specific offset since they are the
only pins defined for this SoC generation. Begin numbering them at 0.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
index 61fc7e680788..61afe5fe9dec 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -24,17 +24,14 @@
 
 /* Define unique ID for each pins */
 enum pin_id {
-	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0 = 256,
-	TEGRA_PIN_PEX_L5_RST_N_PGG1 = 257,
-	TEGRA_PIN_NUM_GPIOS = 258,
+	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
+	TEGRA_PIN_PEX_L5_RST_N_PGG1,
 };
 
 /* Table for pin descriptor */
 static const struct pinctrl_pin_desc tegra194_pins[] = {
-	PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
-		    "TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0"),
-	PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1,
-		    "TEGRA_PIN_PEX_L5_RST_N_PGG1"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0, "PEX_L5_CLKREQ_N_PGG0"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1, "PEX_L5_RST_N_PGG1"),
 };
 
 static const unsigned int pex_l5_clkreq_n_pgg0_pins[] = {
-- 
2.24.1

