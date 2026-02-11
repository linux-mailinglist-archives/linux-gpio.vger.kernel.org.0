Return-Path: <linux-gpio+bounces-31610-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OIqGbhujGlmngAAu9opvQ
	(envelope-from <linux-gpio+bounces-31610-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 12:57:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F5112403A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 12:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BEC030226B2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 11:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8243A3161BD;
	Wed, 11 Feb 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjBh7nw/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D14126BF1;
	Wed, 11 Feb 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770811058; cv=none; b=db7C0/l3jV05EKHM88QDa/iq58CEo/Zm0tpu8t1/wocmTzZiqNtzERovI5zrppx3otfgBD+i8lIP0EgAOmws7zzFIyhSoR2fsNjMdkTxrcn+jw1+ZmKnCY987LfVa4AZRPmFhS8uPhZfvYDyiTqVIwLfaHJZHHIhX5SUjvOKKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770811058; c=relaxed/simple;
	bh=26YmqgO7UsbUJ3HaLMu0X+jT+eQcTYSWMWUL9GyJV+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8SDUv7Y6I9gfREmF9WzZJxYXa9KBUN07pKcSn/c1ytNp2QDCU/6RYoiX1LHVS9AcvEvmkDGmdt7uOk6uo4qodU2qzk1mNHExxRhQG0EFt3jxu+D7Qu6F+P6OZw4Jj5WgwGZsIeovW9/iFv9Od9XZ1yxlmk01DqbHabTXV3FHC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjBh7nw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB25C4CEF7;
	Wed, 11 Feb 2026 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770811057;
	bh=26YmqgO7UsbUJ3HaLMu0X+jT+eQcTYSWMWUL9GyJV+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZjBh7nw/Wxsg0JwL+sk8cP2LcP7pKK8O9uMofqDAMVuxoN5GLYcOOJIikLmrujFj9
	 7q4DXnb1c2oNO9Edg+WIx9LjKqMymcfYvu+UrSSwH+ItSj4EjoycOaogBA63gc3/jL
	 seUDRLQY6t/zxgDjD/OWvvgogkRui2AdOORr0V3ShKMNhYVIL9ozBuC0gu/9Kkm8SI
	 0Ya02Y4TCLx2i0YyOZt3NCr3Q0ttsAStwHUcTOJUVdJCqCg/iL39SiS3JgPurxQbMk
	 o1D58uTw2HnZFHgLHBL1dxdKMbomhIlYp/qxEqcPwCCIRp0x4yhuPUWrL75gqbcxlq
	 VXPN2IpO6d7mg==
Message-ID: <94683609-5a52-494c-9041-85c2ef40da34@kernel.org>
Date: Wed, 11 Feb 2026 12:57:33 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: swnode: restore the
 swnode-name-against-chip-label matching
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann
 <arnd@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31610-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B9F5112403A
X-Rspamd-Action: no action

Hi,

On 11-Feb-26 09:53, Bartosz Golaszewski wrote:
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

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




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
> +	if (!gdev && gdev_node && gdev_node->name)
> +		/*
> +		 * FIXME: We shouldn't need to compare the GPIO controller's
> +		 * label against the software node that is supposedly attached
> +		 * to it. However there are currently GPIO users that - knowing
> +		 * the expected label of the GPIO chip whose pins they want to
> +		 * control - set up dummy software nodes named after those GPIO
> +		 * controllers, which aren't actually attached to them. In this
> +		 * case gpio_device_find_by_fwnode() will fail as no device on
> +		 * the GPIO bus is actually associated with the fwnode we're
> +		 * looking for.
> +		 *
> +		 * As a fallback: continue checking the label if we have no
> +		 * match. However, the situation described above is an abuse
> +		 * of the software node API and should be phased out and the
> +		 * following line - eventually removed.
> +		 */
> +		gdev = gpio_device_find_by_label(gdev_node->name);
> +
>  	return gdev ?: ERR_PTR(-EPROBE_DEFER);
>  }
>  


