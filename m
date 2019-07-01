Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5F565B788
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2019 11:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbfGAJNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jul 2019 05:13:21 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44184 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728391AbfGAJNT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jul 2019 05:13:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id e3so3369385wrs.11
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2019 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f/zYZrOrlfrcoTvw7mvtGdakqdn7f0Uy5ZLJztZMxJc=;
        b=jRzfrZu54oaHH9lzNLfyY2wrp+Pq4BxLB4iB1oIRVg2Ay5S0iUzODpbgfVQflutwZV
         sqiN/g0BukVBNkx/N10FPPLHfpgw1BxgaJkJCKbp+aiW+M+FQV1035udymDkdHQJBIYo
         jCzg4WWh9xAuL7MT9BD+Ep/OiajKsKphOX+6OouSNa0tlXellYT82BaB912w8mZQ2yVL
         ZfqRIG1FUamlLELYDb80kOC+J37SDrv6iF6MxRywtYDBKdohz+rQeOmBE0ADwpkuquau
         lj6OLV+SwVbBNOtBGifq0R/fn/CAMBFAuV2LZY7Yvk5xKQrJhRRu2h2ZSwcnaxnN1Wt7
         79Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f/zYZrOrlfrcoTvw7mvtGdakqdn7f0Uy5ZLJztZMxJc=;
        b=aMerKuXkb7fdE3CGh8JzGRtnUCMfqTk69vXmIo+2+sZcPOwWyL2+63HOfzZ5Ye5CtW
         2O6w4NU+78fY+ePuet0e6qPXW4KYyPVPIA14S0oZXIZ/FlxEhBwQ1OuRK6QFgOML4v76
         RZJth15NaaQM7ppIGgagOiPk/pDhVhEz36+uElV6xO1mEpRlSZJWzxMMG/7gIYmAbMOx
         Al/+LA9m6szFnOiGTpcjbMJKWABlGNsN8OvW56SEz3oUOTV0WtRwbQqMPJDVx4jEBRBo
         N71vMnq9pvasbZHETsPHpqGdDCDqW1X3NP7tKjmf3a1j1PuTtkLEuHgKY26Jh1/4Md0g
         E96w==
X-Gm-Message-State: APjAAAWzwaCVYWGkJexeS6VFiNYG0376pQC4oeTC9QzOyBbV3A9GMrb2
        LhsHlzgT/bQtJxACxdp8Ytfuzg==
X-Google-Smtp-Source: APXvYqyT0fpf4ZW2lN6qRHzI9//R+u71j9/hU2ekwUjUyuAJAi3E756tCjzYWkYWKgweFITAkrBOag==
X-Received: by 2002:adf:f706:: with SMTP id r6mr9088993wrp.23.1561972396951;
        Mon, 01 Jul 2019 02:13:16 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:16 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 06/14] soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk
Date:   Mon,  1 Jul 2019 11:12:50 +0200
Message-Id: <20190701091258.3870-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the G12B second CPU cluster CPU and SYS_PLL measure IDs.

These IDs returns 0Hz on G12A.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index c470e24f1dfa..f09b404b39d3 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -324,6 +324,8 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
 	CLK_MSR_ID(84, "co_tx"),
 	CLK_MSR_ID(89, "hdmi_todig"),
 	CLK_MSR_ID(90, "hdmitx_sys"),
+	CLK_MSR_ID(91, "sys_cpub_div16"),
+	CLK_MSR_ID(92, "sys_pll_cpub_div16"),
 	CLK_MSR_ID(94, "eth_phy_rx"),
 	CLK_MSR_ID(95, "eth_phy_pll"),
 	CLK_MSR_ID(96, "vpu_b"),
-- 
2.21.0

