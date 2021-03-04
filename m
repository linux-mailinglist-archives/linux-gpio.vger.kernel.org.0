Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4173632D0ED
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238776AbhCDKgr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:36:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238771AbhCDKgU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 05:36:20 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6F7C061760;
        Thu,  4 Mar 2021 02:35:40 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id a4so18609695pgc.11;
        Thu, 04 Mar 2021 02:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GRIpvihNWTiI1h+hIAnxJL+TMi81VGYiOEsi/kvHtqM=;
        b=awR9/a2gqgQUTdU1RpZdLk4IgYIVMxk/Oomaxo/Peod+zdaEoDLEWsoNu+8wC3Rr4/
         6+vnK82arnL2tMX/G4Esn0IjIpRoxDrBDI/ZBaTsmtdVC+VcD2of1HZMjfTNIbB4g5d9
         iTzuEzkrwe1Ifr+HyRMrwVh2kg7YNsYteW/KvCLD/G1qtltEDYHNTpFdJ+pzY1LfxrnK
         FMjZSSudju+FcOuHOuNHnrhLZdQYA4p/Sh0TgON2NdK1/BT4DdAXZBTMITcx8euhPrks
         xwroLK0RZzOQ8ZDPOzJs2e3LrZZKqZ7y7nzXUbwblnpRuAbjD9oNArcHjydzU7PqXDpI
         Nx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GRIpvihNWTiI1h+hIAnxJL+TMi81VGYiOEsi/kvHtqM=;
        b=MLkDBvF2MsDSD8Z24J2JFqPxGGJJ2oyGwPru908Hk5qFSCIBTLK7HZMJSP+DsbxawE
         b3UjG3mzvievqpPU1dQWsWPe/ZqukKvfC8qts9DPcDL9H3lJzp0npc8VIvW47tw6oX6v
         e0iE8uw0Lvxt/y/H/S3DmHMO10YgXk8hZrTHdLOyao8dE9y3494SkCzNJSNH5DTOXmhv
         csi/f+eV/91RGITt2dXFtm09Gv494Vu9lee+Ij48DduhRrboGtH0bPzNXkyKIvDudIno
         tZaAeIAQ47m0zXvvvUetBw4eos7BPdg+M8x0slpyOSKyYB3sEL82Y23L5RIV/ML6BpXb
         cRIQ==
X-Gm-Message-State: AOAM530ilntInaCjoW/PpMa1E/JwfxT5UeVueFjOVtjvKkmnAtjA4Le0
        yCivfLvE/lXyoffto60Q74z+M4W8UrVcsW7K55M=
X-Google-Smtp-Source: ABdhPJw2WSMqv8PoxzyEIigxMe/06Z5KwtdAD2Wgep/3QbOFHNWPe3ax5ScwZar85FW+rstKw0J6h3/IOwTrZFHEmPk=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr3256602pfk.73.1614854139762; Thu, 04
 Mar 2021 02:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-3-noltari@gmail.com>
In-Reply-To: <20210304085710.7128-3-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 12:35:23 +0200
Message-ID: <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
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

On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> This is needed for properly registering gpio regmap as a child of a regma=
p

gpio -> GPIO

> pin controller.

...

> + * @of_node:           (Optional) The device node

> +       struct device_node *of_node;

Can we use fwnode from day 1, please?

--=20
With Best Regards,
Andy Shevchenko
