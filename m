Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90372616395
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 14:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbiKBNPY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 09:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbiKBNPX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 09:15:23 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93D3233B6
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 06:15:21 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id s196so16220183pgs.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Nov 2022 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nmsY0+noyQklGjDko36GN3h+LWVJn5fKBoTkL9G1VXM=;
        b=GXWRRD5rHLh4A4bqPz2V98bjlPbDJfqOCeY3EA6gKjt0OxboJZiwc2K9l6wD9wNwVz
         wJpD+gNufFhcEzEuDzZ07Oh9yboCkrZqregqh1YHmfGVf4nRyF2DmBkw8RRFeTzs0IM2
         rFkqhwjLOPwVJI3/jmslr20CuCmvK+cHAztwzjnOIzpVYV5Ihz4lFLVKSPxfDlifZ1du
         kUkwGfeOlnrFZMXGYmBZszmyKzDC2mp94pk3YTNh69Q4d8g496tC8t4cvPIdWc4DMvxG
         CnfXTabfX5AF3ZRGuVcqPpHA+lORPU0YKUPyyA2nbIcLdAryVUeW9Z/rmTjZE32GE4VT
         Pskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmsY0+noyQklGjDko36GN3h+LWVJn5fKBoTkL9G1VXM=;
        b=JYUJPNtZuH7nDb6tazptjv8/oVM47/QKq2jiBWpm2VU9L2ViDQsqT0l9mPOQeoDrHY
         nPuuHS5Rt0RmQ6YIhnMF373T/RoPtebUN+18/MdI4Sf/E/8bBqyeZtjb7ZpyVC5/q7mT
         OGop49pPKCO+MS5319MDDJH90yz8DCWeilAu9xoDOrkW7wtBZ8ChFT/9Sz0HyrgVg2qS
         ZHFBC7nS7WTMWDfqXEuNSIWrSwXlvJGs4at0VmYIGpMWTp/IRhzuyjHcJ1Da5c3CUwHd
         AvmkW5ptw4b0/CztxfNxxN9B4wDh0dxhnNuaZK2+hYBslkuD171/IoFlJKdyvhXoI7xF
         i8ag==
X-Gm-Message-State: ACrzQf0+1Diveqipq+Gw315MkmmvOf2xLC/MLGy1k/EhW/8srB/+ZYUy
        O3YU6fdkL4Ypv61QRDX2loY=
X-Google-Smtp-Source: AMsMyM7MzcEn1e7EaHw6IyoPSOAqtEInpwIeVCZUwRkqi8HvBcCBqZpjv0DU0WTsFfiutZGzL/exLw==
X-Received: by 2002:a05:6a00:170a:b0:563:a40a:b5e1 with SMTP id h10-20020a056a00170a00b00563a40ab5e1mr24861224pfc.40.1667394921258;
        Wed, 02 Nov 2022 06:15:21 -0700 (PDT)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id l15-20020a170903120f00b00186fb8f931asm8320280plh.206.2022.11.02.06.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 06:15:20 -0700 (PDT)
Date:   Wed, 2 Nov 2022 21:15:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod v2][PATCH V8 7/9] bindings: rust: Add tests for
 libgpiod crate
Message-ID: <Y2JtYTCqYM2sTuRC@sol>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
 <0e1deffab733e0a8458d1626bc20cd496cbd5099.1667215380.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e1deffab733e0a8458d1626bc20cd496cbd5099.1667215380.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 31, 2022 at 05:17:15PM +0530, Viresh Kumar wrote:
> Add tests for the rust bindings, quite similar to the ones in cxx
> bindings.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

$ cargo clippy --tests
    Checking libgpiod v0.1.0 (/home/kent/work/libgpiod/bindings/rust/libgpiod)
error: calls to `std::mem::drop` with a reference instead of an owned value. Dropping a reference does nothing
   --> libgpiod/tests/edge_event.rs:103:13
    |
103 |             drop(event);
    |             ^^^^^^^^^^^
    |
    = note: `#[deny(clippy::drop_ref)]` on by default
note: argument has type `&libgpiod::request::Event`
   --> libgpiod/tests/edge_event.rs:103:18
    |
103 |             drop(event);
    |                  ^^^^^
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#drop_ref

error: calls to `std::mem::drop` with a reference instead of an owned value. Dropping a reference does nothing
   --> libgpiod/tests/edge_event.rs:218:13
    |
218 |             drop(event);
    |             ^^^^^^^^^^^
    |
note: argument has type `&libgpiod::request::Event`
   --> libgpiod/tests/edge_event.rs:218:18
    |
218 |             drop(event);
    |                  ^^^^^
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#drop_ref

error: could not compile `libgpiod` due to 2 previous errors


Those drops are now redundant as the events are returned by ref after
patch 9.
I assume they are ignored in the build, as the tests build and run,
but clippy complains.

Cheers,
Kent.
