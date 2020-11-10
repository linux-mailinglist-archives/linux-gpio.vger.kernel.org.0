Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4011E2AD769
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 14:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729832AbgKJNXr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 08:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJNXr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 08:23:47 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D9EC0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:23:46 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id v144so17419693lfa.13
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=anY0fDmqZf06M51XMjl+y1hfzhD8VdxufKL6ec1avkQ=;
        b=uRDAAQZ2yXEIso6pDZnJjZa23Cttl92TlkscjI2ix8+hgHrYZat15DgQpmmpTVUsBr
         SFmLlTr/CtssX+80JnqUfLqR+sdk+wENKWUyexD+s0Nz56QFXg7JejhEMZGpQo+a68iw
         RdQy/4lENdser8H3Hq/aJobT2wZ1Z9e8RrvQ9+uOhUPDsDQ0v0GqzzzNBiFYmS7mOX0J
         RGKYsw0+lnwai0vohBsBDy1h9mpYcXfYwYtAzkyYxXwvZle4GadAE6T/A9YDbjRmWE8e
         3KwX91ri0vN0bALT+3+jkG2vlVk4g2Yg2YYcoVK9o+cpS5VjDhagbzIMc1DqojWm/DHn
         HI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=anY0fDmqZf06M51XMjl+y1hfzhD8VdxufKL6ec1avkQ=;
        b=dQog/VzC7vO5lmZBneaFXJ94JYKF8UcN1x841zVXDinXWuDEOLQH/uF4WiNwNC9Tkv
         2T1GjyH/I3sSsgxoj28cf75wQSlX1SYDYhY56QTCrKFQwFdtuHYCEAy5XsdAJlpO6yDg
         lCOFqWhMq60+z2zDoMs3rxsjtxiqu97Rol3BbBZ2rL6KRWmwv4UrQNkW0lMxk67Ua2h+
         sBl9yTzmP4SBQD6y3SDygvl+KjZbsBpp3DauoQk2Gtsowujz1qLq3SvxsteSJ1hCOnEQ
         MKJlS32aPg5DvoM5Ty0LzGZQjs8olmYbAePodlic1y0fnBqZt5zpbHmg7HOtF1ChUOga
         +GAQ==
X-Gm-Message-State: AOAM531L7xzDT8IYwC35y3bxj0GnndXnLsr+KQbxZWMQpLUJxiY2ImKb
        2k8/RoOLYrXst9ascNbNE1WGvhtCI8o13aKBzhfH5g==
X-Google-Smtp-Source: ABdhPJxjroiQ9eW/8CTijDlNPTQGqbxPragcT+vzN69RiXln2dVGzasUsN/OXpEtnpfBivHVFhkzHt/1o9oRa2P6G20=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr8180050lfc.260.1605014625078;
 Tue, 10 Nov 2020 05:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20201105231912.69527-1-coiby.xu@gmail.com> <20201105231912.69527-5-coiby.xu@gmail.com>
In-Reply-To: <20201105231912.69527-5-coiby.xu@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:23:34 +0100
Message-ID: <CACRpkdbNDQrZYx=B7fuc34j-5Mb0=h8VnFROQYHD5DzX9Orb=A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] pinctrl: amd: remove debounce filter setting in
 IRQ type setting
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        stable <stable@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 12:19 AM Coiby Xu <coiby.xu@gmail.com> wrote:

> Debounce filter setting should be independent from IRQ type setting
> because according to the ACPI specs, there are separate arguments for
> specifying debounce timeout and IRQ type in GpioIo() and GpioInt().
>
> This will fix broken touchpads for laptops whose BIOS set the debounce
> timeout to a relatively large value. For example, the BIOS of Lenovo
> Legion-5 AMD gaming laptops including 15ARH05 (R7000) and R7000P set
> the debounce timeout to 124.8ms. This led to the kernel receiving only
> ~7 HID reports per second from the Synaptics touchpad
> (MSFT0001:00 06CB:7F28). Existing touchpads like [1][2] are not troubled
> by this bug because the debounce timeout has been set to 0 by the BIOS
> before enabling the debounce filter in setting IRQ type.
>
> [1] https://github.com/Syniurge/i2c-amd-mp2/issues/11#issuecomment-721331582
> [2] https://forum.manjaro.org/t/random-short-touchpad-freezes/30832/28
>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190
> Link: https://lore.kernel.org/linux-gpio/CAHp75VcwiGREBUJ0A06EEw-SyabqYsp%2Bdqs2DpSrhaY-2GVdAA%40mail.gmail.com/
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

As I have applied patches 1-3 we only have this one to land.

If Andy or someone else needs to take it through the ACPI
tree you can add my:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

If I should apply it or if Andy sends me a pull request, just
ping me and tell me what to do :)

Yours,
Linus Walleij
