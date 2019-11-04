Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5088EDD84
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 12:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbfKDLMD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 06:12:03 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34388 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfKDLMD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 06:12:03 -0500
Received: by mail-pf1-f196.google.com with SMTP id n13so253955pff.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Ojk30IcRGu0sI1mIfoqsI/Uy2iQzcFEIdcNVv/xqd+w=;
        b=Eh9hYDhx9mBGQ3iPHdzmmkEFd6i3GhrjKAqZl4HZ3WUIgJDwK6vjl3dfiMSQ+Bx6v+
         LeLWLdgfMijsvm6rJWYG6a2Mrl63La4/0vlkfpvxEUC/nJsejn+w0F0ULH+0UOdthfmp
         AQNKiAZP5uQX1shW0b9X5NjMAlAO3l3St743z9MkHA7+AwH53rTlqp3PB4sm4kexLy21
         Os9Ovo9OtPhHdNd+QdB6qfFiGTPVsQegWqxYab8Bg0DitMZE0IOjNNytrCc7pW2lygPJ
         FgZ4BD6pCSkbZJx+28VpKBc6zWgCGHclWBXG/Y+Ijn+J4F2UBA+TbBE7yEjpmQGEH9un
         C4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Ojk30IcRGu0sI1mIfoqsI/Uy2iQzcFEIdcNVv/xqd+w=;
        b=QSp2rpRAVrvjXBN23NcW5l17kNvur/iDM66kV6k8WUYfnVwCII5LKmvt6ZRl/EcMqY
         Mh9skIsFvrKxsaVAzMQnUzO4gA9o5kzkHZDnYA4aH0B1ux4JkJg6MVuZXzlkOjDKe/32
         caTikgeBqerk7FyOJKUFrVOnajm9LheGFtL33lALrybqdWvg84EImu/xZRa7l/dvrFlz
         5iiRk4wWMACC7WdzWM+lMEP4bIk0s1wN6bOSnL9pRBAOkn6XrWwNBXZmu9/Qng3CEzRt
         w4fpK9+zuyxMnvXhFKekXkJbaJq6aebArfmqjZIj3A405j39Og/XQ3Bl76jw9g3plj4s
         B/Xw==
X-Gm-Message-State: APjAAAXmAc0cSWuz9+tKtupy48yIvbMJXpzFK/60v7NldK1lkCWuwNcy
        +JIpJxXfEUPANU+9BkqU218=
X-Google-Smtp-Source: APXvYqyuHKK7rq2RU62WVH6v2jq1oHrAB56Pdl5IDCcLETaMrNNBX1OhdjmSvIj0Ebm3q1Ey2EDIpA==
X-Received: by 2002:a62:e519:: with SMTP id n25mr30180102pff.144.1572865921712;
        Mon, 04 Nov 2019 03:12:01 -0800 (PST)
Received: from firefly (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id a6sm22714166pja.30.2019.11.04.03.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 03:12:00 -0800 (PST)
Date:   Mon, 4 Nov 2019 11:11:48 +0000
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v4 0/5] gpio: expose line bias flags to userspace
Message-ID: <20191104111148.GA3648@firefly>
References: <20191028073713.25664-1-warthog618@gmail.com>
 <CAMpxmJUO3O05d6ZQijF4+1OCf5E7oeYOPVMZCmOXBV9-VJz5jw@mail.gmail.com>
 <CACRpkdayzONkSnHr+C7e2NVrDP7_Di+PTK6MtM0Kx_Mte+=2Cg@mail.gmail.com>
 <20191104010736.GA9134@sol>
 <CAMpxmJUim4SV43McHR2X0Ukc2_zZrdj=cZPvAaETyp4kSObCSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUim4SV43McHR2X0Ukc2_zZrdj=cZPvAaETyp4kSObCSA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 04, 2019 at 11:14:56AM +0100, Bartosz Golaszewski wrote:
> pon., 4 lis 2019 o 02:07 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Mon, Nov 04, 2019 at 01:26:54AM +0100, Linus Walleij wrote:
> > > On Thu, Oct 31, 2019 at 8:10 AM Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> wrote:
> > >
> > > > [Kent]
> > > > > This series adds gross control of pull-up/pull-down to the GPIO uAPI.
> > > > > Gross control means enabling and disabling of bias functionality,
> > > > > not finer grained control such as setting biasing impedances.
> > >
> > > Right, excellent and persistent work here, much appreciated!
> > >
> >
> > No problem - hopefully I haven't irritated too many people in the process.
> >
> > > As long as I get Bartosz's blanket ACK on v5 I think it is ready
> > > to merge. His consent is required for this.
> > >
> >
> > I'm still waiting on open questions from v4 before submitting v5:
> >
> > One, handling of errors when setting bias, Bart has referred to Thomas,
> > so waiting for feedback on that.
> >
> 
> If we can get it merged for v5.5, then I don't want to block it
> waiting for answers. Looking at the code I think we should only ignore
> the EOPNOTSUPP error and propagate all other codes. Can you add a
> patch changing that and then fix the other nits I pointed out? Also:
> please Cc Thomas Petazzoni so that he gets the chance to yell at us if
> it breaks something.
> 

Will do.

> > The other, where gpio_set_bias is hooked into gpiod_direction_output,
> > is fine as is for the UAPI - it can always be relocated subsequently if
> > other APIs need to set bias.  On the other hand, if decoupling setting
> > direction and bias is in order then that really should be done now.
> > Can I get an an ACK on that either way?
> >
> 
> This is in line with what you did for input. I don't think it should
> be decoupled (any particular reason for that? There is none mentioned
> in the cover letter), so I propose to leave it as it is in patch 5/5.
> 

Wrt decoupling, I was thinking of both input and output, not just output,
though it was the output that got me onto that line of thought as
gpiod_direction_output sets bias, but gpiod_direction_output_raw doesn't.
That seemed totally arbitrary.

That lead to thinking that the gpiod_direction_output (and _input) is now 
doing more than implied by the name, and by the documentation for that 
matter.  So perhaps it should be split out and promote gpio_set_bias to
gpiod_set_bias?  Anyway, that was the line of thought.
The problem there being some callers of gpiod_direction_input already
expect it to set bias, at least on a best effort basis, and they would 
have to be updated to call gpiod_set_bias.

Maybe just update the documentation for exported functions that do set 
bias?

> One more thing - since we all want this to make it for v5.5 - can you
> make the set config patches part of this series (simply bunch it all
> together)? This will make it easy to review and merge everything.
> 

May as well - I've got it all in the one branch anyway.

> Thanks in advance and great job!

I was about to start updating libgpiod to add set_config, after adding
the equivalent to my gpiod library (nearly finished writing the tests 
for that), but I'll put all that on the back burner and get v5,
including in the set_config patches, out as soon as I can.

Cheers,
Kent.

> Bartosz
> 
> > I've also made a couple of minor changes myself while reviewing v4 -
> > reordering the patches to group the gpiolib.c ones and leaving the
> > gpio-mockup til last, and removing the "bias requires input mode" check
> > from lineevent_create as the line is assumed to be input for events
> > regardless of the input flag - there is no such thing as as-is for
> > event requests.
> > Only mentioning here in case such changes are clearly wrong...
> >
> > Cheers,
> > Kent.
> >
> > > It looks pretty much as I imagined it when I discussed it with
> > > Drew some while back, with some gritty details fixed up.
> > >
> > > Yours,
> > > Linus Walleij
