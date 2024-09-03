Return-Path: <linux-gpio+bounces-9690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8612796A4E8
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B83D61C23B36
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A5818BC13;
	Tue,  3 Sep 2024 16:57:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE417A90F
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.254.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725382656; cv=none; b=WBvTFhsUWC3jW1xL4jit3up1S4w5j+/gnywk+aFuBIKdk3tqgFQcXuM2ZdN4aluhT54yaRAhtC31l7YU+e2VpfkDO7ig2+mW4uJntyeTAAsWREAl5PdCVPTbJHgOFEst1TQ7UvieycvqClWBQNKKLoXZEJ3cZHO5evG1H4GHOyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725382656; c=relaxed/simple;
	bh=CH7xX3WmupAgXf7ywAmQtoAEt/RMfdbpPzlnG5d6wWo=;
	h=To:From:Subject:Date:Message-ID:References:Mime-Version:
	 Content-Type:In-Reply-To:Cc; b=ijyKeMMqhYuKEGcWhXUxoIWba49FwoD6F1rzGbG2LbILigVqL57RaATTqHh9CT7/RBycZIrrPPTeMIXcrB2n3Ti73oeDQ6vCRm8ZTeiAPJh/bWudU5kMHZ9zV9KSKmGaKLL4jNDE+feU/GLjB5004+4e7Uz5faUpK/gi6s5YwU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=m.gmane-mx.org; arc=none smtp.client-ip=116.202.254.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.gmane-mx.org
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <glg-linux-gpio@m.gmane-mx.org>)
	id 1slWlS-000AIw-Bh
	for linux-gpio@vger.kernel.org; Tue, 03 Sep 2024 18:52:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: linux-gpio@vger.kernel.org
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v3 12/12] gpio: rockchip: replace mutex_lock() with
 guard()
Date: Tue, 3 Sep 2024 18:52:16 +0200
Message-ID: <6555c378-f230-480e-9dd4-625ea550074f@wanadoo.fr>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
 <20240903073649.237362-13-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr-FR
In-Reply-To: <20240903073649.237362-13-ye.zhang@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org,linux-rockchip@lists.infradead.org,linux-kernel@vger.kernel.org

Le 03/09/2024 à 09:36, Ye Zhang a écrit :
> Replacing mutex_lock with guard() simplifies the code and helps avoid
> deadlocks.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>   drivers/gpio/gpio-rockchip.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 73e57efb46fc..d5c57617fc86 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -765,20 +765,19 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	ret = rockchip_get_bank_data(bank);
> -	if (ret)
> -		goto err_disabled_clk;
> -
>   	/*
>   	 * Prevent clashes with a deferred output setting
>   	 * being added right at this moment.
>   	 */
> -	mutex_lock(&bank->deferred_lock);
> +	guard(mutex)(&bank->deferred_lock);
> +	ret = rockchip_get_bank_data(bank);

rockchip_get_bank_data() was out of the lock before, now it is inside.

It looks ok, but is it on purpose? If so, maybe it could be mentioned or 
explained why in the changelog ?

CJ

> +	if (ret)
> +		goto err_disabled_clk;
>   
>   	ret = rockchip_gpiolib_register(bank);
>   	if (ret) {
>   		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
> -		goto err_unlock;
> +		goto err_disabled_clk;
>   	}
>   
>   	while (!list_empty(&bank->deferred_pins)) {
> @@ -805,14 +804,11 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
>   		kfree(cfg);
>   	}
>   
> -	mutex_unlock(&bank->deferred_lock);
>   
>   	platform_set_drvdata(pdev, bank);
>   	dev_info(dev, "probed %pOF\n", np);
>   
>   	return 0;
> -err_unlock:
> -	mutex_unlock(&bank->deferred_lock);
>   err_disabled_clk:
>   	if (bank->manual_clk_release)
>   		clk_disable_unprepare(bank->clk);



