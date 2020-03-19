Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 831E218B366
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 13:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgCSM17 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 08:27:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54875 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgCSM17 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 08:27:59 -0400
Received: by mail-wm1-f65.google.com with SMTP id f130so883174wmf.4;
        Thu, 19 Mar 2020 05:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=psYSDP21LQ7uS6UZjeG69VW8mIGx0eQb2TTgWEh5sIk=;
        b=hDSIpMs3Rdf3PQc2ab4Ll7n6eEhe00K6oa2UwpQ7UUKwX07PL1TCWtxTWcQvxGDV1u
         Oa27BKWZeOqkdToRZYu/SohKmoyirpSFcZPHp2R5L/ektSTOqTsIuDHrApE16NQLjY4A
         NH0kNmNGhas+ZsdS18GyGoblPF/O7x0yX21uZaLWzfgdZXizCW/4VytVZwWXSJFu/Kz0
         0UEhwdzs4YN/16N7ULzPYSv2PeWbH0l5DgIvffjzT7fwmrlMuG1SmrWxJqtfzj68GKEm
         k/e0u0gvBeFvzq30jXKDQaCct2n3v1hZVPrNOXck7KiOG7t1zA86x11pm5E9icN2YYMH
         em5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=psYSDP21LQ7uS6UZjeG69VW8mIGx0eQb2TTgWEh5sIk=;
        b=IGzYd4zlMsv7qpInREDlmgEe7A1vg5+kyRMmCMscEoVzs965r7OXl6h97EY14mkkbi
         F4wgb/h8yurem76ElCNs/ab4N9gIYxmQEiFYy1kb1dZtSuuT+B3gOZFeU+ZleX8XKxo+
         c8s68Wt4Beqzm+RSo9euh9PYaZybu2e6IXW8CWMnviDHEuB8JQUyIvKl8oE07nTI3Xy1
         g39h3dSnSWhSPx1Hce/8M57Y3Xu2Ux58Kflx1vVyxAkaG1USaKxW4DvnDko5QXohgKd8
         5h20XkNyr+Edy7ZWxS9CRT1BlvJUGJG38Yjkk40JFuGvkpFYz+QhwWYao9x6yfhZ6E25
         D+0A==
X-Gm-Message-State: ANhLgQ3tekeqK006jn3Y5GsEe+bN0W44cnohK+e4KwEZGo8sk/SaxwZp
        EFFCxEh4PN4WDN7VLx4v7XErixGN
X-Google-Smtp-Source: ADFU+vv0Otb1NIYVhCcEOJa1O1Ig/Ih270B/xhrfWhJ+uWBIeWQMCQqKvO0yRWi7bnf50IYqcw8BeA==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr3408545wmi.174.1584620877097;
        Thu, 19 Mar 2020 05:27:57 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id s15sm996002wrt.16.2020.03.19.05.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:27:55 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 6/9] pinctrl: tegra: Pass struct tegra_pmx for pin range check
Date:   Thu, 19 Mar 2020 13:27:34 +0100
Message-Id: <20200319122737.3063291-7-thierry.reding@gmail.com>
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

Pass the struct tegra_pmx when checking for the pin range in device
tree. This makes the call site a bit easier to read and will help keep
that readability in a subsequent patch.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index cefbbb8d1a68..c8246cc2c4fd 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -689,12 +689,12 @@ const struct dev_pm_ops tegra_pinctrl_pm = {
 	.resume = &tegra_pinctrl_resume
 };
 
-static bool gpio_node_has_range(const char *compatible)
+static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx *pmx)
 {
 	struct device_node *np;
 	bool has_prop = false;
 
-	np = of_find_compatible_node(NULL, NULL, compatible);
+	np = of_find_compatible_node(NULL, NULL, pmx->soc->gpio_compatible);
 	if (!np)
 		return has_prop;
 
@@ -794,7 +794,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 
 	tegra_pinctrl_clear_parked_bits(pmx);
 
-	if (!gpio_node_has_range(pmx->soc->gpio_compatible))
+	if (!tegra_pinctrl_gpio_node_has_range(pmx))
 		pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
 
 	platform_set_drvdata(pdev, pmx);
-- 
2.24.1

