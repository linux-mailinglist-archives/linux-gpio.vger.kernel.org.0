Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5908058375B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jul 2022 05:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237366AbiG1DLP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 23:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234002AbiG1DLN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 23:11:13 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9565321E27
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 20:11:11 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id y15so640703plp.10
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 20:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jpkmprCO3jCTFA9hm3nL6EnsvPxdHY6bNiIIhdu1pC8=;
        b=ELCwfNHJZeoJkVEpPy3wUeZYIPZ897m6xuufwUqAmNAOpKikA75zrCrlo9juuYNwME
         U9EWTOTR7mpdlfyy+YylUirv2KcljkqFAi93EygqjnnUI/6Lv8ik+kOjOZ1BSjvnRy90
         +vmba2aK2Ax0yUmmaFXRd3OHhODJsOpwadgPRti9kq409ac5m2qO/GmkjRvA+Qhkq36E
         d/kIgzAYy4OZQ1xaUYXK/2HMc/apE0g2S+LlVAWqdwfCqipGdBfkM6GeKAzUL2gy1IGl
         Hf2exHDof1934zu6hX6S9wCovtXvJ+zHaAV0b75uuJfIrsxxivMhBSkKeM8c0ZcAs/2J
         UCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jpkmprCO3jCTFA9hm3nL6EnsvPxdHY6bNiIIhdu1pC8=;
        b=MnWDWBBHc0swN+8H2PRBTUlLAUuKngePLYfD9XNHLGCxFiHOFZD/GN6RR7g0UP3/2Z
         54HJTIqxJHy5nMm3Uy/k4uznJ+NfijAxlyrGIMAy+JsgavWzOYt/+s5whVlz9NiezRV0
         fsuOCtFpN4LeyI6pzPzs74topNLBaNBwmiSlw5gKa4V0ondFGrDKRIc2WpbrFi0Cklc5
         9bMSYKM/TsZhVgcs4JLU9KuVDM3GF6cF7pJBN1N0Ub55NogDm7DmLPl99gNwGCgvaFn7
         xff357jvbdyBKKxXr7bxPHYszj1qIZcDNPw0NSBDxY1wmdlhvJvrEqPFvCGzJ5Lcwoh3
         TizA==
X-Gm-Message-State: AJIora/c+aQcYGjBAT2zI1tkTNANVJ9j7Ho29d39SmTrINPt0GSkiorF
        GB8oxK9XBtaWqCjtZ0Y304Y=
X-Google-Smtp-Source: AGRyM1sE2KaD8Gu4lL2BrWJdan+Q4Il/rQ6kWT+sd1SdGibDDYT9V+ahnKiSIGfnYQr97sSJADTKpQ==
X-Received: by 2002:a17:902:d890:b0:16c:abb4:94d0 with SMTP id b16-20020a170902d89000b0016cabb494d0mr24467876plz.50.1658977871027;
        Wed, 27 Jul 2022 20:11:11 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id 186-20020a6214c3000000b00525496442ccsm10667613pfu.216.2022.07.27.20.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 20:11:10 -0700 (PDT)
Date:   Thu, 28 Jul 2022 11:11:04 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220728031104.GB15896@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol>
 <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
 <20220727100809.GB117252@sol>
 <CANiq72mXH2Z-5aOu6dz47-hDPZjNQZAqYeGPv1vu3fARHJUtuw@mail.gmail.com>
 <20220727124051.GA130052@sol>
 <CANiq72nGS492exNopKBZnbS72A4jaCYHAV_faSaMDuqE2P23=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nGS492exNopKBZnbS72A4jaCYHAV_faSaMDuqE2P23=g@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 03:02:10PM +0200, Miguel Ojeda wrote:
> On Wed, Jul 27, 2022 at 2:40 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Unfortunately the C header doesn't currently provide any guarantee -
> > except in the cases where it CAN return NULL.
> > But we can fix that.
> 
> Yeah, fixing that is what I was suggesting, since it is a possibility
> here, and would improve things for C users too.
> 
> > Not sure I'm onboard with that.  Unless the API has a contract not to
> > return a NULL then it is free to at a later date. The user should
> > always assume that NULL is a possibility, even if they have never seen
> > one.
> >
> > But in practice you are probably right.
> 
> I definitely agree that a client should aim to avoid assuming anything.
> 
> However, if we are strict, given C pointers are unconstrained, all
> pointers would be useless unless told otherwise, because checking for
> NULL is not a guarantee of validity either.
> 
> Also, if an C API just says "returns the name", for instance, it is
> reasonable to assume it is a valid name because it is not said
> otherwise (e.g. it does not say "returns the name, if available" nor
> "returns an optional name").
> 
> And, of course, eventually consumers will end up relying on your
> particular implementation no matter what, and returning invalid
> pointers where there weren't before is a very dangerous idea for a C
> library.
> 

All true, but practically speaking the only cases we need to be
concerned with here are NULL and valid.  NULL is the only one we can
detect for certain, and we have no alternative but to assume valid if not.

> > I'd be fine with that.
> > I'd also be satisfied with a comment in the Rust that the C guarantees a
> > non-NULL where that is the case.  That would at least demonstrate that the
> > possibility has been duly considered.
> 
> I think the current `SAFETY` comment already intends to imply that,
> but yeah, it could be clarified.
> 

The comment is:

    // SAFETY: The string is guaranteed to be valid here.

and that is whether there a NULL check or not, so it isn't clear what
the source of the guarantee is.
I would prefer:

    // SAFETY: The string is guaranteed to be valid by the C API.

and updating the C header to explicitly state it returns a valid pointer.
It currently says "Pointer to a human-readable string" which could be
taken to mean valid, but making it "Valid pointer to..." would more
clearly place the onus of it actually being valid on the C library.

Cheers,
Kent.

> In any case, I would say it always returns a valid pointer, not
> "non-NULL", since the latter does not really show it is a valid
> pointer (it could point to a non-NULL, bad address).
> 
> Cheers,
> Miguel
