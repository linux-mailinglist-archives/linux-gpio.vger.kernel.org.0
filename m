Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 541FE18B368
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 13:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCSM2B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 08:28:01 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34002 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCSM2B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 08:28:01 -0400
Received: by mail-wm1-f66.google.com with SMTP id 26so442802wmk.1;
        Thu, 19 Mar 2020 05:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QashyjqboWz8J76L55AnJ5EBJLCBBnyBfXdCGEoc+os=;
        b=o1/hloQfvGSl37W4ZNhn89Py/Du6j+4TXvcraruh7gFvsvBOmTjH3pZv39kmrX1KmX
         +eYGsRShE6jKkxX8o6bmSYOs/OvNAWvt5e84esmjwTan97i7w9Tc1fo+mPfZOTvT2u57
         8n7tXhWCHbAl+VQpPpAGGsimVzjG1LLynn+gD2JtgsDFqW3Hd1CDnT5XWfmqZMc5edid
         4d5xgfgnjC//kL93yzFekzpQ5pW8Ad8/VMUEu8/gTRYv9qpKzmbZTqzvKBv+LvxkgEeT
         mLcUkGGEKNsOlmdOtZCnViqLJ4d5tErI5olKlIK/5+gRJF+AjeukRqmXs5agIJnKv3XT
         52ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QashyjqboWz8J76L55AnJ5EBJLCBBnyBfXdCGEoc+os=;
        b=BqMJVxm3oHEdtHn3D4RJAK/NYLaqSVU4o/bfmSPG1sYflotmzmo1UMlHorbMBv5MsT
         6Kupwzbd5+MPq/DYRcMz3m+Q/eQp/gy6+2+kaU9qWH4FOlzgMz+z/88g53TzHwvBWq6E
         yUw8eAymgtxTOe1dNnZVCnKsB5omqYlVYvWrsQycPaisGmd0RA+wYQwtt9I9NpksI39X
         1bMt/xwdt2kKkCmHddIu5CxkN0lwkmBprN/xMf1FoSSPADrERIC3MxkLfNZ0hVdo6PEm
         miArKphHpMc9aqPk64op8wI3QEtAqYSfBOxYjTg+Hr+1PRLDeXFEyKNS2ukKRgQT7YBU
         nQiQ==
X-Gm-Message-State: ANhLgQ1MUIpF7bvVOTZ546bqPgURPiLxhTt96kR6C9D3vDYVXb2G3yEs
        wkz9yH5YBC99Xf3OcJapkXI=
X-Google-Smtp-Source: ADFU+vsvbn7yVWTEh646qp3pbVZjpD4FdiXuQl7NWmueE7VtaEDfQ+va/8c7u52XAeKawo3FLLqWGw==
X-Received: by 2002:a1c:6885:: with SMTP id d127mr3546279wmc.33.1584620879148;
        Thu, 19 Mar 2020 05:27:59 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id l18sm3287288wrr.17.2020.03.19.05.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:27:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 7/9] pinctrl: tegra: Do not add default pin range on Tegra194
Date:   Thu, 19 Mar 2020 13:27:35 +0100
Message-Id: <20200319122737.3063291-8-thierry.reding@gmail.com>
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

On Tegra194, almost all of the pin control programming happens in early
boot firmware, so there is no use in having a pin range defined for all
the pins.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 2 +-
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index c8246cc2c4fd..65511bf27d34 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -794,7 +794,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 
 	tegra_pinctrl_clear_parked_bits(pmx);
 
-	if (!tegra_pinctrl_gpio_node_has_range(pmx))
+	if (pmx->soc->ngpios > 0 && !tegra_pinctrl_gpio_node_has_range(pmx))
 		pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
 
 	platform_set_drvdata(pdev, pmx);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
index d4e84530158c..61fc7e680788 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -134,7 +134,6 @@ static const struct tegra_pingroup tegra194_groups[] = {
 };
 
 static const struct tegra_pinctrl_soc_data tegra194_pinctrl = {
-	.ngpios = TEGRA_PIN_NUM_GPIOS,
 	.pins = tegra194_pins,
 	.npins = ARRAY_SIZE(tegra194_pins),
 	.functions = tegra194_functions,
-- 
2.24.1

