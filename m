Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C50827A101
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 14:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgI0Mjj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 08:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgI0Mjj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 08:39:39 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4782CC0613CE;
        Sun, 27 Sep 2020 05:39:39 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k8so6926736pfk.2;
        Sun, 27 Sep 2020 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GoPE+dl9c5Fq29Wkwbgxhh5vmykedvXRF9PCNISmQks=;
        b=cpr4WkQaigV76mMOBocsE5QdcMt//RMvbiyoG8yiiUOKkxx+zQoU3JtldsryJGFdRm
         Wik8ViVS4hkC21yXF9FLJeVhhfyqgKMOkckeShili2ptHHTYYA/O/cJAnF/t5tabVpAC
         TLQQB7xwgC0AjvJx+7sbNHhVo1a51CYTZndLJEPnwgqcUMFrHIlELS2UzhZjjjgzHn8H
         vv0YVoP6Up9PwRdSQCsr0UCM+J0Fs7q6i1UwfRz7CJS+XCdRjf4v79+CC067q7xrXnDp
         FC6FgKNKRqSi5WNw5H8Ubmsi6TdBuMFil6O/Pfw5vedZn/jOYE0/VZQZna5GHPpKDsxL
         nTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GoPE+dl9c5Fq29Wkwbgxhh5vmykedvXRF9PCNISmQks=;
        b=S8M2izjrPsljtayqaEZ/jrTwTRku+jGQVkAqrxNIIJQpSZ+EwHowVwUDc2B95I+Ot6
         gytywnd4FxF9qMlSt2q07wwslUumvEvgGr9cQk7bveXAMV4r4E0C3IriujsvNxykUvLq
         E9oD3kD85WQdRvn4XzQB6FSm8IAX6vUn5prTCVG0/qn7aNALaSXa/Qc0UrULNW3PhI1/
         u4FrAdjCFlT2fJ7Rw3wF/qviYVlEltA6WsNCuS4eWXjUiYWpND99VQ1WIfUvtaXUOtgI
         IE9kvjDlRXqQK3PkDh5brumWv4yzOeyhFST1j+KMGmUj3h8XgWc3mV6BJF38jgs7ahKQ
         jYrQ==
X-Gm-Message-State: AOAM530euQlLtKYm1n2+W2y0vcwEEJY9DLr4BYnanhERkiMY2TnTPUF/
        o83Q0K+hG9Fmb6urD8lxnF0=
X-Google-Smtp-Source: ABdhPJxGcbhbfQ4iLomJnE9WYWW8f8AfPa0MZcfg45esZ0D0D1LQscEzUJcF50RMZe31/KMIfXIoJA==
X-Received: by 2002:a62:5a04:0:b029:142:2501:397f with SMTP id o4-20020a625a040000b02901422501397fmr7012170pfb.68.1601210378639;
        Sun, 27 Sep 2020 05:39:38 -0700 (PDT)
Received: from sol (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id r4sm3968706pjf.4.2020.09.27.05.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 05:39:37 -0700 (PDT)
Date:   Sun, 27 Sep 2020 20:39:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200927123932.GA20442@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-8-warthog618@gmail.com>
 <CAHp75VdQUbDnjQEr5X5q6WdU6rD=uBNznNn5=Vy=pvdwVj_hEA@mail.gmail.com>
 <20200924080921.GE17562@sol>
 <CAHp75VehvUTt19sBxgPTZszUmxDGZwqGAV7bgW5jVM8Mf63UJA@mail.gmail.com>
 <20200926091631.GA89482@sol>
 <CAHp75VdFG1DBSjD9DwBXvsmDCN5eN_unKiZkVBob3dSTyZzSiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdFG1DBSjD9DwBXvsmDCN5eN_unKiZkVBob3dSTyZzSiw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 27, 2020 at 12:00:04PM +0300, Andy Shevchenko wrote:
> On Sat, Sep 26, 2020 at 12:16 PM Kent Gibson <warthog618@gmail.com> wrote:
> > On Fri, Sep 25, 2020 at 01:06:02PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > Hmmm, there is more to it than I thought - gpiod_request_commit(),
> > which this code eventually calls, interprets a null label (not an
> > empty string) as indicating that the user has not set the label, in
> > which case it will set the desc label to "?". So userspace cannot
> > force the desc label to be empty.
> >
> > We need to keep that label as null in that case to maintain that
> > behaviour.
> >
> > I will add a comment there though.
> >
> > Hmmm, having said that, does this form work for you:
> >
> >         if (ulr.consumer[0] != '\0') {
> >                 /* label is only initialized if consumer is set */
> >                 lr->label = kstrndup(ulr.consumer, sizeof(ulr.consumer) - 1, GFP_KERNEL);
> >         ...
> >
> > It actually compiles slightly larger, I guess due to the extra parameter
> > in the kstrndup() call, but may be slightly more readable??
> 
> I really don't want to delay this series, choose what you think is
> better and we may amend it later.
> 

OK, as this code is common with v1 I'll leave it as is - we can always
change it for all cases in a later patch.

I think that is everything outstanding for v9, so should have a v10 out
shortly.

Cheers,
Kent.
