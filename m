Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 195CD7BE492
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 17:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376842AbjJIPWC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 11:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377018AbjJIPWA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 11:22:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74E7BA
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 08:21:54 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4065f29e933so45382355e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 08:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696864913; x=1697469713; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKSDVA5hdRk0qjHHKldrFWUuPLQwNPm888vrv06x2fQ=;
        b=AF2qbwQ6geiPIxtj1TGbrXjBY/6paCQ5nhQS6FHWNWotr+iOt+wxLBaZzUhzIXAmPm
         BfsIMPg32uLzqoRu0naNIVOKNYCYwAMD7U7uTLOJuW4AL+s4u/YAS5xSxfJBBYld8ejO
         J2AFP426gs4IjsQO6NMkG3SD6WaCfuk0C39Qe2GMvFG72Yp3MwlKsVrC1bFF3sT+HETX
         Dad0AMdZxjiX/1G/bLqbjCquj2PGHa9GLglnB62jq4gDj1BnQFxTOJQLqSjWGYYuvqa3
         zlVe1XBTxXKF5g1kIuLk0YnEWb+alB8KNSFuzvb6hnB91RcQlIVcsVERBbS8LTki6Zy2
         ZAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696864913; x=1697469713;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKSDVA5hdRk0qjHHKldrFWUuPLQwNPm888vrv06x2fQ=;
        b=n97dhzGOhhYtsdbiX4qkw33wkGcJuzre86arfVDvczrJJVYu2Bq0CfAIISVyWFWLHU
         oBVJ88VXxMHv+lLMgjHff6c6c/bQ3ByJb/L7pq/hf5gl+IeoYyughwSpCWN9OOyMicfU
         KVXNunFnZ7NXYhdvrOXVI5S0g6e4tLPqNQ+hz2hKnbECw0yM03+fQlyU8TViK7JvU99f
         pnMUXVUu3/EN4c9y1fC/gEkcydkVMeHyj40okgJb7PoTJfygZd1ggHJbP69hQpSbLxdr
         Prxum+d43DUOkSnsf2cNb9f9MIogUe5vchqKE5rNgSf4PVWgOc6WVp76d0ZPdubhgBmR
         KuPA==
X-Gm-Message-State: AOJu0Yz4ZaW2elBPb22lKKsflmDcXk39f7H4qCcebczup0hYCOkBQ33u
        qaCunJbnnaTTubkJaxG+1r8nFg==
X-Google-Smtp-Source: AGHT+IGjJSJxaBy8ExGJc372SpF9GM4SIuKM8ZU4P4jwILVJxT3hr5h2W6aBbY6nrW/Zov7Z2cfw0g==
X-Received: by 2002:a05:600c:2242:b0:401:2fab:43e8 with SMTP id a2-20020a05600c224200b004012fab43e8mr13475875wmm.15.1696864913233;
        Mon, 09 Oct 2023 08:21:53 -0700 (PDT)
Received: from localhost (i5387894C.versanet.de. [83.135.137.76])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c230100b0040644e699a0sm13776437wmo.45.2023.10.09.08.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 08:21:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 09 Oct 2023 17:21:52 +0200
Message-Id: <CW40ER5HT93Q.83CW582AJP9C@ablu-work>
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Phil Howard" <phil@gadgetoid.com>
To:     "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 0/2] bindings: rust: feature gate unreleased
 features
X-Mailer: aerc 0.15.2
References: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org> <CAMRc=MdD5SOmPM6JgagPbkbNJHn+kHqtzu_iGjQPm-K2kFCEfA@mail.gmail.com> <CW3VO38FC7ML.380UJEH9HNQU8@ablu-work> <CAMRc=MfDXtDPmqKneL_XfXrJj-g7oBG=9UMZTqR3oZC0pRiQmw@mail.gmail.com> <CW3Z0GR143R8.363IQKC787V0W@ablu-work> <CAMRc=McUJ+4gJNGJ=UfBJk980BQ3Swk=kE7rjrfoKJP_0MimGg@mail.gmail.com> <29nnq.9lre8l3k31x@linaro.org>
In-Reply-To: <29nnq.9lre8l3k31x@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon Oct 9, 2023 at 4:39 PM CEST, Manos Pitsidianakis wrote:
> On Mon, 09 Oct 2023 17:32, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >I'm Cc'ing Phil Howard who's the developer behind the Python bindings=20
> >work.

Hi!

> >
> >In Phil's WiP branch[1] that should soon be posted to this list the
> >autotools flow is entirely omitted and building of the libgpiod C
> >sources happens in setup.py directly. Can cargo compile C sources like
> >that?
>
> The rust compiler team maintains a library for that:
>
> https://crates.io/crates/cc
>
> You can find examples of it in use in many popular rust crates, like=20
> when building the openssl crate https://docs.rs/openssl/latest/openssl/=
=20
> with the `vendored` feature, it uses the following build-time dependency=
=20
> to build the static librarie:
>
> https://github.com/alexcrichton/openssl-src-rs/tree/main
>
> There is no general need to put the vendoring code in a build-time=20
> dependency by the way, it can be done in in the bindings crate's=20
> build.rs as well.

Right. One can use cc, there also seems to be a somewhat popular crate
that allows calling autotools: https://crates.io/crates/autotools.

That said. I am not sure if I like listing all the sources and defining
the build process manually again. It feels like we duplicate what the
existing build system already does for us and no longer have a single
source of truth...

Taking a look at the openssl build code [1] I also see all the target
and environment specific hacks that I feared about... I guess it won't
be as bad for libgpiod, but I guess it might be a painful way to figure
out whether that is true.

I have seen similar things happening when cmake projects attempted to
vendor in external dependencies and are not a huge fan of marrying to
different worlds together like this.

That said. I am completely supportive to the idea of exploring static
linking for the Rust bindings. I am just sceptical that doing that by
default will make things more simple for consumers on the long run.

[1] https://github.com/alexcrichton/openssl-src-rs/blob/main/src/lib.rs

>
> >
> >I'm not sure how that would work honestly. The stable branches in
> >libgpiod are per libgpiod minor release. This doesn't map onto rust
> >releases anymore with decoupled versioning. Maybe rust should get its
> >own tags in the repo (on the master branch for major and minor
> >releases) and its own stable branches?
>
> In cases Rust crates want to support multiple releases, the usual route=
=20
> is to expose different bindings per release exposed via feature flags.
>
> I can't say if that makes sense for libgpiod though, because I'm not=20
> familiar that much.

Thats true for attempting to support different versions of the C lib
(and it is what I suggest in this series). However, the recent release
became necessary to a bug in the Rust bindings, not in the C lib. So a
stable branch could still make sense. But hopefully, we would only need
it increasingly rarely in the future.

Overall I still think what I suggest in this patch + maybe exploring
optional static linking is the simplest path. I mostly suggested this as
an alternative since I felt resistance to my suggestion :)

- Erik

