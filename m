Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467B83D8FD2
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236577AbhG1Nz6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236292AbhG1Nz4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:55:56 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111FAC061757;
        Wed, 28 Jul 2021 06:55:55 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id az7so2246667qkb.5;
        Wed, 28 Jul 2021 06:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vXk/J4q5mPEjnLuepFqEKq93BJsZukmkkBYD3V+Z3Tk=;
        b=FMHCoImVFrprWfhN8LCCWjfLHbL6/mwjUYPLJrawre3JFTHn4wzbqn05g3hX5vP42x
         5B56hqiX7ej/9k4CjBcisgJMI+iAmJdkc4jIm/lJtVQ4TrbYWvEPy1EgtvMAKRgp1xkA
         bDlm9XRdoJ2o5Zr+RFnCxhwG+Xclsyd3mSaS8lulGeXwIrLmHCQfBqA4QRLT2kVqrPKo
         Pb2SOa30d457++7mwzRkEgo4L05L9ZMCXa8LLtAJi+LIyQUgdWneKqp9rkAmZMyOPxEp
         5qgB1rRKUpfCrUd3sYdoZg7NRE2MpkKQmOiHnhQY0eTxeVatCP0fIj/Ek7tI4xZu3vAo
         FBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vXk/J4q5mPEjnLuepFqEKq93BJsZukmkkBYD3V+Z3Tk=;
        b=kTfUJIXB6FIaYHWIEtfFAN3B1ZxuljHJX/5ilKQPRu6i7+wzGjit6bVwnowOWW9ssU
         nVgdeGiJJwXw+wLCZzUFSQcCccQNBUb21aUC0/KxvB2us8fQ+AL40yNMOZqucAUKgrM3
         RFy99WtRMWD3qP2kouTgoAIX72THbbfxFQRTvB34zTs4uK1nS8akZusx96S8EgfsSeaZ
         xRMKOhWG4L8VfpymwWUjStKRvG18upLjT5k9drgu5kfCbJm1ofgIKwtqKokAbcz5Ai2H
         h9RjIVsTA7+Rka+M2vATPsuuGkSjk7A14VPp3D+MVuXLi8Ro0BOi2AaVb7j9upp8E4hU
         ibDg==
X-Gm-Message-State: AOAM530BD1ko8gjkgoUOjqv8F3B64dZY74Me7p1GxFaNoDc/MIQtPB40
        QPRwco/AcMNWytOXzvJQcXs=
X-Google-Smtp-Source: ABdhPJz6f8hVcTQd5Bpdw7dmeHdhawQ5NdaItj5fYAXgvjQHsKkaWbMr6OGvUs/d0SCvBFkFtwwQTQ==
X-Received: by 2002:a05:620a:5f6:: with SMTP id z22mr27262899qkg.195.1627480554191;
        Wed, 28 Jul 2021 06:55:54 -0700 (PDT)
Received: from master-laptop.sparksnet ([2601:153:980:85b1:b58:2ae8:d75f:660a])
        by smtp.gmail.com with ESMTPSA id t64sm27202qkd.71.2021.07.28.06.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:55:53 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 2/9] arm64: dts: rockchip: fix rk3568 mbi-alias
Date:   Wed, 28 Jul 2021 09:55:27 -0400
Message-Id: <20210728135534.703028-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728135534.703028-1-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The mbi-alias incorrectly points to 0xfd100000 when it should point to
0xfd410000.
This fixes MSIs on rk3568.

Fixes: a3adc0b9071d ("arm64: dts: rockchip: add core dtsi for RK3568
SoC")

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 322971318d5a..f7ecdfd66f86 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -195,7 +195,7 @@ gic: interrupt-controller@fd400000 {
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-controller;
 		#interrupt-cells = <3>;
-		mbi-alias = <0x0 0xfd100000>;
+		mbi-alias = <0x0 0xfd410000>;
 		mbi-ranges = <296 24>;
 		msi-controller;
 	};
-- 
2.25.1

