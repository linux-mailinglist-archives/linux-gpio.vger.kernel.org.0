Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1208ED12
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 15:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732379AbfHONjW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 09:39:22 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46871 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732299AbfHONjV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 09:39:21 -0400
Received: by mail-lj1-f193.google.com with SMTP id f9so2223781ljc.13
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/SOlumz6vk2Alm/CYh7S2Oejxh0Xe/C95oR58raMHnQ=;
        b=Bqv5iBRPvFl2b9VdsUGma7yaA5FL4jWGwfAzscFHwHgVn2LkIz6NuqRaS3ifedqu7t
         Zl7nkg7Uvq2YawfNEJDqo0IYmfIhnGM6j1EU/ZuUjmua4FPdl6LRWb6bSeIV+U0Sy44Q
         sROgcq6zOpSCERywNRarUg2G+rFt2vOyPf9FWZmSyerZuCp8sAqpkmh3gJONeWc4aH47
         JwsXgTRJArkMPd/jBm9NQ9aNekx8d+hIw0V02KXdw6uP/wWAr+bkxjv5FWgCcCPAzN5b
         +79RHCgxN2dvNUlunVHE72i3dFzwn0IA3O/C+Qz/QpA1t4b0CAGIa20oHiT1OEqgIcR1
         ulLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/SOlumz6vk2Alm/CYh7S2Oejxh0Xe/C95oR58raMHnQ=;
        b=AamUCVTlpfNCuHMInyK+C9uPjop1YODxcPxg+CdmH6ckA7p3bM5QFn1Pnz8lqTfRWU
         G3ks7Js4ih9UGY+KY2N1DGcUqw4ocgNnlqNaO5NWBEAgppZEL56ZZ2PNnyzU6Gq+Blvw
         EzT7tb3AxHK1zT8EAIhZKCI/DOK2IocEyJb7O7wvM11VEBB1ST1ui4D8Jv01SXaIYcsD
         CUHrdJ1/Et1rZnUFi8FxvPn4NBfv1aYQfHSuLKcf2lgR6wTdOEGRmI9BnxQSIKUIUInI
         GPTpUj+XGV+LKtgFW6ell37oKNTXD7VCzAFQUVdPABgkyS2iNPvx5pSFfBvHkt6M7Nfp
         OLrQ==
X-Gm-Message-State: APjAAAXziMXmg6t6qMwAGSoWoHN8iBnfvk5oIov07zXWMIPfe52hs8Dq
        L/NFvFxpWQmIOPDZK5iArZEajRMkLdj7lqItE17/ZQ==
X-Google-Smtp-Source: APXvYqwFALZTskPXo6e7NXJ/utTQfhrRgdFbqggPbykgoqXnV4m7nNI5t8VLZQOj3hti8lr1yIIaXwLEq2Y74hb9jMA=
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr2771959lja.180.1565876359961;
 Thu, 15 Aug 2019 06:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <5D514D6F.4090904@hisilicon.com> <CAHp75VcKNZeq80hw5qjKKuh8Qg=WUrXPSpcy6yx5h-_7RHah+g@mail.gmail.com>
In-Reply-To: <CAHp75VcKNZeq80hw5qjKKuh8Qg=WUrXPSpcy6yx5h-_7RHah+g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 15:39:07 +0200
Message-ID: <CACRpkdbJS-b4E84qU7Knt7ND9WHwKh_d1MdawrFf4Ht_MHt2xw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Fix the issue failed to register the ACPI interruption
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wei Xu <xuwei5@hisilicon.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Linuxarm <linuxarm@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        John Garry <john.garry@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Shiju Jose <shiju.jose@huawei.com>, jinying@hisilicon.com,
        Zhangyi ac <zhangyi.ac@huawei.com>,
        "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
        Tangkunshan <tangkunshan@huawei.com>,
        huangdaode <huangdaode@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 15, 2019 at 3:10 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Aug 12, 2019 at 2:30 PM Wei Xu <xuwei5@hisilicon.com> wrote:

> Linus, I'm wondering if we can do this for all inside the GPIO library.
> Thoughts?

If it's supposed to happen exactly the same way on all ACPI-enabled
gpiochips, I think it is more or less mandatory :D

We need to be sure we're not gonna have to quirks for misc variants
of GPIO controllers down in the gpiolib-acpi.c as a result because
some ACPI-thing is "standard not quite standard" though.

Yours,
Linus Walleij
