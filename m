Return-Path: <linux-gpio+bounces-30885-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDPcIFTVcWk+MgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30885-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 08:44:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2FC629E1
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 08:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 01AF050390C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 07:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC3538756B;
	Thu, 22 Jan 2026 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ2UxbAv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B34134B18F
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067447; cv=pass; b=amCoHtLIkPTjFUpwfZxwf9GFblC4KK3qZBuxKOk3fQiHxp2HPuJGnbcqFOUFzkBNEnzN2n2ELDxqWKQ0XuydF2pkG325OFrf/e4HcbwbOjmhX0vWrlS9i1eYNnAsxfWfry3+QDWS7aT02ny78ZuG7ZFUnU+4n6Kt4TbrSuLvSN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067447; c=relaxed/simple;
	bh=vtj9L527tNOVwzAnTc+pMOZa8fCM4Hxc9CW3SejLkm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rph/EI9C7MT+enzC1tRU9GzpzzHHCyQYsvaKNJ/YnV7lz3hHfHfzLYggXMcPMgkxTIexKTgoP5kRb5IfWw66QtS/r5mrx8N+eoF6gOCdHcLeBWGcIZwPO4l5CF3/rhQCwmfX1K7NHR71BQ19Xk8mTQed6kwEzVcO2sqerjb3zno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ2UxbAv; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b872cf905d3so97025766b.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 23:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769067444; cv=none;
        d=google.com; s=arc-20240605;
        b=cfIsGdnu2E0zQVVC79nxCrY2DCaAG5PLXq+SI7wcmClbAvEbe1i0swl9XJq+NmdLop
         K2q18/xvq3wSVLnklNBomDZhUM4+vrpjH3IUzQBQsHvnQp7QRXtnz2HaUNhe7lNwhhbt
         6I9Z1KXqCgdXvYmX5vR2dmHZ6lobHlsbIEv7gf2IbgsUo00wDFqJvnI1ge/832H0UsuU
         A5aSn2v/UB0zjCq6f4bba45dn14cddzt5PCYWPjn8d8jNuOz5qV3M7DgfLYJNStO1Iug
         q1VD4arSFzMIwP33tF9eEryrlg1Cvm4izwC8AzElwojLSybd2o/4SHZuLHVPDy7gAPwg
         Eq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YphWGYdugj+TzDs3oTHQA8YUU8yI49MJ8VruBQ9OUdM=;
        fh=mQSobBqly9hEDJkIQEaorgGVo0cW6HaEgEKyLp1RU30=;
        b=Mtn8dkd0wdr3dQBrjnGdcFhCJYy5xFZYlt3I8GJyPtGT7Y3E8KX5WIOjdt209vkj6a
         tSTJ6ANXQ4lA3GANtgw5ssZTNJ3UUf6ZpjnZvLqGh6oYJ9ZNazWKJ+CLpt4mr3/CKyG3
         /KNjxm77aauXtIqNuRcfVbHtQcziPOJQWCa2DVeiVRh4rFbry90CeBKxPjiB8/rOz3bX
         goImIdBSQv8wMsXdRbzR7uIp6nCO0gs4cyn9gXrrA9bmqYr2sY4qKQ84j/RgaAV0JlV4
         oUzGGbxZV+ifBhheuy9gPkwsuIGvPn61hqITaUiHKUtI4LSs6qYcbcLSAvUvSEcHltZP
         zYdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769067444; x=1769672244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YphWGYdugj+TzDs3oTHQA8YUU8yI49MJ8VruBQ9OUdM=;
        b=jZ2UxbAvOr06WzemugDNFHeMvZA5jFOUsuXz4NNm5lYE0euXq+VmJRrc3ASilzWlRC
         qsiplZ7cfGXt0rBc7YzTjJlfLwGUKZ9cPt/X2vlgeVkF00Vc5gVe1OkxDW6UK64agAAu
         5ZapvyajxIKHxh6+jmh9ikZRqOQRNPJBukd4FMQUSK3n4GnEwyTImN+ESFNHPLV/7o9z
         Q6DXn1u1Y4faPTC1dKz8cRHb25auB/VyeZOXykqD68PSscew+y2F3UVZ6RJ6BcZthmCw
         qzGUp5e3vW7aFV/hXMWJCDuyVkaOyr0AezL2Ap9CTuYV0lsHbOB2TFnaHTr5kw+uIYYm
         fEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067444; x=1769672244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YphWGYdugj+TzDs3oTHQA8YUU8yI49MJ8VruBQ9OUdM=;
        b=EpLe4uqOiz0OuvE1BhDTv4D6tZFcxSZRQ5QnB4KnHBHLIXvyrqTeJDvcbX15UXxRbS
         NPE3qBqbeoxnwZAZ65ajhBK1AGDHdD03YcDxfLvkRV2VcTYrxUeDJJ9H+6nvFfT9SOb2
         xUr5AQyp4JDw9IgOKnKqW70l9rVSrTXZuMueR4K/YLjI+utqQHsd2ytCVhuy/55miz8j
         YLGxGcufy5dNRtl3oWzwg2ExJ/sqx8Ihy5w51mNceiZyiLjcjRbpaKW83Z5z3CiqiFwV
         DytqlIopnB+NDBZCY1umTHIPjj+fV/G35Bhx+k1led9+9eKyRdQdaK/Io6IaxmXO+YRI
         EHkA==
X-Forwarded-Encrypted: i=1; AJvYcCWvNa56JLfzwBZVBRqWd+aPwGmriQ1yfn5FfzG5MuWkyQ8YU0qalnOkx+ryDC8gjKUnXx8ZJs2J16rz@vger.kernel.org
X-Gm-Message-State: AOJu0YwfE6ENWuF9rnmunBA3rsQ0NCOTtToz105sMdEG9WUe7fMGHubF
	Fm9gL41HeFDeLjqqaaksHjB/wr58r1VH11TPtCOLvVos+R8xhihUDQvDhe8LNiXXdOntXOqFUUY
	Ys+71CoOaXdWPVjBhXAnfR0GDfrHpnKU=
X-Gm-Gg: AZuq6aKZXGRbc6fQFESB0NbwZNsa6sroHvEX+Bs/kPsyMzPKzNnsFXVOb8eTc5Xmpbd
	mFTHgKaaJKoHM4w4Lhila/oCWQzw6ECxXFYW3HuBgsZKi41M/hgOOjWsYPPxBjG0WODCe1BLJLO
	NpTKRAUM65KtsaXVkpaxFGGt8OiHHKVdwUcmqE2RHk/zin9322kR3bu8byx2Q8VrsUIy6Xz4ZAP
	nangaoG7SM9Eq7Alvtc4L5XvLnfUyStV2XztWiXrgNAmZlO5GizVrh+z0mWmbWIAgCrpjD63/Qm
	8oQG34h3jTaWs7RSxqP738ePPWMgYRoE/kc0fRrW3Pc6TAtrnd6a8y0qnxjqn7GTBNstg2o=
X-Received: by 2002:a17:907:d716:b0:b87:3beb:194a with SMTP id
 a640c23a62f3a-b8796b3121dmr1604257266b.44.1769067443570; Wed, 21 Jan 2026
 23:37:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com> <20260122010516.1200630-3-florian.fainelli@broadcom.com>
In-Reply-To: <20260122010516.1200630-3-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Jan 2026 09:36:46 +0200
X-Gm-Features: AZwV_QgHlyPeg-jfLq6w7Lfoz9utODZVsyacjaI519GGrv-Z_nWFKLu2EeJQ13Q
Message-ID: <CAHp75Vc=ejHPwA05MHBxJQdJWv49pcuTNax0VikXruvwVM+Y9A@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: brcmstb: implement irq_mask_ack
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30885-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,mail.gmail.com:mid,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: EC2FC629E1
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 3:06=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> From: Doug Berger <opendmb@gmail.com>
>
> The irq_mask_ack operation is slightly more efficient than doing
> irq_mask and irq_ack separately.

I would refer to the callbacks as

.irq_mask()
.irq_ack()

et cetera.

> More importantly for this driver it bypasses the check of
> irqd_irq_masked ensuring a previously masked but still active
> interrupt gets remasked if unmasked at the hardware level. This
> allows the driver to more efficiently unmask the wake capable
> interrupts when quiescing without needing to enable the irqs
> individually to clear the irqd_irq_masked state.

...

> -// Copyright (C) 2015-2017 Broadcom
> +// Copyright (C) 2015-2026 Broadcom

Shouldn't it be rather 2015-2017,2026 ? (In one case when I updated a
driver for Intel, I went via Git history to gather the info.)

...

>  static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
> -               unsigned int hwirq, bool enable)
> +               unsigned int hwirq, bool enable, bool ack)

This type of interface is usually discouraged as it makes code harder
to read and follow. Since there are a lot of duplication, I recommend
to move the ack op to a separate helper.

...

> -       gpio_generic_write_reg(&bank->chip,
> -                              priv->reg_base + GIO_MASK(bank->id), imask=
);
> +       if (ack)
> +               gpio_generic_write_reg(&bank->chip,
> +                                      priv->reg_base + GIO_MASK(bank->id=
),
> +                                      imask);

Id est this piece...



> +static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct brcmstb_gpio_bank *bank =3D gpiochip_get_data(gc);
> +
> +       brcmstb_gpio_set_imask(bank, d->hwirq, false, true);

...and call it here explicitly (seems the only place for it, so it can
even be just moved here without an intermediate helper).

>  }

--=20
With Best Regards,
Andy Shevchenko

