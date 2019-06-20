Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1E1A4D47A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 19:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfFTRDx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 13:03:53 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53696 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfFTRDx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 13:03:53 -0400
Received: by mail-wm1-f65.google.com with SMTP id x15so3787039wmj.3;
        Thu, 20 Jun 2019 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7/qd0/gU6bgFCQ7q1g1z2RQAuBfy462Uz9Y4rYqQCI=;
        b=aFxWOSA7ygq06g2I2NDfHZR0Z3patZwhIMxrXnakf1BWvuX8r0IrAEkYdRq7Myi4J4
         pGuXcEaR+8kQTC/45TmkfSQBXPvjxoHC7s7Faas83Wugt8ACLQDYdUqFPyP9GPT02EcH
         ApqtWdGTrT/XSsLlWVx9HxlsL/dZxPDWLJ+nE4sEeXYArtRsXkYDZrU6BlwL2WomTGhr
         EMUFcPCb+BO17cDYdstWcRPouRR7Gd+eUmlDHQNwIVcoff+hwO8HHdhGQeG20D/R3szg
         1xk1rWpPDZts+5IL1e8hMpii/RaTOkNL2ddo+L3V5Y49l+6svSF/n5rbtklHxGd3lqm4
         jHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7/qd0/gU6bgFCQ7q1g1z2RQAuBfy462Uz9Y4rYqQCI=;
        b=Czn2j52ZxiUnrV4+YjURPHiM94ifKOS2d+A7XF1Ej6oHS83A0DuLyLE3F/oKtDEsx1
         VSh7xQCAMkmI+LAWKsiQ1bYnnw8/iZ50ISV4IQLdamY/uCHb6o8fnd65SOK47iOEFW1i
         BBoUCt0Lp48qE7Z8E5xHYaUHwVKbjW+WLjNPnuRp3TlyllLEcKAcymUxfkc163b1xUf2
         otbIN0AjSFis3vyuaxe9wsHpAZajikhRGdEMmdUFuvDEPGuwtiz/XbhY20kikYpq6sqF
         ujWN9UmzETdQiWQaFp++JC/B4Gls4mwWqPQqqf2d1RAZHMOsPPnGEUJPRbVMTPtOlEdh
         M2ag==
X-Gm-Message-State: APjAAAUZXFSkZPwJrGzHUw+nlrV1FxKXPbaWUeFy5fSwUz7g3LVg1eF7
        csRkleaE7HIZp3ZtWFWjKDk=
X-Google-Smtp-Source: APXvYqyxOixDLvJ0ALv+Yix5RqNhGy1vLN5G4SLtPe1OrNopVAsDV7ZRz7muRJ30lNMXPR6BNJBHiw==
X-Received: by 2002:a05:600c:1150:: with SMTP id z16mr387899wmz.168.1561050231763;
        Thu, 20 Jun 2019 10:03:51 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 18sm59335wmg.43.2019.06.20.10.03.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 10:03:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Warren <swarren@wwwdotorg.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Stefan Agner <stefan@agner.ch>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: tegra: Set specific GPIO compatible string
Date:   Thu, 20 Jun 2019 19:03:49 +0200
Message-Id: <20190620170350.20224-1-thierry.reding@gmail.com>
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

