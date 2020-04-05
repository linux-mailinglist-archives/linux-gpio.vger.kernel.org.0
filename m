Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50A9D19E85A
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2020 03:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgDEBrL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Apr 2020 21:47:11 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40975 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgDEBrL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Apr 2020 21:47:11 -0400
Received: by mail-io1-f68.google.com with SMTP id b12so11902972ion.8;
        Sat, 04 Apr 2020 18:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xyeh33k5wDcGZSxdkpLIkuCmJmilM6XMzgA6pBlKGBI=;
        b=e7/4d+Z8fWtI+wTmwHzYwPmRb9b/Nd73udl4XkoWMPe0bX+CGKJEEZY9i0nA6iucA4
         zZSLk37nEQEpKZwnrnSXM09uFrXeiEt7UaspYwU2LaETNz6Q8bS9t4nt+zb+yQ3vZM4z
         KtNSN/CvOsNoGMN9n8sobDDL7UiZMYvNIYDkZ4Nmke/PWnR+WQ8LIZKXu4BIH+xMGcZx
         CCEZOSS2g3DUY69X0R4538s+RRhIdy18kPOmITm1I8BgbECLipGXgx6Q2uCtH8apt6Dl
         Dcxd05M7rHV+vjNxwMGmXWx7QCHiUAxtPmYH98aomYNkQ18sqGz0p34J3W5NYMS7u8zL
         TsWw==
X-Gm-Message-State: AGi0Pua0H3sE1X/N7X6QAIioepcnJbhu+Hfjnq8vBOAjOAXXU2Lw06fP
        HltfNFlMy5z2VhN9wJr48g==
X-Google-Smtp-Source: APiQypI6OmYDV9zjOQGePspkdsj+RGnavHnK0g4RmrH4TOnA+zHnxAqvzSM6z9mLmqqbqCfhHNPFtA==
X-Received: by 2002:a02:70d8:: with SMTP id f207mr668879jac.83.1586051230249;
        Sat, 04 Apr 2020 18:47:10 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l70sm4473080ili.81.2020.04.04.18.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 18:47:09 -0700 (PDT)
Received: (nullmailer pid 12218 invoked by uid 1000);
        Sun, 05 Apr 2020 01:47:06 -0000
Date:   Sat, 4 Apr 2020 19:47:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux@roeck-us.net,
        gregkh@linuxfoundation.org, peng.fan@nxp.com, fugang.duan@nxp.com,
        krzk@kernel.org, bjorn.andersson@linaro.org, leoyang.li@nxp.com,
        olof@lixom.net, dinguyen@kernel.org, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl-scu: Add imx8dxl pinctrl
 support
Message-ID: <20200405014706.GA12185@bogus>
References: <1585306559-13973-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585306559-13973-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 27 Mar 2020 18:55:57 +0800, Anson Huang wrote:
> Update binding doc to support i.MX8DXL pinctrl.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
