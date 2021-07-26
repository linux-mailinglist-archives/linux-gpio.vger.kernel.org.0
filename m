Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97CB3D5567
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 10:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhGZHjz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 03:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbhGZHjx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 03:39:53 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DDCC061760
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jul 2021 01:20:22 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id r26so13991528lfp.5
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jul 2021 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=91yXb1VgXd5JhIW1bX57GkCbuisDS0fNOG8Fkd81qLY=;
        b=FygJv0Sm71wlNsHO+sqMNccJlsftKpOA/wgSG/X15ho9In3iyj7q2bEnSLlCtjD12L
         N/M7zXxrwMCTf3a4UtmdqGojLPb9b7WaJOnty8rww0ORl+tzW8hTdRfEpfRm/BmXKpG4
         yCuxashLUeZU1hZS4DgXeoD2PStAB022xLxYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=91yXb1VgXd5JhIW1bX57GkCbuisDS0fNOG8Fkd81qLY=;
        b=TBmXV9LAB2zhCtaWYTRioxdxuEd1VylyifGAAKXMfO/mCGTfqSsDvxYqIkSX2x/gyz
         WylSLXwjCcj9A8QYTyRo3Q/DmptzXxk6llA1vHJ0TND6reJMULt00NuP3bil4cVRbICY
         A65eiCIKduWTggsau2qgLXsMEMvfKCXCS+oiY6lPzsE4OOvfHdzyQ221VL+xilssLUMy
         u6bT5qKYLbSGzPM6iu/pMw8E3NAYZleOn79fmivp9X0tizhtthOdoGKxk7JqRO86Vj+w
         1iYELRoUOsjoUJfagWy8zf/aeQZQJpSzUedjYGknQ6FvE74lDKEq+w8UHiwnwXwzZZOa
         ts1Q==
X-Gm-Message-State: AOAM531s7I+jSTqZFcopRI+UD4XQqDAbFlmFoimDDdRClf0Q95QveLuh
        hOHvuBYOJoOIXw2fEW+cqb09KMDpHfKkZrajEswbQw==
X-Google-Smtp-Source: ABdhPJwfbJe3IIQsY3UXhqvOx83qo8udghPA/zhl6SSU23YZpe1JFdaeLb5Lxi5GlOdmAKbpunqhPBD06JXT87jgpNk=
X-Received: by 2002:a19:f00c:: with SMTP id p12mr12028038lfc.647.1627287620624;
 Mon, 26 Jul 2021 01:20:20 -0700 (PDT)
MIME-Version: 1.0
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Jul 2021 16:20:09 +0800
Message-ID: <CAGXv+5Ev4QU72cMqMW7sA=dijzh7-DCsfHY+Lmqd36uzg_7Nww@mail.gmail.com>
Subject: arm64: dts: mt8183: Incorrect mediatek,pull-*-adv values
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fabien Parent <fparent@baylibre.com>
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I was looking at MTK pinctrl stuff upstream, and it seems there are a few
`mediatek,pull-*-adv` entries that have invalid values:

arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-up-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-up-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-up-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-up-adv = <10>;

According to the bindings, the values should 0~3. <10> is probably a
incorrect attempt at using binary representation, which is wrong. This
probably leads to the pull-up/down getting disabled or ignored.

Cound people still working on these two devices take a look?


Regards
ChenYu
