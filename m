Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3141B3EA6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 12:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731039AbgDVKaE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 06:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730765AbgDVK0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2020 06:26:45 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E01EC03C1AA
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2020 03:26:45 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x3so837821pfp.7
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2020 03:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+LkW/BzJ32FsN2pGJCrXVy4OKBpG4PL3ExgFBZeWAHg=;
        b=l/AgPPBVB7ZnyY6U66gMOrbJvBgO3tQRcVjGDqLNEBuZMo0KRrdys14l5NrYS2uqIb
         TBmsxmEicXKLeUCGAnLzeuOJkVu5w8L8TZgR4gHKWn/0MJHFk+9T3pv9vi2QHq6g8oNa
         D1iZtgy8CyjNCJQqw0mjxle4ztTML67IsaPgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+LkW/BzJ32FsN2pGJCrXVy4OKBpG4PL3ExgFBZeWAHg=;
        b=f+28uw+e2cbJvqdc2U80aY0ZGn6t39nPzamzyEABh6W4QH4lUDyvzeEvpYsIp6vQlV
         SA5NdI9OHoAaLXv1pvu63Go4WkE4ZfzOdsOxg1PhYMDDrUrpuoi1yU/nR3ksW5Xm/f7o
         VyVqrHePugarMzDDOPuE2HvNEXLfQ19li8XkF0ETp8fBRK/4Z98HqXFf3x4xyxV0OIfb
         nktsrYXrAZBA0mx1aS2mWAqXK1LDxmArvyfU3MkwVrisvNfMUoKV9nC+xj55sGPAEIqx
         lOpTKQLN4DCYxiRDnnQEECPVXShqUcI9Hydyd63SuOVDIw9j3SQFQUoRgYoMqB9MO0Y/
         bJvQ==
X-Gm-Message-State: AGi0PuYNRItG/gBQds/1lPkMpCvfmYyItpu7wRFR72qdzcwOxswx24qt
        wz/m2HYvIzD/8q4DvMT+mrm0wg==
X-Google-Smtp-Source: APiQypLib3O6RbgwVKPe4RvKuaAL9L9i2kDZxvwLTOMEd5N7BqAlzniwrFclGQhmjQRCmw7yE1+ZTQ==
X-Received: by 2002:aa7:96e8:: with SMTP id i8mr26630487pfq.222.1587551204530;
        Wed, 22 Apr 2020 03:26:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i6sm5080712pfg.138.2020.04.22.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:26:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200420220458.v2.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
References: <20200421050622.8113-1-dianders@chromium.org> <20200420220458.v2.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
Subject: Re: [PATCH v2 5/6] dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        jernej.skrabec@siol.net, bjorn.andersson@linaro.org,
        robdclark@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, bgolaszewski@baylibre.com, daniel@ffwll.ch,
        linus.walleij@linaro.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Wed, 22 Apr 2020 03:26:43 -0700
Message-ID: <158755120316.159702.16847202705854698366@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2020-04-20 22:06:21)
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has a dedicated hardware
> HPD (Hot Plug Detect) pin on it, but it's mostly useless for eDP
> because of excessive debouncing in hardware.  Specifically there is no
> way to disable the debouncing and for eDP debouncing hurts you because
> HPD is just used for knowing when the panel is ready, not for
> detecting physical plug events.
>=20
> Currently the driver in Linux just assumes that nobody has HPD hooked
> up.  It relies on folks setting the "no-hpd" property in the panel
> node to specify that HPD isn't hooked up and then the panel driver
> using this to add some worst case delays when turning on the panel.
>=20
> Apparently it's also useful to specify "no-hpd" in the bridge node so
> that the bridge driver can make sure it's doing the right thing
> without peeking into the panel [1].  This would be used if anyone ever
> found it useful implement support for the HW HPD pin on the bridge.

useful to implement?

> Let's add this property to the bindings.
>=20
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
>=20
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboar=
d.com
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
