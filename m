Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB4A46FF3C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 11:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbhLJLB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 06:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240145AbhLJLB4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 06:01:56 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFEAC061746
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 02:58:21 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so9154616pjc.4
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 02:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ngAMk46Rz8CHvHSOaJuZFtnRLPNe0W1lLJO40+hKebM=;
        b=o/bSZdCmjVHUsvyvyNaWZLPG5xHsqhqwELKVkSZVLk3MRze/bjPAdWcaWJaIw0vMgZ
         riGkSH6NHny1Bdz8QTckRPUU4xXwcGvarGliWbJVb91j2tPBaPnmZrXjvwuE540Cqhge
         hujtdesG+15OcJNzWbBBuPl0y5qxRO7Jgicr18qc4cRIoe5fK7OaakMG3yJ+7nc/cZ8Y
         SI80uFDJOkaIPhsEkmWCcrDlbaLuxt+crL1D3hizhCSWuV403qBWMY5S/FWrR4CHpmEg
         9CnJ3EVmnPfip4ReQwcL2HozOlHqGvOgmGKaU6ERQmXzRpOpmPL7STpDJVaT1yNOdl3I
         M5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ngAMk46Rz8CHvHSOaJuZFtnRLPNe0W1lLJO40+hKebM=;
        b=0Qn6IYPonCjvCZHMWy+5vCPxG//bSicWA8/XBHAMesU47Qqs9tlE9rgs2W9tSzT/0u
         dkDj5kT6sN4Gr3xa/k3ihukNMSwbrKvPFwJNabkcWkqv/nL3zB4UOYGbWLeqx/DGPlS/
         MPAuXczswLPUY0UQnH1k1MnRHpD4tsmtZJpc04UnzaBiMBdtD5fdrlEQ2NXqaK1b4vZv
         4OTyfGg8A+a6rUeRHeOMixG7oBYT9R9zqMfltb/DgxhadAtpPaUfaayNgAk0OljtaFtX
         imivPBuylzb7lp0+Eo02XH4AIv8up1Pu9zzFMDkt7XkbGP31ivoeIr2okRv/v+wJjcNn
         Y+IQ==
X-Gm-Message-State: AOAM530F/I23xOj8vR5wmtS7OKslUWNYHcOxPWKNnlbshUePT0wmYKP3
        x23nGVAm7KU3Qx5/k36GMoyfkQ==
X-Google-Smtp-Source: ABdhPJypdNPOS0CLBC8FZMvzGLHUN36EY6d67dGX3+dhhVODd17Ch6DgpQuCKIgXyPcAh1t68yi5FA==
X-Received: by 2002:a17:90a:3e09:: with SMTP id j9mr22853447pjc.24.1639133901138;
        Fri, 10 Dec 2021 02:58:21 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id 6sm819637pgc.90.2021.12.10.02.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 02:58:20 -0800 (PST)
Date:   Fri, 10 Dec 2021 16:28:18 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] libgpiod: Fix build failure with musl
Message-ID: <20211210105818.tsbzahtcs5nlxqkr@vireshk-i7>
References: <4a8c598db0a78421b074f19eb2157d89f3198440.1639047500.git.viresh.kumar@linaro.org>
 <CAHp75VdwQjcrQLHh49WV5e95KCsyqVyoFO=VeNfK4LC0mEZvNw@mail.gmail.com>
 <CAMRc=McUV3-Afhd3yipDfvcEQijqDxf3cXr9egdKAgPt0nv5RA@mail.gmail.com>
 <20211210033842.j4h5glg34prjn4ha@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210033842.j4h5glg34prjn4ha@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10-12-21, 09:08, Viresh Kumar wrote:
> On 09-12-21, 19:32, Bartosz Golaszewski wrote:
> > On Thu, Dec 9, 2021 at 4:17 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Thu, Dec 9, 2021 at 5:15 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > >
> > > > Musl defines the _IO*() macros in the files included via <sys/ioctl.h>
> > > > and hence we get redefinition errors during build as <linux/ioctl.h>,
> > > > included via <uapi/gpio.h>, defines them again.
> > > >
> > > > Fix this by undefining the macros between both the includes, document it
> > > > all in musl-compat.h as well.
> > >
> > > Is it only me who wonders why it should be fixed here?
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> > 
> > No, I'm wondering the same. I see these musl compat issues being
> > "fixed" in half the embedded linux projects. Looks to me musl
> > introduces these issues, doesn't it? Any reason for it? Can it be
> > fixed in the library?
> 
> Not sure if I can go fix musl here :)
> 
> Btw, another thing that will work better is if we do this:
> 
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index eaaea3d8e6b4..ebf6b5312cc0 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -12,8 +12,8 @@
>  #define _UAPI_GPIO_H_
> 
>  #include <linux/const.h>
> -#include <linux/ioctl.h>
>  #include <linux/types.h>
> +#include <sys/ioctl.h>
> 
>  /*
>   * The maximum size of name and label arrays.
> 
> 
> 
> That will fix it properly as well, no undef issues on any library
> then. Some of the files in uapi already do this.

This got fixed somehow after I played a bit with the toolchain for
musl. Abandoning this change for now.

-- 
viresh
