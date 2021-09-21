Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9514413A15
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 20:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbhIUSaB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 14:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232866AbhIUSaA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 14:30:00 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064DDC061574
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 11:28:32 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i25so1223395lfg.6
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 11:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tNDTDkoA1nai2H4bJotd/Jrzpnm6BZIrLYn0AmV9uHE=;
        b=smN5E0cnEjM0PCocgoJcbNv+E5ZU0d6JtJoR+OUUKao8VrxJx7GXRJMtJ3t0rkGlFh
         iZJqyPZOHlamUFum/rCLjzOTe9FzLmrMj/PmVCgiXttr12lShol1oyuu9MDSOHiYOsjf
         PRdiuUCaXlTfHWvNqeEzrfPRRVUk3GG0akD9wXQfMO3HTfE9+yPd8w3eWCcB44bwIpBp
         sAbYsuTgptSVZczVBRopIG1rz2nH0rn49rXM8vBeHNXYruvV9tRzgT+4OLhLhYZv9uZZ
         0NdFmXdSHT+K9uITvtDhHX5u5zfKok6nmmxFfLNErPnnjFeKivwkl6a4A07Zaw09eZN0
         k9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tNDTDkoA1nai2H4bJotd/Jrzpnm6BZIrLYn0AmV9uHE=;
        b=IrQ5EiNs/aEjqrL2p2Kbl2V+gtS2cWn+X/7x+l/Q8WXkj6T+HVUKFkvIOqHUzk35it
         91sfdYkydQMAG9bv+QtWRneDIpVafs2kFRwr1VKE8MZhqkmc4Y8qM3/+JQTtYrxy7sKS
         p9qZHL7z6HXPl0sRZBD/S7WXLdqlDoZK1EfOROIVbirlpaV961271jxBXEJFCNxXGIkf
         Dg9tJiDVX5JFItDd44zhMZr53N0FtDnST349nfa0lNpR4aIDs6dVwI0S/dkb7sEUdkZG
         W752zo3qUf2sl2MfAtLqsvUynxXqeFYGd/MRRGsjJ1OM+qvWeO9B8SYOhZCmkto1teP5
         WBnQ==
X-Gm-Message-State: AOAM530Ubwmrel+wnNt088i4jlBFzgzjcow9by6RpcDgJJo2NMSN/nq+
        OVKlmRuDAYB8xBw0q5Ll3zbR0tGyiINvfQHulrqomQ==
X-Google-Smtp-Source: ABdhPJyixqszjd1/b0kkjO9g4M6zbeV7EEgBZ5X0Wij/xpE6BHq8S6FR53SOFQ85HK4ZCXOfSmx/QTL/r1U/43SnWqA=
X-Received: by 2002:a05:651c:4ca:: with SMTP id e10mr30479729lji.259.1632248910387;
 Tue, 21 Sep 2021 11:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210816093856.12313-1-hdegoede@redhat.com>
In-Reply-To: <20210816093856.12313-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Sep 2021 20:28:19 +0200
Message-ID: <CACRpkdZ8ngakZhbrJp=OjcayLJ4j7C9gqb72N18fHExtMT7gNg@mail.gmail.com>
Subject: Re: [PATCH regression fix] gpiolib: acpi: Make set-debounce-timeout
 failures non fatal
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 16, 2021 at 11:39 AM Hans de Goede <hdegoede@redhat.com> wrote:

> Commit 8dcb7a15a585 ("gpiolib: acpi: Take into account debounce settings")
> made the gpiolib-acpi code call gpio_set_debounce_timeout() when requesting
> GPIOs.
>
> This in itself is fine, but it also made gpio_set_debounce_timeout()
> errors fatal, causing the requesting of the GPIO to fail. This is causing
> regressions. E.g. on a HP ElitePad 1000 G2 various _AEI specified GPIO
> ACPI event sources specify a debouncy timeout of 20 ms, but the
> pinctrl-baytrail.c only supports certain fixed values, the closest
> ones being 12 or 14 ms and pinctrl-baytrail.c responds with -EINVAL
> when specified a value which is not one of the fixed values.
>
> This is causing the acpi_request_own_gpiod() call to fail for 3
> ACPI event sources on the HP ElitePad 1000 G2, which in turn is causing
> e.g. the battery charging vs discharging status to never get updated,
> even though a charger has been plugged-in or unplugged.
>
> Make gpio_set_debounce_timeout() errors non fatal, warning about the
> failure instead, to fix this regression.
>
> Note we should probably also fix various pinctrl drivers to just
> pick the first bigger discrete value rather then returning -EINVAL but
> this will need to be done on a per driver basis, where as this fix
> at least gets us back to where things were before and thus restores
> functionality on devices where this was lost due to
> gpio_set_debounce_timeout() errors.
>
> Fixes: 8dcb7a15a585 ("gpiolib: acpi: Take into account debounce settings")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Bartosz will pick this up I think, I'm a bit off duty with GPIO right now.

Yours,
Linus Walleij
