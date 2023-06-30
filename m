Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A717438E8
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 12:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbjF3KFe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 06:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233004AbjF3KFd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 06:05:33 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2B21FE7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:05:31 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc63c307fso5970165e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688119529; x=1690711529;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3X152Cipp9O8qL4lrsBmZIF7Bxu/9+FJXL77lDv1mY=;
        b=nUQtcQsOQoU5VJ6oIGI6NUEG5yp86pVBcc39h9DnAN6AwcUk0rIG5mS839vZtZ0rIS
         JuADEfz+IvwvoEG1P2RVn+1uzkULdXywk7VQayHTpoJjF1Ymzi5Z/xjyx2D7kEKZLKzI
         qs5jGgdcBzyDNrl6e/R9oOXWPdiTIb2cLY86QZnO9MhvgpcXFpHlZPmIvjKdl2qtYrJM
         OpiaxbZjWnUDJ1RX7XAWwLt/KZ71MJW7NglvwHD81TwyzjcLjV632wQ79DvNJDJiyfA0
         BTr5mBw2Y+KruKmfsyZI7SSOsSmmCMr2bp2sAwlPGz07VAO6Y5HLdULqDxBp0fvZ0lio
         /HeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688119529; x=1690711529;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/3X152Cipp9O8qL4lrsBmZIF7Bxu/9+FJXL77lDv1mY=;
        b=J1OXR4IhywyMYkhhYTrnfbA2xwQ3Mia+tJyrkFQTME12Q3jEnB241f4pUm+RuyHVgy
         1KYVWMvjKbF4tfelxrjxqJK8Qb01eNYVmUNmPvLi5AXsTJkPHg1BszBpjEuKLR4w/7c4
         dEWGCr6UVrvwx1lp1+hYBpEIWlVKBXV1esiI+bWLyO7iYWb0mZ2XDLr8Z0L6MBGagi1j
         MIl31aP5Ar1c1sabAA7kXugZDWObCrRBsCF9UInPyEyJwNyw8m24A4gkMuzhX6bE3xmG
         4o2jwVYfdmC7zZf0Wx1jAdvAbyRI/csjyUJhKpXjuXZCMq96uMltBvmb1ZfvDLkTXZhw
         UghA==
X-Gm-Message-State: AC+VfDy+VVLj9hT920GNeRQiICU0ePbv+9o713Ol04FEiB0IZv16O/MO
        SzghX46uFn1cVU5wn2Df6xxmGA==
X-Google-Smtp-Source: ACHHUZ5eSQtDUFhGievBOIgL9mKiDpPBTRlfYG1pupftE4XefW6evJCok9o8B3serVZjkevUl8Z9BA==
X-Received: by 2002:a05:600c:b54:b0:3fb:40ce:503e with SMTP id k20-20020a05600c0b5400b003fb40ce503emr1659713wmr.25.1688119529553;
        Fri, 30 Jun 2023 03:05:29 -0700 (PDT)
Received: from localhost (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id l1-20020a1ced01000000b003f9b0830107sm21619550wmh.41.2023.06.30.03.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 03:05:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 30 Jun 2023 12:05:28 +0200
Message-Id: <CTPWFHFJNFFA.2SGA858S5QIJ5@fedora>
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
To:     "Kent Gibson" <warthog618@gmail.com>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [PATCH libgpiod 4/4] bindings: rust: clippy: silence
 false-positive on iterator
X-Mailer: aerc 0.14.0
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
 <20230629-clippy-v1-4-9ff088713c54@linaro.org> <ZJ6bd8+oDbyX06rp@sol>
In-Reply-To: <ZJ6bd8+oDbyX06rp@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Jun 30, 2023 at 11:08 AM CEST, Kent Gibson wrote:
>
> For future reference, the subject line should be "[libgpiod][PATCH...",
> as per the README.
> Makes it easier to filter visually, if nothing else.

I am using b4 to send the patches (otherwise I would screw up this stuff
even more) which always merges the prefixes together. Raised the point
there:

https://lore.kernel.org/r/CTPW75Q2ISUN.251ELTNP6RB22@fedora

> On Thu, Jun 29, 2023 at 01:09:02PM +0200, Erik Schilling wrote:
> > This was fixed, but it is not in stable yet.
>
> This is not a good checkin comment.
> State what the problem is and how the patch addresses it.

Will rephrase it in next version.

> Same applies to other patches in the series - but I have other comments
> on this one, so raising it here.
>
> > Tested build on x86_64, armv7hf, aarch64.
>
> When you say "Tested build", do you mean just compile/clippy, or have you
> actually run tests?

This is a bit complex... Originally I intended to send this along some
shunit2 script that checks build tests and clippy lints. But that became
a bit more involving than I hoped... By defauly we link gpiosim into the
tests statically and the static lib is not built with PIC by default.

Rust, however, by default wants to build the tests with PIE. For some
reason that works on Debian, but not on Fedora. It also broke down on
Debian on armv7hf. So I was not able to come up with a configuration
set that worked perfectly in all situations (apart from building the
C lib with PIC) and decided not to send scripts to automate the check
(for now).

After wasting way too much time on this, I then realized that I was
missing the GPIO_SIM module and skipped the tests for armv7hf since I
dropped the check script from this series anyway.

TLDR: I tested build AND cargo test on x86_64 and aarch64, but only the
build with armv7hf (I built test and examples though).

> Either way, not sure if this should go in the checkin comment - it is
> generally implied by the Signed-off that you've tested it to your
> satisfaction.
> No problem with a more detailed description of how you've tested in
> the cover letter.

Right... Since I dropped my script idea how now I can move this to the
cover, will expand what I tested in v2.

> > diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust=
/libgpiod/src/event_buffer.rs
> > index b79e9ea..2e4bfd3 100644
> > --- a/bindings/rust/libgpiod/src/event_buffer.rs
> > +++ b/bindings/rust/libgpiod/src/event_buffer.rs
> > @@ -54,6 +54,9 @@ impl<'a> Iterator for Events<'a> {
> >      }
> > =20
> >      fn next(&mut self) -> Option<Self::Item> {
> > +        // clippy false-positive, fixed in next clippy release:
> > +        // https://github.com/rust-lang/rust-clippy/issues/9820
> > +        #[allow(clippy::iter_nth_zero)]
> >          self.nth(0)
> >      }
> >  }
> >=20
>
> Specify the release in absolute terms, not "next clippy release".

I cannot tell the version of the next release that will include it since
it is not released yet, but I can state the clippy version that caused
the error.

> Other than those nits, I'm good with the actual changes in the series
> (checked with clippy and running tests on a variety of 32 and 64bit
> platforms and compiler versions back to 1.60)

Thanks for testing!

> (I am seeing this one test failure on arm32, but that doesn't seem to be =
related
> to this patch:
> ---- request_config::verify::default stdout ----
> thread 'main' panicked at 'assertion failed: `(left =3D=3D right)`
>   left: `OperationFailed(RequestConfigGetConsumer, Errno { code: 2, descr=
iption: Some("No such file or directory") })`,
>  right: `OperationFailed(RequestConfigGetConsumer, Errno { code: 0, descr=
iption: Some("Success") })`', libgpiod/tests/request_config.rs:18:13
> note: run with `RUST_BACKTRACE=3D1` environment variable to display a bac=
ktrace
>
> Not sure if that is a genuine bug or something funky in my build.)

Is the GPIO_SIM module loaded? Did you test with a custom kernel or
some distro that ships with it?

- Erik
