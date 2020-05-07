Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC6C1C9090
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 16:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgEGOqc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 10:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgEGOqc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 10:46:32 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED02C05BD43
        for <linux-gpio@vger.kernel.org>; Thu,  7 May 2020 07:46:31 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 23so6324075qkf.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2020 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z7IFA9stGr7AQIAUx30OK+wSMM9GgogchHTSn33YI0U=;
        b=oKrgg6+ohJKVAOjUfdVbli6fopWWBK9ouxsK7MkYl2D0qBOvCFhQahNLKGcyctP0/3
         GuQCx6TcEKb7uN2XV751z4mfwU5kpykWAbuevm+p41uR8/egw097FPbwgDTfIlAaV1bB
         mk+N35TAXodLwzAsbM5yVi87spgJIxwJ/nNIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z7IFA9stGr7AQIAUx30OK+wSMM9GgogchHTSn33YI0U=;
        b=jvxdhqz1vReFo2Y1gioPbknU86jKjgVb5FA0EnFz4s0qPwMQLkjd5r8eyJpznyVRI2
         yEFWXVUs+81FecTSe5otpMhKAo8JOZlOHc7ZHjYG3IXDtSmFe5aSMIKd5ZlU0N9uO6qk
         r4/XJGw9IQGPSbJLgN7RpKBGFkBFi/RMR6mliEmx6QFT9PevrD6BB5MBbOdlqc4OqbIb
         uQ40lB/d+A9oW+sEI3FywfRZm7xVTveai7VW4IMOJLGkhnw1D5zov5uvSsmr9e26OWVS
         p2nNYGlu1mAqRR5ytA1W6Q9wE8uefB60MrFkVSURsyb949qfJfVfnhWlF36ovbtFUWu5
         ODCw==
X-Gm-Message-State: AGi0PuZbVE64cgzL0W61d7uvo2eTXPiiM3C79BRuVAnmQyBP67ORXDBY
        lQLhaNMSpHgWOf8OrlNPqP8sXNxPAtg=
X-Google-Smtp-Source: APiQypJLwppeiTLLKL5CtdU3+0A+Lzhpa6gbCUSMgm9ebJcZ5ObyZcOTdWsVyDj6w/ngX/LUTMr9aA==
X-Received: by 2002:a37:9f0c:: with SMTP id i12mr15130234qke.264.1588862790942;
        Thu, 07 May 2020 07:46:30 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id g123sm4379341qkd.95.2020.05.07.07.46.30
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 07:46:30 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id h6so2740278qvz.8
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2020 07:46:30 -0700 (PDT)
X-Received: by 2002:a67:f5d6:: with SMTP id t22mr12876499vso.73.1588862377337;
 Thu, 07 May 2020 07:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200430194617.197510-1-dianders@chromium.org> <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
In-Reply-To: <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 May 2020 07:39:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
Message-ID: <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
To:     LinusW <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sandeep Panda <spanda@codeaurora.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Apr 30, 2020 at 12:46 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> be used as GPIOs in a system.  Each pin can be configured as input,
> output, or a special function for the bridge chip.  These are:
> - GPIO1: SUSPEND Input
> - GPIO2: DSIA VSYNC
> - GPIO3: DSIA HSYNC or VSYNC
> - GPIO4: PWM

One suggestion that came off-list is to change the code to make the
numbering match up better with the datasheet.  Right now if you want
GPIO 2 you have to refer to it like:

hpd-gpios = <&sn65dsi86_bridge 1 GPIO_ACTIVE_HIGH>;

That's because the code right now numbers things starting at 0 even if
the datasheet numbers things starting at 1.

I'm planning to spin the series later today for this.  While at it,
I'll squash my yaml bindings fixup into the bindings patch in this
series.  If someone would rather I wait and not spin yet, please yell.
