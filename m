Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4D91304B2
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2020 22:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgADVfH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Jan 2020 16:35:07 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:42901 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgADVfH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Jan 2020 16:35:07 -0500
Received: by mail-il1-f193.google.com with SMTP id t2so24032294ilq.9
        for <linux-gpio@vger.kernel.org>; Sat, 04 Jan 2020 13:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E086cLVBXwQ6vOtP7yO03NEZ/tAJB2ltt2lzCZgTgEA=;
        b=D22RouaQpJkxq7kKSJQ/iv4aTbV3TAVX4VevGXNgKn058gpTMLdAQ6uUXuEnC/ILyX
         r4QN6CU84nq8ny8NtQsrUcWo6iPeq51M5iAKW4apVipCenJpvfArQWt05LfQoHWhEWlR
         BhGlN43HlAagGfujoN5oNHKIQ6fdsiNVd7UYOSxT+RAnUzwyJtL4kr+CD2d9q2k4rzq+
         UJDhoZ4tkHUk4ldMmEcJNfvG8ii7AURP7KsuZpoCkwjrzCO1MBVR1PI0N163MUnYfjB4
         uLhQJcVuovGt7znGyRPjj9dmAKo/1FO4X5vK/Apu8XuWWa1OS6BgM8E1HFfvWh7sENV0
         MSuQ==
X-Gm-Message-State: APjAAAU1IxUjWYZwg0hSXB9zPj4Osf9cPtoPrYBZtakMh9BHqvWg6W/4
        sNepK/lwou+W6o9sptWlwuWF2tE=
X-Google-Smtp-Source: APXvYqwtflYX6XohhHPAxjBLfhFP8b18sSzpboCOQlfMgx5pqvskOttLB0QtpC7kEVnDahVJDFQ94w==
X-Received: by 2002:a92:8dda:: with SMTP id w87mr79806375ill.55.1578173705812;
        Sat, 04 Jan 2020 13:35:05 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id q1sm22416757ils.60.2020.01.04.13.35.05
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:35:05 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:33:32 -0700
Date:   Sat, 4 Jan 2020 14:33:32 -0700
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        catalin.marinas@arm.com, will@kernel.org,
        bjorn.andersson@linaro.org, olof@lixom.net, maxime@cerno.tech,
        leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V2 1/3] dt-bindings: imx: Add pinctrl binding doc for
 i.MX8MP
Message-ID: <20200104213332.GA19211@bogus>
References: <1577342743-25885-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577342743-25885-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 26, 2019 at 02:45:41PM +0800, Anson Huang wrote:
> Add binding doc for i.MX8MP pinctrl driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes.
> ---
>  .../bindings/pinctrl/fsl,imx8mp-pinctrl.txt        |  38 +

Please make this a DT schema.

>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     | 931 +++++++++++++++++++++
>  2 files changed, 969 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.txt
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.txt
> new file mode 100644
> index 0000000..619104b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.txt
> @@ -0,0 +1,38 @@
> +* Freescale IMX8MP IOMUX Controller
> +
> +Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> +for common binding part and usage.
> +
> +Required properties:
> +- compatible: "fsl,imx8mp-iomuxc"
> +- reg: should contain the base physical address and size of the iomuxc
> +  registers.
> +
> +Required properties in sub-nodes:
> +- fsl,pins: each entry consists of 6 integers and represents the mux and config
> +  setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
> +  input_val> are specified using a PIN_FUNC_ID macro, which can be found in
> +  <arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h>. The last integer CONFIG is
> +  the pad setting value like pull-up on this pin. Please refer to i.MX8M Plus
> +  Reference Manual for detailed CONFIG settings.
> +
> +Examples:
> +
> +&uart1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_uart1>;
> +};
> +
> +iomuxc: pinctrl@30330000 {
> +        compatible = "fsl,imx8mp-iomuxc";
> +        reg = <0x30330000 0x10000>;
> +
> +	pinctrl_uart1: uart1grp {

In particular, define some node naming pattern that you can match on. 
Perhaps "grp$" works.

> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX    0x140
> +			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX    0x140
> +			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS   0x140
> +			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS   0x140
> +		>;
> +	};
> +};
