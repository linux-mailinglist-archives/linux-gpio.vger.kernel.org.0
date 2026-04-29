Return-Path: <linux-gpio+bounces-35788-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIetB63V8Wm3kgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35788-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 11:55:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E8492645
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 11:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F37B731434A8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8462B3B27CA;
	Wed, 29 Apr 2026 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GO175WCS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D16242D97;
	Wed, 29 Apr 2026 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456097; cv=none; b=sooS6RxLtVueIO0y6w4FUV2DA5HoPge89gUvgsddsQpWh9tSIB4YAou55kQqK2BTCVRKbFnlRIvAGkxLoKkSWVwbF/vr/wW84xd1GExJXq89aTgl7WYUgE7+hKlUISn6BaNqqo4prLrmkczrXxpvFimt/yeTJMXGftbokvLTV44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456097; c=relaxed/simple;
	bh=NZip6VplqLrFDbZluFF3TcPmivzaEsW7gm7zctD3Geo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqN9rovBzaA9g4DvZYi8JaK1Omc79nUfS3+36RuvCy7HR388/gvtkOYlFlXyGMr2yTgQ6jq75MWa5zZf3UKc/vv8QEhOE4TidoIOo0RB4pplLA24xPjWlWObMDvmckhjDUqX7EBmNkdP6YYKGKaqz1ytc0bYH5TWEU45MUn5a7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GO175WCS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5FAC2BCC4;
	Wed, 29 Apr 2026 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777456097;
	bh=NZip6VplqLrFDbZluFF3TcPmivzaEsW7gm7zctD3Geo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GO175WCSiWIEiActNXB09kJxIsm0h8yR2/gpRWTZo4jQKTJG73IzjEP2Q6r2iZzIW
	 B3XEt0GRyln4ItYpGnakkikqFjK7L2I1s9p8u0733p7StBxKt0EuJ0fHLnKbToupwp
	 XCnYAkd0JpfAsf7MiDlxrPQ4MKJLN3Q7vVz9T1OzWWdfTfkswWtKLyjNqkJPkRr2EN
	 VvUMhw/mDi4Fh+tqzS9HPrF37umTpWnP1PrFlolf7DXjiWsCE6exkoRCXkTFcoYwDf
	 QcXAN/kAyOc+z730FmQAsS6E3yAOfe7Z5DX2tTFCo1+TSXSfJ8MM5a9Q84tqiviOBb
	 ePO0fyjD+D+og==
Message-ID: <6f359bec-2525-40e9-9994-15b16fb82f12@kernel.org>
Date: Wed, 29 Apr 2026 11:48:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: acpi: Only trigger ActiveBoth interrupts on boot
To: Mario Limonciello <mario.limonciello@amd.com>, westeri@kernel.org,
 andriy.shevchenko@linux.intel.com, linusw@kernel.org, brgl@kernel.org,
 bentiss@kernel.org
Cc: Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 Marco Scardovi <mscardovi95@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
 mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org,
 linux-acpi@vger.kernel.org
References: <20260429025247.1372984-1-mario.limonciello@amd.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260429025247.1372984-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6D9E8492645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35788-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,gmx.de,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gmx.de:email,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Mario,

Thank you for fixing this.

On 29-Apr-26 04:52, Mario Limonciello wrote:
> Commit ca876c7483b6 ("gpiolib-acpi: make sure we trigger edge events at
> least once on boot") introduced logic to trigger edge-based GPIO
> interrupts during initialization to ensure proper initial state setup
> when firmware doesn't initialize it.
> 
> However, according to the Microsoft GPIO documentation, triggering GPIO
> interrupts during initialization should only happen for interrupts
> marked as ActiveBoth (both IRQF_TRIGGER_RISING and IRQF_TRIGGER_FALLING)
> and only when the associated GPIO line is already asserted (logic level
> low).
> 
> The current implementation incorrectly triggers:
> 1. Any edge-triggered interrupt (RISING-only or FALLING-only)
> 2. RISING interrupts when value is high and FALLING when value is low
> 
> This causes problems at bootup for single-edge interrupts that
> don't follow the ActiveBoth pattern.
> 
> Fix this by:
> - Only triggering when BOTH rising and falling edges are configured
> - Only triggering when the GPIO line is asserted (value == 0)
> 
> Reported-by: Francesco Lauritano <francesco.lauritano1@protonmail.com>
> Closes: https://lore.kernel.org/all/6iFCwGH2vssb7NRUTWGpkubGMNbgIlBHSz40z8ZsezjxngXpoiiRiJaijviNvhiDAGIr43bfUmdxLmxYoHDjyft4DgwFc3Pnu5hzPguTa0s=@protonmail.com/
> Tested-by: Marco Scardovi <mscardovi95@gmail.com>
> Fixes: ca876c7483b69 ("gpiolib-acpi: make sure we trigger edge events at least once on boot")
> Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-
> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpio/gpiolib-acpi-core.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
> index 09f860200a059..eb8a40cfb7a98 100644
> --- a/drivers/gpio/gpiolib-acpi-core.c
> +++ b/drivers/gpio/gpiolib-acpi-core.c
> @@ -233,12 +233,23 @@ static void acpi_gpiochip_request_irq(struct acpi_gpio_chip *acpi_gpio,
>  
>  	event->irq_requested = true;
>  
> -	/* Make sure we trigger the initial state of edge-triggered IRQs */
> +	/*
> +	 * Make sure we trigger the initial state of ActiveBoth IRQs.
> +	 *
> +	 * According to the Microsoft GPIO documentation, triggering GPIO
> +	 * interrupts marked as ActiveBoth during initialization is correct
> +	 * as long as the associated GPIO line is already "asserted"
> +	 * (logic level low). We should not trigger edge-based GPIO
> +	 * interrupts not marked as ActiveBoth.
> +	 *
> +	 * See: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-
> +	 * Section: "GPIO controllers and ActiveBoth interrupts"
> +	 */
>  	if (acpi_gpio_need_run_edge_events_on_boot() &&
> -	    (event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
> +	    ((event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) ==
> +	     (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
>  		value = gpiod_get_raw_value_cansleep(event->desc);
> -		if (((event->irqflags & IRQF_TRIGGER_RISING) && value == 1) ||
> -		    ((event->irqflags & IRQF_TRIGGER_FALLING) && value == 0))
> +		if (value == 0)
>  			event->handler(event->irq, event);
>  	}
>  }

One nitpick, which can be a follow-up patch since Andy has already picked this
one up.

I think that now that the second if condition has been simplified to just
value == 0, it can be added to the first if as " && value == 0" dropping
the nested if.

Regards,

Hans



