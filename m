Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C896565A0E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232889AbiGDPmG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbiGDPmF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:42:05 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2813B10564;
        Mon,  4 Jul 2022 08:42:04 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id z7so7002846qko.8;
        Mon, 04 Jul 2022 08:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g0np9mcwj88HncKahzYJ1V1VMPq3Zddj+FBdcmhVTvk=;
        b=LW7wgrYHnRn10r9oi3J19K3aFTIAckBcBSeGsMiSNxJt96L4wFbqfj765FpTpfLi6g
         LnNvM+aOCVaolCODXfcXc2Gvg1Szj1a+31Z9Kl8LDcK2L0n09Z12gBHxqwaubbdNxwHe
         LlTYMFCTo1MMjR/5YrE8wgUQZrhv8pxpW+lVxleq4NLWop1FHjuDMVD6dYgBk8sfhs5/
         QnMQj3KvAJ17oJxm8/MK8g863hrBGSpiwn/g8MnsK+mAo6E+Thx80TscW+9hbU8prrQp
         fm8ohyT+m1eobVnaJN67TIjOfIieROVEmjEf3OBaMhP1FJMOHP6EZUcI+wXn/Zk900zJ
         gL0Q==
X-Gm-Message-State: AJIora8QckCiNqsjD7K8kXJnQC7JcTz3UW/94drQC5cY8fW3uaby7b+N
        UeaD1nErh8nIT/hIOeX/gCxRvBbvG/2NWkOM
X-Google-Smtp-Source: AGRyM1u3iDf7ObGlzS0k85aWyCaVkjr9JFafljuYXBCSMStRmDs+cKF3YuDdYvEtm+gkJGj92OwQ1A==
X-Received: by 2002:ae9:f816:0:b0:6af:ebb0:4f3f with SMTP id x22-20020ae9f816000000b006afebb04f3fmr20716961qkh.107.1656949323134;
        Mon, 04 Jul 2022 08:42:03 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a151300b006a91da2fc8dsm25338503qkk.0.2022.07.04.08.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:42:02 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id i7so17487736ybe.11;
        Mon, 04 Jul 2022 08:42:02 -0700 (PDT)
X-Received: by 2002:a25:be49:0:b0:64a:2089:f487 with SMTP id
 d9-20020a25be49000000b0064a2089f487mr17802221ybm.202.1656949322572; Mon, 04
 Jul 2022 08:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87czepty0j.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87czepty0j.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:41:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWd51CkEaho0EYz9HmyDE-7EpQdLmXK7g9OojCfdtTMA@mail.gmail.com>
Message-ID: <CAMuHMdWWd51CkEaho0EYz9HmyDE-7EpQdLmXK7g9OojCfdtTMA@mail.gmail.com>
Subject: Re: [PATCH v4 03/23] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 1, 2022 at 3:36 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: LUU HOAI <hoai.luu.ub@renesas.com>
>
> This patch adds initial pinctrl support for the R8A779G0 (V4H) SoC,
> including bias, drive strength and voltage control.
>
> [This patch was created based on Rev.0.51 datasheet]
> [Morimoto merged Kihara-san's MODSEL8 fixup patch,
>  cleanuped white space, care reserved bit on each configs,
>  fixup comments, etc]
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
