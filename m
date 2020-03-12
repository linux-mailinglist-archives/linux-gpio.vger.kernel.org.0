Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D157183233
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 14:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgCLN6r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 09:58:47 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33249 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgCLN6q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 09:58:46 -0400
Received: by mail-vs1-f67.google.com with SMTP id n27so3750529vsa.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 06:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fx0Vi5pKlEASKxiQYrtyhfY8y0s7akeECkpZVrG32d8=;
        b=rXeKEapu6I/a+Rkozky+mQZ4L6h8ZEabo168RsNPZzBmC9GIm9krfQfUmMz+0tlj+5
         FFQSg+3rQjPNnQx+goAU0Xu6wc/hBSdDv9f3bAxKMAaXvTsgwH+9dfcpUj1UQ+KnK8bL
         s+xcmFDOmTp5fctcsFgIoCLgX41e9Dahfpif6O7BmLRAO7wKpQxqFruLhdOFuZS0KK7G
         4vwuV5SyhZq3Oi5+eh4mUNulzObGO+/4DROaCHW+9bixq29Dd5YCMJYRJTd9mlGKR6su
         DnK59NycxKsurK7Xsf+cJvdr4arFyZ0gVIyCElzxc6Kv116ZZSb+BCVydxFmAaYl+DK8
         Tspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fx0Vi5pKlEASKxiQYrtyhfY8y0s7akeECkpZVrG32d8=;
        b=mrXzSSxPGLXuV3ADoSQa6X98MO3d283rILLkdf6tBThvxeAVf8uN5hT2aLbuEVPlcf
         UDn+kzmsboJxRRc2tVEHb4p834i3Ev/tdzEKplpgdqaE9i4sM1YmS3SqNjMvDyAghS84
         t1bsThYNQsjjnJ9iTjWi8kSaHxu2G/1FGT0JO0BooCw8V75v/JodiyF6Hg3X2jcKR2AM
         DzQESuOlS3n+7aMUiLgFI0x6zko0Cgl/isYepyzoOLjTZhU1XctqRkaoYQcHCpWcRtv5
         ppeGRBge7AVGKCL+yaw21fUJLZzmaYerfaZDEZRRT9uPLDGQbdsdknvPTXsflLTSDy97
         Ybmg==
X-Gm-Message-State: ANhLgQ3lYRiUwiMnZVehK3HAy46AUy9ZMn0+5JhWmLnNKuAYzOhDoudI
        OWiNaQhh2nKdGLRHlJ1Ya/PncbzddNPzQeSO9eR2qw==
X-Google-Smtp-Source: ADFU+vvN/wcPPKIp5PaHkQBwl2RN9Ra1c1araaS1iOkyVaJDdcWSos4k3JEL50Yj40BdEIJrwcCNCVArAYW0s3YRVCU=
X-Received: by 2002:a67:cb84:: with SMTP id h4mr5422265vsl.85.1584021524408;
 Thu, 12 Mar 2020 06:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
In-Reply-To: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 14:58:33 +0100
Message-ID: <CACRpkdbq9aTkf6-DctXKabyd2=Rr8GPii02_8jQP49SFuTo_SQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: dwapb: Fix reference clocks usage
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 6, 2020 at 2:25 PM <Sergey.Semin@baikalelectronics.ru> wrote:

> From: Serge Semin <fancer.lancer@gmail.com>
>
> There is no need in any fixes to have the Baikal-T1 SoC DW GPIO controllers
> supported by the kernel DW APB GPIO driver. It works for them just fine with
> no modifications. But still there is a room for optimizations there.
>
> First of all as it tends to be traditional for all Baikal-T1 SoC related
> patchset we replaced the legacy plain text-based dt-binding file with
> yaml-based one. Baikal-T1 DW GPIO port A supports a debounce functionality,
> but in order to use it the corresponding reference clock must be enabled.
> We added support of that clock in the driver and made sure the dt-bindings
> had its declaration. In addition seeing both APB and debounce reference
> clocks are optional, we replaced the standard devm_clk_get() usage with
> the function of optional clocks acquisition.
>
> This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
> commit 98d54f81e36b ("Linux 5.6-rc4").
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Hoan Tran <hoan@os.amperecomputing.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

I like these patches, once Rob is happy with the bindings I'll be
happy to merge them. I haven't heard from Hoan Tran in a while,
so if we don't hear from him this time either I would suggest you
also add yourself as maintainer for this driver, if you don't mind.

Thanks,
Linus Walleij
