Return-Path: <linux-gpio+bounces-36517-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJBKNROkAWqrhAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36517-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 11:40:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 472AA50B187
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 11:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D73130D744C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837B33B3BF0;
	Mon, 11 May 2026 09:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5sz5zpa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D74377567
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 09:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490804; cv=none; b=U29Y8uW4MKBlaYThjWGqpOBuCSFU9u5BzCJcN8o1XNYR5hTzOiGjiUMyYcMUzG2mVD+Sw+CE/USfbEbmR3+2/3AaN2hCzIsrHHfLwvvaRWUhUSjdCHlUcUqs7vm1irPdQz1/j8QYq1tanQASHGS2+TYx3MokuSwapK7XH/pDHqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490804; c=relaxed/simple;
	bh=jy1WutX0l8GQ1Imk+zPm6jnH6VQ9bJe2panX+jg6A6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRohdj5P0XTDA1PQXmOvsI8PGjybPaOq+fhuOJKKO5EVutoQiLgapBHiJEeMJkEcyiVFPtUL3Z+DUC+EBVhXMP/2PsLAN8ZrKvMgduZS7DTvz9BgwkMxn1v9gQPmLLhoMGxFVCJlgrQFhTGPHsPoF4k4URr0/HIBq83lLQ2OPnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5sz5zpa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E057AC2BCFA
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 09:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778490803;
	bh=jy1WutX0l8GQ1Imk+zPm6jnH6VQ9bJe2panX+jg6A6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m5sz5zpa1Izz3aRQxuYZ+0IaQoqDNNUj0sfA0Zp4YEwuDqZcg5lmI/MwbKbvTrPaq
	 jLIspuN98MK03gqvI0bLhZOk9eYOCaEDvP9w/u7myoWvebYhfeNlBDJomwuBWIUhc9
	 Iw+bIpsP+210Y9WkPbmpy/Z8hr7l9MFF+IDUL603M/zFbH3JMq9GH1Oi6VNY55GsTF
	 L+FfvZXOgjxIwpsVD32tW88arDcfiqsGS+n5NOklDZzHvidLdYVt2W42H2LA4cJvLW
	 28sMP4M2QntqmCoMtEqGoPVZKblOoDl5CV2/2xmDoCufbjKE2f8b698EEc4uIK8iiU
	 cIu8CvU4WdWsw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a525aedb24so4004257e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 02:13:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8C82kcntzo7LXOB/wtR8YMQEwlJey+RNoOedipuAJ59SuS0GOG3HWXElyVMGmnWaLmdkCqtH37pMPR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/JehYUjUrViX2cYs85m1zdqD0QWHqf/1BnFykRSpScKw6QE8M
	/wtlNniE9PLnKaFp3HnUUDrYV+M190w1Mf5yGS0NXNq9adeVhA9fDQW9m4MKSBxwkwLCywDpWlA
	QN5MgHRnWHjMmKvmcGzQezwqyv7C272M=
X-Received: by 2002:a05:6512:2341:b0:5a7:4822:368c with SMTP id
 2adb3069b0e04-5a887ce4236mr7014824e87.22.1778490802523; Mon, 11 May 2026
 02:13:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508214324.1040460-1-jm@ti.com>
In-Reply-To: <20260508214324.1040460-1-jm@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 11:13:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLmS2ObzMQ+h2A825dcv5nwfrTi9ozcFbBUNiw_qq=W+eA@mail.gmail.com>
X-Gm-Features: AVHnY4KeGC08lGGPUTYpwa4GsKuKqYS3MlCYCwPi4qQ6W3bPb7IRRHBuU4miQU0
Message-ID: <CAD++jLmS2ObzMQ+h2A825dcv5nwfrTi9ozcFbBUNiw_qq=W+eA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Initialize mcp->dev and mcp->addr
 before regmap init
To: Judith Mendez <jm@ti.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 472AA50B187
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36517-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email]
X-Rspamd-Action: no action

Hi Judith,

thanks for your patch!

On Fri, May 8, 2026 at 11:43=E2=80=AFPM Judith Mendez <jm@ti.com> wrote:

> Regmap initialization triggers regcache_maple_populate() which attempts
> SPI read to populate cache. SPI read requires mcp->dev and mcp->addr to
> be set, without them, NULL pointer dereference occurs during probe.
>
> Move initialization before mcp23s08_spi_regmap_init() call.
>
> Cc: stable@vger.kernel.org
> Fixes: f9f4fda15e72 ("pinctrl: mcp23s08: init reg_defaults from HW at pro=
be and switch cache type")
> Signed-off-by: Judith Mendez <jm@ti.com>
(...)
> +               data->mcp[addr]->dev =3D dev;
> +               data->mcp[addr]->addr =3D 0x40 | (addr << 1);

What does this 0x40 mean here? Can you use a #define to specify
exactly what is going on?

Yours,
Linus Walleij

