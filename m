Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC19A72C2F9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 13:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbjFLLhU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 07:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235764AbjFLLgp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 07:36:45 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636FE1AD
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:16:12 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51492ae66a4so6055530a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686568571; x=1689160571;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWxn6vUtkVwYw+y3kU8jXVUyj9FC3I+OBESgDZY4lc4=;
        b=ao0J5J7IBAhYPGnM+CJE6fNx8inU7BceLlZ+Z+ZJI/qtkzwaXF1p7wHUDikICE3fTg
         HIIHRvxE1Eh6geyL1C7QlEiv2eyKZPrGa1JmSHO69fdlw1fqIxhD6IAavTqUXrhTvJ8V
         Dxf57gOM3X0yneKGGScTM/dsGh8ykkk+6oWTG3oRPa9ueksVt5LZbawKRhEt6NbHffyv
         2A3MNOe/DprckbBzzfH54mXwDmJ2hxyb7NeH6uGcmHli8i0FcOF6vXgMjwTWpxdu7+t5
         xET6MuG1QRoWVgjphivpLtJ1xPbjz16i+j5QofYLlj0bPRhQkD9OEUjou7COFAKZ7JGy
         wHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686568571; x=1689160571;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWxn6vUtkVwYw+y3kU8jXVUyj9FC3I+OBESgDZY4lc4=;
        b=DwNh3FI0rZno0KifLktXWlHqkeNz/NVvBWFiMIiZ11ARIlbuSF5FLtqsGA7CluzGYL
         9ufWiyuB2FDaLlUi3nbP6/9KD+8q56LvDughR41W2otdJV/qXZxhYhEwB9ZBI9bPwx/k
         LO5DCtmJzW0X5KZ9sBV0VInKjNgAdXK8NIJI6M47kPrfV0EiO/73kYX6jDPUTykI44aW
         X2/SpwbVZfAZ/XJenI1qwBxT/bPBBZbYF05+c9MHiMlg0qw/7YwZRVgoID/TX0kvIvE7
         5dctPKZXYSUomfDn6Thi4C6OrdDhGWraSUWO+sKq9MRcNYoJeEW2m7y0vFNHSh7IsDQj
         SCqw==
X-Gm-Message-State: AC+VfDyAdznbi7GuNKWpwc4WAuD0ikW9sybhSJOpdYfY5+GJo4wz34Gg
        LI6Gmm8uAOczWKAuO76FSjR2WLdBb8MZIYbYEMk=
X-Google-Smtp-Source: ACHHUZ4o0Dy4yUZjncPcYbu7qSYjaRAlKmcSEdZPZTw3dBltiecniGPKnXT9igPgzitTtNVteJpdVw==
X-Received: by 2002:a05:6402:31f3:b0:514:9eae:b0a7 with SMTP id dy19-20020a05640231f300b005149eaeb0a7mr4103738edb.17.1686568570899;
        Mon, 12 Jun 2023 04:16:10 -0700 (PDT)
Received: from localhost (i5C74066A.versanet.de. [92.116.6.106])
        by smtp.gmail.com with ESMTPSA id n21-20020aa7c795000000b0050dfd7de30dsm4910057eds.94.2023.06.12.04.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 04:16:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 12 Jun 2023 13:16:09 +0200
Message-Id: <CTAMNSQLDDKK.3Q7FW6IVJQ26U@fedora>
To:     "Kent Gibson" <warthog618@gmail.com>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][bug] building rust bindings requires clang headers
Cc:     "Viresh Kumar" <viresh.kumar@linaro.org>,
        <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>
X-Mailer: aerc 0.14.0
References: <ZIKQVol59uXI5PyI@sol>
 <20230609061812.4haoqdyinsp47zet@vireshk-i7> <ZILE258m92XrBvNP@sol>
 <20230609062456.fqw3mqvtcactx2zj@vireshk-i7> <ZIQJquwzNacp1Nuh@sol>
 <CTAF85GP5JIH.308KO3L1T9153@fedora> <ZIbJ9yM9zdfcj0kO@sol>
In-Reply-To: <ZIbJ9yM9zdfcj0kO@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> > Setting PKG_CONFIG_PATH will only work if you point it at the install
> > folder of libgpiod.
>
> Correct - that is exactly what I did.
>
> > If you do not want to install, you will need to set
>
> Yeah, I don't install on my dev machine - I deploy to separate machines
> for testing.  For dev I just want to be able to use the same workflow I
> would use for a general rust project, so cargo XXX, and purely in the
> code tree.  At least that is what I was doing previously.

I agree that there is _some_ friction, but I did not come up with a way
to preserve the old behavior without the risk of being confusing for
consumers of the lib (or even people attempting to compile things where
libgpiod-sys is just a transitive dependency).

The current solution mostly resembles how most of the Rust bindings
that I know work. But I acknowledge that those bindings are usually
developed in repositories separate from the underlying lib. Are there
good examples how other libs are solving this problem?

> > See https://lore.kernel.org/r/20230522-crates-io-v2-2-d8de75e7f584@lina=
ro.org/
> > on why it had to become a little bit ugly for rust bindings hackers.
>
> I understand why you might be changing things to be able to package the
> crates, but in an ideal world that wouldn't impact normal workflow.
> Or it would be simple to switch.

I fear the ideal world where there is no impact may be hard to achieve.
When building with make, we _know_ that the C lib is also built, but
when building from cargo, there is no good way (that I know of) to
differ between a build that just happens because someone is building
from crates.io or a developer invoking cargo sub-commands. Ideally, a
build from local source should also show identical behavior compared to
a build from the registry.

Also, we will (at least in the future) need an easy way to build against
different versions of the C lib. For me the easiest way seems to be to
install different libgpiod versions to some non-system path and then
use PKG_CONFIG_PATH to switch... That just allows us to use standard
mechanisms without requiring to reinvent any wheels.

> > Maybe we should put that example back to the README.md (or into the top=
-
> > level README?)
> >=20
>
> Sounds like a plan to me.  I would go with the rust specific README.
> Or add a file that can be sourced to setup the build environment to get
> cargo working from the command line.

I started with the README. Sent as part of my series of last crates.io
publishing tweaks:

https://lore.kernel.org/r/20230612-crates_io_publish-v1-0-70988ee9a655@lina=
ro.org

- Erik
