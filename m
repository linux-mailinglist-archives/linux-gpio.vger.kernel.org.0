Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1D95169D8
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 20:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfEGSD2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 14:03:28 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39106 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfEGSD1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 14:03:27 -0400
Received: by mail-ot1-f67.google.com with SMTP id o39so15810796ota.6;
        Tue, 07 May 2019 11:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JPY4MNS2RU9Z7127GFID4Lx/B6dOG3nVMga0YqQtB8c=;
        b=dEjPu79oBosxszWQphXSKUqe7G1xsSPgFhtqj4tKfyqpcctSiuhn/Fb66s9jXMolky
         3/vX9dPKYZDNBS3w5AuB+6GiRdByvIdADIWDyE7qfX6CiEnXiQ1T7ivdnnJOwldqBkVc
         v4lg11BczqJr454iyBOORvN47uUdLjtHzwdH+LIoqXvoPLjAAJX7O+TDhzFG2LiiB3yh
         zQ4GjQsfw0RpbY3v/M46MMcHlhLjUYoVg74+42B5FPKdr3eIAnCirn378EZL8byrbbXO
         yf7c9bL7D7lktp6PPblQIUTjIK354FWIpLlgXoL0KCyS9maY19pcygF5NeXUlWJJjaRH
         WwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JPY4MNS2RU9Z7127GFID4Lx/B6dOG3nVMga0YqQtB8c=;
        b=sFzjQLDdHlZTDJRSXXqzz3jDzuK2cHNfnslWEz0kJ3keH9y7jTXsAK0IzEHytFaZ5F
         UhlW0UrwMBD3PoSTD3+o5GdHssQAy1tHe+inLjY9zLpxautUdMT0vBqFdqHgNxohe/YN
         3ZzfLW0M3UNyz4LgZsMpp0F3q8DV9Ga73HX5kUnVCNEZpZJmU6Oe7SlCJQu2eDV0TG8l
         bAvTvijZecNLFgLpdE46lK9ZTTPcJy9UfQ2ZSjsN5hrNY2K2N6IxyVKdEd7ZYY0Syl0o
         3izTJR3R2szPFQdkt9X8n3Q0XQnknkBWNHsYkfPrvtOcRwrPTxpFAv6Yjkdtf9CN1RXD
         1RlQ==
X-Gm-Message-State: APjAAAVRphbPiEuan0Eiyb9xCHwP0qinGSVZDoRyzozRrLwwOmc2NabK
        O2LLAZHphpFD1QwJ8K0edQUbdkTpvzHD2915UgY=
X-Google-Smtp-Source: APXvYqw3QBhK8LJY1eO9eY8Zl3pQCD8whSaY67O+KAJ6VK+cZrA3KkKtchg9DDHLc0L3WQpNu0M/382cG+WBidgDFb8=
X-Received: by 2002:a9d:4e97:: with SMTP id v23mr22088662otk.148.1557252207032;
 Tue, 07 May 2019 11:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190507115726.23714-1-glaroque@baylibre.com>
In-Reply-To: <20190507115726.23714-1-glaroque@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 7 May 2019 20:03:15 +0200
Message-ID: <CAFBinCBeqW7NLyFygB5vi5a+KGcez8q5Hy1e7MdHmaWLv7KmkA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add drive-strength in Meson pinctrl driver
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
>
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-uA". The change to do so
> would be minimal and could be benefit to other platforms later on.
>
> Cheers
> Guillaume
>
> Changes since v2:
> - update driver-strength-uA property to be compliant with DT documentation
> - rework patch series for better understanding
> - rework set_bias function
>
> Changes since v1:
> - fix missing break
> - implement new pinctrl generic property "drive-strength-uA"
>
> [1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com
>
>
> Guillaume La Roque (6):
>   dt-bindings: pinctrl: add a 'drive-strength-microamp' property
>   pinctrl: generic: add new 'drive-strength-microamp' property support
>   dt-bindings: pinctrl: meson: Add drive-strength-microamp property
>   pinctrl: meson: Rework enable/disable bias part
>   pinctrl: meson: add support of drive-strength-microamp
>   pinctrl: meson: g12a: add DS bank value
>
>  .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
>  .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
>  drivers/pinctrl/meson/pinctrl-meson.c         | 177 +++++++++++++++---
>  drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
>  drivers/pinctrl/pinconf-generic.c             |   2 +
>  include/linux/pinctrl/pinconf-generic.h       |   3 +
>  7 files changed, 195 insertions(+), 48 deletions(-)
I gave this a go on one of my Meson8m2 boards:
[Meson8m2 doesn't support drive strength and still boots without any
crashes or obvious regressions]
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
