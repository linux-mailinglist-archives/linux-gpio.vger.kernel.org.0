Return-Path: <linux-gpio+bounces-34476-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEjJLQO7y2kpKAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34476-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 14:16:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5404C369552
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 14:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AAEBD300D745
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 12:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0B73E1D09;
	Tue, 31 Mar 2026 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKAuikN6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC083E1CE4
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774959353; cv=none; b=moyrp6R/4dMW5SgoTGEpNQWwIj4p7JMjBN41bgL75HaUnoXCaFJQoPq4tkBdUMSeNis8X+V1+CfZcexndVunh4dw+pkz9zx/+k3XpeL/e2n9ut7zP6hTRZ3KyHdJWUFdxnP7SyFsD0ugWp/OjFy2HnA4m5GrCgeuLj+gEcnemIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774959353; c=relaxed/simple;
	bh=tLzrIdEn1WyEQ7rUAuC/WY8xiLZVLXce48Kb4NPr1qs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poGLLpMuvm2Zq1lqn5MSz/tDQQxMNcWfHXzsds+Ifn1snTwOfYR2SvGDAm2lbMfrroJBE4ckzJOrlY5X6IZL+93YyMshOJZ86E/to/wHMiFX+dhSpfzb+oEWR/DBgbPoubd0qYaWeFbxKpn25m/pTp6nea4slyFQgnZq/lyZ2Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKAuikN6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A1AC2BCC7
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774959353;
	bh=tLzrIdEn1WyEQ7rUAuC/WY8xiLZVLXce48Kb4NPr1qs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jKAuikN6bnLdn5uO4u3Zt8okYO8bMuz5ocsORfId0v8QBcvPj8tyRILrxvE3LAQ7B
	 qyC1nz39sHIK4ix3XLPA8NNUnV3eeOnQhwYyA5YTIkRhVwJmloSwFHyc3V8lbg832+
	 VKwN5R6W1XLhaDEGe+Vz4VzHkWwcZy4uOcKncyCmh/p5dB1KtvmPSOBU5bu4TCS2tJ
	 FvfBAutEOFAT0e8SV3Fi2h09KhiNeRDujwgliGJ1ReX5IXqMUBwuDdDaingS55gCt1
	 bmJCt68i0k6yhkXY5tAyfekk/kbXdvod25bxRETTE5Zm/C2H3yE5X1svYJwCPkkHu4
	 +n3ylqFLmDlWw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so6630065e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 05:15:53 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz9v9Ooh14Kon0sQJ7Eh1yqCR8mNhtgR9DKEvAzNwlkkycjYX1e
	RxZSRJF6wcoTkWKMO7b/QjZ6tT1S1lwb6vQgrVUnAJ3un3VzShirqFCjgghHTOCOitTGGBV4TYy
	Jp65AbIDryY/a8jwP6Ap/Vg8nmoF8p0oTHp8lBClvHw==
X-Received: by 2002:a05:6512:3405:b0:5a1:3d07:a057 with SMTP id
 2adb3069b0e04-5a2ab7fce47mr5800690e87.19.1774959351946; Tue, 31 Mar 2026
 05:15:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Mar 2026 05:15:49 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Mar 2026 05:15:49 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260331113835.3510341-4-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331113835.3510341-1-eleanor.lin@realtek.com> <20260331113835.3510341-4-eleanor.lin@realtek.com>
Date: Tue, 31 Mar 2026 05:15:49 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mey9D9b7bHgp5nd_v-xi=YBorOZUWfMu1o4gOmzo1vsig@mail.gmail.com>
X-Gm-Features: AQROBzDFmrCNatrpQCVy37JWlWLpWeGhKF0UAUsoGgs4zB4bmR0GLXOUue6p2R0
Message-ID: <CAMRc=Mey9D9b7bHgp5nd_v-xi=YBorOZUWfMu1o4gOmzo1vsig@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com, linusw@kernel.org, 
	brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, tychang@realtek.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34476-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,realtek.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5404C369552
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 13:38:35 +0200, Yu-Chun Lin <eleanor.lin@realtek.com> said:
> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.
>
> Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
> which manages pins via shared bank registers, the RTD1625 introduces
> a per-pin register architecture. Each GPIO line now has its own
> dedicated 32-bit control register to manage configuration independently,
> including direction, output value, input value, interrupt enable, and
> debounce. Therefore, this distinct hardware design requires a separate
> driver.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  drivers/gpio/Kconfig        |  12 +
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-rtd1625.c | 581 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 594 insertions(+)
>  create mode 100644 drivers/gpio/gpio-rtd1625.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b45fb799e36c..6ffc95e02cb9 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -639,6 +639,18 @@ config GPIO_RTD
>  	  Say yes here to support GPIO functionality and GPIO interrupt on
>  	  Realtek DHC SoCs.
>
> +config GPIO_RTD1625
> +	tristate "Realtek DHC RTD1625 GPIO support"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	default y

Don't default to y for COMPILE_TEST. If you need this for ARCH_REALTEK then
limit it to it. Though seeing as it's a module_initcall() anyway, maybe you
don't need it at all?

> +	select GPIOLIB_IRQCHIP
> +	help
> +	  This option enables support for the GPIO controller on Realtek
> +	  DHC (Digital Home Center) RTD1625 SoC.
> +
> +	  Say yes here to support both basic GPIO line functionality
> +	  and GPIO interrupt handling capabilities for this platform.
> +

Other than that looks really nice!

Bart

