Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B180E9DEC
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 15:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfJ3OwK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 10:52:10 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41514 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJ3OwK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 10:52:10 -0400
Received: by mail-lj1-f195.google.com with SMTP id m9so2989181ljh.8
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zqOpYQOtw9yFJi81XbFUaSXt11/6onyRVhvsGTXeGrg=;
        b=Fq7XwGiYDoSgtasnGYLn42sLIZvvnUMKagtyFGjgmekfUdmiD5SBpG2sGNp8txJuxa
         /iH336ymZqCDVIUoz+zWNNwuLx7IDJsjR9r6ylLJMUeOUqXAzeNyF9e9GD5CDKXSSomZ
         HN/FNdBvDREepAo7jhEVK068PdN0bPFrOfvDR3YC4d7QTZd1AWKnW03/id8NHNmofXH5
         avxcuc8sZJ8apf+rF8zSH0haX4ZmTmJ2liXLZiLyt692C5zap4rsAMNOS+ufojrL72q7
         z0BBGxcwVlKwtl0pn07xmfFmd1zKdjulphANlCn9Hjx48Xwl/pH/x1GnMqFcxgACQJX6
         cpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zqOpYQOtw9yFJi81XbFUaSXt11/6onyRVhvsGTXeGrg=;
        b=ctPW7TLcJaUV3GzyAHbSawgPuUxzKMD7lDzJxycw5+WZBiFxtzDQ5QpYhnCTODFIOZ
         VxBQksKzeO8clZtUpHkAjwqiGF9EFSnaSKvrm0fkRgEeMJ+B5XIScTdf6xgZ6xzqTZDo
         0HcJcVgQlG3ePzHIYdLxqGLBqCx0LytpvNQsD83ZkaKyFaj4EAALHh5V5oQx/BQ6zT1C
         DnO3u9rn6+ci2GglxuOpLjnKmVJF4iMjiaESdk3iWXBAMPawpEWwXOv06iaR4rvNVMS+
         GQ+mz1+9nBduJXTngP8pPC06551vmxMAkKVMf0gMRuaMQ3zI9wWJaRmzw8OmtYayxkgT
         JcyA==
X-Gm-Message-State: APjAAAUEGBb8n55qUly6O+07Az9ryWnsY5E0Q9REa/MDD1/CT1HKLBeC
        L7hZue/JGgUAT0/JlbCXqrHyfETpaAA/hj7HW0PNxQ==
X-Google-Smtp-Source: APXvYqwk9hOX7lLgR8f9ogl3FoBFAl1r5poFDGFaibIDr6k3XEATSFuXVNycDH5IoM9+27BD+FcJ1/+kF69tEmPuo0I=
X-Received: by 2002:a2e:93d7:: with SMTP id p23mr75828ljh.251.1572447127577;
 Wed, 30 Oct 2019 07:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191025140621.43417-1-andriy.shevchenko@linux.intel.com>
 <ddd33998-43c4-7772-16dd-c09c2184c51d@redhat.com> <CACRpkdboOodR4Ux-bNp+XcFkTtxA-QehtP6+H+RsfFk+h6OaXQ@mail.gmail.com>
 <cae76d3c-7a9d-2fdd-2899-b1a98cf0df78@redhat.com>
In-Reply-To: <cae76d3c-7a9d-2fdd-2899-b1a98cf0df78@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Oct 2019 15:51:54 +0100
Message-ID: <CACRpkdbPSVZqR2RTiy4EB5JLGeY3vT_1ivcU-19uBJ_a+my1kw@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: baytrail: Move IRQ valid mask initialization
 to a dedicated callback
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 2:11 PM Hans de Goede <hdegoede@redhat.com> wrote:

> > (Tell me if I should send this as a separate patch.)
>
> If you want me to test if this fixes the issue, then yes please.

I sent a patch fixing all the instances we can immediately
spot.

> Right, I did a quick check and at least these x86 pinctrl drivers
> all 3 have this ordering problem once the irq chip registration is
> moved to the gpiochip_add_data() call.
>
> drivers/pinctrl/intel/pinctrl-baytrail.c
> drivers/pinctrl/intel/pinctrl-cherryview.c
> drivers/pinctrl/intel/pinctrl-intel.c
> drivers/pinctrl/pinctrl-amd.c
>
> And it seems that drivers/gpio/gpio-merrifield.c is already
> suffering from this problem in 5.4!

I fixed all of these in my patch, let's see what happens.

If we need to partially backport it to v5.4 then let's just do
that.

Yours,
Linus Walleij
