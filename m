Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA1BA1E1B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 16:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfH2O6C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 10:58:02 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:56802 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbfH2O6C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 10:58:02 -0400
X-Greylist: delayed 334 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Aug 2019 10:58:01 EDT
Received: from localhost (unknown [IPv6:2001:718:1:2e:a5b5:770:4491:af45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id C5050400090;
        Thu, 29 Aug 2019 16:52:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2; t=1567090346;
        bh=3tXhnFz9DXpG4v0X5eDoi7gh3sGoIVP30uPeWkcdU20=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=dnjZYPl3pVtVYldh/uT1hu2d7uxI1b3CgI0Jwygo+nJxcGsDoGjlzP2qxCL/K907v
         ijYbtkX9QYAvkiLHQnyV1lGFtaB9veCKl6vLLkiD6CJquGc/YMUbpO6gbxbe4f+rAc
         hGnFJoUOdYGdaWsdKCfqMaCGAnVz9JnaX/+4ksBU=
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Peter Vernia <peter.vernia@gmail.com>
Cc:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <poeschel@lemonage.de>
Subject: Re: [PATCH] pinctrl-mcp23s08: Fix property-name in dt-example
Date:   Thu, 29 Aug 2019 16:52:24 +0200
MIME-Version: 1.0
Message-ID: <eaa0f631-bf71-4ca9-b3ff-06d5d43cc58d@cesnet.cz>
In-Reply-To: <20190828195609.4176-1-peter.vernia@gmail.com>
References: <20190828195609.4176-1-peter.vernia@gmail.com>
Organization: CESNET
User-Agent: Trojita/v0.7-402-g90b417b1-dirty; Qt/5.13.0; xcb; Linux; Gentoo Base System release 2.4.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On st=C5=99eda 28. srpna 2019 21:56:09 CEST, Peter Vernia wrote:
> The device-tree properties documentation-file specifies the property
> "microchip,spi-present-mask" as required for MCP23SXX chips. However,
> the device-tree-source example below it uses only "spi-present-mask".
> Without "microchip," on the front, the driver will print "missing
> spi-present-mask" when it initializes.
>
> Update the device-tree example with the correct property-name.
>
> Signed-off-by: Peter Vernia <peter.vernia@gmail.com>

Reviewed-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>

> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt=20
> b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> index 625a22e2f211..8b94aa8f5971 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> @@ -82,7 +82,7 @@ gpiom1: gpio@0 {
>          compatible =3D "microchip,mcp23s17";
>          gpio-controller;
>          #gpio-cells =3D <2>;
> -        spi-present-mask =3D <0x01>;
> +        microchip,spi-present-mask =3D <0x01>;
>          reg =3D <0>;
>          spi-max-frequency =3D <1000000>;
>  };

