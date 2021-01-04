Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9F92E9790
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbhADOq2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726685AbhADOq1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:46:27 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DDAC061793;
        Mon,  4 Jan 2021 06:45:47 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id j20so26205494otq.5;
        Mon, 04 Jan 2021 06:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OvAhumTD21QUbPNeTp8dtsndkhEIhLEEG5IdkVuRcDw=;
        b=KuLf/7jx14Horyal9YVKcvo7laAoBg7ZLpYV1q/T4mSrNjF6SESdHf1RR+oEv/QQ7S
         wfFVzp2b7aTvX7d1rP3L1JsAGoJ6iZg8Lw0lP1wFtUs/ef4RbRa+WYfjz8D9HYh1nkgW
         bpjC/e0pF4myYNzLIBTFbWmsMjo/LgbceqrjJAoTOKxSiS2JdbtUaCTEm3XeHPy/7CBL
         aJhqmOz/YRoVw9+0rNeNS7xVONqocWur9scKHUZ9eRmTzNQuRuSsIU6SbuMX1ioc8DMG
         kpPM7yPF3oTwmEDf0Xm8BXPE1NYWlkJP6GMm4r0gaPZNLbeQB1SkdLAt3i4e1S9cR+CW
         RyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OvAhumTD21QUbPNeTp8dtsndkhEIhLEEG5IdkVuRcDw=;
        b=eBBWv31nHqEUWIodr77Xf4BRjpa3dw+yUk+l+DIsA4ti/qcpXfwr6t19aIv066NyCj
         BfwEwb0RxkvmXbiCemuSR8iarrBtgOwVRdUf4MmwCiH5JyJVId0C+qYw5bIB5YhBem/M
         SYsuuy4evOv55idz7z1w16qPkI7UwuUxT2iTw7rmjcq09VyNmY2j1vKPJjxHjUE0zPhJ
         nNy56PKj0RBqO8v4FimZ7yZ6k7zYmPeouRbxL4Xa+f6Q7UclkO+axR/ccPERh4/1dHAf
         VGip+EOdNT82epjQHv56XeK2W5amcbqveJylp3y1TNEssKMu3UMeTK11jkjQTz7pe7Wa
         A6Ig==
X-Gm-Message-State: AOAM533u9UwBCZENHbft8snTxI8isjTKrsuitwMpNRHu9tlRxY29b6pR
        zZMJ+mj4hjTMvxmCVtviCpVNoBci3vMwMX6CUFI=
X-Google-Smtp-Source: ABdhPJz+K2k8tvHCkfVc6mhXH0D14IYsmur6gSoZwx2Qt/U1hsSxGNi7edFxjP6Kaki0PObxjphDzEJljToPhVRKNTA=
X-Received: by 2002:a9d:730e:: with SMTP id e14mr52936430otk.74.1609771546969;
 Mon, 04 Jan 2021 06:45:46 -0800 (PST)
MIME-Version: 1.0
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com> <CACRpkdb8z8su9HPkSdnRitVe0unuBDtg0azif19LGb84F=m19A@mail.gmail.com>
In-Reply-To: <CACRpkdb8z8su9HPkSdnRitVe0unuBDtg0azif19LGb84F=m19A@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 4 Jan 2021 15:45:36 +0100
Message-ID: <CAMhs-H9ACwSbJeqRvVOy3w44mhUB9ij1s=idP6xnEDF4LVvQpw@mail.gmail.com>
Subject: Re: [PATCH 0/8] pinctrl: ralink: rt2880: Some minimal clean ups
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jason Yan <yanaijie@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Jan 4, 2021 at 3:39 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Dec 13, 2020 at 5:17 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>
> > After this driver was moved from staging into pinctrl subsytems
> > some reviews for bindigns and driver itself comes from Ron Herring
> > and Dan Carpenter. Get rid of all the comments to properly be in
> > a good shape before merge window.
>
> Applied patches 1-7 to the pinctrl tree, patch 8 needs to be sent
> to Greg.

Thanks Linus. PATCH 8 should apply directly as it is in this series
also in staging. Greg, can you take PATCH 8 from this series or do you
want me to resend it?

>
> Yours,
> Linus Walleij

Best regards,
    Sergio Paracuellos
