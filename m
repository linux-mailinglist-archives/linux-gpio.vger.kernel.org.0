Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E31E120288
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 11:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfLPKaI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 05:30:08 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:32876 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLPKaI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 05:30:08 -0500
Received: by mail-lf1-f68.google.com with SMTP id n25so3842672lfl.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 02:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAZ66aTL4botjOAzyywFJUSCyL81NlmcXv7uzteZ4R8=;
        b=MNDQAaFQhnjUWeVovtaucXzv5IniCaNpgTqcGXFx4jLe9x12jIYadC1PDnKMkPQDMK
         l2ehosXgsMnxhudijyOvnJ+2vzbUWEIeHPFUriZ0paYwJfnoOn54P2B+sQklEVWVQcw4
         1T13ARTxSHB4SWDKf+zLThCGQ1iXcfpXnb6ACQsNk7u2HJXgpABr6a2qReZ5vfuS007z
         NjpK9Bhvzu5DQHSzVNXdv0/U8izrlloNKK1hMI5lpzL6sQzLwNTL1SIjwhP6Zna7Ivxv
         ewXg9sokgFFnzWqgeMrYd7orbCOiTcx9is4y2ZlEFFndxObGz4NfhSy7ItC3L8XppQCW
         Mw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAZ66aTL4botjOAzyywFJUSCyL81NlmcXv7uzteZ4R8=;
        b=AG130HAHjOtN2ryNcJX2imYlZcpBn8L2rK5nckU4DN+kX4twMKuEQQRJ5Z5S/YwUYA
         z8Ka4ANT9t3SJYMhWiwzG09rkAlJIcTFtzGvL1AC7b8ltqZtz68Km4K8sxU23thedPLJ
         SsuPXbyllEy4KNVywUABuZ6cYUlDFu2lRxrthj4+qLy3tNBaSGaJH6Qgzs93CYQvo0+C
         0CRNXmZ+l4DBFxT53JfcIjmKbEkv7x5tySgqaQcTs5s0h/FD6AcrVb8oozqz0g/Ifnai
         MG8HzIkN3IdipX0VCWvkbNS6A/7NqwOwOFzqlGVhZxtUMIQ/fMLI76DjjDIyXlXxOI3Y
         Dq9w==
X-Gm-Message-State: APjAAAWoAbu6LR9Ss5Rqa9G+PnLiz9ea3vZn+wJ4epuqmOYGwtwLecny
        lk3Te6Fb0KW9qudZzvogJBy3P3kqPyWBecoX0vTNYg==
X-Google-Smtp-Source: APXvYqxlD1vfPmZyf5Z5diCSQWuPAUZ5VXeaBxCzjkY1MrbIYOP/373nkrVwCGdhAD+O1kDqu2EG46B1jbTPzJyZdoo=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr15738312lfi.93.1576492205964;
 Mon, 16 Dec 2019 02:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com> <20191215163810.52356-6-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-6-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 11:29:54 +0100
Message-ID: <CACRpkdZCehawbGz+dELgjte6pTz0oEFQ3mo-2FuM4CQwm58tHQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs on BYT
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 15, 2019 at 5:38 PM Hans de Goede <hdegoede@redhat.com> wrote:

> On Bay Trail devices the MIPI power on/off sequences for DSI LCD panels
> do not control the LCD panel- and backlight-enable GPIOs. So far, when
> the VBT indicates we should use the SoC for backlight control, we have
> been relying on these GPIOs being configured as output and driven high by
> the Video BIOS (GOP) when it initializes the panel.
>
> This does not work when the device is booted with a HDMI monitor connected
> as then the GOP will initialize the HDMI instead of the panel, leaving the
> panel black, even though the i915 driver tries to output an image to it.
>
> Likewise on some device-models when the GOP does not initialize the DSI
> panel it also leaves the mux of the PWM0 pin in generic GPIO mode instead
> of muxing it to the PWM controller.
>
> This commit makes the DSI code control the SoC GPIOs for panel- and
> backlight-enable on BYT, when the VBT indicates the SoC should be used
>
> for backlight control. It also ensures that the PWM0 pin is muxed to the
> PWM controller in this case.
>
> This fixes the LCD panel not lighting up on various devices when booted
> with a HDMI monitor connected. This has been tested to fix this on the
> following devices:
>
> Peaq C1010
> Point of View MOBII TAB-P800W
> Point of View MOBII TAB-P1005W
> Terra Pad 1061
> Yours Y8W81
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
