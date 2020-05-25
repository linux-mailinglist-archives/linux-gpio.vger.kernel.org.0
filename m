Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F3E1E1053
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 16:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390897AbgEYOTJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 10:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390870AbgEYOTJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 10:19:09 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CA5C061A0E;
        Mon, 25 May 2020 07:19:09 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id v63so8874252pfb.10;
        Mon, 25 May 2020 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OLgmeYVGZXrkZOzVtobLf8KYagc1Ru99Oter6TayP28=;
        b=McRwpMFwL2GwANU7i7pPIJzTK2vBJL3q6oU1JordXmOja9i5MfCP2WuX52WLeahfb+
         cErAfgipDSrgbQ3AqtdhRvi/KTj3VYiazno1w8qrcUK12yf4HtrmUtVV3e8f6YE4o3DX
         XsKUh3XU4Xcxr6Vv9PfK2stlH9TWR7Ek5JXMqrXat27ggjSKSz+C2ud+ms4qJmw/hDqK
         kypGSQalnAlAtE7edTtljJUTmT0vmK+bwiTGMsqpL+09DeL5S9msSoEp7WwJGyz0HpS4
         s6eI+Pjzwh43sAbjyPKCdOTpiO2QhURw0nDjRhq2YiROu7/QAgBFcya8CMqRmNaHsZFM
         B68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OLgmeYVGZXrkZOzVtobLf8KYagc1Ru99Oter6TayP28=;
        b=lFx7u+UokrejwKIvj21QykGWrNMeDpUhKLWuCFAqsLI+7SwtJJy3dxxfeShspTepCU
         w5Daga4CKXrxmGer1R0s/rIQKDykBIWqoSKy4l/cD6OEkYzc99yv9kHw84QUYonWWWWJ
         c/AiEd7HbVLcYqg8eq6TCMhbUN3zlbNM/gmphkEC3EANbBCzAwa4s754Lc6figT7iv7y
         rfxnzj7c8s0zebEIKCJ0vI6oBAyei38ShcXSArwW07EDXT8HKDvYd4TtRF7XWeT66CkO
         130uhBWShj3ciU83WHHvAQ8WMGaZdpX5FXWSx/YFbe88KO6IKq2k+DWJcvWGoqmf4PHy
         18tQ==
X-Gm-Message-State: AOAM531qAfQV/UA/UoxYdfoC1BwsRJsWX4uxbwDAoOauBOn8prGQGfYN
        kFjg9njUlA9SQt6EMIm6jVJye2O9eTI=
X-Google-Smtp-Source: ABdhPJw6oiFgQzylvXFpXW6V+V8h0Ie8cogLaZCO/NgLDd53stGrJrlj8hCAv+ulcteLnMqvQkrogw==
X-Received: by 2002:a62:e419:: with SMTP id r25mr17238043pfh.82.1590416348655;
        Mon, 25 May 2020 07:19:08 -0700 (PDT)
Received: from sol (220-235-68-201.dyn.iinet.net.au. [220.235.68.201])
        by smtp.gmail.com with ESMTPSA id n2sm13147723pfe.161.2020.05.25.07.19.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 07:19:07 -0700 (PDT)
Date:   Mon, 25 May 2020 22:19:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
Message-ID: <20200525141902.GA27938@sol>
References: <20200516064507.19058-1-warthog618@gmail.com>
 <CACRpkdbputuoHFWL_FhUNR-ZywvJt=qYdaa+i2cLt-Odmgxe2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbputuoHFWL_FhUNR-ZywvJt=qYdaa+i2cLt-Odmgxe2w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 10:39:42AM +0200, Linus Walleij wrote:
> On Sat, May 16, 2020 at 8:45 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> > Add a new version of the uAPI to address existing 32/64bit alignment
> > issues, add support for debounce, and provide some future proofing by
> > adding padding reserved for future use.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> 
> I don't see any major problems with it, just some comments:
> 
> + * @padding: reserved for future use and should be zero filled
> 
> *MUST* be zerofilled is what it should say.
> 
> > +struct gpioline_config {
> > +       __u8 default_values[GPIOLINES_MAX];
> 
> So 32 bytes
> 

Actually that one is 64 bytes, which is the same as v1, i.e. GPIOLINES_MAX
is the same as GPIOHANDLES_MAX - just renamed.

On the subject of values, is there any reason to use a byte for each line
rather value than a bit?

> > +       __u32 flags;
> > +       __u8 direction;
> > +       __u8 drive;
> > +       __u8 bias;
> > +       __u8 edge_detection;
> 
> Some comment in the struc that this adds up to 32 bits?
> 
> > +       __u32 debounce;
> > +       __u32 padding[7]; /* for future use */
> 
> What we need to do inside the kernel with all of these
> is to ascertain that they are 0 for now when they are
> sent in and refuse them otherwise, I think it was Lars-Peter
> Clausen who said that they had to retire a whole slew of
> ioctl()s because some userspace just used unallocated
> memory for this and since that was random bytes it needed to
> be supported with that content forever and the reserved
> padding could never be used for the reserved purpose.
> 
> This kind of comment goes for all the structs.
> 

OK, I wasn't sure how strict the validation should be on the kernel
side, but I'll take a strict stance and check the whole struct.

Having said that, when adding future fields, the idea was to have a bit
in the flags that indicates that the corresponding field is now valid.
If the flag is not set then whatever value is there is irrelevant.
e.g. the debounce field value is irrelevent and ignored unless the
GPIOLINE_FLAG_V2_DEBOUNCE is set in flags.
OTOH, if the bit is set then the field would have to be set correctly.
And the current kernel would reject a future request with an unsupported
bit set in flags.

But definitely better to play it safe - will check the padding is
zeroed as well, as well as any field for which the flag bit is clear.

> But mostly it is a question about the kernel code receiving
> or emitting these.
> 

For sure - all the structs returned will be zeroed before use so as not
to leak kernel stack - unless they originate from userspace of course.

Back on retired ioctls, I notice that 5, 6, and 7 are missing from gpio.
Have those been retired, or just skipped over by accident?

Cheers,
Kent.
