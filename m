Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07845B986C
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 12:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiIOKCk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 06:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbiIOKBs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 06:01:48 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99676399CD
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 03:01:45 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id 9so6446361pfz.12
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=FKFys959lIE9nFhlH2xo5MHthb0H7u3721U/UVIbElk=;
        b=nOtKhzrhjHwg4j+Osbut7zHH+3mqWAJ9sCQZ6aiujPcdCf92wvzq48bainP/9CNgeq
         b+4crarB2lXC9tlunQw0NfBRXyc/qqyZLdltXlO/ZCED9t7eiOD0XgZM+8VUGTyPOhrI
         eyK/hf81z1xaq8FJCuy9AF2QloobDS/mEViEFSTtx8PqwJ4gjAN8OkwVxrOnNWFsgaBV
         m/X4zNyVEk3vg1PBZUlVkl7Lj2EWm3/1XCy3uWWygkI6S9TKTy2WoX/cDgo9kAdisoVS
         9fyqyWrOjQNuk2j2Rpi4YnCvxqEIXmTUZwSPbiPuSeNDsMWwVCojhUFEUmabHWW9gO/Y
         HVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=FKFys959lIE9nFhlH2xo5MHthb0H7u3721U/UVIbElk=;
        b=HtBzUHJ2HkaZm5pUIz26MhxKMUo6enAbsWH72h8//Z1/mKHITAODcBtvlcb3QUpQum
         lealE1Hge+d/yQjhvjPbzB/7rG9HEowIJBehTuDZVpUxLuVOkMvgglfDuKrAFDS06DIE
         Ng7yyX69wtFkCYEyln1rtsWCggnh60TbVqrf4qImE1j/2IgTDUE7rNLc4d+5krqKGTVd
         DRG2SQqvKwiH4X3XGq2teA0AvQX3KAyjnPSxkXW7e5zKPu+YCnLFhwHPDMpWGeR4KwUq
         pIxyNIvI1C6p/PBNYoSld3qIVH58bYMIONfKiZpOgPEQPSQUUAKiPO2Qc0j7gfeSROLN
         DlhQ==
X-Gm-Message-State: ACgBeo3m74s5fgLl1VAuYCTAHCugsYnkNONDIZPfh9R+kPAfCou2PSrv
        oRXrNJms4Sb+Sh5esyx3P1Q=
X-Google-Smtp-Source: AA6agR4Az+HVp4Tt8F6NLxoM9vD0U+sGWXTXY6sql/Xg6M5kXOvsu4O3zRadsycOm4IGc8TUvtD9pQ==
X-Received: by 2002:a05:6a00:230d:b0:53d:c198:6ad7 with SMTP id h13-20020a056a00230d00b0053dc1986ad7mr42551520pfh.67.1663236104789;
        Thu, 15 Sep 2022 03:01:44 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id e68-20020a621e47000000b005411a68fe74sm11978855pfe.183.2022.09.15.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 03:01:44 -0700 (PDT)
Date:   Thu, 15 Sep 2022 18:01:39 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v2] bindings: cxx: tests: use the builder
 pattern for the GPIO simulator
Message-ID: <YyL4AwaJIO9kim9s@sol>
References: <20220915084723.19910-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915084723.19910-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 15, 2022 at 10:47:23AM +0200, Bartosz Golaszewski wrote:
> In order to make the interface more elegant use the Rust-like builder
> pattern for the GPIO simulator class.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---

Was there a v1 for this patch?

[snip]

> diff --git a/bindings/cxx/tests/tests-chip-info.cpp b/bindings/cxx/tests/tests-chip-info.cpp
> index a6bb123..717c387 100644
> --- a/bindings/cxx/tests/tests-chip-info.cpp
> +++ b/bindings/cxx/tests/tests-chip-info.cpp
> @@ -8,13 +8,17 @@
>  #include "gpiosim.hpp"
>  #include "helpers.hpp"
>  
> -using property = ::gpiosim::chip::property;
> +using ::gpiosim::make_sim;
>  
>  namespace {
>  
>  TEST_CASE("chip_info properties can be read", "[chip-info][chip]")
>  {
> -	::gpiosim::chip sim({{ property::NUM_LINES, 8 }, { property::LABEL, "foobar" }});
> +	auto sim = make_sim()
> +		.set_num_lines(8)
> +		.set_label("foobar")
> +		.build();
> +

You do this a few times, so perhaps add a helper to create a simple
simulator with a given a number of lines?

(I called the equivalent in my tests a Simpleton, borrowing LinusW's
practice of naming things after yourself.
Not that I'm suggesting you use that name.)

And rename make_sim() to make_sim_builder(), as it the build() that
returns the sim?

Cheers,
Kent.

