Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A472455DC8
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 15:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhKROUD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 09:20:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbhKROUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 09:20:03 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28423C061570;
        Thu, 18 Nov 2021 06:17:03 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id b40so26810251lfv.10;
        Thu, 18 Nov 2021 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=GygOPhU5icKxtqCF2DlWG7uaF79rJii2mQxjLwhBwyQ=;
        b=O2IoF3iq+u+SRLi6N/yjfQRZcvPsf9yeWFQttHAIL8zsKKwatyxiWosbUHeRmAOviA
         MrfHkwL+Cmj4fl2HfK28GqWSX3zI0Ytmf4D6TBGAXkZCSkMvQTUDeZunTSKQVtRrrgiL
         RqtLLSQzrZ8t81aDvwGaXUzlIvqbUExCwHEY2vdGRhVkmSOWWPV/iXdZGbjaYLd4dgHn
         0EdtMmOEOUysBXlnaphTMThrNgYgkXZXNdlUym4+jMPMXwDGFd9os2Zl5aGhGMIIsAhn
         8qUQS1k1JVySrtqmUxNZQkzKiI+il+bHjD93i+2Ex77OzrkOfFGtxos7Ecp6b6TGn6xM
         sUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GygOPhU5icKxtqCF2DlWG7uaF79rJii2mQxjLwhBwyQ=;
        b=RPMgFoxyLXSiOcUPPE6wBW2IQM7mLZKFXtJRBrmaFDU7J0O0Tf9j6TCmre329pHYUG
         uCiAhpkgU6Eg0TwE+7mR2IHhvj/GcN04cn+yaTd7Wf2VtfeCXkvs8GqO8pH8lHzI1Rn9
         h1pA3rDDFfNg+kIvF9NOuJQLiLDy/TXVZ2sksf008/Mwsj+OiGZ0+5sl9eldDi9YWJGA
         HbadgfO1bll1mooSZZwq04n+E834YyLrV3yQSJy+5VnFU2jKNvO0BA5xjgP0+ufbsgp4
         B91G3dKMTXPsKlq/vaBegMZs+QGrP7GYkvr2cSPITg2veP0N7FhcM0wXEiZSc8KrapGJ
         JPug==
X-Gm-Message-State: AOAM533s1ZP/Zdt6K/prXfIp7umw8e2iJjVAUWhFZ0FzdsQdQRy2CW2u
        n1Lwfq1DajbY4QmeY0hnpQQ=
X-Google-Smtp-Source: ABdhPJyAyAEBFANrU0C0b9yVQTfaZztqVN2XdodkepfT/4CKArVg8D8iqGDrvSbTVzeeo3YOMeOclA==
X-Received: by 2002:a05:6512:3763:: with SMTP id z3mr24016586lft.601.1637245021577;
        Thu, 18 Nov 2021 06:17:01 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id r5sm309070lji.132.2021.11.18.06.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 06:17:01 -0800 (PST)
Message-ID: <82405573-8c3b-0c43-6388-6e0891af4ae6@gmail.com>
Date:   Thu, 18 Nov 2021 15:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH 3/5] pinctrl: add helpers reading pins, groups & functions
 from DT
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211118132152.15722-1-zajec5@gmail.com>
 <20211118132152.15722-4-zajec5@gmail.com>
 <CAHp75VebQKsSJYxK9Fi0wEhGfpR=1HZfDsVuqV8BCG-UrZDtVg@mail.gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <CAHp75VebQKsSJYxK9Fi0wEhGfpR=1HZfDsVuqV8BCG-UrZDtVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18.11.2021 14:57, Andy Shevchenko wrote:
> On Thu, Nov 18, 2021 at 3:22 PM Rafał Miłecki <zajec5@gmail.com> wrote:
> 
> ...
> 
>> --- a/drivers/pinctrl/pinmux.c
>> +++ b/drivers/pinctrl/pinmux.c
> 
>> +#include <linux/of.h>
> 
> I don't like this. This shows not thought through the design of the series.
> 
> What I rather expect is a proper interfacing layer that you fill with
> options that can be provided by corresponding underlying
> implementation, e.g. DT.
> 
> Moreover, before doing this you probably would need to refactor the
> pin control core to get rid of DT specifics, i.e. abstract them away
> first.

Ouch, it seems like pinctrl got into a tricky state. As I understand it
we need some abstraction layer between DT and pinctrl but noone is
working on it? Does it mean we should consider pinctrl core frozen until
it's refactored?

It's quite inconvenient for me as I'm not sure if I can handle such
heavy pinctrl refactoring while at the same time I'd like to add
those small features to it.

Can you point to an example of extra interfacing layer that could be
used as a reference for what you expect for pinctrl one, please? Some
solution in another Linux's subsystem?
