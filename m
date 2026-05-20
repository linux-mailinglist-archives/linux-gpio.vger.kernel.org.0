Return-Path: <linux-gpio+bounces-37210-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDkgKlHUDWrW3wUAu9opvQ
	(envelope-from <linux-gpio+bounces-37210-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 17:33:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A9F590F4C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 17:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EF5E324D229
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199D33EF0BE;
	Wed, 20 May 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfFhkMbh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEDE3D5642
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290127; cv=none; b=mVIPDB5P8Z5QBf46zTTnx2RM3ejlsbvDGpcybQVQd7UkiKZVmMtF8UTtjHKzAlg1U9vYz9sl3mpLZhsR3CVuxoGo4TPJApDjqxt8bb+4DY/87UG/KRki+itQ4yODUMxzFek0f+ILUlM1x2fafk/Oy2cm7ZSpSXhmHpwOxQc222k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290127; c=relaxed/simple;
	bh=jhnTY12y5lotrhqZzCBsVpLdBkHhAK/d+l3qAwFgP2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sI4/VWByvqwm5vcly6onDmwZMY64r2A1I1Q5y0UW+rfFXTyPwcNoc1uX95P3zHsSM17V7cCra1xm93i5dWY2uC/pI/8BRxHew0IBP8A+8p28XSNuVU+qWdQSHCFs/hU0XbACFNBf62Ql0G1DUqsGETAX8PXUo0y2/TE/wkBMjgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfFhkMbh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811B41F0089C
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 15:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779290126;
	bh=tXwW/SaZzGQelLcgmeBNnCNKn50znhPz58TEo5aKrCM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OfFhkMbh6/iil3R8eySbuWkAkTr5EBxAg5mV9gmXGVdQ/QqrBdLk0aHbgalZFLd3S
	 PW9FHC9x2ozBEeHYJzloEusRL0VI1oCZ6/MZp1+wn6oAaLDGcZwSC/2Z7D3vV/8t50
	 BPAFRFqTBXn/LgDTLsS6Kmne6IEqroQCfxY98T2RKV0/uirmBW6kZHNDlxUikyt5tZ
	 Lq2NieEGmwqaUSVaKOFTaAy+PzE3MsEIyRz3nZQr9J8HkrGOUK+z04vd16MXTVlgVV
	 qFMjFkZJRDekxUf2n6HqQL7r+GKZtCx9e01OOSXuyNm16A+wRk3oFnBMYLfIms3TtA
	 3AS4+SH/EqB3g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8fbe18b1dso8516538e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/LXIKRoOvvcFPa3fMQugPxwIeoXHt8xeaiFnLGBAJQ9IRO2v7CQQa3y7rxlRqKX96GpVpaIn0pLpwz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy258iHDxpx3iLSE4NtHgDkcYaRhsFey/JsDJqvPbjpGv18yLQ4
	etqgblWOQk+oJRK+t+pwYbAPTLcyiHECqbuvZaw6cXX1cUp/GYF7rusi6dFrlodY9actG0QNiAy
	FgKUn4ClGJ08/4qj6kUiHe6EchLDHe9TyE0oXlBjWJw==
X-Received: by 2002:a05:6512:31d5:b0:5aa:b6a:7a8d with SMTP id
 2adb3069b0e04-5aa0e779e30mr9211550e87.44.1779290125200; Wed, 20 May 2026
 08:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520081140.637637-1-thomas_lin@lecomputing.com> <20260520081140.637637-2-thomas_lin@lecomputing.com>
In-Reply-To: <20260520081140.637637-2-thomas_lin@lecomputing.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 17:15:12 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfM38h=zJU5Uy7zu9pigjb-XBAteBhUmvMAKZRWHGZNKA@mail.gmail.com>
X-Gm-Features: AVHnY4JDu5NZZ0wIyz-eam2N1N-uPmkRu8vNP0BsaGtOg31C0_IaXbfTkCj7LWM
Message-ID: <CAMRc=MfM38h=zJU5Uy7zu9pigjb-XBAteBhUmvMAKZRWHGZNKA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
To: Thomas Lin <thomas_lin@lecomputing.com>
Cc: rafael@kernel.org, lenb@kernel.org, hoan@os.amperecomputing.com, 
	linusw@kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, jsd@semihalf.com, andi.shyti@kernel.org, 
	broonie@kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-spi@vger.kernel.org, lucas_hao@lecomputing.com, 
	puntar_liu@lecomputing.com, jihua_tao@lecomputing.com, 
	stan_xu@lecomputing.com, lumin_liu@lecomputing.com, 
	notics_zhang@lecomputing.com, braden_zhang@lecomputing.com, 
	harold_wu@lecomputing.com, will_zhang@lecomputing.com, 
	aurora_jiang@lecomputing.com, ryen_lin@lecomputing.com, 
	andy_jiang@lecomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37210-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,intel.com:email,lecomputing.com:email]
X-Rspamd-Queue-Id: 37A9F590F4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 10:45=E2=80=AFAM Thomas Lin <thomas_lin@lecomputing=
.com> wrote:
>
> Add ACPI ID "LECA0001" for LECARC SoCs that use the DesignWare
> GPIO controller with V1 register offsets.
>
> Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <brgl@kernel.org>
> ---
>  drivers/gpio/gpio-dwapb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 15cebc8b5d66..c1f3d83a67c1 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -694,6 +694,7 @@ static const struct acpi_device_id dwapb_acpi_match[]=
 =3D {
>         {"APMC0D07", GPIO_REG_OFFSET_V1},
>         {"APMC0D81", GPIO_REG_OFFSET_V2},
>         {"FUJI200A", GPIO_REG_OFFSET_V1},
> +       {"LECA0001", GPIO_REG_OFFSET_V1},
>         { }
>  };
>  MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
> --
> 2.43.0
>

I'm not sure about how to interpret the cover letter - is it fine to
take this independently through the GPIO tree for v7.2?

Bart

