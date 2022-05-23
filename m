Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD1F9530AAB
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 10:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbiEWH2w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 03:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbiEWH14 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 03:27:56 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38FCF1D
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 00:25:20 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id s5so11524174qvo.12
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 00:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d2SMhNXRj0IsWiPhgFiLLDsimj0twoU0280Om0C+Jv0=;
        b=UPU6P+2DOsQod+7gjUdJxUKz9wTfCTZgvRtROi0cXWHEujXTQpXQA+MDkPAffa04Hf
         QcFbrwD8YSppfJ+B9LLgEa93CNNpK+okj9JX5rVnzmZLPNx7gKgdRjBC8tBiZlahLgE8
         Yt/zUibR5lyrWk/t8a5E87fOGtYOmZKpZPvkh+L1v4eXhFsd8q2wOPzJZlh53I7Zwv9B
         MIol0bFG45QbFNIMqn7d0PO9OaEZli5S4tYhsmTJZc3WbYNl5dhrJgUa8GsYvuHP10oy
         3zENw7kM8C0tAk3HOkkaeoIRldGxR/ifV1z+/CsTWKVjlpUXaKucM8YHEP/0obdmxlm9
         lJoQ==
X-Gm-Message-State: AOAM533oTUup77Qe8NMug1L23OqDvT8cQMvOO8aYTPCfvyB/b4SEVu4o
        EAiFcVdAJXtuhdvwQsnb0CDZJFd5d/TYbw==
X-Google-Smtp-Source: ABdhPJzfzLnoR/VFezcr8B4OB+LhE79VB0Jcd6sQzoBRi1ZkolIrZHYm/xoJHICE6MiQNNRSB9aQlQ==
X-Received: by 2002:a05:6214:d81:b0:45a:e07e:6bcb with SMTP id e1-20020a0562140d8100b0045ae07e6bcbmr15517459qve.29.1653290719021;
        Mon, 23 May 2022 00:25:19 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id l7-20020ac80787000000b002f39b99f670sm3887710qth.10.2022.05.23.00.25.18
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 00:25:18 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id i187so21609303ybg.6
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 00:25:18 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr20858877ybb.202.1653290718267; Mon, 23
 May 2022 00:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
 <CAMRc=Mdf_PHyC3doO4KfzeTJz+WT2VZE6pxADOxz3_Sy9jPGqA@mail.gmail.com>
In-Reply-To: <CAMRc=Mdf_PHyC3doO4KfzeTJz+WT2VZE6pxADOxz3_Sy9jPGqA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 May 2022 09:25:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXe2v8Tamyz6-xhFfoc7X-x9iDk8Rey-PBsdEe9+2-Bgw@mail.gmail.com>
Message-ID: <CAMuHMdXe2v8Tamyz6-xhFfoc7X-x9iDk8Rey-PBsdEe9+2-Bgw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: dwapb: Make the irqchip immutable
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
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

Hi Bartosz,

On Sun, May 22, 2022 at 10:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Fri, May 20, 2022 at 12:23 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> > immutable") added a warning to indicate if the gpiolib is altering the
> > internals of irqchips.  Following this change the following warning is
> > now observed for the dwapb driver:
> >
> >     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
> >
> > Fix this by making the irqchip in the dwapb driver immutable.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Against gpio/for-next.
> > Boot-tested on SiPEED MAiXBiT (Canaan K210).
> >
> > v2:
> >   - Factor out hwirq using preferred helper.

> I'll pick those patches up for the next cycle to let them spend some
> time in next.

"next cycle" = later PR for v5.19, I hope?
If the new warning will make it into v5.19-rc1 (commit 6c846d026d490b23
is in gpio/for-next), I think you should collect all fixes and make
sure they end up in v5.19, too.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
