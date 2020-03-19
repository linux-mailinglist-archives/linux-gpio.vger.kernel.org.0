Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0CF418B362
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 13:27:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgCSM1z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 08:27:55 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35361 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgCSM1y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 08:27:54 -0400
Received: by mail-wm1-f65.google.com with SMTP id m3so2029274wmi.0;
        Thu, 19 Mar 2020 05:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k9hNKacD1H5/yocl3skOmGDhqwJe36pPJy+1lwHJO9U=;
        b=XtNr6fBTMXeG4q97wipfzBGXm9yOQ2havtGBlYy29iQADsuc1g2v4ZAdw4QceXEYOA
         wDQ4MHLjWLdsnFKmLto410GmNlZzJfoz8iGjelIlFeyzVvpsGMG/utswHio3e91RtmLj
         wWSP/eY/rWIgUP70pnM4RnsxCKQSn1B5ubKnPFiRWllkhFcPgUfkeXVljE15skRYho6D
         AfaWYPz1uO5Rq2EBgtfc6Xp048pMq0h1pZGkipRo6ir8LzfeWtVg6lUskhiKz1ghGklo
         FN1pT3RsLGvW30wELB+MJ1tUC9fvI+64yy/XRkkzGmQxyTpS19AF+p+781OXw92kPzw2
         5BGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k9hNKacD1H5/yocl3skOmGDhqwJe36pPJy+1lwHJO9U=;
        b=e5F8/3SwYv5+wGECwYa4/cyAjPM/gXqTtsKMhqVsY/cAb7zHg0vJywa93tUGzAIpZM
         ftVYRJoLbxyUn3Y00FKwEBGLz2NXjCHLULzMQYCGIDCf7V2FXGeMDRajZMm8JjdqjGP6
         rgOEgEPluWcrMIirJv38VlwIlDJB6e0UN2m2FbmuoqD2Px7Ask9oSo2BWqU4rrNnD2mc
         4fctQDMNzIT4GL+K6zDcGjwxGDd970OFInIzGRtfop7sZ7VliAfLkIyfHywQy35lMYm4
         S7fLlh1RuJttZMx01yqZpkhDCo8/TVQTgJyD0qyzc8qab4xPhb1hwZlXrvSSQM4EFOy2
         I/xQ==
X-Gm-Message-State: ANhLgQ0xGfVACvllfKGj7I4j/JKe9V+3OohKjdIeSZs9akqMVCBcHdQP
        pKxlQYE0G0nW6s0ISgkkhdG620dU
X-Google-Smtp-Source: ADFU+vtl/stKQMQCqRcqOTqA0s72VbgF+LTFBo0AdDnUKy3IhLtkyR1PLplhtfi/lt5N/q23HPmFdA==
X-Received: by 2002:a1c:208a:: with SMTP id g132mr3413867wmg.44.1584620872860;
        Thu, 19 Mar 2020 05:27:52 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id i8sm3160576wrw.55.2020.03.19.05.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:27:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 4/9] pinctrl: tegra: Fix whitespace issues for improved readability
Date:   Thu, 19 Mar 2020 13:27:32 +0100
Message-Id: <20200319122737.3063291-5-thierry.reding@gmail.com>
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

Fix a few whitespace inconsistencies to make the code easier to read.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 33 ++++++++++++------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
index daf44cf240c9..d4e84530158c 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -59,6 +59,7 @@ enum tegra_mux_dt {
 	{					\
 		.name = #lid,			\
 	}
+
 static struct tegra_function tegra194_functions[] = {
 	TEGRA_PIN_FUNCTION(rsvd0),
 	TEGRA_PIN_FUNCTION(rsvd1),
@@ -70,7 +71,7 @@ static struct tegra_function tegra194_functions[] = {
 #define DRV_PINGROUP_ENTRY_Y(r, drvdn_b, drvdn_w, drvup_b,	\
 			     drvup_w, slwr_b, slwr_w, slwf_b,	\
 			     slwf_w, bank)			\
-		.drv_reg = ((r)),			\
+		.drv_reg = ((r)),				\
 		.drv_bank = bank,				\
 		.drvdn_bit = drvdn_b,				\
 		.drvdn_width = drvdn_w,				\
@@ -89,7 +90,7 @@ static struct tegra_function tegra194_functions[] = {
 		.hsm_bit = -1,					\
 		.mux_bank = bank,				\
 		.mux_bit = 0,					\
-		.pupd_reg = ((r)),		\
+		.pupd_reg = ((r)),				\
 		.pupd_bank = bank,				\
 		.pupd_bit = 2,					\
 		.tri_reg = ((r)),				\
@@ -109,20 +110,20 @@ static struct tegra_function tegra194_functions[] = {
 
 #define PINGROUP(pg_name, f0, f1, f2, f3, r, bank, pupd, e_lpbk,	\
 		 e_input, e_lpdr, e_od, schmitt_b, drvtype, io_rail)	\
-	{							\
-		.name = #pg_name,				\
-		.pins = pg_name##_pins,				\
-		.npins = ARRAY_SIZE(pg_name##_pins),		\
-			.funcs = {				\
-				TEGRA_MUX_##f0,			\
-				TEGRA_MUX_##f1,			\
-				TEGRA_MUX_##f2,			\
-				TEGRA_MUX_##f3,			\
-			},					\
-		PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk,	\
-				     e_input, e_od,		\
-				     schmitt_b, drvtype),	\
-		drive_##pg_name,				\
+	{								\
+		.name = #pg_name,					\
+		.pins = pg_name##_pins,					\
+		.npins = ARRAY_SIZE(pg_name##_pins),			\
+			.funcs = {					\
+				TEGRA_MUX_##f0,				\
+				TEGRA_MUX_##f1,				\
+				TEGRA_MUX_##f2,				\
+				TEGRA_MUX_##f3,				\
+			},						\
+		PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk,		\
+				     e_input, e_od,			\
+				     schmitt_b, drvtype),		\
+		drive_##pg_name,					\
 	}
 
 static const struct tegra_pingroup tegra194_groups[] = {
-- 
2.24.1

