Return-Path: <linux-gpio+bounces-34957-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MTHLpe+12mdSQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34957-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 16:58:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF713CC489
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 16:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D3F930157C0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 14:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FC53C3BFB;
	Thu,  9 Apr 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNI02mpz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46B36CDFE;
	Thu,  9 Apr 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746707; cv=none; b=WRucAD8f0WGeMFUgGQghKjgbWf7AlR3gfsaOIivIgs5J+HwKkF4B/ZaKWFYFeYd/VWIOXw/mSoL/qVpeThHQbCw+fER8rbGOqKSlnDWle0PxXAtaLnwSHN2YH5rsQ+zycGCES+baGFcs4wMXlaD/q3LMYXhHTqBac0dVcGri9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746707; c=relaxed/simple;
	bh=yJ1Es49AgUmlgtNevydUgiQfvCEbhVDZp9cSVPDQLmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzJcbWWZJBazWz+2X+aiN1YEioMWwpQvm6ANxT3hC4DaMuenXR3/MVYJJZ2Im3OiTl80vIMOYPZMrcnNHzyb7LadZt4EjdkVYzjkkPqBsqgiamdhx5+2q32ig4z/U/B7sPvWesjqRCZ4da0zjHwmj0MTBimDkeycZe/vFztctMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNI02mpz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183FBC19424;
	Thu,  9 Apr 2026 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775746707;
	bh=yJ1Es49AgUmlgtNevydUgiQfvCEbhVDZp9cSVPDQLmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNI02mpzAZm/ktl9QJrBh+f8BeiTyQsudZZ4m4mTq32QszkUFKxb7OEzT6x/7eoXO
	 +gxYsY3XU7haEQGyyk8nubDaoyFeCjyR7oUhHviDPnyZzcHKnWBYOmLYzZUdDeBJwH
	 ksDoHwzfTgt+svyWGeo9Byf7zcExg8ieRZwLy2qNX5GlqS4q1tW3pNuwsFbzrPIofJ
	 xPuXeIy5VF69gJyUzZGRsTLeuve58UmQhdF//8WrfXjcwrCoM84eq9c49UO4+NDMD5
	 pLEgYpje1AucKt8XmYqBbvNxKySYVrIJlxd6vtZ6YznTIQKQ/W4eJ3pFggR/VwJGQo
	 GYjRkKDYdQV2A==
Date: Thu, 9 Apr 2026 15:58:23 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] mfd: si476x: Modernize GPIO handling
Message-ID: <20260409145823.GG3290953@google.com>
References: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34957-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DF713CC489
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026, Linus Walleij wrote:

> The SI476X driver depends on the legacy GPIO API. As it only
> really use a single GPIO for reset, and this can be easily converted
> to use a GPIO descriptor, modernize the driver.
> 
> The "reset" GPIO is obtained from a device property, such as a
> device tree ("reset-gpios", which is standard, but this hardware has
> no DT bindings as of now) or a software node for static platforms.
> 
> Out-of-tree users can easily adopt to providing a GPIO descriptor
> this way.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/mfd/Kconfig                 |  1 -
>  drivers/mfd/si476x-cmd.c            |  1 -
>  drivers/mfd/si476x-i2c.c            | 46 +++++++++++++------------------------
>  include/linux/mfd/si476x-core.h     |  5 ++--
>  include/linux/mfd/si476x-platform.h |  2 --
>  5 files changed, 19 insertions(+), 36 deletions(-)

Doesn't seem to want to apply:

diff a/include/linux/mfd/si476x-core.h b/include/linux/mfd/si476x-core.h        (rejected hunks)
@@ -103,7 +104,7 @@ enum si476x_power_state {
  * @state: Current power state of the device.
  * @supplues: Structure containing handles to all power supplies used
  * by the device (NULL ones are ignored).
- * @gpio_reset: GPIO pin connectet to the RSTB pin of the chip.
+ * @reset: GPIO connected to the RSTB pin of the chip.
  * @pinmux: Chip's configurable pins configuration.
  * @diversity_mode: Chips role when functioning in diversity mode.
  * @status_monitor: Polling worker used in polling use case scenarion

-- 
Lee Jones [李琼斯]

