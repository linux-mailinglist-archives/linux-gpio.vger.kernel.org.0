Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E777254FA04
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236148AbiFQPRi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382514AbiFQPRh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:17:37 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D6C25CA;
        Fri, 17 Jun 2022 08:17:36 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id cu16so6264910qvb.7;
        Fri, 17 Jun 2022 08:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LCJR5ZfbTPPDEpdS+K51zKJT/JWSBt5REGbqYDkd3ns=;
        b=s8Uylzb5eRvyQJ1/Ar80qQPzSg9mhZl5NzWtBLSnL6GhkzTW/NRVRfW2lF80oq9TaW
         7lzK5A8hSdGHKSQVJweeukxnlHfVqiZlSaqJdJ+InRIYpYG87TqYQoMFgThhZPVRwSp+
         h6SFt6A+fNF7jeSe1T8RoIhNUMzcN1nln27WqKitkEbNH2Ne1vy5trBPolUFr5TfMQM0
         EwvWcqOJKe/hxTOcl3kr2IYR+JHlSnnnFjlQS9h7pIknGGIg2XJDX6//PRNs9I1RXXr4
         l4aO1bXVlWmtuaaax7nSMSZx8KOsN+0yJjHRg8xl/NwyFUbgo/7Z+YMxPr55m/rH9hfU
         2/ug==
X-Gm-Message-State: AJIora/NCPEedABuZ7R9xbPQaYmO+U9Hf+POB0XidQQkit3In4kQw5Hh
        vZVWKe7ZHDiFtqyXvKW+0a1oe3v/opAytA==
X-Google-Smtp-Source: AGRyM1t6QpjYunWxZXx1SBb6JfLWRKop8TUaFIDmI5a49yV2OqQ5zfmkF2iweqKLJHfhS3scpATKDA==
X-Received: by 2002:a05:6214:2a4d:b0:464:54e8:5c7f with SMTP id jf13-20020a0562142a4d00b0046454e85c7fmr8839224qvb.124.1655479055511;
        Fri, 17 Jun 2022 08:17:35 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id e7-20020a05620a014700b006a66f3d3708sm4252617qkn.129.2022.06.17.08.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:17:35 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-317710edb9dso45684497b3.0;
        Fri, 17 Jun 2022 08:17:35 -0700 (PDT)
X-Received: by 2002:a81:6157:0:b0:30c:7e4d:b28e with SMTP id
 v84-20020a816157000000b0030c7e4db28emr11911530ywb.502.1655479054895; Fri, 17
 Jun 2022 08:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87tu8nkcp7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tu8nkcp7.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:17:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVV6z-nCTvJyG_TV3Dj65QU8K=x85JAKDStQVnP3edO3w@mail.gmail.com>
Message-ID: <CAMuHMdVV6z-nCTvJyG_TV3Dj65QU8K=x85JAKDStQVnP3edO3w@mail.gmail.com>
Subject: Re: [PATCH v3 07/21] pinctrl: renesas: r8a779g0: remove not used
 MOD_SELx definitions
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

Thanks for your patch!

On Tue, Jun 14, 2022 at 7:59 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current V4H PFC code has many MOD_SELx definitions with all 0.
> But these have no meaning. This patch removes these, but keep
> its definition to avoid unreadable PINMUX_MOD_SELS.

You can just replace them with blanks, keeping the structure of the
PINMUX_MOD_SELS table alive.

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Again, as the only net impact of this patch is the removal of several
enums, and a shift in the numbering of later (internal) enums, I think
it is safe to fold this into "[PATCH v3 03/21] pinctrl: renesas:
Initial R8A779G0 (V4H) PFC support".

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
