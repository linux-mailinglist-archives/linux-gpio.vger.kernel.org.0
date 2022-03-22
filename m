Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE1EA4E43F1
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 17:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236333AbiCVQMm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 12:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236170AbiCVQMl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 12:12:41 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A0F27B3E
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:11:13 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id t14so12960791pgr.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9mXdnBFEPJ1fVmT5SuLBGohX4k+paislcwxvRwLQfYQ=;
        b=ZKkk1Nc8mGL5CJVgv0pcrYyRImciyYLzWxdmV+y/iQIoVMlKb7nRM3epqPOmjuZNko
         WJZawOr4/sa01ihHc+WdrNSUd7RgxHzoDB0lpWUHz1nYD2ypffnD/Og8Cbza42sWmvYc
         FqLna1JLH4coqk6ztb50Ebu/Pzx0Sf9oSYQMIp0oleOdulTiG9Pidu0nAR9RyV3gk6CC
         ukEVTbJmaSjoFRyNFax/O6GSEj2bb4UP01f2JuI94qX+lOhIEmLj9Kfxdekgfy960U9B
         UT6aDApyWucZswnb+8o/3Mw8RRpYZfxhOlFmC0xXIXWt5fNtzqHUFW6JrUaX5L3cOyZ0
         7fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9mXdnBFEPJ1fVmT5SuLBGohX4k+paislcwxvRwLQfYQ=;
        b=dLh7owk6+eL8kRbsZZxM2d901XlT3nOurX6sbqTjxTUpqLksgU/ULTo3eUjH+rtylC
         dqHY1NAD1CLB98/MwujtLlXCX3rApTZN4CwX8LyNSpNpb9Xe+PLzulp/MJXPkXvZ/tel
         n8sf+KJGhHq4ZhTGNR9qR6M8aFcEq5KGbzMDzpn3R4i2fELWlkpa8anOS5Hpl1EHMYNr
         YNVEC+Q7QJ+Ro1xsgTO0MSJgisVigMpW6Liwi33uapPn/5Yl82BpuOPgr4EBaDHWISTz
         7h7XRiq5299f1z5K0DSRqc59c2ZiRxSmP995rXm2GVj5+0weEnhFhCV0Vz5mBVH/QT7E
         DPYw==
X-Gm-Message-State: AOAM5302Ydo/ZqAz32LYoJR/QxPQ8ZXNAegDf4M7qvo3IPYN83bA2X1r
        iU7nIhF55tCDAUIoTSMqVTkFl3hu5TUJ8g==
X-Google-Smtp-Source: ABdhPJx6AJzqzrlx/J10suJKXk8yo4Dg89/6dhi3uzl1LUwTMSXVWQuP2DWyAyqrxmjSqG35BHRiCA==
X-Received: by 2002:a63:f40e:0:b0:380:6a04:4335 with SMTP id g14-20020a63f40e000000b003806a044335mr22448128pgi.523.1647965472874;
        Tue, 22 Mar 2022 09:11:12 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id q17-20020aa79831000000b004f769d0c323sm24879095pfl.100.2022.03.22.09.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 09:11:12 -0700 (PDT)
Date:   Wed, 23 Mar 2022 00:11:07 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: gpiod: Set pullup for Input Line
Message-ID: <20220322161107.GA131091@sol>
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
 <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
 <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com>
 <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
 <20220322005911.GA6650@sol>
 <1a7fd31a-221e-7b23-b95f-d71e440b3ff0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a7fd31a-221e-7b23-b95f-d71e440b3ff0@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 22, 2022 at 09:36:29AM +0100, Hans Kurscheidt wrote:
> 
> Am 22.03.2022 um 01:59 schrieb Kent Gibson:
> > On Mon, Mar 21, 2022 at 07:33:28PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 21, 2022 at 7:27 PM Hans Kurscheidt<lve0200@gmail.com>  wrote:
> > > > Hi thanks, that makes hope.
> > > First of all, please do not top-post.
> > > 
> > > > Unfortunately apt-get gpiod on my OrangePi Armbian board gives me
> > > > version 1.2, while the dev is already at 1.6. I probably have to build
> > > > it from source.
> > > > 
> > > > Keeping fingers crossed .
> > > I don't remember the details of old versions of libgpiod (Bart? Kent?)
> > > I think it was available even there.
> > > 
> > Bias support was added in libgpiod v1.5.
> > It wasn't even exposed in the uAPI prior to that - it wasn't added until
> > kernel v5.5.
> > 
> > In this case building the latest stable, 1.6.3, is the way to go.
> > 
> > Cheers,
> > Kent.
> > 
> > > > Am 21.03.2022 um 17:26 schrieb Andy Shevchenko:
> > > > > On Mon, Mar 21, 2022 at 1:30 PM Hans Kurscheidt<lve0200@gmail.com>  wrote:
> > > > > > Despite deep searching, I cannot find any information, if gpiod allow
> > > > > > specifying pull-ups to input lines and how to do/handle it.
> > > > > Have you followed this code from libgpiod?
> > > > > https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gpioset.c#n44
> > > 
> > > -- 
> > > With Best Regards,
> > > Andy Shevchenko
> 
> Thank-you Kent!
> 
> Still 1 more question. I understand the sense of a Pull-up in Input mode,
> but reading the code, I see that the Bias option exists as well for gpioset
> (Output). What is the sense of this, and what does it do?
> 

As answered by Andy, drive and bias are orthogonal so gpioset supports
setting them independently.  Obviously setting bias with push-pull
doesn't make much sense, but the case it is there for is combining open
drain/source with a pull for when the line is not being driven.
Granted that such a pull would usually be provided externally, but the
option is there in case it isn't.

> WRT. building it, it wasn't that straight forward, as in the description. On
> the Armbian/Debian buster Kernel 5.10.60-sunxi64 #21.08.1 I had to create an
> M4 dir, install GNU-archives and install libtools in addition to succeed
> building it. Then doxygen and help2man were still missing.
> 

I defer to Bart on build issues, but you shouldn't need to create the
m4 directory - you should install m4.
In fact all these packages:
  apt_packages:
      - autoconf
      - autoconf-archive
      - libtool
      - m4
      - doxygen
      - graphviz

That list is drawn from a recent patch I submitted to build the documentation
on a readthedocs Ubuntu VM, but it is probably the same or very similar
for Armbian.
That is in addition to build-essential, but I assume you already have that.

Cheers,
Kent.
