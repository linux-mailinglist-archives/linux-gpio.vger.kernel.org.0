Return-Path: <linux-gpio+bounces-31742-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMW+DO5KlGm/CAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31742-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:03:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE66914B200
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04A7A300A30D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 11:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CAB32F759;
	Tue, 17 Feb 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kS2/fK/F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55BC32FA3C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771326186; cv=none; b=PQtBh4rUAPSJ0mv7hdphnuYD2cyeDmLNmuSNQrRa5lry8Bvaj4xpxic8SbNk9Ph38lFxhoQW0P8bxZSHH4FvvVJE9WAk44tyE3CygM3+PLBScCRw3O7hiLQV8QYTuaMF++ww+hy7NUvIZxKCKzIGED5Xked8+j96NdR0iOmZuB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771326186; c=relaxed/simple;
	bh=31wGoQCrJHiHHoy6Arff+pnfQmk9AyFwMKxIIalQup0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEaNCsw8SXsjT3I4TEgWso4dxL9ezWcCRP6m2YZO2BU00HYU4b+FtK1MrcxhfiFsn6PYESv+NBj5J/Zl/SG/KMqSqWgcvoQcLOLgUDKqQNurCO2809bSER43hI2gNt12QErn3cW58alN2jTWh3+CZUX38ydzDpZ0xLOPXh7U8SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kS2/fK/F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAD2C19423
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771326186;
	bh=31wGoQCrJHiHHoy6Arff+pnfQmk9AyFwMKxIIalQup0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=kS2/fK/F3NXnxlB/UQJy1PmXbWyHasTYR8JPJlTKlfDXlckXkzWlJa0FVxiAPcDdJ
	 kabh7Yksq6+AbmiyfaOfBFHCRPQKO1Gf3175jJkcJyRo7V+BldsA9b1qd657Ee3GJR
	 xxooqa95En5DIDcfD79U7QGYwxTLZvL2BA5jpJmw2bHewfHZN1+scuFhjwzb6+Bs4T
	 F4sr7GZDDKVf38SRDmM4Z4kiPxzNkY+OuPZv7jH1TPHLSJvqs97WkoV+KjdiJGu6WY
	 nCASxOHxMk+0ownDSswvYJYawrffEGcu7YKYII0iwfR9GarusG1eOncEuYKOXDE+Q3
	 h1ytUERqLEq2A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e6c181402so5147617e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 03:03:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOLvRB4bWVFwl3vJL/lkhdVxEIQy7V3IaO7s6P+jMLrWWnhYq8D8vaxV/u/oSwadaxD6NJi5kEuPcn@vger.kernel.org
X-Gm-Message-State: AOJu0YzQa65MGYfVuyC9ZmaRCCA06VuvlQ2YQNoiY8Ncd43Z39e+gsfN
	BgMPAfxnHz7QZm46rXyPyXW6nn36LXoBxuFrASAYCX1PnP4ltbzevvPgVNrJLbrqX/Q8Toh92w/
	fPDULDxitOldCkuVmTw/3ts5m8yUAqquM3aR/Y1qxqQ==
X-Received: by 2002:a05:6512:1050:b0:59e:4786:2823 with SMTP id
 2adb3069b0e04-59f69c3d26amr4503376e87.23.1771326184953; Tue, 17 Feb 2026
 03:03:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 03:03:03 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 03:03:03 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260216160946.2977985-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216160946.2977985-1-wens@kernel.org>
Date: Tue, 17 Feb 2026 03:03:03 -0800
X-Gmail-Original-Message-ID: <CAMRc=MckMbg6W4d7x5OKvTEq-Gawqh1mzY+fvddhxjDv7Si0pQ@mail.gmail.com>
X-Gm-Features: AaiRm50etZVT4Nx2EmA6QKebjX2RBcYIpgTucEC8eTHgaygABndvmN-wh6OFaXg
Message-ID: <CAMRc=MckMbg6W4d7x5OKvTEq-Gawqh1mzY+fvddhxjDv7Si0pQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	James Hilliard <james.hilliard1@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31742-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,sholland.org,gmail.com,arm.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c09:e001:a7::12fc:5321:from];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE66914B200
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 17:09:45 +0100, Chen-Yu Tsai <wens@kernel.org> said:
> After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()"), a warning will be printed if the
> gpio driver does not implement this callback.
>
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

