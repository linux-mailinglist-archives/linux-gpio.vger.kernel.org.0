Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FA52D6EA7
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 04:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395119AbgLKDbw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 22:31:52 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:45750 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395118AbgLKDbn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 22:31:43 -0500
Received: by mail-oi1-f171.google.com with SMTP id f132so8331404oib.12;
        Thu, 10 Dec 2020 19:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tPzs8wSBCqyhse1n/k2re/x+sNjYYy09CVQwRqHItwI=;
        b=gQ/HNjI7icU+q5RfyyZQmcLWXOAylfZXZ8Q0a2ris4aNL+7/7MBoA6WFfrtLkzcPQ4
         RylURrv4Z74vRE+4epcWfCyK1OE/msCr1dUqx0zbkXJ+pWaX7vVslhDY2iy3+N355I3r
         iYuf3ozkOFQb+OAKLHBzDxU9FympkfAXuKzzsIXNFwCFyBHGaoyc2+2znQJWMAxUj3L6
         TXVzSIW1fiNjOimaseejJBtbaA8M5ic0pmKh+aRrYpB6875aT2ftuOg/i3zQZVrlqdDN
         HynRkXB0BValT41oiO0vyYNklXU/R1+8PtCpKWFy7+ghP1QJdiYMCwAXgw1VwG2xWb4Q
         tFuw==
X-Gm-Message-State: AOAM533Dh0E280vsx5aihl1Zx9OufPuyLehzt5+qp6YYk7t7tpPCN64C
        aqOMkEybdPVQEkM+YlCT2g==
X-Google-Smtp-Source: ABdhPJwPCuxaIFDkVuxjowHzrgvOOxjtSzFefQfi85WoIOFGCsidOK1LZhRoJTa/vgfpVMEGYSKEIQ==
X-Received: by 2002:aca:c443:: with SMTP id u64mr7735487oif.117.1607657462747;
        Thu, 10 Dec 2020 19:31:02 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l5sm1491453ooo.2.2020.12.10.19.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:31:01 -0800 (PST)
Received: (nullmailer pid 3581367 invoked by uid 1000);
        Fri, 11 Dec 2020 03:31:01 -0000
Date:   Thu, 10 Dec 2020 21:31:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH -next 2/3] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 Add irq support
Message-ID: <20201211033101.GA3581336@robh.at.kernel.org>
References: <20201209142753.683208-1-lars.povlsen@microchip.com>
 <20201209142753.683208-3-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209142753.683208-3-lars.povlsen@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 09 Dec 2020 15:27:52 +0100, Lars Povlsen wrote:
> This describe the new bindings for the added IRQ support in the
> pinctrl-microchip-sgpio driver.
> 
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  .../bindings/pinctrl/microchip,sparx5-sgpio.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
