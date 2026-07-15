Return-Path: <linux-gpio+bounces-40100-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uUqVDF5BV2rEIAEAu9opvQ
	(envelope-from <linux-gpio+bounces-40100-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:14:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2E975BC67
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:14:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BiLuzT9k;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40100-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40100-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B3CA30067A9
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9A33CAA2F;
	Wed, 15 Jul 2026 08:14:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02C3C7685
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:14:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103257; cv=none; b=TshsKuCYoz+KeBLVkuXc7dQVyGew359tB9RueAtucNSoK8bee1EL+IEz027+xRF2cJsyH9QaTeX/TwOoUqylVQP4WmenD/DM5I0zE//sCocE45Tp8GsFFsvlYsABEoNBGwT3nbN/swWzoGRRiLktUnWOZWJvUskA/+ymMDysEmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103257; c=relaxed/simple;
	bh=Xbj4Fpyb8sudi7VfnET8afsvimGSmtQ+d0AYrPbJ4LQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Izt0F9jW0Xjc66kvAMN7+U2M0LaSYB2plU79O1UdaoVvqdYrJdD/7AzOAv15ucRcEp9ZS9+vVc8EoKKbgF2s/nGyXGPQ5ZMWKrhHYjWqwfkFY3Z4EG+zPwFABlgTt0j/0qea4gUVBr4+zzESM41UG+FnJHPlXkhYVjgMpvNHzzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiLuzT9k; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804541F00A3E
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103256;
	bh=2Tn6XIPZu6ZTk85lCpL0PLwZwWQy2iXUZrc+HzZ20Cg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BiLuzT9k66iZr/kE41oySL8+/WHbkcX2Gzm6q+uXSRHBl0nOrRiJ7AmiMkimqcBK+
	 +pvQJqnz0Hj3mFClMfnO+WKyS8pRsqAN2QBX655LP4r7RJJXEmPB1qbPkE4rTzrLTV
	 hUFLDTvto/8pVf3HrCnxHJG98XGwT0Z7WBUSuw21rI+MlfGff7Zuyfqi3pq7AgQqx8
	 0H3SCX+zZOP01uTiqTrEvIARgLIW7xwVA1a/lIbWsH1/nQhiO7cboLPoBXshjyUBJp
	 rNgNBQ13lMq6+1aAfSnllgVHeYxfsie30d8Oga8D4gQxUC7gueOLL+281tM9w0LBuc
	 OQnyvwCt/JOUw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so7535409e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 01:14:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoXOHVE6/DvblshqMwgNqNEVpOXe4X+vdORbCvN549NKRn/cHPhG9IUeGrZCK9r1IFeXwbnf/neit2e@vger.kernel.org
X-Gm-Message-State: AOJu0YxOqmlBcc0/eErcU9sde0vnM7Ggw50hL3Gugok8fBkfAgvt3S+I
	ysJ6wHNWU0hyNXq0RPdV6HbZPz4QHhpk9YXJ5DFwCeW1fOnDpJYor9lnx5ryFLndTv4RqCAa0Vn
	mRIcGNRe28taVpac8SB3r5OOsBgSJ9LRcF91faDGAiQ==
X-Received: by 2002:a05:6512:6691:20b0:5aa:6e86:55e5 with SMTP id
 2adb3069b0e04-5b158259071mr1149428e87.13.1784103255165; Wed, 15 Jul 2026
 01:14:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 01:14:14 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 01:14:14 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260715080747.1638097-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715080747.1638097-1-chou.cosmo@gmail.com>
Date: Wed, 15 Jul 2026 01:14:14 -0700
X-Gmail-Original-Message-ID: <CAMRc=McauRSXGQfCSDCQD6bM78f91yxPGFGn+QE4oJG=KfmUkw@mail.gmail.com>
X-Gm-Features: AUfX_mxaiUCrnljmC66dl2tD6cjzJ-COL8OTuJd71_8AqlyFeIXYAm0XeLoeDJA
Message-ID: <CAMRc=McauRSXGQfCSDCQD6bM78f91yxPGFGn+QE4oJG=KfmUkw@mail.gmail.com>
Subject: Re: [PATCH] leds: pca9532: Fix phantom device registration on missing hardware
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-leds@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com, lee@kernel.org, pavel@kernel.org, riku.voipio@iki.fi
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40100-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:chou.cosmo@gmail.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-leds@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:lee@kernel.org,m:pavel@kernel.org,m:riku.voipio@iki.fi,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF2E975BC67

On Wed, 15 Jul 2026 10:07:47 +0200, Cosmo Chou <chou.cosmo@gmail.com> said:
> The initial PWM and PSC register writes in pca9532_configure() do not
> check the return values of i2c_smbus_write_byte_data(). If the I2C
> device is physically absent from the bus, the write fails with -ENXIO.
> However, the driver ignores this error and allows probe() to complete
> successfully.
>
> This results in the registration of phantom LED class devices and
> gpiochips backed by non-existent hardware. Subsequent GPIO reads from
> these phantom chips return bogus values (due to -ENXIO being truncated
> to an unsigned char in pca9532_gpio_get_value()), silently corrupting
> hardware state tracking in userspace.
>
> Propagate the I2C write failures back to probe() so the driver core
> can gracefully abort binding and release devres-managed resources.
>
> Fixes: e14fa82439d3 ("leds: Add pca9532 led driver")
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---
>  drivers/leds/leds-pca9532.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index f3bf59495b68..9606c5b294ed 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -397,10 +397,14 @@ static int pca9532_configure(struct i2c_client *client,
>  	for (i = 0; i < 2; i++)	{
>  		data->pwm[i] = pdata->pwm[i];
>  		data->psc[i] = pdata->psc[i];
> -		i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
> -			data->pwm[i]);
> -		i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
> -			data->psc[i]);
> +		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
> +						data->pwm[i]);
> +		if (err < 0)
> +			return err;
> +		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
> +						data->psc[i]);
> +		if (err < 0)
> +			return err;
>  	}
>
>  	data->hw_blink = true;
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

