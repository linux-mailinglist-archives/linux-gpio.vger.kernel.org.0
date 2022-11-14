Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E4B628131
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 14:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbiKNNXJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 08:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235551AbiKNNXI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 08:23:08 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5F824F
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 05:23:07 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id x102so2041496ede.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 05:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdjlbixNksyWUmSwVA0oszzukvQJyBdRdSXeK1Q7UgM=;
        b=Voqp3oaFTueqHJ5jpTyX8MHk0ZEQn9jwK4nyyO0uhP+iTVeqdQKo/TXXxQmvVEBdPs
         Sw+iGKIUvtqYYOgR8ZFhVsWwU9c9UGAn2jVLOADgMynXMR9S8b55F+Hkl9Ak5nDgDDQb
         hJH08eEp53gOqcf5QzZ4w3yVVyoXcmy20HWIx+cpcyirc0MmNzXD0yYHFTR9kmEwebUR
         OSI6EFp7MGMenJBOhgzAZ5DaRe1oI04e5wFHP3YWiQHPQCoQ7aIyiBmnPK3Btvjos1Bf
         uKXhcGKHVb8TZSBpaqBIKbV9T7qsGpFfQneHeBnmnRoyFVs273eVwMDtRCpo2P8pQLpu
         frfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdjlbixNksyWUmSwVA0oszzukvQJyBdRdSXeK1Q7UgM=;
        b=pcAsu126M09gx+BLKqhmHvOId5+2jx3jCz7RMqMJMh2q5CYu2QEa0lSxmaqd4EOxhR
         5miY6qH2FjzGh4QDM93IGnNLMERXYmq8f7MFXY/gX7YQ5SMywAyuqvTABHvW9o6F0ySj
         RK8IZt4usX+rZcjNCx4G8a7RTbdEP8h/PczbZgxt40O43Ao5FNe4oLdNEG7t1ewFw5/W
         GGJ/SAhlj+FE0N3NMX0gfaZeI9TzcNyTaoiDXk/AfHzNRgHrX67XdeGkfCsduQ73cCN/
         lyKbV5/tkb0RKFoX1LyXZ9NkYHMXS/jMhTFW3FYRFerFYbf7CHicTaHrmGnbl0PaVgKh
         Ueuw==
X-Gm-Message-State: ANoB5pnp98GpjeEq8go6OXm4yzsGzqi1nBmovVEXj5Xl/CKAUkJ8V9T/
        oRrSaYWWJGQv9/LZQOcu4z8Gqh6/Y2W6DaTJqa1aRw==
X-Google-Smtp-Source: AA0mqf6K9UdLNkuoM1yV47dlYKLSc/9xdfJA+YA8IMuwuRw1bt7cE7J5tOY7mfFjmQ/o8fEmPNLBHZ7WiHiycebyGkQ=
X-Received: by 2002:a05:6402:2931:b0:463:ce05:c00e with SMTP id
 ee49-20020a056402293100b00463ce05c00emr11088202edb.46.1668432185632; Mon, 14
 Nov 2022 05:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20221111094106.18486-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221111094106.18486-1-angelogioacchino.delregno@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Nov 2022 14:22:54 +0100
Message-ID: <CACRpkdZ_FYHBn+d9Q4w3U4=CzCaC0U81n3kJeCDKwKtSi9+RPQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix EINT pins input debounce time configuration
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sean.wang@kernel.org, matthias.bgg@gmail.com,
        nfraprado@collabora.com, marijn.suijten@somainline.org,
        jami.kettunen@somainline.org, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 11, 2022 at 10:41 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> The External Interrupt Controller (EINTC) on all of the supported
> MediaTek SoCs does support input debouncing, but not all of them
> index the debounce time values (DBNC_SETTING registers) the same way.
>
> Before this change, in some cases, as an example, requesting a debounce
> time of 16 milliseconds would mistakenly set the relative DBNC_SETTING
> register to 0x2, resulting in a way shorter debounce time of 500uS.
>
> To fix the aforementioned issue, define three different debounce_time
> arrays, reflecting the correct register index for each value and for
> each register index variant, and make sure that each SoC pinctrl
> driver uses the right one.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied for v6.1 fixes.

> I know, this commit is a good candidate to get a Fixes tag, but I
> couldn't find a way to actually do that cleanly...

I don't super much care. If you need this backported to stable,
suggest it to linux-stable once it hits Torvalds' tree.

> The only way would be to split this in one commit for each pinctrl
> driver, but that would result in a series containing 21 commits, of
> which 20 are one-liners... and that didn't look right.

Ugh no this is way better.

Thanks for fixing this!

Yours,
Linus Walleij
