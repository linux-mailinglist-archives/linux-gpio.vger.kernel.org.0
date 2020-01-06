Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2024131C04
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 00:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgAFXC6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 18:02:58 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45420 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgAFXC6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 18:02:58 -0500
Received: by mail-lf1-f65.google.com with SMTP id 203so37442927lfa.12
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2020 15:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PoH3a6UFcev6hSnVLUpMXxu6G3cX+06NWDeSI46eOP4=;
        b=AG+WKiRLIfE4a3Ryt/xpjGAZPcaSQn4bMpbWlqsm88zytaALksIdw8OAY7rkkFI0/9
         oyY2v8tSO1j1bhxa9ioSRY2Gh0bmKOWJI2dHYpfdL2FzqskvARvVPm1VRp/HP598/MxQ
         P50damguECiqf30ejikCqgmTc661ItZy+O+JZ6T3mLJZVg5BH3mmyrkGgmYZA44hkyOE
         IS8ua41bXhtqrkt6enZELSJlgkb5sW7fsNVUK1VxIGL8pS7zoQqQ+D4eTVzWZYCfbsIK
         SlPqr1xQKaYWY1sAV9HVYIaIfGjlGbySTVvKLIy2O8lW9JYnlkUYohgwcbRid8lZHxbO
         5X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PoH3a6UFcev6hSnVLUpMXxu6G3cX+06NWDeSI46eOP4=;
        b=U7DjyjIpS3gCcUGelYKs53AOR97fj6CPQGJpyy8clOksf/mg0NNc81zAnoHKazKmRD
         G4KLo+vtTAllLMenboS4K2wh/wAcvbeTztIOGE3+Kc0x+0KRgLLNK2iCo6fhlJrV4nRi
         TUh8HPyF4bKydA1k3dOotEXW67IAJj25Qe1cDwxmXVzioANSkBJi8kWPy07qe8Bhcz9U
         Q7nQwKhKG7DfR49+rIlCxxlRzzPOTyaRLg7ALyZ4cphoDgExydMXpc2Lf1I9DeuWIsBU
         6o82yTokFZRyKvwljVtHrmqU2ErqLZXtebi1+2BbliyGjDc4UipS+D2MdUfCFC4Kj+zQ
         2t9Q==
X-Gm-Message-State: APjAAAXNfciEV7hfbFP6R6sI/9YkD+/xCe/yQ9Uzw2BZWc7rKLhJNrA+
        3ETRKegrxvzPw49aW79IFbL7TFtmceR8t01dO79UPQ==
X-Google-Smtp-Source: APXvYqztDsiEMPzgq8tia4/g2GReO5Rdoxf4kFUrQqstmxXWTvU9bAoWL4HoosBo1RlFHnQrEHEus6Ink0jFQf9inoE=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr57106508lfp.133.1578351776360;
 Mon, 06 Jan 2020 15:02:56 -0800 (PST)
MIME-Version: 1.0
References: <20200106015154.12040-1-digetx@gmail.com>
In-Reply-To: <20200106015154.12040-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 00:02:45 +0100
Message-ID: <CACRpkdZK7hvqri9NwvWfiittb2+JKJCyutP6MfBZpThJD13CWw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: max77620: Add missing dependency on GPIOLIB_IRQCHIP
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 6, 2020 at 2:52 AM Dmitry Osipenko <digetx@gmail.com> wrote:

> Driver fails to compile in a minimized kernel's configuration because of
> the missing dependency on GPIOLIB_IRQCHIP.
>
>  error: =E2=80=98struct gpio_chip=E2=80=99 has no member named =E2=80=98i=
rq=E2=80=99
>    44 |   virq =3D irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Patch applied for fixes, thanks!

Yours,
Linus Walleij
