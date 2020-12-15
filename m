Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920A52DB126
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 17:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730921AbgLOQTL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 11:19:11 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42816 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730884AbgLOQTF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 11:19:05 -0500
Received: by mail-ot1-f68.google.com with SMTP id 11so19892730oty.9;
        Tue, 15 Dec 2020 08:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tiuo/F9ywaFT1g4Hgq4smhKXpwChtdQnxFIoyA9eYLc=;
        b=CPL9AzWUtRApKhCRXnOXWSzdjZhoqu1+hOwgEUKWPr9bSyb/+HWxUugXl8ih0lz7FD
         6QnSJk+u+ay/WDetqXSrYDMFjqfOAMLZQCRqUBhJXtW4/1XKY6Yrp2vRPd6aAKvi+Wrw
         6caCKiEws02DVQ5V3gzZD3HUKzOYrf/W1nWEEM+52sV8rySNcfTqVYYailX7cuhVhJXY
         q84zYjzXZuGhR4pB1Ph1QHqJF2kqSjyNW6M5pVggU+5j2opwLHja0csmTTJJ+bGFvapn
         LHZGj0ZyqMm3Fq6r9tdrBatWusxD43eV+cJnpgYUS3Ecpdt6uJvplA97jt2Fz+WBlsfx
         Ff1w==
X-Gm-Message-State: AOAM530SX8dTVyHJbQijQvI64uCGwi8sq0ZS5UEtcl6WDE6kUGXgEfri
        zp7jgcvJs6HDDPVLLXbWDT/n3nV5kQ==
X-Google-Smtp-Source: ABdhPJyzg+cWnGBKnnpCYh7dA14He6PC8Pfy+533w5JwQnvAnKS/oGNZbMGju7UI5nqUG4gGHsus3w==
X-Received: by 2002:a05:6830:2397:: with SMTP id l23mr14403323ots.357.1608049104475;
        Tue, 15 Dec 2020 08:18:24 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k3sm4739928oor.19.2020.12.15.08.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 08:18:23 -0800 (PST)
Received: (nullmailer pid 3958320 invoked by uid 1000);
        Tue, 15 Dec 2020 16:18:22 -0000
Date:   Tue, 15 Dec 2020 10:18:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 04/12] dt-bindings: pinctrl: sunxi: add compatible
 for V831/V833 pinctrl
Message-ID: <20201215161822.GA3958269@robh.at.kernel.org>
References: <20201212040157.3639864-1-icenowy@aosc.io>
 <20201212040430.3640418-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212040430.3640418-1-icenowy@aosc.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 12 Dec 2020 12:04:22 +0800, Icenowy Zheng wrote:
> V831/V833 are a pair of new Allwinner chips. The difference between them
> is similar to V3s/V3, but the chip design is similar to newer Allwinner
> chips started from H6.
> 
> Add compatible strings for V831/V833 pinctrl.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
