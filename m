Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E02348BF7
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 09:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCYI5t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 04:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhCYI5h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 04:57:37 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6206C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:57:36 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s17so2135005ljc.5
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IBw+fqPCYGPDI6K3X71IFi8mM+m8z83H8t7eBrf5JCU=;
        b=s+p8JtdX7JNqKg148kB7YqJ2LzP3jEieZthb9Fn07U2hVcxHFIwZhmrymmZ6B2A9tu
         /nk0P6Ce6W+5pUUowM1vDBrKHCcAWTa4EGvPT0/jpjwRNTp17F/RiNN2GJrP9fRVWFVG
         tYGH+7g30olnPq4l+uqKbW5PpvNY5hNIznMvAkW9r2kx5DbU2nEFdRpViMX3K1951+N9
         Ks0WkFhnneCcIthTxwRZ4UwQyxfbd9KHNyL+r3U4iSo9xR2qgRPWlbqr0mfcW8nmUUjK
         WJnyoDtm580Tg08lC4znFUQUhZKycbQj5Dw1Tdd84SFLdchTyMRwToZWyUFKyjIsLIwg
         gTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IBw+fqPCYGPDI6K3X71IFi8mM+m8z83H8t7eBrf5JCU=;
        b=AUSjjRFFAmmiHwAvaeLjmucYf3D9sa35oCNRJaOv3h0hLRwlmW7r1p4iRnpWHJTNW3
         1f2HzgSG7LTjh2q4R6Z8hrWBu0NtVcgS5pEw4X4MAql1eibygGLmB6JNqe/yKPOF8Gto
         Ik3LwM6e05oiWLpHvagIhzThZMh36NttXeLDq//wE3GMEQLucPq+Kv+SMa6gp6KnuOlt
         7Yl4KMjq9OCDEHA8G+1QKK8KM3ZoxQVIy30HAzimlSrfBC82A88Q2OBenPXiVgJuJgSP
         OBaSoulaCc+1YZ4rKZjLD5HMzQDY0Rmg1hQExIi94kYL/t1azfDfLO22JZaBCP88DZ81
         JetA==
X-Gm-Message-State: AOAM532UvRD4DQ/Y+rkjEoBweXJxZMZyaAHPdzCLgnpuZYpha/W1Xb2N
        oZIq47BBO4ntDVWwO79uitfaYAioUwiMpGLUm0AT9w==
X-Google-Smtp-Source: ABdhPJw23rq2PFZKKvLfekhae3LHMVKsw8+B+XOVjXVssFdK0jks9D3htf9bhSkipJwf5bc9teGBopemEujtkApukpE=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr4951839ljc.368.1616662655294;
 Thu, 25 Mar 2021 01:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VehkqzDPQp87JL=hnCi_b4y0d3htpxRKBJ2q73AAAbBXA@mail.gmail.com>
 <SN6PR02MB3917DC23268D35870E85F37DBD699@SN6PR02MB3917.namprd02.prod.outlook.com>
 <CAHp75VcbxvVsQRP_0J0mXb5vPhBor7=cq-4nqMNb-+D_+O1cdA@mail.gmail.com> <SN6PR02MB39177CD8CA9BAACDA2E6453ABD659@SN6PR02MB3917.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB39177CD8CA9BAACDA2E6453ABD659@SN6PR02MB3917.namprd02.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 09:57:23 +0100
Message-ID: <CACRpkdaJRm4x+RaAYhy5gv7Ss897=0U=mCTbXcVAO4wKrRKZEw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Sai Krishna Potthuri <lakshmis@xilinx.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 4:25 PM Sai Krishna Potthuri
<lakshmis@xilinx.com> wrote:
> [Andy]

> > > > > +       PIN_CONFIG_IOSTANDARD = PIN_CONFIG_END + 1, };
> > > >
> > > > I'm lost here. What is IO standard exactly? Why it can't be in
> > > > generic headers?
> > > It represents LVCMOS 3.3 volts/ LVCMOS 1.8 volts.
> > > Since this is specific to Xilinx ZynqMP platform, considered to be
> > > added in the driver file.
> >
> > So, why can't we create a couple of bits to represent this voltages in the
> > generic header and gain usability for others as well?
>
> I see some drivers are maintaining the configuration list in the driver file, if
> the configuration is specific to the driver.
>
> We can move this to generic header if it is used by others as well.
> Ok, will wait for Linus to comment.
> >
> > Linus?

While it is fine to add custom pin config options to pin controllers
for hopelessly idiomatic stuff, this does look like it should be
using PIN_CONFIG_POWER_SOURCE with the voltage rail
as parameter, see
include/linux/pinctrl/pinconf-generic.h

If you're not using that then tell us why.

Yours,
Linus Walleij
