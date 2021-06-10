Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBDD3A2EE5
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 17:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhFJPDm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 11:03:42 -0400
Received: from mail-pl1-f171.google.com ([209.85.214.171]:41844 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbhFJPDm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 11:03:42 -0400
Received: by mail-pl1-f171.google.com with SMTP id e1so1157248plh.8;
        Thu, 10 Jun 2021 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0f1gQJhb2ESZNkRLisCIkHB21nhjKUybvwJd9DBU9+4=;
        b=aZZqiDADSlD2TVcfh6IgPoDwdEYVk5A7jeKcRBNLIioWmITd1AMqq//BnkT1DEzAZh
         lyE9FRK0D5zx8IjGQHw+S4V+09WOW1ALVqdmZHuwij6URt0DN2vQaqqWp1nEcA+66Ou4
         fZZu/7KcYfiZjnRHWiplxYhfikTwvQ5TNn+T0HlJGOatcF24OpqkaK1lbfnY0sVGbuJR
         URRPexWgBkkrAELjd/cTuALTB8rVMAmqNJf3iIEZVZC92K25EEOqG/ILys0zqnXgBQVC
         OOI1O8ZnC4+QGg4u8CPYmCdw8ktALBvXvB+mtIbpG4TbRzBwaknKWvfC94YChpjGcY/8
         FCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0f1gQJhb2ESZNkRLisCIkHB21nhjKUybvwJd9DBU9+4=;
        b=AbV/qCbCcF4fsWHEDNh+SbqMK3HU8AOm7HCyOsU9tEiT+vdsPUagbp3Mj+I5Ii1s4+
         cWxwREawIvCJ+QDJ/gCx/3IxR+vWIzix/7+BwYhN2/oS7cu8Swy+JuGKYKdBiEh+5hKz
         N11jlSzJjfosaS3eO4sFRcI3XJi0/5fxqmm84ws6wGDcot2v7VUWcfe4mzpqLe57NXdz
         2QTZalw23hhIaJWqzEWQpQHWDUGyWhwaT2oGKBZu+PtyqycuutGbNQUI+P1oNc11dI4z
         iyme0sTmXdgisU12nMymuG1egklqvUs7lbloJDyNBb811ts5O0wyXsluT/bAuru0jXjO
         IY5A==
X-Gm-Message-State: AOAM531PbB/Dr2sIlcHucSSEucc976uQJHleksWz8LNRV1n/hi0qzKEl
        DEzaaHopAuIh1zYVTO2tw6s3KPuydOixsboPcJ3QtyIMiBA=
X-Google-Smtp-Source: ABdhPJxKXfyS4XQ/mMGE0wLUpwMZjjdHueiYabdCcLIwWifquDf8prFC+cP1AUb2RjVSyUghkK1DWuKHaIvqsC/8ouQ=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr3831371pja.181.1623337245958;
 Thu, 10 Jun 2021 08:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210609062722.9132-1-henning.schild@siemens.com>
 <YMCT+izizEg0gPLD@lahna.fi.intel.com> <CAHp75Vcj9wmM7H908sqGmXs10BQN8ty1C4qfmk_nXpG_s=BjTQ@mail.gmail.com>
 <20210609130816.3631f0aa@md1za8fc.ad001.siemens.net> <YMIgwORlAzz/gJcK@smile.fi.intel.com>
 <YMIijnvoudaodX+A@smile.fi.intel.com> <20210610165632.0d9bb321@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210610165632.0d9bb321@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Jun 2021 18:00:29 +0300
Message-ID: <CAHp75Vd+r3_OnRAYJcHVTU3Q2ekLYV_oHQQ6-wWmq=9hm_cP1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: intel: fix NULL pointer deref
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 10, 2021 at 5:56 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> Am Thu, 10 Jun 2021 17:32:46 +0300
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
>
> > On Thu, Jun 10, 2021 at 05:25:04PM +0300, Andy Shevchenko wrote:
> > > On Wed, Jun 09, 2021 at 01:08:16PM +0200, Henning Schild wrote:
> > > > Am Wed, 9 Jun 2021 13:33:34 +0300
> > > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > >
> > > ...
> > >
> > > > In order to use GPIO from the drivers i need to make sure
> > > > "broxton-pinctrl" comes up even if p2sb is hidden.
> > > >
> > > > Long story short, i thought the patch was simple enough to merge
> > > > even taken out of my special context.
> > > >
> > > > Currently intel_pinctl only works if "ps2b is not hidden by BIOS"
> > > > or "ACPI tables are correct", lifting the ban on the hidden p2sb
> > > > seems like a useful thing in general (i.e. sysfs gpio interface).
> > > > And i was hoping Andy would take the lead on that. It is
> > > > something my Siemens drivers would depend on, but really a
> > > > generic thing as far as i understand it.
> > >
> > > From p2sb series discussion it appears that this patch is not
> > > needed. The case is when BIOS already provides an ACPI device.
> > >
> > > So, the initial bug is in that series that needs to check if the
> > > ACPI device is exposed and forbid platform device instantiation in
> > > that case.
> >
> > Actually, I'm still thinking how this ever possible. We have all
> > drivers to provide SoC data pointers. match data may be NULL if and
> > only if the ACPI device provided is a new one that doesn't provide a
> > SoC data.
> >
> > So, w/o seeing ACPI table, I'm really puzzled here.
>
> Not sure what exactly you mean. Let us kill this thread and ignore the
> patch. It was posted out of context and the NULL deref code-path does
> not exist in the kernel, so the check is not needed.
>
> I will revisit the machine where your patch-series did lead to a
> double-init and EBUSY on claiming those memory ressources. And i will
> add ACPI info there as well.

I guess I got what's going on here. When we create a platform device
we get an associated companion device (which is parent in this case of
LPC) and that's why when we try enumerating it you have got the first
branch chosen.


-- 
With Best Regards,
Andy Shevchenko
