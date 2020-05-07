Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C581C8886
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 13:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgEGLlP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 07:41:15 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:33637 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgEGLlP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 07:41:15 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 849B420000E;
        Thu,  7 May 2020 11:39:26 +0000 (UTC)
Date:   Thu, 7 May 2020 13:42:38 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rza1: Fix flag name in comment
Message-ID: <20200507114238.k4zeunp3z4yedpzk@uno.localdomain>
References: <20200507074516.29903-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200507074516.29903-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert

On Thu, May 07, 2020 at 09:45:16AM +0200, Geert Uytterhoeven wrote:
> rza1_swio_pin relates to the swio flag instead of the bidir flag.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
> To be queued in sh-pfc for v5.8.
>
>  drivers/pinctrl/pinctrl-rza1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> index ff4a7fb518bb3d84..38a14bbced5f60e7 100644
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -93,7 +93,7 @@ struct rza1_bidir_entry {
>  };
>
>  /**
> - * rza1_swio_pin - describe a single pin that needs bidir flag applied.
> + * rza1_swio_pin - describe a single pin that needs swio flag applied.
>   */
>  struct rza1_swio_pin {
>  	u16 pin: 4;
> --
> 2.17.1
>
