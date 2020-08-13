Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E0B2435BA
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 10:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgHMIHI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 04:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgHMIHI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 04:07:08 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F309AC061757
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 01:07:07 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k13so2586955lfo.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9R54muuMV/vEVfDUOY+flnkZ+FHAGI60J94hAAuPy0g=;
        b=W5cRQFeunU5IORZlsTmrqvIsIDm7DEYxvXtdEuimZIiT39srqiMGmKZxv9KjFKRY+Z
         SRYTm4njSv3dBrrXJqtOTQpc7c2cuA/o61b67OT2Dcm2L5vnpKFceHZFyHG5CQysUO2+
         yWQZZPPM8i9/D7DxCtrKM0ebiJMihvPOiEBDO3Qs9IbtmNWjWXwm1rXVbrfNHynNcMzx
         Xa3zPN05RmusgmRitlTwdDCtsew+1F9dbvMr830zuQA+ADQFz44mubBVHmU43tfTqAgI
         If7t/R4+oupk2lAVOHiFWND2yX2prihkMxClOIAB4qLy/DC94w/Zgf2xjhmqngpJazCX
         N3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9R54muuMV/vEVfDUOY+flnkZ+FHAGI60J94hAAuPy0g=;
        b=mZzIxkGTL09wMN2JYdrzp+sSNzpovCof5ZZnWNc5H+fVfvPl8F/7+En7C+AaFvgZUx
         xl58QsRmnRAkfRZ44WgzwsrgtE8E4QVWp8rtU54rxv3lbEmE8aVWNu8dbMsPoy1IDcV3
         E8+j1SVMKF6m2LqlxAJ2LNobwk3q+7lRPQqj3RNPiq/NkzNB9/P7y/GRzFrntfygvf+v
         /s0QfvT0Z6YO1Wd/bnNeoQk484SqJ/J3fpWurWo9sUWmfRyxsCBg6htxCQmTdstQnvKZ
         ePeNakhk+83Il2dqQOupdmt2owcIOmlEmkl4sLQxhEzpWqOq3NdA3d6mWevusJh0LM0b
         KgaA==
X-Gm-Message-State: AOAM530uMkmuyQf1LaO+1y7g/tlSoq/uJb6ORNYAC23dncTIc6LogQa4
        iaDH24kdkHIFi+bZDH5xRr3RW00ieEQ75g+m1VbS3A==
X-Google-Smtp-Source: ABdhPJxk6syUs+jKyNnvpTRXke3XNfKVXNjjeS5RykBA5tnRzcbUAQqpPnwQvatGcFyCjbF4MXf5qaMz51s3hv4/l+Y=
X-Received: by 2002:ac2:488c:: with SMTP id x12mr1527817lfc.4.1597306026484;
 Thu, 13 Aug 2020 01:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200806155322.GA25523@ola-jn9phv2.ad.garmin.com>
In-Reply-To: <20200806155322.GA25523@ola-jn9phv2.ad.garmin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Aug 2020 10:06:55 +0200
Message-ID: <CACRpkdaiMCgHt8obPV4g7pnMcXWvWKf+KJdQjYp7qKOObQ5McQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Fix pull direction debug info
To:     Andrew Halaney <ajhalaney@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 6, 2020 at 5:53 PM Andrew Halaney <ajhalaney@gmail.com> wrote:

> The nomadik pinctrl hardware doesn't have any way to
> determine if the active pull is up or down. Reading
> the bit currently used to report if the pull is up/down
> indicates if the gpio input is reading high or low, it
> doesn't reflect the pull state.
>
> For this reason change the output from "pull up"/"pull down" to
> "pull enabled". This avoids confusing developers who were using
> the output to determine what the pull state is.
>
> Signed-off-by: Andrew Halaney <ajhalaney@gmail.com>

Patch applied. It's clearly better like this. A plain bug.

Do you think we can fix it properly by reading both the
DATS and DATC registers  to do the inverse of what
__nmk_gpio_set_pull() does and give a proper readout
of pull up/down?

Out of curiosity: what hardware are you testing this on?

Yours,
Linus Walleij
