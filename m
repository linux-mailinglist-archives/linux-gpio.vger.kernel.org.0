Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F804D0FF2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 15:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731192AbfJINX6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 09:23:58 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41286 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731083AbfJINX6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 09:23:58 -0400
Received: by mail-pf1-f196.google.com with SMTP id q7so1622303pfh.8
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 06:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2UZSBjpDfhWKUkd9zi6zb2LSYd+CI+5a9lamXZLJVe0=;
        b=LAzUKl1/mUVY1N1MPAD5G4cqYSNVjvxuTKeGpF20Wa34pnq9BX2K32szgdK8eVMk+D
         kFdck6pgRSAov+RsM1Urb93o8oNlY8EDI083zXbsLj2DIleUAn/juWcfrVIkX3uRC5d4
         mq1SRKduqDrTCkNqoo/pMv8V7zDK12oVcBhl7eKwLMGPh9u6/3dlvpcCoIr26s4Z3hiH
         I6L+igeMYzKTuMGwiBv3jRoS1WiKhVCuV4Df0mFbet3oEvGjXpCS+7MfHUXJ5K16mKpT
         OhYkpj2/Pmsnpy23eNsEmK5VVYa8a3G9GD4smbUJ2iKITtR/1vNryWjO9ay/hU+JmHjn
         WW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2UZSBjpDfhWKUkd9zi6zb2LSYd+CI+5a9lamXZLJVe0=;
        b=LMMoP4gqp5+zG3bIm5X4uZhX48Qxqd9HSmsZr4ZV94N8iqorDsijgfS4iJ+kyM332/
         +LsA6Ie+G5pDsAsOuCSMdpwggOzyKKysCrF0ryG89/2eNRqwCS9HptjPCAItu5EPZe3H
         +YjF3JLaKswRI2nAlkSRjDZ7bD274KT5gI003cmcM4oHwJ36LS/FgH6/k2g2pwaJFlXf
         /48lf/NLOGX1g5GoH5yMj3A+GGR3fP/xD3jc5yfALwCLATaYDNQ8+ltEiU0MKyuY4bat
         OvWHM0ug+zGfppsHlhbg8XkM4esOZhjFZMK1gaGw9FPeDBIo+0skCA8GA5+ne43k0lGq
         CQYA==
X-Gm-Message-State: APjAAAX7YQaKgLIujoBfeQPZ5AH7m8AN4OO3i+SzuAv93gHyHzXjXCay
        kojIN0kY3z2ZpQj+aAr2+rw=
X-Google-Smtp-Source: APXvYqwtLIfMqO6A1imYXyLfpS0LLMrT3Dsu36jFUiKCe9Qybn8JIAm6LhDgGRG4dQznSjdFZlQVrg==
X-Received: by 2002:a63:ba05:: with SMTP id k5mr4125759pgf.195.1570627437286;
        Wed, 09 Oct 2019 06:23:57 -0700 (PDT)
Received: from firefly (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id a11sm3175918pfg.94.2019.10.09.06.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 06:23:56 -0700 (PDT)
Date:   Wed, 9 Oct 2019 13:23:46 +0000
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191009132346.GA1384@firefly>
References: <20190921102522.8970-1-drew@pdp7.com>
 <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol>
 <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol>
 <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol>
 <20191009065524.GA4061@sol>
 <20191009125727.GA10800@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009125727.GA10800@x1>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 09, 2019 at 02:57:27PM +0200, Drew Fustini wrote:
> 
> On Wed, Oct 09, 2019 at 02:55:24PM +0800, Kent Gibson wrote:
> > Safe to assume your code is in your topic/gpio-uapi-config branch?
> > I hope so, cos I've forked from that into github.com/warthog618/linux 
> > and have started working on it.
> > 
> > So far I've added pull up/down support to lineevent_create, and 
> > added default_values to the gpiohandle_config (for setting outputs).
> > Currently looking at implementing the actual set config, and sucking
> > on whether that is best done by refactoring bit out of
> > linehandle_create.
> > 
> > Will sort that into patches once it is in a fit state.
> > Feel free to poke me if I'm going off track.
> > 
> > Cheers,
> > Kent.
> 
> Great to see that work on this capability is moving foward.  I also have
> spare time so I'm eager to help however I can.
> 
> I had been working from the kernel.org torvalds/linux.git master to
> create a patch and used 'git send-email' to post a patch.  It is
> interesting that Bartosz and you have forks of linux where you created
> topic branches.  I just added warthog618/linux as a remote so I can view
> and try out your commits.
> 
Sorry that the branch is a munge of the pull up/down and set config changes.
And I have no idea how I'm going to sort this into a reasonable patch
sequence, but I'll burn that bridge when I get to it.

I'm reasonably happy with the state of the pull up/down.  That is
passing all my tests on gpio-mockup - other than the actual value being
pulled - but that is because gpio-mockup needs to be updated.
Which is next on the todo list. Along with building a Pi kernel to test
real hardware.  

I'd steer clear of the SET_CONFIG changes for the moment - those 
are totally untested.
But I guess you don't have any code to call the ioctl yet anyway...
That is slightly further down the todo list.

Cheers,
Kent.
