Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9CE1C9D55
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 23:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgEGVf1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 17:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgEGVf1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 17:35:27 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E29C05BD43
        for <linux-gpio@vger.kernel.org>; Thu,  7 May 2020 14:35:26 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id b8so2475332plm.11
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2020 14:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3EHfl+OZQ86xl3nnBfabGaWfnGOtgLn9bxyisBpB13s=;
        b=hhnnE6pMuSjGxbdEhUqhrtz8mbWCLLN5LkkxK1NxLHSPp3O0WTkCLROvKUgNxSTHGa
         0DbNWk3aI+/KjHfsrCRBpx2/15gnwwyBeCnPpvxSK7o+bxecMGa+GPZ3UrU4d9l8PS6b
         8wkvPLbSVLmrTJtmMesDHAslZOhOFMWognir0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3EHfl+OZQ86xl3nnBfabGaWfnGOtgLn9bxyisBpB13s=;
        b=Gi7odetdMIf2fNudV7TaQjtdgp3NVZVTKxnuOxqUnM2ijKJVQj9l+MahKCzuV6O7Ap
         VCBaF5p4v39dJTbHaGgO8snAqmR1mySr6NbjAu6jCfoTDJsLEZHyxw+zo7pwMt59IxIk
         KD/es4ctvdqamlQ4zmsuRqIUV8jzewvt8ab8fQLv9Hr8ePDs/XKMi9rmQTT74rMDJygS
         JQcVu/yt/oEgf4sHhwemIwP5kRDpyskjIxijf8/m60ZczTpIIlTvAlR3dJC5gqJoOOuO
         GZoudGGro1aGTCqb1mnwi6zftwE4PjMEGUBqghfQQoeCYv8S1b+AurlDhGWNqGV55wGz
         zxAw==
X-Gm-Message-State: AGi0PuYUEweMgiCxH7Z5KW6CN1FqwHfbydhXumSF567S/O2owtTDbrx6
        e9lW0YmDGFpP+Ti7bzJjv6K+mg==
X-Google-Smtp-Source: APiQypKQSS3uzlkYHq8gThdNX9odtEUYpe3SwGbt56mePxUb+nlwO2wwSe+J7lSKN9DYDNPgDmZloQ==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr15140927plz.127.1588887326189;
        Thu, 07 May 2020 14:35:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i10sm5884860pfa.166.2020.05.07.14.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 14:35:25 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, jernej.skrabec@siol.net,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] drm: Prepare to use a GPIO on ti-sn65dsi86 for Hot Plug Detect
Date:   Thu,  7 May 2020 14:34:54 -0700
Message-Id: <20200507213500.241695-1-dianders@chromium.org>
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
- Remind how gpio_get_optional() works in the commit message.
- useful implement => useful to implement

Changes in v2:
- ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")
- ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2
- ("simple...hpd-gpios") is 1/2 of replacement for ("Allow...bridge GPIOs")
- specification => specifier.
- power up => power.
- Added back missing suspend-gpios.
- data-lanes and lane-polarities are are the right place now.
- endpoints don't need to be patternProperties.
- Specified more details for data-lanes and lane-polarities.
- Added old example back in, fixing bugs in it.
- Example i2c bus is just called "i2c", not "i2c1" now.
- ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd") new for v2.
- ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.

Douglas Anderson (6):
  drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
  dt-bindings: display: Add hpd-gpios to panel-common bindings
  drm/panel-simple: Support hpd-gpios for delaying prepare()
  dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
  dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd
  arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza

 .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 ------
 .../bindings/display/bridge/ti,sn65dsi86.yaml | 293 ++++++++++++++++++
 .../bindings/display/panel/panel-common.yaml  |   6 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |   2 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 214 +++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  53 ++++
 6 files changed, 568 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml

-- 
2.26.2.645.ge9eca65c58-goog

