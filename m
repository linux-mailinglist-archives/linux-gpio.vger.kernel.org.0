Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0293D8FE5
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236830AbhG1N4F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236694AbhG1N4A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:56:00 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EB6C0613C1;
        Wed, 28 Jul 2021 06:55:58 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d2so1371567qto.6;
        Wed, 28 Jul 2021 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mtzKWmPijMY1PkSSMWpn9rhjG/EXg2m1sprhHLtLltY=;
        b=Ds9SlqnSQ3e3fcKqaRkJ0UBsYCEXFeCsoK/gP94FjQfyOLD9OI2NvBjMSlQViW8OKf
         VxSZ5e25UdFaWFo8m8cczHQ0+GST0yAPONjulMZBc1qaq6yKyarmQSvmVrAHK9hfTVMs
         xkJIUdAFPp1xX6mmtjuLSc7XLinwwate3C4fSIM6zc3Z1Gk0yISSBtG4gO26vCLMZvuc
         BCNtERzYLGYJhaSqXauYAmR2Cc+sm4ioRAXAvghPuU7X7+Ne2EC7aJopsWKvqjcsSqvM
         Bo0GeEuaRoXbAhZBgBOmAdbGtzMxeNvs9c5eRketSBn+H3cbzBudi3CKXzi3MzOlLD+K
         b91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mtzKWmPijMY1PkSSMWpn9rhjG/EXg2m1sprhHLtLltY=;
        b=uV9KaAnbLm3Yd2oYz00E8Iea4nB7XVxGsVgzOkdS1JkBROdEWdsApZD1NkthFScXUy
         9JBRpOy35/GEFXJ1TT8/v6CGGM0yv4QCaqZqRvAT/mZbQP/wYCPqGCmwTq/CROarHHCH
         4J1/Z3IEuao9WXKruwzxp1XLXOCLki/5pldTKRvXYFhmvyEelrxIEhuJMXjCymXfx6bL
         +PC7ksYqZKlWnoATm9DzqES3Jm59FWzR94DOv7DCYVX5p+t9ri12/hHfMXt3VhKQZ6UG
         mQRDU1KUsaQ0hQjx0Bi1kzOvBQoQQSTVG/gp56MPJSyQHVXGS/7EbXEE/7vBGR2NwJZz
         SC0A==
X-Gm-Message-State: AOAM533ljuIjiWX9kka7hnxkO3ZJ6nAbtxpMEFPekmyNIf8aGERGCa1J
        RSsAKc6OW4w+LE1L1SDBq1w=
X-Google-Smtp-Source: ABdhPJw+0ngqSvWhIMBN4gmqVswUOrVO/FRrq/+gqt92d9BWChoIXD856tbFqSB/Suln+UdV5QfE+g==
X-Received: by 2002:ac8:5b8a:: with SMTP id a10mr4851669qta.235.1627480557540;
        Wed, 28 Jul 2021 06:55:57 -0700 (PDT)
Received: from master-laptop.sparksnet ([2601:153:980:85b1:b58:2ae8:d75f:660a])
        by smtp.gmail.com with ESMTPSA id t64sm27202qkd.71.2021.07.28.06.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:55:57 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 7/9] arm64: dts: rockchip: adjust rk3568 pll clocks
Date:   Wed, 28 Jul 2021 09:55:32 -0400
Message-Id: <20210728135534.703028-8-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728135534.703028-1-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The rk3568 gpll should run at 1200mhz and the ppll should run at 200mhz.
These are set incorrectly by the bootloader, so fix them here.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 8ba0516eedd8..91ae3c541c1a 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -230,6 +230,8 @@ cru: clock-controller@fdd20000 {
 		rockchip,grf = <&grf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+		assigned-clocks = <&cru PLL_GPLL>, <&pmucru PLL_PPLL>;
+		assigned-clock-rates = <1200000000>, <200000000>;
 	};
 
 	i2c0: i2c@fdd40000 {
-- 
2.25.1

