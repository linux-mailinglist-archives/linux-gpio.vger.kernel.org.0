Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7DC544042E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 22:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbhJ2UhQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 16:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhJ2UhP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 16:37:15 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C4DC061714
        for <linux-gpio@vger.kernel.org>; Fri, 29 Oct 2021 13:34:45 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id j21so19626199edt.11
        for <linux-gpio@vger.kernel.org>; Fri, 29 Oct 2021 13:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1swJmkPi9uwotkKckAgo9jhrAoNyom1Qj18BNEzB3+I=;
        b=r4bnOEvrYyG1JRtPLSuWESUesY5Pmj/fQOeo0PO35cPtkOYFjoUVxEf7tOWevELv9A
         r4swx3Qvoll9tyk/tTM2J+0FIqzYay7T4YMBtkgj2gqrQQH+sFskKIlnunJ40uAcv96F
         O50t+Au1m8r/iRAwturDRybdQ/Pw3eGlRUJtzw9WmjMFEb+erwyoYfG+hy+KBw8C8CVN
         6CUmI3ISlVxXhRncvdDR459IMKpBNnmKmi5rfvzgep1mVtt0yuzb8h+OVTLe4TYIn2iE
         Sl+NbwxC4YEuze/WxGcZtWZvhYdjwpaT//GwgbOVGX0RLlAGowF6FTNGfAZgl9F+amX3
         mGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1swJmkPi9uwotkKckAgo9jhrAoNyom1Qj18BNEzB3+I=;
        b=780u5vYeXf9MsLMyxFAKZj/z/O8WFf0h7ePXVnHHaDKZAYhrjo9/MmjywZzEMiMVAq
         Inzu9jI0AUaZ4mSM2G4v5vp6Okn0EipDlQVgg1euc9jSgjvkL6NmsqXg+4mAHRED3E9y
         VYSmvIjMEG+YdIM4dVSZIJ5cWwiPlIOxIed6D2k8/sfuBcAabndXS/H6BTBoR/Kqfo13
         I80CBhWLRHg7vsd5eIKRQaQD3SgUBwDoQSlJNvYD4i5hcF7RhQd2aPXTOPe4W46v7LkQ
         yFzfXauofRRMTFdO+JzDlk6cNbMRNndtiQfRdr8rFLFShfpiy2+Zp436p8aXmMJ95J/B
         /JFQ==
X-Gm-Message-State: AOAM531IpoSUHvWksCYPxrW9A3VAFyAd34phzw6mgIvxPoCtTwro3X8E
        uVUlFtQX6sMv2Q3Q5ewTHf163Z9genC9j7hBV35J7g==
X-Google-Smtp-Source: ABdhPJx79iUWJCmvTNVwg54crO4qNoLGr19P3Hkupw22vybmIx9h2eZw/RbiShR0V5EAwTMX3p4vD7cDXkOKWcdd14s=
X-Received: by 2002:a50:d50c:: with SMTP id u12mr17987207edi.118.1635539684417;
 Fri, 29 Oct 2021 13:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211015164809.22009-1-asmaa@nvidia.com> <CAMRc=McSPG61nnq9sibBunwso1dsO6Juo2M8MtQuEEGZbWqDNw@mail.gmail.com>
 <CH2PR12MB3895A1C9868F8F0C9CA3FC45D7879@CH2PR12MB3895.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3895A1C9868F8F0C9CA3FC45D7879@CH2PR12MB3895.namprd12.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 29 Oct 2021 22:34:33 +0200
Message-ID: <CAMRc=MebEY8wAeNpcXwgi_OaTwwYaqxqWZ6XZRoCRPZvS-724A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] gpio: mlxbf2: Introduce proper interrupt handling
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "David S . Miller" <davem@davemloft.net>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        David Thompson <davthompson@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 29, 2021 at 6:46 PM Asmaa Mnebhi <asmaa@nvidia.com> wrote:
>
> Hi Bart,
>
> I was just wondering what is the status for this series of patches?
>
> Thank you.
> Asmaa
>
> -----Original Message-----
> From: Bartosz Golaszewski <brgl@bgdev.pl>
> Sent: Thursday, October 21, 2021 2:01 PM
> To: Asmaa Mnebhi <asmaa@nvidia.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; open list:GPIO SUBSYSTEM=
 <linux-gpio@vger.kernel.org>; netdev <netdev@vger.kernel.org>; Linux Kerne=
l Mailing List <linux-kernel@vger.kernel.org>; ACPI Devel Maling List <linu=
x-acpi@vger.kernel.org>; Andrew Lunn <andrew@lunn.ch>; Jakub Kicinski <kuba=
@kernel.org>; Linus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski=
 <bgolaszewski@baylibre.com>; David S . Miller <davem@davemloft.net>; Rafae=
l J . Wysocki <rjw@rjwysocki.net>; David Thompson <davthompson@nvidia.com>
> Subject: Re: [PATCH v5 0/2] gpio: mlxbf2: Introduce proper interrupt hand=
ling
> Importance: High
>
> On Fri, Oct 15, 2021 at 6:48 PM Asmaa Mnebhi <asmaa@nvidia.com> wrote:
> >
> > This is a follow up on a discussion regarding proper handling of GPIO
> > interrupts within the gpio-mlxbf2.c driver.
> >
> > Link to discussion:
> > https://lore.kernel.org/netdev/20210816115953.72533-7-andriy.shevchenk
> > o@linux.intel.com/T/
> >
> > Patch 1 adds support to a GPIO IRQ handler in gpio-mlxbf2.c.
> > Patch 2 is a follow up removal of custom GPIO IRQ handling from the
> > mlxbf_gige driver and replacing it with a simple IRQ request. The ACPI
> > table for the mlxbf_gige driver is responsible for instantiating the
> > PHY GPIO interrupt via GpioInt.
> >
> > Andy Shevchenko, could you please review this patch series.
> > David Miller, could you please ack the changes in the mlxbf_gige
> > driver.
> >
> > v5 vs. v4 patch:
> > - Remove a fix which check if bgpio_init has failed.
> >   This fix should in a separate patch targeting the stable
> >   branch.
> >
>
> Hi Asmaa! Did you send this fix? I can't find it in my inbox or on patchw=
ork.
>
> Bart

Now both applied (with David's Acks). Sorry for the delay.

Bart
