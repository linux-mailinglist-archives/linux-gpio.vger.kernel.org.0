Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE69561651
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 11:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbiF3Ja3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 05:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbiF3Ja2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 05:30:28 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6232742A2E;
        Thu, 30 Jun 2022 02:30:27 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id z12so13980860qki.3;
        Thu, 30 Jun 2022 02:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6BJN1o0XCl+AHkHautQCEY9+urMd+KrIU7lisv0kZQ=;
        b=xJvc8QG/b1XR3tOtr2KhSjmRNRE+N97k45ATwhsx8p+B3MMy4S/bEhaa2WwYLbQMcZ
         I3G8u1AxmlGMtIQihZ9Gs0kPXanfapCBedv0CRBGXLteSONlQjde2WYH5fhMCN1c4FZg
         sZBVFOCa/cwPWJvYKh2WfmIULa3VTEEgqOJznfMNRZtL4BXMNjVRcfamvJFq826+pbKs
         Q0TPAW1Vkb/WEInjf5BaafUwy/VASGyr16CWEpogwh8Qa3mVf7GoZqjGRCqf/VmcfsvA
         DtkIXxeNiFXQKVuQILKB1JKetL4YVwlB3M1bTHk1LKgvitN+2lWUa9bLAJ7pb7AXCjZY
         L2iA==
X-Gm-Message-State: AJIora+6x93s6S0rGE6ARnHj7Uf7ZigoFOcL4miD7C7y8Je8XOXeddj3
        quvxGu8yVFw9Rpqxo8vwSKTioVMTpefINg==
X-Google-Smtp-Source: AGRyM1uPqcg24gYvtmjh2V/U4ii2ZPdds8REcwFem6k0vDWLhwRI9qMCwCm4VRezqK68nhPCMNY+iw==
X-Received: by 2002:a37:a296:0:b0:6af:6dba:b75c with SMTP id l144-20020a37a296000000b006af6dbab75cmr5340689qke.257.1656581426418;
        Thu, 30 Jun 2022 02:30:26 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id bq30-20020a05620a469e00b006a785ba0c25sm5030873qkb.77.2022.06.30.02.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 02:30:25 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2ef5380669cso172937577b3.9;
        Thu, 30 Jun 2022 02:30:25 -0700 (PDT)
X-Received: by 2002:a81:74c5:0:b0:31b:ca4b:4bc4 with SMTP id
 p188-20020a8174c5000000b0031bca4b4bc4mr9289258ywc.358.1656581425592; Thu, 30
 Jun 2022 02:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
 <87r13rkcos.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVVPN-dhnjw1y7WqQJjZNO-YG8PjaFjmCvawMAhZJJLsA@mail.gmail.com>
 <87r138jm3r.wl-kuninori.morimoto.gx@renesas.com> <87k090ji9t.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdWPWzhBoDeTR-ueS9Y9sBVWx_zUAM+6b168Tb8LYcGxcg@mail.gmail.com> <87y1xf59eq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y1xf59eq.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Jun 2022 11:30:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0WwW=dxVKhDAc55Erra2qYwoVgmw5hvY4rjt+468e7w@mail.gmail.com>
Message-ID: <CAMuHMdW0WwW=dxVKhDAc55Erra2qYwoVgmw5hvY4rjt+468e7w@mail.gmail.com>
Subject: Re: [PATCH v3 09/21] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
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

Hi Morimoto-san,

On Thu, Jun 30, 2022 at 1:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > My worry is not about the group of pins marked _X, but about its
> > siblings without _X.  E.g. your patches have SCIF1 and SCIF1_X,
> > but we do not know yet if SCIF1 should be renamed, too.
>
> Yes.
>
> > I agree it is unlikely to become an issue with TCLK soon, but (H)SCIF1
> > are more likely to become enabled, also on real products.
>
> Yeah.
>
> But *current* product (White Hawk) is using (H)SCIF0 which doesn't
> have rename issue. I think we don't need to super care about not
> used SCIF for now (?), at least it is following *current* latest datasheet.
>
> If you can accept about it, I will post v4 patch-set soon,
> and will post naming update patch when new datasheet coming.
>
> If you can't, I will wait new datasheet, and post v4 patch-set
> which is including naming update.
>
> But one note here is that we don't know when the new datasheet will comming,
> and we don't know it solves all naming issue and/or there will be no more naming issue.

OK, then please continue.
But perhaps add a comment to the SH_PFC_PIN_GROUP() definitions,
to make it clear they are preliminary?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
