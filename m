Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E8F27FC1F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 11:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731649AbgJAJBL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 05:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgJAJBK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 05:01:10 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7476C0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 02:01:08 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x23so2096177wmi.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LCvd+9oMPV1TUiWupBH/r0LupF+7kFOX6DhC7Gcrx0g=;
        b=YR4MIEhAGcvomD/uxMVbUiIe763pjYh55U/6WKdK4ANeEYvJpvBHgTir3soHKMF71P
         AYTqH6nrgBCmxI/LBlS3IhuTQ0XywPfkfloSXMhcqazuIEAwJgweqhvCUPLMGjwFUpzw
         U5t0MUPEclTgs1+05Kiz/OCkn/tBgcluzBtttN1p3Pe/P6aOGSy3RsJujNT5101KictT
         SqZ13V6DEIWcCRn9UvJdvjNLKE1oOGTVJZPtKipBlEi6zRhnlwEBoynnMRi6DFWzLbEF
         Sy2Wto4i8ft6p3F+AiH9+jZHlEQdqs1e+48zEqL1W+DjJk9mSeTsdSjisq02VhbdBNp5
         boKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LCvd+9oMPV1TUiWupBH/r0LupF+7kFOX6DhC7Gcrx0g=;
        b=F3UGplTGfkLm2S5HNv1R+Us1nTdrZWzdw7RWq6gmdyulV11g83cNSEEjYHCMaWSBQc
         NPV03D1h2p/5CMw/AkfU5vuYmsQkTkV27YQrP4wyRTeoNexrPNmXIa6r5IgCuEun/6q2
         hN4raYDKQwxciPXRbJ056MsiAA848Kfazy60OJXspHnsE7q/mKgK3zLogNT9vlXM5hUL
         szq+1+ipI8LvSDP0ZVZpphJHGz4l2cw0HzPS/Y7ZzuhxAAgm51kHqEQkMsfLPs49Kcpj
         hiTv2/8idQbkSlF+NTsrl3VSxRlf+Qnptkcrq5y1VDOprmIWJHJ39WenEKE2lwzlT6o3
         1z9Q==
X-Gm-Message-State: AOAM533w/TCHznD/wH4HeHjyUouvBZKPN20chX7Zwkqi/SHg/Q4Sb5JP
        fKgUmpUMTku8Up62g7DvRqDLsA==
X-Google-Smtp-Source: ABdhPJwTZ1RYKtWIyoBk+8fpiZQFsYIgVtzcvQYqDG+wI52Vzemq2cBusw6V5zUhwT6eqp7ki3sNsA==
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr7125986wmj.19.1601542867376;
        Thu, 01 Oct 2020 02:01:07 -0700 (PDT)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id i16sm7968008wrq.73.2020.10.01.02.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 02:01:06 -0700 (PDT)
Date:   Thu, 1 Oct 2020 10:01:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 1/5] gpio: tps65910: use regmap accessors
Message-ID: <20201001090104.GM6148@dell>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
 <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
 <CACRpkdaMHH35C1LqUROFBte3T00Lz0zApHy3hdZ83Z8EZR04hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaMHH35C1LqUROFBte3T00Lz0zApHy3hdZ83Z8EZR04hw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 30 Sep 2020, Linus Walleij wrote:

> On Sun, Sep 27, 2020 at 1:59 AM Michał Mirosław <mirq-linux@rere.qmqm.pl> wrote:
> 
> > Use regmap accessors directly for register manipulation - removing one
> > layer of abstraction.
> >
> > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I suppose it is easiest that Lee apply all patches to the MFD tree?

Yes, that's fine.

It won't be for this release though, as we're already at -rc7.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
