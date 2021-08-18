Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F19E3EFCDB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 08:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238602AbhHRGer (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 02:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238791AbhHRGep (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Aug 2021 02:34:45 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72550C061764
        for <linux-gpio@vger.kernel.org>; Tue, 17 Aug 2021 23:34:11 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id f10so893476wml.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Aug 2021 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qOf5Jw9NRa4SnulC1GyAvxwxYZYUNjqANJtiqJ12E6k=;
        b=znseoqEQvCvDTiITGYGWtCHD5uYGQQVRv+bSBqQqXJOJ1F+g1QUmAE4jNIZITVJG6N
         S57i9sxX//DJuIv/HBLrtpp+SgS02xQhymyol7i+CNQBFzjL79ylGT9LxbKUnP8NdPTH
         +A90CDwX4v6onk2k4gAHMRTOoqrQXjlXqjLk4Wg5zIBacgPNotibcTD3f8F/iBY2B155
         LJjexGZq9d4vzeTVuHPPan7U29D0ILqDD/BKehxq9E3gDgOmZdTzeQRev7MqjeYvd9WR
         6ix1rNEtdYVlWQl7NuR8Xa8u9DQtJGasxfmcJjpxsXqMr99cBEef8PTivGs+CBQ4UHAe
         dKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qOf5Jw9NRa4SnulC1GyAvxwxYZYUNjqANJtiqJ12E6k=;
        b=Fa06atzysdsnoUwcFskeWItSedL24wSowyhnKZj4gG2SemP7DQ8co9n1Th0hIvk42I
         CebCo7W5JpOniJ+KFRLc30nAZlvv9+La8JYaSPiiLAu95wb+jh8VhJYTsQhCZAzW0ofK
         0RaRGAEzjh1OgkWH9MR2h/CEMMeiu7XRKkIClPQZXxdfCN6vk8AZ8pQ27m9TUqy+tWFv
         7SoyhFpESHNf721Mv3FOHup1RCW/3vf68j6x3IYEEcH3fnoGnZQXaWostnYHVVBfn7H4
         MItTYu40TvJjthWovvyYjlCH5NwpjYxu01W9TZ6fc8Q+uUUysAe8SIEtCO2CFdmMQ60J
         fYHw==
X-Gm-Message-State: AOAM533yV/++Q54VRjFDlheFh1jCqTi3V5k/yjQM+ebX8+Ts7HMoTfTZ
        AVDMOn+K+qusIyP5a0ZXCvbjZw==
X-Google-Smtp-Source: ABdhPJyqwVqtJb4NtNNkAw8GfCWH/ZiuHGihKlf6jY83moLG3xgjEG5JYotG3JsX4/XRz6Mcqr3pAg==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr7074623wmb.79.1629268450034;
        Tue, 17 Aug 2021 23:34:10 -0700 (PDT)
Received: from google.com ([2.31.167.59])
        by smtp.gmail.com with ESMTPSA id a11sm4837580wrw.67.2021.08.17.23.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:34:09 -0700 (PDT)
Date:   Wed, 18 Aug 2021 07:34:07 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
Message-ID: <YRyp3x14ziGYlOAx@google.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
 <YRpihHP3kDz5nYV9@google.com>
 <CAHp75VdcWsNFervoU7e4_m7qVKAnWXzF2z2mUgKg06-qmwn-2A@mail.gmail.com>
 <YRppKOxp4Jya5iEI@google.com>
 <YRpva4gS1LfncPUj@smile.fi.intel.com>
 <YRpz5UEDQbpewq5o@google.com>
 <CAHp75VczCKwNQE8k6_e9Trk0qkD2EumFVxxG5w2BTYhiOTDUzA@mail.gmail.com>
 <YRtkt8e25ZSeOICx@google.com>
 <CAHp75Ve-24wno-z8rQSCtgBdf6_a70TFf3aCJPP7JSFPG8sfhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ve-24wno-z8rQSCtgBdf6_a70TFf3aCJPP7JSFPG8sfhg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 17 Aug 2021, Andy Shevchenko wrote:

> On Tue, Aug 17, 2021 at 10:26 AM Lee Jones <lee.jones@linaro.org> wrote:
> > On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> > > On Mon, Aug 16, 2021 at 5:19 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > > On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> 
> ...
> 
> > > > > > > Would it be okay for you to pull the immutable tag?
> > > > > >
> > > > > > What immutable tag?
> > > > >
> > > > > It's here:
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/tag/?h=intel-gpio-v5.15-1
> > > >
> > > > My Ack can't be merged like that.
> > >
> > > Which one? There are two on different patches.
> >
> > The one that I specifically said was "for my own reference".
> >
> > > Do you have any documentation on the rules you imply by MFD?
> >
> > No, the documentation is provided with the tag.
> 
> I see.
> 
> So, what is the recommended solution?

I planned to take the patch.

I'm also happy to take the set, if they are interdependent.

What is the reason the MFD patch doesn't apply to my tree?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
