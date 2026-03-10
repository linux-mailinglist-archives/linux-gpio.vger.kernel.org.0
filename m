Return-Path: <linux-gpio+bounces-32876-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNPBJ8mlr2lpbQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32876-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 06:02:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A07DD2455CA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 06:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 653FD301AA83
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 05:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81ADF3B5315;
	Tue, 10 Mar 2026 05:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IxUDu1K1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F46F1EEA54
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 05:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773118913; cv=none; b=IZExLQBkdunxQR0+2p2Uvj6J2hoIQaq9gKsIRnNn0JEjBVg48sukGfBFx9oU219/lECNx024m05axdRLjzugMexcUeiGNaOqbPzEhj1jtdU87pCTzDas39fI+8sPRRnwaNSoYSu0iU+9vZgGBfuJn5nhtMpvsj/NkN63lXuBfgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773118913; c=relaxed/simple;
	bh=R3jMW8ZmkBtM32pcjgP9kGqpFKjlYsyUvI6+VjdQ3I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwgLdyRD4vs8rvJYMWn+hOBl94pFMSDgiQa6U3sSRTe+uhkviZMf8q/73FRo2V/5b5s6yG/EivF/c/TTX7lxIe4hbfhwl9fyox9rJT1ZpeQ8e97FzwzO/ZbYcBVEL0lyi3Zi2reJJcX7kN336E2U2DFuC1dpHIKJgReMZRuvWq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IxUDu1K1; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c7393c6832bso1749051a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 22:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773118911; x=1773723711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbT9TM6XMNn8MYcYe10K1UH44o/w1pSutn1XPvv9QwQ=;
        b=IxUDu1K10UrHhmTxmVyKYdjfKnfw8UOzh+O255D5f0ws9UQGsWTOw4wVGJ6LVIJad9
         0NwNPjEtFs7r3ZVDNK6NEIPUTJkX7EF985wGrm6jRY7IfrjLMypVBxdkK55YjIJx/Kpz
         bt8RZMYeY3ROXPWi0h3fgirbQRpqNdwtLqqZizZaTCdZLx/BjG3Jf4OHqNo4AwCCsCJQ
         pEwGwnBsGMFMPXOWs/LwWl2KHsDfnnkkf+DvkmbH8s2YlitsXMxvY4LquI4CoomiFSCz
         6p+cx/iKYmT1vYVVp5SRMWC0SnXOoFn+1L+VwVpEbJbeQmVZzniDzWld1ipDMv6jS7Rw
         N4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773118911; x=1773723711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbT9TM6XMNn8MYcYe10K1UH44o/w1pSutn1XPvv9QwQ=;
        b=OIzlU+i6/agBB7VIhwGQSbJ382iMvAqz4DiqWJl8NE6sZIVp+s14xIeW11iZYPdlch
         6DrmFKU0LJO1hu50vvjz3ZKiBBmOl40+wOic026B78BC4lM/5QgbE2o/MkQXu1GX/sH2
         TVhUOipy9xnIuJLo4e6z6jqhXmYoNBfLk92fXb2YBBBd9FKgvi8CLnv0/Y55/8+B3gGk
         VHEPFb7uGeCieVFIkAnzchkKGsnb/HL82GioBRILK1L0cOvf1gg18+EgsVujSHwvsoXC
         VIrrun41phENYCQgnxEKqnzQjoUE2cuIGFLrHkQ69xDoVsYvUKP19INCZ+AcdlXJhfkV
         v8OA==
X-Gm-Message-State: AOJu0YxBHTCd5faEvwP6kXZM8Cn6/sQBTQFcCYTz+PMkv/iuVULGs3gs
	4h93QiUbAfrpqW7iRfK7z49iV6MqKx5hJpnTM+ZnO1+7tkIUhSHBoCuFaYf6hdO55i8=
X-Gm-Gg: ATEYQzw5ueGomMZinbBUqa16Jnrk1xdrAuNSe4gmLokflmCL/3BzCYKNtjC29l8jaWq
	1ZIaZ+avO8Se/lC2r1qjCwnfsJE8KoT7RrMdE4Z/PTzTZf+SkDr8nXP37jHVd5PZ9hdFxk+YnJ4
	PpKEnskN0YMc8JardAe3/vOVd3hU1XbLGcFNKluuAhi/p0z68otkepzQADYn8JFHyn0AuAYOwDF
	Ark9QVurDoVgCn3NPOMAQz09wmG3koJ5x8eoUBYsEFxovsnyZDkElMyAaJGFilwyy38DgX04sBX
	8Z/G8Wce3TX/erf3EPGl8qfaaeGS9/z/8SbxRrfhpg2hNDuWMuONpZeUfqbYWFha7J1lDJxCHWj
	cekyYYXm8Q38/zu9mL7ymDITpa/3eL9gYGS/w1rVaZuTBI3s1C+dKMr/XuySHhgcjLzvxzRIMWm
	PS9ARFOHDT8K8QceUI1PRxPNkp
X-Received: by 2002:a17:902:f68a:b0:2ae:7f24:27ec with SMTP id d9443c01a7336-2ae82512971mr142991985ad.47.1773118911306;
        Mon, 09 Mar 2026 22:01:51 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aea3d26565sm11358025ad.2.2026.03.09.22.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 22:01:50 -0700 (PDT)
Date: Tue, 10 Mar 2026 10:31:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, "open list:VIRTIO GPIO DRIVER" <virtualization@lists.linux.dev>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: virtio: remove one kcalloc
Message-ID: <sdcvb4g2d5optcout5f2qvvdvnb2g6o76tlc2dkf5zl7p2mc6j@52ejlit6fnoj>
References: <20260310020057.340550-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310020057.340550-1-rosenp@gmail.com>
X-Rspamd-Queue-Id: A07DD2455CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32876-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 09-03-26, 19:00, Rosen Penev wrote:
> A flexible array member can be used to combine allocations.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/gpio-virtio.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index ed6e0e90fa8a..876a34ed739d 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -52,7 +52,6 @@ struct virtio_gpio {
>  	struct virtio_device *vdev;
>  	struct mutex lock; /* Protects virtqueue operation */
>  	struct gpio_chip gc;
> -	struct virtio_gpio_line *lines;
>  	struct virtqueue *request_vq;
>  
>  	/* irq support */
> @@ -60,6 +59,7 @@ struct virtio_gpio {
>  	struct mutex irq_lock; /* Protects irq operation */
>  	raw_spinlock_t eventq_lock; /* Protects queuing of the buffer */
>  	struct vgpio_irq_line *irq_lines;
> +	struct virtio_gpio_line lines[];

Add a blank line before this to separate this out from irq-support
entries.

>  };
>  
>  static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
> @@ -541,10 +541,6 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
>  	u16 ngpio;
>  	int ret, i;
>  
> -	vgpio = devm_kzalloc(dev, sizeof(*vgpio), GFP_KERNEL);
> -	if (!vgpio)
> -		return -ENOMEM;
> -
>  	/* Read configuration */
>  	gpio_names_size =
>  		virtio_cread32(vdev, offsetof(struct virtio_gpio_config,
> @@ -556,8 +552,8 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
>  		return -EINVAL;
>  	}
>  
> -	vgpio->lines = devm_kcalloc(dev, ngpio, sizeof(*vgpio->lines), GFP_KERNEL);
> -	if (!vgpio->lines)
> +	vgpio = devm_kzalloc(dev, struct_size(vgpio, lines, ngpio), GFP_KERNEL);
> +	if (!vgpio)
>  		return -ENOMEM;
>  
>  	for (i = 0; i < ngpio; i++) {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

