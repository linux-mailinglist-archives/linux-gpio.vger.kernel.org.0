Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6CD353F7B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Apr 2021 12:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239238AbhDEJMW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Apr 2021 05:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239142AbhDEJMS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Apr 2021 05:12:18 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA33C061756
        for <linux-gpio@vger.kernel.org>; Mon,  5 Apr 2021 02:12:12 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id h20so5375202plr.4
        for <linux-gpio@vger.kernel.org>; Mon, 05 Apr 2021 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WekxonU1qmG0eUnonSNf/U4E4Ci7T88bh4I2StdmsR4=;
        b=uRoAcLJ3N6K5R51bs7FNTCbS8LtjaP9WdpFiY3bzVkkpXhi2Eu0ntV+fJH6EKGEg5y
         mr/Y1IzliTLhzb8EWy3BHhpV+T+J6P+DHKZTYMc3uIrEUk1OlTZwruwMvMju7upaZpjL
         7gL1fIwtpReLJaVC3F2rtoEE1lLku6HKd5CrPA08+xEq1NabJphZC1xdp8VFLO64DWpf
         cKEYtyJ2rW0f2PAr3pP12rhWcWGO7ucybUzVilx+J7ZZvTLNifzn2YPkm88Ud8eFwusg
         4t0trjpQEKyMwv244Lb7dy+XL2rJ915OhYIMZaJ0OEAH7C+Qhgy+VRT9vBgoh4Ohm4gC
         Ipyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WekxonU1qmG0eUnonSNf/U4E4Ci7T88bh4I2StdmsR4=;
        b=MKOQK4QYqf8cGLCpe2zYGnhmHZqGOG0SIn6vY+pbdNmODLl50CghivwrEOsz76XJAl
         BmhAR5a6MKNEwgTlY81FM+WU438+TvvW4anlpqi06TiBl8tx1TkT1V2DsAwgz2ZHNixb
         qFYPtT9LqhMOGY9SsaECad1nQXEWvmrVcokAIQhdAswmt9T1ZTLI7hiNP8WCi8WhGyw/
         bpZTN076t+AHW6mza1RYK6NX9K7QPEjVGgtIVBfZRa0JJV8Fa5J45GcZSL8kB8UZJaPt
         WAjumWmDZDcpVCTEvE2haa/SG92Zfjzh9osWr79iaqdGagDFHaj2xPVMQI3zHD+/k5sL
         PTEw==
X-Gm-Message-State: AOAM530D7AQt7W84aFPhFoksQGbfmxGJcCKP8J0s5UC0ZjumAjn3BcKu
        6WXhpv12xk333B0PGFtrgztA1nuar7rUoV+TEHirye8fDdE=
X-Google-Smtp-Source: ABdhPJwlfHAWVhjurLRrxrYg0chG5MUwf/rW6JdoHBoEj6BFEp/T/bHShvbiXZURy2tO1C5Wcvz/RhYs9K+jaHYfJts=
X-Received: by 2002:a17:902:e803:b029:e9:1f79:2427 with SMTP id
 u3-20020a170902e803b02900e91f792427mr1910412plg.21.1617613932502; Mon, 05 Apr
 2021 02:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210223195326.1355245-1-sandberg@mailfence.com>
 <20210223195326.1355245-2-sandberg@mailfence.com> <CAPgEAj5CZ1KxLEn3=GjKJTBFM8dTpC=NRGwLkN6wuw7VVv6YDw@mail.gmail.com>
 <1306564766.662706.1617546604089@ichabod.co-bxl> <CAPgEAj4Zd9FWL1UFkBLbiJRadBhGqc+NWdrKCxaTXyVeO3tSxA@mail.gmail.com>
 <CAHp75VcG7Uj-cDhbxDL23w0zNDG7eVqedw_eN5J6XPmVTECbvQ@mail.gmail.com> <10440931.720197.1617611104977@ichabod.co-bxl>
In-Reply-To: <10440931.720197.1617611104977@ichabod.co-bxl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Apr 2021 12:11:56 +0300
Message-ID: <CAHp75VcTjY5fNsz0J7TSqRC_Eb=5zseH4YdHXgWGB2qX=sWo1g@mail.gmail.com>
Subject: Re: [PATCH] gpio: driver for the NXP 74HC153 chip
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 5, 2021 at 11:25 AM Mauri Sandberg <sandberg@mailfence.com> wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > On Sun, Apr 4, 2021 at 6:36 PM Drew Fustini <drew@beagleboard.org> wrote:

> I really do hope so. The reason for going for [1] is that it should provide a generic mechanism and
> be manufacturer independent. :)

For some reason I don't see the latest in my mailbox, nevertheless I
have downloaded copy from lore and I'll try to review it sooner than
later.

> > > [1] https://lore.kernel.org/linux-gpio/20210325122832.119147-1-sandberg@mailfence.com/



-- 
With Best Regards,
Andy Shevchenko
