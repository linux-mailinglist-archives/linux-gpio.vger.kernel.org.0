Return-Path: <linux-gpio+bounces-39852-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GRpLJjBJUWqRBwMAu9opvQ
	(envelope-from <linux-gpio+bounces-39852-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:34:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDE973DD1C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:34:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jitjKWcF;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39852-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39852-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 908463010C21
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 19:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274E43624D7;
	Fri, 10 Jul 2026 19:33:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEDE2773CA
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 19:33:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712018; cv=none; b=LtACiemDl5XsI+uz8Bk7IVEumj4Ui2KH9Ck9i1uez9hH3Usf9Fz/HW4mjGEjqhWRdFialP9pRimYAK6zwgSBvhfMFb61RjVatX/WjeedaUdY+jMekriAOqdkl/+srQiovm1TZPFNKbg96dwCd4P+1WtkxXq5nup/Kt+Bmixws7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712018; c=relaxed/simple;
	bh=U8D5VnDmfSpuoyirDpp2H5OcwmcsEM29TotuGie51ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPSzJz0s6y9JZy1FG2j2IjGb7H392X0nJkVmaQ1W3QMl27lYOcwyIgb1lUHdkfmT6q4dZgJDJStNNMv4rxH+aMK+CxpSTkIDJG5Y8EoDUzfBwjlJTdMrF1e2o768pMvBsVR3Rdj3saL6oIb5ovBh4JJyRtWOuqN81k+MNcf0NC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jitjKWcF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6F41F00A3E
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 19:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712017;
	bh=U8D5VnDmfSpuoyirDpp2H5OcwmcsEM29TotuGie51ao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jitjKWcFi/ozvCgepfY+nsCuDELa8yTBzD4JeLx+wTXUiFfVUsXWf7GzF0zXsgNte
	 gW86IEyHj0752IOMqFkwV1KIhy3jHS+GO9C1DcyspyyyXeNtfQdWCG57tC6aHP+iQG
	 TeA4BsNGiBF1Kc46kdIOsg3T8TMdsUoEb3H9h7C+ajnxchuFhyp5i4o/tchqGesCaP
	 UXtlsCkyvBXLCHo6YYHHZoChtbEOdntco8mIDyBOKbj/Ct62ycg5jqaAIJA8Ir23Sk
	 5jEEHwAIDhFgGtQl/7vEdvfMJlxRafrxE+asEzWYv/fCN66g03bLq5rBBLCSzkAp5p
	 M7ZNiVIvY1Q6w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so3209223e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 12:33:37 -0700 (PDT)
X-Gm-Message-State: AOJu0YxE4776LQHzKdnj9a6DyF0uEIaC5ryXT0uhRGk4FHGYqJjcjXUM
	/jBD6CZ4Dl0d+xtAHwaggpbwvZ2kHe640oQ9cQiw3Ks8gnPljgBE3IQqD9J4uhW6w26AJqbCxDR
	vORyGuyEVgG/kV42waKk8Y/tOuIeQu24=
X-Received: by 2002:a05:6512:31d3:b0:5ae:b844:3618 with SMTP id
 2adb3069b0e04-5b01c3f70c1mr1283197e87.13.1783712016438; Fri, 10 Jul 2026
 12:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706232223.774895-1-rosenp@gmail.com>
In-Reply-To: <20260706232223.774895-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:33:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLkom+_yGponUeSrZ38hFB2X-HY6=jER3Dp0_cuh-HntHw@mail.gmail.com>
X-Gm-Features: AUfX_mzdzVaT9yDnZ-DPd--2uFjdrGC78TWYetqRn77o7DjYD-Y5BrDdFKhKfgM
Message-ID: <CAD++jLkom+_yGponUeSrZ38hFB2X-HY6=jER3Dp0_cuh-HntHw@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: fix devres LIFO ordering between GPIO chip
 and IRQ domain
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39852-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:u.kleine-koenig@pengutronix.de,m:andy.shevchenko@gmail.com,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CDE973DD1C

On Tue, Jul 7, 2026 at 1:22=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:

> During driver removal, devres cleans up in LIFO order. The IRQ domain
> was created and its devm cleanup action registered after
> devm_gpiochip_add_data(), so the domain was destroyed before the GPIO
> chip was deregistered. If gpiod_to_irq() is called on a pin during
> this window, mvebu_gpio_to_irq() passes the freed mvchip->domain to
> irq_create_mapping().
>
> Fix by moving the IRQ domain creation, devm cleanup action registration,
> generic chip allocation, and chip type setup before
> devm_gpiochip_add_data(). This ensures the GPIO chip is torn down
> first (preventing new IRQ mappings), then the IRQ domain is removed,
> and finally mvchip is freed.
>
> Fixes: 644ee70267a9 ("gpio: mvebu: fix irq domain leak")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Nice work on this driver!

Despite it's a pre-existing issue, if you have time (and already
have the hardware set up and all) can you look into converting this
driver to IRQCHIP_IMMUTABLE?

Yours,
Linus Walleij

