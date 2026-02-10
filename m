Return-Path: <linux-gpio+bounces-31550-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C+yOXALi2lXPQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31550-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 11:41:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF51119BA0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 11:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39C7B303CE2E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 10:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F0932B9BD;
	Tue, 10 Feb 2026 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1XLD7df"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220AB3164A5;
	Tue, 10 Feb 2026 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720104; cv=none; b=AKCyGCzio00LdkUk2TeOBT9HLfLAASbEZuLxLaSrx8P1HMC+DlahJb9J2cWB2onGl+mR1umMaPSOk9fgGJ6/HR5R0e1Df3vs42WTG3G8ZvqUjQE4sIj6NhYb9lbFvT5db60y4Q351sf9WXjv6IR4XvoQBLPp523IAeuD++7czzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720104; c=relaxed/simple;
	bh=b2GOcGwn5DzDpShBURk8TYAQ9YVP1nK5iYwXXc1HUCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQbGO4psvNyhrcxHjmZ3t412D110ehuBGckdBBN2g6pldcNwhKnLGRo8x+iqC7j76a1A4K9S2ZkIWgL6wKl7G46/oyg2DMr8IJaqQwAZbI7WKk8cM1gM30q4o81XTc++otkknSApfZirzqUqMnpPJZ05zFQUd3r5aYWx9ik0RSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1XLD7df; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82270C116C6;
	Tue, 10 Feb 2026 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770720103;
	bh=b2GOcGwn5DzDpShBURk8TYAQ9YVP1nK5iYwXXc1HUCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1XLD7df9wGt3WGmpnFj2sTKRNleRcQridocbYNT+S2bnNoZZLvNciE4jmYJS+KCs
	 lvyRdkNDTdLUhZPGvu3l8LiIuR1aZQ5ZsLRaozZ7RTlj9TP7nlmZKEHHE10PsV0wy6
	 RDuWuG3kx2/vp5nNLwcHzCASpEyPrk1M1hqwrDqFhm0rAvNUCj8YIXBMZ0NRhQBeZ0
	 2xoQ8zxzZc+hVo0U8ne4SYUB10JxYMPE+ME7PccvWIgqg/S633I+eGDcPvUVoYjj1M
	 GVEIkTQq1f5PRhbah/uIZCkIdEd6lyWtuD5LcWhA0kPSFumf7om5x7H+D6+n2Ub0rt
	 AC4fWjQzIYy6g==
Message-ID: <75e26353-2704-4dda-9537-5d22a4887553@kernel.org>
Date: Tue, 10 Feb 2026 11:41:39 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: swnode: restore the swnode-name-against-chip-label
 matching
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann
 <arnd@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
References: <20260210094806.38146-1-bartosz.golaszewski@oss.qualcomm.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260210094806.38146-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31550-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CF51119BA0
X-Rspamd-Action: no action

Hi,

On 10-Feb-26 10:48, Bartosz Golaszewski wrote:
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
> Link: https://lore.kernel.org/all/aYmV5Axyfo76D19T@smile.fi.intel.com/
> Cc: stable@vger.kernel.org # v6.18, v6.19
> Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by firmware nodes")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
> index 21478b45c127d..c88313b0026b9 100644
> --- a/drivers/gpio/gpiolib-swnode.c
> +++ b/drivers/gpio/gpiolib-swnode.c
> @@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
>  
>  fwnode_lookup:
>  	gdev = gpio_device_find_by_fwnode(fwnode);
> +	if (!gdev)

This needs to be:

	if (!gdev && gdev_node->name)


gdev_node->name may be NULL and calling gpio_device_find_by_label()
with a NULL pointer does not end well.

Regards,

Hans




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


