Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4BB711561C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 18:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfLFRIh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 12:08:37 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39127 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfLFRIh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 12:08:37 -0500
Received: by mail-lj1-f193.google.com with SMTP id e10so8408212ljj.6
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 09:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fTEyh8XCr6qWiWO+Sm26auA9jej3JxBZE/rL5aBzRVY=;
        b=dzqIxUO7WxQk+plB0N+sxpgJHd9B7Gqjohrdy/hCB+cGg3rfhemNz+2LL8EssKd0MV
         upCGcYGQYMVNMExbGvN7Qreozlys4r8Q/t+j3QoLCQiSB1xykzvEJ9SOmOISwrA1jlvp
         4YqHPRHa85RcGLnuhvUzfCGVkvNFoPHGWUjCMMR7Bjm70zmoMVHvm9rSqeqBhF5pJYET
         uu3CXmcUMAhftU9pWR0U+AkR1SxsikEKY2Lc1bWHLNgIODEP1QqxizVF1LdyzMUtxcHJ
         gV5lyhhxeEnapF91t37e5JauaL/D9OqEQjGP+GtxsJTJJaE5TXiESw07H2QqV8NtezBg
         RuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fTEyh8XCr6qWiWO+Sm26auA9jej3JxBZE/rL5aBzRVY=;
        b=HH4vASpCzoTFkn7chsUYttn5PZGHOdwGNVHcm2o8cQgBvwy3eDJpZvzjQ9aFiMuZUs
         d1A901YvCQiL4M1Ac2VjG57tHQLnlqZGUpBFp8nMdTcEFwKYRQiIZiuA1UJEiyXz2Ac4
         DOG0KmH958pcoJ5+/bPyg8qTIV+ZSHQop5AcZT/4jK6l5xlTruJ7sbriowktVhvOBibG
         M+WVcG0ppWXWqxqAtD/8St6NY/OcHiQfr+tMkT6YiBszLFPorroLIX8PIn5ies5c+mY+
         WYY1QIhvibKbPOuj8dCsaT3EMvKIIy//715WK2MRqixDJuxmTiGt5VSwEbveqd727ARk
         j5vQ==
X-Gm-Message-State: APjAAAWxFPV5Cin1rPeHcvcXqr5enAn/lDl4/Sbyyy8eoKGzqtXROHyX
        2An3tKomFcYpPS4ez7I4YuWx/K8e3EU=
X-Google-Smtp-Source: APXvYqx2YUEFT3CYqRkqrCF50CxYbiVYSIL4MAtnnjeQmuc33zVtu9572g9p4vEVQvm8MMy9E6jTOQ==
X-Received: by 2002:a05:651c:1110:: with SMTP id d16mr9527832ljo.86.1575652115109;
        Fri, 06 Dec 2019 09:08:35 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id z9sm6905283ljm.40.2019.12.06.09.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 09:08:34 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH 6/9] mmc: sdhci-esdhc-imx: Convert to pinctrl_select_default_state()
Date:   Fri,  6 Dec 2019 18:08:18 +0100
Message-Id: <20191206170821.29711-7-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206170821.29711-1-ulf.hansson@linaro.org>
References: <20191206170821.29711-1-ulf.hansson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Let's drop the boilerplate code for managing the default pinctrl state and
convert into using the new pinctrl_select_default_state().

Cc: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 1c988d6a2433..43628c9c05ac 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -224,7 +224,6 @@ static struct esdhc_soc_data usdhc_imx8qxp_data = {
 struct pltfm_imx_data {
 	u32 scratchpad;
 	struct pinctrl *pinctrl;
-	struct pinctrl_state *pins_default;
 	struct pinctrl_state *pins_100mhz;
 	struct pinctrl_state *pins_200mhz;
 	const struct esdhc_soc_data *socdata;
@@ -951,7 +950,6 @@ static int esdhc_change_pinstate(struct sdhci_host *host,
 	dev_dbg(mmc_dev(host->mmc), "change pinctrl state for uhs %d\n", uhs);
 
 	if (IS_ERR(imx_data->pinctrl) ||
-		IS_ERR(imx_data->pins_default) ||
 		IS_ERR(imx_data->pins_100mhz) ||
 		IS_ERR(imx_data->pins_200mhz))
 		return -EINVAL;
@@ -968,7 +966,7 @@ static int esdhc_change_pinstate(struct sdhci_host *host,
 		break;
 	default:
 		/* back to default state for other legacy timing */
-		pinctrl = imx_data->pins_default;
+		return pinctrl_select_default_state(mmc_dev(host->mmc));
 	}
 
 	return pinctrl_select_state(imx_data->pinctrl, pinctrl);
@@ -1338,7 +1336,7 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
 
 	mmc_of_parse_voltage(np, &host->ocr_mask);
 
-	if (esdhc_is_usdhc(imx_data) && !IS_ERR(imx_data->pins_default)) {
+	if (esdhc_is_usdhc(imx_data)) {
 		imx_data->pins_100mhz = pinctrl_lookup_state(imx_data->pinctrl,
 						ESDHC_PINCTRL_STATE_100MHZ);
 		imx_data->pins_200mhz = pinctrl_lookup_state(imx_data->pinctrl,
@@ -1492,11 +1490,6 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
 		goto disable_ahb_clk;
 	}
 
-	imx_data->pins_default = pinctrl_lookup_state(imx_data->pinctrl,
-						PINCTRL_STATE_DEFAULT);
-	if (IS_ERR(imx_data->pins_default))
-		dev_warn(mmc_dev(host->mmc), "could not get default state\n");
-
 	if (esdhc_is_usdhc(imx_data)) {
 		host->quirks2 |= SDHCI_QUIRK2_PRESET_VALUE_BROKEN;
 		host->mmc->caps |= MMC_CAP_1_8V_DDR | MMC_CAP_3_3V_DDR;
-- 
2.17.1

