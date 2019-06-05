Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D3836293
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 19:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfFER3V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 13:29:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39738 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfFER3V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 13:29:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 72E1861156; Wed,  5 Jun 2019 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559755760;
        bh=FvHcmA2NIER1dNGRjQuJMPcZ6XkO2S25CeFWppA7VEc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fN2ivAnRZqtCSrIfRs2dCUl4Jww84QKXJUjazpvVTZRDlr2Dd1QeySJo9iVZ0B2En
         IoQfdn2Fd4VyNOeka3px6I6BO83BllUVpjk5aZEVr46/+lDTZkYj9Qxx+ZTncR49vw
         pndoe5SE8oGPsVK99ocWoTMvBTsgPHk/xi6uWK8E=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from srichara-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BDC1760C72;
        Wed,  5 Jun 2019 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559755760;
        bh=FvHcmA2NIER1dNGRjQuJMPcZ6XkO2S25CeFWppA7VEc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fN2ivAnRZqtCSrIfRs2dCUl4Jww84QKXJUjazpvVTZRDlr2Dd1QeySJo9iVZ0B2En
         IoQfdn2Fd4VyNOeka3px6I6BO83BllUVpjk5aZEVr46/+lDTZkYj9Qxx+ZTncR49vw
         pndoe5SE8oGPsVK99ocWoTMvBTsgPHk/xi6uWK8E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BDC1760C72
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     robh+dt@kernel.org, sboyd@kernel.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/6] dt-bindings: qcom: Add ipq6018 bindings
Date:   Wed,  5 Jun 2019 22:58:54 +0530
Message-Id: <1559755738-28643-3-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
References: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: speriaka <speriaka@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f6316ab..7b19028 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -36,6 +36,7 @@ description: |
   	mdm9615
   	ipq8074
   	sdm845
+	ipq6018
 
   The 'board' element must be one of the following strings:
 
@@ -45,6 +46,7 @@ description: |
   	mtp
   	sbc
   	hk01
+	cp01-c1
 
   The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
   where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

