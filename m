Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9ED32FBE2
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Mar 2021 17:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbhCFQ0p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Mar 2021 11:26:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbhCFQ0h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Mar 2021 11:26:37 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA31DC06174A;
        Sat,  6 Mar 2021 08:26:37 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so831296pjg.5;
        Sat, 06 Mar 2021 08:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yL/aYoE+aG2ZWMHaqrx7JSuFUFqJAg4Q9N8gr1xJxaE=;
        b=QIY9YO+t6iNg+hPO7BaluUlpxvQSHxLbmrTNoMtPNn1sicK1+WlSGLV2n4IFruyWds
         yl/8+jz5d2aQhTPX7t1/oBfbukW+c1HWIhGV1UORhYTCcZ9wcY90wB866kHBTIhG/tTC
         FFYZDcjTazf8Q0srQ2xfsOG4aj6LgXY38qiB6YXArzadHVm+/wAFJefkg5KXD/eJSFnZ
         W7I8ibxDkNx0fCgr5frBbuKQrrYDYwG7Yc73atPBi8PPhsLCt/7B4IfGV8tjQl3QYczw
         rG9HxQPbl6f1YkewbUGBY0/H19EdsbpCBuWjekKOICZYZR6Sj0WyWCvsqe64QD5YpHWo
         cZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yL/aYoE+aG2ZWMHaqrx7JSuFUFqJAg4Q9N8gr1xJxaE=;
        b=Lg10NfO+YDbDWahi+h4OzJ3/Peu9qTyHm3aXC7WS2E1znqXN/KluqtnOGbdYabtGQY
         03cY6HvdohwBXWyS/TcRlm9DXLJh8C2UEGzsQrrZp3Dz3RfTrBC46TTngba3NSlRKfT+
         HDWEyzId7HmXBX9VGuJjJ3f07j1SZff/bCZ/+G/5hj/02G6UgIxNJ1xfCQumAMQRLgIR
         RNnHuTDM3V01++BscWGQj27luyh0yX87wg4PhRp+GfHH4d9u647ty+RBr34r1DxFdePZ
         TlXjV65kDYXibyiuUvyBvCxPR+GwY5PduTUrP/dmDlHOp4QzGSMWOtpZmot74dKqzDtY
         UKkg==
X-Gm-Message-State: AOAM531Z/rCLNNdDOAvXJjqH8N7xNXa1FGYDjehzRe8iWMGMhxj0BbH8
        L84g9Mh/6gflzazs7wsytv4nXoodhALif0nbTg4=
X-Google-Smtp-Source: ABdhPJzHiUiVzOzuJW3HjdQZ5ow91HEc/Br5TUfGZPReNYbeuEk/YkffDiezsRwhPrst0+3LMlEkAuCXJrjsXjcGMTE=
X-Received: by 2002:a17:90a:4586:: with SMTP id v6mr15155077pjg.129.1615047997252;
 Sat, 06 Mar 2021 08:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20210306155712.4298-1-noltari@gmail.com> <20210306155712.4298-3-noltari@gmail.com>
In-Reply-To: <20210306155712.4298-3-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 6 Mar 2021 18:26:20 +0200
Message-ID: <CAHp75VfLwF+TXAwJKMu9TmXsW5A-r1yV4p-pJ1j+XZSgNZUj=w@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

On Sat, Mar 6, 2021 at 5:57 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
>
> This is needed for properly registering GPIO regmap as a child of a regma=
p
> pin controller.

Thanks for an update!

...

>         chip->parent =3D config->parent;

> +       if (config->fwnode)

This...

> +               chip->of_node =3D to_of_node(config->fwnode);

> +       else
> +               chip->of_node =3D dev_of_node(config->parent);

...and these lines are not needed. If there is no of_node in the chip,
the GPIO library will take care of it to be parent's one.

--=20
With Best Regards,
Andy Shevchenko
