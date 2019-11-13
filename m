Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD296FAD6D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 10:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfKMJqi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 04:46:38 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37538 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbfKMJqi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 04:46:38 -0500
Received: by mail-lj1-f193.google.com with SMTP id d5so1809824ljl.4
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 01:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+cg+dFsf3+O5tJbSKH0xgJrZytMw8Ay4OxSVJ8hJ43I=;
        b=ptoB+OBsGbbjSmVpsiR4Coeub7w23S5/am91w2li5Vh0SOqKfxWYpxrrof9i5tqqCS
         QYVnN0khE2DpiTFeeQHvJR31hOAXdelBkRVLOeOrEaMnz++Kex/z8bJDZOCjDVISPdqN
         0V5tUSgB6hJVRa3UbZzr4JetDmwfF2AtfbzqsilwhSz8lO02DRPypXxfzQpEB/cRgTRz
         lo86oEkORb1aTbA4cTurLTfd7p26elxpMvbRL+u3VKfiD50KSDpy88OMdo3W1tA3XDbf
         ADd7SiSlYbZCfEzgqI0w9BQsimC8SiNg4xJCjzYwnZA2HI3O6KlwdAECCT2CPqeq8h13
         jeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+cg+dFsf3+O5tJbSKH0xgJrZytMw8Ay4OxSVJ8hJ43I=;
        b=iUi1+ijPB8YyDsbRjZvUT1uGq9DIwEvRb+2Xd5flRBso7KaCghF1TJqXwPT2j68v+y
         u0L3zGex+TNAKcrjBLxh5hI33ZlQgAXtvXb3r9GbsPIfZgJLEr1PtTIaF4k+kWN2fIEi
         ga3jZozSLAs8IQaoq2/Ye6VQCRdLhblMbb2MLKuUYB9TX9bvJ15D5nJ6PypcNMQLEAcS
         L5ldQSmto2tirJdxcSjFQc82dzvAK0Nb24OK4T7fLEgFhu+IevM1ezFVPVTVb8rjxmhL
         l103HJC0l5lhlb1lRfxLUdHehA+5VTASUYEBiEX4mW4q/+vjYduzbdOoHpVyuBizO2Sp
         HhNw==
X-Gm-Message-State: APjAAAWbQi6nM/TcoK4+ID+0s1YdsxOeo6R/Zu9J5O4e29pIVw2ZZ9It
        QxmPbbyktaGgzkk7uuBH9hPbXISDmZcb1kx5OGKtvQ==
X-Google-Smtp-Source: APXvYqwWFJmpMsYl8aQSKTVCaKhtns6Y85LNUXyzrxaTiaV3IS8qKoP/tEiLhs/T61vYb7M2VoMvAmlNlesIe4PyqYA=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr1847426lji.251.1573638395983;
 Wed, 13 Nov 2019 01:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com> <20191105203557.78562-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191105203557.78562-4-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 10:46:24 +0100
Message-ID: <CACRpkdZ9A+VjUX8kyOQ0SYWXu8VD+fVdthsgGbdZWLDzYuU_nw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] gpiolib: Introduce ->add_pin_ranges() callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 5, 2019 at 9:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When IRQ chip is being added by GPIO library, the ACPI based platform expects
> GPIO <-> pin mapping ranges to be initialized in order to correctly initialize
> ACPI event mechanism on affected platforms. Unfortunately this step is missed.
>
> Introduce ->add_pin_ranges() callback to fill the above mentioned gap.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I also think DT drivers can benefit from this.
I expect this in a big pull request :)

Yours,
Linus Walleij
