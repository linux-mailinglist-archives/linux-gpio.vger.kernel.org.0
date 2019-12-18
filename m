Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3149F124D78
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 17:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727710AbfLRQ0U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 11:26:20 -0500
Received: from smtp2.axis.com ([195.60.68.18]:46355 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726980AbfLRQ0U (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 11:26:20 -0500
IronPort-SDR: YH9AgxxdhWOLwLlrUlwoR/X6uYvSXtdaAwFArokfZwhhTzOzDGuRoFiCgk6U7Fik02syJkuzCl
 IbK0UmUihXB6ubOcv7cY0oVSS3jFO4bKmQtTY8SkGfSzqRiLQxR+jUVAdaO0p2/ykYaj7c4yWF
 MtOAAl43S8vfcMBpJ4XOhut271b3kTizkJskg30PImN1QqgwslLARvFkfcbpPdN3Ms87aCEfqN
 tcZ4BGdalNSLNIoc0vZmQN2yzaIr8u2GM4rYzk6a5ADOmD2dPLvgx0gMYlciiYolZdzgAhcKF4
 lto=
X-IronPort-AV: E=Sophos;i="5.69,330,1571695200"; 
   d="scan'208";a="3621155"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Date:   Wed, 18 Dec 2019 17:26:16 +0100
From:   Jesper Nilsson <jesper.nilsson@axis.com>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@axis.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: artpec6: fix __iomem on reg in set
Message-ID: <20191218162616.qsxsltfsrxotzqhb@axis.com>
References: <20191218101602.2442868-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218101602.2442868-1-ben.dooks@codethink.co.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 11:16:02AM +0100, Ben Dooks (Codethink) wrote:
> The artpec6_pconf_set should have marked reg as __iomem,
>  which ends up making sparse complain about address
> space conversions. Add the __iomem to silence the
> following warnings:
> 
> drivers/pinctrl/pinctrl-artpec6.c:814:13: warning: incorrect type in assignment (different address spaces)
> drivers/pinctrl/pinctrl-artpec6.c:814:13:    expected unsigned int *reg
> drivers/pinctrl/pinctrl-artpec6.c:814:13:    got void [noderef] <asn:2> *
> drivers/pinctrl/pinctrl-artpec6.c:825:34: warning: incorrect type in argument 1 (different address spaces)
> drivers/pinctrl/pinctrl-artpec6.c:825:34:    expected void const volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-artpec6.c:825:34:    got unsigned int *reg
> drivers/pinctrl/pinctrl-artpec6.c:827:25: warning: incorrect type in argument 2 (different address spaces)
> drivers/pinctrl/pinctrl-artpec6.c:827:25:    expected void volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-artpec6.c:827:25:    got unsigned int *reg
> drivers/pinctrl/pinctrl-artpec6.c:837:34: warning: incorrect type in argument 1 (different address spaces)
> drivers/pinctrl/pinctrl-artpec6.c:837:34:    expected void const volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-artpec6.c:837:34:    got unsigned int *reg
> drivers/pinctrl/pinctrl-artpec6.c:840:25: warning: incorrect type in argument 2 (different address spaces)
> drivers/pinctrl/pinctrl-artpec6.c:840:25:    expected void volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-artpec6.c:840:25:    got unsigned int *reg
> drivers/pinctrl/pinctrl-artpec6.c:850:34: warning: incorrect type in argument 1 (different address spaces)
> drivers/pinctrl/pinctrl-artpec6.c:850:34:    expected void const volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-artpec6.c:850:34:    got unsigned int *reg
> drivers/pinctrl/pinctrl-artpec6.c:853:25: warning: incorrect type in argument 2 (different address spaces)
> drivers/pinctrl/pinctrl-artpec6.c:853:25:    expected void volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-artpec6.c:853:25:    got unsigned int *reg
> drivers/pinctrl/pinctrl-artpec6.c:864:34: warning: incorrect type in argument 1 (different address spaces)
> drivers/pinctrl/pinctrl-artpec6.c:864:34:    expected void const volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-artpec6.c:864:34:    got unsigned int *reg
> drivers/pinctrl/pinctrl-artpec6.c:867:25: warning: incorrect type in argument 2 (different address spaces)
> drivers/pinctrl/pinctrl-artpec6.c:867:25:    expected void volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-artpec6.c:867:25:    got unsigned int *reg
> 
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
> ---




> Cc: Lars Persson <lars.persson@axis.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-kernel@axis.com
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/pinctrl/pinctrl-artpec6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
> index 986e04ac6b5b..439a997b6bdb 100644
> --- a/drivers/pinctrl/pinctrl-artpec6.c
> +++ b/drivers/pinctrl/pinctrl-artpec6.c
> @@ -798,7 +798,7 @@ static int artpec6_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  	enum pin_config_param param;
>  	unsigned int arg;
>  	unsigned int regval;
> -	unsigned int *reg;
> +	unsigned int __iomem *reg;

	void __iomem *reg;

We're using as an argument to readl()?

>  	int i;
>  
>  	/* Check for valid pin */
> -- 
> 2.24.0
> 

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
