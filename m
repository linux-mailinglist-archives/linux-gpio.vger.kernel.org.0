Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078621AC3C6
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 15:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635658AbgDPNsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 09:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2634056AbgDPNsJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 09:48:09 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1874EC061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 06:48:09 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u10so5624786lfo.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oN7yf5tDb1O7pbYuqgIpy1fdpoRCjDg/+kMZTkZwq64=;
        b=Z3lS/x9w1KttFJSjCTVgmOaPwK8LXazCSA467iE5WnbFRH5dMMJ7DcACwh70qMaTxK
         ucj2vN5TULkok+0tHWl3DxF44kRZ0nq8f12HnSTwbqxbjUTLd15GlYlDX437BSOldRTj
         vz0KttNNdlSBdIPFJ8iS3QrnkkFfe2qhyUn6gYjEcCu/lhpSrXlIEjty3Jqxyfwd8Q78
         mRC+AFEXFJyzg3Hs1l4GfDv2tihUr0rRwYLV4SBMT6nUFFRkFRM3EQ6uAI6L+hzRXUC4
         wrLmIH0kmI+RCtmxbdKEuGXyT+ikwo9BAr45C2g4tol0XuWYmFqPwsnRdaln46V8ab25
         SaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oN7yf5tDb1O7pbYuqgIpy1fdpoRCjDg/+kMZTkZwq64=;
        b=p4xv3ABk5wA7lR9HFU8cY46g4HcE58tRorqTLfwLw6DiLXeijnHqYGyuOG2AnaTjWA
         XpnpUDnJkcj/x1+dpj3F4SidOSkt2+TCKWk6eePUqOogQDMFCQCNlVW1zadk8OijfS4h
         JCNV2jWPX3QUhmyfMZS1vnv4id9fGQ054ZS2FpsddXvDbr/RTkuS5UnCxdpp54dNcmNe
         vCDkOld6IR7gwhlmtd9yQ0k136coodL8V9suZyqxBDJVA0qp36l5A46dkTCE2XUGdQ4f
         GxinYvQZ+uQjd9sRj8ahgBEWvc5i8KDVqJLsH4GjnD4YM0yfC+DQerCW3dZrC3rcGAkW
         s1IQ==
X-Gm-Message-State: AGi0PubOVeAmn4nJv0V6FHLn3EpJhbttRPuJsb99d1DKo0vTnkkxyT6B
        JZ+f2cEnU4eoT9Mw3c93xQY=
X-Google-Smtp-Source: APiQypJr8rqxT+d39uy6PkCdCiUZ8Vp0zP97wCGV8c/SmxCzGq6vvva7ihRH4B+fvx4ONzZTQHRABg==
X-Received: by 2002:a19:c607:: with SMTP id w7mr6204425lff.32.1587044887572;
        Thu, 16 Apr 2020 06:48:07 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id z9sm19342866lfd.9.2020.04.16.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 06:48:06 -0700 (PDT)
Date:   Thu, 16 Apr 2020 16:48:05 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 13/14] gpio: dwapb: Use positive conditional in
 dwapb_configure_irqs()
Message-ID: <20200416134805.r5qp4o34rpxr2h2d@mobilestation>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-14-andriy.shevchenko@linux.intel.com>
 <20200415163710.e26czil5abouujzu@mobilestation>
 <CACRpkdaO8GMXOOMomzmzfhDqYfgdhjTq8XvQHXuGRmnrfk7bOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaO8GMXOOMomzmzfhDqYfgdhjTq8XvQHXuGRmnrfk7bOw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 01:53:25PM +0200, Linus Walleij wrote:
> On Wed, Apr 15, 2020 at 6:37 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Wed, Apr 15, 2020 at 05:15:33PM +0300, Andy Shevchenko wrote:
> > > The negative conditionals are harder to parse by reader.
> > > Switch to positive one in dwapb_configure_irqs().
> >
> > Sorry as for me this modification is redundant. Yes, I know that if-else
> > statement in some cases better to start with positive expression to make it
> > a bit more clear, but in this case I'd leave it as is. First this rule is
> > applicable if both branches are more or less equal, but here I see the most
> > normal case of using the dt-based generic device, which doesn't declare the
> > IRQs as shared seeing it is selected by far more devices at the moment.
> > Second the non-shared IRQs case also covers a combined and multiple-lined
> > GPIO IRQs (chained cascaded GPIO irqchip), while the irq_shared clause have
> > only a single IRQ source supported. Finally If the code was like you
> > suggested from the very beginning I wouldn't say a word, but this patch seems
> > to me at least just moving the code around with gaining less than we have at
> > the moment.
> >
> > Linus, Bartosz and other GPIO-ers may think differently though. Lets see their
> > opinion.
> 
> I think I already applied all patches with the batch application tool b4,
> without properly checking which patches you reviewed and not, sorry :(
> 
> However if any change is controversial I can revert or pull the patch out.

In this case it's up to you to decide. I was against this patch in the first
place. As for me it seemed redundant (see my justification above). But you or
Bartosz may think differently that's why I asked your opinion to decide its
destiny. So if you are ok with what the patch provides, then there is no need
to revert or reset anything. But if you agree with me, then pulling the patch
out with resetting the git history will be the best option.

Regards,
-Sergey

> 
> Yours,
> Linus Walleij
