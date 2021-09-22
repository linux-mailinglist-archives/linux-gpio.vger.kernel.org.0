Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90494145A4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 11:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234618AbhIVJ7V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 05:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234615AbhIVJ7V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 05:59:21 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CB0C061756
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:57:51 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p29so9502701lfa.11
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5zPFLKdwxEQ81o/wg7gBk+tb/obGKRy8ThoN2UKg148=;
        b=FgS4Cst9PhmI+ylUCDv/S8Jwho3iMZN6S7wLDxLWtfTUVEOcGUs9EqWASkMndVYxwU
         /IoGAqAowTA2uVRKJ3ZR7G6mIOOx3vJL7C2XLeL45qX4o7yRu6zeW32VsITeT0Ugwnju
         vbi+j/UbmDeRoGap7sFoCSh/Y3Mji5RCPczOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5zPFLKdwxEQ81o/wg7gBk+tb/obGKRy8ThoN2UKg148=;
        b=mJQC9KltMMtukj6+cbneAEcIA2Td1xFzXv2u1etzqfkngFhSIk/++xrsuVA20Irizx
         fsX5qGZjWatvXjHvPHyV3rzGwx17u8hwVU+Ptrzfjiq3AkXc8d+0DjwfD5Lxrw3pckW0
         UKA7ng68qI+J61zE8laYaXBpD1nF3JBg/Pr/s/fYof7NikvvHPge37WAj99bmHlf7O7N
         YPJGOwuRo/odztsBdObwXWoZ/jCxdEVDwObHOEQdBKJv48oqqGtqgksgXz65oiBZvrYa
         kPKw5rLCaqRvpZyyWmfPcCOl6BjUnSj81/g/r5Bouv8a/0n7dRCfhuedz366+soEZ7As
         h3Yw==
X-Gm-Message-State: AOAM531it9gLic4Ix+JgOShzVztW91y8nHCgUubh9fWnorgOT/oca+2X
        Nl8p1eg/5d/LhfrwfmD+eCLsdOaVqn7gm+exMVrRSw==
X-Google-Smtp-Source: ABdhPJwZLSMZ4vH/uiWlXM/0D55iZGTePsjP293/G8LySD8PaTBNULi2fm0jDPKEeSDfde0cJX66xJG5b1IxF1qccqM=
X-Received: by 2002:a2e:4b09:: with SMTP id y9mr27182090lja.201.1632304669689;
 Wed, 22 Sep 2021 02:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com> <20210922025640.11600-6-zhiyong.tao@mediatek.com>
In-Reply-To: <20210922025640.11600-6-zhiyong.tao@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 22 Sep 2021 17:57:38 +0800
Message-ID: <CAGXv+5Fs696ZM2+QEUf8+zoxrh1e4n8Ke5xoijJWDu0_xWOr7A@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] pinctrl: mediatek: add rsel setting on MT8195
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Light Hsieh <light.hsieh@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 11:07 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> I2C pins's resistance value can be controlled by rsel register.
> This patch provides rsel (resistance selection) setting on MT8195
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
