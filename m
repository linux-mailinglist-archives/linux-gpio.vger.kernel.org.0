Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D57419F86
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 21:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236680AbhI0Ty3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 15:54:29 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:38429 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236243AbhI0Ty2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 15:54:28 -0400
Received: by mail-oi1-f170.google.com with SMTP id u22so27092000oie.5;
        Mon, 27 Sep 2021 12:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=biErCQNPkAKC5ZTCkLHRuKZ1r/THoPwtQJm3whdV33g=;
        b=BVKURIanvFgocOHp6qz7o8FJmrMTowm+KHdyv+Q5OzHHGu3q2nfusJ1p5KSdpi0ouP
         /Bt9ZOJ7zy/XNStuoxOmpNrctuP6aAqNAnp2/JTv25jt6oVTslWzLfqlkym8He4BVm1z
         JyXgYV1snjvgYWkdjUL8cV/rvxWVNG7gUUKluQCAP2pZd488IKaOJif2qhI9oJ0fT6Qw
         CF4S3TvcjNFDGc+kGdhFEz0XQrECg+7ZdEphnKV9dv6vnsEdVV931uXklkGX34y0iCQZ
         UlOazdsq1Sy8/z9vjcpchZLbTSVZfFK3e+QJwKCNSHH1YKwjNr3ww4a61THUycmbHJC0
         N8qg==
X-Gm-Message-State: AOAM532vITqtK8mMTBq9xs7qUpYSG7sK+w+AJdjkFNXtd6tZuE4/B9My
        T3DtTnGBoqt0/k/alQ4Kcg==
X-Google-Smtp-Source: ABdhPJywsXAwHM+R0vJEEZv7DQC2Rwww8RJ68BLfWh86zHSifNNXa3mUHRHnzw1IVZpYUJHx/WmeEg==
X-Received: by 2002:aca:3e45:: with SMTP id l66mr643683oia.107.1632772370259;
        Mon, 27 Sep 2021 12:52:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o62sm311010ota.14.2021.09.27.12.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 12:52:49 -0700 (PDT)
Received: (nullmailer pid 3772749 invoked by uid 1000);
        Mon, 27 Sep 2021 19:52:48 -0000
Date:   Mon, 27 Sep 2021 14:52:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/11] dt-bindings: leds: Document "activity" trigger
Message-ID: <YVIhEJCJ9lr3ZKzM@robh.at.kernel.org>
References: <20210923065500.2284347-1-daniel@0x0f.com>
 <20210923065500.2284347-4-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923065500.2284347-4-daniel@0x0f.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 23, 2021 at 03:54:52PM +0900, Daniel Palmer wrote:
> The "activity" trigger can be used as the default but it's currently
> undocumented so validating a devicetree that uses it causes a warning.

It is preferred to use 'function' and LED_FUNCTION_CPU. Is there some 
reason that can't be used?

> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index 697102707703..8160a5073728 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -80,6 +80,8 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/string
>  
>      enum:
> +        # LED will flashing will represent current CPU usage
> +      - activity
>          # LED will act as a back-light, controlled by the framebuffer system
>        - backlight
>          # LED will turn on (but for leds-gpio see "default-state" property in
> -- 
> 2.33.0
> 
> 
