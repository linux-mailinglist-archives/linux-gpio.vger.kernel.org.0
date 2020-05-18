Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5031D7BCF
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 16:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgEROup (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 10:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbgEROup (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 10:50:45 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35140C05BD09
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 07:50:45 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id w188so2484975vkf.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vj5hFUhDBM+WTe+cSvcyWy4V3k81csR6btS7gqnvFts=;
        b=Jrc15CIyMGrpxchQkoru3VPYc3/uY7cZk9vGSavx2jtBOkFEE38CcYFo1RXr6ZSaQz
         UvMh+07QfmLmc5fll3AkAs2J22pn7JoeaCJMsHAx6cZwrc1e8qKEhmZ01SMT4yKxWtYL
         dPM5iIU4kBbNX9E4OKphGUxKVEK2sB8ORdL2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vj5hFUhDBM+WTe+cSvcyWy4V3k81csR6btS7gqnvFts=;
        b=bIdUNiNgaVyi7n1Un8A787xidkmqpYYbf8X6IVRxzOC8aGPR4tDwKBArwG29lvEOLz
         Rl53MzTBLZK26anCb3ChWHSjXUQ6mhtcxiwgGYDTASDv//doPHVasy0nMn0o3Iim5Dj+
         4L8H0PK8bAObz9esqI8qlCj0mFcKYXBWHT7ABuPZscLJd/s7bLd3pMCzPCcjy1Owol5b
         CwV50wpd8TSka8U4tkGtyCxqEpW8uZ53i+YZr2nlhWIxjUqVt06ntwjGtqlvA06egDOP
         bacmZG0Q7XNKjzpZKXS9Bj0yuBZfXh7smS3SZ6ZxfbfBDTcytQIqjN9iDy2UXr2+nXcY
         EtZg==
X-Gm-Message-State: AOAM530PKeJgXQ2bKielCbjrwqm9pYREvtsuOQXhOp6aQ3q1LHQW07Vj
        pYmrTkyMpwCs0sGEL6J4H4StfOKU2Ro=
X-Google-Smtp-Source: ABdhPJwsCDGm3/LSbpzU/woB46N25QOywZxxtW+byUAOujtaBSt/CJXLzpPedwXDQG/cDjw6P9sLxw==
X-Received: by 2002:a1f:b48b:: with SMTP id d133mr3999740vkf.7.1589813443697;
        Mon, 18 May 2020 07:50:43 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 190sm164419vsr.33.2020.05.18.07.50.42
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 07:50:42 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id e20so5141640vsb.5
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 07:50:42 -0700 (PDT)
X-Received: by 2002:a67:e884:: with SMTP id x4mr7166181vsn.106.1589813441464;
 Mon, 18 May 2020 07:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200507213500.241695-1-dianders@chromium.org>
 <20200509201511.GD30802@ravnborg.org> <CAD=FV=VBU7JmTdvgWjyj_ytrFmz6Gkx2OjVr1FxLh9DBG_jN6w@mail.gmail.com>
In-Reply-To: <CAD=FV=VBU7JmTdvgWjyj_ytrFmz6Gkx2OjVr1FxLh9DBG_jN6w@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 May 2020 07:50:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UNuwb+YYJKw9+HNMKUNfuNFxj+Gr+yB9tXANbXAvDgCg@mail.gmail.com>
Message-ID: <CAD=FV=UNuwb+YYJKw9+HNMKUNfuNFxj+Gr+yB9tXANbXAvDgCg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] drm: Prepare to use a GPIO on ti-sn65dsi86 for Hot
 Plug Detect
To:     Sam Ravnborg <sam@ravnborg.org>, LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sam,

On Sat, May 9, 2020 at 3:48 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, May 9, 2020 at 1:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Douglas.
> >
> > On Thu, May 07, 2020 at 02:34:54PM -0700, Douglas Anderson wrote:
> > >
> > > As talked about in commit c2bfc223882d ("drm/bridge: ti-sn65dsi86:
> > > Remove the mystery delay"), the normal HPD pin on ti-sn65dsi86 is
> > > kinda useless, at least for embedded DisplayPort (eDP).  However,
> > > despite the fact that the actual HPD pin on the bridge is mostly
> > > useless for eDP, the concept of HPD for eDP still makes sense.  It
> > > allows us to optimize out a hardcoded delay that many panels need if
> > > HPD isn't hooked up.  Panel timing diagrams show HPD as one of the
> > > events to measure timing from and we have to assume the worst case if
> > > we can't actually read HPD.
> > >
> > > One way to use HPD for eDP without using the mostly useless HPD pin on
> > > ti-sn65dsi86 is to route the panel's HPD somewhere else in the system,
> > > like to a GPIO.  This works great because eDP panels aren't physically
> > > hotplugged.  That means the debouncing logic that caused us problems
> > > wasn't really needed and a raw GPIO works great.
> > >
> > > As per the above, a smart board designer would realize the value of
> > > HPD and choose to route it to a GPIO somewhere on the board to avoid
> > > the silly sn65dsi86 debouncing.  While said "smart designer" could
> > > theoretically route HPD anywhere on the board, a really smart designer
> > > would realize that there are several GPIOs on the bridge itself that
> > > are nearly useless for anything but this purpose and route HPD to one
> > > of those.
> > >
> > > This series of patches is intended to allow the scenario described
> > > above.
> > >
> > > This patch has been tested on a board that is not yet mainline.  On
> > > the hardware I have:
> > > - Panel spec says HPD could take up to 200 ms to come up, so without
> > >   HPD hooked up we need to delay 200 ms.
> > > - On my board the panel is powered by the same rail as the
> > >   touchscreen.  By chance of probe order the touchscreen comes up
> > >   first.  This means by the time we check HPD in ti_sn_bridge_enable()
> > >   it's already up.  Thus we can use the panel on 200 ms earlier.
> > > - If I measure HPD on this pane it comes up ~56 ms after the panel is
> > >   powered.  This means I can save 144 ms of delay.
> > >
> > > Side effects (though not main goals) of this series are:
> > > - ti-sn65dsi86 GPIOs are now exported in Linux.
> > > - ti-sn65dsi86 bindings are converted to yaml.
> > > - Common panel bindings now have "hpd-gpios" listed.
> > > - The simple-panel driver in Linux can delay in prepare based on
> > >   "hpd-gpios"
> > > - ti-sn65dsi86 bindings (and current user) now specifies "no-hpd"
> > >   if HPD isn't hooked up.
> > >
> > > Changes in v5:
> > > - Use of_xlate so that numbers in dts start at 1, not 0.
> > > - Squash https://lore.kernel.org/r/20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid/
> > >
> > > Changes in v4:
> > > - Don't include gpio.h
> > > - Use gpiochip_get_data() instead of container_of() to get data.
> > > - GPIOF_DIR_XXX => GPIO_LINE_DIRECTION_XXX
> > > - Use Linus W's favorite syntax to read a bit from a bitfield.
> > > - Define and use SN_GPIO_MUX_MASK.
> > > - Add a comment about why we use a bitmap for gchip_output.
> > > - Tacked on "or is otherwise unusable." to description.
> > >
> > > Changes in v3:
> > > - Becaue => Because
> > > - Add a kernel-doc to our pdata to clarify double-duty of gchip_output.
> > > - More comments about how powering off affects us (get_dir, dir_input).
> > > - Cleanup tail of ti_sn_setup_gpio_controller() to avoid one "return".
> > > - Use a bitmap rather than rolling my own.
> > > - Remind how gpio_get_optional() works in the commit message.
> > > - useful implement => useful to implement
> > >
> > > Changes in v2:
> > > - ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")
> > > - ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2
> > > - ("simple...hpd-gpios") is 1/2 of replacement for ("Allow...bridge GPIOs")
> > > - specification => specifier.
> > > - power up => power.
> > > - Added back missing suspend-gpios.
> > > - data-lanes and lane-polarities are are the right place now.
> > > - endpoints don't need to be patternProperties.
> > > - Specified more details for data-lanes and lane-polarities.
> > > - Added old example back in, fixing bugs in it.
> > > - Example i2c bus is just called "i2c", not "i2c1" now.
> > > - ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd") new for v2.
> > > - ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.
> > >
> > > Douglas Anderson (6):
> > >   drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
> > >   dt-bindings: display: Add hpd-gpios to panel-common bindings
> > >   drm/panel-simple: Support hpd-gpios for delaying prepare()
> > >   dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
> > >   dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd
> > >   arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
> >
> > Applied:
> > >   dt-bindings: display: Add hpd-gpios to panel-common bindings
> > >   drm/panel-simple: Support hpd-gpios for delaying prepare()
> > to drm-misc-next.
> >
> > The others was missing reviews so we need to wait for feedback.
>
> Thanks!
>
> Given the previous feedback from Linus W, Stephen, and Laurent I
> expect things are good enough to land now, but it'd be good to get
> confirmation (I removed some of the previous tags just to get
> confirmation).  If we can get review tags early next week maybe it'll
> still be in time to land for 5.8?

I think all the others have reviews now.  Is there anything blocking
them from getting applied?

Thanks!

-Doug
