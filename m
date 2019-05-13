Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA671B6AF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 15:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728395AbfEMNGE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 09:06:04 -0400
Received: from webbox1416.server-home.net ([77.236.96.61]:42091 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727807AbfEMNGD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 May 2019 09:06:03 -0400
X-Greylist: delayed 390 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 May 2019 09:06:02 EDT
Received: from imapserver.systec-electronic.com (unknown [212.185.67.146])
        by webbox1416.server-home.net (Postfix) with ESMTPA id 3C66F27A616;
        Mon, 13 May 2019 14:59:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by imapserver.systec-electronic.com (Postfix) with ESMTP id C5F4F1A1B68;
        Mon, 13 May 2019 14:59:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at imapserver.systec-electronic.com
Received: from imapserver.systec-electronic.com ([127.0.0.1])
        by localhost (imapserver.systec-electronic.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZbZMJOaW0RJz; Mon, 13 May 2019 14:59:29 +0200 (CEST)
Received: from ws-140106.localnet (ws-140106.systec.local [192.168.10.84])
        by imapserver.systec-electronic.com (Postfix) with ESMTPA id C29D41A1B66;
        Mon, 13 May 2019 14:59:25 +0200 (CEST)
From:   Alexander Stein <alexander.stein@systec-electronic.com>
To:     Joe Burmeister <joe.burmeister@devtank.co.uk>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] (v2) Mark MCP23S08 as one that will not sleep.
Date:   Mon, 13 May 2019 14:59:25 +0200
Message-ID: <3181642.RMDZkMuPfY@ws-140106>
In-Reply-To: <20190513120024.17026-2-joe.burmeister@devtank.co.uk>
References: <20190513120024.17026-1-joe.burmeister@devtank.co.uk> <20190513120024.17026-2-joe.burmeister@devtank.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Montag, 13. Mai 2019, 14:00:24 CEST schrieb Joe Burmeister:
> Though it has a 'standby' it doesn't appear to be an issue and
> marking the chip with can_sleep means gpiolib.c won't allow its use
> as a interrupt controller.
> ---
>  drivers/pinctrl/pinctrl-mcp23s08.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
> index 3fc63cb5b332..7334d8eb9135 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -890,7 +890,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>  		return PTR_ERR(mcp->regmap);
>  
>  	mcp->chip.base = base;
> -	mcp->chip.can_sleep = true;
> +	mcp->chip.can_sleep = false;
>  	mcp->chip.parent = dev;
>  	mcp->chip.owner = THIS_MODULE;
>  
> 

IMHO this is completly wrong, please refer to the documentation of this flag, e.g. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/gpio/driver.h#n217
It essentially means you can't use this GPIOs from atomic context, as SPI or I2C transfers block/sleep, hence the name.
In your case the IRQs are probably not requested as threaded, as stated in the link above.

Best regards,
Alexander



