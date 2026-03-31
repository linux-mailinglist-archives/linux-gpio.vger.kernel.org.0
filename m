Return-Path: <linux-gpio+bounces-34503-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAdRKFoVzGnAOAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34503-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 20:41:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DFA3701CE
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 20:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA9663015D0F
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 18:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD8937CD57;
	Tue, 31 Mar 2026 18:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asqKZeq3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1483238F945
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982487; cv=none; b=lPchmdPO0r1S1RkWfn4MAIqKhFkMP/f8Bsh15nB82hSe+7WMt125CxTI+SQ/CQauAGCeVjx28G7/E0dTRzFW+cifMxhJ4czskDb1Z3HwXFlCoIBr1jyOc9xznKMDpMtk6wSrOgKw5ODJCOHd0eygyFI0PkB1e1EkHqdCXJ/39Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982487; c=relaxed/simple;
	bh=b4oOB+cE1UN5ardHWDCwv58C52n9br6YeW2dOw5y/Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8/ONPl2F6OQJu0xf6IH5XNe7gBuInpxZ4BWqbiqAC3mtaLluWIPTVYR3FJFbEu2VF0oGnxWky1oLr+JA1cCXQUX3bR4LgWPtKAb7v/lfVh/5AEYme8QNQIp0sK+seM06qJOQiDBGpgV6RlsEiZlzX8eDM2ZwHimMwC1TCjypv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asqKZeq3; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c54c68db4dso4772512eec.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 11:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774982484; x=1775587284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiDEkkSBUbqq8xRSZm9VbsPNXKLV08haEOOr6RCuwFA=;
        b=asqKZeq3xeLkeBZPlIVT76okaYZFV5G3Dip6aNHVPXphWfb1zJYBUrd2zxqnpuMxbH
         C3gt/WPv42+tYZP4uMSxLYaisjNAHyJJjwqTmEp1p2jpxV6Y5V7csv7+hKgfP9Oum9Ng
         UhB9PchbBgy5jLaf/X2kYYKDG7hMOayo0fGyuA6reTFidwr2g7GirF4efGWtyAix6GCz
         PfTC7SmzfO4brJcqs6w3IjkofGfyV01LtIHpCSJN9hhyVzSntrzAXtKWgyt7WzZyUf6p
         Ny43XhogXb5230yqMw3Gcl0Mlz0cTrCN4jd2nu8P2Hu3vKDIhywlKvPUOPgT/kwWPQYu
         GV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982484; x=1775587284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiDEkkSBUbqq8xRSZm9VbsPNXKLV08haEOOr6RCuwFA=;
        b=MeF29UqxzIATk8g1dkpbVdOctZjzQh3q5jP9ZC11mk063G2WGbM5dIxxKMQNde/Grp
         W4K4cOyH0PNJnz5XRzH8SyjB7aNza9QKrYw0rGFwwjGKkFIaj3wybgWdtlCgz6JZoYcu
         kiZK1uYKAM5iqU1Uq9fzC5w3ojOt1jUGMfOjoO0ymWrqRCbCUNPJ0uJhNqbwelLL6FZj
         Wo0u1T2/LCBHYxLTv0r3IeoZYJrBveS83qqEbE8w3wU80RP2Teamv9C3EjgOGv1F/TFA
         CAleUsucj/C6Mueefk3vtm0Hzvn230lkdIuclgBIA1HrnvUMg1EUtUAwfHysu8xQrvJa
         Q6QA==
X-Forwarded-Encrypted: i=1; AJvYcCUs2S7a3Ys8FFExAyYReax/jbqUg5l+OBc47ivrZu8f/cHeykJPLjj4KqqBoy0Z3jPUqRD8672kEgPG@vger.kernel.org
X-Gm-Message-State: AOJu0YykQSxtBKK1vFlkrY6Jqf/1Z7BjY46dDGHtZg//2fy/0zvbwTdF
	tGxISwSsk57QN3mujM72qYZoCebp7Ksvz5C4/6SWpwYJbEkYip3OeJUv
X-Gm-Gg: ATEYQzzdj4K3PQ9VPL/DAOYPoQM/oafrILiav8GyYDho9VUN1DyLLQS+GI4GXcRQsUO
	BjoUjeH0zzEmYqIOjY/3xczSXdw1q3axNo3AWzZqqFfCWG7QH77gpZO2cumng++WFia7PMV2O/L
	7uVE0C3jquKodLPgOQ4BHGni4Gtl565Dq8oH3rfDlVPWPjF/dWbJMn85VxsTLsR68QDgqm+f2w6
	CA8VvXp/sosp+fNmcu8QGwHBPRUf+NfouUllKR22ZR2+JL7KBFSvGw3RiLob6N8UBzaaWRI2VXx
	qHR7FPkw2/6br4EJjZup72KtpXkcwb7UGWj7LrkEEnoZjwZI75IhcC6KiI9b2ZgRqBnkgPcwXHQ
	KQqo9WOgeRKOBetMwtm9bebzDI5BBDqij04A03q2XRfeMeS69t6uOm7WDPSxr96Io2RTfbB1pgX
	J/3OdvNSr1DnqvqDB9+zgpPU7b6qFdGMECtCfl0fd+leuJpTPK5eOh9gBjR80Ztzkx
X-Received: by 2002:a05:693c:2c88:b0:2c6:cdb3:bd8d with SMTP id 5a478bee46e88-2c930c766d0mr221901eec.7.1774982483694;
        Tue, 31 Mar 2026 11:41:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1dbf:b0e0:8ad0:5a2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c4cbbc1fsm10368963eec.13.2026.03.31.11.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:41:23 -0700 (PDT)
Date: Tue, 31 Mar 2026 11:41:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: update the preferred method for
 using software node lookup
Message-ID: <acwTkgJ3BFAYIoLV@google.com>
References: <20260331-doc-gpio-swnodes-v1-1-3f84c268999b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-doc-gpio-swnodes-v1-1-3f84c268999b@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34503-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pdev_info.id:url,pdev_info.name:url,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17DFA3701CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

On Tue, Mar 31, 2026 at 02:28:29PM +0200, Bartosz Golaszewski wrote:
> In its current version, the manual for converting of board files from
> using GPIO lookup tables to software nodes recommends leaving the
> software nodes representing GPIO controllers as "free-floating", not
> attached objects and relying on the matching of their names against the
> GPIO controller's name. This is an abuse of the software node API and
> makes it impossible to create fw_devlinks between GPIO suppliers and
> consumers in this case. We want to remove this behavior from GPIOLIB and
> to this end, work on converting all existing drivers to using "attached"
> software nodes.
> 
> Except for a few corner-cases where board files define consumers
> depending on GPIO controllers described in firmware - where we need to
> reference a real firmware node from a software node - which requires a
> more complex approach, most board files can easily be converted to using
> propert firmware node lookup.
> 
> Update the documentation to recommend attaching the GPIO chip's software
> nodes to the actual platform devices and show how to do it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  Documentation/driver-api/gpio/board.rst         | 15 +++++++++---
>  Documentation/driver-api/gpio/legacy-boards.rst | 32 ++++++++++++++++++-------
>  2 files changed, 36 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
> index 0993cac891fb5e4887a1aee6deae273197c6aae1..c2880533742b1b55108f28853a3903cb273fe791 100644
> --- a/Documentation/driver-api/gpio/board.rst
> +++ b/Documentation/driver-api/gpio/board.rst
> @@ -108,9 +108,8 @@ macro, which ties a software node representing the GPIO controller with
>  consumer device. It allows consumers to use regular gpiolib APIs, such as
>  gpiod_get(), gpiod_get_optional().
>  
> -The software node representing a GPIO controller need not be attached to the
> -GPIO controller device. The only requirement is that the node must be
> -registered and its name must match the GPIO controller's label.
> +The software node representing a GPIO controller must be attached to the
> +GPIO controller device - either as the primary or the secondary firmware node.
>  
>  For example, here is how to describe a single GPIO-connected LED. This is an
>  alternative to using platform_data on legacy systems.
> @@ -153,6 +152,16 @@ alternative to using platform_data on legacy systems.
>  	};
>  	software_node_register_node_group(swnodes);
>  
> +	/*
> +	 * 5. Attach the GPIO controller's software node to the device and
> +	 *    register it.
> +	 */
> +	 static void gpio_foo_register(void)
> +	 {
> +		gpio_foo_pdev.dev.fwnode = software_node_fwnode(&gpio_controller_node);
> +		platform_device_register(&gpio_foo_pdev);

Maybe nudge people towards platform_device_register_full() with
info.swnode set to the software node? The change adding swnode to
platform_device_info is already in an immutable branch in driver core
tree and will be merged in the next release.

> +	 }
> +
>  	// Then register a platform_device for "leds-gpio" and associate
>  	// it with &led_device_swnode via .fwnode.
>  
> diff --git a/Documentation/driver-api/gpio/legacy-boards.rst b/Documentation/driver-api/gpio/legacy-boards.rst
> index 46e3a26dba772e5e5117866b5d202e76c8e2adf2..fac63dd38d5b71c3bf43b5286a432f6449f422d0 100644
> --- a/Documentation/driver-api/gpio/legacy-boards.rst
> +++ b/Documentation/driver-api/gpio/legacy-boards.rst
> @@ -36,12 +36,10 @@ Requirements for GPIO Properties
>  When using software nodes to describe GPIO connections, the following
>  requirements must be met for the GPIO core to correctly resolve the reference:
>  
> -1.  **The GPIO controller's software node "name" must match the controller's
> -    "label".** The gpiolib core uses this name to find the corresponding
> -    struct gpio_chip at runtime.
> -    This software node has to be registered, but need not be attached to the
> -    device representing the GPIO controller that is providing the GPIO in
> -    question. It may be left as a "free floating" node.
> +1.  **The GPIO controller's software node must be registered and attached to
> +    the controller's ``struct device`` either as its primary or secondary
> +    firmware node.** The gpiolib core uses the address of the firmware node to
> +    find the corresponding ``struct gpio_chip`` at runtime.
>  
>  2.  **The GPIO property must be a reference.** The ``PROPERTY_ENTRY_GPIO()``
>      macro handles this as it is an alias for ``PROPERTY_ENTRY_REF()``.
> @@ -75,6 +73,11 @@ A typical legacy board file might look like this:
>  
>    #define MYBOARD_GPIO_CONTROLLER "gpio-foo"
>  
> +  static struct platform_device myboard_gpio = {
> +        .name = MYBOARD_GPIO_CONTROLLER,
> +        .id = PLATFORM_DEVID_NONE,
> +  };

Same here, let's use platform_device_info.

> +
>    /* LED setup */
>    static const struct gpio_led myboard_leds[] = {
>    	{
> @@ -124,6 +127,7 @@ A typical legacy board file might look like this:
>    	gpiod_add_lookup_table(&myboard_leds_gpios);
>    	gpiod_add_lookup_table(&myboard_buttons_gpios);
>  
> +        platform_device_register(&myboard_gpio);

Use tabs.

>    	platform_device_register_data(NULL, "leds-gpio", -1,
>    				      &myboard_leds_pdata, sizeof(myboard_leds_pdata));
>    	platform_device_register_data(NULL, "gpio-keys", -1,
> @@ -141,8 +145,7 @@ Step 1: Define the GPIO Controller Node
>  ***************************************
>  
>  First, define a software node that represents the GPIO controller that the
> -LEDs and buttons are connected to. The ``name`` of this node must match the
> -name of the driver for the GPIO controller (e.g., "gpio-foo").
> +LEDs and buttons are connected to. The ``name`` of this node is optional.
>  
>  .. code-block:: c
>  
> @@ -257,6 +260,16 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
>    	if (error)
>    		return error;
>  
> +  	memset(&pdev_info, 0, sizeof(pdev_info));
> +  	pdev_info.name = MYBOARD_GPIO_CONTROLLER;
> +  	pdev_info.id = PLATFORM_DEVID_NONE;
> +  	pdev_info.fwnode = software_node_fwnode(&myboard_gpio_controller_node);

	pdev_info.swnode = ...

> +  	gpio_pdev = platform_device_register_full(&pdev_info);
> +  	if (IS_ERR(gpio_pdev)) {
> +  		error = PTR_ERR(gpio_pdev);
> +  		goto err_unregister_nodes;
> +  	}
> +
>    	memset(&pdev_info, 0, sizeof(pdev_info));
>    	pdev_info.name = "leds-gpio";
>    	pdev_info.id = PLATFORM_DEVID_NONE;
> @@ -264,6 +277,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
>    	leds_pdev = platform_device_register_full(&pdev_info);
>    	if (IS_ERR(leds_pdev)) {
>    		error = PTR_ERR(leds_pdev);
> +  		platform_device_unregister(gpio_pdev);
>    		goto err_unregister_nodes;
>    	}
>  
> @@ -274,6 +288,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
>    	keys_pdev = platform_device_register_full(&pdev_info);
>    	if (IS_ERR(keys_pdev)) {
>    		error = PTR_ERR(keys_pdev);
> +  		platform_device_unregister(gpio_pdev);
>    		platform_device_unregister(leds_pdev);
>    		goto err_unregister_nodes;
>    	}
> @@ -289,6 +304,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
>    {
>    	platform_device_unregister(keys_pdev);
>    	platform_device_unregister(leds_pdev);
> +	platform_device_unregister(gpio_pdev);
>    	software_node_unregister_node_group(myboard_swnodes);
>    }

Thanks.

-- 
Dmitry

