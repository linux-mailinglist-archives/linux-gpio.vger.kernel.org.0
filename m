Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6EF32D617
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbhCDPHf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbhCDPHZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:07:25 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B62CC061760;
        Thu,  4 Mar 2021 07:06:44 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o2so9508231wme.5;
        Thu, 04 Mar 2021 07:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=L1Zl/0TZh+dv1ZZwJhM8UfC9fmhPyjvuavEu2JqaSa4=;
        b=KE12hCluTNnvJoeFuZhjiIciZVcKdw9e5L+j+YqiOgKif8RTUA7LLGe8idFgMVToPH
         bcdDGAPKFEluQoNR9xpgWAEt0VunnaCeyETlqUAu5OBII0+LLgHeeZxnHWtEWJrI2YZ1
         /iUlHROBJQXjiPLbansXSxHu5TORHjVwnQSFYFdikl5sArIsUSOKLitpW8NiNzgYHR2o
         rXommfxyXHfag19HDeS2kDS75BBHQNjnKBTr8XyVnf9sWproD5RmwbPpNk0s5zPWz3On
         WgnAwAKd69fpMnOwhTKhmDRHA+dE4kiCP+mUKVpmN0l+ZE2B25xFGaqWMN0v0SLFglb5
         gGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=L1Zl/0TZh+dv1ZZwJhM8UfC9fmhPyjvuavEu2JqaSa4=;
        b=LlUCZaDTTg+UYEC1EfZ6q6lxFi7Rht5xXVJ4y71Sg0vZcT7wCE2FQOoo/hnJ8abat1
         qwCu04/4Vo08jwVYP0poknhynt60jP0BQFCeX8Tz5Hk1UxZLyrbNYKsgUSbCRcgnpOid
         /MC8KelZ+sofZHWmXqf+8Tvj0Vsd9qRVMq8qh7Aphj11UatkkqBzA8AcA/v9BNRIT5Bt
         7GhCFCUbnNVR8Kb6Tnwtooa/aPlKKZQDxH3QsTxrZWqjtey5P0DAGcMOQGAkxiw4vBBJ
         FlU8sXzr4+sNwuaY9BH0uGkwKuDYQHxVh1WaJJHSD/9ZcEZlzvFLGngXzQYG1+W3qGa1
         ruZA==
X-Gm-Message-State: AOAM533vCFUJOqh3OKnhMLFPmK862tHFF4z5O2UxlUMz+/zH7rbtP3t1
        z0eKc8n8IuOOZZYqSB9ZxZc=
X-Google-Smtp-Source: ABdhPJySbLXVsv0l4IlmJRLWHWepYj8zH37vcgFudgrWQNLRVg/ijC3NIHghbunILF76CxR98fzMhg==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr4251960wmj.182.1614870403324;
        Thu, 04 Mar 2021 07:06:43 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id u20sm10905295wru.6.2021.03.04.07.06.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 07:06:43 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
Date:   Thu, 4 Mar 2021 16:06:43 +0100
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

> El 4 mar 2021, a las 11:35, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>>=20
>> This is needed for properly registering gpio regmap as a child of a =
regmap
>=20
> gpio -> GPIO
>=20
>> pin controller.
>=20
> ...
>=20
>> + * @of_node:           (Optional) The device node
>=20
>> +       struct device_node *of_node;
>=20
> Can we use fwnode from day 1, please?

Could you explain this? I haven=E2=80=99t dealt with fwnode never :$
BTW, this is done to fix this check when parsing gpio ranges:
=
https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba37=
0f797/drivers/gpio/gpiolib-of.c#L933-L934

>=20
> --=20
> With Best Regards,
> Andy Shevchenko

Best regards,
=C3=81lvaro.=
