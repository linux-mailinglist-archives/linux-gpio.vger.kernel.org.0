Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5D73501F4
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 16:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235630AbhCaOLR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 10:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235974AbhCaOK4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 10:10:56 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF740C061574;
        Wed, 31 Mar 2021 07:10:55 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso1305735pjh.2;
        Wed, 31 Mar 2021 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=92979ybVXNYMlrTlPGO1DwRC1dKfc7x85Z0GpQ4z59g=;
        b=RlNn8dktBpHxqBPMOLCZvljcIxHrWMLCdq5wxfRawiaqitRGLf3gtyOcGrKM8sXs8G
         euuWg04R56VIguIf/2tIOCjQesZb65VHxJd8pxk6ZVvWjAdPbj01xBArXxmERigIfw3s
         U7FEag+biSTKjC9kgQaY/PGmruXIo3LZUOSfaG3nsjllk5JLL5jaLBpEKEVw3TdptUWN
         SRlVUcxoo1O4skSkDM+9/dZKJ1d82xtqgPsJHKopW87jmpIfypKx8ERiI+8pHHKt3v7k
         /T4kXIpeJCrs6Cufk3ofSa5RZ7LBDq0vmA8QxhClKBQFeO6sEr5CftwHZM6SgcbhO4nl
         u1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=92979ybVXNYMlrTlPGO1DwRC1dKfc7x85Z0GpQ4z59g=;
        b=jaF8Gxxoa5LuNHGicNr0iP/7BX8rMElS7x1/ZHxgmdlh9o3AGyOcpKyWNNZBD/o51t
         6VPMgpFfoaYTNRRZQL2IsZ5/ZYTh+Wjoa+fBVVZRM7oOuLEqplEBElPgIxfjOvs9B81B
         fLiCsPiBLcKHBAtBkiYoyF5qZ2l3NwPlg75L4YZ+O2GX+qVFAKPF27wBiBznRqC7Gso7
         aLO85IBCZqEbtUx1KZ14CkMLxkKY0T+jeMn/RwF94jBVealV8w7+rqy0T5Kl/cJJYxXz
         sunI9mLDT1tNdkdT2Q95s4DUdLRBfQaRjul3ERNLXJtsHkM2v7jQAqs0HfXCkYTMpIJH
         Oskw==
X-Gm-Message-State: AOAM533HrfbgW6ZHrNroXazBT/KBfi9P1N7WiuaYdIG1S1o6I7iDTqa9
        /Ww6yfChCXVLfyrfh3VdyXFnKuzpMq+Igv3Fb1s=
X-Google-Smtp-Source: ABdhPJwFEPTZ2hE7S2FzBTsmnnB81r/mt7SCkiqukFIVnHD73GkwHBZoekE6PYP+9rc6jOV59VlfPLIISUkv/1m2Pyw=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr3803714pjx.181.1617199855458;
 Wed, 31 Mar 2021 07:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <f38e80b6b439e4a9cc349a090923207865b3d3ed.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <CAHp75VeCGHUBtfZ7b+m7eA01KukWkL0n01kmv-Q00m9+6FTWQg@mail.gmail.com> <5e80dc9aeddd46d837e1c317a008e237bf0b4f8f.camel@ew.tq-group.com>
In-Reply-To: <5e80dc9aeddd46d837e1c317a008e237bf0b4f8f.camel@ew.tq-group.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 17:10:39 +0300
Message-ID: <CAHp75VcMCWgNz8b7vsOL2qABkuxrZrQFkBX2gpias8tA3Q-7Pw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mfd: tqmx86: clear GPIO IRQ resource when no IRQ is set
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 4:24 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
> On Wed, 2021-03-31 at 15:35 +0300, Andy Shevchenko wrote:
> > On Wed, Mar 31, 2021 at 2:39 PM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:

...

> > > +               tqmx_gpio_resources[0].flags = 0;
> >
> > Please set IORESOURCE_DISABLED flag in the initial structure instead.
>
> Is there any documentation for the correct usage of this flag? I think
> I tried IORESOURCE_DISABLED originally, but it didn't have any effect
> (platform_get_irq() ignored the flag and returned the resource
> anyways). I might misremember though, I originally wrote the series
> some time ago.

It seems this flag is used solely for ACPI / PNP resources...
Hmm... I dunno how platorm_get_irq*() should respect this flag. You
see, that in the ACPI branch it has been checked there.

-- 
With Best Regards,
Andy Shevchenko
