Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE781BBD88
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 14:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgD1MZ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 08:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726794AbgD1MZ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 08:25:56 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45024C03C1AD
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:25:55 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 198so16751297lfo.7
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y3CrBoDpzGJjyKIi+DpjYHt2NK5y8m5CojptJRFb0pU=;
        b=FQrwhGKLvaQDgj3OcQS2/tAhntXv2Kzc5Rg7N9I4UbMU7paoSFg+yWGK06VYXhk/1o
         UwCdQZj3Rd67ss3sinoBLCJy2qr7lmIyRw7vsb68gstUo6s2Tfc5KoG7Dt5BC8e7kcs3
         HECCE/eK6Ck9uQMuTnEx+SKE3hwkXSzz5QDl8PcB7GQe6LlgLtHpBeRXZEvuau2/jvln
         E8cQEmyO6jGOLaD2MTc6nOrs/AJ5el8oWlAnxoCF1nEhqYdoQKWTszF3dV096mo1IRMa
         jlxA1WJb4+Gkzm6GmWEs8cxFcyRseknKOUsSh6cTxq9cKWqEbEkr1vIRntp4Anapy6pO
         Hgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y3CrBoDpzGJjyKIi+DpjYHt2NK5y8m5CojptJRFb0pU=;
        b=ZHKIM40WYPIrXWjhii8Ks6deDHYV1QX98kWzH6FNQ1y8Y1nOIl8yiAlxch4BNlViP1
         oHXRgnji66xTlWzk2yFWuZn3tCI80dHGFDyQPVDbBHnn3DMgemzlh6vUgm0W4iq8jlDD
         DZ1X1fM0p221oGfzm2dUM43E8zIrfWctKndxk70QgO9CodM3swCaDy73vIM6ukEGtq6p
         fKbN8xmtR29DX3RQ/sVwVnKkwAHs6DiUkiY5SCo4TFNYoFl71UkCKj7ChNXa8IlaEEOG
         0BhAeVIj1Ixb/vbKxZq1Jp8sApcMUs8rXG9qbpLDAuWbZ3XeGpptUNivtiUDZox+sbtx
         +Ttw==
X-Gm-Message-State: AGi0Puau15So8eJfjJX30yhIoHjlBr7JqsolOkK5HmX5gTfYeLSOAPho
        i3V/qFcVUVHEl9o0lZoTv9uIJyoneGoSw80McYHUUUzN
X-Google-Smtp-Source: APiQypLPb2mAHpSsIdPNB3D7OVgcTv0eVuKODtDnL03qMl/e3W2QqNgeTth6RsbPQYrzCLTfa1qEof/jAdPKF+ud1Kg=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr19280291lfp.77.1588076753555;
 Tue, 28 Apr 2020 05:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162548.129661-1-dianders@chromium.org> <20200423092431.v3.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
In-Reply-To: <20200423092431.v3.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 14:25:42 +0200
Message-ID: <CACRpkdZkRKgRo2-pxiyoz-3W_aoR+qb+AA-4+ZaPtt2Ykecs0w@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 23, 2020 at 6:26 PM Douglas Anderson <dianders@chromium.org> wrote:

> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has a dedicated hardware
> HPD (Hot Plug Detect) pin on it, but it's mostly useless for eDP
> because of excessive debouncing in hardware.  Specifically there is no
> way to disable the debouncing and for eDP debouncing hurts you because
> HPD is just used for knowing when the panel is ready, not for
> detecting physical plug events.
>
> Currently the driver in Linux just assumes that nobody has HPD hooked
> up.  It relies on folks setting the "no-hpd" property in the panel
> node to specify that HPD isn't hooked up and then the panel driver
> using this to add some worst case delays when turning on the panel.
>
> Apparently it's also useful to specify "no-hpd" in the bridge node so
> that the bridge driver can make sure it's doing the right thing
> without peeking into the panel [1].  This would be used if anyone ever
> found it useful to implement support for the HW HPD pin on the bridge.
> Let's add this property to the bindings.
>
> NOTES:
> - This is somewhat of a backward-incompatible change.  All current
>   known users of ti-sn65dsi86 didn't have "no-hpd" specified in the
>   bridge node yet none of them had HPD hooked up.  This worked because
>   the current Linux driver just assumed that HPD was never hooked up.
>   We could make it less incompatible by saying that for this bridge
>   it's assumed HPD isn't hooked up _unless_ a property is defined, but
>   "no-hpd" is much more standard and it's unlikely to matter unless
>   someone quickly goes and implements HPD in the driver.
> - It is sensible to specify "no-hpd" at the bridge chip level and
>   specify "hpd-gpios" at the panel level.  That would mean HPD is
>   hooked up to some other GPIO in the system, just not the hardware
>   HPD pin on the bridge chip.
>
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Makes sense to me so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +  no-hpd:
> +    type: boolean
> +    description: Set if the HPD line on the bridge isn't hooked up to anything.

I would perhaps tag on:
... or is otherwise unusable?

Yours,
Linus Walleij
