Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE563F924A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Aug 2021 04:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244040AbhH0CWe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Aug 2021 22:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243961AbhH0CWd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Aug 2021 22:22:33 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F88C061757
        for <linux-gpio@vger.kernel.org>; Thu, 26 Aug 2021 19:21:45 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so3765706pjq.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Aug 2021 19:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bjD0Uz/cN/4nx+XcJh8zqTxxVtwBVye7zvXQTKmnUz4=;
        b=Ua0WJGCH5UnZviQiqy2LAxKhr8aIlpFq0nHIEvoJTRkACA2+oU/GrM32O9ia1uHRaP
         C7DFBw3GQ21rs8gsMLzdlDEVXsm8gN/DDbBhlp348u8eKHu8v16AoGfrGu1lCbnClWh0
         u9CGrzNvdJbHkSEL78UbeR9fdZV+yjb2Cp2kBMqygAXdaBWWy+4RJ7lIaPvuNcg9KVKy
         ARcvUVuyZkc1j6pu0qS+wXGvlXY0LrVIBey3QvMFgliwOSEEZKMfVMLFBDMME2RM5W0E
         meb8hC01NkwPo7jNQsVPeWo3uqsrIlDYMYSaZNhWMT2Mp59m24qYbp+YwyIQ+UAJLAAl
         ibOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bjD0Uz/cN/4nx+XcJh8zqTxxVtwBVye7zvXQTKmnUz4=;
        b=dqWGqN+Te7kHWHODuYBmH/Kk9PVknu24msGVPMueBLMHq9GACi/GTwNOEVxKkSTvA5
         kaVP7aumSXbHc57a2vFcRIh/VD5H4X4kHuADXnbzql2kwjh5QEU8QTriEh7H+KI496Qk
         Yk8jlv9ys9XipYCMdDbkLY362ujtwWxuEBNsV3BPfRcW2MFyMFJXpGCApejLVoqbeRJc
         szz50vIRrz9IBLOLFCXCgg2Aznqd1PNsDLhou1l6bky9p9Usi/euwFeEf3w0YtD7kgJW
         98ReYTC0wJzQc1qDAJGYV2LTr8CWqecSxOQ0qXySRyguTpYTNvSM6L7zdOIB/08k6E90
         fkiw==
X-Gm-Message-State: AOAM533IUTanaZmk5GysAXCBWgjtrKoF6Fo0D+BrWvGK80pRFNjP9rni
        RPgCpPRlxCZOhtukkTqzuSE=
X-Google-Smtp-Source: ABdhPJy4X8DinC6r8o5CtTdiDWuMF+i9702ZAowZSoAw7mwNZyt4Y9dGfTzCnElhruC6QbiyRwApqg==
X-Received: by 2002:a17:90a:4306:: with SMTP id q6mr19922959pjg.202.1630030905222;
        Thu, 26 Aug 2021 19:21:45 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id u24sm4567416pfm.27.2021.08.26.19.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 19:21:44 -0700 (PDT)
Date:   Fri, 27 Aug 2021 10:21:40 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Riz <mdrizwan827@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: Regarding export of GPIOs
Message-ID: <20210827022140.GA8509@sol>
References: <CA+FSg4rJcDPhPoBbEYjsq_UOysLUdp6YnBh+3XeHL7UkH2cfdA@mail.gmail.com>
 <CAHp75Vct=K1Nh+UDS9tZgvgF1ju_c8417wzfHg9YCA2ay0jtCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vct=K1Nh+UDS9tZgvgF1ju_c8417wzfHg9YCA2ay0jtCA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 20, 2021 at 05:04:03PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 20, 2021 at 6:27 AM Riz <mdrizwan827@gmail.com> wrote:
> >
> > Hello,
> > I have some basic questions around the exporting of a GPIO.
> >
> > 1. Regarding gpio-hog mechanism:
> > The gpio-hog mechanism would help us to initialise a GPIO to either
> > high/low & in/out during bootup.
> > This is fine.
> >
> > So my question is, if we hog a GPIO, does it also gets exported to the
> > userspace by default?
> >
> >
> > 2. With the older sysfs interface, we would be using "echo x >
> > /sys/class/gpio/export" to export the gpiox to userspace.
> >
> > I wanted to know what would be the right way to do this with the newer
> > interface?
> >
> > 3. To check if a GPIO is being exported or not, we would see the
> > /sys/class/gpio with the sysfs interface.
> >
> > With the newer character device interface, what would be the right way
> > to check what GPIOs are exported to userspace?
> >
> > Looking forward to hearing from you
> 
> https://stackoverflow.com/questions/68856801/regarding-gpio-export ?
> 
> I think I pretty much answered there.
> 

Continuing that thread and in response to your  comment:

> I agree with you. Even I looked into the kernel code, it sets the right
> direction of the hogged GPIO. I suspect this could be some issue with
> gpioinfo tool. I hog a GPIO as below
>
> pX { gpio-hog; gpios = < X 0 >; output-high; };
>
> The gpinfo reveals following info about the GPIO:
>
> line 13: "p.X" "some_name" input active-high [used]
>
> It shows it as [used] but the direction still says input
> 

I doubt that gpioinfo is the problem - it merely reports the flags
returned by the kernel and is known to correctly decode the flags for
lines requested using the GPIO API.
You could confirm that by comparing the output of lsgpio or the
libgpiod equivalent tools in my Go library[1].
You could also use strace to decode the GPIO ioctls with:

strace --trace=ioctl gpioinfo

That requires strace 5.11 or later.

If any of those demonstrate that the output flag is not being set then
the problem would appear to lie on the kernel side.

Cheers,
Kent.

[1] https://github.com/warthog618/gpiod

