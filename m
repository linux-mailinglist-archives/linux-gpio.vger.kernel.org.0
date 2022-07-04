Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB379565A28
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234575AbiGDPnx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbiGDPnT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:43:19 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEDE11819;
        Mon,  4 Jul 2022 08:43:01 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id v6so7029013qkh.2;
        Mon, 04 Jul 2022 08:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EdaiclKxx119XPlQAdki18st+7KwCFV3e2UkWfqJmik=;
        b=ULCRxBxTR0YhLRMagZ41pmPNn8aPsTPZd8K/LTO9jDTHlyH4UWJ//CNssmMjnamkTo
         nIXZAnMU5LmAeYMmRsONfTKYth/6XKNPneB8oBj4gQsA5tCX5LQ3mtyAOnzd4c919frb
         ob63eQhD2Hfp2XPNzstzNO5624D8zCI1qBD+BnMR0coGemSFIQbPezeke4/stcv4RCIR
         GIwVBMp2I+siY77c4Y6+ZbXX4PDZk1hO/vWX0sHnadHH/xHs++SnbCWEzfhlnztTMci4
         vSXJ281EvfXXZq9TNgEvkuYzxaHWNShfYxamhP7d0QwJZaCPxNdrGciDvDg29OJQK3p1
         ZEHQ==
X-Gm-Message-State: AJIora+PYhb2XgKKP1x+FH5hCEo6fW0ipzd0cdYDniKftulliLzLZE+g
        v61Ibv98+afrvdjVRlbBOXqHNeO/TwrT9uel
X-Google-Smtp-Source: AGRyM1u2GpCFM26OXHneElDcTXxqYUqnl4RitRU4uyteRBzfhiRgTrwEEmmdRAfXqI5NEyIDgQf59g==
X-Received: by 2002:a05:620a:1a9b:b0:6a6:d3f6:5c97 with SMTP id bl27-20020a05620a1a9b00b006a6d3f65c97mr20443153qkb.225.1656949380648;
        Mon, 04 Jul 2022 08:43:00 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id i13-20020a05622a08cd00b00317ccf991a3sm324760qte.19.2022.07.04.08.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:43:00 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id r3so17522473ybr.6;
        Mon, 04 Jul 2022 08:43:00 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr31234786ybr.380.1656949380149; Mon, 04
 Jul 2022 08:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <878rpdtxz8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878rpdtxz8.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:42:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWixDrYNcxZvuG_T6o5Zdnh=GoJ9_OOfv=kEbRiAO=29A@mail.gmail.com>
Message-ID: <CAMuHMdWixDrYNcxZvuG_T6o5Zdnh=GoJ9_OOfv=kEbRiAO=29A@mail.gmail.com>
Subject: Re: [PATCH v4 06/23] pinctrl: renesas: r8a779g0: remove not used NOGP definitions
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
> Current V4H PFC code has many NOGP definitions. But these are not used,
> and it is different from original usage. This patch removes these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
