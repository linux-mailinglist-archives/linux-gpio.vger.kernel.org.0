Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 356FE7BE35B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 16:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbjJIOpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 10:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbjJIOpd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 10:45:33 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7978F
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 07:45:30 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-406618d0991so42887265e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 07:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696862729; x=1697467529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LElHBUFd19D6sN44YIX6u/M9TbzS7QfHRGhS5ZU1vTU=;
        b=YF8zcY9WQ8vU9A0ZBEvwtr1TfIDniOzGnRcpj6hBqI82xr32V9ZpjOKMFOaINN1/MO
         cLJVspwKTnUnlLrkPePWc36MwAjjIgE9jcx8x9kIY3VmqAqiOkygSPdeNdF/1/V1osV8
         ZfpWU3ETIRFKn83J5LRn6jzpqTfc/xMlYb8i0YYV4pGDiUeoNzUtR+1pLF3jwzocrIyw
         Jwt74oRGlCA+vHNUQJF8z3A8q4UtMef8Zxz8nNHCsOxcKYLoSBUMUhoA4YHRIWqt89/e
         M/AtbbtvLtK1LNNm9gqtRBTLGbHSMqrDDHgSw9uO1fYAxh8xcH55IqPXB+Js0WJ9tBt4
         CRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696862729; x=1697467529;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LElHBUFd19D6sN44YIX6u/M9TbzS7QfHRGhS5ZU1vTU=;
        b=ZGxQyjskwva331iyQE19rG9ou1irtJB2c0h2hoCPCXXP1bJTaVp3FozRS5ST+UtMha
         jJiIp33tUrYBnyjqFvrRt0l6znf8RDaUuyswwiXG/6GLSGCuUA0AMCVAfARO8LNOB7lY
         dOvvU22IKnQ4O6CIUyrAgaINMNPwWdShRrkKIJw3LR43fgb/WVRZ9KDWlg4cYgcrhxFe
         cDhxxcZN7Eb2RDdJ/BKwDgMz6D54A6EpthjMNq4EH9m14mcxOc4cisgC3Ev3hMEhxCxj
         czvy1Xgi1zVhAe3GDaf1rivkRTwlQ5rEaVGt2EQgTVHwAzA7WIRx+0rfWMdar2agQxxS
         atHg==
X-Gm-Message-State: AOJu0YzMDolWTrFo6TmWWwoooMcdQaAQ30MPQuxK1yVkaIE2LyU9bMm5
        Iqj4eOMsJJWB1ygHijV8K4bFHQ==
X-Google-Smtp-Source: AGHT+IFWsmB5LUrExanzmTJmywYvp41cM1aX0qO6g9teVWcFDjnqHvzMuuOhvEG/ZUVYHDLo94VQMg==
X-Received: by 2002:adf:e3ca:0:b0:321:6f5f:78ab with SMTP id k10-20020adfe3ca000000b003216f5f78abmr13660053wrm.56.1696862728662;
        Mon, 09 Oct 2023 07:45:28 -0700 (PDT)
Received: from meli.delivery (adsl-26.37.6.0.tellas.gr. [37.6.0.26])
        by smtp.gmail.com with ESMTPSA id k7-20020a5d66c7000000b0031fd849e797sm9840733wrw.105.2023.10.09.07.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 07:45:28 -0700 (PDT)
Date:   Mon, 09 Oct 2023 17:39:54 +0300
From:   Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Phil Howard <phil@gadgetoid.com>
Subject: Re: [libgpiod][PATCH 0/2] bindings: rust: feature gate unreleased features
User-Agent: meli 0.8.2
References: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org> <CAMRc=MdD5SOmPM6JgagPbkbNJHn+kHqtzu_iGjQPm-K2kFCEfA@mail.gmail.com> <CW3VO38FC7ML.380UJEH9HNQU8@ablu-work> <CAMRc=MfDXtDPmqKneL_XfXrJj-g7oBG=9UMZTqR3oZC0pRiQmw@mail.gmail.com> <CW3Z0GR143R8.363IQKC787V0W@ablu-work> <CAMRc=McUJ+4gJNGJ=UfBJk980BQ3Swk=kE7rjrfoKJP_0MimGg@mail.gmail.com>
In-Reply-To: <CAMRc=McUJ+4gJNGJ=UfBJk980BQ3Swk=kE7rjrfoKJP_0MimGg@mail.gmail.com>
Message-ID: <29nnq.9lre8l3k31x@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 09 Oct 2023 17:32, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>I'm Cc'ing Phil Howard who's the developer behind the Python bindings 
>work.
>
>In Phil's WiP branch[1] that should soon be posted to this list the
>autotools flow is entirely omitted and building of the libgpiod C
>sources happens in setup.py directly. Can cargo compile C sources like
>that?

The rust compiler team maintains a library for that:

https://crates.io/crates/cc

You can find examples of it in use in many popular rust crates, like 
when building the openssl crate https://docs.rs/openssl/latest/openssl/ 
with the `vendored` feature, it uses the following build-time dependency 
to build the static librarie:

https://github.com/alexcrichton/openssl-src-rs/tree/main

There is no general need to put the vendoring code in a build-time 
dependency by the way, it can be done in in the bindings crate's 
build.rs as well.

>
>I'm not sure how that would work honestly. The stable branches in
>libgpiod are per libgpiod minor release. This doesn't map onto rust
>releases anymore with decoupled versioning. Maybe rust should get its
>own tags in the repo (on the master branch for major and minor
>releases) and its own stable branches?

In cases Rust crates want to support multiple releases, the usual route 
is to expose different bindings per release exposed via feature flags.

I can't say if that makes sense for libgpiod though, because I'm not 
familiar that much.

Manos
