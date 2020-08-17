Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D9D247828
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 22:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgHQUeG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 16:34:06 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:45314 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgHQUeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 16:34:02 -0400
Received: by mail-il1-f194.google.com with SMTP id k4so15699624ilr.12;
        Mon, 17 Aug 2020 13:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KxhMGNIUdZ1yfwF2CLcsEi0+t0a62c8/WaiKA5cVM88=;
        b=g8OAt7gxC8qmoGRyPMQtwge+7heVahWxOvLAs/VdbFfOjNvl5QZiTi96miNi92m9iz
         4vnzTUarhhJ1wVg1HTeqpkNU6y35YnB8yv8PYLgAX6oB3LRggLs/S4yuZP91qsD4jjuF
         3jfRssIrZbTpTu2lwNFRQxGPQt4vW0K1tjkademORNbH+3HZ2oFm0du8Iw/kpuViEt87
         3JWonRxOWwcRgpj1+uZb2pKyZcftkOSx+EtfsM6i0odFKgZWsWnXawlweQYtgkRrbuvz
         joEIJh4ECVNrl6gZmJvW8EoC2imU94kPjK5q0gVF6W2qLF1SDEO5NiPNXDnoTRc7kOYU
         b39g==
X-Gm-Message-State: AOAM531jY8GaFXOx8AXWeoq4Uktl5nE0hsWyhfcSlrTLqzwIcy9YaLmt
        fSFgygVoEGgz7eJazHk3Jw==
X-Google-Smtp-Source: ABdhPJz0u0qcCb40TpJWzBjWVe/xCrvnFZFXsHJDFf2hrGTmCsSKIV3GWzi3eskdElcpf6E2jkjESA==
X-Received: by 2002:a92:9adc:: with SMTP id c89mr14463950ill.272.1597696441144;
        Mon, 17 Aug 2020 13:34:01 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id t88sm10627894ilk.26.2020.08.17.13.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 13:34:00 -0700 (PDT)
Received: (nullmailer pid 1509185 invoked by uid 1000);
        Mon, 17 Aug 2020 20:33:58 -0000
Date:   Mon, 17 Aug 2020 14:33:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     TY Chang <tychang@realtek.com>
Cc:     linux-realtek-soc@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, afaerber@suse.de,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linus.walleij@linaro.org
Subject: Re: [PATCH v3 5/9] dt-bindings: pinctrl: realtek: Add Realtek DHC
 SoC rtd1295
Message-ID: <20200817203358.GA1508879@bogus>
References: <20200813074908.889-1-tychang@realtek.com>
 <20200813074908.889-6-tychang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813074908.889-6-tychang@realtek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 13 Aug 2020 15:49:04 +0800, TY Chang wrote:
> Add device tree binding Documentation for rtd1295
> pinctrl driver.
> 
> Signed-off-by: TY Chang <tychang@realtek.com>
> ---
>  .../pinctrl/realtek,rtd1295-pinctrl.yaml      | 192 ++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1295-pinctrl.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

