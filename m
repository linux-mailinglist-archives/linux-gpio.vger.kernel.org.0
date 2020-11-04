Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08322A66BE
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 15:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbgKDOvd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 09:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729862AbgKDOvc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 09:51:32 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486C5C0613D3;
        Wed,  4 Nov 2020 06:51:32 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id z24so16814630pgk.3;
        Wed, 04 Nov 2020 06:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xsldh6viObbdlvXna6kQqZrBsn3XFnOdoohNZM4M/Jc=;
        b=esDBk66hm5x1xVm+ucG4YzMOIMBniN65QTT+q4T1JHfTZqixdHJ3B+o9XZtTRdjwTa
         g794kwsIAwpChOcx/QBrUKbYRTktQIGvlbYGbFun1FWieTNPJ9M07QJiGFw506huRiaA
         GN/tch+PIU1EnTm4BrzvbjwN3sO7ln0N4YeB43BYWzhEUvsaAVd6rawD+E1eaS52ZwVb
         rAIuT/MVM7zs8ZQCgIdt1du1S245ZjSmtLWAQAlEsFMaNgpEvLwUqFzL1DgvMROhd/Yq
         /DjQ3TTsu6Nvs/mIlgLXkbbDjDRZZHXs1dPXO+QFnvDEtvlaDphMzJNVMwcY6mUvUN3I
         Ii4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xsldh6viObbdlvXna6kQqZrBsn3XFnOdoohNZM4M/Jc=;
        b=JXADtwSQUwqb+lB3FfAnDC5x1kpru2xXe5erqvBn47iUeCrQH39r0JcfP5n5/7JqJJ
         CswVJNdRGakrqfU7wFwVnnQySClhmQlyD2X35N/aIT+dcFw6G/KpT3Ym9Aky/tsLiAlK
         enCEnE7yR5gwGOkHbhOET2/iPCvzJYvXt1FURcNQm8mgiRbczU8NIbDhOWokwxOoAEIz
         C9Au5TsXA5Ycsl+p8xOWx5BTOQ161bd/rEBDdZ3Ow0/Fq3HmAufjLqPuef9XaBRG8avY
         FCD1GgSBR6Nx5rzLuncvxM4mzID8dZLIRT9L1geZM665oSHS3h3ioVB6/D0URNM9h98U
         de3w==
X-Gm-Message-State: AOAM530ozjnGnrpy0KYOXHX+Jx+d0RDw/KK/Pbdps/E41C3a8usyT722
        Pt0+3dduPPmUV7Rqf4LEVDuDezjZcZA1BV2Porv0Xu2WG4A=
X-Google-Smtp-Source: ABdhPJyCCTnZc00o8G8dnYhH/9OpRLjxemRUpMS0vZYkML/ZyvNDFZM81yNY++LYyGvE1dZiUmc4nHlav72RpVX1UWM=
X-Received: by 2002:a05:6a00:850:b029:18a:a8ce:d346 with SMTP id
 q16-20020a056a000850b029018aa8ced346mr21420962pfk.73.1604501491828; Wed, 04
 Nov 2020 06:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl> <CAHp75Vf07dsUXZ8Dr-KY-NFQv+C2QQVEOH_se7vYMT6hdm-U3Q@mail.gmail.com>
 <1fd4d69b-4d64-05e5-45a3-b2182fb2d207@siemens.com> <0ab04241-4756-873b-980a-572b225c16e9@siemens.com>
In-Reply-To: <0ab04241-4756-873b-980a-572b225c16e9@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Nov 2020 16:52:20 +0200
Message-ID: <CAHp75VdRNFqDySL6D-7BzBMRu1+aPgeT=kxWtcthYH3pVWRycg@mail.gmail.com>
Subject: Re: [PATCH 0/7] gpio: exar: refactor the driver
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 3:57 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 27.10.20 16:12, Jan Kiszka wrote:
> > On 26.10.20 15:46, Andy Shevchenko wrote:
> >> On Mon, Oct 26, 2020 at 4:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >>>
> >>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>>
> >>> I just wanted to convert the driver to using simpler IDA API but ended up
> >>> quickly converting it to using regmap. Unfortunately I don't have the HW
> >>> to test it so marking the patches that introduce functional change as RFT
> >>> and Cc'ing the original author.
> >>
> >> +Cc: Jan, AFAIR their devices are using Exar UART.
> >>
> >
> > Thanks for CC'ing. I cannot promise testing this soon, but I will try my
> > best.
> >
>
> Finally tested, unfortunately with bad news:

> Code: Unable to access opcode bytes at RIP 0xffffffd6.

I guess it is due to missed error pointer handling somewhere, as above
is equal to -ENOMSG.

-- 
With Best Regards,
Andy Shevchenko
