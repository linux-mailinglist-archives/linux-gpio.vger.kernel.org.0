Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2FD42067
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 11:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408175AbfFLJL4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 05:11:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41991 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408423AbfFLJLz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 05:11:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id t28so14398253lje.9
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 02:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mYym2l8mqAEx5DPcwNMYFMU/GTCZC3cLzsLhFQIJHOM=;
        b=dM4y3ztI6yt1g4hASKxq2snbEX1K68CjUC6gTHWe+9d9vvdCjc0Hyb7Tt4SFpWfMnZ
         PP/1qBniNFTnD2xxgtG3ZnHDp3pAvcZ0c8KOwrNuqHiEukY0hi7MsorGkKtlPbbpBMyF
         epma8V7XicgRJLPbSvVz0Bb5ZAXr/qBaK4wG4k0ftrVRFJ+4phQYjdYLRjOhAVFwa7Wx
         T+Buc4YW4OtkNrK67CwaDSfapcUXfthRM4P8N8fGIE3Yzxk3j9Jn7CKZJxbXXdvAknSN
         amls9/vG09ZfIzWpnAPHn5suPlmmYG8YDi92WVUyX4FsL/+D9JHImhzF8Ietl15bSNTC
         G7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mYym2l8mqAEx5DPcwNMYFMU/GTCZC3cLzsLhFQIJHOM=;
        b=StEIELXuC0P13u8Yn91+Q4Zrm6KuEk2ulvfma1OgYBxZB9tH0SWnZ9M8BbGqvFYnxS
         mzmvk9AJBT+rL/lCiEq8HKWmscXi1s/gT4lCzeh4y75/sw32kpaBj7VmxTw2pIeiYukO
         CscIC1Q6o5RArJPvUKDFkDlOSOcYNBzNkr7DaVIULV+7q137d25WZhyenTTEQMfBxd4G
         s4tp/EHPYe6qysLXXEQUOGPaG5zjvbML2m35GbgAxy3fvXisGgHGsmV5P1A+FUqYyZwI
         /nYy2ZPt4+uTnCyJcUO/hIye8V+QY3PFfbnfKR+e5vhriDz8lA43VpD1g8RCmIZFL5Uu
         1yTw==
X-Gm-Message-State: APjAAAV2BxGXNEXYntFWvuN96tqokvVD+nO2MUXbWxxHQjuuJBDrS/Ty
        NlRQ9MLJp9/FKDYfEJrU24OtIJoazd2zqBv6UYkxW5p2wCkveg==
X-Google-Smtp-Source: APXvYqxPQeP+YZhtl1yArUP/kEZEaq45Z/0+ctNo29822y9vO0QaRlGNPkN9752MhVjSxAx4U3gKOqJrOx5tmU+Q5gs=
X-Received: by 2002:a2e:480a:: with SMTP id v10mr5624585lja.94.1560330713660;
 Wed, 12 Jun 2019 02:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-21-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-21-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 11:11:41 +0200
Message-ID: <CACRpkda2FhYNYA2TkVANOF5GWd3hE9cqM7N_pFDFj9nh-fh=iA@mail.gmail.com>
Subject: Re: [PATCH-next 20/20] gpio: gpio-omap: clean up register access in omap2_set_gpio_debounce()
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:13 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

At your convenience please look at the debounce function a bit
closer because I think there is a bug/unpredictable behavior:

IIUC the whole bank/block of GPIOs share the same debounce
timer setting, and it is currently handled in a "last caller wins"
manner, so if the different GPIOs in the bank has different
debounce settings, the call order decides what debounce time
is used across all of them.

In drivers/gpio/gpio-ftgpio.c function ftgpio_gpio_set_config()
I simply reject a dounce time setting
different from the currently configured if any GPIOs are
currently using the deounce feature.

(It's the semantic I came up with but maybe there are other
ideas here.)

Yours,
Linus Walleij
