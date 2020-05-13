Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039721D218F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 23:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730254AbgEMV7W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 17:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730229AbgEMV7V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 17:59:21 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135BBC061A0F
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 14:59:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t7so367405plr.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 14:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7pp6apoeGPwsmz3EODeA5qYm2MMJs0qtqXKCwErAfV8=;
        b=TheeZ54cr+FeMuAS2vi5yX0aQyRJfj9Tv3o9dhV+7Oc/5ELg7XfHc86ONBb1ms1kTI
         CtivEFPsUCfONxBbdaa6ZlldLTTKPGBsjs4w8qeJaNjw1ZLo/WHGzr0myuXsM8cHZL1G
         EQvChDRCxHwNvngJehWaHP3WId+AxlRjSzZNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7pp6apoeGPwsmz3EODeA5qYm2MMJs0qtqXKCwErAfV8=;
        b=BIIFZQDuAKbqODlcdsTomyBLEvh3wkGl9Q8AnraQYDfSHRYfKLzuVcKP4nN8kxSsR3
         uND60kZPU06fQag5CaTvC5sRVy0eH4a8iQEmNSvAa540j5dtaQpPx+Y2+EWpYJb4yVgz
         WZwMnqTuBebw9HeES4Fa2UgXv5J2RP6/oojyXgVJ1bKuYn9ZCkHT55uSlNTC31ZdWegF
         l6+EUO85bDoR+zMOwN4883lMUXVxYmrd+pn3CjuiqT/pwtpWG2tjrw+LVO5GHgObGIoK
         JhVLO3umGbnLG49LCLXMgLsnGE38pMqszFDhDIlt6jqphWh2UiVUlbIOOpToA9FWr7Bx
         qC3g==
X-Gm-Message-State: AGi0PuYOGorOZ98zFSkkne1tntmGn3nHid3MzaAw4AjMIY+DrBxE9CwN
        iINwTm4LzjkCDkqK4B9a+rqXWw==
X-Google-Smtp-Source: APiQypK3GMSIszeEasa/zWj9qGCgZc21TG0YHWt6LSG2kEdQcDyiNAr0jp/J25jv9rT19qSb0zBg4w==
X-Received: by 2002:a17:90a:5a4d:: with SMTP id m13mr27500208pji.108.1589407160465;
        Wed, 13 May 2020 14:59:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id k27sm547169pgb.30.2020.05.13.14.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:59:19 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        swboyd@chromium.org, devicetree@vger.kernel.org,
        jeffrey.l.hugo@gmail.com, jernej.skrabec@siol.net,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        jonas@kwiboo.se, linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] drm: Prepare to use a GPIO on ti-sn65dsi86 for Hot Plug Detect
Date:   Wed, 13 May 2020 14:58:59 -0700
Message-Id: <20200513215902.261547-1-dianders@chromium.org>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


As talked about in commit c2bfc223882d ("drm/bridge: ti-sn65dsi86:
Remove the mystery delay"), the normal HPD pin on ti-sn65dsi86 is
kinda useless, at least for embedded DisplayPort (eDP).  However,
despite the fact that the actual HPD pin on the bridge is mostly
useless for eDP, the concept of HPD for eDP still makes sense.  It
allows us to optimize out a hardcoded delay that many panels need if
HPD isn't hooked up.  Panel timing diagrams show HPD as one of the
events to measure timing from and we have to assume the worst case if
we can't actually read HPD.

One way to use HPD for eDP without using the mostly useless HPD pin on
ti-sn65dsi86 is to route the panel's HPD somewhere else in the system,
like to a GPIO.  This works great because eDP panels aren't physically
hotplugged.  That means the debouncing logic that caused us problems
wasn't really needed and a raw GPIO works great.

As per the above, a smart board designer would realize the value of
HPD and choose to route it to a GPIO somewhere on the board to avoid
the silly sn65dsi86 debouncing.  While said "smart designer" could
theoretically route HPD anywhere on the board, a really smart designer
would realize that there are several GPIOs on the bridge itself that
are nearly useless for anything but this purpose and route HPD to one
of those.

This series of patches is intended to allow the scenario described
above.

This patch has been tested on a board that is not yet mainline.  On
the hardware I have:
- Panel spec says HPD could take up to 200 ms to come up, so without
  HPD hooked up we need to delay 200 ms.
- On my board the panel is powered by the same rail as the
  touchscreen.  By chance of probe order the touchscreen comes up
  first.  This means by the time we check HPD in ti_sn_bridge_enable()
  it's already up.  Thus we can use the panel on 200 ms earlier.
- If I measure HPD on this pane it comes up ~56 ms after the panel is
  powered.  This means I can save 144 ms of delay.

Side effects (though not main goals) of this series are:
- ti-sn65dsi86 GPIOs are now exported in Linux.
- ti-sn65dsi86 bindings are converted to yaml.
- Common panel bindings now have "hpd-gpios" listed.
- The simple-panel driver in Linux can delay in prepare based on
  "hpd-gpios"
- ti-sn65dsi86 bindings (and current user) now specifies "no-hpd"
  if HPD isn't hooked up.

Patch v6 collects tags that were sent for v5 and does the one
fix that Linus W. requested.  It also drops patches that have
already landed.

Changes in v6:
- pdata->gchip.base = -1

Changes in v5:
- Use of_xlate so that numbers in dts start at 1, not 0.
- Squash https://lore.kernel.org/r/20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid/

Changes in v4:
- Don't include gpio.h
- Use gpiochip_get_data() instead of container_of() to get data.
- GPIOF_DIR_XXX => GPIO_LINE_DIRECTION_XXX
- Use Linus W's favorite syntax to read a bit from a bitfield.
- Define and use SN_GPIO_MUX_MASK.
- Add a comment about why we use a bitmap for gchip_output.
- Tacked on "or is otherwise unusable." to description.

Changes in v3:
- Becaue => Because
- Add a kernel-doc to our pdata to clarify double-duty of gchip_output.
- More comments about how powering off affects us (get_dir, dir_input).
- Cleanup tail of ti_sn_setup_gpio_controller() to avoid one "return".
- Use a bitmap rather than rolling my own.
- useful implement => useful to implement

Changes in v2:
- ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")
- specification => specifier.
- power up => power.
- Added back missing suspend-gpios.
- data-lanes and lane-polarities are are the right place now.
- endpoints don't need to be patternProperties.
- Specified more details for data-lanes and lane-polarities.
- Added old example back in, fixing bugs in it.
- Example i2c bus is just called "i2c", not "i2c1" now.
- ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd") new for v2.

Douglas Anderson (3):
  drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
  dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
  dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd

 .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 ------
 .../bindings/display/bridge/ti,sn65dsi86.yaml | 293 ++++++++++++++++++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 215 +++++++++++++
 3 files changed, 508 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml

-- 
2.26.2.645.ge9eca65c58-goog

