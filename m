Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94873638228
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Nov 2022 02:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiKYBs6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 20:48:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiKYBsj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 20:48:39 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD48E2A268
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 17:48:34 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id w79so2890459pfc.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 17:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xKVEYNejiQ6k1RXT1Nwh0CbIdSq3PLw5CjAskjHQE+A=;
        b=F6Z3f9SYWpWViG3qy3em7Kl4fjTjpRngKn4NNAbyI8PPB7i5ysXUZfe3yQRu4Aj7FR
         DH1V9ABU7syYYyfxaxgGK4W1xOEYubxXq5Svqo1GJUJaMZSPcYlHkqKEix05dKNXqyVm
         fJxj30jkZ4vOHoYRfNhzoFTmW3Rc6Uxs/BA/jy1Hp1lauJvebX+205fXJMSfA79WFOwm
         h40P0kAAdzMbNATpH690gK4W8/+oOcNWmJWYgcgq4Ew++6mD45BdYNjaNiLLYol/5vn2
         pV+A7kPQuPl5ut1kNTBodSnUeI/KXtJ+k10Q5pR4QuTrGMnuxMDxhnAnTi8SNFqVbTfM
         G6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKVEYNejiQ6k1RXT1Nwh0CbIdSq3PLw5CjAskjHQE+A=;
        b=AdzL/gGcahl7bX7n6wcnKBkCN9Q+wow2G/sXnWD50cm/T/uKyU1ubcpV82I28eLFfU
         2wiuPfF0ovFaSl8LdXXrbc1PTFcV4j3RdSRGSnvJ3v82bnZGh75gEzRabtBESzzdNxHZ
         QZWPpUewS0vDONVIVtp8VgPD8CHQnwpW9stsg+D8wbFSprbdZNNWuyOdr8zY0+cBxWwp
         D8pL87o4Zq85+yCvEZ6g1YjHbuHj/cEI1fz8P3UE1n25imHbkWCDZ7/+Un/YPKTnagDV
         rrhWjT/PhS3ps1f6sTTPc3KQJ0aAF9Lydi4qB2Kto36Sgm08mLl0krhM73/0ZBEC6tVH
         Osug==
X-Gm-Message-State: ANoB5pmEIYS883sWlt3O5xK2ylux8n3Ui9LmgLE90ubf7czsCT8YAPBn
        YPuG1xybqEwrildCYmXOA3aYsPqYcyY=
X-Google-Smtp-Source: AA0mqf7jFNWKJSepLBKET69vPSTLmzTIVs8ZCGoDCMNZ49zmkPeih4niq80gFuNKMmtpN2DeD/yb6g==
X-Received: by 2002:a05:6a00:1515:b0:56b:abf4:f77c with SMTP id q21-20020a056a00151500b0056babf4f77cmr19113802pfu.37.1669340914194;
        Thu, 24 Nov 2022 17:48:34 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id o9-20020a63e349000000b0047685ed724dsm1619878pgj.40.2022.11.24.17.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 17:48:33 -0800 (PST)
Date:   Fri, 25 Nov 2022 09:48:27 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
Message-ID: <Y4Ae69EbLpTyIcs4@sol>
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
 <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
 <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
 <20221124104501.2bfllqmpfegdcs3m@vireshk-i7>
 <Y39yackN2u7q2Fxs@sol>
 <CANiq72=ufe1eGRVAcHcn9TZiMx2-HC-QQPZMbss5ErSdcpMyBA@mail.gmail.com>
 <Y3+GeREjXKkTQY6Y@sol>
 <CANiq72kNk-NwqdRuBo9iUNR--qTRwjexGYP0+_GcDF6y8_nLWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kNk-NwqdRuBo9iUNR--qTRwjexGYP0+_GcDF6y8_nLWA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 24, 2022 at 05:18:20PM +0100, Miguel Ojeda wrote:
> On Thu, Nov 24, 2022 at 3:58 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > The possibility for error can arise from running against a later
> > libgpiod that has additional values for the enum that these bindings are
> > obviously unaware of. e.g. the hte event clock recently added.  If you
> > had bindings built prior to that addition there is no Rust variant
> > in the event clock enum for that to map to.
> 
> If using older bindings against newer libraries is intended to be
> supported (and not just the other way around), then I would expect at
> least some of the enums to be stable (i.e. exhaustive), no? Say,
> `Direction` or `EdgeKind`. Are new variants expected in those (before
> a major 2.0)?
> 

Not sure on the policy for Rust bindings, just going by what has
happened in the past for C++ and Python, which are linked dynamically,
and assuming the same for Rust.
Hmmm, the examples in the current Rust bindings are statically linked
to libgpiod, which isn't what I expected, so there you go.
Not sure if that will always be the case.

Anyway, for statically linked Rust bindings, the source of the error can
be a newer kernel (e.g. an extra value in the enum gpio_v2_line_attr_id),
or a bug in libgpiod itself.

The enums drawn from flags are effectively stable even if new flags get
added to the kernel - libgpiod will just ignore them.  Though I'm not
sure there is any advantage in treating them differently, particularly
if we do want to support dynamic linking.

> And for those that aren't designed to be stable, `InvalidEnumValue` is
> a bit misleading. It is just that it is unknown to the bindings (which
> is more useful for users: "I should update my bindings"), or
> "unexposed" (a term some bindings use when the value is still usable
> even if opaque).
> 

The naming is probably a carry over from the C/C++ where the invalid
values can originate from the user, but a valid point wrt Rust.

What is "invalid" depends on perspective.  It is invalid from the user's
PoV, even if it may be valid in an absolute sense.
Is `UnknownEnumValue` a little clearer?  Though that implies you don't
know the actual value passed - and you do.
`UnexpectedEnumValue`?

> Now, the C++ side throws even for the clock mapping (and the exception
> says "thrown when the core C library returns an invalid value"), which
> to me it sounds like the C++ bindings are not intended to be used if
> there is a mismatch. Thus Rust could panic too.
> 

C++ is a slightly different case, as the invalid values can originate from
the user as well.

Disagree on the equivalence between C++ exceptions and Rust panics.
In C++, exceptions are used for general error handling whereas Rust panics,
similar to Go panics, are used for unrecoverable errors.
In Rust, general errors are handled with Results.

I don't see these errors as unrecoverable.  In practice, any lines you
request can only take values that you understand, so you would only see
such errors when reading info about lines you didn't request, and then
the app should just note "well that's odd" and move on.

> On the other hand, if the bindings are actually intended to be used
> even when encountering unknown values, then I would say C++ shouldn't
> throw, Rust shouldn't panic, and the enums should be marked as stable
> or not as needed. Then, for the unstable ones, depending on whether an
> unknown value can still be useful, it could be made an `Unknown`
> variant on the particular `enum` (e.g. `EventClock::Unknown`) instead
> of an error (the "unexposed" idea above).
> 

That approach certainly makes sense if the accessors don't already return
Results - but they do as there are other sources of error.
Given that they do return Results, the decision is whether the invalid
value should be handled in the error path or the normal path.
The error path makes more sense to me as this case is quite unlikely
and forcing the user to always deal with potential Unknown variants in
the normal path is a bit unfriendly.  Much nicer to bunch it in with
the "well that didn't work as expected" path.

So, in short, I agree that the naming could be improved, but I'm otherwise
ok with the approach the bindings are taking here.

Cheers,
Kent.
