Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B126CD581
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 10:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbjC2Izl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 04:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbjC2IzR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 04:55:17 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B79249E8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:55:05 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id m2so14846214wrh.6
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCK9ixqSl+74rQaK3ldRCMI5KeuVJdjVcuRaPTgCkqo=;
        b=rZnYHG0CnPjE+aEbbLw1j7Stc0yw9/iFGuyOULIXI9RehtDVStHFNNyMsvtDPzDyIq
         WnBzjjWp1FhortWNAg2XxCo5753rzH/6L6oRWV9kQ+tNXRu6AwT8p79kl1PsaEEzIgPa
         CP7vpEfoi9sJIW0aORJz0X2NgoR4CB59unuupubSF2qrm27y5MQtNmW9BCaGKarP5zsr
         xrJayyvSvTp9BtQEMiZvFpdBhZBqs3buM1e2qb3YcFhfvSHFVofGw0z6gFaqdTq2jEU7
         6XO2MRiiwh1AKECtBO+UxDD9zSBE8nuGDvqLoXXcDC4lZ0TrhsVyQnPknbA1H5M2BfNY
         K7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCK9ixqSl+74rQaK3ldRCMI5KeuVJdjVcuRaPTgCkqo=;
        b=TZgvvD+7onlW8N6nO7ikq19+/g/lou2tpiqVaSOMGi6Osr0dPWTURG07mTqSTMtLa0
         TnPiZ6XqXSUC3F8Jw7fLP99W/CJP7uKStL5eTwpfi413QezFOPmEujBTi+j+r8gs4iB/
         hLVPbrV0bjsyFVxW1nK/VA+GLLxp2Nzzgl8Cx4DY5GaaSrUBc98+46i8WY/fUUbqtVSY
         FL9TAHVDNUUTEWX846EeSV2bD17z34Q1otIQXe/e3cqerAqxYhUXW1rw9utrYFQzZVsk
         F6Dat9coO15AKhysWQDmdXvK+LbvK4n5n126F81OLcNGHbr51xpsQ+SEXwuticQmNZtU
         5ZVw==
X-Gm-Message-State: AAQBX9fPBl3LrZh1YBnalx6w0i/4s0HjUfMpDcn0cmTaf0E34eE6xrG9
        iZyE22KxHjF58hqcTx+o9URLqw==
X-Google-Smtp-Source: AKy350ak1x66ouEr6/ZWlRxs/GEyCSqDlQIq1u/HdPCZG58AWG//Gs5m1l+y+ltFSIZ41bgqmi5yBg==
X-Received: by 2002:a5d:6845:0:b0:2d0:3584:27f with SMTP id o5-20020a5d6845000000b002d03584027fmr15013155wrw.68.1680080104530;
        Wed, 29 Mar 2023 01:55:04 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:04 -0700 (PDT)
From:   amergnat@baylibre.com
Date:   Wed, 29 Mar 2023 10:54:31 +0200
Subject: [PATCH v3 10/17] arm64: dts: mediatek: set vmc regulator as always
 on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-10-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9K3Z9ZHZRcpHgGgX6of5yD1IBErtg5bxp3QfwtuyWKQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcANh6NbaBSLSGX7UyNKUYZh38g0bh6bGpblto
 fYtesxaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURYGbD/
 9jIzNron9cdGretzk3TABJ8IvjGER4c8zIv3L7b/Y3BrMhT62nJUgKQhwKbQbkFFBBHzDkQaiuSZid
 j/ejgvMj8esHOIEijk9aJPuYtKU+GAChZvQycwnxI0XVlsSl3xX2QzWai0zGhDnk6ysK6lZ+4bnmio
 QqMDshGzFMYfyBaSUK3M41uyvQOqsPYK0yK0FBMqy9jneZK+5Gz3Nwxrd3TEy1cnLeAK4pctBOL8Kc
 DVLmugqHTkVeu39hXVZ0LdcQ39NbAe5/NS60xZSOoRjHAlfyo5jm15XEVG6miOwN9SpxpTJalW6Rt2
 D8fEzR+n4ipk1HdnlWDE6bxYMiZ6Sbcqqxh6w5IPO1xfDo2+fk0Cr1JQAVlB1h/X+cjF4pyLSauYG2
 hT1Npr5Ak+jOJ3SQV4O7P8j0sVjodB/WTLB4GMSJUnuQCZ6K0lVMzTz1o0MU7tgXlmiuBXpXOEF/De
 csyHKqRto6rThWwm0QQQCb4BuDRT9XF0M916JYpVndOXALa6rKsfQ/yfJVIKF6nmm4SfA1WOTz82hU
 xKIloRVIZq8rbobpIhiIy8dyyCoDAvnsQui7NGpO7y+NYT8cb9QDQiPXdSdnytS6+HvwlLMs28Froj
 dLf+NXBO9zXiZGJYWzTysxJkANPZWkbEuIftbS4bKPeLMx1sSsQmr9dnqA8w==
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

From: Fabien Parent <fparent@baylibre.com>

MSDC1 IP block is powered by VMC. Make sure it is always on.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index b5d018686cbe..22ec332fe9c9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -140,6 +140,11 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+/* Needed by MSDC1 */
+&mt6357_vmc_reg {
+	regulator-always-on;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1

