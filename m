Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98EE97E5A53
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Nov 2023 16:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjKHPof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Nov 2023 10:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjKHPof (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2023 10:44:35 -0500
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47ABC1FDD
        for <linux-gpio@vger.kernel.org>; Wed,  8 Nov 2023 07:44:33 -0800 (PST)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1f066fc2a28so3555500fac.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Nov 2023 07:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699458272; x=1700063072; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Grh8qhAbLRKKuzJ5Uzhv9JdhSVM0HIxXJRvcinyBBY=;
        b=KHEuXQOoo4gyXrlefht7SLi94bA2oWebhnmm7qExNPDTOB0GQHYi/jxaq+0XH4dWd4
         wNo71e0fYTGvDl8KASMxdVwICZq9IoUkF0tGNs7CbMSohr+leH4m+rBaTbCjZQ8XF4Qh
         lhij26rhj7T4LHniopgXC+DKNxLXm695s0Jb+qv//GJ4ujCHioEq1iGaSABX70w/IuXx
         vrqbKhKGAktiV62KeJ7xhswZlNz4dDIKIfDpqNoz02zo+hwjrazLYOGNO/O4k4JIBM2a
         Bl8TlB0B7O2horz1vEV1rc1qxmt4/K2/sQgzi6u5EkH9dUpn6KcUoq+9qFjIB3HIIboi
         gk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699458272; x=1700063072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Grh8qhAbLRKKuzJ5Uzhv9JdhSVM0HIxXJRvcinyBBY=;
        b=RBeoUZMaT40Jd7ipqf7W/ZWwJQqDN0kwwqRMrhS9XWIokrctPIwHogjIbBVpD/+Vta
         qvZbAqLvipMA4DTm6oaZ1MT+2kZdXTgb/j79x6ptHBiaxPz98WnlJIlwRCvHHEgfK+2b
         oqPFgMMRQKk88iWapxz+Kaw3P2t+BjK5HQw0Rsgj88TQmT3CLkxRlW1dvkPpPTsywuIO
         qI72WRNFEEY4ajlhp49nc/8dKgX0ICIThzeamey9Qj6hnqSjpMj5YIBp5UQgMBD5iD/i
         szkvVne77PMuCfZeEgy7/qjkydxsOOPSe/cov4JUjl0C7o/jIBEhGfE8uNJrzJ2XVmjG
         +Yaw==
X-Gm-Message-State: AOJu0YxaiI4FjVWPIUdN5BAl4+b3QY4/bbN3wRwkQC3wXxs1dFVC0A92
        hnPtHWEXlYTOjPVk4RTRkEfBv1BXU5/ohwm18l6+AQ==
X-Google-Smtp-Source: AGHT+IHSdaftKuKLtuyDhT/oXbIUokpd9xeoZzPO3d+holGDq00oY63q3tY3bjQ3OVNs0QuWTlWFx1+6zRj4oZ70MJo=
X-Received: by 2002:a05:6870:3a33:b0:1f0:59fe:84ab with SMTP id
 du51-20020a0568703a3300b001f059fe84abmr1785493oab.14.1699458272050; Wed, 08
 Nov 2023 07:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20231107215156.2961942-1-phil@gadgetoid.com> <20231107215156.2961942-2-phil@gadgetoid.com>
 <CAMRc=McSbDxZwrARhFPPvHoDVPb0h0-T0CNj1rKBgHaSD=5HPA@mail.gmail.com>
In-Reply-To: <CAMRc=McSbDxZwrARhFPPvHoDVPb0h0-T0CNj1rKBgHaSD=5HPA@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Wed, 8 Nov 2023 15:44:20 +0000
Message-ID: <CA+kSVo_is3enwEz=wzizQ4JghBfbDJsLdyTuyb39eY2bRdrUDQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] bindings: python: standalone build tooling
 for tests
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 8 Nov 2023 at 15:04, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, 7 Nov 2023 22:51:56 +0100, Phil Howard <phil@gadgetoid.com> said:
> > Move extension definitions and tooling for building tests into
> > `build_tests.py` and update Makefile.am to call it with appropriate path
> > prefixes.
> >
> > `build_tests.py` will perform a standalone build of the text extensions,
> > keeping any build noise in a temporary directory and copying the final
> > built modules automatically out to `tests/gpiosim` and `tests/procname`.
> >
> > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > ---
>
> I'd like to be able to run the tests from the source tree but without
> --inplace the core C extension is no longer built in-tree so I cannot do:
>
>     PYTHONPATH=./bindings/python
> LD_LIBRARY_PATH=./lib/.libs/:./tests/gpiosim/.libs/:bindings/python/
> python -B -m tests
>
> Could you somehow keep this behavior?
>
> Bart

Sure, I can just add the gpiod extension to build_tests.py.

Looks like I had a stale one in my build directory, so when I ran the tests
they *just worked*. I'm adding gpiod/_ext.*.so and tests/*/_ext.*.so to
clean-local in Makefile.am to help prevent that.

I am also adding "python-tests-run" (could probably pick some better
names here?) to formalize your test command (I was running something
similar but not quite the same) so we (and any future pioneers) are working
on the same terms.

-- 
Phil
