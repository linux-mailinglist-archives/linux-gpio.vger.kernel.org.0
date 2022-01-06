Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC68486705
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jan 2022 16:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240580AbiAFPrc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jan 2022 10:47:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239388AbiAFPrc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jan 2022 10:47:32 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48C5C061245
        for <linux-gpio@vger.kernel.org>; Thu,  6 Jan 2022 07:47:31 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id l8so532657plt.6
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jan 2022 07:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gvg/eQNpfZeB61AgBC4TtyzfvhRmZBsZ6+8UEPVb5fA=;
        b=F2kcKDsjERv8p+75KqyWkjIIDBeP/xQhvrkOk0vy1k/bbxcZ1jFrh5Y+rF2djsXEB5
         /zrmt1oM8ojUJ5ybyy1PW0BTMhcIlPZt7kr2Gx5BMmXSrBevgQlTzgnqu3TzfQ5kb45a
         AoBKO62lp64MeAdWAQO1COObTZWYLJzueih/68zb6A+eldW8Mmbc+DglTUWbYDuvq45d
         u4FDAcYfS2WcUvnqmROStP1HJZVUzxf4Hh7H5/2Z4Bn0FYDZTU6Q0bd7YdP78fNS8ii+
         rjEWVNTBL4ib1kXb4VwFm2PqyVLoNmbhmCFej+2551pfB3SwrFhl0dU7JLTB2iqrXSN0
         S5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gvg/eQNpfZeB61AgBC4TtyzfvhRmZBsZ6+8UEPVb5fA=;
        b=r6K2xfkz40d1xvIks2jiIMW/KBz4M02XfxWAOuGt/1TJanyPdncPhxk2EiKM4/ZP6F
         VGSrQK4BXrFrHRbNa9oN5sO5N5XsKjt1ZyrWU6TtAaiV4CDGVUABZPp+9VR887OZA7yt
         ortXBQIDvPn2uVYj9oDp4Dyxf8fXHBCstokPjrSRMCURUXhjCg4eRIVvSfGq8NOmKiY9
         utqeeWZjZnm3i9IyMDfv46+fSFlHBDTpcXrZtk901+qsmP0deJxFJxdjF0Qgukhc444V
         uTKfUE7NrWjd/qGvutjYa5FznY9+z1JAHfuxG0TH+7lg0ZsU9bW7UuSFIGGzeGHFc8E+
         WX+w==
X-Gm-Message-State: AOAM533OE5oX349cyAfiWOfx2v4K5WugbDdhst8QOXnJVh2KxGMXnKVh
        Um+WlcC2g+UvqLziBQ6ywmo=
X-Google-Smtp-Source: ABdhPJyGp86rhcvdrYUYSXS+m3zIV8Nim/VZdA40QIcFDOctnAFWn2fPIBS7czlwrph08dUMHe+wAg==
X-Received: by 2002:a17:90b:4c41:: with SMTP id np1mr10715111pjb.71.1641484051361;
        Thu, 06 Jan 2022 07:47:31 -0800 (PST)
Received: from sol (110-174-161-167.tpgi.com.au. [110.174.161.167])
        by smtp.gmail.com with ESMTPSA id oo14sm2849340pjb.34.2022.01.06.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 07:47:30 -0800 (PST)
Date:   Thu, 6 Jan 2022 23:47:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20220106154724.GA109697@sol>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217001207.GA6287@sol>
 <20211217051133.c6pipmhxxysyxdrx@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217051133.c6pipmhxxysyxdrx@vireshk-i7>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 10:41:33AM +0530, Viresh Kumar wrote:
> On 17-12-21, 08:12, Kent Gibson wrote:
> > I'm of the opinion that a rust implementation would be better targetting
> > the ioctls directly rather than libgpiod, as my Go library does and for
> > essentially the same reasons.
> 
> I remember asking Linus initially about this and I was suggested to use libgpiod
> instead :)
> 
> > To test that theory, and as an exercise to learn rust, I've been writing
> > one, and so far I've been calling it gpiod :-|.
> > 

In case you are interested, the first pass of my take on a Rust GPIO
library[1] has finally gotten to the point of being core feature complete,
and may be usable, although it is sorely lacking any integration tests.
And the documentation is still pretty light, or even non-existant for
github.
And the event interface is either polled or blocking - haven't gotten to
an async interface yet.

Anyway, there are three crates there:
 - gpiod-uapi provides a thin and safe wrapper around the ioctls and
   file reads, for both uAPI versions.
 - gpiod provides a more idiomatic abstraction, and hides the uAPI
   version being used - unless you need v2 specific features.
 - gpiodctl provides a binary that bundles all the gpio tools into one.

There are a couple of minimal example apps in the gpiod crate, in
addition to the example that gpiodctl provides.

Cheers,
Kent.

[1] https://github.com/warthog618/gpiod-rs

