Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37A66D2732
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 19:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbjCaRzp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 13:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjCaRzl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 13:55:41 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F18922928
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 10:55:39 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so10572811wmq.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH9QAwye48bejYcJsmUVDgnU+lbK1EZ9+5kkrqikkcY=;
        b=8A5AY6A0oT4jQtA5VnLRDkxo4xlP9WLPy51nJgXYmEavfSgvz3fJKE8ZrzcXFNeBFo
         EfF2wUhVpQbBlHRujvUDuN39zt+xogqnq+mg+9SPoe1d/iL0WCDcRSN3OON4G5z3Ur+v
         0PqaorL1ik7KHU22aIJ4sEelbAyBQzH/qauXHVuZlmozckIILUdygli5BSuizYVcqB+L
         sjRJpEK2Xt5CbEHCTAUH2KmIhuht3Y5cQfIwRjNXS9tjpMv7MID3s9R4/Ob1Fn0Vop9Q
         BTuAnebzZlRMd/gOTdbkelqy6PflcwdjCWmsRP+1gNj4KOpkzgnIQsNaIgsUluwSMdym
         ElUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH9QAwye48bejYcJsmUVDgnU+lbK1EZ9+5kkrqikkcY=;
        b=8GT/PfCBlEMVnPeREiFjdFTNAVpCK80CKU9bGZh/Vrb16nb0ifQP/GDcaHzgWn6e3V
         J6wX+1PNnWmvOD8e8Q6ru6uEyZDryEoTE4yxYkhDlFSa5EJbTJBTiqeRBfhf4M8298C8
         0wBdueqAw3c4iQMLl04iGvtAshUIDgWx+q/MuQkX9Mv+5GPBBR7qBHE1b9xMMtEABd9q
         5db9Wu2cu8ABRD/gf085RMyJ0u27qA9YG0WG8BGvPt3qEn2JUGDLrTmX3jAx6v+Bzy1U
         iCLdREL4odv1N8HCyo6sMlcOnYDkxjVZ5DaNTtWgAUAUs0ajkYqEjx85wf1zwa7iHawa
         Ildg==
X-Gm-Message-State: AO0yUKVCG1kLPmTHvRvfYuQ5O7kIMFmqIfgE3pfYcouFRPlCwVF8WaE1
        Q0L1+MSp2kPzN04eoAe3e3HpIA==
X-Google-Smtp-Source: AK7set8qDHNjM9Vo7umMqfyzo3JUxtB/kXW7ZJu4q//up/3L1jNprqByGyVGQI7yO91idcPzEAIepQ==
X-Received: by 2002:a05:600c:282:b0:3ed:b094:3c93 with SMTP id 2-20020a05600c028200b003edb0943c93mr20977086wmk.23.1680285338027;
        Fri, 31 Mar 2023 10:55:38 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:37 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 31 Mar 2023 19:54:48 +0200
Subject: [PATCH v4 04/11] arm64: dts: mediatek: add mt6357 PMIC support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-4-5cffe66a38c0@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=O8w7thwfT5MR8VFkiJw3MJIje+8Rl/nHai1vgZPIVV8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6UgiVTVhzknxnURoOGVCKLYcU2dVLkzXoobrjj
 VsxXt6KJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcelAAKCRArRkmdfjHURZ7TD/
 9iTLIVvSg7owqsUoDceY6ndNYIT8HmsApucX9g14JcswuQ+UyI2U0SjNL+HOGzgO0sBVVeH5q3keTm
 D5e56FbmFfLnWkp7O4gQblNL/OqU3sIOkAG+szu8f1CNMJfEsXALVsNW83tJry9o3z6CaZMkylI8F5
 4pw78JcX80XNZDuHIwV/4QBBeU8Q+94J8JyUHiKwWLfEFcUnEscztsNjYX/4Izbntad3gDhy+c5ylM
 ySWsj5nmft58+ZjEY15bBTXt8WQBFQ8PHppGAbzkF7A5J+BMQaRn8+Y7PoOM+Vp/qhxGh70bqyG8QK
 6Z1cZs7fMVnIcPRGr9US0LYCL+fstARA/nVSzqiTcomu+KgRtNBHLnMbEagczKheJWnBk6XcizkVH8
 TE6b1Dq0SWWxi2S5MP+6j6vCnxqBl5xv3yBjth8lAC8loJhfsx5XecsTKK2+lqDyYV5FgQQW2etCsh
 HnbSTTGu/M4369PL4LcPnTyT7zfKku2BU0V8BQuRkawr6Ok5l4Voaq/XqYaN1qmsK+YM3DJL36pJMO
 0sQGlAOYZtDxpykIbt5VeTc3ZzRJOnWC8D5ykWkpwuO5Q+ljjjBa2dKsBnaMVEdPBc5hgFXc1Lq658
 lc7R3F9XE4bne9GzejjbaitCyTPIQyxVq3okUnExQdjPgBv88cFFuI2Pv3HQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This power management system chip integration helps to manage regulators
and keys.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index dd7da86420cf..a238bd0092d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
 #include "mt8365.dtsi"
+#include "mt6357.dtsi"
 
 / {
 	model = "MediaTek MT8365 Open Platform EVK";
@@ -94,6 +95,12 @@ &i2c0 {
 	status = "okay";
 };
 
+&mt6357_pmic {
+	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1

