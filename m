Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D272A604542
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 14:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbiJSM2s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 08:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbiJSM2d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 08:28:33 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC92CF41B7
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 05:04:59 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id e129so16040769pgc.9
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Px1WsXpL4faLN2alPUKDz/PRF3Z0jmy0dRofcoecjLE=;
        b=QdYGaOyqG0DpgmQl1UtVRj+Gja1uZdlqporhPmSoec9fRYSrklkfkrTWkUNc5gtJB8
         zGkuRE0l5TCmnIZ+5RoPon7jQfNORvTaZ+grgwQEvur7fbvkY8fDPHwpEGw8oLcFeABC
         qRb+0EKeeZvd8tzFnIZQlN8UrOIIbCx8Hg7ggqB+q6MMg3KGJu1B56Z/Z4leQCsugSFB
         U5oagk9K6cwV3peSNtVybPPAmcBiPYbUwo07w0KBEgbDr2RVEKcEr8uxan3xRLLM2EF+
         m8A15AfFqreYO0DykeXBUSqm7BWfqSpVdWZKXUh3vp6X0BXju6OQr1hTf1cKB2bIrtUH
         gaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px1WsXpL4faLN2alPUKDz/PRF3Z0jmy0dRofcoecjLE=;
        b=3zCkBMkiG9zTMCWQXTfpHHxJehqThvwpUqneWCgKUxSww0bWGezEq4h5GXfChXf/wj
         a41Gs/r87tC6KFO/XAeMXfajDskrPRYIzZS+UihxctpxodcDKUL5LjtACGNkRR04vuWi
         5TNfYKhW0hqh8vuuU5ALGadyBGc4MsobVXlkFWFCzQvP4qkYhaB9c4mTqAYbkyJ4BppD
         vhG+T4O8lMfFrOm4A0N3U8ts62m1TskokWOeGy1331rPVqNMmGdHWeCuxTNQt8UKs9gy
         XcLAUywhgJIRL7E7xceQyBMU7JqXGK4BulG1dd96Hm7Ssr3mUmJPe7BOSaftOohXx5nI
         ji/Q==
X-Gm-Message-State: ACrzQf0491iTU21NV2haBvWT3FZoftmY0hmmTRU44o0aqK7pmcJ3eacf
        UU+qD4hvj8lWarBckcZDLSI=
X-Google-Smtp-Source: AMsMyM7CRx5tOkoG7fiANlWnSYdFILkH9I2aPIad3KZeRfQcqYuiOdJqG2EmCmin42IX8ogwQqxh0A==
X-Received: by 2002:a63:c104:0:b0:459:c6a1:15c0 with SMTP id w4-20020a63c104000000b00459c6a115c0mr6693081pgf.588.1666180924250;
        Wed, 19 Oct 2022 05:02:04 -0700 (PDT)
Received: from sol (14-203-42-90.tpgi.com.au. [14.203.42.90])
        by smtp.gmail.com with ESMTPSA id y23-20020aa78f37000000b00562a5f29ac1sm11236949pfr.100.2022.10.19.05.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 05:02:03 -0700 (PDT)
Date:   Wed, 19 Oct 2022 20:01:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <Y0/nNRu0OOXXfq/h@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
 <Y01RqjgZINnkcyIC@sol>
 <20221018112204.l36wnimrqvexnvat@vireshk-i7>
 <Y06S5GCFYeaPEW9E@sol>
 <20221019064612.p4gu33dm65rnjwl6@vireshk-i7>
 <Y0+lZ9qcNGX1Q/Of@sol>
 <20221019112251.oyfek3gjodyt67lh@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019112251.oyfek3gjodyt67lh@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 19, 2022 at 04:52:51PM +0530, Viresh Kumar wrote:
> On 19-10-22, 15:21, Kent Gibson wrote:
> > That doesn't really work - you get a link to the files in github, not
> > as a web site.  You need somewhere that will host those generated files
> > as a web site.  You could do that with github-pages if you don't have other
> > options.
> 
> I don't have other options for now, so it is github.
> 
> > When I've done that I would commit the docs to a separate
> > branch, just for the docs, and have github-pages host that branch.
> 
> Okay.
> 
> > If you eventually publish your crate to crates.io you get documentation on
> > docs.rs for free - and you can skip the documentation key in that case too
> > - it defaults to the appropriate page on docs.rs.
> 
> Right, that I knew.
> 
> > I assume that would be the case long term - you just need to find
> > someway to host them in the meantime.
> 
> I wonder if we should be doing this at all right now, or if required
> only Bartosz should do it instead of me, once this is merged ?
> 

I was assuming it was an interim solution, so it doesn't matter so much.

I'd be happy with docs.rs once libgpiod v2 is released and the bindings
published to crates.io, and I'm personally good with looking at the
generated docs locally in the meantime.

It would be easier for others to take a look if the docs were hosted,
but I don't have any feel as to whether that is worth the effort or not.

> Maybe we need a libgpiod username for that on github ? To make it
> independent of personal usernames ? From what I saw, the website name
> will be username.github.io eventually.
> 

A libgpiod group account might be useful.

And it would be nice to have a libgpiod space somewhere, not just
piggybacking on the gpio mailing list.  Not sure if github is the best
place - but I haven't given it much thought.

Bart, do you have any opinions?

Cheers,
Kent.
