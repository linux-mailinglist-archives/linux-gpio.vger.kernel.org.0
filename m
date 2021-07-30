Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC233DB5FA
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 11:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238171AbhG3JdA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 05:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238280AbhG3Jc7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 05:32:59 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A774C061796;
        Fri, 30 Jul 2021 02:32:54 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id nh14so2586372pjb.2;
        Fri, 30 Jul 2021 02:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NkMpSeNl2IIAYITgWu/3gdQOZYu+llfh7Hm/THeDEn8=;
        b=R6E41MdYeWRaXF71KtkqnJCLuJmRjQRvf7z76LbAprLeyf8ejBVdKuKb6RqD/RoZng
         TJC3z7c7eHdRl9sdP5HrQgLihsTaCJGo+mXlSoKsEfUPedbogUvEwZZgiWjRcYC04nu7
         x0fh7+bt8AspwKJdeabb77oNOxzXvPTUApi9VhsKV53t3mDe2EjtdEaD38kpwRn/iG54
         8pvpZqSHVo1R2K7kKIkCEHidQf2E0SZE7A1K35ogsNZrCKm/7BoN5AzIqC8oTLgyKq7t
         oswG0SiPSL0YM2qapmfO8ApbCtYlwVVjAsbuigR7UIeEBtM8d9DRhjt9djSdMor+ntLt
         dMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NkMpSeNl2IIAYITgWu/3gdQOZYu+llfh7Hm/THeDEn8=;
        b=ehbTQvxCinr/Rsvdd5fHlTYWyAkIdzRXne6Qi0HImy5ekMwrvTfKNglnGHEWky6uT6
         VxpGxHwHiJnpqmRXkB/7l3DjyQzmshkXaUbchUFtIZTVuY88D4iB0lDvAZMTU9puspV6
         /+ISVWeuwSnvE2XJePeyGTD2bNbUtF+mfxp5flk8F3vdIVyZdAxcZxTJOegquX0k17Y8
         EwrRYerGF1SD8KJJ2z0HSToL13lNhNkv2+5Bv9YJvGPqGKIOLNJs+Sa8kn9OPbBxiM1s
         XGiKs+D+yAe0EzA+9C/WeumHW0JbiGJI8VvXtYcaZWlMMyrlVy7//7HITI2JQ3lp4VIC
         FaTw==
X-Gm-Message-State: AOAM532kgFCv+7uUqBQNBm+s8TbmDCrxvtHhP00JvX/jO3YFGXOlZZsc
        Fek7k//GzPmHOR3lnYZqbksyapU6yr6z+1uIs4A=
X-Google-Smtp-Source: ABdhPJyXZiiDxSm+YSPcle5KK7JeOB9Z+/ukby8RCJqsZf0zPCQgGZr6JZ1cwDhy5cn5iQ9dRBGPl5FYQWV8/CYrHVw=
X-Received: by 2002:a17:90a:af90:: with SMTP id w16mr2258627pjq.129.1627637573852;
 Fri, 30 Jul 2021 02:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210716162724.26047-1-lakshmi.sowjanya.d@intel.com>
 <20210716162724.26047-3-lakshmi.sowjanya.d@intel.com> <CACRpkdbv77hjJ91h3fuLSYbpT+Yxd4X8_S7F+NsUw+QsKXN3Ww@mail.gmail.com>
In-Reply-To: <CACRpkdbv77hjJ91h3fuLSYbpT+Yxd4X8_S7F+NsUw+QsKXN3Ww@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jul 2021 12:32:13 +0300
Message-ID: <CAHp75VdZ2_Hd66FoB5W_p0WCy8Hvx7ypz5K9iVAv22mnjE+jCQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pinctrl: Add Intel Keem Bay pinctrl driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 12:14 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jul 16, 2021 at 6:27 PM <lakshmi.sowjanya.d@intel.com> wrote:
>
> > +       /*
> > +        * Each Interrupt line can be shared by up to 4 GPIO pins. Enable bit
> > +        * and input values were checked to identify the source of the
> > +        * Interrupt. The checked enable bit positions are 7, 15, 23 and 31.
> > +        */
> > +       for_each_set_clump8(bit, clump, &reg, BITS_PER_TYPE(typeof(reg))) {
> > +               pin = clump & ~KEEMBAY_GPIO_IRQ_ENABLE;
> > +               val = keembay_read_pin(kpc->base0 + KEEMBAY_GPIO_DATA_IN, pin);
> > +               kmb_irq = irq_linear_revmap(gc->irq.domain, pin);
> > +
> > +               /* Checks if the interrupt is enabled */
> > +               if (val && (clump & KEEMBAY_GPIO_IRQ_ENABLE))
> > +                       generic_handle_irq(kmb_irq);
> > +       }
>
> Aha there it is. "Half-hierarchical" with one IRQ handling 4 lines.
>
> OK we can't do any better than this so this and the bindings
> look fine.
>
> I need to know how Andy think about merging,

Linus, unfortunately I can fulfil a detailed review (busy with a
critical task not related to this platform anyway), but this version
is more or less okay to merge. We may adjust it with follow up fixes
if needed.

>  and then there is
> an uninitialized ret in the mail from Dan Carpenter look into that
> too.
>
> In any case with minor nits fixed:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>


-- 
With Best Regards,
Andy Shevchenko
