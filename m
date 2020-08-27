Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBF525514A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 00:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgH0Wrt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 18:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgH0Wrs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 18:47:48 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC59C061264;
        Thu, 27 Aug 2020 15:47:48 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id w186so4393310pgb.8;
        Thu, 27 Aug 2020 15:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+8SfVn5+0BRnFAIpm4JbMbWGF0XqmhERlJ52Y3/HL/M=;
        b=JpRLddmhXWk9C3Tx3zCrreCh8q5vK4ek2jGWoqI/2O+hcZ6Yap4MYg2b0F1NpACi1y
         0qgsomljAQPs8mxsdPeR0OFIl3LlYwd6TIPqu5G+K3/RnnKGjmczC+EmvTD/WDyQo+Pi
         Nu5iWRVFhheufpsGZGXo0RNUmLrzRpqiycot31epR6SDlGYtF0LG9EviMDcJrBEFcC0U
         LdvYeJw1ZSWYjgiGydi3CzRbxcu4IwBM0Jq2WDQ1Ctje3C/8MxVGLzEu23aCjJQ3+Y3C
         Xo1hYH/5RKPsAyQBHpLrSQhwnfQdflXjCaPAM3coZ4rp4k8Xy2rg4X8j2PeOhlpl2J7e
         lySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+8SfVn5+0BRnFAIpm4JbMbWGF0XqmhERlJ52Y3/HL/M=;
        b=QzylWjOZhdnrt6t2Z3mULVnM2DgWNceBUoIvC6pyMDmR/oshqXOy/03ZuPYiC6nlya
         cdyKIDSrnsE+uTzLA3DIwcTSojZUbloUG9kcpsr2es6fkVVy7RlF6r0PbdlKIhfZMdvq
         lc0cMpiim8yXKWZHlML0On92XxylNcenPoyC+s+XCnlSjPjYuj6N9QXd6MLrS/mscjdB
         EMDZXr6/JsCbF/dm/j5uKLMKw2P7c8LuyVRau5ImHi5h3gCHbmQlWC/+Vi/mRYz5FQ8g
         wTzBd5ZcBttG3UNjO+XesxBhXjsHYgtFJT1imoO1XBXg/QvpXfmUOaE90+jaS+CaELPk
         kKLA==
X-Gm-Message-State: AOAM53361xwK87HgMogWwtkYSfn3LBmGOZ/QGb4b2tbbpkKFbVrCZj5y
        HsiqK3y/LzpaTlrfSNIDtBY=
X-Google-Smtp-Source: ABdhPJw9y/M/11sN6pq8CixeRatTb/bCQnARPElCDgQqujKCMx2coLOLbKXC+H2LM9OGzXRXUTCUxA==
X-Received: by 2002:a17:902:44f:: with SMTP id 73mr17747623ple.178.1598568467922;
        Thu, 27 Aug 2020 15:47:47 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id a69sm3977438pfa.116.2020.08.27.15.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 15:47:47 -0700 (PDT)
Date:   Fri, 28 Aug 2020 06:47:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 00/20] gpio: cdev: add uAPI v2
Message-ID: <20200827224742.GA3714@sol>
References: <20200827140020.159627-1-warthog618@gmail.com>
 <CACRpkdZZMbfpKy4gcfAzNq53LkYLcL9wm3Qtzyj_K8vkUW9RfQ@mail.gmail.com>
 <CAMpxmJXRY2wqqN3SzfJN+QTWAHYSYz4vEjLKWU82Y=PAmcm=5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXRY2wqqN3SzfJN+QTWAHYSYz4vEjLKWU82Y=PAmcm=5w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 06:02:03PM +0200, Bartosz Golaszewski wrote:
> On Thu, Aug 27, 2020 at 5:53 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, Aug 27, 2020 at 4:00 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > > This patchset defines and implements a new version of the
> > > GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
> > > support for debounce, event sequence numbers, and allow for requested
> > > lines with different configurations.
> > > It provides some future proofing by adding optional configuration fields
> > > and padding reserved for future use.
> > >
> > > The series can be partitioned into three blocks; the first two patches
> > > are minor fixes that impact later patches, the next eleven contain the
> > > v2 uAPI definition and implementation, and the final seven port the GPIO
> > > tools to the v2 uAPI and extend them to use new uAPI features.
> > >
> > > The more complicated patches include their own commentary where
> > > appropriate.
> >
> > I'm ready to queue this now. Certainly any remaining snags can be
> > fixed in-tree.
> >
> > It kind of keeps in tradition with proper software projects "plan to
> > throw one away" which is what we have traditionally done several
> > times: the first Bluetooh framework was tossed, JFFS was tossed
> > for JFFS2, Video4Linux was tossed for V4L2. So let's do this.
> >
> > Anyone against? I will put it on an immutable branch and then merge
> > that in for devel.
> >
> 
> Hi Linus,
> 
> please hold it maybe for one more week - I'd love to have some more
> people take a look at the user facing header at least. Andy is usually
> very thorough in his reviews so I'm Ccing him here.
> 
> I'll too skim through the series one more time.
> 

I'd be happier with more eyeballs over it before it goes in as well.

I'm also wondering if it is worthwhile dropping the restriction on
changing edge detection configuration, that is present in
gpio_v2_line_config_change_validate() in patch 10, so long as userspace
is made aware that changing it may result in lost interrupts as we
may need to release and re-request the interrupt to effect the change.

Similarly changing debounce while edge detection is enabled, that is
disallowed in patch 12.

My policy when writing the implementation was to disallow any operation
that may have unanticiapted side-effects, and forcing userspace to
release and re-request the line(s), but that may be overly restrictive?
The particular use case I am considering is one I had been asked about -
changing a requested line from input with edge detection to output, and
vice versa. Losing interrupts isn't really an issue for this use case -
it is expected.  Yet the current implementation requires a re-request.

Cheers,
Kent.
