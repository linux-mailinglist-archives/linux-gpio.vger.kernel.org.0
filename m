Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEF53AC091
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 03:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbhFRBfh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 21:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233475AbhFRBfh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 21:35:37 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F064BC061574
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 18:33:27 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id y4so29910pfi.9
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 18:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fsqG/Gj3GzVFRUh7CNQzL0N3TI1C+wp0FhYmuCLs+m0=;
        b=Fv57BiX6YyCdwRnnhmS8297yD3ATD2ohH2NnxNg4eLVxnDfQGZ7YrFAq79wyjT5CAv
         Wu3FFLiagwHAP22r5Q1mapTg2IIXMhZkJjmVchaj21J/jdano1VZByEm0lOU+CRWxazk
         OzK3So104ejAk+VE2DZy6HUdMpWbNyiAL/n3i6S0ewyEAc85+WUXEyNbv4neog9QJ+YU
         T37fpXKWCN2UJNBu5Fp9cmlMZDdgRp/Nrn1GuH7otDxHoXb2ZFtJGXuYBPkXVBzaGCZZ
         k82hCtTa8tRoFjYxszrByaFo5FAKT+brqkUSrVoWpVpLdkx+8SW6iErSTdTOCvEjLl5c
         1p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fsqG/Gj3GzVFRUh7CNQzL0N3TI1C+wp0FhYmuCLs+m0=;
        b=i3tM+jhBXkLC5WiMgJ8Tu+qfgeYaMuqZCGIsCLM/+WSBFSMaklXHzFszLO1Tc2vzjY
         eb3+y/5FMZAPrNC+lP+tzd/TUb0VOM23xB7ATJ6QolU1p7jMpi13k8RMpCQNryXATY7P
         X/GaIK9C+8vKhhnXW1BvqZLUOCcM09StDeFH+OFAU8zoS3nGt2XSXZXm9lj9r69hx0be
         S4+UwkHQuYOIMH3jCCTaHZUJxGU0mOhnodt1e54CFxK3xGLYn5/Jc9pFqcG5GxHp89xY
         RtNW+3gnB8smfxekz6iLducfkTBsVfh3eeQ/btRg41Yn+ZMxlqS4IdhezdfZ1JYtv7VX
         rmKg==
X-Gm-Message-State: AOAM53024Vb46ZS7RXnvg79DNLgAYhwa5V0TcwSfNHHJb0VE4OPFjS9S
        z+l65aLTDsT7hTzoDooUHq0=
X-Google-Smtp-Source: ABdhPJyR/DSLpMoeyAaUlMrIOzkBKgf2ZHUXF903dpE3b2SouE556jC/9nDzzxd807d+m5lvFvye3w==
X-Received: by 2002:a62:e21a:0:b029:2ea:26c5:2ec3 with SMTP id a26-20020a62e21a0000b02902ea26c52ec3mr2740960pfi.8.1623980007422;
        Thu, 17 Jun 2021 18:33:27 -0700 (PDT)
Received: from sol (106-69-169-160.dyn.iinet.net.au. [106.69.169.160])
        by smtp.gmail.com with ESMTPSA id y7sm6475481pfy.153.2021.06.17.18.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 18:33:26 -0700 (PDT)
Date:   Fri, 18 Jun 2021 09:33:22 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gabriel Knezek <gabeknez@microsoft.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/1] gpiolib: Zero structure which will be returned to
 usermode to avoid kernel info leak.
Message-ID: <20210618013322.GA6360@sol>
References: <SN4PR2101MB07349B91FB076894841F7D82DA0F9@SN4PR2101MB0734.namprd21.prod.outlook.com>
 <CAHp75VeXQeVRorGNFT0jZ=GYAqii8oDqXDkvegCUOxz4jk-fSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeXQeVRorGNFT0jZ=GYAqii8oDqXDkvegCUOxz4jk-fSA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 17, 2021 at 08:56:50AM +0300, Andy Shevchenko wrote:
> On Thursday, June 17, 2021, Gabriel Knezek <gabeknez@microsoft.com> wrote:
> 
> > Apologies if I got this slightly wrong; this is actually my first time
> > submitting a patch to the kernel. (:
> >
> > Thanks.
> > -Gabe
> 
> 
> 
> Instead of above you should put a text of your analysis as you did in other
> thread. That text should be a commit message (assuming you have cloned a
> Git repository). `git format-patch ... ; git send-email ...` will help you
> with preparation and sending the message.
> 

I don't see Andy's reply on the list for some reason, so just to
re-iterate, you will need to issue a v2 patch.

The title could be a little more subtle ;).
The title should summarise what the change is, not the rationale nor
implications.  And mentioning the sub-module is handy too - in this case
anything mentioning cdev tends to get my attention.
So "gpiolib: cdev: zero padding during conversion to gpioline_info_changed"
would work better for me.

The checkin comment becomes part of the permanent record and so should
describe the rationale for the change - something more along the lines of
your initial thread, as Andy suggests.

Any additional commentary, generally related to the patch itself, goes
immediately after the "---" line - see below.  You should be able to
find plenty of examples on list.

You should use git to help format and generate your patch, as Andy
suggests, and run scripts/checkpatch.pl over it to make sure it looks
kosher before submitting it.

> >
> > Fixes: aad95584 ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and
> > GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
> > Signed-off-by: Gabriel Knezek <gabeknez@microsoft.com>
> > ---

Additional commentary goes here.

e.g. 
Changes from v1: ....

This is explanatory stuff for the reviewers and maintainers that will
not become part of the git record.

As it isn't part of the git commit, this needs to be added after git
generates your patch.

> >  drivers/gpio/gpiolib-cdev.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index ee5903aac497..af68532835fe 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -1865,6 +1865,7 @@ static void gpio_v2_line_info_changed_to_v1(
> >                 struct gpio_v2_line_info_changed *lic_v2,
> >                 struct gpioline_info_changed *lic_v1)
> >  {
> > +       memset(lic_v1, 0, sizeof(*lic_v1));
> >         gpio_v2_line_info_to_v1(&lic_v2->info, &lic_v1->info);
> >         lic_v1->timestamp = lic_v2->timestamp_ns;
> >         lic_v1->event_type = lic_v2->event_type;
> > --
> > 2.25.1
> >
> 

I'm fine with the code change - just the formatting of the patch itself
needs to be tidied up.

Cheers,
Kent.
