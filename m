Return-Path: <linux-gpio+bounces-31393-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEHpJycVgmmZPAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31393-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 16:32:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B45DB51A
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 16:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C6FB3100014
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 15:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A713B8D61;
	Tue,  3 Feb 2026 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLliCHWW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7229E3B8D4D
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132577; cv=pass; b=P/8iYAjn54x/CMFUE8m1Pyw8iMImc4Kh4gs8YMSGlIG+Yygb4cqZc6gyUKug5spLpTBnweVhvfPZW7vI9Dq1vBVTPASHpLFnj3C0q+idCXWJWkLmqoKgKm1EqfEeOioWCxNhcXQBZ0UCcQbsCBHkdAcOpYnsG8/psKazVxrR5cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132577; c=relaxed/simple;
	bh=z+K080tifr6dHRZeEB69mjdwz1gvd9Z1BcZ55srLuhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9QBobGLtMrVceFVJQIFGTRJiLsMBMUl2RpEdS0CWNszcOryoGBPg05VYbr2PYL1T3wVt1sZk+5lw0MVA6U39wnkX5xoHtpv65Miy4XAly99P9GvafyLJcT4qWrcL9d0SluGjd7jJUJTmgrQl/AFBYHUeGnGTvTo0DMKh/hiy9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLliCHWW; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b88455e6663so842136666b.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 07:29:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770132574; cv=none;
        d=google.com; s=arc-20240605;
        b=F07gQAaU3+JCX1PSvvfFnHnmzmS32y+zaLedXy75oGNmYVp1zNVyY6W+o5ER11EYXA
         aqw1XgCVMQVIM1Fi9NdTJ+jB70rdz6l3kmYsAVarI89tF+5+7X5+aR4AjWjJOCVHia4m
         wh1j9tbI99P7pf1mkuO+Q9K/GGC6cgSkWdMOwB8Bwn2kELseMAwjVgoLMp3dX4IIeDvr
         Gd8hUqYaFECUUsUlf4v6sdcl3LD9UaQdk2RnpR3kKwcFQs4U9c2IaXRylzIvL6u/akfJ
         IhMvflO7NC9IHL0KpMHKXNZkIpdIcV6DETET93x3RioZJaOFdeS08XwLxEsngptPhyvS
         kTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Go8Y8gX1E62+o8zanhiH4g4wNTHN1UiOP35WNGMfiQ=;
        fh=yenG/2ZwcLPKT5/HeA2ncsTQVZrQLWnCgsKHrhVw8B0=;
        b=LwgZ4A1foXUOq4h4goRsTahFUmfbZV7WQtJ01N9gpu1EuvZNLJlsQoJIhPBQ8KkrbP
         xEiJtmBPRXv9xm1JuS0edacX19KFM/GOOPa2SXXXXgIbhal0iNQsyUJvCvNDrhvP7Gx6
         AdFBFq/sQsQzKvUib4xs4uxWQUl/NoRjbA+iXzk6QQPju6ff8wCcl8gj76MhFjwxmX9K
         Pazm8SQZribhxzHihw9GE2UerpTwUhpl3Xp6nXq4SCEuVOdxudq/tmv6YU+/MVwUBROV
         SxN1C4nVdIuBSRAYH04aREHXVLmtX6iTOMXmjXbGtu4SyyeLpylaoirEmgwQ5IqsiOrv
         JVdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770132574; x=1770737374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Go8Y8gX1E62+o8zanhiH4g4wNTHN1UiOP35WNGMfiQ=;
        b=iLliCHWWDhetEvW3suHjtO4CKF1bwkyhXZ220vwWKYfq/2cUidepsO3VhWmGnHWbVG
         twU1Ab4bh4RHNzvcV9Zl5SEmPwsXY4Ef3vrfTh2T84P/lkKHVQ5Ws09X1l1kXt1WhrX9
         Mg5hEcV8c4xMabvP/wdkqySbIM1Ft55AACPtlP+3hk8wTSVSHrRWF6SmQghKMT7+DgIj
         52bNvbce/dlogUQ11tKTyUHahhdbw0elpbJui+4i/ufm8qujraldRMWqwXczEOc4167F
         AhHskDU3LkECGlg2rkLU2x7cTtpw65P/twrDCR254jikX+iDtV/gFjLLndO/Oiph6Anv
         QM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770132574; x=1770737374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Go8Y8gX1E62+o8zanhiH4g4wNTHN1UiOP35WNGMfiQ=;
        b=szAibVQ3FxU6TwkoVnhDfNzfthJ/X8i6BZ9y94vWT6TdGhQY7ZEKuQBrILvuy3CgZH
         JUWTrJiaTte5mpVLIM2dD/zpy1aUDHp2K520U0DejNr/tCaZSLs3hGiKnClMCbCG8twS
         LSeOg2smDBMfndWzX4jTcJpEGAnJ7wDJqhGj2LoT/nSnfYnTCgdo7LHQ35g35eMPwvhK
         UMLhlKDQqjtjAghtKEo2x8pELRR1IuwoF9y7wParjjiJeI3OZNN52+kURUCYUHGWQGvL
         ec8896ErxF9FIU3Te82p0FYqn+qPVoeKFfNF7TXyagJ1oz1bqQHs05HmtLu03uMmBOV9
         TXUA==
X-Forwarded-Encrypted: i=1; AJvYcCWDI9kDft7Mx0kBNFP2gvnY0ejhwljqLpMqftQhBNt875RuRaSEfT7aYFuE+fgY0m2xKmYiWgO4062m@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvcYQK6aAhnajHErFiGPTvHabxRSdbqbKw8BAcXOD5D6lGSyk
	FVZqS48F7b/yevOutLVMvh/L8nM1JXVXpDJWd++/ByMIXYIo9Fpt3a3MiSWoF8Sl3RpU7tcncLl
	TQC0RQlzr9DRKPOXfo1VTvSj9RTN20WI=
X-Gm-Gg: AZuq6aK4DOP2FCh8Ln5Hj14a1SJqBhzHUSA6edB5192au8MUpovw0myPvoLVDNXtFjx
	KO5VZsis1QiTdPUCas/PKz+MPVkmyLYT+3TBw/8aqg6Yy03LWQ7Dzfqf90ug0EAUyjmSfrW/SnV
	GpJGhVl/5L4IgwTRsKps59+yOJ49lc7ty13P7o1CyZmWTSP5tseYrWIPEydHW2k5f07ttNeQUBN
	WXiy8zO4YBYtv5EevhCMQPqjphMQlmdde+51zDgaC7PwOQUX54BkFR+Mw2nHzlaxNVqDYbUx/GN
	bsSPdiiwajRxoyjyRLbZD3QIh7HPsDjQNRmCwNFet6oNpwG87J2ld7k4KcU9phL9/dPHMA==
X-Received: by 2002:a17:907:1b07:b0:b86:ef1f:6d19 with SMTP id
 a640c23a62f3a-b8dff7ad57dmr990029766b.59.1770132573415; Tue, 03 Feb 2026
 07:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129201312.634819-1-florian.fainelli@broadcom.com> <20260129201312.634819-2-florian.fainelli@broadcom.com>
In-Reply-To: <20260129201312.634819-2-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Feb 2026 17:28:57 +0200
X-Gm-Features: AZwV_QigMJ4s7JE_KbPeSeyx-VsNtPBsrWImvTutmo18i_o_7klRldj22USRrsg
Message-ID: <CAHp75VdnmPGr3WSiyjCrzbgJwOFE92gr7yUMb2QqS3+GGRtAiA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: brcmstb: implement irq_mask_ack
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31393-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,broadcom.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C8B45DB51A
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 10:13=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> From: Doug Berger <opendmb@gmail.com>
>
> The irq_mask_ack operation is slightly more efficient than doing

.irq_mask_ack()

> irq_mask and irq_ack separately.

.irq_mask()
.irq_ack()

> More importantly for this driver it bypasses the check of
> irqd_irq_masked ensuring a previously masked but still active
> interrupt gets remasked if unmasked at the hardware level. This
> allows the driver to more efficiently unmask the wake capable
> interrupts when quiescing without needing to enable the irqs
> individually to clear the irqd_irq_masked state.

...

> +static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct brcmstb_gpio_bank *bank =3D gpiochip_get_data(gc);
> +       struct brcmstb_gpio_priv *priv =3D bank->parent_priv;

> +       u32 mask =3D BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));

Use API to get HW IRQ from irq_data. This is documented in the GPIO
documentation.

> +
> +       guard(gpio_generic_lock_irqsave)(&bank->chip);
> +       __brcmstb_gpio_set_imask(bank, d->hwirq, false);
> +       gpio_generic_write_reg(&bank->chip,
> +                              priv->reg_base + GIO_STAT(bank->id), mask)=
;
> +}


--=20
With Best Regards,
Andy Shevchenko

