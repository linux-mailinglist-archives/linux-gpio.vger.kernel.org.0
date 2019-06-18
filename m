Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 409D94995B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 08:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfFRGvf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 02:51:35 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33669 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfFRGv1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 02:51:27 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hd74h-00043F-Nn; Tue, 18 Jun 2019 07:54:31 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hd74g-0003YQ-M8; Tue, 18 Jun 2019 07:54:30 +0200
Date:   Tue, 18 Jun 2019 07:54:30 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thorsten Scherer <t.scherer@eckelmann.de>
Subject: Re: [PATCH 1/2] include: linux: siox: more for declaring siox drivers
Message-ID: <20190618055430.q6iytvliqkwd4w22@pengutronix.de>
References: <1560795688-10496-1-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1560795688-10496-1-git-send-email-info@metux.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 08:21:27PM +0200, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
> 
> Add more helper macros for trivial driver init cases, similar to the
> already existing module_platform_driver or module_i2c_driver().

Inconsistent use of () after macro names.

Other than that (and my remark for patch 2) I'm ok with this series.
Usually Greg (on Cc:) merges siox stuff, but I don't expect anything to
happen which conflicts with this series so I think it's fine if both
patches go in via the gpio tree.

> +
> +/* module_siox_driver() - Helper macro for drivers that don't do
> + * anything special in module init/exit.  This eliminates a lot of
> + * boilerplate.  Each module may only use this macro once, and

Given there is only one siox driver in the tree, "a lot" seems bold, but
I don't mind it.

> + * calling it replaces module_init() and module_exit()
> + */
> +#define module_siox_driver(__siox_driver) \
> +	module_driver(__siox_driver, siox_driver_register, \
> +			siox_driver_unregister)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
