Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DC8442189
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 21:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhKAUQi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 16:16:38 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:39777 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhKAUQh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 16:16:37 -0400
Received: by mail-oi1-f177.google.com with SMTP id n11so18510971oig.6;
        Mon, 01 Nov 2021 13:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Sj56GUTpPgRS7oqOggzrlIvilkSN16Fc0q8+soup5ug=;
        b=e6cs/icy3sBFvHw7f4DT3lPifNi98zIdHzT46v9bh2zKxLJJkhhdRD/sd2vgfeU48E
         jWjI3W9thzjDBEpqIbHnvtubAWmm5BQRyyafeEVsQuk37L5N2wkG1r2N/sEgXpYGdZtf
         StHaZYrkk8E8ZsFU7ZLHb8js8uJLcE1fk8onCaNgMHyw5ov3S3u6xzaiMXHQbzG9BqgW
         3wjyWGRm3SFwhdiU6qdFwcF5+A303EcdHstuEZvtutgEE7G++qZ/9rrZswTTqY4crCDe
         K2a/5yXSF+ViLgTEDH4SCj9D1JcLW2/ofkzIa9MhYdFf1gfgt4anvgyrLGBYx3XbgOEH
         q87Q==
X-Gm-Message-State: AOAM533ZkHDa0DxwxGyXDX6Okjwzn51g8ct+wBzjoYqeflPm4X7aflud
        QF8vNb/gnhoWy60Bj5Di9w==
X-Google-Smtp-Source: ABdhPJw4z4KW2KWTYje7OKN2C81USrvHcH4TcTdLEGXf0B/pSdBvEpDjI866C/Ip1rWhs9d+cREpGw==
X-Received: by 2002:a05:6808:f8e:: with SMTP id o14mr1063812oiw.89.1635797642815;
        Mon, 01 Nov 2021 13:14:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 46sm4354343otd.2.2021.11.01.13.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 13:14:02 -0700 (PDT)
Received: (nullmailer pid 963901 invoked by uid 1000);
        Mon, 01 Nov 2021 20:13:59 -0000
Date:   Mon, 1 Nov 2021 15:13:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
        b20788@freescale.com, fugang.duan@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Message-ID: <YYBKh1KYrWTzm+5G@robh.at.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 24, 2021 at 11:40:22AM -0400, Jesse Taube wrote:
> Add i.MXRT documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> index a90c971b4f1f..4b4340def2aa 100644
> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> @@ -21,6 +21,7 @@ properties:
>            - fsl,ls1028a-lpuart
>            - fsl,imx7ulp-lpuart
>            - fsl,imx8qm-lpuart
> +          - fsl,imxrt-lpuart

Actually, 'rt' is not a single part is it? If the variations are same 
die, but fused off then no need to distinguish. Otherwise, these should 
be SoC specific.

Same applies to other compatible strings.

>        - items:
>            - const: fsl,imx8qxp-lpuart
>            - const: fsl,imx7ulp-lpuart
> -- 
> 2.33.0
> 
> 
