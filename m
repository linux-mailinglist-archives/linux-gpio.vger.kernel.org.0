Return-Path: <linux-gpio+bounces-8260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DB59347A5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 07:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BF68B210E7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 05:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC25244C7C;
	Thu, 18 Jul 2024 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uFMS5Auj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D99638DE5;
	Thu, 18 Jul 2024 05:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721280916; cv=none; b=uZcC/Ou1DMOelNExL33lOndNo+fC/elQPPNjRgVjnrPaQT1PqD5H62ZBhpkX5qWTSoUQ9x9DoryfF2jfbXtM8MnThcaq2gk+xfBxWRACrfMRRk5x2i6bg9C2EV8XYE6MDu/lI8Qxa9oDp5Ix+FEcH/uI+KHEU7671U8w9Nkhwcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721280916; c=relaxed/simple;
	bh=554arJlAyY+yMIrtdQmrj1Ybfg3uQbn9nKNnJDo95vI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEajM6Jqdd/dXSSPISn8p133tsZqP/Jo0DhowlTOyScRqT8ZurYNS9lL+yZZgorErMjt2MylwowZoGT+AiJthO4id1vHzcApOkKtWxJTwHi1Hs7AcYNh36RUZHnjMOAcLo2kN4Pkpr/Atmji/DJFq3tHbufgei7rjrl9pHvcook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uFMS5Auj; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46I5ZB9t107915;
	Thu, 18 Jul 2024 00:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721280911;
	bh=fMUuTgKi6BATBFx4lgMh4QmXOqcHrSmeENQuJ8BZjws=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uFMS5AujdFaRjkktNid3HCjhGCNiW69UGQL5Ivx3ODDB18XQfuDyjBLBxg4oqw0t5
	 i8Al/hucrpoal09dBvZ+NAu33+hpRizdx3tTCaYMN0fVzNYLbUu/Ogf86ZTEVDXp2E
	 5YFeb/K6rVKTsRVCirpDDNtNYBeAUv2PHFaZ7THg=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46I5ZB7Y001025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Jul 2024 00:35:11 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 00:35:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 00:35:11 -0500
Received: from localhost (dhruva.dhcp.ti.com [172.24.227.68])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46I5ZA24006332;
	Thu, 18 Jul 2024 00:35:11 -0500
Date: Thu, 18 Jul 2024 11:05:10 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kevin Hilman <khilman@baylibre.com>
CC: <linux-gpio@vger.kernel.org>, Keerthy <j-keerthy@ti.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        open list
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpio: davinci: handle wakeup-source property, detect
 wake IRQs
Message-ID: <20240718053510.ywdv5c7fk3natknl@dhruva>
References: <20240718000935.2573288-1-khilman@baylibre.com>
 <20240718000935.2573288-3-khilman@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240718000935.2573288-3-khilman@baylibre.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On Jul 17, 2024 at 17:09:33 -0700, Kevin Hilman wrote:
> If the wakeup-source property is used for the GPIO controller, then
> mark the controller as wakeup capable.
> 
> Further, if there are any GPIO IRQs that are marked as wakeup-enabled,
> then mark the GPIO controller as wakeup enabled also.  Since the GPIO
> IRQs that are wake-enabled are dynamic, this is (re)calculated during
> each suspend (and cleared on resume.)
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  drivers/gpio/gpio-davinci.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 1d0175d6350b..031aa7c30855 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/consumer.h>

Please sort this...

[...]

With that taken care,
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva

