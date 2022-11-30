Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A94263DA60
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 17:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiK3QRE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 11:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiK3QRB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 11:17:01 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67D715716
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:16:59 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id q128so1507944vsa.13
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bRwcEqQoEnv776Iw22UROR68Hds7O76yD4hlJ4jDcP4=;
        b=wjex1oCqibgcRnOleFxTmIP1xSojKWvptx9OusVabqJfepFaUBOSx7Byd1EQQkTjcv
         MQTcNjepbbf6MACREBPTAUZAhqoJQZVEBych9akHc5Yr5ahtLP2+t63G601xyi7AJ+Jw
         qc4hvRELGOF4y1jRCkxUVeJ3u0CwwgSvOVLh6Dpno6yzEc2ipPcI7XtS94uTV4zeCBAo
         Zdo3a6giWpjqKPRBlt/7JjqTTuRzGmKFveki9x9/hNHisgqKF15gvAUcnPqUA799rolE
         NVY74aOyWUMvgI6/xZnuURc8y64Z2FFC/Sik9s3nqVtHrpxmwCP+i8t4opK6Ap3nAQ4o
         bl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRwcEqQoEnv776Iw22UROR68Hds7O76yD4hlJ4jDcP4=;
        b=rkSCNaU/mwEWI8yjUt9zhTnWL/FQXyr+xpuR6U3mCpLej9DJuwtVw2ZbMInawqKYmC
         HySzwMzOO3YPKrAlK3B5Kk4YKzLYoDK8duBOp3sBtfucnUJ5LxBrO+32FEBYe1CFLeJR
         A+JnZZ7f1LEzqhqhVCglqFHCtLwNPJDv7Tz7XOIeOSK5fuS00ETNJgfSEh+7u1L+1O9A
         BdVyChAOcUP+Nd2rLJFaHWKvafntehJO44x+xOsXPMuqTdBIXza/KNDIWWn5eQpWZm7+
         3wK3POsUyXhHL5QAictJ5OOGwNf3FzheSquV2HauKeSDVI8p4nX8TrJ6jZ6Tzp7qVzb7
         zH8w==
X-Gm-Message-State: ANoB5pnjR4Hvpfneh8Kt5xoVqi4lhCqZ2Y3GnycPHqY+T8cnUJMPnJMq
        O0/y6WuD4k7PswDWq8g/eUe/cXc5lGzhsPHMoh9Uow==
X-Google-Smtp-Source: AA0mqf7mzAOdyiAh/OC9X23Y9+9CSGE/WRBcx2lKLO8qXV1q/5HfimntPoJGgaQQAvrtQXTUEEoWj0+cUa+gC1Qb9Zc=
X-Received: by 2002:a67:1c85:0:b0:3b0:92e2:37b0 with SMTP id
 c127-20020a671c85000000b003b092e237b0mr11471128vsc.9.1669825009707; Wed, 30
 Nov 2022 08:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20221130124231.1054001-1-brgl@bgdev.pl> <20221130124231.1054001-12-brgl@bgdev.pl>
 <Y4dkF3eyH8ZO2PDN@smile.fi.intel.com>
In-Reply-To: <Y4dkF3eyH8ZO2PDN@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 30 Nov 2022 17:16:38 +0100
Message-ID: <CAMRc=Mf4vPz-tKh1meNAij5pQdmd1wRNO07PFrhePBKaZ+vJVw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 11/11] bindings: python: extend setup.py
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 3:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 30, 2022 at 01:42:31PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add additional information to setup.py. This will be visible in the EGG
> > file.
>
> ...
>
> >      packages=find_packages(include=["gpiod"]),
> >      ext_modules=extensions,
> >      version=__version__,
> > +    author="Bartosz Golaszewski",
> > +    author_email="brgl@bgdev.pl",
> > +    description="Python bindings for libgpiod",
> > +    platforms=["linux"],
>
> > +    license="LGPLv2.1",
>
> Is it applicable to the bindings only? I am not familiar with the code base,
> but one of the patches in this series makes me wonder if you are not going to
> make same mistake by licensing tools, if any written in pure Python, with a
> wrong license.
>

Every file has its own SPDX identifier that takes precedence anyway.
The module is licensed under LGPLv2.1. The tests and examples are
under GPLv2. The setup.py applies to the importable library so
LGPLv2.1 sounds good to me.

Bart
