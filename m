Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9870F4261D4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238638AbhJHB1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbhJHB1c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:32 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8B5C06176E
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:37 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y15so32489539lfk.7
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+kHxD4AyFKHTUkzUIxG/0HGOEUmjqFeIEbITSocdKfU=;
        b=FnMeBDx4co3rsikNmA1+yvAsBmxVSkiWs5uWbbwykTb4OfQVbqqzyofcLbaA/OeBbU
         5lFh3JQm9/xHlSNWM+xdsRNLzzGpKY3s6B0sSE9eU2GB9wZUmHhUTEJEYX1kOya4MV6q
         L6DpFPTtXVpbVwnhr3bryYfzAUjfRnoUAtw6ofnOu/+RhslY7TUA54T0xBekKxQYKGRK
         prTgFfgfgau71HWn0+4NAjzNk3yfvqx5JV4yY77kXNJ/ArBufx0hc7zKJ2E9YdsiYJzg
         VCbEwswd+sq9yDKO2D5o88li6S7B9gJu1lHpH29lOiff0ULC1S2dpxlwCZqnI0U21OqY
         4mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+kHxD4AyFKHTUkzUIxG/0HGOEUmjqFeIEbITSocdKfU=;
        b=PhYq0sNwwYNWns59v1XW2Tq3ZLbYSTlBIBtPYziCP0TBEH0j/ca8/Us8SXWUrvgcSg
         El50ha+EuRruNmOvaVUmYVaLkTKmlZF12md7+Fu6sdMHctw0k2ubJBjs/HYea6uEd2Kh
         ZawlkXyJqn3fZa4xfKn4mIsCBMrKa7hGQ7ZF+ZhOiLEz0WrxfFK+ehuAGdzUUYNj0POa
         aaF8nKFfWTQLeZkUcXPNQjvevfFAk2dbSUkLToxKC89mKQnmXgF3raP6QHNu4Q/FuDEy
         VRMRW+oNG+m5/10+JvqJYrUXn1sdl3S5eUlBXZNh32b97oaLRd1QnVc5/HkD2a5soOJZ
         K5WA==
X-Gm-Message-State: AOAM5329778dksIpreronl2wMaCf7Aqp99zBvBvsDgHo3SuKZCxtoBfF
        cI2ZrYbbNVL+vhM1WmjtYnRGEQ==
X-Google-Smtp-Source: ABdhPJy80doFhzt0+g2B6bpAXm2L2Zu5Oaz1R/LM20rb7sLWCWSe8CY9FhMqcWitOVN9d1RDTYrHrA==
X-Received: by 2002:a05:6512:3d13:: with SMTP id d19mr7190869lfv.607.1633656336004;
        Thu, 07 Oct 2021 18:25:36 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 12/25] arm64: dts: qcom: apq8016-sbc: fix mpps state names
Date:   Fri,  8 Oct 2021 04:25:11 +0300
Message-Id: <20211008012524.481877-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The majority of device tree nodes for mpps use xxxx-state as pinctrl
nodes. Change names of mpps pinctrl nodes for the apq8016-sbc board to
follow that pattern.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index f8d8f3e3664e..a250145849cd 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -809,7 +809,7 @@ &pm8916_mpps {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ls_exp_gpio_f>;
 
-	ls_exp_gpio_f: pm8916-mpp4 {
+	ls_exp_gpio_f: pm8916-mpp4-state {
 		pins = "mpp4";
 		function = "digital";
 
@@ -817,7 +817,7 @@ ls_exp_gpio_f: pm8916-mpp4 {
 		power-source = <PM8916_MPP_L5>;	// 1.8V
 	};
 
-	pm8916_mpps_leds: pm8916-mpps-leds {
+	pm8916_mpps_leds: pm8916-mpps-state {
 		pins = "mpp2", "mpp3";
 		function = "digital";
 
-- 
2.30.2

