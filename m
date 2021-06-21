Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2C13AF1E0
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 19:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbhFUR1u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 13:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbhFUR1r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 13:27:47 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5F2C061756
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 10:25:32 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id w1so7491343oie.13
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 10:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PnPX+kMwwqow5LYukSPE/j5CcoTy7NRtog3utuQq2IE=;
        b=IlM4/QIr6kXMDieXq2favI4BOm+o5ZxnHdZwUYTjCqrBZSaWC4gwwIF+F4B9F5qSdf
         aixUjWQLgS/AXi3OR7McxgHlOKNSFUlc5g8bEKu9UXwxwf9AWPQ4i/9DyNe9ICC96o0z
         KXXcpuxr22bkxc2HK8qkfH9ZOQKs907KKN6SL4471gnxBZfLveRLtNG/2P3sUyGNT0K5
         tiK962EvGmj2OJ/2eAMO7IcauWF3j/t64jubulaqCaE5JZZ94PVrXN+lDT9dpBDyomDp
         IqPIGpw72Sz99ly/1y5ASkIq/xzK1JWnDxNmEiFazMrjkUnxkFj6UFfRxO4Cp/r+TIz8
         Tgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PnPX+kMwwqow5LYukSPE/j5CcoTy7NRtog3utuQq2IE=;
        b=FxZU5VMV0q21x0+H0UnzIJ5fdUsNzydvM39najJIpdESGeVr0A0Z5OZAZMp0XBdw0e
         q3XO5lxU8YWbNv/NrMfxQ3pFLNR89l3Li79CSilup+/MvD1GzpNiPaxPrXarxQyw5GZr
         xSTnBrH90Ey941XE5tVpFY9BqzjtlOPs5X8ut+tSf+7zJKWj58C4A8732EmL/iAWSVZ0
         vsKujsXzl/jJucyEBi5olX/ON12ysOzdqBZp+VlDbWM2U91sL1xjaSp3nqs4CIQUCEnp
         tBwYuhSB+mij08TExzkQq3J8nKskrgcYfXOPlQH7M5k9NPxuv5mzpwcO7ziDCWn/CF+D
         97jA==
X-Gm-Message-State: AOAM5339I3UapFfmP8vTAm8uvcDCb1r3yqINWh0lCAS4Sk5TNEQ2Wam2
        gt4p3Tj/P6N0nd/mOUgrxdahbg==
X-Google-Smtp-Source: ABdhPJyoXPEE4Y+PUiCrrS+ozWk1/WGyHTeIxyXg0SQgO/W4PkuHBbK13rxi4TsTt6HtaEnAmw6ebQ==
X-Received: by 2002:aca:b38a:: with SMTP id c132mr17388459oif.90.1624296331567;
        Mon, 21 Jun 2021 10:25:31 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u10sm4235029otj.75.2021.06.21.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:25:31 -0700 (PDT)
Date:   Mon, 21 Jun 2021 12:25:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex Benn?e <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <YNDLiPYkmLZN076t@yoga>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <YMlwTiN4Y9bK3M4Q@yoga>
 <8d58da79-8e54-048b-db89-8c1caaa0320f@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d58da79-8e54-048b-db89-8c1caaa0320f@metux.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 16 Jun 10:52 CDT 2021, Enrico Weigelt, metux IT consult wrote:

> On 16.06.21 05:30, Bjorn Andersson wrote:
> 
> > Combined with the virtio-i2c effort this could provide an alternative by
> > simply tunneling the busses and GPIOs into Linux and use standard iio
> > drivers, for cases where this suits your product requirements better.
> 
> So, you wanna use virtio as logical interface between the two CPUs ?
> Interesting idea. Usually folks use rpmsg for those things.
> 

rpmsg is a layer on top of virtio, so this would be an extension of the
existing model.

There's been discussions (and I believe some implementations) related to
bridging I2C requests over rpmsg, but I think it's preferable to
standardize around the virtio based bearer directly.

> What is running on the secondary CPU ? Some OS like Linux or some bare
> metal stuff ? What kind of CPU is that anyways ?
> 

These ideas revolves around platforms that implements something like the
"Android Sensor Hub", which provides some resource constraint
co-processor that deals with sensor device interaction and processing of
the data without waking up the power-hungry ARM cores.

Given the focus on power consumption I would guess that these are not
going to run Linux. Core-wise I've seen this implemented using primarily
ARM and Hexagon cores.

Regards,
Bjorn
