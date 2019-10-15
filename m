Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02836D6CA5
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 02:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfJOAwv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 20:52:51 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39476 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727195AbfJOAwr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 20:52:47 -0400
Received: by mail-pg1-f194.google.com with SMTP id p12so1702557pgn.6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 17:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5c9vhzOIHNaAd3rSoEOcMX5ml/SZUBlAjvoLlXDDiFQ=;
        b=hRb/w/mXY8vKwOHxQIg6e6eHDrxN5d906zEXCQ0ayfWuwtGFWfktL/u4/Q1axA6wjC
         KO3fH/0RP8l8eCKaeqUex7/juMLOwRnS3EkkTeb1eJWWolkkRvcQHIvDnfB2JcBMdjsX
         QjwHW17gXmVWdc/DziwEr/HRwUJxNVcqKpIOh3Pj/WThLynI9RkOHVaGYBG/JF9K5OeJ
         fmmdcNin4/R6guW+rErmlKYyQTUEhNDRYVLzZQtGMDausoRtEoXal01b39lV7fqVqbj0
         Om4Wekcv8lPW15oHdyxFGbwQFUdQvg0p9EI6dqljNi/B+CN2ocWStcnjEYisxvTcI8+S
         ZWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5c9vhzOIHNaAd3rSoEOcMX5ml/SZUBlAjvoLlXDDiFQ=;
        b=MUMLUoQVvOeHSb84RlCqgf237StMsMnBhlO67e3bgH6bSwJcLKxHO10CCQFGvSjTNI
         sY4S8a67LJQa+iCDN/4zRkpA0f4CTlqnmGYRx/CjeSjo+ESjWxEv7+dJSV+aFU0rvqwX
         6XkZHBLgo6znI6NGVBwzCQOiE9SnVDYJ1JEcO6utLAdg0TLnbAsPyUh88Ti/Sf8qPCy1
         5vBn9ffzOTFLozZekDpLe5Q47hml/OhmuQf+tk+MfKij3dUp85INAJ+bu8iR6MmXyk5h
         TxImlPcZ4+CsFjFHH0iIYZH/UQ9dsjcNOd9fWkGqgHGhDXphPJrewlKq+w5dnXezDq2I
         vBGQ==
X-Gm-Message-State: APjAAAWtbfYh+HQA2XqTW9CaIFKnP/wfKkr2FrlJyQ2jL2hVAc/KLjVH
        s4ox3d+L3VMeIK6nA9cSV4tgooGQdMxGCQ==
X-Google-Smtp-Source: APXvYqxKnc+/63dOBtBbkTKlG7Zyn21naYelAWxXfe2ERJQC3WqPjZxBQN9IsQEQxNdQupAnYU1XDg==
X-Received: by 2002:a65:5507:: with SMTP id f7mr35869131pgr.414.1571100766610;
        Mon, 14 Oct 2019 17:52:46 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id 16sm17599175pfi.55.2019.10.14.17.52.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 17:52:45 -0700 (PDT)
Date:   Tue, 15 Oct 2019 08:52:40 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v2 4/6] gpiolib: pull requires explicit input mode
Message-ID: <20191015005240.GA8071@sol>
References: <20191012015628.9604-1-warthog618@gmail.com>
 <20191012015628.9604-5-warthog618@gmail.com>
 <CAMRc=Me+u2brQVo2HwLS+gSDSZWXvsjT59qP75aKRi3PHqMbvg@mail.gmail.com>
 <20191014125457.GA28012@sol>
 <CAMRc=MecXd4ZgpwreMKYBjitp75sifQpAKW25HU9EznRL=wxaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MecXd4ZgpwreMKYBjitp75sifQpAKW25HU9EznRL=wxaA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 07:00:37PM +0200, Bartosz Golaszewski wrote:
> pon., 14 paź 2019 o 14:55 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Mon, Oct 14, 2019 at 02:38:38PM +0200, Bartosz Golaszewski wrote:
> > > sob., 12 paź 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > This patch prevents pull up/down flags being applied to as-is line
> > > > requests, which should be left as-is, and for output mode for which
> > > > setting pulls is not currently supported.
> > > >
> > >
> > > This again looks like it should be done right in patch 1/6 instead of
> > > being fixed later in the same series. Or is there some reason to do it
> > > this way I'm not seeing?
> > >
> > The patch series adds full support for pull up/down in stages - in order
> > of increasing level of controversy, at least IMHO.
> > That way you can drop the more contraversial components if you disagree
> > with them by rejecting individual patches, and most likely all the
> > ones that follow.
> >
> 
> I will not - and I think Linus will agree on that - apply half a
> series when it addresses the user API. We need to be very precise
> about what changes will be merged and the patches must be well
> organized logically.

And that is fine.  The series was structured so I could easily cull the
more contraversial aspects, such as the Pull None, and issue an updated
series.

Conversely it is easy enough for you to squash patches together if you
want all of them, but don't want the intermediate states.
> 
> For instance: the commit message of this patch makes me think that it
> fixes an issue introduced in an earlier patch in this very series.
> Unless that's not true - in which case the commit message should be
> reworded - it's not acceptable.

> 

It fixes what I consider an oversight in a patch that I thought you had
already signed off on. Much the same as my recent patch to reject both 
INPUT and OUTPUT flags being set.  Is that an issue?  Given no one will
even be using the new flags until the feature is added to the kernel 
and libgpiod is updated?

I don't see it as relevant that the oversight it addresses was
introduced in an earlier patch (Drew's).  So what?  You just said 
that you will only apply the series all or nothing, so why does it
matter?

As the problem begins in Drew's patch, that would require changing
Drew's patch itself.  I'm happy to build on top of other's patches,
but I'm not happy to do that. It just doesn't feel right to me.
Doesn't doing that muddle who has changed what, and confuse
attribution?

I obviously don't understand how this whole patch series thing works.

Cheers,
Kent.

