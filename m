Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6213E75BCC9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 05:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjGUD2H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 23:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbjGUD2B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 23:28:01 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD16A2735
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 20:28:00 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-345fcf8951fso7367255ab.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 20:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689910080; x=1690514880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pu2dDo+u+UCr1ObEhuoPtJOe79lmhhTI9ZSxUJDKQEo=;
        b=qQef0mK51OBWtJdoYjZSCyamZeGbYnK5MUaAOfUk9pbAfYna1KfyLaUMhtk4txfWek
         9qeMcVLiVe2yGKso0LsH1HgjzQK6qEB2kjonu6Xhn3Jsvl9leU7eFfcMILD3zZyF2oXx
         GzUAV3WsW7EhbyHj8dvMZPG6tr4wJwOF1qGI9fv3DeJwrH7ajGuw0g6CAF+XNNXo0pLV
         rU8ywG3X6SfYd3pibqTvNsa83twY5heGL2GUbC8qhaoINYq0YxJMzGlrStvYfr8jCqE/
         2WN3F+KMPuoAGbvQGO4CETLz5hUY9rUJwRK6YrO/Qss7/rIBl4e+sC22FqEOitfuD84t
         9oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689910080; x=1690514880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pu2dDo+u+UCr1ObEhuoPtJOe79lmhhTI9ZSxUJDKQEo=;
        b=jGyUw+/aB9znlySMZWgLGNq9zYczj7C5ESd0JOMcBpA+okHmcVi3EL0cp0P+BYUlR9
         2coKwrkYfjz0cPwTHfgy5kngvITyus1KM7hQZzhulHhx340XtJMyIwLN8RUGy9I1hTlY
         grKSgems28sx3DqsdCL++n04+YRLKzc2LJUNDJOFqep8DFLST2/46xAVgRg2VDynVynZ
         EgOyry1wv0K1OnVUMrm33Wa4jYVMJsuKJIf6PC3mrPUt5pbIoguy4rARSftNlfDApbMK
         L/LmErKV+1eaYKK5Y7EUa9kxlCvsKDsQ4giWuFdAmtVi+jl/X3PFv9xPk+I6J+H6QMPe
         YrgQ==
X-Gm-Message-State: ABy/qLamfSPUEDCg9nOOnJ9NxE9tNjK5QubkvPDdIoODENicWE+ZI6Je
        IzBf2I9bpk3sgJiojORQUr2VXdmha+k=
X-Google-Smtp-Source: APBJJlFOK2TpjKmHQZWJaDDeEizzn+k8Rpfx5rdVoSvnFaa9P3r1gVZf7aIOuw2Z/VFZe6/Ob4o0xA==
X-Received: by 2002:a05:6e02:1a05:b0:348:1a1f:5542 with SMTP id s5-20020a056e021a0500b003481a1f5542mr1068855ild.17.1689910080092;
        Thu, 20 Jul 2023 20:28:00 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id l2-20020a62be02000000b00673e652985esm1902703pff.44.2023.07.20.20.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 20:27:59 -0700 (PDT)
Date:   Fri, 21 Jul 2023 11:27:54 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2 5/5] bindings: rust: provide
 LineRequest::chip_name()
Message-ID: <ZLn7OhjLdwneh3QO@sol>
References: <20230720144747.73276-1-brgl@bgdev.pl>
 <20230720144747.73276-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720144747.73276-6-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 04:47:47PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Provide a wrapper around gpiod_line_request_get_chip_name() for Rust
> bindings and add a test-case.
> 

One other thing I noticed - just a heads up that the bindings generate a
new clippy warning from lastest nightly:
(rustc 1.73.0-nightly (399b06823 2023-07-20) (from rustc 1.73.0-nightly (ad963232d 2023-07-14))

warning: usage of an `Arc` that is not `Send` or `Sync`
  --> libgpiod/src/chip.rs:75:21
   |
75 |         let ichip = Arc::new(Internal::open(path)?);
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: the trait `Send` is not implemented for `Internal`
   = note: the trait `Sync` is not implemented for `Internal`
   = note: required for `Arc<Internal>` to implement `Send` and `Sync`
   = help: consider using an `Rc` instead or wrapping the inner type with a `Mutex`
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#arc_with_non_send_sync
   = note: `#[warn(clippy::arc_with_non_send_sync)]` on by default

warning: `libgpiod` (lib) generated 1 warning
    Finished dev [unoptimized + debuginfo] target(s) in 11.01s


That is independent of this patch.
And it is the nightly, which is a WIP so that may change - I noticed an
older nightly reported this as an error.

Cheers,
Kent.
