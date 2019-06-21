Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A624EBC8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 17:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfFUPTh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jun 2019 11:19:37 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39293 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfFUPTg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jun 2019 11:19:36 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so6971235wrt.6;
        Fri, 21 Jun 2019 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7/qd0/gU6bgFCQ7q1g1z2RQAuBfy462Uz9Y4rYqQCI=;
        b=DO62gdPGzcKEtkrNkvhjgxALMptEeQPW0wa5+d5q7hBQZOzopUHf2O3h0aVFaUmV42
         KmP1d/ahMbF1dpm8e5vvRG1BfPpyzbXSNBV+ANZLGODCJqZXGos5Q+62uNOHvRpAm7pY
         keEsf78kmZQ8xLfkRhS23XA0e03zo2homObbhCZ/yxGiQ2VeLgN9D1dSqH0EhRaTq8B0
         v/vQdi1TxGhp2PKZqyA2bgWOzvwoBgntge7ZUR7yxFOiNLa+dRCgZcASn1kbf1e1JuH4
         YwVaH2eGdREFiZUtu/xxOzwEOI/mR9IMtDZXMQQsircVP88BRywznp/SLd2vtgIioIxF
         r3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7/qd0/gU6bgFCQ7q1g1z2RQAuBfy462Uz9Y4rYqQCI=;
        b=q7fDK/sN87GWRx8pb3u6gDWuYEBme00P4effgXRInzIfrbDARpxQfpKuYiJBlDop1h
         m3tAWeVxs2F+Ho9W7HLaz0rIGrCscD68yQpBdGzzASzD1S3wBBFdKsw0EukECFyRv4hX
         pybrYqPLC3C6xCVLaYAVXknWS9ZwL+X3GG/0+R2/4r1AEaxMjMrkRcCOfOfPaKtBnY6B
         ka7Bd2yxSpSEvdKx6BEKvPhVqsX3jUMKKsNIOU6Z8W9sQY1FsUrGUtZNbH6wFVNuF9p+
         9wN2mh8ptMJacHJ0eXe6yoO0DCt2mA74T8TitprNX6pwaZfSg8xNW2eBK3mJRCQFOQRG
         7twA==
X-Gm-Message-State: APjAAAWtW43F+kSfp7Te7TFoVXJrZeY95W4EN0GltM414BhJqKjTWtTn
        i9blomuwr37/nMpCyb6Y6tg=
X-Google-Smtp-Source: APXvYqzFYDsLy1d9MTgEgcoybjNjCR5x3rwGIWBVOspMfDvp6/RNL57/TFEDKlvbSgpG+5rtUhRx6w==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr46555617wrs.215.1561130374147;
        Fri, 21 Jun 2019 08:19:34 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id x3sm3074316wrp.78.2019.06.21.08.19.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:19:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Warren <swarren@wwwdotorg.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Stefan Agner <stefan@agner.ch>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/2] pinctrl: tegra: Set specific GPIO compatible string
Date:   Fri, 21 Jun 2019 17:19:31 +0200
Message-Id: <20190621151932.20662-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Rather than reuse the nvidia,tegra30-gpio compatible string to find the
GPIO controller on Tegra30, Tegra114, Tegra124 and Tegra210, use the
most specific compatible string for each SoC generation for consistency.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra114.c | 2 +-
 drivers/pinctrl/tegra/pinctrl-tegra124.c | 2 +-
 drivers/pinctrl/tegra/pinctrl-tegra210.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
index 762151f17a88..29821c03b471 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
@@ -1831,7 +1831,7 @@ static const struct tegra_pingroup tegra114_groups[] = {
 
 static const struct tegra_pinctrl_soc_data tegra114_pinctrl = {
 	.ngpios = NUM_GPIOS,
-	.gpio_compatible = "nvidia,tegra30-gpio",
+	.gpio_compatible = "nvidia,tegra114-gpio",
 	.pins = tegra114_pins,
 	.npins = ARRAY_SIZE(tegra114_pins),
 	.functions = tegra114_functions,
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
index 930c43758c92..3616d8b97c32 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
@@ -2043,7 +2043,7 @@ static const struct tegra_pingroup tegra124_groups[] = {
 
 static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
 	.ngpios = NUM_GPIOS,
-	.gpio_compatible = "nvidia,tegra30-gpio",
+	.gpio_compatible = "nvidia,tegra124-gpio",
 	.pins = tegra124_pins,
 	.npins = ARRAY_SIZE(tegra124_pins),
 	.functions = tegra124_functions,
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index 0b56ad5c9c1c..1462023bba35 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1545,7 +1545,7 @@ static const struct tegra_pingroup tegra210_groups[] = {
 
 static const struct tegra_pinctrl_soc_data tegra210_pinctrl = {
 	.ngpios = NUM_GPIOS,
-	.gpio_compatible = "nvidia,tegra30-gpio",
+	.gpio_compatible = "nvidia,tegra210-gpio",
 	.pins = tegra210_pins,
 	.npins = ARRAY_SIZE(tegra210_pins),
 	.functions = tegra210_functions,
-- 
2.21.0

