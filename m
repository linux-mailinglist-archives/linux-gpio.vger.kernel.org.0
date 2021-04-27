Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD8C36C016
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 09:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhD0HcJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 03:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhD0HcJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 03:32:09 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6667BC061574;
        Tue, 27 Apr 2021 00:31:25 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id p2so26299830pgh.4;
        Tue, 27 Apr 2021 00:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZRsAQBwaVtOeQuiCURYjxNIiawoMtQZfxAzfdpKtFr4=;
        b=j8BsQyL0c8nXm6YTAS7z6k/pmvanlVVJOPZa2SQNFNizaaebLmJjzFIDqs3Uol6Swe
         W//AuexoyW6812z2jW0UZqI7ySwSG4I2JMK99lljNqMr0rUIbM8YlLZr8QI/oOov2nho
         x64ouzmN36PpovJnffdm3t98S5P4bMiuEjLNCqGHseZl1i0190TMnS/NXmtaJPMKx4uW
         ASUSJAPULl/OfyGf9ornLEMzOHgGXvaYeka2iGR0XfE53ioeqT5W8nyC5/v/kIGh+k5y
         uRkbDp5dsb4AlFNbgTG1oD3Mf+J/ENEf01a8K3sSV8Z/eGfsH1laFLWQAvudQnqzdJ67
         Lr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZRsAQBwaVtOeQuiCURYjxNIiawoMtQZfxAzfdpKtFr4=;
        b=QSbDanxYJT0Wm6A3Asv1kTiYwJ3c4iUDNvJUkL2uFWmatC2oQ9D41WjSjGBNwLQ1vX
         ptXx+PA+aq2InVcpgFQ5LTeZh2oMVUITfzpOUQl0O7NRnssuVPcdCxEIoqHIKOsNM9tt
         P3B+eZdjx7GmLI5eJVlAxFi3Uyr7ho0BzMPz1mtNFZeOMgBypipbCMQSZYO0axBoD56D
         5GogZ8tJWgLbmILq9UTK2TECtZeDn3QYGBJbNdjiMPjHluuDTEcnqEkYYqh986g3apV/
         FFTEztG0nc4+dwvE61hml/oLj61lpphfdTona1sKBbmJ5TxKzA0y3hpr3x98zTS3SG3B
         mIqg==
X-Gm-Message-State: AOAM531k6AVVb8w2AlGn1vg01yWWgfvOQiRrIYu3RF5uixRzGIK30Lxh
        MI00DNz8gwHqPxsxwoYttTdqy53jgorAXJ3aLLm1G2ZQB+ztvQ==
X-Google-Smtp-Source: ABdhPJzz7djoy2WMQJFo+ExhkFaFHwl9vGr9ivmCPuyKnRLkpp4pOSVDsO+Fku6CAgkedkrDz0IWwLziqD0zEvHlVAg=
X-Received: by 2002:a62:5c6:0:b029:24d:e97f:1b1d with SMTP id
 189-20020a6205c60000b029024de97f1b1dmr22066247pff.40.1619508684923; Tue, 27
 Apr 2021 00:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
 <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
 <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com> <d1220d39-4be4-a375-042f-e7bb0264ed35@xilinx.com>
In-Reply-To: <d1220d39-4be4-a375-042f-e7bb0264ed35@xilinx.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Apr 2021 10:31:08 +0300
Message-ID: <CAHp75Vejqe3r6s5eoOfza0DjXEwN-hK73FWkxx6VNpx0y1ms2w@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Sai Krishna Potthuri <lakshmis@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
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

On Tue, Apr 27, 2021 at 10:23 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> Hi Andy,
>
> On 4/26/21 4:04 PM, Andy Shevchenko wrote:
> > On Mon, Apr 26, 2021 at 4:20 PM Sai Krishna Potthuri
> > <lakshmis@xilinx.com> wrote:
> >>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> >>> Sent: Friday, April 23, 2021 9:24 PM
> >>> On Thu, Apr 22, 2021 at 11:31 AM Sai Krishna Potthuri
> >>> <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:
> >
> > ...
> >
> >>>> +config PINCTRL_ZYNQMP
> >>>> +       tristate "Pinctrl driver for Xilinx ZynqMP"
> >>>> +       depends on ZYNQMP_FIRMWARE
> >>>> +       select PINMUX
> >>>> +       select GENERIC_PINCONF
> >>>> +       default ZYNQMP_FIRMWARE
> >>>> +       help
> >>>> +         This selects the pinctrl driver for Xilinx ZynqMP platform.
> >>>> +         This driver will query the pin information from the firmware
> >>>> +         and allow configuring the pins.
> >>>> +         Configuration can include the mux function to select on those
> >>>> +         pin(s)/group(s), and various pin configuration parameters
> >>>> +         such as pull-up, slew rate, etc.
> >>>
> >>> Missed module name.
> >> Is this (module name) a configuration option in Kconfig?
> >
> > It's a text in a free form that sheds light on how the module will be
> > named in case the user will choose "m".
>
> Is this described somewhere in documentation that module name should be
> the part of symbol description? I was looking at pinctrl Kconfig and I
> can't see any description like this there that's why I want to double
> check.

I dunno if it is described, the group of maintainers require that for some time.
I personally found this as a good practice.

> Also if this is a rule checkpatch should be extended to checking this.

There was a discussion at some point to add a check that help
description shouldn't be less than 3 lines. Not sure what the outcome
of it.

-- 
With Best Regards,
Andy Shevchenko
