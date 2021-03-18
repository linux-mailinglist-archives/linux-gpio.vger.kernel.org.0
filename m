Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3B1340516
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 13:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhCRMDs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 08:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhCRMDY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Mar 2021 08:03:24 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC1DC06174A;
        Thu, 18 Mar 2021 05:03:23 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so2619761pjb.4;
        Thu, 18 Mar 2021 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O18RE2ihq2VzB80oeThlToJ8TPq6RnBWqHK+hxtzy2Q=;
        b=ZiAKpXyKoBPo1oe3D6dZZ8NUACbmvvlCFdwLQ9lexMoaxaO8/4U1HLEPcJZl+2TAMH
         nmtEuMVsxrvRbgC/7T8S0lDZOh1KMOwFLEYAHhsHVMtW2Jkt8MPrSmambVy6oMqwrPve
         rAyBKm+fVs5ph1KuZr0k/1wpjfuat/c1IvUulaUPYNmRfPH+Gxbqu8PuyMLA6Jv1jW4R
         iGp3lOeT2n9TS+UPmTJmFd9EuPOwV4d3LcphXxHud4SRFd7GrXVTGVKrVHORasJgv24u
         TIR0vwxX+E/d911luWP38Uh4Q5NwAnMhV2Bo9sn1YILkXUlGBs3f5VEgqzRob1497Y94
         oCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O18RE2ihq2VzB80oeThlToJ8TPq6RnBWqHK+hxtzy2Q=;
        b=gkmM7EQGuecw5/RGGgoi16RBcx8otPx0A9wJylghYajxFQmKDP8oPb4FgogSy9ElTS
         BBAiN0V8UCE8eDo/I0IJJeONYEVpJTJL+tkdWslje707oe4NXtPv7jHPQ+hSgI02rB4B
         pwYJKDzmS+bnHYVS4bwa2+iJZI6QLoQ13Bn6U/tx9Av2O/CdJF5KGsIsnOO0zRsDU+sv
         ojsmH3SN3FlatUEeiicNwk0JTvPjRKtLsa6s3UUvk3BlW5VxcX/Y6qMRfeHnpdhm7tf8
         NhDNgJXcZ2JERkzLyuKihrQDZSOAL78bwB6y+2hfAN3RmKrrU3XbyAwYCW7cMRs3aO3L
         Tf+w==
X-Gm-Message-State: AOAM531FZxwWnNEgQxGeWD+qe9x84jCTq+ZyDKyaZlZSZJAhXXdzPZnN
        HcVgHUnls5aVg1Jq0h5WoKEZ0dGmsQiR4OR/V74Eimti58p4NA==
X-Google-Smtp-Source: ABdhPJxeHE4GSY7N6rN3OrhmXTJlz+p+cMMDS45o+vmCpwO0Q49pyq6EEXYEdYI2asdmuM+cySoMNtIc9WRbFiPpLFI=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr4190971pjb.129.1616069002455;
 Thu, 18 Mar 2021 05:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210317143803.26127-1-noltari@gmail.com> <20210317143803.26127-3-noltari@gmail.com>
In-Reply-To: <20210317143803.26127-3-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Mar 2021 14:03:06 +0200
Message-ID: <CAHp75VeKwLn1VyG30LoPhLHDxiMZDfnBDwy6t1Ka_rVP224eyw@mail.gmail.com>
Subject: Re: [PATCH v8 02/22] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 4:38 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> This is needed for properly registering GPIO regmap as a child of a regma=
p
> pin controller.

...

> +       /* gpiolib will use of_node of the parent if chip->of_node is NUL=
L */
> +       chip->of_node =3D to_of_node(config->fwnode);

As the kernel bot rightfully noticed this should be under ifdeffery (OF_GPI=
O?).

--=20
With Best Regards,
Andy Shevchenko
