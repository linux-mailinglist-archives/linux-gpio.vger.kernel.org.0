Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA5B34A5CC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 11:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhCZKtp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 06:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbhCZKta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 06:49:30 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1016C0613AA
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 03:49:29 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 11so4603966pfn.9
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2W6XAGzdYCyPpqDlBCrGw+Dw5ifX286fy2SWWBZkYZY=;
        b=j8jycbVWrbzKDcTmmxFd/FBPnMSWxjgB09S+74blI728VZlhMPdGDZ2IoJ4CBunRV6
         z0tIcRzhPS691Hp3nfz94UadkIdxleC1Qmflutd8ozVRYpu984jIFUTTQQVqBya7Wi6y
         QH2FBc8cpVYa29VRuUHiYb+4GInNC+h4Em7Z1Mq72jzshTIEqjDiMXHwsD0Ad8wriEVs
         SGqPHzxSxuR4Dj3VD1sq+2gFXYNa4lCtRf4QQlYUn3Pvid1i10xBhhexa3H4P+Hg3naS
         E5sLnpvcOMc3AmRbTioOu4/FsEIH0fY64SuAMsEjgQO9Gn+VsydwIAA3MNAAiHwgzlO2
         B2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2W6XAGzdYCyPpqDlBCrGw+Dw5ifX286fy2SWWBZkYZY=;
        b=XIIRtbwU1aIa/psIxBumm5haXbwdl0ylQbEw4H5mRrAdD5wB6AjnRrrlPVUkuzOpnI
         SRaw4uiGPvj6yTa8HHnsaLFG1/IpDEPgtc32fPc08WJhY/UblpmN38TpooLHmJqwIDEK
         LsCs6cIDqdolLLe7xCbAsvCDLd55cNLcjYZeqdBROORirT3agNhgeTF1+LP/vjAD87fo
         Nse0ksgIOi6LOnxeVML9RFSAmKFBWomox6M3HLtU1e8GR+Zg0prlL2nIlAHz8XF7kJBs
         Ln0kP1hsGuy+RvM4BDTU3qqGGjunpHFVkRT+185O4HPk5rwpkyQsDfSWXUxf64jjW73W
         rsZQ==
X-Gm-Message-State: AOAM532RefherGNIvBM60i55IIVp+gGqJ0OlfodOLGJyNQWmTInBqAIf
        topyYoSqtWvCdevWcdY2R2lc6dX7m69DQaPxodI=
X-Google-Smtp-Source: ABdhPJyHBPDKrSWzRuaeC1Q1ye7g5dgpcPGFM4kfiQ5Rm7bP5QGLCHVWtGSNNSsJfefyANuf9e9BvKyFE2+LsIYTgDg=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr12476573pff.73.1616755769097; Fri, 26
 Mar 2021 03:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210325122832.119147-3-sandberg@mailfence.com> <20210326065944.GA834818@x1> <235418388.107167.1616754747569@ichabod.co-bxl>
In-Reply-To: <235418388.107167.1616754747569@ichabod.co-bxl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Mar 2021 12:49:13 +0200
Message-ID: <CAHp75Vf0mvxL5Uad58B3u1V3Tb3i_OmVOdFsvNJJoTp+Z0Lwsw@mail.gmail.com>
Subject: Re: [RFC gpio/for-next 2/2] gpio: gpio-mux-input: add generic gpio
 input multiplexer
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 26, 2021 at 12:32 PM Mauri Sandberg <sandberg@mailfence.com> wrote:
> > From: Drew Fustini <drew@beagleboard.org>
> > Sent: Fri Mar 26 07:59:44 CET 2021

...

> > This does not apply to mainline. I've added it manually to my
> > drivers/gpio/Makefile but something to fix in v2.
>
> I was developing against gpio tree's [1] 'for-next' branch but should I go against mainline?

It's a Bart's tree nowadays [3], gpio/for-next branch.

> > > +   ret = gpiod_get_value(mux->mux_pin);
> >
> > I'm not too familiar with how mux_control works but does there need to
> > be locking here?
> >
> > Or is not possible for mux_pin to change to another offset before if
> > gpiod_get_value() if gpio_mux_input_get_value() runs concurrently?
>
> According to mux documentation [2] successfully selecting a state locks the mux
> until it is deselected. So I reckon no extra locking is needed.

...

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mux/core.c#n322

[3]: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/

-- 
With Best Regards,
Andy Shevchenko
