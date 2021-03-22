Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE51344D14
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 18:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhCVRR0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 13:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbhCVRQ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 13:16:59 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A7CC061574;
        Mon, 22 Mar 2021 10:16:58 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id r17so9054076pgi.0;
        Mon, 22 Mar 2021 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2w5fCu8w6D3zdeoWzRFOIFWsZdJByg7rSbBNLFCe+3o=;
        b=vVBsxK9o8fw8BFBALl180QyiYSBYJOhFQQeASqP8U4L0gA8lWRRZSYwliT1m82FxP6
         ZTgFVenIyz69wwiqYU4nuiWXBe9BXefJBuv/hsKCLpc/ZjLBkIEHrYZVUOxLLQPaVM15
         XcLOl9QEtYxnCpEobQ2EuBUHAhZrup3hluH1VvfEL2OEPslsjj2kx6MIUUILJFg/Hrnw
         PQRY0KV/fzpyN70xkcv6ixhfzwNY/jMpZUOVRP5B+Bo1af1rGqdD7HPPfsC3l98IajKV
         pquLy6TgtM7w9Hb4a0GfC/y5zPZS3iqbzUH9WmCIOXIwas6xABqULRmJmcOxfDTBbEmq
         5WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2w5fCu8w6D3zdeoWzRFOIFWsZdJByg7rSbBNLFCe+3o=;
        b=SZ1jKXQKq8lHqcabQorFEFInNP4sTe2+hbvz7Ks9TVean8v/cd7o5RICnXAWADoBAb
         J72fEkTta8PkLd/xfyGwYbamebsfcy2RSAZQJUJtc6wngx4Utsaf9LcCg5K2mVUmAB3q
         eL1SfacK+A8L/ylXU9tBIDiIze4r7l38BAWeqzKH77tqtL7w5Q6CRA5BWmyOlC4/WGA3
         Zcp2CZMZOxa+LY7xy5G3xB4yxSFeb35cjINBaEQmseU+UGqXpktomDpguYj15Ktfd8jI
         R35e3wmQgGqovv5Ff2sLBqGuscFckwgeWtgZ0VZGXfxGO21UK4MOIIA5vLrscNUOx0s5
         xROg==
X-Gm-Message-State: AOAM531seORc4xhExksFME97436bTh9ze+VceOEwBmVrrbWR5LE9hdvH
        MIEdjYl6OpkE9fYChAacZ5y9ab9AYJE5Q5PW/gU=
X-Google-Smtp-Source: ABdhPJwC//xqNPPavm3VwVopRp0zBqkabO253SedJKX7XxKp0C+zaEj6I2gboHkOWehPVmfetRGb6a7sDxW1GtiNRio=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr796317pff.73.1616433418096; Mon, 22 Mar
 2021 10:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VehkqzDPQp87JL=hnCi_b4y0d3htpxRKBJ2q73AAAbBXA@mail.gmail.com>
 <SN6PR02MB3917DC23268D35870E85F37DBD699@SN6PR02MB3917.namprd02.prod.outlook.com>
 <CAHp75VcbxvVsQRP_0J0mXb5vPhBor7=cq-4nqMNb-+D_+O1cdA@mail.gmail.com> <SN6PR02MB39177CD8CA9BAACDA2E6453ABD659@SN6PR02MB3917.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB39177CD8CA9BAACDA2E6453ABD659@SN6PR02MB3917.namprd02.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Mar 2021 19:16:41 +0200
Message-ID: <CAHp75VeQyk6E4DJY0ArYX=Too-nkZ12oA2YcVZ0gw0zz5chNAQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Sai Krishna Potthuri <lakshmis@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

On Mon, Mar 22, 2021 at 5:25 PM Sai Krishna Potthuri
<lakshmis@xilinx.com> wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Friday, March 19, 2021 3:53 PM
> > On Thu, Mar 18, 2021 at 4:42 PM Sai Krishna Potthuri <lakshmis@xilinx.com>
> > wrote:
> > > > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > Sent: Wednesday, March 17, 2021 6:26 PM On Wed, Mar 17, 2021 at
> > > > 10:27 AM Sai Krishna Potthuri
> > > > <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:

...

> > > #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
> >
> > Looking into other drivers with similar includes, shouldn't it go first in the file
> > before any other linux/* asm/* etc?
> I see some drivers are including this header before linux/* and some are using
> after linux/*.

The rule of thumb is that: more generic headers are going first.

I consider dt/* ones are more generic than linux/* ones because they
are covering more than just the Linux kernel.

...

> > > > I'm lost here. What is IO standard exactly? Why it can't be in
> > > > generic headers?
> > > It represents LVCMOS 3.3 volts/ LVCMOS 1.8 volts.
> > > Since this is specific to Xilinx ZynqMP platform, considered to be
> > > added in the driver file.
> >
> > So, why can't we create a couple of bits to represent this voltages in the
> > generic header and gain usability for others as well?
> I see some drivers are maintaining the configuration list in the driver file, if
> the configuration is specific to the driver.

Yes, my point is that this case doesn't sound too specific to the
driver. Many pin control buffers (in hardware way of speaking) have
properties to be different voltage tolerant / produce.

> We can move this to generic header if it is used by others as well.
> Ok, will wait for Linus to comment.
> >
> > Linus?

...

> > > > > +       ret = zynqmp_pm_pinctrl_request(pin);
> > > > > +       if (ret) {
> > > > > +               dev_err(pctldev->dev, "request failed for pin
> > > > > + %u\n", pin);
> > > >
> > > > > +               return -EIO;
> > > >
> > > > Why shadowing error code?
> >
> > So, any comments on the initial Q?
> Xilinx low level secure firmware error codes are different from Linux error codes.
> Secure firmware maintains list of error codes (positive values other than zero).
> Hence we return -EIO, if the return value from firmware is non-zero.

Why the zynqmp_pm_pinctrl_request() can't return codes in Linux error
code space?

> > >>  Since it's the only possible error, why is it not
> > > > reflected in the kernel doc?
> > > I will update the kernel doc with the error value for such cases.
> > > >
> > > > > +       }

-- 
With Best Regards,
Andy Shevchenko
