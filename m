Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D54FA45D7DF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 11:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354268AbhKYKEL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 05:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354388AbhKYKCK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 05:02:10 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99359C0613E0;
        Thu, 25 Nov 2021 01:58:59 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id t5so23371644edd.0;
        Thu, 25 Nov 2021 01:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bReJBvs6pm+rXGlaZprZ6AEHwchFPJCGUCnWKSr2lVY=;
        b=QkSmOFZaN6JhRjjVGQ3A7SxmbRKcztaohZwCctEiP3Ly8VY3Uh+poy2Zhw1VKjORt6
         fUlOVhl0Ns05ng61s0TsbxuwSFclNI/gRmJTak7yjUXmFmK/lsq9xxnUs//k2184zZC+
         +usX7qTBm0Kxkj01XyC8cQtrC5LhH4OO7LJxL4lzMpqsNhWZqtZujLPEC5mpx+IJBh1o
         4jBpqoiuyg3TwO2bbdYbli6Cviz0MuEB8hfSpWAgcsGv/UICe9fCupCFi9hyZrMG9Tx/
         Rx8s2MLVzk+fB/VzeO0TM8aSHcUMTCNxUrN3qFXN3whd/qAZU+yWZZFTK1hP2TMK1iHs
         ZY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bReJBvs6pm+rXGlaZprZ6AEHwchFPJCGUCnWKSr2lVY=;
        b=xVlmlkE4eWkh8Ur5punv1FeUE7ZsFURPH/cTSdE7jwlQ1lNMqB8Rlo5vf/tDUDsMxx
         AR+xKM0a6Bplu6hMu1f161qS8x8oNPhjMGRBE1GnFBDySsWiJKZvsoOEJkLB0MiLFnXh
         FKZ68BYvHr1c0sQ8g3JogWrdIXzKAQuIIcQBOlYBkzrGprfY3lNWi1m4LdRcv7s4a82N
         7GriH2tQ41kkXjP9zJsfiLnhItcX97ktrnjidKkVsLaWmRdqf1wshxz1MWL4WKw9MMBs
         ci0Uw5e2MmA45yY9PtzTr6mebw079unDbHRVlAOS65SIKnAJNKamLWxWwsvGQJS7bIXb
         YeOw==
X-Gm-Message-State: AOAM531NP3XRpLlydObuEh45Zl4IoqraIJNon7XK5w43Q0iyOV50Hlmp
        Ic+/nRqgB1+fryddNQE8gJN1MaooY2rp+K/oMvgj2DAp7Wk=
X-Google-Smtp-Source: ABdhPJwNFVbnvACIGpHy/x/IsEZgcGaUNlwGxf40PCDinRTCA5+i7hupFPmyI6iGfPLP7d1U/UwCJpP4WNRHfunyAWY=
X-Received: by 2002:a17:906:ecac:: with SMTP id qh12mr29213870ejb.377.1637834338160;
 Thu, 25 Nov 2021 01:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20211124230439.17531-1-zajec5@gmail.com>
In-Reply-To: <20211124230439.17531-1-zajec5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Nov 2021 11:58:22 +0200
Message-ID: <CAHp75VeyJ5HtH-T9mOexz07WCa=nngqzrcYZie+t+fdYz2Hngg@mail.gmail.com>
Subject: Re: [PATCH V2 0/6] pinctrl: support platform (e.g. DT) stored pins,
 groups & functions
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

On Thu, Nov 25, 2021 at 1:04 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Two weeks ago I sent
> [PATCH RFC] dt-bindings: pinctrl: support specifying pins
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2021111023=
1436.8866-1-zajec5@gmail.com/
>
> and week ago I sent
> [PATCH 0/5] pinctrl: allow storing pins, groups & functions in DT
> https://patchwork.ozlabs.org/project/linux-gpio/list/?series=3D272685
>
> Initially I planned to allow putting some pinctrl hw details in DT and
> later that evolved into a slightly more generic API.
>
> Again:
> Please note it's about describing hardware elements and not actual
> programming way. It may be used with pinctrl-single.c one day but it's
> designed as a generic solution for data.
>
> Patches 1-5 are for linux-pinctrl.git. Patch 6 I found worth including
> as DT big example. It can go through Linus with Florian's Ack or I can
> send it to Florian later.

Thank you for an update! What I would like to see in the cover letter
and esp. in the updated documentation of the pin control subsystem is
the architectural (design) point of view. There is no sense to discuss
the following patches without a big picture. For example, should we
allow some of the DT information to be passed on ACPI based platforms
(due to OF related enumeration of the devices in ACPI environment, see
PRP0001 for the details)? Or i.o.w. Do all these properties make sense
only in the realm of the provider? I believe it's true for pin
controller devices and false for consumer devices, so, the question
is, does pin controller device support any type of hogs or it's only
property of GPIO? It's all not clear to me with this cover letter and
absence of the documentation.

Besides that, consider test cases to be added (OF has its unittest
built-in into the kernel).

--=20
With Best Regards,
Andy Shevchenko
