Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 795C84A698
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 18:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729720AbfFRQRu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 12:17:50 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54195 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729496AbfFRQRu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 12:17:50 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hdGns-0000w4-7C; Tue, 18 Jun 2019 18:17:48 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hdGnr-0008Mt-Ge; Tue, 18 Jun 2019 18:17:47 +0200
Date:   Tue, 18 Jun 2019 18:17:47 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org, t.scherer@eckelmann.de
Subject: Re: [PATCH v2 1/2] include: linux: siox: more for declaring siox
 drivers
Message-ID: <20190618161747.65y52fqr6toavdtb@pengutronix.de>
References: <1560854427-27537-1-git-send-email-info@metux.net>
 <1560854427-27537-2-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1560854427-27537-2-git-send-email-info@metux.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Cc: += Thorsten Scherer

On Tue, Jun 18, 2019 at 12:40:26PM +0200, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
> 
> Add more helper macros for trivial driver init cases, similar to the
> already existing module_platform_driver() or module_i2c_driver().
> 
> This helps to reduce driver init boilerplate.
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>

I like the change. Just noticed that the Subject line is a bit strange
though. if "more for" is proper English then it's news to me. I'd write:

	siox: add helper macro to simplify driver registration

> ---
>  include/linux/siox.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/siox.h b/include/linux/siox.h
> index d79624e..d53b2b2 100644
> --- a/include/linux/siox.h
> +++ b/include/linux/siox.h
> @@ -75,3 +75,12 @@ static inline void siox_driver_unregister(struct siox_driver *sdriver)
>  {
>  	return driver_unregister(&sdriver->driver);
>  }
> +
> +/* module_siox_driver() - Helper macro for drivers that don't do

I'd prefer /* on a separate line as documented in
Documentation/process/coding-style.rst (for non-net code).

> + * anything special in module init/exit.  This eliminates a lot of
> + * boilerplate.  Each module may only use this macro once, and
> + * calling it replaces module_init() and module_exit()
> + */
> +#define module_siox_driver(__siox_driver) \
> +	module_driver(__siox_driver, siox_driver_register, \
> +			siox_driver_unregister)
> -- 

Sorry I didn't notice these two things in the first round already.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
