Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0EEB4B61F6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Feb 2022 05:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiBOELk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Feb 2022 23:11:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbiBOELj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Feb 2022 23:11:39 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89832B152C
        for <linux-gpio@vger.kernel.org>; Mon, 14 Feb 2022 20:11:30 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id v5-20020a17090a4ec500b001b8b702df57so1428531pjl.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Feb 2022 20:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3krFpT4PyPtyGc8aRBW6AzK9084YG4fmlvn0MKOFnTg=;
        b=QbrICrl2NESyaU9pLInGu9CQ9VEi7VBlJ5HkcB+xawaXT7ra+yuZ66zjAUb5hhzTFn
         mqoNOWOXe+aVHY/p35ceS4eRAbrAqhtK4H+tC1mq4wX6YI17iKuh7wQ8EcmO4z7aqNes
         K+7racGcMaThKo+bWThILPrQoTZdnpKPxHOQsBqpRRutEdMLlwTYAdT4l0I39NmYbqAx
         jv+rbf1Rq1viGKGEbVJA6hyMv7XEte6Fgj7WXgXFS0Uhfn1cqLFhxnFhNYEuI7cvzfdo
         erxD+NK8M/Oqd0E199khIAjjjhWc6qU5uKNTkKRbKby18zRlZA+NgQ/5uNiODFmGErO7
         qs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3krFpT4PyPtyGc8aRBW6AzK9084YG4fmlvn0MKOFnTg=;
        b=HEH0mpDEaRgG0eQ/A4MxBQ4hzGP8EuVFKkKNo6koHUEaecy1UcjqJ8pyYkPhVV+RLJ
         pNHexZvHg1XPLheeZxxBlyD6HRvJAgCgJn5R+v95Y1CW1dklJ9chqPkpsbRusFJbwaIR
         J3v5l9NS0nkWyI4HXfj4y2UWZGyFrND4o/JvSMWPuhMdNSgA+PGuQaxqTij1zvm9SiJc
         1bdxqOHPM6bma7CTNalBV0MpOzGg73RtXURcEuWgSaF/hRhkyLHVun28oCB9/i64S9Ze
         HLCZGAsAJWEIn4DbTl+dNP+vwPJTJbXGHhl51SERiUCcb4P38QrSB3RjGfzB7lvzVKZo
         2pLA==
X-Gm-Message-State: AOAM533Ibvemc3/ixnAYC1L6EhyE1pDDtE74wvgBoOp+A64t3kAtiPUI
        n4aIKcXNMI1ELALnrcFnYRflbLpq/EjAMA==
X-Google-Smtp-Source: ABdhPJw2OfZiQZPGvsR1G1wiBHHz1ar3c+sOMKfHFDfMSz12ZO+wyWqWKaH/rZ6pdupg4UeOegjqvw==
X-Received: by 2002:a17:90b:4f4b:b0:1ba:81fa:c6e3 with SMTP id pj11-20020a17090b4f4b00b001ba81fac6e3mr647424pjb.121.1644898289910;
        Mon, 14 Feb 2022 20:11:29 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id h25sm35300559pfn.208.2022.02.14.20.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 20:11:29 -0800 (PST)
Date:   Tue, 15 Feb 2022 12:11:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     "Hummrich, Tobias" <T.Hummrich@eckelmann.de>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod 1.6.3] Do different lines have to be in the same scope?
Message-ID: <20220215041124.GA15474@sol>
References: <17c74834c56e4345ac2611b92c301e2f@eckelmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17c74834c56e4345ac2611b92c301e2f@eckelmann.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 14, 2022 at 02:01:29PM +0000, Hummrich, Tobias wrote:
> Hi,
> 
> last week I ported part of our gpio related code from sysfs to libgpiod. I use the C++ bindings. I had some problems polling two different lines on different gpio chips and finally realized that all was OK if both lines were defined in the same scope. Out of curiosity I'm asking: Is that really the case in version 1.6.3 and was this intended?
> 

No.  I'm guessing you are doing something wrong, but I'd have to see
real code to be sure.  Code > 1000 words.

As the lines are on different chips they need to be requested
separately, they can't be combinied into a bulk request, but that is the
only restriction.

> The problem was this: When I declared lines locally in a method and called this method to get the file descriptor, the file descriptor was the same for both lines. Like:
> 
> int MyClass::getFiledescriptor(const std::string &linename)
> {
>     auto currentLine = gpiod::find_line(linename);
>     return currentLine.event_get_fd();
> }
> 
> ... returned 23 for both parameters "in1" and "in2" while gpioinfo told me that these names where unique.

I'm very surprised this works for you.  Note that find_line() and
get_line() methods return an unrequested line object.  You need to
request the line from the kernel using request() before calling
event_get_fd() - and that should throw if you haven't, which makes
me think your actual code is different or something very weird is
going on here.

Have a look at the gpiogetcxx and gpiomoncxx examples to see how a
line is requested.

What does gpioinfo show for those lines?
Why do you need the fd, anyway?  Are you confusing it with the offset?
And why poll when you can get edge events?

Bart - the need to request lines is frequently misunderstood - Gasai Maple
had a similar problem, thinking get_line() and set_direction_output()
would be sufficient to set the line output value.
Consider updating the documentation to highlight which methods require
that the line is requested before they are usable - even if they do
return an error or throw in that case.
This also applies to v2.

> 
> It is OK for me now, the two lines I'm polling are members of one class now, it works as intended, and I'm fine with that. But still I wonder if I misunderstood something or just did it wrong.
> 
> Is a new version of libgpiod published soon? Then this whole text may be obsolete.
> 

Indeed, if I were you I would be looking at the libgpiod v2 branch[1]
that will soon obsolete v1 and has a slightly different API.  e.g.
gpiod::find_line() is gone as it is problematic - instead you need to
call find_line() on the appropriate chip and it now returns the line
offset.
That is assuming you are on a reasonably recent kernel - libgpiod v2
requires kernel v5.10 or later.

Cheers,
Kent.

[1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/?h=next/libgpiod-2.0

