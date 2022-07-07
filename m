Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C465569E30
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 10:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235218AbiGGIzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 04:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbiGGIzb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 04:55:31 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB4F4D166
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 01:55:31 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id r22so10380319pgr.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jul 2022 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RbTg6fN7jh4Z/iXbySp7st+O0tSJNfIBOAR5vgyqfUQ=;
        b=UDrf7NPKmmX4+eL+6bnz4csHxRY7S0C879USImWAvt5iTLp/2o3EG6oRv8SM4e/5aS
         IbilnTgESqOwVpyDMXDo1wb4qF7HdUGJ/gZahrhmkLG65febx8pjwTpdW5C368fUIvxO
         XVHVRE8BECx1sJVQO5yLCmZOrdywaSrL2Am676Ho8o1BVmYZLpFs5hEb5k3TzO1G6EQK
         Uec+kNQDwhzZfHCepjZA5w0NB49AxZ0CiUhDAFt5oYpI18kIJU/Ru5S19lGcfNbC42A3
         fR576QxamDBvZaEQTh7t1eNUjuwvmyRDJh8aYtVyXuHywH5HEi/kbq3i3FxRZyQKiTte
         WOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RbTg6fN7jh4Z/iXbySp7st+O0tSJNfIBOAR5vgyqfUQ=;
        b=C4B7iR28Ys0ScZll10xaM0Ff6k8Md46u39J2lU0+V9zNarqNKM9uu8hc84ysI06WcR
         PFA+1hgxHjwjgUxxdqoGtNj9wGFj+TGEE7S2L0OZDGp7328sCn3jPAJsWHgCm3vXDHIR
         4SqKHqjmd5F0SFjXwIWNFXFI0q3Zb2ng1QQQoP4rjfnb0tOkkxofFeppJSc8QLYtvhlv
         zvitGqqfiMN9YQxBTCXD7F4jaUVIRAvgZPNeFZCf21n6kT4yNlUqNl2mrk27kcxg9qhT
         eJ6HLwwJnc2NISobwj8DhdOaSgeuk+ZHU9ns6GPq3ESXIJVXDz26M6cCM3mr4yHpmh94
         eOxg==
X-Gm-Message-State: AJIora+TrRD7cemYMJROBbVuDKjmwRT26QGAOYvjtuqYkff2Vy+D9DUM
        YsrFzVDgXR3GCdNlVSjoxxZg/PijjDM=
X-Google-Smtp-Source: AGRyM1uOVMm+4lCEZIFAMFhE09ONmLgHT1ZGiLaCjM8kHLRoxdY+9tUdl/aukkkQeNyiAKTRd/7pCw==
X-Received: by 2002:a17:90b:1e45:b0:1ed:2fae:bc5a with SMTP id pi5-20020a17090b1e4500b001ed2faebc5amr4003925pjb.208.1657184130430;
        Thu, 07 Jul 2022 01:55:30 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090a1bca00b001e2f892b352sm16117310pjr.45.2022.07.07.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:55:29 -0700 (PDT)
Date:   Thu, 7 Jul 2022 16:55:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 3/4] tools: add gpiowatch
Message-ID: <20220707085525.GA57165@sol>
References: <20220627134447.81927-1-warthog618@gmail.com>
 <20220627134447.81927-4-warthog618@gmail.com>
 <CAMRc=Mf1ux1o9BEOhEAWoVkren-wH-nuPPvvKOisxtqiNyrfOA@mail.gmail.com>
 <20220707022730.GB7250@sol>
 <CAMRc=McMPMgwJ7d9-JRxL_DcxbkAuwrM_nNEAF0-bnVJrBfcww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McMPMgwJ7d9-JRxL_DcxbkAuwrM_nNEAF0-bnVJrBfcww@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 07, 2022 at 10:41:21AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 7, 2022 at 4:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Jul 06, 2022 at 10:46:28PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Jun 27, 2022 at 3:46 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > Add a gpiowatch tool, based on gpiomon, but reporting line info change
> > > > events similar to the gpio-watch tool in the linux kernel.
> > > >
> > > > +       }

...

> > >
> > > Moar newlines, I really like between blocks of code, it really helps me, thanks.
> > >
> >
> > Oh, ok, I see this as being one block.  Where would you like the splits?
> >
> 
> I will add them myself later, don't worry about it.
> 

I think I know what you mean.
Anyway, I'll add a tonne of whitespace...

> > > > +       print_event_time(evtime, event_clock_mode);
> > > > +       printf(" %s", evname);

Like here

> > > > +       if (chip_id)
> > > > +               printf(" %s %d", chip_id, gpiod_line_info_get_offset(info));

and here.

> > > > +       print_line_info(info);
> > > > +       printf("\n");
> > > > +}
> > > > +

...

> > > >
> > >
> > > Looks good to me, I would have probably added a machine-readable
> > > output formatting like gpiomon but we can always extend it later.
> > >
> >
> > You mean the format option?
> >
> 
> Yes. But that can be easily added later.
> 

I was thinking the Python bindings would be the way to go if you want
to extract specific bits.

Turns out when I created a new libgpiod workspace in my editor it
defaulted tabs to 4 spaces, which might've been the cause of some
unfortunate formatting.  Sorted for the next version.

Cheers,
Kent.
