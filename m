Return-Path: <linux-gpio+bounces-31772-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIVxIlYIlWk2KQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31772-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 01:31:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A4915246C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 01:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9761E3040314
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 00:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB9325B663;
	Wed, 18 Feb 2026 00:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7EHxQCQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810251EB5F8
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 00:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771374670; cv=none; b=Z+3wxLhqlWbKL/kqM3jwfFjufQq91bOkpuA82/Hz0TjpvWJvC3R6hjk6T0bzPnCXheT7ofuwbhMGCxIH5tRwgK8Ujni4LO6nt71oBaqqd7lvLfQIXpmIQULPHC4C+G/hDQLj4faLnfr7ZELN/JzN3DfeiJCS3OqDQpYZ6XZ+X50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771374670; c=relaxed/simple;
	bh=Y2Fa0g/eiWnBGtl7TW6Y8Fxqa981wFYoJqnEQ9J5DTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvYw/A/IBh9cHLfj1Bekq2buaRij6rfwNtig6RI9LknE8KJ97lpcnNMZinA9hEEW8/ugm5qehDtPJKw89/mU2ZzUf1g4jVE6TTllvqTQY6//MPH6bTH6VVKdM79rzPVbKlPCS1+XF06+LCm5kv0GLg5kl1DOzOsY7KFMWb/s190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7EHxQCQ; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1273349c56bso6168974c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 16:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771374669; x=1771979469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sg0v5gzcAHvCWeUv8SrWGgkElA1mA5SgiIxc3XoTrGs=;
        b=H7EHxQCQzO0WfhvoxtJjCdHi3nZgfw6X0lMl76bjBN+ISxt8UIMRJXOgOclTRkvAiS
         KIjaFFBIwXZQXJsdC+C0/Ir7YEatWth1NPmPVvFZMw1kBq8tVrL4On0Lyjb9zuXM9ASu
         WstOqUzxXOfgibQuEO+7WZDykWdDJJNpb7XSvzvIqQOiObLPRGBhiO17cseYCgWdGE8B
         KHVQL8yKMYH5SPtMymKssb2Y4drPGU/s9ipDzOH/kwfB2XR9OU/4baSn7yhmTzNWaahc
         S+bhmQDXzgixCo31wkGk7PRQLg6hWjqHtsMMZT9z2wLc6wOBRSuwe6gKZWT+uqIg70I4
         KrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771374669; x=1771979469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg0v5gzcAHvCWeUv8SrWGgkElA1mA5SgiIxc3XoTrGs=;
        b=saqfkjZriVKxwPYGII+qn8SkWnqxua1CeH1Y0JlQBYMY9BSIBVlnYIpNXb0aZ49+CP
         25vjTB+H4t68V6goTp30VJOTTY++Vxkey2SlvxO5xcTj7tuduDJAsb1K3IPyFoS/2KVq
         4cXJrILK/Q2gxhEjnpjUiaVvYC8BpvZH699sxBRQo/CCkqjF2HUjauEvElzEmCyWXEOY
         jJpIsUfy+s1HA0xgF5IClfovYsi0DkEmtmEqsZn/gU/ZBQaKomoRqlLNKYFRZLEZCIGD
         YrvUkKOCMlLmUGOOGwCPuXr8kbGXzWCbFGFrrtYseUQqdly+JJihMmlNJb1SNzURXbo5
         wziA==
X-Forwarded-Encrypted: i=1; AJvYcCWvlloJLgajDjTPQlkpw/FdFZ5qd5g8AJ0Xl+glTftfnvD3zCralLycFrj6LH3IB3KJbpJch5K06yRW@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4h0e1j/CU54vANoOoBFkGUYdaf1fIGPFm7yFvRKA3+r67HGY
	IqcHiyRpa/nwVOzaQoq6OWqrx3Ij/4mkzhHhDDQAyqW5ThgDG12uWu3j3Uiong==
X-Gm-Gg: AZuq6aIvpy53M6v6a4H9c1DJsA3WAU6WLXHiqcd273b7NZaDYlVzmrmd3wBQ2ihRs5N
	SbEFrh4qfTqxtbd/tbkx0wuyGwVazIJTYY5eQKr6lMJAboPNT4Nrz5IMUeLT6AZ5+PKUcQzFfSv
	5vnHuCdNqFlv3COHIp8H3uSyrWq/ZzMmtoc82J/xolQBf2Z41QJqV0zxKwS/aBnxqKVB3SIVKyg
	APlMJaTdwzJ/JeW4yThSKjCa9KHbKQFrV1tBVAmBuQYIhZvXRre/oNDsIOk5MH+iDr20cxNbn2g
	4pJ6jVaeyl82FO5vwEb99kRA5QFJT6szcgvsJ9xlDRUnKVzw2SyIDAJD2c9SV3yCbiYiZqLOefw
	zvxATE6iOcuddJr9CRQ1E5jgMAezJlLG4vSYvICn1kwVVO29J8sEVeip7iFM1P15k1BI8Xy9ZxM
	ViD3TG/xUj8Seci6OBZwHsTwiJmwXsxJ5UwXQkmBFK7bnVWQh6R5dqf8uXbEdjvFbR
X-Received: by 2002:a05:7022:2393:b0:127:369e:5d54 with SMTP id a92af1059eb24-12741b71059mr5293643c88.13.1771374668482;
        Tue, 17 Feb 2026 16:31:08 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:968c:f102:3683:408a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb66bd17sm17035569eec.28.2026.02.17.16.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 16:31:08 -0800 (PST)
Date: Tue, 17 Feb 2026 16:31:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: swnode: restore the
 swnode-name-against-chip-label matching
Message-ID: <aZUIFiOYt6GOlDQx@google.com>
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31772-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: E9A4915246C
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 09:53:13AM +0100, Bartosz Golaszewski wrote:
> Using the remote firmware node for software node lookup is the right
> thing to do. The GPIO controller we want to resolve should have the
> software node we scooped out of the reference attached to it. However,
> there are existing users who abuse the software node API by creating
> dummy swnodes whose name is set to the expected label string of the GPIO
> controller whose pins they want to control and use them in their local
> swnode references as GPIO properties.
> 
> This used to work when we compared the software node's name to the
> chip's label. When we switched to using a real fwnode lookup, these
> users broke down because the firmware nodes in question were never
> attached to the controllers they were looking for.
> 
> Restore the label matching as a fallback to fix the broken users but add
> a big FIXME urging for a better solution.
> 
> Cc: stable@vger.kernel.org # v6.18, v6.19
> Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by firmware nodes")
> Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - check if gdev_node and gdev_node->name are not NULL before trying to
>   match the label (Hans & Dan)
> - use the right link
> - collect tags
> 
>  drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
> index 21478b45c127d..0d7f3f09a0b4b 100644
> --- a/drivers/gpio/gpiolib-swnode.c
> +++ b/drivers/gpio/gpiolib-swnode.c
> @@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
>  
>  fwnode_lookup:
>  	gdev = gpio_device_find_by_fwnode(fwnode);

By the way, should we extend gpio_device_find_by_fwnode() to use both
primary and secondary nodes?

Thanks.

-- 
Dmitry

