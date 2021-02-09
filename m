Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658113156B5
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 20:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbhBITVp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 14:21:45 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:43337 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbhBITLy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 14:11:54 -0500
Received: by mail-ot1-f53.google.com with SMTP id l23so6832994otn.10;
        Tue, 09 Feb 2021 11:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0lSV4AohGsl1Zr1fTQrQWSThsP43A4U9NitlrjcGFLY=;
        b=gLPWi7IZVmpwk5YfXhBNX4SGJK7/pCJXEJd95+uobzauIyU3Og9wFFVznaOe5XiIiT
         TF2TMunckaYHXJd7B1WPY9oDl7d3t/hrVm0dbkI/jV+fxEEYJ9T9yYqWQ/93Ha1RGM6U
         wxgzHLGycCj1QILOsfaP+W4fThQkTbOGUxpcJuE6MpLHIK7voDm/8Bs7qqIaWczAMZTZ
         ST1FoXtIioNK87W223n2+ClvJidTIf/D8MmVDOnMun4VcGv7S2xHksMurz+vuEzyoqx0
         wneFBQXsGAqVf56+u0m05tfH+dM2fSdak3lOk5beMXfB4WJp0lsyFtYn4S64lr5LrvBO
         viYQ==
X-Gm-Message-State: AOAM53256zGs0yvI846JQgOKw4rzjckLC7uC78vfOpTyKpIJJBUVeKfB
        AbKIkKbcvmaYCncnc9AOvA==
X-Google-Smtp-Source: ABdhPJzKfXsiizxjCyXEx0VckoiwC/5UFxLGdVQTZTq7WF7ZYGtOjNpOJapzmlORTAvYbqLUa9YFig==
X-Received: by 2002:a9d:71c6:: with SMTP id z6mr17187410otj.276.1612897691853;
        Tue, 09 Feb 2021 11:08:11 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i20sm4504476otl.78.2021.02.09.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 11:08:10 -0800 (PST)
Received: (nullmailer pid 4167159 invoked by uid 1000);
        Tue, 09 Feb 2021 19:08:09 -0000
Date:   Tue, 9 Feb 2021 13:08:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     nicolas.ferre@microchip.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: at91-pio4: add slew-rate
Message-ID: <20210209190809.GA4167103@robh.at.kernel.org>
References: <1611747945-29960-1-git-send-email-claudiu.beznea@microchip.com>
 <1611747945-29960-2-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611747945-29960-2-git-send-email-claudiu.beznea@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 27 Jan 2021 13:45:43 +0200, Claudiu Beznea wrote:
> Document slew-rate DT binding for SAMA7G5.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>  .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt       | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
