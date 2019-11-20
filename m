Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEF0103D13
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 15:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731525AbfKTOPq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 09:15:46 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59565 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731161AbfKTOPp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 09:15:45 -0500
Received: from [2001:67c:670:100:6a05:caff:fe2d:a9b1]
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1iXQlh-0008Ae-3X; Wed, 20 Nov 2019 15:15:41 +0100
Subject: Re: [PATCH] pinctrl: Fix Kconfig indentation
To:     Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stefan Agner <stefan@agner.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
References: <20191120134019.14333-1-krzk@kernel.org>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <279930f8-7463-555a-2dce-7c50fec8067e@pengutronix.de>
Date:   Wed, 20 Nov 2019 15:15:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120134019.14333-1-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:6a05:caff:fe2d:a9b1
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Krzysztof,

On 11/20/19 2:40 PM, Krzysztof Kozlowski wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig

>  config PINCTRL_ARTPEC6
> -        bool "Axis ARTPEC-6 pin controller driver"
> +	bool "Axis ARTPEC-6 pin controller driver"

Here you replace spaces for tabs before the prompt type.

>  config PINCTRL_SM8150
>         tristate "Qualcomm Technologies Inc SM8150 pin controller driver"

Here you leave the spaces before intact.

Intentional?

Cheers
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
