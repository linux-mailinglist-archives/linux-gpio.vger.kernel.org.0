Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89D7B10536A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfKUNoQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:44:16 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44086 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKUNoQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:44:16 -0500
Received: by mail-lj1-f193.google.com with SMTP id g3so3236042ljl.11
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/K0otERTNvT74kny//s+Esb968aWXqV7fYAW5fNqO0g=;
        b=MAaVb/M0xhecgSuOkJ0q9CK5Ul2e3S+RS4Pz5LboNvuMFgIwDwdaBelQhDi31212wS
         G4eXcTijIwM53aTV618gi6ofCsaq260bJQO3JzZCKhGOFkdy69BYR94V76JWXBl/6QzA
         TqOahLEmZFJnM3BYwFVw9mVjzDKClIj6A7NClMWxrrabT9otNDTU31pPNuwq7O43Uj+M
         0mCMWPZV0Ifs/Wv3k3qAf7rqZzRGhkXdSMB2qeDuxNC/EBnXkWdELNzSgCZ6mlFrqfo7
         O97ia5YBGK658Vm0EaDLFxFa2bMjT/ll1ceyBBWAoPKWGekNmssqkgg3k/MbIoeh91Ta
         2Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/K0otERTNvT74kny//s+Esb968aWXqV7fYAW5fNqO0g=;
        b=ukLOGITEfyT8eGeFPSRx+QX/JhJ5GVpfboaiNlCqXmkJPKPCUT+XSbvfG6kFDNfzOO
         /aRlMDAvIv+1tBKKKJVbUls+3ZCkiRYj4YfrhG3pSZcPNTqyqyMq2+j8mtg9yZNl8xLM
         wEbjHRKb8vyaRdaSeTyB2enPpkETF59y7NGUu7CIDuajwrnTOrPFY7UQd94XzQFUdM9s
         veEnMFD5r2wb8RF7g2PgOiDUfCuRTxaWDmAm1B66oYToVP+xFbQZCgd+1N+GGWo7GHzl
         oEBEa2DwELlJMKEJcfJ/90jqnRXjE2Q+vzwLVAgmduJpvVyjC3jofg76QO0oJEyD8Z2Q
         +4YA==
X-Gm-Message-State: APjAAAX9t6279rKvdFTAbhZMwmuKCFbaxDUz8Y/zXU21BhPefGgqVp0M
        WBBbZ19tlp4SvUdGhWmQ24NDs+BV74LN3SW6oLCM/Q==
X-Google-Smtp-Source: APXvYqyVaIGF4hXZgkUL8OURtxHiBXZ+xiAU7pnS1QOfuIhQpLAxFvATZkjfMWlVIWAGyM3WUJeDaq6p3HFohJJSBUQ=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr7564523ljd.183.1574343854569;
 Thu, 21 Nov 2019 05:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20191114100804.15148-1-hdegoede@redhat.com> <20191114100804.15148-3-hdegoede@redhat.com>
 <20191115100657.GM32742@smile.fi.intel.com>
In-Reply-To: <20191115100657.GM32742@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:44:03 +0100
Message-ID: <CACRpkdby7iSNksc5AaiiLyvkvAYJb8zCq2R+uCNxu4jgjNkrqg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] pinctrl: cherryview: Pass irqchip when adding gpiochip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 15, 2019 at 11:07 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Nov 14, 2019 at 11:08:04AM +0100, Hans de Goede wrote:
> > We need to convert all old gpio irqchips to pass the irqchip
> > setup along when adding the gpio_chip. For more info see
> > drivers/gpio/TODO.
> >
> > For chained irqchips this is a pretty straight-forward conversion.
> >
>
> Pushed all three to my review and testing queue, thanks!
> (For v5.6 I suppose due to dependencies)

Ooops I noticed this and took out the two others I started to apply.
Sorry for the confusion, I let you send these to me when you think
the time is right. (Like right after v5.5-rc1).

Yours,
Linus Walleij
