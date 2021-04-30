Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8FF636F7C7
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 11:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhD3JY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 05:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhD3JY6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 05:24:58 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1187C06174A;
        Fri, 30 Apr 2021 02:24:10 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id i190so8477820pfc.12;
        Fri, 30 Apr 2021 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zNF+LVDj+UlhdG7GbMHEbxg9ih8dGCO4z4gDNka3mI4=;
        b=BHBElJdQ+/tUNCJw2TaznFsRE805+ge1YUuN61/YKIGTEqlSNR51Rz4OpvDlwdt1Xv
         IW9m1GBFtXzLTK8O8whA68xCMExemJf4yM+vXnV32+0POipDBk7Rm9kW9h3OaYF7579H
         C7skwjtZOZfa+Ac/Bcoj5ciUAxZEnXmFZjpDxtwiEQdcfQrqoOh46BsvYN7PlaAmZ/yL
         58H06PnPiphgaxKY6+vdZmQkezFjxcTQCS3zDSDAjpwCrau5OBRbSgDRYlfDMtwgXJjw
         /WBVzBWHmGqzS3DkLbCIRvTjoyH7P47Z/nS+ICyb/WzSewXYPYsSyd2fmFSmzP1NRmuD
         v+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zNF+LVDj+UlhdG7GbMHEbxg9ih8dGCO4z4gDNka3mI4=;
        b=PPsXyEOyOBzyxpRrwADJOwJyESsnGvn4QMpQsS3rld8MhA/UVuxHnVsRBrmJAUcMHt
         BEp2Up8iS61zcJTj/8GZvrRposCnGIryoLV8uQSWyliC64kt6/xo8qDNa76pGLuJwdel
         nN8DcpB+W3G0TbNpgEBX+HTVBsGflS6H2J1Ea5Lo/yX1lDQFypEO8+Kmq9mk4K2Cl+s8
         IRzlqgyPSi//s/gEiT4At66XQ85lOxQWTKKD/aafaHwaxOEB+6TYLERrmaUODRN1z5/E
         8r308E8GnP6egFTpAoO/cwUo0SJ+MOxESFFwrz1lqBQduKFxVT7L6JjoNiepkBbPwuT5
         TIHA==
X-Gm-Message-State: AOAM5303ltqgXs+W+gt12PTCfWrZUTSralFarsjz/67IkXXkL7Cjw9o1
        /limazRmpI1gk7K4N5Tiv1J4R+TNoTrumFa7HtI=
X-Google-Smtp-Source: ABdhPJwYZcqhbausj0G1VFJ0ESRlyNqhn1TXKkEdvGZaMcDxccDTqvLCeAIyjAligpC1+Z00xVRKDc6klbSwI1WkSB0=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr3791927pgg.74.1619774650325;
 Fri, 30 Apr 2021 02:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210429163341.1.I7631534622233689dd81410525e0dd617b9b2012@changeid>
 <CAHp75Vfvknn6O2cc4XYUuo4U_C1nguMHjJPxmRQapf8h0QjGFw@mail.gmail.com>
In-Reply-To: <CAHp75Vfvknn6O2cc4XYUuo4U_C1nguMHjJPxmRQapf8h0QjGFw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Apr 2021 12:23:53 +0300
Message-ID: <CAHp75VdCDddbn95rv-f7rsfdOsSE+X_fU9Beas7ZnsaQ0Rwd5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Implement irq_set_wake
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kramasub@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 30, 2021 at 12:22 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Apr 30, 2021 at 1:34 AM Raul E Rangel <rrangel@chromium.org> wrote:
> >
> > This allows the OS to control which devices produce wake events.
> >
> > $ grep enabled /sys/kernel/irq/*/wakeup
> > /sys/kernel/irq/24/wakeup:enabled
>
> Is it a bug fix of [1]?
>
> If so, add a BugLink: tag here.

And Fixes if it is the case.

>
> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
>
> [1]:

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=212379

-- 
With Best Regards,
Andy Shevchenko
