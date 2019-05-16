Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 478E62066C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 14:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfEPLxn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 07:53:43 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5482 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfEPLxm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 07:53:42 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd4f1c0000>; Thu, 16 May 2019 04:53:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 May 2019 04:53:41 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 May 2019 04:53:41 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 11:53:41 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 11:53:41 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 May 2019 11:53:41 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdd4f410000>; Thu, 16 May 2019 04:53:40 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <pdeschrijver@nvidia.com>, <josephl@nvidia.com>,
        <smangipudi@nvidia.com>, <ldewangan@nvidia.com>,
        <vidyas@nvidia.com>, Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH V3 4/4] soc/tegra: select pinctrl for Tegra194
Date:   Thu, 16 May 2019 17:23:14 +0530
Message-ID: <1558007594-14824-4-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558007580; bh=vZPeMulyG2M0BcsrWsBCmVEo9iVP+aStJoSJsHmSI2c=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=PNbWyAEeisbyjVMCYtuazXdblAx7XORpWgWubPZoQO1Wx+tas05as+i1uY45GAdby
         EJXdyVZKh4kgzbRzkwN5lhSgSgLV0FI8vENB3d7M+2pBHNzqSWJcICzQevPCkEHvXp
         pVPZvUSpSFBm6oI7HXKXezFhAZofowe4yvDHEEEH5dHp6UEld90/ChunLn6oQqkqPl
         32hf1FgdyBYUeOzZ+7BG94NJdHm2SGwsOEh/H8Kt431QrcddcHYjew4U6HG3SCFfYm
         ZeOUIpW/jBt1fn3WZsO28MEFzP54xkVxcBDPh21Y8a664rtNfJoZSpJb617glwxRd6
         0Bkejr8q/2KKg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Select PINCTRL_TEGRA194 by default for Tegra194 SOC needed
for dynamically controlling PCIe pins

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index a0b0344..6f0df55 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -108,6 +108,7 @@ config ARCH_TEGRA_186_SOC
 config ARCH_TEGRA_194_SOC
 	bool "NVIDIA Tegra194 SoC"
 	select MAILBOX
+	select PINCTRL_TEGRA194
 	select TEGRA_BPMP
 	select TEGRA_HSP_MBOX
 	select TEGRA_IVC
-- 
2.7.4

