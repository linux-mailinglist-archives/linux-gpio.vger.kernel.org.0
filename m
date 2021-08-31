Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30C63FCF29
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 23:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235696AbhHaVel (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 17:34:41 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:47047 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235761AbhHaVel (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 17:34:41 -0400
Received: by mail-oi1-f173.google.com with SMTP id o185so994814oih.13;
        Tue, 31 Aug 2021 14:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J/4rk321aST3R1dX7uB1Sz8tt/BHBEqAaVrBW+SYz70=;
        b=INNi+wO82tqt2wirxpAP9TRWOCK1gYnjKvmroEpjDpXmXA1U+3cUQZIij40EHUmS7q
         y/8GIRxYiJb+VBn7vLjNJsmKJ6SaCm1IU0Ms4FwnqGd/KoYn7XqOS5dq9Vrl2jQNP/Lk
         8aBs4Pyl/ojJ8PhLZ3fZP52Td8hJx+eMusOrdg+s1288+8oQg9Ky9FGSF0gSX2llYkvI
         dEeE2Bl8uh6f/11E75oKN/VOh608aXtWvJOUSPVWff/VQeYvAgRXISPEnjrSNp8WFglb
         qQIk1XxjcJIZd/WOZrx7DGMB6p8SPClPKIHkMaZoRjtWCMOlhPb0nBr1Yyg+Msq0LXbC
         350Q==
X-Gm-Message-State: AOAM531zCuHPbfM2yv0+Pp6AF2BPdwuBv+AJFK+uKRprRHmoUEcSc7WL
        UthUxysxERwd7JYENpfdvA==
X-Google-Smtp-Source: ABdhPJxTxOStSIvir2iEJq4mjIa41utLlNeQXu3O+1z8752kfXnyDVgGNxNEOI52q/hcSeLwMg9+9w==
X-Received: by 2002:a54:4714:: with SMTP id k20mr4801241oik.103.1630445625304;
        Tue, 31 Aug 2021 14:33:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o68sm4194764ota.33.2021.08.31.14.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 14:33:44 -0700 (PDT)
Received: (nullmailer pid 683290 invoked by uid 1000);
        Tue, 31 Aug 2021 21:33:44 -0000
Date:   Tue, 31 Aug 2021 16:33:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linux-rockchip@lists.infradead.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, heiko@sntech.de,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: add gpio-line-names to
 rockchip,gpio-bank.yaml
Message-ID: <YS6gOGhoQKNlg5cL@robh.at.kernel.org>
References: <20210828121007.14865-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828121007.14865-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 28 Aug 2021 14:10:07 +0200, Johan Jonker wrote:
> Some people and companies may want to add more description
> to there gpio pins. Add a gpio-line-names property to the
> rockchip,gpio-bank.yaml file to reduce the notifications
> from the existing mainline DT.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
