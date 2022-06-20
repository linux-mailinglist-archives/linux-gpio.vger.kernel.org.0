Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B2855103C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jun 2022 08:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237715AbiFTGWI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jun 2022 02:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiFTGWH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jun 2022 02:22:07 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE77BE35;
        Sun, 19 Jun 2022 23:22:06 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id p31so14638957qvp.5;
        Sun, 19 Jun 2022 23:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PqAAsyoR2hqTfDaeiLZ9jW+ibsOAA2hb4ZYV7HENcbE=;
        b=hqPCT6eNTiDR4LwMdJw/jkfaqj/PS1M0vbTxuOmqvqEHp3Kj1RorGL79zwTqlFNH1R
         HyCpWK0P5EYuifyIV2C0JX7wdMQIM7Fb3TvUJJ5f14SBs879zCxjyhm23MbOOql21iBh
         wmtTO11vlq7HCs+jfQVKvEfu1lfTUy7wdGf2iAFUkMcEknxaxBXeHW0GUJlvbpQlKV7D
         5dFGubjiieqanLJboIxgtf45dU/xSBUYjJmRjQPqKeG5kFGb1AhzQ0ddXD3EZl4k7tJb
         /43MUV8XSOUmwjTyLMT6hvTt0ytPlHVgYoxFvK3OLgbTiTQb4DIXY8PtG1wMqQuAa91I
         P4xA==
X-Gm-Message-State: AJIora/ekP6zBHQfzgH3rWL5uNzo1F/t4arefMMifdv5fjNL9uaD4SS5
        BghVWhdlu+lWuC5jmQkD3SePVgcqL0yNOQ==
X-Google-Smtp-Source: AGRyM1uq1vYoG2dI8yHVz53CIf+87pnRRQYrNA+FcrZW4Jmuxb7g7RTwX2xW4CHSRTSymO8ILysABA==
X-Received: by 2002:a05:6214:cce:b0:470:44e8:b7eb with SMTP id 14-20020a0562140cce00b0047044e8b7ebmr2675554qvx.105.1655706125238;
        Sun, 19 Jun 2022 23:22:05 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id b7-20020ac86787000000b002f93be3ccfdsm9927895qtp.18.2022.06.19.23.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 23:22:04 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id x38so17204248ybd.9;
        Sun, 19 Jun 2022 23:22:04 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr24796335ybh.36.1655706124351; Sun, 19
 Jun 2022 23:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
 <87zgifkcqa.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdWU31FB90yn1MTSUyF4bfSEXnpaO2-tkXNXNQs8SPwWCg@mail.gmail.com>
 <87sfo0mbl6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sfo0mbl6.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Jun 2022 08:21:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUagrtv4C5+pBQ0kdkLhNPh5Qu6htV9JOrvjdNdjykiw@mail.gmail.com>
Message-ID: <CAMuHMdVUagrtv4C5+pBQ0kdkLhNPh5Qu6htV9JOrvjdNdjykiw@mail.gmail.com>
Subject: Re: [PATCH v3 03/21] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
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

On Mon, Jun 20, 2022 at 2:18 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > +       /* IP0SR8 */
> > > +       PINMUX_IPSR_MSEL(IP0SR8_3_0,    SCL0,                   SEL_SCL0_0),
> > > +       PINMUX_IPSR_MSEL(IP0SR8_7_4,    SDA0,                   SEL_SDA0_0),
> >
> > These are definitely still wrong, and not fixed by any of your
> > subsequent patches: to enable I2C0 functionality, the corresponding
> > SEL_{SCL,SDA}0 bit should be set to 1, not 0.
> > Same for I2C[1-5] below.
>
> There was such patch, and this patch series merged it.

I don't see such a patch in this series?

> Now I'm asking why the patch was needed.

Sorry, I don't understand.

> I will fix and re-post v4.
>
> But, 1 things. As I mentioned before, I want to keep original patch as much as possible,
> even though it has bug (missing pins, having unnecessary settings).
> In other words, the difference from original patch is only cleanup:ed.
> I will keep current style on v4, too.

OK.

> About suffix, I'm asking it to Doc team.

Thank you!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
