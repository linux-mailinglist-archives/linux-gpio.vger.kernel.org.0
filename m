Return-Path: <linux-gpio+bounces-31990-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M7/ItbpmWlnXQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31990-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 18:22:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 253BC16D5EB
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 18:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1B093066422
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 17:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0E92877CF;
	Sat, 21 Feb 2026 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1dMp0pvB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC23618872A
	for <linux-gpio@vger.kernel.org>; Sat, 21 Feb 2026 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771694506; cv=none; b=CDHOJkr8W7IDYBs48jOMXwuTXVHbwQF+bx0bh9zs78fXbAsx9nr59IolBuMDVhvklot4Sv9fzbMRp3gf7slWgJOLBl5842PDvHJnuvUhp6R6MRfqB8KI7og55+sm0teHdscY4EJByBJmeMakYsCgGBMX6X1jGzIoJWDcVHZ0tnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771694506; c=relaxed/simple;
	bh=HX8Wjejxs9SblZXe1zexUK/AgCbHBl2YK9FZzjvdrF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YzdRjZozMuZQfTyZ5sIo460NjWi/jicnXPQn8Ocq3ApN4CapoGeKuSeZTih0YXp91vwkoQW+NejFkn8s9HH+fkBI+u6wD4QIeBo5UEJ9AmtC3ncnrtjvRSXa1XjKkcub43DNsz4lU6ANYX2A0gVAfyOVy5KM03ZYHi1mhd0JltA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1dMp0pvB; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-45effa36208so1936691b6e.1
        for <linux-gpio@vger.kernel.org>; Sat, 21 Feb 2026 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771694504; x=1772299304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FxXe4ilYefGxi3OGmxieGZpHIIMSFQ3LuTkepN5BPTs=;
        b=1dMp0pvBBcT72yRVmnDpVDdmkyvFOhFe9V4klVqf6d2mk+UUQAZhYDMcCTF21ebmpt
         z++ZqktLNWYodL72ZYcb914pgFJHgDZz0K08ucmQkxe0wTrhVtU+tEtHAENg1rgK4qtY
         x9fx4q52HQBGw+793fo8nkuduB9kCtJ67wIuVsSMdnAFWBc8+MqnTEgYKbNUvEO9TxYN
         KRrnG/bAWD09+P/4Nrr3QeMnmPV95Kl410bx7/KzeinLAPM5YDzPSg2othCqSfukGllm
         rDVPcLPs0ItrlmIItJqxA9BcCthufi+tmsmmJ8vOvTug8NyVfyhsB8UMha5zpSuJ1yTF
         5aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771694504; x=1772299304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxXe4ilYefGxi3OGmxieGZpHIIMSFQ3LuTkepN5BPTs=;
        b=gx8A4Vw5NxShWnPbz8TBLUXIL4XJFNNZcyy8K/0gqJxnDBKa8X7TTgLwNxhWZC6wrc
         RsaZusa4COPdgyLKgDNX+nPjhRaydQSPu1XEPJq053KBNHUTTOyfKp5SLOKrfmeaFluk
         eSKkFbKdy/Ot2BukaJqaQ2/8zt2T4j4V79El5E3I/IxT2nF3Q1Ltimk02oXqqC+dIMrj
         uiip8OY0x6S7oo+kKxNP4bcp6RE6SFGcXOR2aZ04MradVggcX7RO0Uc/SoLvqxxYoepm
         Nz9db99Ie9E9qeEAUGPMgLu55t3e8avkbFCrRT4zj6YJYZgt1MSS7sa0SWo6RqpaW4ky
         sSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbD6XETvJucuGHF9dXnksROm1wih5MS4wvkC/WQxykePdUGLGoa9cXFLtP1rP0VnVaYQxXX2FPGI7W@vger.kernel.org
X-Gm-Message-State: AOJu0YzuBenA/ZwtY/PS50XUoZMVbQVhvheSdlz5wd3A0JAxwYSDxdSV
	DRjXCzUg+12y7vWv57rW/5usnaFe96oAZygTmUYTjWMXRUy8r1xrUp2NG9cSKuCBJN8=
X-Gm-Gg: AZuq6aKtiZaP1D7HkPBweTtL9g1wDLrb5aeafOMEhJli84aG58fMn/nKu+0BXsXDB7N
	a0u0UVlss95KFj/8z7JpmeLmfMH+6iViQnvOGQa5RNyisMc774IjYMEBh2vh7hY/hoepSYEs6aR
	N8+jmI5UpXwjI/ZDefWq2gDmgqNSaNKtxEewOhRMhHdMGUxMrP1Uh51aj6ND8Sp4rooZMp20e9E
	aEF03ldVz63jo4oOcvt7+MoRDGu+mIR5dQ3hTckjrEtSrnVHHTR5JxPlpaXkAS6XGrCQk1XMRA2
	h+wVI7p8Hxngaode7Cj/3gKEgVzrPC1an0f4w8eVKiSuf9Uc4u9+xePpHHMNRzhROWxO8l2BJJJ
	ENFZx4/91dc2dcdOf8geA3GjE5jmHgzTYtFaVK8/Z8jXHP4M/Q7Equr1w/6MQpxp0p1ZbUM19rq
	zGy+xyknXrDq92+ue6ccdUnHvwteZ4QxDiiwhTQ/E6iYG+V6wofz2XfYNSKhVbGv+6qUBzUQ==
X-Received: by 2002:a05:6808:23d1:b0:462:a915:31aa with SMTP id 5614622812f47-4644640b4c0mr2054950b6e.63.1771694503792;
        Sat, 21 Feb 2026 09:21:43 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:611:96af:f385:64bf? ([2600:8803:e7e4:500:611:96af:f385:64bf])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a012dc7sm1839578b6e.6.2026.02.21.09.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 09:21:43 -0800 (PST)
Message-ID: <6c8809a2-04fd-4044-a07e-8b74c964ead6@baylibre.com>
Date: Sat, 21 Feb 2026 11:21:42 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] iio: adc: ti-ads7950: do not clobber gpio state in
 ti_ads7950_get()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-3-dmitry.torokhov@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260219022929.3558081-3-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-31990-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 253BC16D5EB
X-Rspamd-Action: no action

On 2/18/26 8:29 PM, Dmitry Torokhov wrote:
> GPIO state was inadvertently overwritten by the result of sip_sync,
> reuniting in ti_ads7950_get() only returning 0 as gpio state (or error).
> 
> Fix this by introducing a separate variable to hold the state.
> 
> Reported-by: David Lechner <dlechner@baylibre.com>

This should have a Fixes: tag since it is fixing a real bug.

Also, fixes should come first in the series.

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/iio/adc/ti-ads7950.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> index b8cc39fc39fb..2a7d4a1d9fa9 100644
> --- a/drivers/iio/adc/ti-ads7950.c
> +++ b/drivers/iio/adc/ti-ads7950.c
> @@ -427,13 +427,14 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
>  static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct ti_ads7950_state *st = gpiochip_get_data(chip);
> -	int ret;
> +	int ret = 0;
> +	bool state;
>  
>  	mutex_lock(&st->slock);
>  
>  	/* If set as output, return the output */
>  	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
> -		ret = (st->cmd_settings_bitmask & BIT(offset)) ? 1 : 0;
> +		state = st->cmd_settings_bitmask & BIT(offset);

I agree it would be better to put...

		ret = 0;

here.

>  		goto out;
>  	}
>  
> @@ -444,7 +445,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
>  	if (ret)
>  		goto out;
>  
> -	ret = ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;
> +	state = (st->single_rx >> 12) & BIT(offset);
>  
>  	/* Revert back to original settings */
>  	st->cmd_settings_bitmask &= ~TI_ADS7950_CR_GPIO_DATA;
> @@ -456,7 +457,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
>  out:
>  	mutex_unlock(&st->slock);
>  
> -	return ret;
> +	return ret ?: state;>  }
>  
>  static int ti_ads7950_get_direction(struct gpio_chip *chip,


