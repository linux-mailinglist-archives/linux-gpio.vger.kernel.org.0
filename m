Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A59A3D8FDF
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236672AbhG1N4D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236689AbhG1N4A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:56:00 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A293CC061764;
        Wed, 28 Jul 2021 06:55:57 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id t66so2304722qkb.0;
        Wed, 28 Jul 2021 06:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LMidoks8VqIeotRW3zF6aKDdq4qcQbLbMvTzDQDS3NE=;
        b=SNAMGLrcZebiKazFrHoVd9aU6/z8YYqD/8zVNXKQQkOmk9aL5qEuZNhLvp5JyL+pho
         bWy3HlMMU2RdJ0rLJavw3lyZCSJzYRamnPdeQmW4Hyvlr0kv0udwDohAV0Shj1Q4kegg
         CjDrQ4Q8hl3OiBaLLDQB42R1z2T61GXkvXZRO/8sYoOqHB8OPYc7ZpBGniNOAttDJomf
         iASjOfVDaQsY7qpkSjgtpo5zr7wfDx1nsgfs0Y/buahRPn14PAN78oqYUM4r9rUZzCOX
         8AZDE7Cbhvtp/HIBWv3z2nCODoPBnAqzrhMJTAyRTvs5yQjk/wOlW57XBb2iyHZ66/hz
         j+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LMidoks8VqIeotRW3zF6aKDdq4qcQbLbMvTzDQDS3NE=;
        b=Z3FpjnmPzFlT9VVn6GosXvQTXFRnGn2AEK+h4Ml9YZawUf47BoMSoc9MGqCovmWsoR
         xIS7keKNFDtg2dtoPorSve0F5jJ2vuVB+4TyNbUmcG+BA+LpRWyFF3r1Elm3cfThYYow
         j7sMEgejZnITK0IdJKzDDBeiXnzBPqCdvJTaGj2sdSQsHPPFJ7qb2uAG4d032s/QJAm3
         xBwLiJ1QiYoDLtYws2Ju/XOTevhlBCnSfoW8eulbDJlJXbj/UaEFtP0NKVIuvWxUtYYC
         +7vwQby7wUJg3peM67nkQsIALZ3pQhgMR0RYhSt/XjCdtcU1pYrh3Bl1CNhqbHpZEBmU
         q/WQ==
X-Gm-Message-State: AOAM531iV0kA3/SccwxG+X2RHK30XIr67gynWw+SOrdnYs77AxdWQUq8
        RklG3Ml0E0NjNRqPgmFDcrE=
X-Google-Smtp-Source: ABdhPJyKgSrOrkUUbUuHwY2CzyhrPvSL5W+t2O8/1LtVM+F5E+MM8rI3uHJAZ7Ilz+Rivd6lb3oO5g==
X-Received: by 2002:ae9:e60b:: with SMTP id z11mr27953183qkf.8.1627480556819;
        Wed, 28 Jul 2021 06:55:56 -0700 (PDT)
Received: from master-laptop.sparksnet ([2601:153:980:85b1:b58:2ae8:d75f:660a])
        by smtp.gmail.com with ESMTPSA id t64sm27202qkd.71.2021.07.28.06.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:55:56 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 6/9] arm64: dts: rockchip: add missing rk3568 cru phandles
Date:   Wed, 28 Jul 2021 09:55:31 -0400
Message-Id: <20210728135534.703028-7-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728135534.703028-1-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The grf and pmugrf phandles are necessary for the pmucru and cru to
modify clocks. Add these phandles to permit adjusting the clock rates
and muxes.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 0905fac0726a..8ba0516eedd8 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -218,6 +218,8 @@ grf: syscon@fdc60000 {
 	pmucru: clock-controller@fdd00000 {
 		compatible = "rockchip,rk3568-pmucru";
 		reg = <0x0 0xfdd00000 0x0 0x1000>;
+		rockchip,grf = <&grf>;
+		rockchip,pmugrf = <&pmugrf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
@@ -225,6 +227,7 @@ pmucru: clock-controller@fdd00000 {
 	cru: clock-controller@fdd20000 {
 		compatible = "rockchip,rk3568-cru";
 		reg = <0x0 0xfdd20000 0x0 0x1000>;
+		rockchip,grf = <&grf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
-- 
2.25.1

