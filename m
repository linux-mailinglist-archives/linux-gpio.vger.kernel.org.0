Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1ED1EE9C7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 19:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgFDRtm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 13:49:42 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10847 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730124AbgFDRtm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 13:49:42 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed9342a0002>; Thu, 04 Jun 2020 10:49:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 04 Jun 2020 10:49:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 04 Jun 2020 10:49:42 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jun
 2020 17:49:42 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Jun 2020 17:49:41 +0000
Received: from vidyas-desktop.nvidia.com (Not Verified[10.24.37.48]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ed934320001>; Thu, 04 Jun 2020 10:49:41 -0700
From:   Vidya Sagar <vidyas@nvidia.com>
To:     <linus.walleij@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <skomatineni@nvidia.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kthota@nvidia.com>,
        <mmaddireddy@nvidia.com>, <vidyas@nvidia.com>, <sagar.tv@gmail.com>
Subject: [PATCH] pinctrl: tegra: Use noirq suspend/resume callbacks
Date:   Thu, 4 Jun 2020 23:19:35 +0530
Message-ID: <20200604174935.26560-1-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591292970; bh=xR23JKq5v+Y6Duxl7O+LbjwVq9ym59WYyqYJNuSpFnE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=G+5QrvzdGeBeATKiBXZ27jl8h0KEUryWdnUytfQr0AkRRBf1GOFFnli4Uxb52cVJj
         x856B1WVsEKiAqEAwDm5o4c42dC9OPAYgURs0LtQk1YqXcvROzdLi4VQ3ZWHowpOV1
         +N/j3dlFQWQ00BsBWf+j/0ZL+MAkd1xzA6bftYTyMCwg93f7dkCeiuiTlY0ZgXGwS+
         cQ+WO6qNjLxgzvhWc498YczQFDu9hFyIUM13BOvVhzZ1sAdiTOdW2ItuYaMbJZDYmo
         nKWlrKY5mgGrR/0Xl8+3AluLwZGbpC49PHJKKLTov9H4mGdPClpXCnFM6eTk+QQFpe
         p9K15NeVich0w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use noirq suspend/resume callbacks as other drivers which implement
noirq suspend/resume callbacks (Ex:- PCIe) depend on pinctrl driver to
configure the signals used by their respective devices in the noirq phase.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 21661f6490d6..195cfe557511 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -731,8 +731,8 @@ static int tegra_pinctrl_resume(struct device *dev)
 }
 
 const struct dev_pm_ops tegra_pinctrl_pm = {
-	.suspend = &tegra_pinctrl_suspend,
-	.resume = &tegra_pinctrl_resume
+	.suspend_noirq = &tegra_pinctrl_suspend,
+	.resume_noirq = &tegra_pinctrl_resume
 };
 
 static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx *pmx)
-- 
2.17.1

