Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513D33BB5F9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jul 2021 05:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhGEDye (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Jul 2021 23:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhGEDyd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Jul 2021 23:54:33 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4C5C061764
        for <linux-gpio@vger.kernel.org>; Sun,  4 Jul 2021 20:51:56 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id o18so16436280pgu.10
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jul 2021 20:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YUiMviEM4qWdeD7ggunch8ZPUKg+2qZoar2m+NNRGS8=;
        b=uNOJqNlVsqFRp5V3Dtzs3LyZ4JxAhvTmnE2809JkV8BYzbjdgNXFu/SCqBZDhETWtO
         UxCzhkRR3gQ9LF2lJDo5jlBbXhNOIpCTWJcJC11PU3INIgaXe2QcHww5gjZXuPFWDjNJ
         /GwAKJfmf+1yV11uKI1brbUqXQGZUM0DqsCjdMD/F05M83wDT87QoJe0N/HgWS/Nwnhy
         /y1aMKg7oUZy07MQjOeIRCkOVeKjvYcASAUb7Fygz0e4Dp9TnbkpE/Z/mQKeK7ASxeCc
         AYYz7glhgtksIRljwLiWrvk+WHYi20dA2hwcZqR+hXZwhiB0ZMObCtEleUrCAoSdapiA
         RQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YUiMviEM4qWdeD7ggunch8ZPUKg+2qZoar2m+NNRGS8=;
        b=Ii656UI5SmmR9qIUVgQRd4jxPPSdd1JbicDljGZk+2jEdu587+UXC28w+kowne0WQC
         5IGvGovqtzVvxCX5iAj2CSApRAfwSbJOeYmy5eD9dToxnH0QRxXR2lYDFHBJENTe2dYZ
         V+4X0/B5TdDcaBJuMfyCx6fepV364oXJ9Tr2ycTNFo2tE26Gl98mLKa49ewqC9F/XECl
         1QxVKDAhhf3F2umUINXMCtlwv6hTnrY1tpW1GNbMdX7NI8FhwvcxVL0b/licd3UZ1a/Q
         3F2wxisvBQ/ATKx2s6G0xQHoPBmBpCxIJGEgWx3R+KLMQ6GQGZLh9Y41UBzQd31KxMhi
         f3rA==
X-Gm-Message-State: AOAM532XY2FXk33/BVyFiQEN8Oh+59vlqFIAT0phfKN/HVLZyiT9lqAr
        YoUpbRkJ4v5zYcDEWKTljnGLPg==
X-Google-Smtp-Source: ABdhPJz+JXkVhZeNayxLP5SNBpR8ubLc6ozNA5fTH8fBBTnhakkXSO8gz+YOe0X4leyKkb5WHzk6hA==
X-Received: by 2002:a63:d60b:: with SMTP id q11mr13345118pgg.270.1625457115683;
        Sun, 04 Jul 2021 20:51:55 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id m2sm20299200pja.9.2021.07.04.20.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 20:51:55 -0700 (PDT)
Date:   Mon, 5 Jul 2021 09:21:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, Jason Wang <jasowang@redhat.com>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20210705035153.rceytdfbmvj5tvdt@vireshk-i7>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
 <253f218d-07ac-1963-75e1-9ac2d035437a@metux.net>
 <20210526033206.5v362hdywb55msve@vireshk-i7>
 <20210703040504-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210703040504-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03-07-21, 04:05, Michael S. Tsirkin wrote:
> On Wed, May 26, 2021 at 09:02:06AM +0530, Viresh Kumar wrote:
> > On 25-05-21, 14:59, Enrico Weigelt, metux IT consult wrote:
> > > On 24.05.21 13:27, Viresh Kumar wrote:
> > > 
> > > Hi,
> > > 
> > > 
> > > > We (Linaro's Project Stratos
> > > > https://linaro.atlassian.net/wiki/spaces/STR/overview)
> > > >   are interested in this stuff. I was trying to look at the last status
> > > > of all this. Few
> > > > questions for you:
> > > > 
> > > > - Was the spec ever posted to virtio-dev list ? I thought that's the
> > > > very first step before
> > > > we merge the code.
> > > 
> > > I had posted some spec quite some time ago, but it wasn't in the form
> > > of patches against the .tex documentation files yet. It's been laying
> > > aside for quite a while, since I've been busy w/ other things.
> > 
> > Will you be fine if I take that up and restart the thread ?
> 
> It's been a while - why not right?

Yeah, we went past that and here is the last version I posted.

https://lists.oasis-open.org/archives/virtio-comment/202106/msg00033.html

which I took back later on to let Enrico do it, as he wanted to.

And here is the last version from Enrico:

https://lists.oasis-open.org/archives/virtio-comment/202106/msg00048.html

Lets see how this goes in coming days.

-- 
viresh
