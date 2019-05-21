Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFFE2530D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2019 16:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbfEUOyf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 10:54:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:58656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727986AbfEUOyf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 May 2019 10:54:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41A02208C3;
        Tue, 21 May 2019 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558450474;
        bh=q76YsG3uawMWYs8CZinrfkZpJKQnocFUK8DNC48Mgd0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E9FUmk28xmIgNCQi/vDn0xepr+T+p7uLIIF5bV8DO2WUu1vV9DdkChNyZc0jBXCwK
         iM26xnUlj7JRW9hTmIcv116tGGhAJIxUQ9oWjSDpx04pHoym9ocHvTzPd5nO7XIExG
         uDQYlTYcEcTBwBegwx44ukDY15riNqUIEo2bor1E=
Date:   Tue, 21 May 2019 16:54:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     houweitao <houweitaoo@gmail.com>
Cc:     linus.walleij@linaro.org, yamada.masahiro@socionext.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        baohua@kernel.org, jslaby@suse.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, davem@davemloft.net, rostedt@goodmis.org,
        mingo@redhat.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        sparclinux@vger.kernel.org, houweitao <houweitao@xiaomi.com>
Subject: Re: [PATCH] tracing: fix typos in code and comments
Message-ID: <20190521145432.GB3491@kroah.com>
References: <20190521144740.22490-1-houweitao@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521144740.22490-1-houweitao@xiaomi.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 21, 2019 at 10:47:40PM +0800, houweitao wrote:
> fix ingore to ignore in kernel; since there are other
> mistakes can be found with "git grep ",fix all
> 
> Signed-off-by: houweitao <houweitao@xiaomi.com>
> ---
>  drivers/pinctrl/uniphier/pinctrl-uniphier-core.c | 2 +-
>  drivers/rtc/rtc-sirfsoc.c                        | 2 +-
>  drivers/tty/serial/mxs-auart.c                   | 2 +-
>  drivers/tty/serial/serial_txx9.c                 | 2 +-
>  drivers/tty/serial/sunsab.c                      | 2 +-
>  kernel/trace/trace.c                             | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

You have to split this up into patches for different subsystems, and use
your real name.

thanks,

greg k-h
