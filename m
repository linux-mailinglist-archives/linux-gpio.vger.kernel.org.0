Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4907ECA168
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 17:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbfJCPxR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 11:53:17 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34397 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfJCPxR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 11:53:17 -0400
Received: by mail-pg1-f195.google.com with SMTP id y35so2058514pgl.1;
        Thu, 03 Oct 2019 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1wqB6OZNdAWXlilaMCSpXU3dW8zf1TakKdGobbh4lqo=;
        b=tJDWBKQfkYG6j7dTjY7u63ZnzNoDHCHuPQoSGsP9Cwd10QAabJ71wYeSDMbD+2tbML
         vDUecy1ZRk0qFDimsSJWyQBM8CxqEQTZjwiEFE800kp61Xwhir7kRwS4R0vgp3yYbIER
         XhbJMaNYYL41LDNzOhsfFVn+eeThyw7X3j4XPlpV/5i08O0T8/jZgITZ9zasEn8Bto2M
         1jJZj9aG7l1rdbtmwZvfHdE1Wyc8XPRwe0EpgDIzoC6NEI9nX6WNKOM1T2hheyB1XY+N
         Tm1xe8mIDuZHXT/L85qUYKbPKVjh1kBdVXB8VGRXS516j9RwHq5d2gEwBcjkRCvd65Dm
         jCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1wqB6OZNdAWXlilaMCSpXU3dW8zf1TakKdGobbh4lqo=;
        b=E0aunpWzkDxRx3vJprXOxGQXP1MMNWGvrRmIbxikgim4+rHafLaLLOVRg+Wr+PTv8K
         1OzHQAQUcNEHIOiaLbFszTyNE+qb/5MieLJFjFHeFlpgBkSRtJQJpofuzfJ3cFvPvRKh
         Gla3pohIMx7NBZisMK8CZQAAcK1bUxXiZvINdooB8nCPiSSEbkrYTO3KVD4pBCkUF7nP
         iBL+DDyN1DtsI0EP7xuEYa5WQKG2VB33zy+NrbPZx/lOxnxNOddw41GcxABc3si7BXpn
         GYeEcC9me/aSZV/J92jtZDNjfSjXNKXkpREOVjUQlcLe7anMtvjP/dUrpKa0bIrlqK8O
         3q2Q==
X-Gm-Message-State: APjAAAXeu1aqywvukasqf5xjeI8R1WLJ2Za4Iubvv2hBHPDSB2SMsyo/
        m/QzmkQ1EqVSbJYLFdbA5oM=
X-Google-Smtp-Source: APXvYqwTxuuMApyhcjWNrwEKc2wo9IJ44wvLub5GBlE26WCqQKGZg+xTcVBGAiBqFOqiS3iNLC822A==
X-Received: by 2002:aa7:81d3:: with SMTP id c19mr11732627pfn.85.1570117995085;
        Thu, 03 Oct 2019 08:53:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a13sm4649830pfg.10.2019.10.03.08.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 08:53:14 -0700 (PDT)
Date:   Thu, 3 Oct 2019 08:53:11 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 0/2] Add support for software nodes to gpiolib
Message-ID: <20191003155311.GA22365@dtor-ws>
References: <20190913032240.50333-1-dmitry.torokhov@gmail.com>
 <CACRpkdYm=qK7x0cLg3HjPmGYhZ076cDN1Kvd774p6g0UEg9C7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYm=qK7x0cLg3HjPmGYhZ076cDN1Kvd774p6g0UEg9C7w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 03, 2019 at 12:07:47PM +0200, Linus Walleij wrote:
> On Fri, Sep 13, 2019 at 5:22 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > This is a part of the larger series previously posted at
> >
> > https://lore.kernel.org/linux-gpio/20190911075215.78047-1-dmitry.torokhov@gmail.com
> >
> > that was rebased on top of linux-gpio devel branch.
> >
> > Changes in v2:
> > - switched export to be EXPORT_SYMBOL_GPL to match the new export
> >   markings for the rest of GPIO devres functions
> > - rebased on top of Linus W devel branch
> > - added Andy's Reviewed-by
> 
> I failed to get this into v5.4 because of misc stress, sorry :(
> 
> I have queued it on an immutable branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=ib-fwnode-gpiod-get-index
> then pulled that into my devel branch for v5.5.
> 
> So you can ask subsystem maintainers to pull this in to do conversions.
> 
> Apologies for the inconvenience.

Hey, no worries and thank you for making a branch. It does not really
matter if we land it one release earlier or later.

Hope you are feeling better.

-- 
Dmitry
