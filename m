Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C1D2C2ACB
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 16:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389515AbgKXPEr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 10:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389513AbgKXPEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 10:04:47 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6969C0617A6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 07:04:46 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id d17so29287166lfq.10
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAY25/RXmwYOWVJe8+TIllMxJtvaiO5QFeFRuqe7sfA=;
        b=hPKPVezZkmNZvQMBW9tIArcm7h9+ipvHX9B+BNe47GB4NXdjfvBbVw9odWhcuNZlE6
         lMwPnkbpOpFF6/4IX+8OhZR+sCLS5AgnRwQeOefwyxxTwiIOoBk7M33Y/x+x4FGXSenB
         G41UR0DZGAAN0tuj7x5J/XsVx/qcPbebgVWq4aCiS8qfBdJskgrlIzryqdcc8CnN7D9Z
         afb7Gfj1I6okPFVtiZaaNkWNbtE1yX8+TSeTbBe3tcENiIVYF/Ev473wj6Byj3RqsY5z
         +Cfyu6/RbZ4TMFwDeHsrB/v+hyuJ4ZDG/4Ybfw2Ks3drVFxJSp1y08heLA2FcP61/ZYy
         qPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAY25/RXmwYOWVJe8+TIllMxJtvaiO5QFeFRuqe7sfA=;
        b=Qn7SwMdl8zrMtqmXLykHMt0YkNxp6Duvi3gW0uYq/e9XCtKKkFudjObHg2OYoNFldS
         c3jc0GUXyjulSoaMIXAPVWIAeobGSqVh42WU8a+RQ9oWRrxbBUsNi8nS17ROvujP39+L
         Q2jUeFdy/DtSQ/rJMp1HZU6X8IePMc+8tASRnPHa0TERQFqjHVS6oxfqhiL2LCwQqqTH
         avUqHBKw/PRVTt5AW4URHa8rWVhMjIX0KFB++Y5Rau7xQLE2DnkGsRqE4rJuvJtcLyNz
         ucwaaACJT+juUGYG1AeTRPsh0W/Fz5RcUcojG43ni7ZqMbKbDNNkLbcTGx7HydAYDVQw
         K+mQ==
X-Gm-Message-State: AOAM530/nHIlESxSoF+eEFeE8gvDhsW2+bEKWdu9dwf1L1oK9FzIoaOc
        k+29Qu6ftcRTLbYld4EwENop7PzutVbAYsFKFASgWw==
X-Google-Smtp-Source: ABdhPJxASt/4uJzaMwJEija1/WDSBTFfr0NxH/EgWcReHh7um0vmpkxGfCeTC5RlRmTgq1y6fXVmhB5ASXV1H5vMJZM=
X-Received: by 2002:a19:8686:: with SMTP id i128mr1817194lfd.333.1606230285308;
 Tue, 24 Nov 2020 07:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20201113132429.420940-1-eugen.hristev@microchip.com>
 <CACRpkdYdPp_ihSEHkPaLa0_mcX+8ypnPZ4dn0d-PY9Mes1XntQ@mail.gmail.com> <20201124090322.cjugamri37yxcqy7@sekiro>
In-Reply-To: <20201124090322.cjugamri37yxcqy7@sekiro>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Nov 2020 16:04:34 +0100
Message-ID: <CACRpkdZ793ARr6egT55RYnefuExhqDEUvFW6RX70YqAatbFm-w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91-pio4: add support for fewer lines on last
 PIO bank
To:     Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     Eugen Hristev <eugen.hristev@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 24, 2020 at 10:03 AM Ludovic Desroches
<ludovic.desroches@microchip.com> wrote:
> On Tue, Nov 24, 2020 at 09:31:36AM +0100, Linus Walleij wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Fri, Nov 13, 2020 at 2:25 PM Eugen Hristev
> > <eugen.hristev@microchip.com> wrote:
> >
> > > Some products, like sama7g5, do not have a full last bank of PIO lines.
> > > In this case for example, sama7g5 only has 8 lines for the PE bank.
> > > PA0-31, PB0-31, PC0-31, PD0-31, PE0-7, in total 136 lines.
> > > To cope with this situation, added a data attribute that is product dependent,
> > > to specify the number of lines of the last bank.
> > > In case this number is different from the macro ATMEL_PIO_NPINS_PER_BANK,
> > > adjust the total number of lines accordingly.
> > > This will avoid advertising 160 lines instead of the actual 136, as this
> > > product supports, and to avoid reading/writing to invalid register addresses.
> > >
> > > Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >
> > Nico/Ludovic: can you please look at this patch?
>
> I acked it one week ago but I get some nasty behaviors with my emails. Maybe you
> didn't receive the answer.
> https://lore.kernel.org/linux-gpio/20201116061549.ks6hfonyplwhknmq@sekiro/

No I didn't! Weird. b4 found your ACK anyways, so the patch is applied
now!

Yours,
Linus Walleij
