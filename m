Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023924434CC
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 18:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234530AbhKBRuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 13:50:08 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:33772 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbhKBRuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 13:50:05 -0400
Received: by mail-oi1-f171.google.com with SMTP id bm39so50788oib.0;
        Tue, 02 Nov 2021 10:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MSHt9XX2liSK6a/VXzOhWseycwoHeCMU2hAXhWNBkq4=;
        b=e1a6UpQd3iXlK1v0qLf3ChBOOdndx7w4q1e50bIuhzJwJYKJ//2ae6EGtTo6fsLu0u
         SXAeTF0+J/i6Z5aV7Qr858QbsoM2CJWoO2yA0X9oy+SuGZKzomcuXpzbP1bSWTNr6JsX
         kalrKwIRK6xvqDeeo0fqAzC01r/g+Lq/2AcgaXWFZSs8ZlH9zLjj49gk5qu5dLn7U8Z7
         1AHfvMGBJmThZvOK4zH61/64ltt0m0MctL4nMmqu75nLnZUy8vyj7m7RRnhVr1wCo0OJ
         KNb3itHeCisI7sZz9d0o+nhFPHYj2q9TlTvTaDvbY4H6pZMXaQCmfHq3ev8O+W3Gp1AO
         W2qA==
X-Gm-Message-State: AOAM532hncWQh1A0+IL/ur3vmB+C9MG4adrpXYO0pNCNuyw+YgE3dv4x
        +EYtGf33KHO+/UZEppk+Svf/qyFqGA==
X-Google-Smtp-Source: ABdhPJzwCDKIxLoqNikXz/SxWzp8HXi9XbyiYEvNztpAwqIgGunks3eO049TSKA4fqWpixjWLKPkNA==
X-Received: by 2002:aca:3bd4:: with SMTP id i203mr6103980oia.69.1635875249942;
        Tue, 02 Nov 2021 10:47:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a8sm1010720otr.3.2021.11.02.10.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 10:47:29 -0700 (PDT)
Received: (nullmailer pid 3148588 invoked by uid 1000);
        Tue, 02 Nov 2021 17:47:28 -0000
Date:   Tue, 2 Nov 2021 12:47:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
Cc:     linux-gpio@vger.kernel.org, Kavyasree.Kotagiri@microchip.com,
        UNGLinuxDriver@microchip.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: ocelot: add lan966x SoC
 support
Message-ID: <YYF5sBwqPkFxb6Qy@robh.at.kernel.org>
References: <20211101095451.5831-1-kavyasree.kotagiri@microchip.com>
 <20211101095451.5831-2-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101095451.5831-2-kavyasree.kotagiri@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 01 Nov 2021 15:24:50 +0530, Kavyasree Kotagiri wrote:
> Add documentation for the compatible designated for lan966x.
> 
> Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
> ---
> v2 -> v3:
> - No changes.
> 
> v1 -> v2:
> - Use consistent name lan966x in commit description
> 
>  .../devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt        | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
