Return-Path: <linux-gpio+bounces-31418-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNPBEBO2gmnwYgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31418-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 03:59:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE044E1150
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 03:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36D553051076
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 02:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5462DB798;
	Wed,  4 Feb 2026 02:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LE+1o84w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B852D7DC4
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 02:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770173966; cv=pass; b=K7D20RcGlgPJsGD4MQTABCMrsKB9EjMx7OcV0xjEmc8OzRwT3QjgD2ALnIjCuaHNKDvVIClRuakY2mXlI6flx6ODXEdF4d34EZ3/+1jcb/cr3hVQMvZxeD30zRMAxZUajr4KpyvfWbe4SasGSJm+QfuRaz55PYxYbqhmfeicE40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770173966; c=relaxed/simple;
	bh=tTFllk1zzNbACuzY19ipb+ceAwkukqLQ5UCwxQ1R3kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAZpe7KQUikxS8JsPn5QmIVrovRkm4ifK7+/GIL6E3O6ZVWhLJqXDaZrlFjCWxnropTcvzLSyuIwf4KS5qMCBWWKzfhUivN9/rUS6Tht9LlsY8jLFYLsD/piChbVLulT2rQgW5Kdzn90UVmWmPzpYdlC4DwnTNZeaSQlCylu/10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LE+1o84w; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b87677a8abeso51801466b.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 18:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770173964; cv=none;
        d=google.com; s=arc-20240605;
        b=kYP1E6X+m9KoHeN0B7WUyWBOIALmWAbTkSdRxJYFmxOsN6nDiKJ/rMPxpaxj23fGVe
         JNbsrGaEMhVUtz++7S8xXTlTp9Qr0N3znBt+xTivruHyJDHJQ518nBaYpdstjhXY40jx
         CcIt8BCs10fkof9k1wowrFZMiTJC8fXx46GjPCZh9kFmTDj966Jx8rNwHj9l21l/7zrI
         G3BYsYxj5+ZAhaxsJJDcktx8au7TZVoiZ9v6Po8MhMAD/ess9fPHrTqGZpBiiUvnNj+j
         M6CYD9N14P4y3zOJ7YB+UOiLpTzwC9NWfyve3Prd+6FX+wvo/uwxBre0nAlLqeO/u/HU
         fm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QHqz+e3sPdTi13BtMXrC1ay/WWypD41pfifS2U/k23E=;
        fh=sQytnlRKIh5UjsXZM5ir95TzPEUUOHW/1FvHLq2ADXo=;
        b=DD7nCyk1RSW65mfFQAonCra8C5uAxsFXwi0IzLR4AT5MOOo8jvx53itnUWggfCyTk1
         BD0QEgqCp29Ds1afXh2cBdYtOoxAzH7nwqvTH3R0PAvAr7G7GZzOZvZgQWddLHJkGLzb
         2sDYtxCim64zXNTkuU43V9W6aCPEm2uXWZ3laBluYrru7YqsLeGoWYuhjYEAIB4twdqF
         VyKroykaMyWPVi0h8QJ9DDU5bONkYTOOd0e4uyxy/lOmU1sBQgRHVWMWWT7s8nmOUZwY
         TNFK38gna42GqLT2uouI+AgZbOrGHQnpX1XEdSK0FOF0sZNfjP6xrO1pZ23P7IJKPbzu
         3ndQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770173964; x=1770778764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHqz+e3sPdTi13BtMXrC1ay/WWypD41pfifS2U/k23E=;
        b=LE+1o84we/yfMAsnwYPid84xxp0kTSKGjK+02j+XFLl9fnXPaBNDGoDlFSMAXzqqgT
         sq5A3aCDEWEB+Bej5WADPED+a1pG3xNMm0QJX45HTDgrlsglmhZI1yaWgbqwoq/MWFFF
         bLO4jm+kQpXeFvkS26F0t6Lp0pSRJrZzM/XxrUQdsXAH3sotdwRkuFtRJG5DsKcHTKid
         mQGt23zSxZgVmTlzonNOnYpjUNWRkqnMhzwxQRgyvY35/rxIXaDc0XKTk9/ps7oXFze7
         lLvhD1BaoK7DrqEhKVQcM60YJo2NnFkBQ9Yd+lx87UANXsxjjLPbLQ4IbKJo3uQWAU7A
         kIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173964; x=1770778764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QHqz+e3sPdTi13BtMXrC1ay/WWypD41pfifS2U/k23E=;
        b=IrW0oQ23rBq3gBs7FJz5VDh8WP1VALhoWnsKFO1S/DsTE0HMhYccrKiI/Y2uWu2Szr
         HU90AuX1mEVhBbdiKTJmhpK0nNTwcI7bS7ZOWO+pqaTmNc/Xhf+ahkCQeFCDqzBuDiqc
         DUVpJ2t46puZ7FVnhuH7o+uhOaQ/rcwlN/i570JJcfENzhVG9l+mr5iV+lR5c2uUdXFs
         g2mpnk0wrnrx4SbymaTuXlsxwtrb2oXuXCeSM20tVtHAP/1i6/PGG9KQy4x3xW/dK8DB
         pdIp9LRXiFf3uRPUk1EIiPL27O+8Yb5UZefB+XNvHSrzjUtPhKquovAWQWZS+chy5zxF
         WtWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa+vNKNVKf1LLyVe7LKpJ0ttscs51+i0zLD1cT+AMeEvWCgMmzbv5jBhWu/nkR5VBkSvrSzw26vXYj@vger.kernel.org
X-Gm-Message-State: AOJu0YzdnEzS6WQI54PYDcvLgGRzkQLmF77HVOCGjohqh3uAieia3wxA
	e+JPwM9g8ZUn0BZ28k9Kr7bJ0+IeZ8NYyqVT9ckjOTrcVYdx+JAewWAolpL/PO1LxZYmB8zkK7F
	WQNqAbu2pjHEkzLTVMn4FvFA4q9BpXXs=
X-Gm-Gg: AZuq6aInNRmij/dzO1Q3DFrHoLcIdG4poOP8PaaExLwtTQhzRceonYSRIASy+6WjoVl
	0fh2EvL9zIVytzk4pLn5vGi/CNve/0v2DyqU8vd0nCvebR3vNllM005j3v4J4y8t8qTtVqvLuqM
	keKKsQWv8dbIYcczekUbjcP1U9a+cGf+ORX3ykiLoTpTHKVWaO3CWP7qCGW29Ry1knCbOzFTgYY
	DLd/AnsFLQIkdjHf6VTE8GwOJrvmA7O52Sf4umckSY2eoF2GM1u94wINp0zvKdK6EGFdiBBNhkM
	aj2GoMBq7deO0OwvIxhSW7t3iNWYHKjfL/6fjyBVqKn1uDeIBAmru+d7WI/+0Ty68Enzl9g=
X-Received: by 2002:a17:907:3e0a:b0:b80:3447:e0c0 with SMTP id
 a640c23a62f3a-b8e9f342159mr106164366b.62.1770173963504; Tue, 03 Feb 2026
 18:59:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203234529.1081148-1-florian.fainelli@broadcom.com> <20260203234529.1081148-3-florian.fainelli@broadcom.com>
In-Reply-To: <20260203234529.1081148-3-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Feb 2026 04:58:47 +0200
X-Gm-Features: AZwV_QjZzUJjM5fBdEy25Ax-3QcvwUVgo21OqIt0kTyeBQWdkwfcOYLR7hZKqlI
Message-ID: <CAHp75VfZDQZod14KsKVLO8kFP1njadQUX7sB+Kri1gBjON07LQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] gpio: brcmstb: implement .irq_mask_ack
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31418-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,broadcom.com:email]
X-Rspamd-Queue-Id: DE044E1150
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 1:45=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> From: Doug Berger <opendmb@gmail.com>
>
> The .irq_mask_ack operation is slightly more efficient than doing
> .irq_mask and .irq_ack separately.

They are still functions, so parentheses can show that.

> More importantly for this driver it bypasses the check of
> irqd_irq_masked ensuring a previously masked but still active
> interrupt gets remasked if unmasked at the hardware level. This
> allows the driver to more efficiently unmask the wake capable
> interrupts when quiescing without needing to enable the irqs
> individually to clear the irqd_irq_masked state.

...

> +static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
> +               unsigned int hwirq, bool enable)

Here you also wanted to change hwirq type (or leave in the other one
above the unsigned int, however, the irq_hw_number_t is more correct).

> +{
> +       guard(gpio_generic_lock_irqsave)(&bank->chip);
> +       __brcmstb_gpio_set_imask(bank, hwirq, enable);
> +}

...

With the above being addressed,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

