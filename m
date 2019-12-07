Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF7C115D81
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2019 17:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfLGQ2z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Dec 2019 11:28:55 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:52938 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbfLGQ2z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Dec 2019 11:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1575736132; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IpyMBdwF5y8UNztBuEan4whDPj/FuBdwiixrnrTDE20=;
        b=L4NqW+Jeqtj7p7rDomQ0Izq0nxzN3lqfek97EXOZ9d0eZV8J2zbYkoVl8ft0lXfAQZ79Gu
        emYNqAIDca3I0+faYWGmqIZGaMyw9/Jd1z/cbu+UACAFgKXWLMZBGlTNcYnEOXJIYJjuuT
        YNYDv1N/jfqLdLKSdobsizDOL/j8od8=
Date:   Sat, 07 Dec 2019 17:28:47 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 8/9] mmc: jz4740: Convert to
 pinctrl_select_default_state()
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-mmc@vger.kernel.org
Message-Id: <1575736127.3.1@crapouillou.net>
In-Reply-To: <20191206170821.29711-9-ulf.hansson@linaro.org>
References: <20191206170821.29711-1-ulf.hansson@linaro.org>
        <20191206170821.29711-9-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,


Le ven., d=E9c. 6, 2019 at 18:08, Ulf Hansson <ulf.hansson@linaro.org> a=20
=E9crit :
> Let's move away from using pinctrl_pm_select_default_state() as it's
> scheduled for removal and use pinctrl_select_default_state() instead.

Looks good to me,
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> Cc: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/mmc/host/jz4740_mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mmc/host/jz4740_mmc.c=20
> b/drivers/mmc/host/jz4740_mmc.c
> index 78383f60a3dc..fbae87d1f017 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -1108,7 +1108,7 @@ static int jz4740_mmc_suspend(struct device=20
> *dev)
>=20
>  static int jz4740_mmc_resume(struct device *dev)
>  {
> -	return pinctrl_pm_select_default_state(dev);
> +	return pinctrl_select_default_state(dev);
>  }
>=20
>  static SIMPLE_DEV_PM_OPS(jz4740_mmc_pm_ops, jz4740_mmc_suspend,
> --
> 2.17.1
>=20

=

