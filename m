Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAA211634E7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 22:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgBRV1R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 16:27:17 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44714 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRV1R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 16:27:17 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so21607448oia.11;
        Tue, 18 Feb 2020 13:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SZkfM2vOw8ze2ybVAuGSNguaCr88qukHDOjEHLDc/Vw=;
        b=NTOV4MHUBC3afKGzgBEIj1N/G8Wh2ORKKnF2/GsINtd2RQF96qcWcRSMretkoJu0Xk
         unA+BabosFDF4m/KakXK00U2iqBg9hY+aMyvjOZbUTnO7J5KnJ2vZuO4cTHG6C7LirMw
         9z+M5nBqgM257nEI8kfDFScRCIM11ig9sQvgholzg24MGKGpougIPL6KOtyTglo1zAQI
         7+yeMPNYpFslbhvLlV1R4TTOabZ9Q0RgNiKW8bEnkJVZmnrZ9u9mXeGPqILaQrBq6oSp
         Wyw8hKPMfu82CEjSi4pE1zoygpQDFqzYbqO5gKlWsL1Gdynu0WFen1502HIwj+nQbpyO
         0N3w==
X-Gm-Message-State: APjAAAWfmFU8Fq1+1YS0Mf1Ee+hmzem/j0a1D6F0dttkxmxh489KHOm9
        mL7mEbAY2oj5BgJibCDtIg==
X-Google-Smtp-Source: APXvYqxgHOj3VjZX1AHlZ5Nh2dnVpuVFb3Z30Trjs3tK6fu2V/2tB52gtPEpxGhmDmnIDY9k6xcduw==
X-Received: by 2002:a05:6808:7dd:: with SMTP id f29mr2642106oij.67.1582061236713;
        Tue, 18 Feb 2020 13:27:16 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i20sm1766945otp.14.2020.02.18.13.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:27:15 -0800 (PST)
Received: (nullmailer pid 1931 invoked by uid 1000);
        Tue, 18 Feb 2020 21:27:14 -0000
Date:   Tue, 18 Feb 2020 15:27:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V4 2/4] dt-bindings: pinctrl: Convert i.MX8MM to
 json-schema
Message-ID: <20200218212714.GA1878@bogus>
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
 <1582012300-30260-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582012300-30260-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 18 Feb 2020 15:51:38 +0800, Anson Huang wrote:
> Convert the i.MX8MM pinctrl binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
> 	- use uint32-matrix instead of uint32-array for fsl,pins.
> ---
>  .../bindings/pinctrl/fsl,imx8mm-pinctrl.txt        | 36 ----------
>  .../bindings/pinctrl/fsl,imx8mm-pinctrl.yaml       | 82 ++++++++++++++++++++++
>  2 files changed, 82 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
