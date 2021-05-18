Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A49387A95
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 16:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239860AbhERODF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 10:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243387AbhERODF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 10:03:05 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1D8C061573;
        Tue, 18 May 2021 07:01:47 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id gm21so5552410pjb.5;
        Tue, 18 May 2021 07:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y6NVOFby1UHC4AnYLCWY5Z1SIPedFltfvQWz5Izwnw8=;
        b=A0FAuDD3zXOJzyw6Ng9JjXk/uZhSaCV9gYFyiBp5qNctYwGJJny1V3vx667mQ7fcGm
         SaFt052nZ+CTQM78msCdwhTqop0zx3Vx5B3T1FVd6wrXWfU+zbomLnL2Y8YsUXGNhCt6
         +TsusV0EJuo36jWG9mcXCzXO34lcUtdkX4kmHf2egY6wJt4sbB/Th88ABUpKMQ1zksQr
         WYymV4/SkJgnc9s88NU+OlTan7EpW1/zfSTxSTIYTDfFgRyWMG+L5RUO9byYsY60AFNs
         0WjQ4wK9ykVw+iAujp6rEWqw7lwRUsQrCUzrOZi/oRhkuURJilASGV02g5S8NP4tdhxT
         lJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y6NVOFby1UHC4AnYLCWY5Z1SIPedFltfvQWz5Izwnw8=;
        b=uYGFy8P7nM4ms7xa1LVvvqnYfWM4fZcM08gbbxLrrSPJ2Edgq1+ALfHyCjmWSd6as1
         8ajD5SaMCOJ0A7CRVduLYPxCpXnQhZx8LTaSXU0kqMxgGXe5zDf/HUx/KRpang/h3SvH
         hsljkcLGfzn/EbuJmelHtzoF7L+PlIQ/ndnF7psuAUKwAaB9nIRdE49PeJ1GpvEn7UQU
         RQKHwc7O0AXQTPFVYDJs7s+izwEGTledRmyVguRnF0W8Dvao3NvXTG80wg578J3Bei+9
         50jTDtc1NSuqiaW15Z96TIuUYJDFCWA8TQ96eSljx2p8nElrVkrlRT2Yhn8BLvX15BbL
         Id2w==
X-Gm-Message-State: AOAM532DzuIo2Bfxlje9adxbKsaTnsmr33y5ZONq71HkBjozmRM9PMsX
        3lwx9LrHn4bRK3EG7uU3v8weeEsdxMHxEnAPH6I=
X-Google-Smtp-Source: ABdhPJytjdzE//r9BlnPHpINYKyDfBZsu/T4+0L9iaMLfPCaHhdTVpX8stQILUwWLMgHHGyktKK+JjiwAGIb0Gij2O4=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr5319182pja.181.1621346506810;
 Tue, 18 May 2021 07:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210516135531.2203-1-dariobin@libero.it> <20210516135531.2203-2-dariobin@libero.it>
 <CAHp75Vd8875hRNk1JK6gkmfxjqxBSu4cRNE1zJt9TyEW7TvsMg@mail.gmail.com> <1735504854.166374.1621346262270@mail1.libero.it>
In-Reply-To: <1735504854.166374.1621346262270@mail1.libero.it>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 May 2021 17:01:30 +0300
Message-ID: <CAHp75VeADiRKdfnsXQ=y3z1WAJBbtZ+P=8tdyYtVQpJrSrQ63Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: core: configure pinmux from pins debug file
To:     Dario Binacchi <dariobin@libero.it>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 4:57 PM Dario Binacchi <dariobin@libero.it> wrote:
> > Il 17/05/2021 22:02 Andy Shevchenko <andy.shevchenko@gmail.com> ha scritto:
> > On Sun, May 16, 2021 at 7:43 PM Dario Binacchi <dariobin@libero.it> wrote:

...

> > Can't you use strncpy_from_user() ?
>
> Ok, I'll use strncpy_from_user() in the next version of the patch

Don't be in a hurry.

We need to settle down the interface first. We still haven't heard
from the maintainer (Linus?) about it. Neither we have a clear view if
we need to revert that patch that dropped pinconf-config (Drew, what
do you think?).

-- 
With Best Regards,
Andy Shevchenko
