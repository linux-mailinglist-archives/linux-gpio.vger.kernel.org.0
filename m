Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98442AB806
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 13:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729632AbgKIMSf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 07:18:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729751AbgKIMSf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 07:18:35 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13950C0613D4
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 04:18:35 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id j5so4656517plk.7
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2020 04:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Rwi6JrG1Bh8jLLcugHVfWoJr8ivQS6AwCC3H82H1b4=;
        b=I7miMOGhEdT7J0NAhMTCfKP0YfrV8cuu7jT+qTWfzx/UnjvsFFumY3ebjucZ/PY2pX
         ky0LqVkrGZhe6mB1ixA2yMyu82I9qlME5l0pgUcbg1SSgGYKpmjCRQRm5SnNQf3K0Tg8
         m15vf4PW2cnoTUbupzdVt1Vk6w6U7qPXghp8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Rwi6JrG1Bh8jLLcugHVfWoJr8ivQS6AwCC3H82H1b4=;
        b=i+HEyg/FkTomxOgC42br0YZsD/htruk+K6mzbrs4FTnb46fk71AHYtNGZoHrHJdnb3
         OTKMWIxxhsJSica9dSgavT55mK528xzd9sOqMAwWBzA4ANo4HOpYcnhlaiER3rCiOEb7
         9hGCwAviMHI4PFJtr49MuXuV7PQIESyM/rkRkgRZ7VCOmaIei2hMXqncgIW6eDY61IAL
         uR3SZIg6tUNXu/7WSDUF1OP2yJYJfrgSS5GooooWvNNHC4p+Pw3d+3j4C0Nr73hirVff
         RbmGLiQ3AqgFO6jQGwMZOGESWeRoHwcV2Brt5Udun78IfTQitwUnHoVp+HMMg1JCkbbH
         mRzA==
X-Gm-Message-State: AOAM533JnCh4tPKlVqAtwG9BhcuaMAHp9upDmNWO8BFXSrBk0bQHH4y2
        1Yu3TVdL+S4lrQ24lrFx77u/Uw==
X-Google-Smtp-Source: ABdhPJwIBAsn/3BnPLGIM6HYZYH0I3QBpnJKi9ej88OHsCBcUhLvc1UBv92TWmV6pvx2zGKesCPqAg==
X-Received: by 2002:a17:902:c411:b029:d7:dd6e:60b4 with SMTP id k17-20020a170902c411b02900d7dd6e60b4mr5462718plk.66.1604924314644;
        Mon, 09 Nov 2020 04:18:34 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id i123sm11425204pfc.13.2020.11.09.04.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:18:34 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     soc@kernel.org, linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v3 4/5] ARM: mstar: Add gpio controller to MStar base dtsi
Date:   Mon,  9 Nov 2020 21:17:30 +0900
Message-Id: <20201109121731.1537580-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109121731.1537580-1-daniel@0x0f.com>
References: <20201109121731.1537580-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO controller is at the same address in all of the
currently known chips so create a node for it in the base
dtsi.

Some extra properties are needed to actually use it so
disable it by default.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index f07880561e11..81369bc07f78 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -109,6 +109,16 @@ l3bridge: l3bridge@204400 {
 				reg = <0x204400 0x200>;
 			};
 
+			gpio: gpio@207800 {
+				#gpio-cells = <2>;
+				reg = <0x207800 0x200>;
+				gpio-controller;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&intc_fiq>;
+				status = "disabled";
+			};
+
 			pm_uart: uart@221000 {
 				compatible = "ns16550a";
 				reg = <0x221000 0x100>;
-- 
2.29.2

