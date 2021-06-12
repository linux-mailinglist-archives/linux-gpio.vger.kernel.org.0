Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0CF3A50FE
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 23:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhFLVdH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 17:33:07 -0400
Received: from mail-pj1-f42.google.com ([209.85.216.42]:50885 "EHLO
        mail-pj1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFLVdG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 17:33:06 -0400
Received: by mail-pj1-f42.google.com with SMTP id g4so7616619pjk.0;
        Sat, 12 Jun 2021 14:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UT0PdgheKss+feL5W1tJk656NZS8mRVgpOEkeRZAARw=;
        b=FyoOLLSv8iEB+7G5J7YUN5Tk6sr2uWv/LSaJvccAiZ50QzuJWlRgLlEDPzxX8LmNBH
         W19YUJaV9frRvtrcaeKatL4vCS2ZkQcgCjVnLxZs2BIpTCES4mQ0iTyRw+BxS/lEH0F1
         TnluSkRLzj0ZSqSAyEK2ixLWi15w96/+EWDsGV3fsRLp8FOGOI5aw0O5UrYmOrF8ekJ8
         76VYmFElEPO833nWnCBwIH43UiFqxXISDPDxgngZxZaCraHhjG33T5kBSasdT8JJ/mMt
         xBs44Us/tIInz6Ujwtm1qjr8tKyLcgiLwzG1/+Vhfhn593n6uCdTM9dbo2ImfA/xYG7N
         xzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UT0PdgheKss+feL5W1tJk656NZS8mRVgpOEkeRZAARw=;
        b=k5mduIgaz47IK++M4bmy9ebxzcC3TM2LfxOipVs1TvlDqBQ2EQMBvBRlZWzP8e8sGi
         AUOyPwHCKhbN4W51UAu+Cwip5Oljm9bFQOaQwYIkVWKjBdH7SjUu551sFXE9MlB0ztY+
         2xjbgU0RTHdzXHUcZBr2uzzGPeRYCLQsgUz9GbQAOp6RwJbckQoEjOXfXpuHi1XmUsD5
         gNHJbRT8m8xc3WYH09KAY/E95AGCq78YwG8iKDibS51hZVDY7PKIUgJZib/F3/Ab9RlH
         LTb7SygvxDXUjtCS6NcjA5VOJWJlorl/mPZxc+ki8aCxIIFo14tiZi6JJqqAtG2oDLIK
         wlWA==
X-Gm-Message-State: AOAM533Z+cJ/H9+0/+wVgwGpwW7gMFn1PSWxeT3Dw5Guo9Ti7dciaM1Y
        TzqC+h6yQYuPKclBbG63iSfbc/kX3GozT9Y2zDA=
X-Google-Smtp-Source: ABdhPJwcx7zR0MqeWhCvGkg37I1rpObfhF4zJU97thMpHq8Kl34o79PE1ItzkjWrPKLNd1ob8IzhC4vs7nZ7VeNoqvs=
X-Received: by 2002:a17:90b:818:: with SMTP id bk24mr11172538pjb.228.1623533406106;
 Sat, 12 Jun 2021 14:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623532208.git.sander@svanheule.net> <5d8e5e8a29ecf39da48beb94c42003a5c686ec4e.1623532208.git.sander@svanheule.net>
In-Reply-To: <5d8e5e8a29ecf39da48beb94c42003a5c686ec4e.1623532208.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 13 Jun 2021 00:29:49 +0300
Message-ID: <CAHp75VeOMb2xUJ+g2UQJnBybmehmYr0dGPEzDZObUGr=Q95+wA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] gpio: regmap: Add quirk for aliased data registers
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 13, 2021 at 12:13 AM Sander Vanheule <sander@svanheule.net> wrote:
>
> Some chips have the read-only input and write-only output data registers
> aliased to the same offset. As a result it is not possible to perform
> read-modify-writes on the output values, when a line is still configured
> as input.
>
> Add a quirk for aliased data registers, and document how the regmap
> should be set up for correct operation.

I still believe that there is no issue with gpio-regmap and we don't
need any quirk there.

The issue is in the regmap APIs (implementation) itself. Hardware with
the concept of reading X / writing Y at the same offset is okay per
se. regmaps doesn't support it properly and should be fixed (amended)
in a way that you provide this kind of register description thru
regmap configuration or so.

I expressed the idea of trying to implement regmap-8250 as an example
of the support for such hardware. And OTOH that this kind of hardware
is not unusual.

-- 
With Best Regards,
Andy Shevchenko
