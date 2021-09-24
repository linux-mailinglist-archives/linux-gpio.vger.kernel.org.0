Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705CA416F9F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 11:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245329AbhIXJzL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 05:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245306AbhIXJzK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 05:55:10 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A541C061574
        for <linux-gpio@vger.kernel.org>; Fri, 24 Sep 2021 02:53:37 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id y89so23175878ede.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Sep 2021 02:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Id80sjK4OQ4kA7sB5sMIolgMPxWgM7jgcO0GKg3mVBY=;
        b=qLMwH9jspDZBKXgLfvvSbt6nyGGRM4DJKnnMJqe4btOrFxPekf/eh9++NcoyLGF0Gh
         np7sVhLSLC5tootJFYEAEDwuq9WT63yrxTB3JSdGF54VkFSJv2RodKXNN7WqybPMcjIJ
         bV0DpF1CwBjoCmr8VtfdZ6WGOvq3N/rXlECUyV/3G8f2uGpuk4KAnGU1zCq/eOj/dyBh
         oHxhiQrv6S0rTre4KEH/jpC7LFD0lVs4mnwwUYrjvyiLrzGe6y0H2kfOxUxQ8rez2OtM
         pNhOUOI6ZX27QhvHvZk41QK0W5KPDbRtDmOyP6vS6gKfZlm+isg7F+1+aF2lZjJ39QI+
         B6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Id80sjK4OQ4kA7sB5sMIolgMPxWgM7jgcO0GKg3mVBY=;
        b=7tDsjnDcB7PwB84B4omLyTez0iCivr0rmUC6woEZuvxrGBIz+6fDRGOHzHlnizHRz9
         3QQe9MSfKhX8GvqfSfup4OO6/1oXlzUksl43X1Q/F6oNDsaW7wEAM22Aj/NTyAT+h3ki
         4fNJh2KWIALTYw7BEVmCCGJc1Zjl+qe5fNq8pEjkRsf0FfOlu5kJav02JcZ8mjBIjbKb
         kpy89L1SBn+gk9ipwD/THrSeFhJ3FDgMsf3FK8mQBxU2pVEYZ/+oQviZBwrc/V9CsDiW
         JzfCkuWXL8pndhmlurXg0bpSdXXjUpMa1JJ50jEBN5mTCww4qRM5qb0nP95l4ta4NfYd
         0T2A==
X-Gm-Message-State: AOAM533SyhW9SKKKNOG1lB/olE1DJWzt0RuhW0dLMGxB6ZPyAd3m4krh
        +7y+X0Q0H3AfZ2npfry1OS7kdbdVGe/Et/UWNwPgB/kzVwc=
X-Google-Smtp-Source: ABdhPJyr24KNjTqo6Jvr16UhTMre84Cz1Lq9TebpnITDDxXKB/f9pJQrPrb5DFX3JH6Z3PSTiuSgZF0ETHwd1ampbnM=
X-Received: by 2002:a17:906:9401:: with SMTP id q1mr10246410ejx.313.1632477216028;
 Fri, 24 Sep 2021 02:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAFKLa4+CB5Of1T-fjvtxtzBoeB8xYVENsAZCShRPmBmkGe6ZKQ@mail.gmail.com>
In-Reply-To: <CAFKLa4+CB5Of1T-fjvtxtzBoeB8xYVENsAZCShRPmBmkGe6ZKQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 24 Sep 2021 11:53:25 +0200
Message-ID: <CAMRc=Mc_P3G7jZYXEVfRGH4UJhera3+oRQ5-vDaoA9GKz5vJZQ@mail.gmail.com>
Subject: Re: [libgpiod PATCH v3] Add cmake support
To:     Andreas Pokorny <andreas.pokorny@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 16, 2021 at 4:27 PM Andreas Pokorny
<andreas.pokorny@gmail.com> wrote:
>
> This is a wip cmake support for libgpiod. It allows to integrate
> libgpiod as part of a bigger cmake project built via the new package
> management feature of cmake called FetchContent or as git submodule.
> This work is motivated by the fact that not all distributions offer
> proper development packages with bindings enabled and for the different
> kernel api versions of gpio. This change can be provided/used as an
> external build script, or conveniently shipped with libgpiod if desired.
> Both ways I felt the urge to share it with upstream and potential users.
>
> It does offer various build options to control whether tests, C++
> bindings, tools, python bindings or examples are built. Furthermore
> you can control if the libraries are built as archives or shared
> libraries. Basic install support is available.
>
> The options are:
>  * GPIOD_TOOLS_ENABLED (OFF)
>  * GPIOD_TESTS_ENABLED (OFF)
>  * GPIOD_CXX_BINDINGS_ENABLED (ON)
>  * GPIOD_PYTHON_BINDINGS_ENABLED (ON)
>  * GPIOD_EXAMPLES_ENABLED (OFF)
>
> This change is still wip, not everything works well enough:
>  * examples are not built
>  * tests are built but not integrated properly
>  * install location of the python module is still incorrect
>  * man page generation is missing
> ---

Hi! Thanks for the patch.

I'm not sure having two build systems in parallel is a good idea
frankly. Whenever we add a new file or rearrange anything we'd need to
remember to change it in both systems. This is the same issue I had
with meson except that meson is more modern and I would consider it as
a replacement of autotools first before cmake.

Why is that needed anyway? Doesn't CMake support pkgconfig? I would
like to learn more about the reasoning.

Bart
