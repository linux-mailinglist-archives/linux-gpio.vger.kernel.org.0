Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2592ECE21
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 11:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbhAGKsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 05:48:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727747AbhAGKsd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 05:48:33 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696B4C0612F8
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 02:47:52 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id x20so13435541lfe.12
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 02:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+7XwE28X4fXF/VAPlQ9ICdN19xfQZPvJYAHkAqrSpbM=;
        b=lZSeQmpL44ia1pxaaf6q3laKKhGvowIDIG9HkRAHBV3ZDOLeR0Gi8uWdFgBgtPIZ1p
         uxWYCdLflXcDvDTswe+DBBMCG4hyuFqJpuumDkr7gZjHa9ZSu+K9UjSk7yAvAVdIS97G
         PwMrvlNExOFvHkohUeVLEcIdAP+UxOh85kmbJRDfw1wWj3tZb+gmHFC4V1Jbscq4Kmxh
         Fy25hhIwyGM/8uHOoakNj9j1TkBJ47wOEjrWf4oiI10woEUyyNHDAKTU7j+skCLlbBDJ
         U3j8T70ktJamS+D9xt+2MAcMsljHvCkAALeQ2zHv/fdXw0pC9iHgjoHv8vqF60fhkkI7
         eaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+7XwE28X4fXF/VAPlQ9ICdN19xfQZPvJYAHkAqrSpbM=;
        b=Q/qyYx+X7qRvTs4w05owm37PnlFUvQvoVl67iaEZbTFeFNbOKVv90hEvgFcdJIApiR
         yeLzYQJ8e2gDZA7VNKzPH/5Xrs6NzwvZVmNRxT0HiG+uTjYOrTtnVo1PTNOgsKu8Omzl
         Uf1ZDvbb0qiMo+0lHgfHAFHpPYd/rxGS/RKNzDsLC1emhMzeClTRm/tX+0+tk3tNo01p
         fu/AFaZXs5ZikjYHFWO43eSHQR+aZ0xzFeKtgqeAJA2lBK++LdExOqwrUSaXwGmVdag4
         iKcl4PANFDy1nf1ffQRta4PiarsI6925GGMfsIYde+E8/N9V2la01HvNoAZiaovZxDVU
         +qwQ==
X-Gm-Message-State: AOAM533CRztsA44OCPyOi8DUviu7Eosi//mEwySIzxd1/HbIREuzRO50
        qoNQmwAw/NaqMovvOwH1yitGr3yvvZrcsoA1BO4WrYnHXrc=
X-Google-Smtp-Source: ABdhPJxUieCSbIeBaJQUgG3zhIyqXLFGB/W2a2xGjPAXZm0gHVgK+7oNhmF9Hh2mmwfC7T2of+obTb8MJqj7NhsyZWc=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr3689418ljl.467.1610016470964;
 Thu, 07 Jan 2021 02:47:50 -0800 (PST)
MIME-Version: 1.0
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
 <1609936000-28378-6-git-send-email-srinivas.neeli@xilinx.com>
 <CACRpkdZrBXJSo_kicWKQ_wtFTZvkOUNyjP6UHZfY7xwRSNZBRw@mail.gmail.com> <11abb0f7-407a-3509-ad50-cc7698147ee5@xilinx.com>
In-Reply-To: <11abb0f7-407a-3509-ad50-cc7698147ee5@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jan 2021 11:47:40 +0100
Message-ID: <CACRpkdZ7rbPyppatnBhuf9m89XuAhZ1h_JQ-JVs786YbN3tYxg@mail.gmail.com>
Subject: Re: [PATCH V4 5/5] gpio: gpio-xilinx: Add check if width exceeds 32
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 7, 2021 at 11:29 AM Michal Simek <michal.simek@xilinx.com> wrote:
> On 07. 01. 21 11:17, Linus Walleij wrote:
> > On Wed, Jan 6, 2021 at 1:27 PM Srinivas Neeli <srinivas.neeli@xilinx.com> wrote:

> >> @@ -591,6 +591,9 @@ static int xgpio_probe(struct platform_device *pdev)
> >>         if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
> >>                 chip->gpio_width[0] = 32;
> >
> > This xlnx,gpio-width seems very much like the standard ngpios property
> > from Documentation/devicetree/bindings/gpio/gpio.txt
> > but I guess not much to do about that now. :/
> >
> > Do you think you can add support for both?
>
> support for both is definitely possible but we need to handle also gpio
> width for second channel referenced by xlnx,gpio2-widht now.
>
> It means we could end up in situation which can be misleading for users
> where ngpios will be 10 and xlnx,gpio2-width another 10 and in total we
> have 20 gpios.

OK that is confusing. Let's not do that then.

> I think that it is better not to start to mess with ngpios property not
> to confuse people which are coming from other SOCs because ngpios can
> suggest all gpios assigned to this controller.

OK I agree.

> >> +       if (chip->gpio_width[0] > 32)
> >> +               return -EINVAL;
> >
> > This looks OK.
>
> Does it mean ack for this patch?

Yeah after explanations this patch is fine:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

It's just that this hardware with paired controllers is a bit weird so it will
lead to discussions all the time because it's hard to understand.

Yours,
Linus Walleij
