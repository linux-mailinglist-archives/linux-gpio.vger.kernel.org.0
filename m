Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4943D35EC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 10:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234276AbhGWHTN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 03:19:13 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:59977 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234404AbhGWHTK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 03:19:10 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9F669581634;
        Fri, 23 Jul 2021 03:59:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 23 Jul 2021 03:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=M4brAVDojAQdO
        LA2SxZ90X+cdLlh9vmdPo456Vzq22Y=; b=UaJkAHfSJlqvnLlAxoVYhMu3YGzIW
        C8YJ40iQz6oS+vLeDZVdyww2Cj8HAxYPlcTcbNzB6fis99yiJfVPMq1dcPhreeZd
        D2Fg/WWiN1YIyoGtoPH4KiIGzCFXY7vXWdxgSTnhjaACW97200Nb19HyEje1UaVS
        69AyaIaGURK1s6JF+AdipI1TYP1UsAqZ0SqjhudGp4xqttsHWi/LjySiHy7NFSeR
        DMIUGZcpnWvCU05o9rRiIU6uC7LPq637dMWJCAFe7MQyacqI902mz62/CnMxEgNi
        s9QP58ybb/iRtDFQYEX6nXfVhwhILYVW+C0oxGAbYUuN+KqktTEBUKnAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=M4brAVDojAQdOLA2SxZ90X+cdLlh9vmdPo456Vzq22Y=; b=MuqPGjGj
        z4RqTO2akb/D6DrmY7u2KCRcbO82GvxBZGdgcG4eGCO8PnaCbEZSbaIjfgg8e7fc
        nVaxtbL4mAkGAgcDMaLLdF/QYV0SN572zXfFkOU9bmtyrDOvf8mcEqMymYhH1Spi
        V3ySplcMvCaoxjPsdeFNhPeB7vfm0WVpsPJG4BJ3flFV9SOmKFmIDyHryiY82pz4
        zIoFZHvoyWgcq21XbbO0M7QAua7V7i8UywG4pwh0rqGuDMb/5FhSlrxViU4ibTV0
        R9Th43nCXkjxbHZleHo0KXKV/ZknPSvLgi7fIs4euCGGLBJKuJYNEUlC71uP2xtq
        f9cncUhGeDr/1A==
X-ME-Sender: <xms:7nb6YKaGMre-FUnYXQkybNb0OB4kri70aJkMHXp9IPNq-L6o58uz3g>
    <xme:7nb6YNaUesLqBgvj58hDHasJTAVgVp-zK-5ALtU5yFGqxrITOaVjT1QkRO2F2Q6Hl
    txWd6CgLTCAGgTZfA>
X-ME-Received: <xmr:7nb6YE_7kbBN18eHGUSFFyO7cg0q3gGeSR2yjl2Tam2gn6yepcWlXReSRW1gcmyYuexPkP4k9gpoq6T2XiNKy-FT6nFP1L7KUQRu1PO6iCQOETHY1iYW20D3rJcz-1KUlhh_aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:7nb6YMpmqMny-sMDSLFOiy4Yr-yysHbycOJ7ArI8UueOa4NW8jXVhw>
    <xmx:7nb6YFoEiVPT-hXy_bQ_6TjDeBFdmU5FOJNMQoAq_YwG7FPGIHvRnQ>
    <xmx:7nb6YKRSHjtBc_soCP-epuQONTd_68MukeVAzPd4Nz4IgHPv3VWwtA>
    <xmx:73b6YA3OLPULSetxTXX94unDxJgE3dg1BbSvQIzgR2fAdUCbAqe66A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:59:38 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     clg@kaod.org, robh+dt@kernel.org, joel@jms.id.au, pavel@ucw.cz,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/6] ARM: dts: rainier: Add presence-detect and fault indictor GPIO expander
Date:   Fri, 23 Jul 2021 17:28:57 +0930
Message-Id: <20210723075858.376378-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723075858.376378-1-andrew@aj.id.au>
References: <20210723075858.376378-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Expose the ability for the hardware to indicate that it is present, and
if it is present, for the BMC to mark it as faulty.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 76 ++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 941c0489479a..84651d090965 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1685,6 +1685,82 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	dbp0: led-controller@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		ngpios = <8>;
+		gpio-ranges = <&dbp0 0 8 8>;
+
+		led@0 {
+			label = "led-fault-0";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "led-fault-1";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			label = "led-fault-2";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			label = "led-fault-3";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			label = "led-fault-4";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			label = "led-fault-5";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			label = "led-fault-6";
+			reg = <6>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			label = "led-fault-7";
+			reg = <7>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
 };
 
 &i2c14 {
-- 
2.30.2

