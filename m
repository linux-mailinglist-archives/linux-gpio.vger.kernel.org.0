Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBB7E120265
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 11:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLPK2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 05:28:23 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37603 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfLPK2X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 05:28:23 -0500
Received: by mail-lj1-f195.google.com with SMTP id u17so6202784lja.4
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 02:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cu1+Hou8B++1NEwHbXDIcfHUJVKmIeBKoDLkmWPOXCI=;
        b=kiHB4903z0YwS4JpJ1gi73s6446AzmG+vycJ0iyY97WttaKy2iGzEj3edupk5Ytma4
         sCWlfm/Rxehb/LtxMP5pO00Ufe/6xX1+VMPoaDeUggEsVuap1N9u4sw7ssD3nbDI/zFh
         dN0zfPlhE1/4zMCaBTzL/gd9KQ3DvH4mEM32gjjNxRSpoB6R1nRyhA3M6oK/nQo8S0NQ
         IxawwPGhTYhsIrtUIcc1o6o8DCCkp8JVlAAqXKt4UrN8hIBxIyWOi9e1SeoGO6OAwRyX
         KOtMAorX9TkHU5jRK9asVCmhp7qr+l3dHawUJqq667yore78GofGrl8Kxmz4Z39tnvKd
         72fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cu1+Hou8B++1NEwHbXDIcfHUJVKmIeBKoDLkmWPOXCI=;
        b=dpK6GgKjiu73vt3qxLFwzF0yWkDCIgT/0ajXVcSoWS2R9sjqQmMLLVH4qArb3PwwC9
         c2hWG30ODk1pS4ANtQ90pb9ZrmkZKagGXrjxRitWgzsyv8ITfjtHmjrjFks01oRQzxA3
         85hFdLBZwuz0JYrimVAr4keoqIKX0V+wBwJ9r/4fkR0GhPiQ44rdYdX4hRMEmbhmpEM0
         wnYKsl8c0Uyzqan7CLMGlXIwv17jp5yoiXbDYU6BQmiwSwrztX7mZUGqP86RUlBYkpfP
         79A9+b0L66P86W6UQ8xVKOS1LatZN5GN+Ogd8Dq7EHjg++N20EzXBNu7A0eY/YusfENx
         PuOQ==
X-Gm-Message-State: APjAAAVcL7F8k04pQL6kpoyRG3A6fhP9Yb6OaQiS9l+6tWuW5wev7CLd
        EqveK+5F+xNg/+JEYUD0ttOBgga3f0H3PBMB/2kBsQ==
X-Google-Smtp-Source: APXvYqzIK3/hH2FPyLoT1jp9cAXyv3Rqw/xnQY9Cr/V3d9Y+7lqo0CgT1RLffzK4WqPw4AE1exyAkY88bA5xiNu7h+g=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr18088445ljh.42.1576492100956;
 Mon, 16 Dec 2019 02:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com> <20191215163810.52356-4-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-4-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 11:28:09 +0100
Message-ID: <CACRpkdYpg-fE3Kf=VSKpC1VaCzHjt5n31jfqOgRgWzFZ9HYtsA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/i915/dsi: Init panel-enable GPIO to low when the
 LCD is initially off
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

> When the LCD has not been turned on by the firmware/GOP, because e.g. the
> device was booted with an external monitor connected over HDMI, we should
> not turn on the panel-enable GPIO when we request it.
>
> Turning on the panel-enable GPIO when we request it, means we turn it on
> too early in the init-sequence, which causes some panels to not correctly
> light up.
>
> This commits adds a panel_is_on parameter to intel_dsi_vbt_gpio_init()
> and makes intel_dsi_vbt_gpio_init() set the initial GPIO value accordingly.
>
> This fixes the panel not lighting up on a Thundersoft TST168 tablet when
> booted with an external monitor connected over HDMI.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
