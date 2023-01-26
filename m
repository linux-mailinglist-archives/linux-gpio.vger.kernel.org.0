Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1772767CC76
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 14:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjAZNmt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 08:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbjAZNmk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 08:42:40 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AF46E434
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 05:42:33 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id t16so1996863ybk.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tpcudo7gJTTbbuTXM+JjARhwoG+S0cT/6fCk8EgJ3Lc=;
        b=NK0yPEUk/K6ONN9dNsc7JvUHaQ170Ni3OGZnighVNStfLllS5t/BteesuDgU0TUPjq
         1JibIBpLF8B3H1QqiDDXr7Q2PvxrlVdt/PFFLxLQLlJNmaMMQUwl/4FFyDSzzGZDieKV
         iL2rMydR6smmLgq9A0pnwS+2Qv15DqPrzx0oquj/Fdj02FgmAVcSvQrLcdw6GuzV6+CZ
         lpN/PSxKvls8df7RSa6ZFYyCSlf513RU5e5D4rLwxCUoF6w6NQrFlcf3Go95U6yWnpcL
         llWWxEfozzz30onyyGQpyx2Rz4bw2DdH7F8h8rRFdb/UMgmY6UUSy2yM0EBBAn/3Pcz8
         y+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tpcudo7gJTTbbuTXM+JjARhwoG+S0cT/6fCk8EgJ3Lc=;
        b=Ne+jV6SNVf/phkPKFryFkWY8Pxsy6DsJVKXWofYluz3ce/V4/+WuBDVbMC48ntmo+i
         EhtlNe/Xka3xfHgozVu/3hl6PyrptGG859HkV7LpCIk/fXc/1LWv7GQY5e/YVQRWgPNQ
         AC33Qt20SbYd26tNqkPrXCFI/fisaHc3i+s+/Avv+2JU5bryVKFfQuZRDUlD11L2OPAh
         k0n6lnMy36+XuxFs3cFiiMsFuTGbXR2WQ8bQ2SO7KYr/L7lOUiq+U+BJV/sLB17jdwIy
         F9PpakRMXeav9/GhxNFz19EktEEtte1Pa/d2ISPIibZNNMn7+2Mf8ssSv2eNMjS4vn3S
         lzMQ==
X-Gm-Message-State: AO0yUKWF7QXDrUiMK/PzaPrnmIHaLo0pqHAI2BvKdP7an1GN+tSOXish
        q2oHFwfQPgm4Cxp+Aez/muLXPXy/GEfMnKe8+sAN4g==
X-Google-Smtp-Source: AK7set8QbLRvblkAO9Y2WdUOE4AoqHwyG/MzmEgbUt/H7gmbHQ71M9dyBUWLCRrIyD1+N2KqvKysQXtvT1Hqg9ksT0M=
X-Received: by 2002:a25:f81b:0:b0:80b:821f:b621 with SMTP id
 u27-20020a25f81b000000b0080b821fb621mr750152ybd.24.1674740552288; Thu, 26 Jan
 2023 05:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20230118062116.26315-1-Guodong.Liu@mediatek.com>
In-Reply-To: <20230118062116.26315-1-Guodong.Liu@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 14:42:21 +0100
Message-ID: <CACRpkdZeRPaYN2aN=kBskkLJ0VjFCRZc8ccf0bBW+0sposVn7A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix the drive register definition of
 some Pins
To:     Guodong Liu <Guodong.Liu@mediatek.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Light Hsieh <light.hsieh@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Zhiyong Tao <zhiyong.tao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 18, 2023 at 7:21 AM Guodong Liu <Guodong.Liu@mediatek.com> wrote:

> The drive adjustment register definition of gpio13 and gpio81 is wrong:
> "the start address for the range" of gpio18 is corrected to 0x000,
> "the start bit for the first register within the range" of gpio81 is
> corrected to 24.
>
> Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
> Signed-off-by: Guodong Liu <Guodong.Liu@mediatek.com>

Patch applied for fixes.

Yours,
Linus Walleij
