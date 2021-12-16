Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86A3477893
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 17:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239542AbhLPQWZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 11:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239599AbhLPQWW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 11:22:22 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67038C061748
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 08:22:19 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 207so39278266ljf.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 08:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JUJgiOCeEkvWRBfsS4oHMEMSHGIv4GiMwDTH+LmBGxo=;
        b=IoU2buhjcjWp2q7dTYztQ+qpX9khq7w3X58Xw/LgcxE4PGjKWNNhJYajACUrAVTjAV
         0pAehz9KDe0vabDtPwrPpT5+5cx+ekArogFvQRRudrAEWggcwLdZ9jDNqkfX2O7EeYVj
         VXLvZmB/auujRtxBKEHPiF6EEMSOYd/nEJJMPgB6kgGx2Q+TTohdHLGqTj/EK8/ACs5B
         qqm/a36vKUR5A3lsXy1FMwKyEZ0YhoCgw3aiidLX52s9PVy2Uy8rleHC+KwfQqeTYfc2
         30yXUfz4MzD+gAr1XW3ghh9tEAPdLXsn7sJR5hhgn4lJYW4+eeg5AWWBs+W9MPVFrBT1
         mCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JUJgiOCeEkvWRBfsS4oHMEMSHGIv4GiMwDTH+LmBGxo=;
        b=QbxmYIaFC25ikzVjOR6z0ubf2K6oEXBP772FjbPHUfpDzNKDfhvEceWxF/sS31h42y
         c27jUEyuwM48Qhbrsy3phvME1EJRf9EytWRHqTgphmoBPVQbtsktV/TbmE4u+3Px9el5
         gVwMGssdGoRfrtFv982XiHeRJ7e+QQvqZluBg/h4IjnfnZi7NlgdIoxeA3Xgk5xW6Iah
         AUvvQ/n7sA3vMTpKxzPqt1VajNqsJee6lwkxDo7zPdcNzPnGQFrUE6d9l3GsIbHzGCjW
         EHZyICe70S+yhKTakuWYgtfst2j8K7F8guW6p0SpJy4gQv+3xDLW7j7PUqpnyjWas/xF
         EiAg==
X-Gm-Message-State: AOAM533zV4zsWVAZq/by/XEdZ5Wd0YN6J8bUnWNYh+656tbdEHd5iGCJ
        QxKDfFn4G49kEk770NooAOc=
X-Google-Smtp-Source: ABdhPJyrGXI7ioAaKnKKAK2OC5i6FS7Rxk9DNehos53wIcXBnCY1INj+5OTISTqtn/SLfMS9qHQipg==
X-Received: by 2002:a2e:bd0e:: with SMTP id n14mr15323654ljq.159.1639671737725;
        Thu, 16 Dec 2021 08:22:17 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id s13sm938623lfg.126.2021.12.16.08.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:22:17 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 4/4] pinctrl: add one more "const" for generic function groups
Date:   Thu, 16 Dec 2021 17:22:06 +0100
Message-Id: <20211216162206.8027-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216162206.8027-1-zajec5@gmail.com>
References: <20211216162206.8027-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Generic code doesn't modify those strings and .get_function_groups
callback has that extra "const" as well. This allows more flexibility in
GENERIC_PINMUX_FUNCTIONS users.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/pinctrl/pinmux.c | 2 +-
 drivers/pinctrl/pinmux.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 6cdbd9ccf2f0..f94d43b082d9 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -875,7 +875,7 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
  */
 int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char *name,
-				const char **groups,
+				const char * const *groups,
 				const unsigned int num_groups,
 				void *data)
 {
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 78c3a31be882..72fcf03eaa43 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -129,7 +129,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
  */
 struct function_desc {
 	const char *name;
-	const char **group_names;
+	const char * const *group_names;
 	int num_group_names;
 	void *data;
 };
@@ -150,7 +150,7 @@ struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
 
 int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char *name,
-				const char **groups,
+				const char * const *groups,
 				unsigned const num_groups,
 				void *data);
 
-- 
2.31.1

