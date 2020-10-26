Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61AAC2986EB
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 07:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1770489AbgJZGjN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 02:39:13 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16774 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1770486AbgJZGjM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 02:39:12 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f966efb0000>; Sun, 25 Oct 2020 23:38:51 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct
 2020 06:39:09 +0000
Received: from vidyas-desktop.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Mon, 26 Oct 2020 06:39:05 +0000
From:   Vidya Sagar <vidyas@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <jckuo@nvidia.com>,
        <kyarlagadda@nvidia.com>, <lorenzo.pieralisi@arm.com>,
        <amurray@thegoodpenguin.co.uk>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kthota@nvidia.com>, <mmaddireddy@nvidia.com>, <vidyas@nvidia.com>,
        <sagar.tv@gmail.com>
Subject: [PATCH 1/2] dt-bindings: Fix entry name for I/O High Voltage property
Date:   Mon, 26 Oct 2020 12:09:01 +0530
Message-ID: <20201026063902.14744-1-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603694331; bh=HgUBHWCd2Nt7H938VkNrABLwzGofvKL5fDnjmwSsXZ4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=hXGW2UXAjYe+nif59UbIhnSrorYC7Ft/vbP79id79sDHO6HD5pdNR2fV1Z3aeIX8k
         CVb/Ty7TspQS5Tf94O3jjht2CFVDhQ9iZBJzE68ts3IT6M2K218kBvHUXGh+Nw+DaH
         aE7BzgAyOMqrdiCl8yDEOZWD0vg9W8KXWtYYTrB+VAKT9jTDAz+siXXLXrn88hAfmx
         lhthG4oqbvxDXl8QTTKNOi2q4yo03kH9vOVy7+ZY4fGTb4zqDoX1IZKe53tYW+1n2s
         H+FneRCaWmiwycwVNqRA4sRoOKdabbjuIYh2cIK8tcEpkK0S/h26zP6iIfv553VMOt
         6N3L5c8nuTSOA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Correct the name of the I/O High Voltage Property from
'nvidia,io-high-voltage' to 'nvidia,io-hv'.

Fixes: 2585a584f844 ("pinctrl: Add Tegra194 pinctrl DT bindings")
Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 .../devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
index 8763f448c376..90d38f710635 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
@@ -99,7 +99,7 @@ Example:
 					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
 					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
 					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-					nvidia,io-high-voltage = <TEGRA_PIN_ENABLE>;
+					nvidia,io-hv = <TEGRA_PIN_ENABLE>;
 					nvidia,tristate = <TEGRA_PIN_DISABLE>;
 					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				};
-- 
2.17.1

