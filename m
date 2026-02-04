Return-Path: <linux-gpio+bounces-31419-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JuJNqC2gmnwYgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31419-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 04:01:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B49E11B4
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 04:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31FAD30DB012
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 03:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622482DD5EF;
	Wed,  4 Feb 2026 03:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu1JqfEM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4CF2D73BC
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 03:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770174052; cv=pass; b=E07wAZvTCewTfO+PKXB4wQRq38zzw6WlYTnqkUkGylc/rMqVVC/QiEEWBz5LhG5Y4vBJ/e6IV1QWXiOgio9Cc17yQZVc90qmmekXiNL60JMUigM0PXRG/hNi56wIdEPCRHzX9L8rvTyzyN7giScahuQh0KU9SEESpWpQHtzVW8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770174052; c=relaxed/simple;
	bh=C7fx8jMgzpNF2mehVNjN2GmNexljYnni5J1NsYsG5GU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItLbKKImr0CtHm0qZJgAXLm+szHN3tjgtlt+3cMcQ+g0gI16753S0HSHhhTGPdBPKTLi4ca6ZxuBH+XddHWNl0wOyRmTwcFPPPQUFvpzG5p5Zn8MvzlAJlTvLfS/DSnQ2rypGLQcn8l9T71lrSUhY20pUi8UmjvabKEhKBAjG/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu1JqfEM; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-655af782859so414742a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 19:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770174049; cv=none;
        d=google.com; s=arc-20240605;
        b=WygPNEnm2dJL5nBs28yDZyo++3tVRVSYRErtudjMWm+qaWiMWqWbRI4GkTdMt5iKzj
         9a3eSflGXHRL4TCN38myXsVstTSiDmrHNqXXMm45oki08n/3fhB1siGHtmFtYPjzDVKb
         PW6SXRG9Yqm5QMV+lOIx4ZOLo0EfV7Xrp3TdOhQE5yovZRARNqq90solbAoc7EIz/vBN
         lvNbMeWWNuPK2xEiUHCioeuq4yeynOsW+573zRQ36WEm7Ii2mxZckYGk4KUTZWxVrTG0
         VfVhjSYY7bN45UnRVorKu/Nf7brxLKQLqs05egtaypVuCBKTMEWwuZzetgtTc8tTs5Yk
         cNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C7fx8jMgzpNF2mehVNjN2GmNexljYnni5J1NsYsG5GU=;
        fh=0hoXHItHPZKUysMXROx8WqW3VwAuGZrQhf6x91uZ0U0=;
        b=h2wZgPEHVbQ1a4tASogRDdRJv/aW5lTEKPRCi+Om+/7i3vlHIKizJ2s/St3/ZMnZu/
         iJoy03RGSKnHtUQE/8xMw5SmjihCl56pWLkdeYDIrD+HyG5/I/8Xqgl5rQNgvHumUNNb
         LrjgTQgi9T4U58F1+sIHl0YQcraniurhUg0MBlv+YGQJR4y5X2uxkT89wyx67yeTzJ2d
         54ss4FafnK8KPBLUYc/xAMmQ1R1H5eWnMrljdgfXWT4TnZzG6Wb9OX/iKnUFhvKPBewQ
         +EESm4tSKYsePlMBEUNhIdPtGuEp7FSjcpTqVVJVGJRAlZvXeRxBvh2i7EVLPMY8Mdrm
         IHaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770174049; x=1770778849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7fx8jMgzpNF2mehVNjN2GmNexljYnni5J1NsYsG5GU=;
        b=Cu1JqfEMHRY08msEFqs7kphO2plrPv4+nDnVFBaj2oiLBHuOq6CNF4nGOx/mpbFgw6
         CskOglIzLkM/pldbQATkifr90CZm+sZEFKbY4sqIlaRiGaXumzq1Ps035J+puVhO18+J
         qdR+83XV8DKW1JuGNQWQGH/IlgyWoDx8c1qMWRCnNvsH04TQNWJD/6EfRIjNvSnZVMXs
         GFA7XpuVXp5yRcSujw4fL9zGb3fxciR8gwVtVkRtNQO2/WcgInRpLpi2K33lK1muNLy8
         +rNZgCXRJTV8H6prubnmQW/CVWYa1J5Ugox2cWW7p9cFliklO4SFBsLIxSb3i1jRigvb
         WxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770174049; x=1770778849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C7fx8jMgzpNF2mehVNjN2GmNexljYnni5J1NsYsG5GU=;
        b=nw0/m/zLUCo1J2+FU1gITA3jw9K8/E2l8o40kF/ojNMChdHkoPpiP3DsTJ2lWOBOVP
         c94RL93BOtg7q2THQ2vjTr1wnil1SfSrEFvkSIKPCL8eBiiJT70sGU5VYYxiz/neIvtq
         VZ0jhh3feL6FU8KtTz64sNnxRkI6rb2XLqmULFNAc+8+DB6V0u17ptDCLfZjw/nQIXKQ
         uwqFDzs62mDo2I93lgKCuqvFbygcVQ0S1wsqhzPmtHfE47RplhcuPBPhkR1p9PUVv7XS
         rwznuV5ROuAZotEkIcDA6aDoiI8yr/vzyw4PCqnzNxGKL5jWKvLyapEcNxueL89f4XjA
         pMjA==
X-Forwarded-Encrypted: i=1; AJvYcCW1FtjPOUZGcmRoV8rVlB3aB8gpSXtacNgqpbDZFxfeP0DDlUBqCDliQCUWo/4BTG+2yaiB4Vc3hE/T@vger.kernel.org
X-Gm-Message-State: AOJu0YzRLh5251eDklRav3ZQaOhbHpJHV303Qq4yQfTe75fmwJh8lZih
	yMokVJiz5lKKWE2mibpJgctyr7D+K5uOgn0lNQAZe90NtmGhV5F8bsbIRIajjjiJdkCqr+q3tuj
	OzQ9Voi+bJex+ZcDOwK1ukaN/qVxJRnQ=
X-Gm-Gg: AZuq6aKkHQjd1/abR8y3eEsbT17puPwTQX4cvUjGpA2YmDsdB9AGJQ9+Cm9aZXkS/r9
	kRfQUiuo6opWnINy6/vqCAt7WPta65ZSSZXGKEr/sOURq9cG5DcO3tim8RZTJp+8EUJeFwY/4Jr
	ImwcsIfOrr8txe3aT3tz3J5RVoPXsZGoWWqjLM5A85mg9IXlbu4hbOPaFYzVe64N5efBfHnwqLR
	sq1q/v7BbadjUooln0iIg8IJ+HKPqVNp9UWtIxevaQbN5E7qjvAwOd/qwxKKHklDioB6E5jjxBl
	GQjNjVTIYTRL15nP5mKxaD9GRP8bY58HF7dU7KZc98VbgYlOYoZSNHzYS5j7ZJlUmT1MOvg=
X-Received: by 2002:a17:906:fd8d:b0:b8d:be68:bc21 with SMTP id
 a640c23a62f3a-b8e9f075e7emr93593966b.21.1770174048812; Tue, 03 Feb 2026
 19:00:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203234529.1081148-1-florian.fainelli@broadcom.com> <20260203234529.1081148-2-florian.fainelli@broadcom.com>
In-Reply-To: <20260203234529.1081148-2-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Feb 2026 05:00:12 +0200
X-Gm-Features: AZwV_QiGFKMWwrztGAXLjrUqQwSlkrLCB-kI9MW-fVpb9MUu9JhiJ0o-I1SvDYE
Message-ID: <CAHp75Vc_KutHDNtUNem1JAj4BfcXBwBSgKVnLY3+haPuE6N7dw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
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
	TAGGED_FROM(0.00)[bounces-31419-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,broadcom.com:email]
X-Rspamd-Queue-Id: 45B49E11B4
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 1:45=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> Consistently use irqd_to_hwirq(d) which is the recommended helper to
> fetch the hardware IRQ number from an irq_data structure. While at it,
> update the brcmstb_gpio_set_imask() function signature to use the proper
> type for the "hwirq" argument rather than "unsigned int".

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

