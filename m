Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A493DC3DC
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jul 2021 08:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233122AbhGaGQc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 31 Jul 2021 02:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhGaGQb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Jul 2021 02:16:31 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4A3C06175F;
        Fri, 30 Jul 2021 23:16:25 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u16so5096379ple.2;
        Fri, 30 Jul 2021 23:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w4o8GTKb8Zatf93vHXEadq9v5OlamLv4NAJhut7CkBc=;
        b=YCwMC2hLVOwrqQ+QPSrGoEMS16Wshm7+D1dBSpG5DQOXMhhYqO7+XH9dcczRFEZ28E
         Pv2TnZxu6G3B+88FqBJFkT0xVWJbmVQrpI6BXlUlsPukZqBKbSkBEjGOilXyZf+G0wSl
         fWy11sMrGOVgNMJVw9/Jpz2ox0YyNiYx+Dmnmo2I+LeU3KfwW6UY7DHBI41Ev5EcGPlf
         teMqk+yLfg+b56gAVnZAJnyDwlgRadzazYzNAHWbGvjOgk7rbtwgDIY6Qmuiz17Ooko6
         dJt/ModJ2N92A12fKQPj56DKGk4rkxWeJNIsqQzjZHxetfdGAFxSdRl233t/QT/6COq2
         wBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w4o8GTKb8Zatf93vHXEadq9v5OlamLv4NAJhut7CkBc=;
        b=a5kvumUPJfNDhchx0PANGiIaDx2VEzFeoJrGF3aLO2o0QMFmrAQ0lbr3ykNzxpoFje
         GD5neLcfpSqXhtAy7WilmjxY8E9XG83nW9AuVV1ld7ACr4qXEJLbOmu2yFXi8/RKJrfU
         dUNViD27rD1le8vBeA28Alkrm2kd+PIZ6sqE8eQXk9A/BjCgIHoo4XXEFgqDKRXY54lX
         9lvG6gobAsmOGeJMLYYqdUdpe08MDc9VmCSE9cYgDKu8YSzePA8PQf+tfXqLVF8Mvu6q
         KCvOtwiVD8wUQxjc7XD5qn/l1xNXWpFMS3+l3lu7sYbwEI2mZiMTp90xHXXY3u0WA+km
         VMkw==
X-Gm-Message-State: AOAM5333ZPORFbhTZtu3bezNq6AQYE+C3GlDmiZFG34UHmdFpctyVLwz
        hgM639/uSK12PUJjGiXCf+o=
X-Google-Smtp-Source: ABdhPJxGylcHolsQDxOLOZUyr0m3+qX2MoUW24vW7wkJKGxw2TKUvHhIvNlPUgdhbC4iaMpaIu0ZKQ==
X-Received: by 2002:a17:903:1cf:b029:12b:cbdb:e402 with SMTP id e15-20020a17090301cfb029012bcbdbe402mr4068033plh.27.1627712185276;
        Fri, 30 Jul 2021 23:16:25 -0700 (PDT)
Received: from sol (106-69-176-40.dyn.iinet.net.au. [106.69.176.40])
        by smtp.gmail.com with ESMTPSA id n32sm4453203pfv.59.2021.07.30.23.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 23:16:24 -0700 (PDT)
Date:   Sat, 31 Jul 2021 14:16:17 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC 09/11] tools: gpio: Add new hardware clock type
Message-ID: <20210731061617.GA12414@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-10-dipenp@nvidia.com>
 <CACRpkdaqKJLUdf3NiFHaTgu6buyhMb_D1yKyHF4M=eTQ94pe-g@mail.gmail.com>
 <b87fa5d8-bef9-9046-9747-d4428ddf58ea@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b87fa5d8-bef9-9046-9747-d4428ddf58ea@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 08:17:22PM -0700, Dipen Patel wrote:
> 
> On 6/27/21 4:36 AM, Linus Walleij wrote:
> > On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:
> >
> >> gpiolib-cdev is extended to support hardware clock type, this
> >> patch reflects that fact.
> >>
> >> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> > (...)
> >>                 case 'w':
> >>                         config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
> >>                         break;
> >> +               case 't':
> >> +                       config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
> >> +                       break;
> > After the checking of the command line options we need a small sanity
> > check so we don't try to enable both realtime and hardware clock
> > at the same time, we will only be able to request one of them.
> 
> This will any way fail at gpiolib-cdev layer. Do we want to add it here
> 
> as well?
> 

I can't speak for Linus, but I'm fine with it as is as it allows the tool
to be used to exercise the sanity check in the kernel.

Cheers,
Kent.

