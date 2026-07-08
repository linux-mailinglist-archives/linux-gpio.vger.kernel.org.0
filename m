Return-Path: <linux-gpio+bounces-39665-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9gKFHts7TmrOJQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39665-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 14:00:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F26272618E
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 14:00:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="R/jeC5Wf";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39665-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39665-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0430530570F3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 11:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CC8435AA0;
	Wed,  8 Jul 2026 11:53:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B0C425CCB
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 11:53:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511607; cv=none; b=QoMR6trhJSrJoSD2KlywRfLB3dTELQu+DezpARuG1+9CMUBtpgXu2NGEO64vvoGmTXFY+rddQ8Rh20RABPwRuhAlNQk5UJqCNj0Nt7TAzDgYiK5rkUcLvhidZsq3BfF2ifq1qNlM1WPY6koSHWYHGeWdfJS2OnwWtT2rGKLxxs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511607; c=relaxed/simple;
	bh=NS08+CH1NF3r1i+ndhWxKlqPkO4E3pMhpftFbmd5FhA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTMkJjZp9nRwFNYy8xEG1WiIB+Iv03Ut9uWpPwAFYcHG+hPUlwglNBzmkmwlSYZDTxtU9+h3BTB813YOoBkuFwKXsAXhLTKn2YFzI69T42U/QXetM/A0hPoDrqH1aCl1x2sHgNIYYYvuiPKxmAE3deZiomTBeFj3Auafr+ppuh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/jeC5Wf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBAE1F000E9
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783511606;
	bh=EEjeSWVLmYigGFTt5vdFVp2s74c9GXtFU/ulAsDbzAI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=R/jeC5WfgOjoamcbelehgI66GH+wI+mHS4qvvkrPeGRNn6PLLx9jdGMGd9YfNWwTU
	 rjTkAfQkO3rHP7/NeuRDQa9BQFjJtFpluTzbNjIvEOCEVNrid45ftIwLtvT94LlF6e
	 dzHIRcLrZxiY5m7YNXmzEqotAxjgvBWrOCtmXhIDnQKQS0xjzVhUwnGZEHfQuP5cZb
	 9bjrv3nBVQAtYKr7VJUMSrKM/khI3C8eAPyL2Cr82NtMX4UMCx1eWWDGeSeR9UxpHd
	 6+t2o3jje+qX3AD1P5SNu/pnEhaA+O/GGpi0tDJR3qkx2Kn4LPwT18GfUgDDG7YJWw
	 RAve7Sp/Up0kw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b00d083818so1003582e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 04:53:25 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx6ZdXQIZhfVo/REKhTFWtb8CY8BPofi2D73mVmhjQGRV3YTNDE
	CD1iS6pbJ3iGeZAQxKaFKG8FnDyZgbHqx4ESEUdFfYyJPP0/DoZIYvnMIkyXZ+WSNDeUeBUwCYw
	g2PTU811KE/f4OnjYvu4nBmVVnt9jzsqqPk/Sgq3fuA==
X-Received: by 2002:a05:6512:3e0d:b0:5ae:d72d:1000 with SMTP id
 2adb3069b0e04-5b00ac66f9cmr1414467e87.1.1783511604715; Wed, 08 Jul 2026
 04:53:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 04:53:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 04:53:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260707160030.385137-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707160030.385137-1-dbgh9129@gmail.com>
Date: Wed, 8 Jul 2026 04:53:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me4Pg=TA2BPPVQSoPCwZff2s6MFNAyDWW6zXr_tXZekNQ@mail.gmail.com>
X-Gm-Features: AVVi8CdtEMhhNshsurz9MieMyDYCMN2kM4GUVh2AFzoXcqC2spLG_bf_Dj5F3S4
Message-ID: <CAMRc=Me4Pg=TA2BPPVQSoPCwZff2s6MFNAyDWW6zXr_tXZekNQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: mvebu: Fix optional clock enable handling
To: Yuho Choi <dbgh9129@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dbgh9129@gmail.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39665-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F26272618E

On Tue, 7 Jul 2026 18:00:30 +0200, Yuho Choi <dbgh9129@gmail.com> said:
> mvebu_gpio_probe() ignores clk_prepare_enable() failures and has no
> matching disable path for later probe failures.
>
> Use devm_clk_get_optional_enabled() so clock lookup and enable failures
> are reported, and so devres disables the clock on cleanup. Reject PWM
> setup when the optional clock is absent.
>

That last sentance is not clear. Which code changes "reject PWM setup" exactly?

Bart

> Fixes: de88747f514a ("gpio: mvebu: Add clk support to prevent lockup")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  drivers/gpio/gpio-mvebu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index c030d1f00abc..c63cdaa78ac1 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -1152,10 +1152,10 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
>  		return id;
>  	}
>
> -	mvchip->clk = devm_clk_get(&pdev->dev, NULL);
> +	mvchip->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
>  	/* Not all SoCs require a clock.*/
> -	if (!IS_ERR(mvchip->clk))
> -		clk_prepare_enable(mvchip->clk);
> +	if (IS_ERR(mvchip->clk))
> +		return PTR_ERR(mvchip->clk);
>
>  	mvchip->soc_variant = soc_variant;
>  	mvchip->chip.label = dev_name(&pdev->dev);
> --
> 2.43.0
>
>

