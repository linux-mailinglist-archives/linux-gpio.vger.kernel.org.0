Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A6B637D87
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Nov 2022 17:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiKXQSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 11:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiKXQSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 11:18:34 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3AA11578B
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 08:18:32 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3b56782b3f6so19059907b3.13
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 08:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fhpyiJrvLPyjfUCLarkYGSyAh/s/yjyxRcGb+OmId4o=;
        b=Q8U5yqgzUc+bEKNNhdTM6KlPAQSJIJRSpo/MBaQ9kUkDPIJn3t6T7aWvb03eG7Avuh
         VVJYo1XuEOFhVA4rxotGV04IiFQ3O2CvvfeGiWZW1jIPBsOtEO2YfmEqgksorqoVBFz9
         3OquGfEvNvPG+lFgo9RAZ+KlRjPGB4wfLYqR0Q2kRkzD1K8gtBPa5T8rLZvidPgmUAN1
         XlhweMXl0CgthyE1ooJL/Z5KXwVVQXk81e5mATRxv6d1DMaBWMIKS3/enn8nZDj82yId
         9upvsP9cr7hCplro4vw7usuuQ3GB1ZyAXK9PcQv+en2ZPGwPDcIBta3wn/Y184jXLHF5
         i7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhpyiJrvLPyjfUCLarkYGSyAh/s/yjyxRcGb+OmId4o=;
        b=PV3MJnstNJnRvs/NPhfltUCHk3Tr+W0CuksvWeLv64coic30Ars4VBEcvEgRkp76xX
         qPlV9OujRjGOSSS1Jw8KwwpP7ykbxYcGGBIR/xx/zRC9uM7GNX5NkuEFTxfihBl81Sre
         1xvm/mhbhPBaeAtErvvkzR+aqXOV2fntm9U2K6WZDsVNCMaLVyiyulp359BVJ+p1GBs8
         22fpyI3GB49p+ddHRjBUCxeuzaV24NFnIpdlp7uovXI5HKbiitD7Nd6J9iDnOE6Ew3uL
         lljDpTPk5JdHySSYWKB1ctQTXyzVJW6kkPC2+JPsF8sMcwUje/EjFKw4FYQRmwavn/vL
         3Mpg==
X-Gm-Message-State: ANoB5pnZckNTncHwHxvQF/oB6CEwZj++reuKNa2gMngDJ4MW0k7yaMAH
        rLkTgqIlWjkcxU80rU95eKFYO5DO4QzENn6zzowbO5bEcl1GXA==
X-Google-Smtp-Source: AA0mqf4u9nJI4JnEkqwNxTBGo+uBIuaw9AkvC5PN82TFFPufCbB8Ki1BitpG67jSZqSS86RRVHZsEFlhB6bgPM4l1j8=
X-Received: by 2002:a05:690c:c90:b0:373:6e8f:a52c with SMTP id
 cm16-20020a05690c0c9000b003736e8fa52cmr17145522ywb.266.1669306712054; Thu, 24
 Nov 2022 08:18:32 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
 <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
 <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
 <20221124104501.2bfllqmpfegdcs3m@vireshk-i7> <Y39yackN2u7q2Fxs@sol>
 <CANiq72=ufe1eGRVAcHcn9TZiMx2-HC-QQPZMbss5ErSdcpMyBA@mail.gmail.com> <Y3+GeREjXKkTQY6Y@sol>
In-Reply-To: <Y3+GeREjXKkTQY6Y@sol>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 24 Nov 2022 17:18:20 +0100
Message-ID: <CANiq72kNk-NwqdRuBo9iUNR--qTRwjexGYP0+_GcDF6y8_nLWA@mail.gmail.com>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 24, 2022 at 3:58 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> The possibility for error can arise from running against a later
> libgpiod that has additional values for the enum that these bindings are
> obviously unaware of. e.g. the hte event clock recently added.  If you
> had bindings built prior to that addition there is no Rust variant
> in the event clock enum for that to map to.

If using older bindings against newer libraries is intended to be
supported (and not just the other way around), then I would expect at
least some of the enums to be stable (i.e. exhaustive), no? Say,
`Direction` or `EdgeKind`. Are new variants expected in those (before
a major 2.0)?

And for those that aren't designed to be stable, `InvalidEnumValue` is
a bit misleading. It is just that it is unknown to the bindings (which
is more useful for users: "I should update my bindings"), or
"unexposed" (a term some bindings use when the value is still usable
even if opaque).

Now, the C++ side throws even for the clock mapping (and the exception
says "thrown when the core C library returns an invalid value"), which
to me it sounds like the C++ bindings are not intended to be used if
there is a mismatch. Thus Rust could panic too.

On the other hand, if the bindings are actually intended to be used
even when encountering unknown values, then I would say C++ shouldn't
throw, Rust shouldn't panic, and the enums should be marked as stable
or not as needed. Then, for the unstable ones, depending on whether an
unknown value can still be useful, it could be made an `Unknown`
variant on the particular `enum` (e.g. `EventClock::Unknown`) instead
of an error (the "unexposed" idea above).

Cheers,
Miguel
