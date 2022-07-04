Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB58565C85
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 18:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbiGDQ6Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 12:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiGDQ6P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 12:58:15 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F43565D0;
        Mon,  4 Jul 2022 09:58:15 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z41so12439379ede.1;
        Mon, 04 Jul 2022 09:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y1Tnm4HYwP4g2qoe68Ccl1TiZV75XEWzqvFi/zo/iCs=;
        b=nySMU2+pYxMmyAptDPsuRryWw3gu8egglrb8FcRsonFAnq1Led8OLiPxnQBtyIruhw
         EGv57G83wW4RQKnU36bva5k4dkMLir1BeMeGHtRq6/vRlCZD9cuQiOuxD/U7Vf6212WR
         z0po3tRGh6FrfqZtdErmYYEVG+gSI9fHrwCXRypZnLVs5mJU99fqCPm9gM1DKfKNJboD
         frSGmLkLDN+YxIz0Xqo0qu/cs2wnCHCvFNKCj0tFLeilrctTLtGxXQRcqhr8Xgrk3NwC
         qpt7IPeWje3nzLdFTASw/iVAphZgpUSLSQnTousnw9BIpPpozn7azIphtrZsUiLFnmfI
         6/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y1Tnm4HYwP4g2qoe68Ccl1TiZV75XEWzqvFi/zo/iCs=;
        b=oQamCSRp1gQE2V6f0cTTjipIzlMcXmyG83qMoeBE3HiOojXh29KyIwnhhK6q8s1LF9
         C5eRVGz2obb1A5U7wk3jAI6YDRVkbpwQvJ78YZ8iYETh1TcXXEJ4AwMOd/EZQepswwtl
         my+Sb9Jaim3+qwaD/DXH8CfWVi1HgMKqcSOAL8LlF1+aIj75DjEmwX9w2kTB8viRAF3O
         vBGBOeJJ/pvCzrT+VK+RmXZy7XOKXASsNfziTjI7YTKmf1puqhspMVZP+sMJVxTwM+rx
         3mbGdezkpJo9LQOiAD2Kld/2prlp4P2p92J+0i+9ggV4Yr1bm/mPUmU/NwjU7P8d/rNC
         1UQw==
X-Gm-Message-State: AJIora/+V51EhlkLrMO2D/PfCeLf9x1yvoEHmV/PpgbhkZK4DRgeGz6w
        g7p1638O1GRxFWH3z3uv3dc=
X-Google-Smtp-Source: AGRyM1sDwbNNbrgOHOSScoSwoS+QCve300hCk+9YwiEfvGbhKKtWtz22L1no1H9RJqJUW/zxrBsMOA==
X-Received: by 2002:a05:6402:11d2:b0:437:a02:5c79 with SMTP id j18-20020a05640211d200b004370a025c79mr39843243edw.400.1656953893690;
        Mon, 04 Jul 2022 09:58:13 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id eg37-20020a05640228a500b0043a587eb95dsm2294960edb.5.2022.07.04.09.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 09:58:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: tegra: Separate AON pinmux from main pinmux on Tegra194
Date:   Mon,  4 Jul 2022 18:58:02 +0200
Message-Id: <20220704165802.129717-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704165802.129717-1-thierry.reding@gmail.com>
References: <20220704165802.129717-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The registers for the AON pinmux reside in a partition different from
the registers for the main pinmux. Instead of treating them as one and
the same device, split them up so that they are each their own devices.
Also add gpio-ranges properties to the corresponding GPIO controllers
such that the pinmux and GPIO controllers can be paired up properly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 78277b538002..2638e480e7da 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -86,6 +86,7 @@ gpio: gpio@2200000 {
 			interrupt-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pinmux 0 0 169>;
 		};
 
 		cbb-noc@2300000 {
@@ -626,9 +627,7 @@ tegra_asrc: asrc@2910000 {
 
 		pinmux: pinmux@2430000 {
 			compatible = "nvidia,tegra194-pinmux";
-			reg = <0x2430000 0x17000>,
-			      <0xc300000 0x4000>;
-
+			reg = <0x2430000 0x17000>;
 			status = "okay";
 
 			pex_rst_c5_out_state: pex_rst_c5_out {
@@ -1638,6 +1637,14 @@ gpio_aon: gpio@c2f0000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			gpio-range = <&pinmux_aon 0 0 30>;
+		};
+
+		pinmux_aon: pinmux@c300000 {
+			compatible = "nvidia,tegra194-pinmux-aon";
+			reg = <0xc300000 0x4000>;
+
+			status = "okay";
 		};
 
 		pwm4: pwm@c340000 {
-- 
2.36.1

