Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF8A43279E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 21:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbhJRTcb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 15:32:31 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:39926 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhJRTcb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 15:32:31 -0400
Received: by mail-oi1-f181.google.com with SMTP id m67so1252761oif.6;
        Mon, 18 Oct 2021 12:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cv+OCFoYPbczr2z2DhWSBBLOc3GCahM6MwqAnIXLAmU=;
        b=fnpnoPDy6nQrSxTFssZ5NEqpu1UU0FQ+Msgdp+VX2X/4l7c/B64Ozi900RIWOu0fjc
         gJXTREGZZZWCWvI+a+XfuAH0mD3R+saNZ1bxVWYvhP6RcS9gHIhXKgk4puXMWUcv4aFK
         mei4h+eTNfF6e3KyIcJxcCOyNNZlSmFte/9d+pmt7TbZjU6N40cdK2vG+c+bcXabctrb
         f8W5xQRcuZz2sZnS1ONrZWF8MEqSeY8dJF7y+74wQgWV3SBIaLpn2x+mUsDQ+JS61WPd
         jHZPqkD7vYZszxd6dptiYhedAyLkqVeMgMr108CM5zg/IewGf25AtoV4kaJVMZ7GOGct
         eptQ==
X-Gm-Message-State: AOAM530iIY8MWaXYVi5cF57ZmnVf7+amlRSSL4RJZV24e8nN6B7gfiuj
        5FRaWn3UfKqTIDG80ChV2w==
X-Google-Smtp-Source: ABdhPJyladwBud/vjrUhPvEXBZ1n8nhy8WPQ/KsBn6e575YD1KH6pU+jHeSPn+NFP++5iS5D/FWN1w==
X-Received: by 2002:aca:41d4:: with SMTP id o203mr676364oia.50.1634585419693;
        Mon, 18 Oct 2021 12:30:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q9sm1464592otv.48.2021.10.18.12.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 12:30:19 -0700 (PDT)
Received: (nullmailer pid 2806615 invoked by uid 1000);
        Mon, 18 Oct 2021 19:30:18 -0000
Date:   Mon, 18 Oct 2021 14:30:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>, Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, nd@arm.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: pinctrl: add #interrupt-cells to
 apple,pinctrl
Message-ID: <YW3LSl1yVifMcg5m@robh.at.kernel.org>
References: <20211016141839.45460-1-joey.gouly@arm.com>
 <20211016141839.45460-3-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016141839.45460-3-joey.gouly@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 16 Oct 2021 15:18:36 +0100, Joey Gouly wrote:
> The GPIO/pinctrl hardware can act as an interrupt-controller, so add
> the #interrupt-cells property to the binding.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
