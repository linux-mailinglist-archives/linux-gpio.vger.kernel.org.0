Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472D86429E1
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 14:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbiLENwT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 08:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbiLENwM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 08:52:12 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0F611813
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 05:52:10 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id m14so18671901wrh.7
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hU8awQZE7orgladXdlo0GTxR4zpxwbwcESgIpxJ13kM=;
        b=W3u+C+W4iy5BKYadzGKEwrhnX+WHxjNavB8D/PC0lF1Fg8Pe/ekhb2jrUSCOQBbdxx
         8N2KRN/GPH3DObr5sim0ov12JwqPrWTJ1o3lzijoudRm1w8LQ45gAXxVBQHn5mnT9oTf
         OAE1WebEs4Pv5KCp7lu0pAgvuoaQ6FUeIN/KOIIuR+80p/Exr625rhjENGDee28wLqy1
         Hm3kWYHWdA7ZYksYwPb0aDiA7Q6eQ9wwdFw0jH4N2LruSG//NsoWgDUVA0wMSSstGuhk
         UVywvmbJ6IMMhvdWY7hKXisfrNCOLpkC3SVBPV6u/z26MHkxZHbGqwfmSFB18vTnhgFw
         PCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hU8awQZE7orgladXdlo0GTxR4zpxwbwcESgIpxJ13kM=;
        b=m8IwrQT8pCBuEMHHgPTihs0NSGJWp/xMtU+VhsPbjU7k7N9SsNlj0JuAj6cdBk7Yk4
         hPKnBEyWchwooEvGoDjpYQVTl0hwsFpfbyeiJhH/BExYz4jp0UsbxDf2KqejsN6zMKis
         tfX0dri8gSkTE3c3VE4PSKDFpxQaZwxLwIhDNUTkYvf5pxPBT/vxI9hrpIywBllLKrKl
         pWD1R/M5ewm918/rzbr3TfuJzi84triP4Zs6XT2vA6jp6mC93Q/ZNyAdUp0nQTlhGOEk
         JEiiZ96Y6vVUikMnRS0I47Br7nQgVSb/UtuNgdOHZhxlO98VKoZy4vw2LxMAg1t2kwwb
         7FDw==
X-Gm-Message-State: ANoB5pl2c/KlAp9Ob/uLpyS5MDd0ntlRUFU6lblVm5jPk6aPxkJIr96w
        7CV4Tnaq+TDRsnI8WjFqH4wU8g==
X-Google-Smtp-Source: AA0mqf4zO/xd3fS5xAzDq3lcKBOsM7eSke1rV0b1O0YU+j5ch0a7K+qqm+Ozk8+g6W3Ara2pPKMung==
X-Received: by 2002:adf:ea8f:0:b0:242:5afd:bc5d with SMTP id s15-20020adfea8f000000b002425afdbc5dmr4459827wrm.305.1670248328876;
        Mon, 05 Dec 2022 05:52:08 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a3-20020adffac3000000b0024245e543absm9012700wrs.88.2022.12.05.05.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:52:08 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        krzysztof.kozlowski@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, khilman@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH v4 0/3] Remove the pins-are-numbered DT property
Date:   Mon,  5 Dec 2022 14:51:55 +0100
Message-Id: <20221205135158.1842465-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

During the review of my MT8365 support patchset
(https://lore.kernel.org/linux-mediatek/20221117210356.3178578-1-bero@baylibre.com/),
the issue of the "pins-are-numbered" DeviceTree property has come up.

This property is unique to Mediatek MT65xx and STM32 pinctrls, and
doesn't seem to serve any purpose (both the Mediatek and STM32 drivers
simply refuse to deal with a device unless pins-are-numbered is set to
true).

There is no other use of this property in the kernel or in other projects
using DeviceTrees (checked u-boot and FreeBSD -- in both of those, the
flag is present in Mediatek and STM devicetrees, but not used anywhere).

There is also no known use in userspace (in fact, a userland application
relying on the property would be broken because it would get true on
any Mediatek or STM chipset and false on all others, even though other
chipsets use numbered pins).

This patchset removes all uses of pins-are-numbered and marks the
property as deprecated.

v4:
  - The generic pinctrl related patches are now in the pinctrl tree
    for v6.2 - remove them and repost the remaining bits of the patch
    set. No other changes.

v3:
  - No functional changes; add recent Reviewed-Bys and Acked-Bys,
    add linux-gpio to Cc

v2:
  - Deprecate the property instead of removing it completely from
    schemas
  - squash some related commits

Bernhard Rosenkränzer (3):
  arm64: dts: mediatek: Remove pins-are-numbered property
  ARM: dts: mediatek: Remove pins-are-numbered property
  ARM: dts: stm32: Remove the pins-are-numbered property

 arch/arm/boot/dts/mt2701.dtsi                | 1 -
 arch/arm/boot/dts/mt7623.dtsi                | 1 -
 arch/arm/boot/dts/mt8135.dtsi                | 1 -
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi       | 1 -
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi       | 1 -
 arch/arm/boot/dts/stm32h743.dtsi             | 1 -
 arch/arm/boot/dts/stm32mp131.dtsi            | 1 -
 arch/arm/boot/dts/stm32mp151.dtsi            | 2 --
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi    | 1 -
 arch/arm64/boot/dts/mediatek/mt8167.dtsi     | 1 -
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 1 -
 arch/arm64/boot/dts/mediatek/mt8516.dtsi     | 1 -
 13 files changed, 14 deletions(-)

-- 
2.38.1

