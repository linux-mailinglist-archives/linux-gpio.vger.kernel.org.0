Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E63F20690
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 14:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfEPMAW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 08:00:22 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40585 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbfEPMAW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 08:00:22 -0400
Received: by mail-lj1-f195.google.com with SMTP id d15so2833998ljc.7
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 05:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HQOMAI84PZC0+DOegMD1ITt0MKv7Ak8ewW8Etm9lkUA=;
        b=BKV5XUrUWOMwueeRMWBchST5WvqZHM/NtRV5B0YPoEjo6I6spgwvU8qLG+o4JSIM0o
         b5gqWR35P6H9JsEzpk+g6yBI3JFTkP9cQHMHOaf/tD18SLlVdkPkTpH4ZSkc7A4IEyc4
         n/CLdvVAQ8fsM3drNPN2LdDMQdHGU5z8vX2K65sEzb19qN4Tz5YpiBCSC1SiryKKz35F
         U7Z4vH4IedkRwZ2DX6OSLp4lpJ0kHhC2R32nQ2EjtMrT0smDBybpstccZDvHw1MqKuXB
         fi3IkL5WBAArrYUKAr9I+AHokO+s76ktwYZm6sb6JIFUd2LNvdL+4RyVh05L2D1ex7bU
         wIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HQOMAI84PZC0+DOegMD1ITt0MKv7Ak8ewW8Etm9lkUA=;
        b=MrJQhoJ1GAJ/Farkz+/nDELdYeMBv4p4Eie4m7SsuGEeIRv79bjUuSObIp2Cp/MxiI
         8SeEDIP3osVE8XAVbb7UOecOGWy08Sajsw8bw2VYJcSIsS7Hg26QOxhleVc03pbx90mO
         sgTHxTRr//+8pjsIfZM9YrZhwyAr9yru/30Xa7/Aos43nF0F1gF7lezO5CLqMoMItNaK
         UX3zSs+qy+e+I3aPHIbMBcjZ3Umm8roI5M8vgX/1DEwNBhg4SauebHdJZ13VaVdnj+Tx
         Rvy6MdS9bwLbfi3bU3bav4pIzvMSwt4pz8J98E7NTAG0GGrAmkOVSdX8fU+eFaa27Edj
         RdhQ==
X-Gm-Message-State: APjAAAV9dmJ05yGzLu4Pm+JGvGMomFCy/+OTRhBRmSVt3eYST5r9fecf
        uiLSf7dUdFcs0NZ9AENQt3MbWzMvKZTb551WlOi43Q==
X-Google-Smtp-Source: APXvYqy/QxzuRbuXA6LlmSJaji7Uopbqp+ypyEJdX/0a0gSPzRqRuYaG5w1iurs9HkQD6IRJXQRPc5QkY1MTgNnxhCw=
X-Received: by 2002:a2e:9a4f:: with SMTP id k15mr19438972ljj.159.1558008019876;
 Thu, 16 May 2019 05:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190429054948.9185-1-andrew.smirnov@gmail.com> <20190429054948.9185-2-andrew.smirnov@gmail.com>
In-Reply-To: <20190429054948.9185-2-andrew.smirnov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 May 2019 14:00:07 +0200
Message-ID: <CACRpkdbgkh5o6HojAot6orHcT8xV-eaYa9KCgXmhp0wN7OGGpw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: vf610: Use PTR_ERR_OR_ZERO() in vf610_gpio_probe()
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Chris Healy <cphealy@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 29, 2019 at 7:50 AM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> Simplify error checking code by replacing multiple ERR macros with a
> call to PTR_ERR_OR_ZERO. No functional change intended.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Patch applied for v5.3.

Yours,
Linus Walleij
