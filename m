Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D018271354
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Sep 2020 12:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgITKsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Sep 2020 06:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgITKsc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Sep 2020 06:48:32 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F04FC061755;
        Sun, 20 Sep 2020 03:48:32 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b124so6487404pfg.13;
        Sun, 20 Sep 2020 03:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ckywbst0H6+Lz6mtGf7VZ8LvRCLnr8rkKra487dI2jg=;
        b=h2NOR/VXE3wlXPmVyZpsSZVZQFAjPUlr6FGWRBmRlwfRuEnn6JCF5lu/Fg2ar1F6s+
         WcgrYNerKtVXzLMa5ImiwQypoxjm+1yNFXBQtMLEDX1N5DRlAwECwAueRnJzwTovKXN0
         vph5DZ9A9fucVsNBiuZTbWTuIAOlwVqXqqqJWqyRd42p/OS0XCLLtt+eI5pkDbY6Wld5
         Hql6IPs9Qz34UKbVW4XiNUTpxyFarF/PQhjpuRCblUI60HoGa94ZC82BKTLSWwiip7fQ
         DdhnTKxNAG+MwHfzMoATHSM6RuoF8G5DpJ6XZk8OciE8fWYnJrgY8piC/gMJqbdzVdAH
         eczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ckywbst0H6+Lz6mtGf7VZ8LvRCLnr8rkKra487dI2jg=;
        b=TYsZ5wTns1PZMWFHPP+lZRTQtiaUUqy6gL5adpkeWvvqYv7prWQtL4Q1qPE4qcLT0W
         zr19KBFy3U368mpB7ekNrdDlRQs9BTGF0yeVPW5OVImvgDan8nVvEbz5euz43WY8bdvS
         SJwxwFCiy47Q5UUXHOJuytYRu1bpiIJX/LxkNtw74bmepoPZOM65SLKSKZcfjy8ZEbyh
         eDLl6GQ5gouI1eNdBM4TJobw34Z/t/w0UdfzC77RFguF5DzilV++dScHcjvTpN61W5wu
         6VDsanQk6hhgwNLBMyY/b5LaMoJPIVpuPhK4/p9KcoTVNqmAN8FrQe5cYiOE7a7EgiTv
         o3Cg==
X-Gm-Message-State: AOAM533GIhyObudEkNrHg/GVhvoDZUrqh+DGkwCZUNAAJn1NS8TVWwbD
        4RBNYl+ntOfTV1SFCcoHRpk=
X-Google-Smtp-Source: ABdhPJwDLSg9MlG1DNXBi7rMgKnwhW19wzuVlHCdL8y+Vl+/JPCGS7Jaq/Xp0P6aXlq8zhQMovjoQQ==
X-Received: by 2002:a63:e141:: with SMTP id h1mr102058pgk.289.1600598912100;
        Sun, 20 Sep 2020 03:48:32 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id y13sm9121837pfr.141.2020.09.20.03.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 03:48:31 -0700 (PDT)
Date:   Sun, 20 Sep 2020 18:48:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 04/20] gpio: uapi: define uAPI v2
Message-ID: <20200920104826.GA793608@sol>
References: <20200909102640.1657622-1-warthog618@gmail.com>
 <20200909102640.1657622-5-warthog618@gmail.com>
 <CAHp75VdF1be-W3iV2JfWYZzEhrj13+5A+1Y4J8XgpBrkvg8cZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdF1be-W3iV2JfWYZzEhrj13+5A+1Y4J8XgpBrkvg8cZQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 01:06:36PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 9, 2020 at 1:29 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> Thanks again for doing this and sorry for quite a delay from my side.
> Below my comments regarding uAPI v2 (mostly nit-picks as I agree with
> it in general).
> 

No problems with most of your points - so I'll chop those bits out.
Responses to the remainder below...

> > +/**
> > + * enum gpio_v2_line_attr_id - &struct gpio_v2_line_attribute.id values
> 
> Perhaps per-item description (couple of words per each)?
> 

I'll add kernel doc for all the enum values - see if that works.

> > + * GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed together.  This is the default for
> 
> I think "OR:ed together" is understandable for programmers but a bit
> special for normal phrases. I would rephrase it somehow, but I'm not a
> native speaker.
> Something like "or any of their combinations".
> 

My bad - I was assuming the primary audience was programmers ;-).

Actually that description is drawn from the v1 uAPI, as is the case for
all of the fields that were carried over.

And "or any of their combinations" is misleading - some combinations are
invalid.

I'll take another look at it, but I'm ok with it as is. (and I' ok with
'ok' over 'OK' or 'okay' as well, btw ;-)

> > + * @attrs: the configuration attributes associated with the requested
> > + * lines.  Any attribute should only be associated with a particular line
> > + * once.  If an attribute is associated with a line multiple times then the
> > + * first occurrence (i.e. lowest index) has precedence.
> 
> This is a bit unexpected. I anticipated last come last served as in a
> shell script argument list.
> 

I don't want to encourage userspace to just add another entry to attrs
to encode a change.
The behaviour was originally as you describe, but was changed in v3 to
encourage userspace to keep the configuration attributes as simplified as
possible, and to make clearer that the fields, particularly the flags bits,
are not overlayed.

> > +       /*
> > +        * Pad to fill implicit padding and provide space for future use.
> > +        */
> 
> > +       __u32 padding[5];
> 
> This is still questionable. First of all why to waste so many bytes (I
> propose 5 -> 1) and how will you do when the structure changes (we
> still need some type of versioning or flags for which one u32 is more
> than enough).
> 

Ack - we disagree on how to manage future changes and the impact of
reserving space.

> > + * @num_lines: number of lines requested in this request, i.e. the number
> > + * of valid fields in the GPIO_V2_LINES_MAX sized arrays, set to 1 to
> > + * request a single line
> 
> I would rather call it "amount" or something which is one word, but
> you may have a reason for the current, so I don't insist.
> Also, I would describe what will be the expected behaviour outside of
> the range (and what is the range?).
> For example, would it mean that we consider all lines if num_lines >=
> _LINES_MAX?
> 

Using num_X to describe the number of active entries in array X is a
common pattern, so I'll stick with that.

And num_lines > _LINES_MAX is interpreted as invalid - since they wont
fit.  The EINVAL the user will get if they try should make that clear.

> > + * @consumer: a functional name for the consumer of this GPIO line as set
> > + * by whatever is using it, will be empty if there is no current user but
> > + * may also be empty if the consumer doesn't set this up
> 
> In both cases "empty" means what? All \0:s, only first \0, white spaces?
> 

Another one inherited from v1 - empty => consumer[0] == '\0'.

Cheers,
Kent.
