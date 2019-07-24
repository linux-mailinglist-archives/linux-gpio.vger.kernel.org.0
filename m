Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7782D729A4
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2019 10:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfGXINR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jul 2019 04:13:17 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:56603 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726208AbfGXINP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Jul 2019 04:13:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 40DBA154B;
        Wed, 24 Jul 2019 04:13:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 24 Jul 2019 04:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=Rv20jGbPNsBjz
        MPKuVs8f/Enkq1CSpk7pUqYsFfVLc0=; b=I4LV+EQVtSheAKaWeKPzvHuWGd5bV
        pPkemqhoVa1emsmTDsB0nNnOBxNJ1WZJ3Y2zAmvW8V04jZojQD3f7M62g5U0V2T0
        kJH8yzQyWzKNExKq2wySEJmX1TB8qgJ6bN/IlxNrNuB4b5lhZ5TiGqss9LVNfeKH
        +nBroxpRlpD14M9eClULT1szZ8BQRZhikzOgCTovsJ7KIctkrPfVIox892lx2KwA
        gLIRGxqgPvtFKyzR7tKYLT9dN+g8LvBvq8XLwCVwStho6gHLCeKxiZAoESP6WQzs
        1BbUvnGoNeEaJbxd94CJDLXvKbWSqCP7qBjllE1YqiDGjFspqnnzJm+ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=Rv20jGbPNsBjzMPKuVs8f/Enkq1CSpk7pUqYsFfVLc0=; b=OfF3r2Og
        XSyEKBVsSJpUY3RK4ITF6VLSQYr8rzJ8NPzGkC1W4ugmifoAGDdG6Ys70qq72iXi
        arRAx5aiz6VY/4MNf2uY6OUDvoLvA9mWGgAVBiTwV56ZHxL4BYnajE1KlBcWOwzr
        SyVdbpPRx4n+aD4dyY3pl5QASYQTg1rJNMiqbivOP1I6CPdayVLEu+xWPG+MavRY
        UEovJc5b2aH1joW8wywINbqmIi/PkzH5uDEM8XTkoOenxXGYvNLJFjeTtHeIkB6M
        ywglvkNd6lYjvKgEGtfgc2qbgVI/WCbDeqjhVlsaO9tQSAFrwtSAUW92bXV6IfGk
        B02hBd7xdiRxzQ==
X-ME-Sender: <xms:GhM4XWBXR_YVAfHNYj6ryTkEUqFpTYXgEZCti4_aGx7D77DZRW4kWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeelgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
    hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
    pedt
X-ME-Proxy: <xmx:GhM4XYvGKJB_ZnKQrpUyW32LMhvIenl-HsnfBOYMhiE_2YIr-hcZMw>
    <xmx:GhM4XQ59KpWS1I5prOVB2EEugFk_VPjfaCPC0OIQGvZONFKQO3i9Ng>
    <xmx:GhM4XSf5SmweW64-uWMxlNbULxKGUzIpltCqso2d7MnH-FxVnfTHxQ>
    <xmx:GhM4Xbmt7DDcc8Ta96KX3PR2aTs7CeZXkUQo2VIx9UwS0t8GaDx8OQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8952680059;
        Wed, 24 Jul 2019 04:13:10 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-aspeed@lists.ozlabs.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, lee.jones@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/3] dts: ARM: aspeed: Migrate away from aspeed,g[45].* compatibles
Date:   Wed, 24 Jul 2019 17:43:11 +0930
Message-Id: <20190724081313.12934-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724081313.12934-1-andrew@aj.id.au>
References: <20190724081313.12934-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the SoC-specific compatible strings instead.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index dd4b0b15afcf..7f06dc21dc19 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -162,7 +162,7 @@
 				#reset-cells = <1>;
 
 				pinctrl: pinctrl {
-					compatible = "aspeed,g4-pinctrl";
+					compatible = "aspeed,ast2400-pinctrl";
 				};
 
 				p2a: p2a-control {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5b1ca265c2ce..04c97138e18b 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -215,7 +215,7 @@
 				#reset-cells = <1>;
 
 				pinctrl: pinctrl {
-					compatible = "aspeed,g5-pinctrl";
+					compatible = "aspeed,ast2500-pinctrl";
 					aspeed,external-nodes = <&gfx &lhc>;
 
 				};
-- 
2.20.1

