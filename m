Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B6735B0F5
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 02:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbhDKAkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 20:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbhDKAkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 20:40:35 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAD2C06138B
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 17:40:19 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b4so15552758lfi.6
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 17:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aQ4imPeb8LkKgogfYUYZGMfysUqKjzsT0Kcm98j0lTg=;
        b=FDryXP02IE4Xwr5skCVG0m3xDPu3JbrAblSM1HYHG3EZeSI1pVKB71kpqFhgqNhriw
         OG73KZUxSKamCjYh4L2k5/eJOi9sJeDxVWsFbNmwBLoo7GnSe1/JPBQEY95v1FXK2ufW
         r0DZXFTNn3p2MKn6tQuGL903xCpr8N6+ro2ttf6cXAqdm1rJYf1u+0ssUHmdOUP6HeGz
         fatdZH4xVOz5Yi4Il2R+LOr6tP5nf8BdVoGw5RXZ6yf2NvSSAm4GdrFCyES8rhrNnlVf
         B7oyZVY6q1IU5A8SXJzfSnexXGg/uQ1Hes1uJkC9+qiiMJwMEd4uW9IYeU5bgpzlIyQf
         zw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aQ4imPeb8LkKgogfYUYZGMfysUqKjzsT0Kcm98j0lTg=;
        b=WaoAwjW4dhrVftxa64g0OEYwB/z5UO3im2/5AQOIS6JC7jXd4ARRTqsmOD6tncNctx
         gWFcQAGjwTNXaQi85A+LaM5gSgWttMCdZc4ci1GYPmdVueLQn9YNqz0MZBdGLUWHCXGK
         A2E5vEi4U41ABIhQt7Yjxo1h31mnT/4QSYS2wvweH+J2Pnh9Ep8S07FlyeGIPRUPCZO3
         bRzZmLJwe09DsGBxBSGNXWhRJrjEedlYyPqZyiy+I1Nxgh1189ByBmqQYFYyKr8bORw6
         9kQt6g/BrkU3AJZj5ICwKnKzy0yiyrbu82M68ZlwZbgaD3rr5wHaAOqDiKpX7GuGgTgo
         sR5w==
X-Gm-Message-State: AOAM533KD3NAMkcjWtfOGmwfxm117Xoe7K6kPkUenyF7Ydgn/zhMUL+5
        wAVYFkBjwx1fp50OJe/Wi0VfbUOkhRDOfYMv76sAag==
X-Google-Smtp-Source: ABdhPJyonjbgz3cNePFZ3aMbBhlfzK+wSNCe/ktJyjH0DVxvj1LFxJcGiCKtb8to5oVTh387qHTEDCW7pWtJcj+DKOM=
X-Received: by 2002:a19:4f0e:: with SMTP id d14mr3158191lfb.649.1618101618346;
 Sat, 10 Apr 2021 17:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210304013342.1106361-1-jay.xu@rock-chips.com>
 <CACRpkdYYpgFWH9pVOT=o7unWXRqVeHtvsJgbByNGZ170CZ_FXA@mail.gmail.com>
 <CAMdYzYqk3k0UqCyFwB+W1tKKKTg39Mx0Vdsrj+eeC58nARaumQ@mail.gmail.com> <3262311.AJdgDx1Vlc@diego>
In-Reply-To: <3262311.AJdgDx1Vlc@diego>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 11 Apr 2021 02:40:07 +0200
Message-ID: <CACRpkdZeZuHe9kFywrdQxcNMfAcBCJVAhJjfyD6ahLinT0hvmg@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: rockchip: add support for rk3568
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Peter Geis <pgwipeout@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 10, 2021 at 11:10 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:
> Am Samstag, 10. April 2021, 20:30:52 CEST schrieb Peter Geis:
> > Good Afternoon,
> >
> > I'm currently working on the rk3566 early bringup support in mainline
> > and encountered an issue with this patch set.
> > Unfortunately in the rk3568/rk3566 the gpio registers switched to the
> > (16 bits write enable / 16 bits config) register format that other
> > rockchip registers use.
> > This differs from previous chips where all 32 bits were used for gpio
> > configuration.
> > The patch fails to account for this, which causes all gpios to fail to =
function.
> >
> > For clarity, this only affects GPIO_SWPORT_DR and GPIO_SWPORT_DDR.
> >
> > I'm currently working on a patch to fix this issue, but I know that
> > you are planning on breaking out the gpio functions into a separate
> > driver and wanted to make you aware of this immediately.
>
> just pointing to Jianqun's series providing the gpio controller support:
>
> https://lore.kernel.org/r/20210324064704.950104-1-jay.xu@rock-chips.com
>
> which introduces the necessary writemask-handling but seems to need an
> update, judging by Ezequiel's reply to it.

Does this mean that if we get a speedy and nice looking respin of the
GPIO series we probably got this problem covered?

The merge window is getting close but it would be nice to get this in.

Yours,
Linus Walleij
