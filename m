Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0AEF455D0A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhKRN42 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 08:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbhKRN42 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 08:56:28 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF76C061570;
        Thu, 18 Nov 2021 05:53:27 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id w1so27261029edd.10;
        Thu, 18 Nov 2021 05:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XDayD9Up8pbYTX0I4VR30Djj/ittgN+V+boM5K4mUIY=;
        b=WLZCOIAx3qp0YLH6Rb2Qh54zX1GGVdUM9lMq3IzYxw58I+20lx/4WS8jHxRNeZ1Q4Y
         UMDSSchapqFFYKI6BIP01IDzlYABMor1Y5MTPHJvZle6vUBf+4GZoN+1laxjVdHplZD7
         OeR8N7qfudCiT8yq49tk10rgcJ/LWFez14HF+ljrxTtXerfpOPIunv/QX9Rl9yoo+uh3
         ZoMHHMtDjU3oTHdWd53gl2Y3i2b66NemHkNq6FirH9RkB0KXbeGAMYXKbgU5OBLDsB8U
         X1vHK1jgKYhDWlyJ42rn2shM5/HR59SXP7zWdDu6NMMfUfFnGGfOFejYv2zU1oDuwlKQ
         38kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XDayD9Up8pbYTX0I4VR30Djj/ittgN+V+boM5K4mUIY=;
        b=gQ7PGGZWO9d1dJ4qIBbynf/GdqnYzZY/u236odPgizOMVLg8RAxJ0Mt1V1vkG2uO4J
         ex0ljKTmGNUWoicgrq2rhtM3V+sfmIiqbFd3yXNiMwNEXZUNfZWxWiuv/SG2l6Z1EmML
         htmHSPytiMukynqSw8BD6TgkAViS2bqZ4+BunMrKWUq6/kjDLynvyeJ7/t1w/Ew7f1QQ
         KwOwd6/+23n011TaUK3yFqqVlF8xNz0S4wisa468FCcigxypvrKOZ341OUSwjQrjR4fu
         vaIBnaNQ9SuYF+5BIACukho4G2s1e2CmDsLLdDQT2DWrRHMIMO9UHA/MG00edUTVk5gZ
         g2Dw==
X-Gm-Message-State: AOAM531G8fqLhm+s80Th6jsQG7wE8D+o7SVA2VWMhFQwIQX+6e1ywl0Y
        9b1gJwUOvnrc3RivNT/qqviHGrhNr3Tnvn4PhUU=
X-Google-Smtp-Source: ABdhPJy2REv7kj+jyhdpi5wrTBR+64ueROt4QMmoHSq5852Vc1KuxgLNDj6OumdIPWFd3FPAdZPkD4607nGXHr9d7bE=
X-Received: by 2002:a17:907:60d0:: with SMTP id hv16mr32852451ejc.425.1637243606288;
 Thu, 18 Nov 2021 05:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20211118132152.15722-1-zajec5@gmail.com>
In-Reply-To: <20211118132152.15722-1-zajec5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Nov 2021 15:52:45 +0200
Message-ID: <CAHp75VfckgE9VNkYTiJfxdQu66-DntUNOT7ttHr678Rt5fwmFg@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: allow storing pins, groups & functions in DT
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 3:22 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> A week ago I sent
> [PATCH RFC] dt-bindings: pinctrl: support specifying pins
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2021111023=
1436.8866-1-zajec5@gmail.com/
>
> From short discussion in that thread it seems that using DT to store
> pinctrl pins, groups & functions may be an option. I'd like to ask for
> reviewing my patchset implementing that.
>
> Please note it's about describing hardware elements and not actual
> programming way. It may be used with pinctrl-single.c one day but it's
> designed as a generic solution for data.
>
> Patches 1-4 are for linux-pinctrl.git. Patch 5 I found worth including
> as DT big example. It can go through Linus with Florian's Ack or I can
> send it to Florian later.

DT is not the only one,

So, I would like to see some kind of roadmap / vision on how this can
be useful in the ACPI case.


--=20
With Best Regards,
Andy Shevchenko
