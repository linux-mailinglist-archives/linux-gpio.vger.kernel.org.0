Return-Path: <linux-gpio+bounces-40038-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pob5HjHvVWpjwQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40038-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:11:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E7A75238B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:11:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=od5gKdG0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40038-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40038-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79AFC3004C8B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC75F3F7891;
	Tue, 14 Jul 2026 08:11:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6275A3F0AA0
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 08:11:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016665; cv=none; b=pi8cb6TD0BMSsBE4OPcuudn+MXFORMh7ku3hEfpo9DX+SWVeGR/9HfJepqEK5Tp4T7grZRNTt5AxcRRi6IcQ6pNqxhYRhcb0C4erospswvKt2IwmuCkBcYsk590JKo0NVLOaZpzzEUzj4+YRy+uvrHT3/F2W2qqng5eQpfpqePg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016665; c=relaxed/simple;
	bh=95yEhS2RY9tvQKYNJAneFxQrWu4TncTLuEUaUZafNCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYiT2yeTl7WD+tM6CqlNQONibgUQDdLoxmnnrYKK5G/HPSSlWubeUfABXmv/wURi+UuCsEs/7W/fdlNN77IM8m2m94QONrShwgh2PL91ovJT85qqU7/dKg34ECGrvljZ/V7dZht7ernP29IwlpqdW6VjQcGldhYN4sKusmSywpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=od5gKdG0; arc=none smtp.client-ip=209.85.215.178
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca7c1176317so2910106a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 01:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784016663; x=1784621463; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAS+vEtyAAAxc3NKkZi+AZEqveghGOCf+a2cUuueeZ0=;
        b=od5gKdG0kstqkk3D8c2JXxhgsC3ysrwdofxvZY/XwFQV+K5K7ROuRpyMXq+CHTIk9q
         pbcaoWrgulr4QXhJ90FcMrYSjHhdezLw2YL8CYOoUWkVLm8BLxxGVrS6F66fKtjnv9mI
         kkYv8WPl8QcYxQ4Pi8chNkJ8+qSbc0zJNpXQk7exwlk5m68nztwSczIfhpAyAqpsNPwa
         kI8r/sftwDSnQuaYap4qH5wZypH5v7tZNwLtD6KYt1iZEs2hqOfFA7CnqPkf9XvvMTeR
         QfjhhmqU525DZiM9xEhbj19xvqSlzZsVWO90u7KL1dXxA7bukDwMT2iWhjJ85Z9LYsRM
         yKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016663; x=1784621463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nAS+vEtyAAAxc3NKkZi+AZEqveghGOCf+a2cUuueeZ0=;
        b=OUmodu59gsrsNp+UTnIbY4zB55tH07vYf7yC+vKSKYR9sotxZHioQMMCm30aC+lpD6
         ywt5dYimxGwPaWlE5OisBrdTuarEG97cU9OamftCvCbCKu3YfYXfTiZ/6jq9cV13hYu2
         3LC9EXRZksBYg7hXb8oOIJ6cuR9XKEd6iFD1f0XJOxGPb8xWpyk/ubtqRvGsO5/MP3w3
         ipcWq5qE8/brPqFUjkVz9vO9h+VlT+rkdepl0wMvAlfKZyk8mqGaBnJYtew8SgpD78Rs
         b6Oskr1OuHB4D8nCRFcI/WI8mFTyrjEWw035u9hllFZZnNik22wy28yvu6ZAAVSupRUu
         tYSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+lsz1ofSICseOZ/Ra83kqTp1vnNiT6dzbvBI97IF0CWGrMiNXJ0LpfOMGXq4tJ8uzDQTvp1aFH8Ey@vger.kernel.org
X-Gm-Message-State: AOJu0Ywidr1srBvrLD65GHUfYTcRYWgRJQ8iNgo3Z3ZB2NIk0VHjKKTS
	k9uSZGZYszuuteDNmnZ4ajXRaPLYAW/U2yaGkWu+Ev5UM8Nv3v9xTbjhH5eqyf8cmZM=
X-Gm-Gg: AfdE7cnGUeo7LLsUVqEaZJQaQaLYPp/x0WEZXsPPZd8rDvSh3ofxD/GmhGzHCbl2+bZ
	J12nBiox30ZcclSyLaJpwzxTn9uSJbLUiHOSNWXeo/rklTp9OtNYLmdJ9IHVd9vvEnGSeoRRv2M
	fTqH2uC1Ckmr8zcmIOiizTPlan6gIB3fWlc3h5lypKsSuMTyDCOcTU6HIXrwOAc0ncfwMMgEPBI
	GBu9RSx0F6XcE4adtDk6L0johfC/Q8JKm9lYqrj950vp8QnowEwS4uKQx+cOkRsBmeu4quhiYNf
	JQlVaM+hdK+99qvP+tzeAhU+Qu+WTZyXRPJWQ/f4BJdIO28AHQvUOSA6AObl30MlOmCNJb+FA3X
	uQG3LusPSDUbJf6iS+5+1C79b2XKmBjDoHOOa5RGT3HQOUOJ/Q+pRbqAdQrAchjc55uWsV4e+gI
	mynbtNBOKZcZV9
X-Received: by 2002:a05:6300:67c2:b0:3b4:75c0:3ec0 with SMTP id adf61e73a8af0-3c1103d29f2mr12378480637.30.1784016662505;
        Tue, 14 Jul 2026 01:11:02 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm70644994c88.13.2026.07.14.01.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:11:01 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:40:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, 
	Viresh Kumar <vireshk@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v1 20/20] gpio: Unify style of various *_device_id arrays
Message-ID: <apbfpx4qdqnertxomfums55iznn75xl4aqzjjmjuhpw2r5d4gn@xybd6vdeyz5g>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <1f2d39342995533857417eb890628f7643b9a159.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f2d39342995533857417eb890628f7643b9a159.1784013063.git.u.kleine-koenig@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linusw@kernel.org,m:brgl@kernel.org,m:lixu.zhang@intel.com,m:sakari.ailus@linux.intel.com,m:info@metux.net,m:vireshk@kernel.org,m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-acpi@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[viresh.kumar@linaro.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-40038-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68E7A75238B

On 14-07-26, 09:24, Uwe Kleine-König (The Capable Hub) wrote:
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index 42871db05ec1..062c70fe4671 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -647,7 +647,7 @@ static void virtio_gpio_remove(struct virtio_device *vdev)
>  
>  static const struct virtio_device_id id_table[] = {
>  	{ .device = VIRTIO_ID_GPIO, .vendor = VIRTIO_DEV_ANY_ID },
> -	{},
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(virtio, id_table);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

