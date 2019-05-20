Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAA022EDE
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 10:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfETIb2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 04:31:28 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35794 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729882AbfETIb2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 04:31:28 -0400
Received: by mail-pg1-f194.google.com with SMTP id t1so5022353pgc.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OWo8Uulihvaq9zy3I0w67p1cVDmaIdDDpV04dYtjBE8=;
        b=KyWXseoPwNWVph/2LYqJ7XtWB++4XFV14lGAlh0XyfkDC+WFnwSAVrpHZ7LnWmVHNE
         /+OJJm/I2OI/6rwUZL4YNI3DV3sZnUqWe4nbib6CR3PGfaFrxtjJA+ARiJLuKXPl3Phx
         +IV8YI7LAA1WxsrFW7o8lOnwnfdUpYfktee+Xfhf8BFt9z9OXSsOg2OTQufei6iVkOk5
         n0Hf31CIwq3xCOKdcff7Aa3ZMywrRrX0OuIoYetcoEBGCPpFNCPswN+wekoiwwKAsxbp
         g5VELbnAmdPMNGrjkCRCj4rg6G2ebRtzIxPjYaslK+2OBBXeC/3kod5v1EtN43HxCMJ9
         oLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OWo8Uulihvaq9zy3I0w67p1cVDmaIdDDpV04dYtjBE8=;
        b=GmyYaA4G5lTA3vM6Kgcuhl2ovNFkE8C1F2WdpCSnz0cs4ko7gshFCeSh2m4sw1vL6f
         iZhYXsbADqpGmcjR841C25Ll7UmxHcBmcuK6d4vDvRoE55IRcBHiq4tvazKLLKk5zKgq
         08JODioCmocBmWcbYRLdLn3gVlOaQbwA1FKPaFyhBsI4/e4XIDK7RpEoIMEe1rvcfOkm
         NUEKt8lW9h2WVMzyKLRpUkvP4eafC3Y5tc2aUaw9qzoI0HgSFqc+xmD9A2xJ/5y6JY4p
         2AXDDmyck9Ijav5e8dhHN2aCk4rfHb5MkPaN1Fr6jLmLkP1XSR+ttjVZEI7tT1bOBrpb
         ZcwA==
X-Gm-Message-State: APjAAAVUT5G7YmqNdl2AKVrlBUMFYLtFrI63p6vsgttkBdaUQ5VHA+4d
        Uum8EK9KmLPvO+nrOcZ+hVTb
X-Google-Smtp-Source: APXvYqwba4qh7qxpJyc9Shot/nunx5rmufZCNsCBbq7hfOm3Lnju8hTbLBzaiGhYCaJd7E7ncz5dew==
X-Received: by 2002:a63:e406:: with SMTP id a6mr75142659pgi.132.1558341087636;
        Mon, 20 May 2019 01:31:27 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7203:2717:7d22:7fdb:b76e:242c])
        by smtp.gmail.com with ESMTPSA id s72sm24068220pgc.65.2019.05.20.01.31.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 01:31:27 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        linux-gpio@vger.kernel.org, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/5] arm64: dts: bitmain: Modify pin controller memory map
Date:   Mon, 20 May 2019 14:00:58 +0530
Message-Id: <20190520083101.10229-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Earlier, the PWM registers were included as part of the pinctrl memory
map, but this turned to be useless as the muxing is being handled by the
SoC pin controller itself. Hence, this commit removes the pwm register
mapping from the pinctrl node to make it more clean.

Fixes: af2ff87de413 ("arm64: dts: bitmain: Add pinctrl support for BM1880 SoC")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index ee7e6abcc813..b2497a090402 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -88,9 +88,9 @@
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x50010000 0x1000>;
 
-			pinctrl: pinctrl@50 {
+			pinctrl: pinctrl@400 {
 				compatible = "bitmain,bm1880-pinctrl";
-				reg = <0x50 0x4B0>;
+				reg = <0x400 0x120>;
 			};
 
 			rst: reset-controller@c00 {
-- 
2.17.1

