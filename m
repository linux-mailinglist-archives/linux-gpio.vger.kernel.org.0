Return-Path: <linux-gpio+bounces-33367-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDbdIzwYtGlkgwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33367-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:59:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F2284606
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB60B304FD7A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474D337267F;
	Fri, 13 Mar 2026 13:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZSmqgCY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F94396588
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 13:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409942; cv=none; b=c8mizboXh/aX2J+3TfJR0EZKhSw7X+rsJlv/ix6dKgAuVR24tAojE6Gix5LEqMLBtP1dIbC9Rji2juEIXjoQD7jOcrwNtxjhNSRCpU9aLmTX9bF4aTma/FuUI7dCBQPBaCVhfHFVI3x338u2dIqLMMccb4/zcshVK9MwBzFeCac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409942; c=relaxed/simple;
	bh=VoeqO83H0UC5AMfVMLZGLXHpXTuKkVEN28onYYM0e0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSWiFd0I4Do/OWZV3hVHc7Ry28oMNOP9P413/iBwqwKAKLUjUzSz5Evz62UNlJT4FrOUYPZ1reLfohvC6uJvyo2rYj91Y/wytWbQCaT+0SDCNHxPtm1ppxagaj+6ErHeBlVRcordTejQZhRnWqW8TC0egxWkMItX6o/Hnljhkkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZSmqgCY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015BCC2BCAF
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409942;
	bh=VoeqO83H0UC5AMfVMLZGLXHpXTuKkVEN28onYYM0e0Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MZSmqgCYwzymB57WylTXJKuy94djkPa14SWh4N5smLlV3ADa12rrsCqb+xDFyjcyN
	 WtVMjxicsgK94XZdpi1Li4IdWCxfzm/mGA2fRe8yp63tba9ruFVhbmkrd2sVfihfEb
	 XiMSlTdpvUF14L6RgTgHZrWNGDlIyQTrsvKLrbiautsEzvJXXOrjY828w+/q90h0gM
	 YFHkKqG8M06P08R6rXJE0XzVpIBJmlb4oorgN/2g4o+IgBmp0Btp44Y88IquwaFOLF
	 r+z9npaTEHOTsCsB8thWMti/+EPaVHcRP6cgDw1NLc5kAt259u0n7o435MzQ5Xd6Xo
	 hNa5tAi4YOeDA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a4a8421b0so18475331fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:52:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKbjhLXuzGYUef1xRaAiz6gcgYMrsfFub2ozmL4K34YGY4qQ2vXn2jS2Fc9TdtLEacbaf5ApZaZT/q@vger.kernel.org
X-Gm-Message-State: AOJu0YwqzPx+Agrgh90TjULt3CMqiPgsJAyqCiuNRhnlnkCk15D9gEqA
	nu2i/4RqebKdxNdrWUw5zfIzodsR/4jZsxccOfBhxP+qi2NKvyi1cKvyboRhyjacSXb07w/BCF1
	mfVWnzv1izzx1XIinT5zLo3JuZfPMpbN/GBO1V/B+5A==
X-Received: by 2002:a2e:bd14:0:b0:38a:422d:b644 with SMTP id
 38308e7fff4ca-38a897bd810mr10674181fa.23.1773409940424; Fri, 13 Mar 2026
 06:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech> <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 14:52:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfjA=SPOhcLiNu6L+ZgRm5Adr1kBEw7Ma-zTOdQ1dJ5Gg@mail.gmail.com>
X-Gm-Features: AaiRm52YNR1dZVEn8jJuthdZGp7ne06EpwHE1_pZx_PFXg-Rre7dkHe2Q-4rKok
Message-ID: <CAMRc=MfjA=SPOhcLiNu6L+ZgRm5Adr1kBEw7Ma-zTOdQ1dJ5Gg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: spacemit: return -ENOTSUPP for unsupported
 pin configurations
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33367-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pigmoral.tech:email,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 725F2284606
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 9:43=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Return -ENOTSUPP instead of -EINVAL when encountering unsupported pin
> configuration parameters. This is more logical and allows the GPIO
> subsystem to gracefully handle unsupported parameters via functions like
> gpio_set_config_with_argument_optional(), which specifically ignores
> -ENOTSUPP but treats others as failure.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

