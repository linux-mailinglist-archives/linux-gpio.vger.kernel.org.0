Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6C6565A2F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234599AbiGDPoT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234593AbiGDPoF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:05 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7862A5F98;
        Mon,  4 Jul 2022 08:43:25 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id g14so10323385qto.9;
        Mon, 04 Jul 2022 08:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1F1tdtFTyCob2cQK79/gBLYO6K5QhYTGSMOfytlvsFM=;
        b=FarjNOYGlSCUH8xL/Dk9GcY58iHBGy/9Lskz+ltxwPoOCOBLOpao5qT4FhJynbmkVO
         nsx8R67vbOgfh9hwCFhhDsFA+UCtNDdJrasIzd1jqfkeHCcmTS2GsbE5vicf/uOvRdfd
         P0dvp5CnDBahyDfzH5V1oSbcqGV3QdqWbl0PaiZQNJb7wlauJL93NyGiIYbs/5sswJtg
         /h9/kCz22E9nu2+1IviIs0uPzgzNRZA/Ec+bM2V/PKM4giM0ys5RIY2I9UPC4Ed9HBlZ
         jVwdl7yLSzsK794FaGBuxugp4slBlvLXGTBDvC/4fPLgfBVtgqqYYDKLt+R+6tqEXzDo
         yFTw==
X-Gm-Message-State: AJIora+aBMnNOxK7uYiybyXmoSQoiLAo2oTSJkWze1Zb8EqQJxuhQW9V
        JEwMH2a8YOi2aoQ0lN3fbJXo9LrXJ47MZyBP
X-Google-Smtp-Source: AGRyM1szJxMJnJGeBJCsPd0aXzN/f45Ndwg7zrEDl9bsV8NJwvl5iqAt8wnfq/XCT2YFePQbSOJLvg==
X-Received: by 2002:a05:6214:d6d:b0:470:4f0a:fad4 with SMTP id 13-20020a0562140d6d00b004704f0afad4mr27938759qvs.5.1656949404256;
        Mon, 04 Jul 2022 08:43:24 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id k20-20020a05620a07f400b006a6ab259261sm22617610qkk.29.2022.07.04.08.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:43:24 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-31c8340a6f7so44702897b3.4;
        Mon, 04 Jul 2022 08:43:23 -0700 (PDT)
X-Received: by 2002:a81:98d:0:b0:31c:921c:9783 with SMTP id
 135-20020a81098d000000b0031c921c9783mr7766032ywj.316.1656949403687; Mon, 04
 Jul 2022 08:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <875ykhtxym.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875ykhtxym.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:43:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMb1AHpQTM3H-sU72FRHdnVnwB_KdSwQFjmz+NG+VJxQ@mail.gmail.com>
Message-ID: <CAMuHMdWMb1AHpQTM3H-sU72FRHdnVnwB_KdSwQFjmz+NG+VJxQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/23] pinctrl: renesas: r8a779g0: remove not used
 MOD_SELx definitions
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

On Fri, Jul 1, 2022 at 3:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current V4H PFC code has many MOD_SELx definitions with all 0.
> But these have no meaning. This patch removes these.
>
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
