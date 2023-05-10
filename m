Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF4FC6FDD61
	for <lists+linux-gpio@lfdr.de>; Wed, 10 May 2023 14:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235752AbjEJMCx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 May 2023 08:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236785AbjEJMCt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 08:02:49 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936467DB6;
        Wed, 10 May 2023 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
        s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=CN7Du21sI7b6jGDaBlQmutgYmHF034Timd3PFCK1lso=; b=M2zpdK72/0OU+ZG8ALGEXrwrwo
        pbCuExJ9wxSviUCBdK/C6l3sKwYmBGSE6VrnOxgHXG6su0pMooB1N0aeEVjJUvlOumaGxmYxHdCNc
        wZisbB4/diwj151NoHNhkEsEW9tWL9A2wS5+c+68TnkUt9J7YzvFUGqv4+5F3L3UXmdBYzMgTk+pm
        Az9USfra7VkwiQ1wCLFVntirYXPfcOrErtfVN9ChS9lecVuC/s5jOh1zeXkcaWianIiITNRS9pVkT
        t3NuaT+qUvvWAmF8fvs3PGyVbVRg5NjX6zdrC9Qg316hiqRoLw98b3gDiSZlCNjglz4Oi2zeRW3ta
        mCcvrOmw==;
Received: from [2001:4d48:ad59:1403::16a3] (helo=earth.li)
        by the.earth.li with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <noodles@earth.li>)
        id 1pwiWf-007ujP-UW; Wed, 10 May 2023 13:02:34 +0100
Date:   Wed, 10 May 2023 13:02:28 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 5/5] ARM: dts: axp209: Add iio-hwmon node for internal
 temperature
Message-ID: <2a9bd53a65c4a154cccba622c60cbffcdceaeb95.1683719613.git.noodles@earth.li>
References: <cover.1681580558.git.noodles@earth.li>
 <cover.1683719613.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683719613.git.noodles@earth.li>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a DT node to hook up the internal temperature ADC to the
iio-hwmon driver. The various voltage + current ADCs are consumed and
exposed by their respective drivers, but this is not and is always
available. Naming chosen to match the axp20x_ prefix the power sensors
use.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/axp209.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/axp209.dtsi b/arch/arm/boot/dts/axp209.dtsi
index ca240cd6f6c3..469d0f7d5185 100644
--- a/arch/arm/boot/dts/axp209.dtsi
+++ b/arch/arm/boot/dts/axp209.dtsi
@@ -48,6 +48,13 @@
  * http://dl.linux-sunxi.org/AXP/AXP209%20Datasheet%20v1.0_cn.pdf
  */
 
+/ {
+	pmic-temp {
+		compatible = "iio-hwmon";
+		io-channels = <&axp_adc 4>; /* Internal temperature */
+	};
+};
+
 &axp209 {
 	compatible = "x-powers,axp209";
 	interrupt-controller;
-- 
2.39.2

