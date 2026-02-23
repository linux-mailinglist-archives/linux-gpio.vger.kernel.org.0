Return-Path: <linux-gpio+bounces-32006-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q8FONVqbm2lo3QMAu9opvQ
	(envelope-from <linux-gpio+bounces-32006-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 01:12:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 291FB170E64
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 01:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8836300BD86
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 00:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B303A1CD;
	Mon, 23 Feb 2026 00:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="X9xzzv/7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5141D3EBF38
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 00:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771805527; cv=none; b=RFOP2ZhYj4C9R7F0HbQAisEU2z4MjSyUpMF8Jzhx9TxQKMKfowTf6cggCDxfNuFnbMw5kQmQLLw1D5PPqIXuWcg19EkxwxV34fy5vfOh+kwIojcwS+qJD6MbkBVV85XOpkjzEpO4qnKe3ySSa8RA9JtNUbdl5ZN4k8eRqK7Ubh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771805527; c=relaxed/simple;
	bh=8Q5y8U7qqQeIu9CIhdT2hDo15btgbsbWGqFIvIoUBDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POQH3y0XTzktZ+7egbqmEY8RcXMBWMwfpI6VipPnryzR8vGddq7NiQnfAFO6LIBlo57WCoJNA4G9brCMYP+Mrmjkgu5Pr/gAFcxDDI/OKbOfX2E2v94s7NFVOLFrvh0ScNzv0qZDbH686j5hnXGI++HtP9uB+8a1yvM/W9dLRoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=X9xzzv/7; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-414ffb4c0a0so3236786fac.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 16:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771805524; x=1772410324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
        b=X9xzzv/72fYyctuKzLyyvXQMtxVQw9h4CR8rvuGExyrFRH6L8oqor1dVrrzvcvMDgL
         DTHqqfIx60037AmiVUfBOt7jIr1nzWT5gjZxR3uSWgERASYFMLYOOJHr7Yd2dT1C+xDn
         Z5uTwmvG9v1dV/pPMYEHzoKralsQIVFb1FdZKlttB4XLRjvkR+T346dgqwOnIbHTArq8
         8zGsWVwTWdi9oce4+QpmXhjjxmrIP2LIwdOaX+JMJolOcTn8FjdpvEH6cRf9+4Duihbl
         mFNchiAz8VTyeCt96CLrqPFaRfuly2fJclRIOeIdwD8l3FbLk1OP6Cs1YiqNX4Vc1Zp/
         0Bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771805524; x=1772410324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
        b=XcLFSKdA+wqfawm2yAOsiNT/PzVwqX5rc2T1zhgq47Th1cqx1vxAv4+wrrcHBofvRY
         tibby12t/HXBo6p3/Ue2DZ11c2sXi+ZwjI0NhZrO6M0033AmzVVX7pEwzOdOjON1OcNK
         /+j/WytcKgLmxUMiu1cD5ZLziPqpAWe/SwUkxaA6HbhjeG4FeKcEt7AgoIEN6wLQSb2c
         Acl6JlNOXAtK9Gkrnvd5IYvSkcD3iETj0BxTVzL+HEQqxWLqGuIeftTtygUsvMuCm/Pl
         VjjA7MG2X8IN74chRL6mltj/ROf/giXtZqMH2o69hOhl7vMegL3K8X9v6Cu+614Anrn7
         cJLA==
X-Forwarded-Encrypted: i=1; AJvYcCWuZXAgpc4JnacYtLXY1Ala74gNlWwaLt/4+MiOxLTRt4xSyhBuxEmDHh+lTPlnyIe5Ht94bITnEfiX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/bebYpWwdICDqVBPEZkXITGpK9ktCojwR3eA37lB8iH00uRNQ
	4suvvWJHyI6TsLu758Wm2/1In8WD2sBeZEF3HcyHftPmRIglZfzgXpoBI1vmPTU8xTo=
X-Gm-Gg: AZuq6aKdhgDMJZUoVzx9kmlLUA1syrSw5pFT5GeXJucEbx00+LVRcwT3JegkSqJk/kb
	Nw9RyyUaubUuCYJ5HcPQbGyCttlts4PY/Nyle/UgdqeC+yB+h5STW1hRumspws+O9WSgmdSfiFT
	VhcwpJrI6VLawQyv9CeVS2wTKLnzkn/dkxRHj4jsD49eYKCg9UDkgss5bItkzjRT38s4YCkbdfH
	klClD2rzgns6SSsG23paosUK+V+a93rAymNubPWPh5lm1qQPCO4jJEFF+lOxjLrKJbYhpR70KLk
	IVJReOhQDunneH3a/EyuRenuJI5mu07GqHPy3pQXj4ZCMBHwb6lko2nfVQ+WKRGqvOMtRrRpfUg
	d6we/2hYqhGuT0A4sK+U9SU6SW1lsDQqtJWCYp5MOILF9KNsKibbZrvFwg7UMImFhqOwJtPKTjE
	DJvKrznakxpCQJhdzNkfJKsdt7SRHQT8WrxDGdZ/Juy5ZR5ygbhGmeyim2ylBoNjv7fpy+OYc=
X-Received: by 2002:a05:6870:f61b:b0:409:794e:fe9 with SMTP id 586e51a60fabf-4157b1b3fd3mr3557313fac.54.1771805524220;
        Sun, 22 Feb 2026 16:12:04 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:e37:2309:3937:4469? ([2600:8803:e7e4:500:e37:2309:3937:4469])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157ca3df7fsm6409978fac.0.2026.02.22.16.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 16:12:02 -0800 (PST)
Message-ID: <f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com>
Date: Sun, 22 Feb 2026 18:12:00 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
 <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32006-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,codeconstruct.com.au,kernel.org,jms.id.au,esmil.dk,starfivetech.com,outlook.com,gmail.com,amd.com,microchip.com,nvidia.com,sntech.de,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 291FB170E64
X-Rspamd-Action: no action

On 1/18/26 12:09 PM, Krzysztof Kozlowski wrote:
> Simplify error handling by removing two mutex_unlock() calls with
> scoped_guard().
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index e44ef262beec..bbe1cf712965 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,

Filling in some context from the existing code...

	for (i = 0; i < num_configs; i++) {
		param = pinconf_to_config_param(configs[i]);
		arg = pinconf_to_config_argument(configs[i]);

		if (param == PIN_CONFIG_LEVEL || param == PIN_CONFIG_INPUT_ENABLE) {
			/*
			 * Check for gpio driver not being probed yet.

>  			 * The lock makes sure that either gpio-probe has completed
>  			 * or the gpio driver hasn't probed yet.
>  			 */
> -			mutex_lock(&bank->deferred_lock);
> -			if (!gpio || !gpio->direction_output) {
> -				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
> -								arg);
> -				mutex_unlock(&bank->deferred_lock);
> -				if (rc)
> -					return rc;
> -
> -				break;
> +			scoped_guard(mutex, &bank->deferred_lock) {
> +				if (!gpio || !gpio->direction_output) {
> +					rc = rockchip_pinconf_defer_pin(bank,
> +									pin - bank->pin_base,
> +									param, arg);
> +					if (rc)
> +						return rc;
> +					break;

I think there is an unintentional change here.

scoped_guard() is implemented by a for loop. So the break statement is now
breaking out of the scoped_guard() scope rather than breaking out of the
outer for loop.

> +				}
>  			}
> -			mutex_unlock(&bank->deferred_lock);
>  		}
>  
>  		switch (param) {
> 


