Return-Path: <linux-gpio+bounces-39669-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zY8xBGs+TmpEJgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39669-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 14:11:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69494726293
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 14:11:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nSaCmAW1;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39669-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39669-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D68723015879
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 12:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564AC43B6D6;
	Wed,  8 Jul 2026 12:11:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26456433BCA
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 12:11:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512676; cv=none; b=NFhYNaUgyu2eSu8tq8Kpq4FWkMmdxHmL7ETu+6Hn66X4L3J8JmlKcskK8dfFxgpKdBaXAfq7Y4hFrQfxDIMPcRxCgn8d/uzIQktBREQT+pXLCh3BwzFGqEJL5ltWL+aq2YmFYWlo8pZ8e48Eu0n5/wFCCD6ChGkUxd6mOV9sD8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512676; c=relaxed/simple;
	bh=9XFl8zhfIdtbVtF+MBYsmjs9nphGy10yikvKHTESCWM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fk+92tW2qlsa3534/fnEUCvMi9xTDd7/GNN0G89ej74eTJw2247w5ZMz7uFKM86CdDHqXNcWPl4o928ZZCKjSxr9MpN527IBa25KCnpBHDo4Tbc/V8M4XCN+6yLvYY5LIzT24n9n0MhzpDw0NYoHi10hcVF7VWtgaHu/N3AxSuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSaCmAW1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79E11F000E9
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783512674;
	bh=+aReIHWUe3pnm26ufIxwwHa7nTfBwUN5Z58KtGwdNB4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=nSaCmAW1UAPT2QoN1TvrkFGsUDUTkhAopEid8ClkXqAmNv+R1Wct+7NjF2TYdp1DA
	 Fw2AjYsm3zYHvtTiTYgdFpMpkcf2k8L8rQELwYOJ1uprhzhPu1mkS2FYnm1X2ItJ4C
	 cJ7XfyEEvYdyXl5NldfViJNaYWcadpwbiG2yJNecPAYoZj1ZGP9CfkXRm3zZr/3jAT
	 cUj3auysaPr6PMYoQ3Q7B+Ao4zi9QA0/dbB4N+9QRktrRC5QZAe8EtfnHOE8R8c2Cb
	 mn9hIsYx4ONMuS+AK/kIj9rPuGmM/GlXklWwGcHlsH5B2ScZH8wvXXwkGpKqQ0IqmX
	 n/cAUx0HZVAHQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aec139da7eso847059e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 05:11:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrWtvjIvPMoJUqjXCJbhslAHegJRzBH8M3KJrLKWUYSmgtcJnnOIxTfj9TceeNzD/A6kinqJAulZxqQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8wW3VQyUd3m+32jKqgujFqZNqFLQybKlYlNQVR2PNXnnhep8E
	SMt4XBoxA+4F19fTRUezgCsXsXnrAhwhIPsorlNzn7AmkaTUGFU35YqYbIlSftaf74Sl0ncuApH
	lxikqJ3XFcgga56Ze8p/dfnGWh7MMuUBK4FGrQ+C1Jw==
X-Received: by 2002:a05:6512:252b:b0:5b0:12a4:2264 with SMTP id
 2adb3069b0e04-5b012a423fcmr482455e87.13.1783512673495; Wed, 08 Jul 2026
 05:11:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 05:11:12 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 05:11:12 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260707233511.1272686-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707233511.1272686-1-rosenp@gmail.com>
Date: Wed, 8 Jul 2026 05:11:12 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me3hfzzZq=ZvobyYTnu-Kv32psnsJUbuJ7Y78tKmqinMw@mail.gmail.com>
X-Gm-Features: AVVi8Cc4jRMGhxihfS1pPF3_7wYL3OUHhhQfm_5rIMABF6bxJyBddSAwBYSj6zM
Message-ID: <CAMRc=Me3hfzzZq=ZvobyYTnu-Kv32psnsJUbuJ7Y78tKmqinMw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: convert to noirq suspend/resume to prevent
 interrupt storm on resume
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39669-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69494726293

On Wed, 8 Jul 2026 01:35:11 +0200, Rosen Penev <rosenp@gmail.com> said:
> The driver uses the legacy .suspend/.resume callbacks, but sets
> IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
> runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
> interrupts, and only then runs dpm_resume() which invokes the driver's
> .resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
> mask registers).
>
> This ordering means interrupts are unmasked while the hardware is still
> in its reset state, potentially with incorrect polarities, causing
> spurious level-triggered interrupts before local IRQs are re-enabled.
>
> Convert the driver from legacy .suspend/.resume callbacks to noirq
> callbacks via dev_pm_ops. The noirq phase runs before resume_device_irqs()
> on resume and after suspend_device_irqs() on suspend, ensuring GPIO
> registers are restored before interrupts are unmasked.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/gpio-mvebu.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index a556fdb267a9..1df763e60726 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -979,9 +979,9 @@ static const struct of_device_id mvebu_gpio_of_match[] = {
>  	},
>  };
>
> -static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
> +static int mvebu_gpio_suspend(struct device *dev)

Needs __maybe_unused for SET_NOIRQ_SYSTEM_SLEEP_PM_OPS().

Bart

