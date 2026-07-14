Return-Path: <linux-gpio+bounces-40058-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v3TuH/A/VmrE2AAAu9opvQ
	(envelope-from <linux-gpio+bounces-40058-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:56:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3375564C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:55:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thingy.jp header.s=google header.b=TCmdS9se;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40058-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40058-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E67A23031A8D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 13:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D0F47B42F;
	Tue, 14 Jul 2026 13:55:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368147B408
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 13:55:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037343; cv=pass; b=XkTD0yUK4IsboonDOu91qb635yL8+Q1RiPl9ITPnSnYj7GR+wUaH9X7DbhPLD1x/bSFfIvBvWR8OlZa40VaqzwFYD7eLNzcdjNWOvA9u/7nfDIu9JDfM6E5z3uF4AVZtxMsCaF7t3uUYcutrkZMEOcXqyWOR8lvlg26ddKgfQQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037343; c=relaxed/simple;
	bh=zDPVzXyo4cmSR7Pg/m8TZa/k3WLChGab+vHvCk0kZs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBAcTTZt+PSTIq0qITLGwMfYP7dVjoFI5PKS0/NkzCboVYofIbeYhHyY1osZuf7IKnUaLTaPTF16nqGrJO57DwnLSjsXMX9YfGPEP+/7JYQiB5f4203LAeZ4EpShONLJKUFPqbTANkm2p4i2ig32Ka/APlARa0Vqv4rmI6uvB7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=TCmdS9se; arc=pass smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1765149a91.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 06:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784037340; cv=none;
        d=google.com; s=arc-20260327;
        b=E7uEVen/xpqohgP0F1vDkNf1Mu5Odu0KqhFKOX3e3x1BHhqCkSj/o5f934ASFWBtOj
         d0hbOckP3wfyV/Y2DE1odV2bGFoJImDnMrtejRWbVtpP64lKeydlHXeIVEEmq2gmZft6
         3YmzIR8YRsIXs077+czYFgY0PBzzt6W8GJYh+Psc9VQr31wz3CPlIBgf08BpIMugUKza
         cLN6RIHLr/Mf7e3knQdXJQST5d/CTYrIs5yN28zR3w/8l5XYyBoNdzf2dZnU/hYQSlF4
         lgnDVN34fTY/2ff6td2rBGWIy5bfMuYhlPeNwsFium/okGRhLiH+66LuT6Gc0uYg0DnK
         QwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        fh=mic/46VxFYv79mhDrvHzbr2Zxder271ULpmxxF/fNVM=;
        b=OT55Ei1hwzJRmvTxbCUbEuS3bjchu/CaSoevxjXjIFrYI4gian9XT/YjJBpN2tGnPe
         eazdMecGg8w2ze2L+wN/YPA3by1HRcAgz7CRHBVI9uwzZS/5NOpag+GGhU92CM3DfLRr
         tI4sWY2sgxJX380k9KjR7fokdZrXoxY5bJmbjxugqXXcJ+mfFui2QovEXL3mgPynSEUv
         A0NdQaCCJx5DKfWbGzeoUe2tBQHYmv6ZKnrHg3d2Waher4fNp2QJtgQsiNHMVwaWe5Yh
         DkIqtEBQnV+bvfSVHMwWGYF7W+20HQ4oeZDLIu4i4SXrTXt1eE2bBsjR8frEdWyIxcof
         K0vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1784037340; x=1784642140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        b=TCmdS9sevxdoqTKpg8ATyOlUKcq9w58q0fpna2eIgHbAOZwZ4EWWZ5cAYfBAV+Li7u
         nU/eQSDeXuQ+c8kMFUzTcjDsko3jug66QsTfO/P7I4pT0q2Rqcew6iBW+O8oGZnMAiXd
         5xNWr5Pegx7uC6sqxofH6VaJKMrYbS2BV1o3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037340; x=1784642140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        b=NHdZ77Vs1Yro5vabfDKwdPKP4Nbnd8BVm2Anty5+dg5483QINgehXHAv+y5or/9nCt
         cP+dQ8wE9uYk3mSKZQtd9KKIngxljLcrjDc3KDu7F/Trkuv/iHSWpPzyfRv1GnO/o9o+
         s7fkkU//docpBKZgNo6vTiXWV7YTCV6F2H5i9cdY7y8bUKNu8HhDLcvjdeWMDAMCWYUt
         LUuUmO1GQgSEAx4gKnpI3fzee8wnEpd9CypHtIbNleh2KSrrYKbHKze++O0hALZk5YTN
         0Z/7Ze1xeRP1KxxN5UCGi7iOgh9uV4IlZsm4/vWzEc0R14hwKBCaCjLWH0Cs/QsNt5ns
         rLAg==
X-Forwarded-Encrypted: i=1; AHgh+RonRQjlHHyNimZgQJTto46uuR4BAFwydv1RmxdV9wgblUYOPAl9qzX2rYHF6SY1TM6WCvRl6vakQKZm@vger.kernel.org
X-Gm-Message-State: AOJu0YxS6+utfTtvsqg9o/E1OiPBrA4RhzYDiXQrF2/rAESblz7z+20B
	Xo4k2S8L7S8BQ7Y91hgCnFgHXBGfB/oortH4+o+/ksN6B8zLxlxBuK/DLGRD0ejBhJw93oBNI2D
	micny2RJTvK0gEz5TXgZtsRLADbm9HpUUSbv39ir6lw==
X-Gm-Gg: AfdE7cmucP7xLZKClGs4Wu7Sc894W41IfwTqRiOMObvHOm4tzKvTHJ7agh9Sk1xMbb7
	TJ7UgXRgi23ObUJpGVxDJs5STMFTn6b3SL14h1s8er1tj35jPvvqXwE5747gBtyLWVA35JsHUaO
	G9dw6jaHzc6JdGFQ6BunGL6KYedHniNVWhu2TjxE9IrLwiBMMqWJCyemPwGFxqIK+iXUer/y/xo
	fco6SjaOW5zAq2Cei/6NBZOCJC1ujZfi1jdlanHO9f/C8BDUQXB1ejC/G//AZhwyh0O5BK0qDVJ
	HXqkay+Ckh6eGtMjhqF+jzAI9UNOUpE=
X-Received: by 2002:a05:6a20:450f:b0:3c0:9c19:65a8 with SMTP id
 adf61e73a8af0-3c110a30fb2mr14802853637.64.1784037340342; Tue, 14 Jul 2026
 06:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com> <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 14 Jul 2026 22:55:28 +0900
X-Gm-Features: AUfX_my4HWQr0GTS92czUivB5kzuMCNXDtWp5XUMf9HPpLFf89A5CuHvz5fm-hQ
Message-ID: <CAFr9PX=UE0OtdR+XSZShPXUp9BSL=NN6tr_CSoyNPSxzdLa3nQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[thingy.jp:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linusw@kernel.org,m:brgl@kernel.org,m:rjui@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:florian.fainelli@broadcom.com,m:sbranden@broadcom.com,m:Eugeniy.Paltsev@synopsys.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:kaloz@openwrt.org,m:conor.dooley@microchip.com,m:daire.mcnamara@microchip.com,m:romain.perier@gmail.com,m:robert.jarzmik@free.fr,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:romainperier@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[daniel@thingy.jp,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-40058-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	DMARC_NA(0.00)[thingy.jp];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[thingy.jp:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@thingy.jp,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,synopsys.com,nxp.com,pengutronix.de,gmail.com,openwrt.org,microchip.com,free.fr,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07A3375564C

Hi Uwe,

On Tue, 14 Jul 2026 at 16:25, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> A driver module matching devices using an of device id table is supposed
> to declare that in the module's metadata. Add this information for
> several drivers that failed to declare these.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
>  drivers/gpio/gpio-msc313.c      | 1 +

For this one:

Acked-by: Daniel Palmer <daniel@thingy.jp>

