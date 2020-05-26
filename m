Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9331E3209
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 00:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389638AbgEZWIN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 18:08:13 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35962 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389342AbgEZWIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 18:08:13 -0400
Received: by mail-io1-f68.google.com with SMTP id y18so3370683iow.3;
        Tue, 26 May 2020 15:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mXe3eMhOfw8Yi0mzveU2UUdf9WbJiPX68762lf2f3m8=;
        b=lnGpxnl4Ptsii9Oal3CfKvRrQ6E70G0Es5XwkC6aYwMTShppiSQ48V2buS2xEMJp6n
         n4foNO7lb0Uc7qLZ0usrc3jicmeTmeeP4PTChZbNlACtK+7zrJiwMYFYL0JaVhRd0yLe
         R3iA1MagoO3zpwnt2OJrlbNjN0e0Q+9HxnTAN0VCylBabiegqtd7QLTd+zxeAkKByrjE
         wYmryKC5xRhvPvJBes4T5RW2v2bK9R0hsvC+YNiJR6N88MqISKcW/bWDggbIqV+KXb7Q
         skAnadg8HoE/Z/iRTVZM+jw1Jqp4vo+7yY5czD10RjY+T9ZXeohDV9kbqS8Bwc0fjGlm
         52Dg==
X-Gm-Message-State: AOAM532IsBhhZ2JVWIK7JNQXwfKh0tOtgAKH9tZxtA/80Aacwiz3OXgt
        zSqSIkDytsg8jsDa/D51nw==
X-Google-Smtp-Source: ABdhPJxua5/2ASeh+JDi3H6ENvlO5duKzfxD0bd/FxftWvnUVDU7fZZVP6RJWTWfF7tnoEbMyFvyDA==
X-Received: by 2002:a02:b782:: with SMTP id f2mr3009396jam.91.1590530891856;
        Tue, 26 May 2020 15:08:11 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o70sm677282ild.3.2020.05.26.15.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 15:08:10 -0700 (PDT)
Received: (nullmailer pid 467130 invoked by uid 1000);
        Tue, 26 May 2020 22:08:08 -0000
Date:   Tue, 26 May 2020 16:08:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>, a.hajda@samsung.com,
        narmstrong@baylibre.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        robdclark@chromium.org, jeffrey.l.hugo@gmail.com,
        jernej.skrabec@siol.net, airlied@linux.ie, spanda@codeaurora.org,
        Laurent.pinchart@ideasonboard.com, swboyd@chromium.org,
        bgolaszewski@baylibre.com, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to
 yaml
Message-ID: <20200526220808.GA467074@bogus>
References: <20200513215902.261547-1-dianders@chromium.org>
 <20200513145807.v6.2.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513145807.v6.2.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 13 May 2020 14:59:01 -0700, Douglas Anderson wrote:
> This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> Unless there's someone known to be better, I've set the maintainer in
> the yaml as the first person to submit bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> I removed Stephen's review tag on v5 since I squashed in a bunch of
> other stuff.
> 
> Changes in v6: None
> Changes in v5:
> - Squash https://lore.kernel.org/r/20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid/
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - specification => specifier.
> - power up => power.
> - Added back missing suspend-gpios.
> - data-lanes and lane-polarities are are the right place now.
> - endpoints don't need to be patternProperties.
> - Specified more details for data-lanes and lane-polarities.
> - Added old example back in, fixing bugs in it.
> - Example i2c bus is just called "i2c", not "i2c1" now.
> 
>  .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 ------
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 285 ++++++++++++++++++
>  2 files changed, 285 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
