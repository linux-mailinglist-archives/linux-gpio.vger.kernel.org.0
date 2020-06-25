Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09527209BB9
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 11:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389890AbgFYJNQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 05:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbgFYJNP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 05:13:15 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8F7C061573;
        Thu, 25 Jun 2020 02:13:14 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q90so2255998pjh.3;
        Thu, 25 Jun 2020 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qA/ch1XijEj8vqDlFnL4wr2CZ9xVQ3j9phqNCaqDivM=;
        b=nAwT0XDxsxVITDzd469wsRcqEyID6/+jgdHzjNylZGa6CrWyxnLCQ+5Ubwd9XUFbLg
         lx8KyVQApRyNeYAe1tYx1GBCaejMxsIOpdIvpH5csMIeYTLN9HAnUQuuRnCt3c7OtA0g
         hy2DDF5SwwE/elaRmP3kZa66pn4g1lqINm7LnJSdqp0AaQXQRWpiywNWBSjosp9x8DWF
         KRdRHItJkU2khmKfeG+2UolVy9aWHEKMOjBoP7cnLU/yvpXfFzCLlH6DLyKEoo7EFOCf
         XRJBG4d8mEW22zRirjbFJQ6gDDsZVesZG3fhfAKY2eKb7Cy3C3qw/X1g+3WUOYtuYv7b
         TcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qA/ch1XijEj8vqDlFnL4wr2CZ9xVQ3j9phqNCaqDivM=;
        b=Mquhnxlb2DXi8NJPrE5QNn0jpeCESx/wylIbtwwP2ty4niP68wedP/gRvxzbijzpxP
         6NCgIpISzWtbYZ19MA4rCfS/+daWZwGFGsq3hotHXdp+9/pCMJc/lfcSWwXKJ0FHMfjs
         Hixv5U3ehz8IUVdkbv3N4jkkroI7p2dkg2AvCIca6av6kL4cP44b1ZObraKibiSLjGBr
         8pf+F3qwMQK2mE9gDLdY4jmQY7LSTsHIlOD+ie4RYUTz2hPFt3Q28r/Klk8xf3dtkqJH
         dCErYZaslbIvz4MWPcHXqfmD+1tbMdfJIrh00TDza01xPK22KDYDV25Kv0Io67qWyhXh
         1/bw==
X-Gm-Message-State: AOAM532t9CrHhgFS5xEWREkNs+MrKyrfkLqwsP7adISSFMSEmoyoNGuE
        Jv/P7wgDg0rcOoojMfZm+dmOdJc1Bfg=
X-Google-Smtp-Source: ABdhPJwMh8BcMzFkwpnNeLCZAwK7kBmSWkHKDVFE+369mhOr8Vx2dKuPVJZUAOXCAwpVTkguF/eRDA==
X-Received: by 2002:a17:90b:143:: with SMTP id em3mr2290937pjb.92.1593076393738;
        Thu, 25 Jun 2020 02:13:13 -0700 (PDT)
Received: from sol (220-235-108-194.dyn.iinet.net.au. [220.235.108.194])
        by smtp.gmail.com with ESMTPSA id gb4sm7559454pjb.6.2020.06.25.02.13.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 02:13:12 -0700 (PDT)
Date:   Thu, 25 Jun 2020 17:13:07 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/22] gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
Message-ID: <20200625091307.GA16386@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-11-warthog618@gmail.com>
 <CAHp75VdG4r95ZU8G9TfL+jkT63+Gppb8w5TRvAtCR_pAk0o=NA@mail.gmail.com>
 <20200624155714.GB8622@sol>
 <20200624225803.GA3600@sol>
 <CAHp75VdCGpvoK8RZGwbehOd3eORE+qwFR31ucFxtU4vdc5pvYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdCGpvoK8RZGwbehOd3eORE+qwFR31ucFxtU4vdc5pvYg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2020 at 11:44:21AM +0300, Andy Shevchenko wrote:
> On Thu, Jun 25, 2020 at 1:58 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Wed, Jun 24, 2020 at 11:57:14PM +0800, Kent Gibson wrote:
> > > On Wed, Jun 24, 2020 at 05:46:33PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Jun 23, 2020 at 7:03 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> ...
> 
> > > > I stumbled over this myself, but...
> > > >
> > > > > -               if (test_bit(hwgpio, gcdev->watched_lines))
> > > > > +               if (test_and_set_bit(hwgpio, gcdev->watched_lines))
> > > > >                         return -EBUSY;
> > > > >
> > > > >                 gpio_desc_to_lineinfo(desc, &lineinfo);
> > > > > @@ -897,7 +897,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > > > >                 if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
> > > > >                         return -EFAULT;
> > > > >
> > > > > -               set_bit(hwgpio, gcdev->watched_lines);
> > > > >                 return 0;
> > > >
> > > > ...I think it's not an equivalent despite races involved. If you set
> > > > bit and return error code, you will have the wrong state.
> 
> > Perhaps you are referring to the case where the copy_to_user fails?
> 
> Yes.
> 
> > To be honest I considered that to be so unlikely that I ignored it.
> > Is there a relevant failure mode that I'm missing?
> 
> The traditional question for such cases is "what can possibly go wrong?"
> I wouldn't underestimate the probability of failure.
> 

The worst case is the watch is enabled and the userspace gets an
EFAULT so it thinks it failed.  If userspace retries then they get
EBUSY, so userspace accounting gets muddled.

We can clear the watch bit if the copy_to_user fails - before
returning the EFAULT. Would that be satisfactory?

Back to the failure, is it possible for the copy_to_user fail here,
given that the corresponding copy_from_user has succeeded?
If so, can that be manually triggered for test purposes?

Cheers,
Kent.
