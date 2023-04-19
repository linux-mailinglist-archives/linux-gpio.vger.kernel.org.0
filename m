Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDC0B6E7401
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Apr 2023 09:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbjDSH25 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Apr 2023 03:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbjDSH25 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Apr 2023 03:28:57 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF5076B3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Apr 2023 00:28:52 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-246fd87a124so2808483a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Apr 2023 00:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681889331; x=1684481331;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72cqeEo9BVaOdfNLg2IBQmSax3u9xGkPgH2G/dr4aJ8=;
        b=zPmGyUBdqIvIHTP+ET7KfYFzH456+p7PEBHO15/3GtImwSFG7W0Q6h+rqEHD6dnAjo
         lXBe8BJBCDPDFH0Vqk0dOEGAT3s6xVFzoraSxhddvBx30Ui+pj8uxAR5KWYYAtu/c0TY
         qifLJII889YoYVUBE0gwwjToHOPQk8YOZ8D6WK8YnuEIjuYvjPi+qoYYtUU9gD74P3Vp
         JKRcCUILjCy++OJETASXK8k8DyY/X/Npv7ZJ3Abnk5etEU+mNCFt2ed88ZMq3MByibYD
         BdAZ8Av6b/evl+vUc7MpMdQsfzyQZmX0HvYDUsduSBiaUBVGJoWgBJH3Apd3VTwGYP+1
         9Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681889331; x=1684481331;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72cqeEo9BVaOdfNLg2IBQmSax3u9xGkPgH2G/dr4aJ8=;
        b=J4moP0wSIBuug0Pwr9ebSd3cMncjBno8JGozv6Z39yE9iviDqHqpklyIVqlVPCk78J
         UNpMUegX8wDdPfLc8ui/gpL/J8lYHtTxomaRH4HAFZ/jR0t+k1TntyWQswmAajyNp7ng
         hOqwyLGrycxhFBFr79ya0AGfqOvmkjPdbznz07kzMN/64OtMyfpREwLnUCs5MwM9Bfh1
         7ZwvA2eqgT4iQl2K61prPVPojTjJs3QSa6M/UJGUd8uCmaGiVxIvS+nBRvYk6tcTAGcI
         r8hfXnkG+0VaxvOp4oWoRPvFOfM9omCrBs5Iji270CxKIFo7iwI1CSGiEkCS8CQzfDS7
         092A==
X-Gm-Message-State: AAQBX9e4pjSk10VNIGkeG/o/TE+4BIPaVWHJ+Ow2Xvmhgt5vloscazUr
        xzgzXl+jMOlRu17pUNDmfzPIsg==
X-Google-Smtp-Source: AKy350ZRKuvEExBWlBOnLmegsxnFeT6RtyDqeWXxPvyEee5/29e1DXJkQVELHGFXaeBIoaRB9ItBpg==
X-Received: by 2002:a17:90a:ea8f:b0:247:1997:6a1f with SMTP id h15-20020a17090aea8f00b0024719976a1fmr2455416pjz.12.1681889331464;
        Wed, 19 Apr 2023 00:28:51 -0700 (PDT)
Received: from localhost ([122.172.85.8])
        by smtp.gmail.com with ESMTPSA id hi3-20020a17090b30c300b002470e095920sm749074pjb.40.2023.04.19.00.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 00:28:50 -0700 (PDT)
Date:   Wed, 19 Apr 2023 12:58:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: Broken build with rust bindings (without --enable-tests)
Message-ID: <20230419072848.gwe3oga57qyg4u42@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Bartosz pointed me to a build breakage with Rust bindings, which I am
not able to fix and looking for help from other Rust experts here.

The failure:

$ ./autogen.sh --enable-bindings-rust && make

error: could not find native static library `gpiosim`, perhaps an -L flag is missing?


Reasoning:

There are three crates available in bindings/rust
- libgpiod-sys
- gpiosim-sys (depends on gpiosim C lib, which builds only with "./autogen.sh --enable-tests")
- libgpiod (uses gpiosim-sys as a dev-dependency, but required only for "cargo test")

I earlier thought that if I am doing "cargo build" without "--tests"
or "--examples", then dev-dependencies are not built. I was wrong.

The dev-dependencies are not passed on to the user crates, like
vhost-device, but are always built if you do a local "cargo build",
but since the C gpiosim library was never built, we fail to find it
here.

Question:

How do I build a {dev-}dependency (gpiosim-sys) only if tests are
being built as well ?

-- 
viresh
