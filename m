Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38BCA72F7A1
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 10:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbjFNIT2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 04:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243282AbjFNITK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 04:19:10 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DB626BA
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 01:18:53 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-662f0feafb2so4726626b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 01:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686730733; x=1689322733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DeiiW53EHKVe1d20nqbhV0MHZUE+LmF39mmJPN7okDw=;
        b=fuRbhYov+CgdFyBNAsPT1n0PtNklgJ2nY8Smw0NZBqaNv9sKinTCidaORg6h6QsQ0I
         5l2CEbrmWaCo1GR5wilwX9ZkzxIGPf5Pm3xa8hYJsywEsHSqzN2CLixcwoi2T8x/bfnT
         BnQUz8RtQL387u8ZZRbvYuyg8Z4Y5xwFqfgIVbiUufFd01gNVSFZ/+f9t/6lDKcquK10
         YESeaiFQLKZdR8FTepZj9M5idw8rUesHXIChQQxqBdPNSLaRfiqBiWZnLGUH/Z05RfcR
         Kat/uKiRlHHm0nSxRAi+ZCE8PoxWXbHeRak8jX10URRNfjaWcEewRJaSYrBCqHfx8/87
         DFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686730733; x=1689322733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeiiW53EHKVe1d20nqbhV0MHZUE+LmF39mmJPN7okDw=;
        b=YH8QfSU6qyRpI+Oi8V8GmmEuQMteMyBg3qRmBJ4AZqyPGRjOGlj9LDyDxd/Rzdr7V8
         D7calPY7+7Wv74GMNM0fSSDYuFuqASFxrKSuI0qnYUZ0ekRlUyYWWV80YX7XoXfIXay1
         DfpwicyLYG+3nTmXSNY8RsnVsZvSOh5RECjDGGF3HLg81R9gyeI98HDiQtDPhfSczoV3
         BzBAXbf+I4Vw9GlO3tVkx2hYFjBk4JLLTGx7XAHcQGOhUdeP1RLX8a8+3dvqtzKPWKtm
         OAs2WT9oGvoLWrhzpGEsxqzPdLr3vLpYONZGAMAP+BKvtUSqI3zRv0XVBCSeqekWjp3M
         apow==
X-Gm-Message-State: AC+VfDxgzUG1KyVj1zBQJoIfQTJclGVuoD2YWqWqmFEvfangaNoOrlfv
        SBQbQg98cdAtCNUa0lediM8IM0zs/cM=
X-Google-Smtp-Source: ACHHUZ6B5ckqNQ9sfbdya1dPF8bOlGzqp3Qt1pSB7vAI5wgXK+P5ndWqVRAY0MevelNY2ntylnk4cA==
X-Received: by 2002:a05:6a20:12d2:b0:117:3c00:77ea with SMTP id v18-20020a056a2012d200b001173c0077eamr1385771pzg.0.1686730733115;
        Wed, 14 Jun 2023 01:18:53 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id x16-20020aa79190000000b0064f76992905sm9810376pfa.202.2023.06.14.01.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 01:18:52 -0700 (PDT)
Date:   Wed, 14 Jun 2023 16:18:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH 4/4] bindings: rust: examples: add dedicated
 examples
Message-ID: <ZIl35wFvID2uA5fg@sol>
References: <20230614035426.15097-1-warthog618@gmail.com>
 <20230614035426.15097-5-warthog618@gmail.com>
 <CTC7KTWRXMS4.1G8UBSCYLSMIT@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTC7KTWRXMS4.1G8UBSCYLSMIT@fedora>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 14, 2023 at 09:52:20AM +0200, Erik Schilling wrote:
> On Wed Jun 14, 2023 at 5:54 AM CEST, Kent Gibson wrote:
> > Add rust equivalents of the core examples.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> 
> Reviewed-by: Erik Schilling <erik.schilling@linaro.org>
> 
> Some nit-picks below, but those are a matter of taste and the change
> looks ok either way.
> 
> > +
> > +use libgpiod::line;
> 
> I think one could also just import the other used modules. Or, since
> this is an example anyway, just `use libgpiod::*`.
> 

I'm never keen on using `::*`, as subsequent changes could pull in symbols
that conflict with locals.

And as this is an example I wanted to be explicit as to where the symbols
originate, especially as there is some overlap, e.g. line::Config and
request::Config.
The general rule is, if it is only used once then use the full name.
But there are so many line attributes that using the slightly shortened
form made it more readable.

> > +
> > +    let value = request.value(line_offset)?;
> > +    println!("{:?}", value);
> 
> Could also be:
> +    println!("{value:?}");
> (same below)
> 

Fair enough.  I'm old school so I tend to prefer printf style.

> > +                "line: {}, type: {}, event #{}",
> > +                event.line_offset(),
> > +                match event.event_type()? {
> > +                    line::EdgeKind::Rising => "Rising ",
> > +                    line::EdgeKind::Falling => "Falling",
> > +                },
> > +                event.line_seqno()
> > +            );
> 
> println!("{: <8}") could also be used to pad things (would allow
> removing the trailing space).
> 

So add 4 chars to remove 1?

Ideally the padding would go after the comma, and then you start getting
into compound fields, so this was a case of KISS.

Cheers,
Kent.
