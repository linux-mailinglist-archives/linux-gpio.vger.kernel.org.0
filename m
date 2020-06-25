Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617C4209BF8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 11:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390116AbgFYJgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 05:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390074AbgFYJgy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 05:36:54 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACE1C061573;
        Thu, 25 Jun 2020 02:36:54 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id m2so2968472pjv.2;
        Thu, 25 Jun 2020 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4Hd+pWg4j0phB+P+4cJXi8pVMww0fxVhUKsYuMdJ18s=;
        b=enr0X+1FED05Xcz6nN64RVPCKQ47RKy+c/SSW1KUzuF65KqVqZQZ1BlUj4sTf0Pi3g
         c2Z5ZeiEiJvS33BtB5m4qA6koS17c/naYxmqaOPMcsml61cvno6t30flHQ6QccESDFaD
         ePSkzaVYCY4lGQKlR6u/nO8FtMwJjgB8zQfHR6Rwir7F5Oh6SZdAZ19ZsEBrOaE0cYEv
         t09/3zEO0rMnbKzuShJX5nBB7eygRpsltMrmO0VVCcyii7Sa/5cKd4ebxZjJSGwB/Fen
         7CbP8Dv/OmN8JH6upHgIcHA7wIvsA0H4IWrAm4LT9jLz9CNN9YaGIdkaHE7fqws8kl3V
         CIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4Hd+pWg4j0phB+P+4cJXi8pVMww0fxVhUKsYuMdJ18s=;
        b=KsBxvtm1qRiT4p64HR6rceUb4aFRjgavhvX2p1EWuzFWFm3WQ3k9V9q41WMYdJUcbf
         m+EvxfHbT+kVBXvd6EPTYH4S8g6fC6mksSXCQRB413Bli790EEt9k/CSReJCW5F5Nu1d
         mcqlr0VyWvKs1uFSRSnYol/9QFo+u6sJpDrTtLoqb5/8uSe+YCmYpJeenGPa0dVtg26d
         l6F6dUeIOKL2jzJyRlVUhN0Da5IQCMi4waFVAHRlgJX952j4mZYiVPnAqMM/rOCmJNod
         YyOnRXGeRZ3NUjJ/7A05ZHI1NSD5pc5Gn1RTg79nNoBSfHm2PUkx7V4g8G74GMisESZ2
         6daw==
X-Gm-Message-State: AOAM531L2lwOZ9h6/6O+WTvjXJbdU5NVXiE8RDPXkgX+e869jJTK58Qj
        MYl3jsoepOzLDSdvvTyC47M=
X-Google-Smtp-Source: ABdhPJzq9uKDmS7mkO+J+x3Wjfo4H1BMgoekKZEO20rs9jBUX3Z4sv4gDrsfMQ8FnpWzD/PT0qyUVg==
X-Received: by 2002:a17:902:8302:: with SMTP id bd2mr24624555plb.110.1593077814213;
        Thu, 25 Jun 2020 02:36:54 -0700 (PDT)
Received: from sol (220-235-108-194.dyn.iinet.net.au. [220.235.108.194])
        by smtp.gmail.com with ESMTPSA id n189sm22848124pfn.108.2020.06.25.02.36.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 02:36:53 -0700 (PDT)
Date:   Thu, 25 Jun 2020 17:36:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/22] gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
Message-ID: <20200625093647.GA18209@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-11-warthog618@gmail.com>
 <CAHp75VdG4r95ZU8G9TfL+jkT63+Gppb8w5TRvAtCR_pAk0o=NA@mail.gmail.com>
 <20200624155714.GB8622@sol>
 <20200624225803.GA3600@sol>
 <CAHp75VdCGpvoK8RZGwbehOd3eORE+qwFR31ucFxtU4vdc5pvYg@mail.gmail.com>
 <20200625091307.GA16386@sol>
 <CAHp75VeDOGArs2MxJJRNHbNRsJU4K+KYPY=pF+mgtwbakQf4BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeDOGArs2MxJJRNHbNRsJU4K+KYPY=pF+mgtwbakQf4BQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2020 at 12:23:49PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 25, 2020 at 12:13 PM Kent Gibson <warthog618@gmail.com> wrote:
> > On Thu, Jun 25, 2020 at 11:44:21AM +0300, Andy Shevchenko wrote:
> > > On Thu, Jun 25, 2020 at 1:58 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > On Wed, Jun 24, 2020 at 11:57:14PM +0800, Kent Gibson wrote:
> 
> ...
> 
> > > > Perhaps you are referring to the case where the copy_to_user fails?
> > >
> > > Yes.
> > >
> > > > To be honest I considered that to be so unlikely that I ignored it.
> > > > Is there a relevant failure mode that I'm missing?
> > >
> > > The traditional question for such cases is "what can possibly go wrong?"
> > > I wouldn't underestimate the probability of failure.
> > >
> >
> > The worst case is the watch is enabled and the userspace gets an
> > EFAULT so it thinks it failed.  If userspace retries then they get
> > EBUSY, so userspace accounting gets muddled.
> >
> > We can clear the watch bit if the copy_to_user fails - before
> > returning the EFAULT. Would that be satisfactory?
> 
> Perhaps. I didn't check that scenario.
> 

To be clear I'm suggesting this:

        gpio_desc_to_lineinfo(desc, &lineinfo);
 
-       if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
+       if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
+               clear_bit(lineinfo.offset, gcdev->watched_lines);
                return -EFAULT;
+       }

That undoes the set, returning the watch state to what it was before the
call.

Cheers,
Kent.
