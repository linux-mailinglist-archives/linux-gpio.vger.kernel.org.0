Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40607632549
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 15:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbiKUOOV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 09:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiKUOOG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 09:14:06 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4B313E3E
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 06:13:13 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id d6so19002897lfs.10
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 06:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/gVXU4CCpMPIIsF7rh9gJbLfWbegQjWmXHwfCSm7NwU=;
        b=2vZDgAmcEFAnG7beqo8yOsnMhX7xoxr8Twde+OF3l7X5s1mJZRENAsF8iYf4iSSOcD
         HPIwXDBc9VuzQ1ztQMRzTnCCT7qsYH0Pie4dcvoX3Jg65yWLmG9HA1EsDZ97HU/U/c7h
         0NbE6dL2nRJzOacTLCidEaoFdx8mpnrWPpJHvInSlftidjLGe+B4j1d6SQ8l4ZGI4B4p
         baI8AG7IEGmMRmJ3Cx2hhvNPFgNaLMV0e5eJLeGQTMurjcCxwCEFI4UNi8yy8Cbjumgs
         x+leHufOY+q8CwXQPZrXknhzLlrvSmlQWQwLOQl7y6tY19gjo2PCjj0+2N0QInfMguJR
         1qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gVXU4CCpMPIIsF7rh9gJbLfWbegQjWmXHwfCSm7NwU=;
        b=j5ZlQgl34hcVHAjPbE3Koge4GMBCvU+To4JYEoqiB33+sOf2PF9AGGfqUo99TehuVa
         uDUWn6epVvASiaNH5YPSkcDcGuQYSCLV70S4vo35Hz6MRtiLVePIhPNnuraW+nboHhZV
         cfXeDxNffkMHKVt+Gq1Qc0St+2iRQCmUFSq7jb650BVNJj/NACxttBYXRZZZCiFfc2aP
         5lrpOrW4fPqyID6Gq/VAKdNO6BtSwSw1ByxCD4QcT9lbwJzMYxLeORgdGw28x+3LgK8y
         3yjPBQ+fD6Lp8suyxpRZxFWIlsccgt9eeSZGMTazpZ5NgEF1woKiVPp4PQtMQYWfyfq/
         D61Q==
X-Gm-Message-State: ANoB5pmSN+sycy2QWZUsH5EgrBmBNNXgl65TTh35FHBqs0YYrEX6UwZp
        UjX+76eWz7U0n5ero44owonBWYcjDNgjxEf549yqOw==
X-Google-Smtp-Source: AA0mqf4pU9ITMJWhUzbY67BsuOHiwvnX5tS6s4IeLo18VsqyrxcWY7ABSEGhlELnoarsP9UJrqEcDnf81Qt8fpRwh/c=
X-Received: by 2002:a19:4909:0:b0:4b1:785c:838d with SMTP id
 w9-20020a194909000000b004b1785c838dmr5825636lfa.388.1669039991364; Mon, 21
 Nov 2022 06:13:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668768040.git.viresh.kumar@linaro.org> <daa3021e4c148d33a8d50c54841719082836c43a.1668768040.git.viresh.kumar@linaro.org>
In-Reply-To: <daa3021e4c148d33a8d50c54841719082836c43a.1668768040.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Nov 2022 15:12:57 +0100
Message-ID: <CAMRc=MeXTD10OVZzp2zGTR6Vs2PXemzkrvpBqFE=YojS9mrMPw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V10 2/6] bindings: rust: Add libgpiod crate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> +/// Get the API version of the libgpiod library as a human-readable string.
> +pub fn libgpiod_version() -> Result<&'static str> {
> +    // SAFETY: The string returned by libgpiod is guaranteed to live forever.
> +    let version = unsafe { gpiod::gpiod_version_string() };
> +
> +    if version.is_null() {
> +        return Err(Error::NullString("GPIO library version"));
> +    }
> +
> +    // SAFETY: The string is guaranteed to be valid here by the C API.
> +    unsafe { CStr::from_ptr(version) }
> +        .to_str()
> +        .map_err(Error::StringNotUtf8)
> +}
> +

This is not a blocker, I will apply this series to master later and we
can add modifications on top of that, but I am now questioning the
need for this function here and also the value of __version__ in
Python bindings.

Previously the python bindings were built with autotools as part of
the whole library. In v2 python now has a proper setup.py script and I
intend to publish the bindings on pypi. It can now be built separately
from the rest of the libgpiod code as long as the system satisfies the
dependency for libgpiod. Example: I will split the yocto recipe for
libgpiod into one for the core lib + tools + C++ bindings and another
for python that will go to meta-python. The latter will depend on the
libgpiod package but will be built in a separate sysroot.

In that case keeping the libgpiod API version as the Python's package
__version__ (which made sense before when that code was closely
integrated with libgpiod core) is no longer necessary. I'm thinking
about setting __version__ to v2.0.0 (because we already had python
bindings with v1.x.y versioning out there) but decoupling it from
libgpiod's API version.

In your rust code all the crates already have their own versions that
don't follow libgpiod's API's version. I think we should drop this
function. What do you think?

Also: is there a standardized way for crates to inspect their version?
As in: println!(crate.version()) or something?

Bart
