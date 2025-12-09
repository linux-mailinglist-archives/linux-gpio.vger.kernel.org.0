Return-Path: <linux-gpio+bounces-29412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC73CB050B
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Dec 2025 15:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 891A53047657
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Dec 2025 14:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED252FDC49;
	Tue,  9 Dec 2025 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="QhX67Y+3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2404621E091;
	Tue,  9 Dec 2025 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765291379; cv=none; b=m0TySxpjPP4OV2JhjiJKmB1/a6JgE96Q5oNaZZQdXxrz97eAYqz31F9sQY6MYp8KkDrSOZVTSAoTOwKmGEiqkIzlEAZ/WJj+eER23N2ak+58Edvc4U4+khyZqvCSrOhR9Rvf/tZS/yuxogrZ5lLwj74F9Q4EpxGxiZX46QhsrB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765291379; c=relaxed/simple;
	bh=+sF/pv9vcz5epxwdyo7uTf1mxLgPRZj50nuZZvIBF4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWgpD0ElJ/U3snNMRiYyWsM7ruHmUf682e94P1bYhQU5TUuVLaOw/YpacriNTxNge8Lb3xjbOHd2KBNg/OfG679x5W0YholtJLiNpN6/3Nlg9j1GTC9iuqe77ThkrEvcYn+1U7P21Dbq8nx8DXEvp8E1kLxAFmZXHrvffEA14es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=QhX67Y+3; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <daniel@gibson.sh>)
	id 1vSyvT-000bd9-Ev; Tue, 09 Dec 2025 15:42:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gibson.sh;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=0e2zYvfVdupmsBzM7T/N87KGFF/FU3b8mr8dYJUWnbw=; b=QhX67Y+3z6/AgltXu4j+d8l+PS
	k2xNaeT2fC2ozIQLJHjaT5ZevrmrT3fPXLuBW5r94423cnYW7iq5eBS/fejoD2O40jL46zVU6pUfe
	kmfW3QNITqeD5k0nhOpIl+4h5EXci3uxJt1PogZ+p2xOScwpbEotE3QC/Sz8mItDkRXsgJ1Fufcfe
	pc3GZy/DfCR6gVL3twJpNdZRxA7g6n39udWoisfujMGHctWOhIFL5t5OTglFpaYiKQgNrH0rTkO/g
	byJ5g9K/5Tv/W/iSDnmwFn8Dc0vahb06F6tYSUi5MvrG2Lo+0dWo+PBXFrwizGghwDu7WWLWYRy1G
	iPrSGOzw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <daniel@gibson.sh>)
	id 1vSyvT-0007aI-00; Tue, 09 Dec 2025 15:42:51 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1104311)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSyvH-00CZEv-Re; Tue, 09 Dec 2025 15:42:39 +0100
Message-ID: <89a59ff8-b016-4bff-96da-92868aeee401@gibson.sh>
Date: Tue, 9 Dec 2025 15:42:38 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: it87: balance superio enter/exit calls in error
 path
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251209061237.7949-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: de-DE, en-US
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <20251209061237.7949-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/9/25 07:12, Bartosz Golaszewski wrote:
> We always call superio_enter() in it87_gpio_direction_out() but only
> call superio_exit() if the call to it87_gpio_set() succeeds. Move the
> label to balance the calls in error path as well.
> 
> Fixes: ef877a159072 ("gpio: it87: use new line value setter callbacks")
> Reported-by: Daniel Gibson <daniel@gibson.sh>
> Closes: https://lore.kernel.org/all/bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpio-it87.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
> index 5d677bcfccf2..528ac1890613 100644
> --- a/drivers/gpio/gpio-it87.c
> +++ b/drivers/gpio/gpio-it87.c
> @@ -254,9 +254,8 @@ static int it87_gpio_direction_out(struct gpio_chip *chip,
>  	if (rc)
>  		goto exit;
>  
> -	superio_exit();
> -
>  exit:
> +	superio_exit();
>  	spin_unlock(&it87_gpio->lock);
>  	return rc;
>  }

Moving this after exit: means that superio_exit() is also called if
superio_enter() failed, a few lines above this patch:

	rc = superio_enter();
	if (rc)
		goto exit;

I don't know if this is really wrong, but it looks fishy and this code
behaved differently for years - in contrast to the change to skip
superio_exit() if it87_gpio_set() failed, which is very recent,
introduced when the return type of it87_gpio_set() was changed from void
to int.

Probably (again, I don't know if this is actually wrong, I'm not that
familiar with how this chip works) superio_exit() should remain above
`exit:` and `if(rc) goto exit;` after `rc = it87_gpio_set(chip,
gpio_num, val);` should be removed, so:
- if superio_enter() fails, its error code is returned,
  but superio_exit() is *not* called
- the it87_gpio_set(chip, gpio_num, val); return code is returned by
  it87_gpio_direction_out() no matter if it succeeds or fails,
  but in either case superio_exit() is called


Cheers,
Daniel

