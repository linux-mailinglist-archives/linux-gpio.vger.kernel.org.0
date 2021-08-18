Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EC03F0236
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 13:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbhHRLF2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 07:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235386AbhHRLFZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Aug 2021 07:05:25 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A7FC061764;
        Wed, 18 Aug 2021 04:04:50 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id o2so1862182pgr.9;
        Wed, 18 Aug 2021 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hHEvx+DciMHPaAAUI2b26GpkXwkLrmJnNJKWZvAtgjM=;
        b=YxKXP5uIO/hVvmKzVkjT1jy0g2WvBdrpaBeuRN3+4jOpQT6bb0f0fkLYFh6xPvKnt7
         KnDuFSzJ3Ics2n9d4Sgff61DnrePBeNTyV7ICxalbr2x8F/HdPkNbTc0JJCG2xpoxWVe
         FC+Fpk5FwnzYmgL+wbSjcgfVIR2bko8lIahrCQbw8GI1fbfIqQ3H7GFpnelJ3davWiX7
         u8RlHktDowYtkqN7n3Qr8SFl3w8PxtuVc5+F4Qdm8m9N/vjKllX09Y8ZalHZ4M1vtGaA
         /OogFh3kybxpKVUvFLb9L71Epr6MUYZBf/AEPFU06PlVUxU3XK0248/vC6W+15rJGiIs
         eWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hHEvx+DciMHPaAAUI2b26GpkXwkLrmJnNJKWZvAtgjM=;
        b=MtRK6ScdmEa7pY/pwmGaTN1/oHktf1rMGSvKvOmlN0eFtnd4sWqNqkHd5WJjizJ4Z4
         J7NCRoMgotR3ryE7KbpURhgytl5ktb2AwD2QwrWV00kuql2F/jH2TqNh8u6TKlPfgykI
         FK3g+v23Qyv2bcDeQyH+O05YUm5uUPWpTOxhE5v01EVTTi6yvAAs+eeT3rccxwFVlDEH
         9ADIaUaQmAqeqlxJteuwDAbFpeGug02foaZfSmllmzITsjtZzm1HNjW7rBmIUN4ICWgD
         ePYTiI25SZjx/e/232fxx6o3P67tfJ3btcaUaLohLUUIKqKiIo0xBK3swisgyqE9qQRb
         M/fA==
X-Gm-Message-State: AOAM530DSQRSS8HsZjyDX3D7uWRWLQGp/irM/ycPV2fjOZCJgwa38uy5
        AcFP7kqiLRc9WI3IUuM2lUZ8qTw1rITvriXlanESTleIGPKO8CSu
X-Google-Smtp-Source: ABdhPJyDM3deYwulB1E7i7DzepL/aFCXVmBefbjTPmKuIiciuythubudmIhM31+pCJus6GglBQy7Yt5jMSMKTzjeAS8=
X-Received: by 2002:a05:6a00:d41:b0:3e1:3316:2ef with SMTP id
 n1-20020a056a000d4100b003e1331602efmr8914223pfv.40.1629284689900; Wed, 18 Aug
 2021 04:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
 <YRpihHP3kDz5nYV9@google.com> <CAHp75VdcWsNFervoU7e4_m7qVKAnWXzF2z2mUgKg06-qmwn-2A@mail.gmail.com>
 <YRppKOxp4Jya5iEI@google.com> <YRpva4gS1LfncPUj@smile.fi.intel.com>
 <YRpz5UEDQbpewq5o@google.com> <CAHp75VczCKwNQE8k6_e9Trk0qkD2EumFVxxG5w2BTYhiOTDUzA@mail.gmail.com>
 <YRtkt8e25ZSeOICx@google.com> <CAHp75Ve-24wno-z8rQSCtgBdf6_a70TFf3aCJPP7JSFPG8sfhg@mail.gmail.com>
 <YRyp3x14ziGYlOAx@google.com>
In-Reply-To: <YRyp3x14ziGYlOAx@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 18 Aug 2021 14:04:13 +0300
Message-ID: <CAHp75VcJ481AhPi=DPE-OpwQNZKqCpVpNbyP7WSj-_05EoDaUQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 18, 2021 at 9:34 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 17 Aug 2021, Andy Shevchenko wrote:
>
> > On Tue, Aug 17, 2021 at 10:26 AM Lee Jones <lee.jones@linaro.org> wrote=
:
> > > On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> > > > On Mon, Aug 16, 2021 at 5:19 PM Lee Jones <lee.jones@linaro.org> wr=
ote:
> > > > > On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > > > > > Would it be okay for you to pull the immutable tag?
> > > > > > >
> > > > > > > What immutable tag?
> > > > > >
> > > > > > It's here:
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio=
-intel.git/tag/?h=3Dintel-gpio-v5.15-1
> > > > >
> > > > > My Ack can't be merged like that.
> > > >
> > > > Which one? There are two on different patches.
> > >
> > > The one that I specifically said was "for my own reference".
> > >
> > > > Do you have any documentation on the rules you imply by MFD?
> > >
> > > No, the documentation is provided with the tag.
> >
> > I see.
> >
> > So, what is the recommended solution?
>
> I planned to take the patch.
>
> I'm also happy to take the set, if they are interdependent.
>
> What is the reason the MFD patch doesn't apply to my tree?

What I did right now:

$ git checkout -b test-mfd-merge mfd/for-mfd-next
Updating files: 100% (8674/8674), done.
Branch 'test-mfd-merge' set up to track remote branch 'for-mfd-next' from '=
mfd'.
Switched to a new branch 'test-mfd-merge'

$ b4 am 20210726125436.58685-2-andriy.shevchenko@linux.intel.com
Looking up https://lore.kernel.org/r/20210726125436.58685-2-andriy.shevchen=
ko%40linux.intel.com
Grabbing thread from lore.kernel.org/linux-gpio
Analyzing 28 messages in the thread
---
Writing ./20210726_andriy_shevchenko_gpio_dwapb_unify_acpi_enumeration_chec=
ks_in_get_irq_and_configure_irqs.mbx
  [PATCH v1 1/4] gpio: dwapb: Unify ACPI enumeration checks in
get_irq() and configure_irqs()
    + Acked-by: Lee Jones <lee.jones@linaro.org> (=E2=9C=93 DKIM/linaro.org=
)
    + Acked-by: Serge Semin <fancer.lancer@gmail.com> (=E2=9C=93 DKIM/gmail=
.com)
    + Tested-by: Serge Semin <fancer.lancer@gmail.com> (=E2=9C=93 DKIM/gmai=
l.com)
  [PATCH v1 2/4] gpio: dwapb: Read GPIO base from gpio-base property
  [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use software no=
des
    + Reviewed-by: Linus Walleij <linus.walleij@linaro.org> (=E2=9C=93 DKIM=
/linaro.org)
  [PATCH v1 4/4] gpio: dwapb: Get rid of legacy platform data
    + Acked-by: Serge Semin <fancer.lancer@gmail.com> (=E2=9C=93 DKIM/gmail=
.com)
    + Tested-by: Serge Semin <fancer.lancer@gmail.com> (=E2=9C=93 DKIM/gmai=
l.com)
---
Total patches: 4
---
 Link: https://lore.kernel.org/r/20210726125436.58685-1-andriy.shevchenko@l=
inux.intel.com
 Base: not found (applies clean to current tree)
       git am ./20210726_andriy_shevchenko_gpio_dwapb_unify_acpi_enumeratio=
n_checks_in_get_irq_and_configure_irqs.mbx

$ git am ./20210726_andriy_shevchenko_gpio_dwapb_unify_acpi_enumeration_che=
cks_in_get_irq_and_configure_irqs.mbx
Applying: gpio: dwapb: Unify ACPI enumeration checks in get_irq() and
configure_irqs()
Applying: gpio: dwapb: Read GPIO base from gpio-base property
Applying: mfd: intel_quark_i2c_gpio: Convert GPIO to use software nodes
Applying: gpio: dwapb: Get rid of legacy platform data

### here we need to rebase and add your tag

No conflicts, no nothing with your current _published_ for-mfd-next.
Do you have local changes that have not been yet visible?

Alternatively you may pull the tag I have.

--=20
With Best Regards,
Andy Shevchenko
