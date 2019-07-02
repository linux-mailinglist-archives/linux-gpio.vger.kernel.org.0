Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49E365CDF3
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2019 12:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfGBKyP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 06:54:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:60938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbfGBKyP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Jul 2019 06:54:15 -0400
Received: from vkoul-mobl.Dlink (unknown [49.207.58.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 995A22146F;
        Tue,  2 Jul 2019 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562064854;
        bh=QahxEE1e5xL+s+T85GAfZ3GxoPDH1XXpx6ngsr75blY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZBJOYEI8jCnmaB52ByLJ+hQAzDtFVMxAvynvuUdjPJwgUyw/wLPGHWdy2I/T3g1A8
         nUuZycPpW5Djy0e83FxiA4FzcNvgJWC3okX0+kQNFmxD5lNJKWgxoUWG9lAWhqXckz
         l/lUeYKMTRoAIUuHWfFU+L+pOKOIvEyPRyW3hg5M=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: qcom: Document missing gpio nodes
Date:   Tue,  2 Jul 2019 16:20:43 +0530
Message-Id: <20190702105045.27646-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702105045.27646-1-vkoul@kernel.org>
References: <20190702105045.27646-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bindings for msm8998-pinctrl was missing gpio-ranges and
gpio-reserved-ranges, so document them as well

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../bindings/pinctrl/qcom,msm8998-pinctrl.txt          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
index e70c79bbbc5b..280af41eb86e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
@@ -40,6 +40,14 @@ MSM8998 platform.
 	Definition: must be 2. Specifying the pin number and flags, as defined
 		    in <dt-bindings/gpio/gpio.h>
 
+- gpio-ranges:
+	Usage: required
+	Definition:  see ../gpio/gpio.txt
+
+- gpio-reserved-ranges:
+	Usage: optional
+	Definition: see ../gpio/gpio.txt
+
 Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
 a general description of GPIO and interrupt bindings.
 
@@ -175,6 +183,8 @@ Example:
 		interrupts = <0 208 0>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-ranges = <&tlmm 0 0 175>;
+		gpio-reserved-ranges = <0 4>, <81 4>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
-- 
2.20.1

