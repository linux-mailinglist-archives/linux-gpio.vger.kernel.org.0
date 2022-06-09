Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25A7544824
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jun 2022 11:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbiFIJ7L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 05:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242161AbiFIJ7J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 05:59:09 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7C83F3A7E;
        Thu,  9 Jun 2022 02:59:02 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id d128so9499130qkg.8;
        Thu, 09 Jun 2022 02:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pu9kMFwny5yMZZ48KIlBgBB9HGa+C5KyZkUOrVlTnSQ=;
        b=0H8Q7fg5ZrPZyebRU30UefDDhcC2W5yUx63vkyT3KzjtAfj0JUvEuhKa3nu9mgNsJM
         KkhUE0suZjAHVrNPhqKnpzLTDdVc2BKvEj71TVqWj5XBBAa6EFK0+mcjZXMkcdFcb1le
         Rltc4XVtZhsm1WAXPdtyK11quyVFO8d9caXHZHWfrWvjLmoGOxPE7sA2hGfx6RtK70CV
         1cRvEmvDDHQ0yYUPzSpI7XG766TGJAJ3j39X/vQGVw6EeFgXGPLXFmIqzwAqmFl/1VoS
         RTrtvbvwqsnb1MKEaatjXljLiDP3Br1itsz8iFn2MM1+0AII+31imNRT7gAUYwRvolfU
         z7VA==
X-Gm-Message-State: AOAM530FEzQEi5vqkAx0OxdBL2LOglbydLtwyCrJBzMaxxwLlCDDcuSX
        0tLxmhHYZcVeaJar8M4vBUYdFl5yMl/HIg==
X-Google-Smtp-Source: ABdhPJwESWubij1xdw94/3qdcsRV2/47Kpok94PneN6jeElvwG1WpojiBSx63uFY64a+zGoLarNpLQ==
X-Received: by 2002:a05:620a:24d3:b0:6a6:498b:a1a3 with SMTP id m19-20020a05620a24d300b006a6498ba1a3mr25635557qkn.592.1654768741840;
        Thu, 09 Jun 2022 02:59:01 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id z22-20020ac87116000000b00304f7449e17sm5442816qto.93.2022.06.09.02.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 02:59:01 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-30fdbe7467cso200229117b3.1;
        Thu, 09 Jun 2022 02:59:01 -0700 (PDT)
X-Received: by 2002:a81:1dd2:0:b0:30f:a4fc:315e with SMTP id
 d201-20020a811dd2000000b0030fa4fc315emr43833634ywd.383.1654768740871; Thu, 09
 Jun 2022 02:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com> <87wndtgu2o.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wndtgu2o.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 11:58:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWLPcACaBtN8qbZALuChM3JSfvUubS=T8_EHhitQdeyQ@mail.gmail.com>
Message-ID: <CAMuHMdUWLPcACaBtN8qbZALuChM3JSfvUubS=T8_EHhitQdeyQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: renesas: Add PORT_GP_CFG_13 macros
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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

On Tue, Jun 7, 2022 at 3:07 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Add PORT_GP_CFG_13() and PORT_GP_13() helper macros,
> to be used by the r8a779g0 subdriver.
>
> Based on a larger patch in the BSP by LUU HOAI.
>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
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
