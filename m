Return-Path: <linux-gpio+bounces-38132-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DTGwEyRGJ2rpuAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38132-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:45:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF1465B0E6
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:45:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a7Xlsmbg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38132-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38132-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 260C0302B74F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 22:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A1B3B52FF;
	Mon,  8 Jun 2026 22:45:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2723B42D0
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:45:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780958717; cv=none; b=SHhavrjBe1O4iN3VnM6K08+m6KJTK+Y0Y8o2jbXgFuV7VlOdDFFUgOkrqn7LjZQJ2wTby3N+KPAztRk9JD8Ro0JaPApGfQLSrbyWFg3gJmE7PsELeNOrx/rIv2GDNKHLNqOnVaUiXKrNPIKKvuj18DvK8aUkmyr7oXJUUWtgEVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780958717; c=relaxed/simple;
	bh=7ovR92x8Z/N/u3SFG32f5HpKTxDqeJiLi9zXPvC0kQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ub7ufDk3MYsWaoG0jp/gkZ5CzC1fUNx3nlkrdLSFf8bdUlau0TmoNDEOUjgb9R17ZfH3+9LdvALLuE860aTdl+4bkdTyJxPPmMBekYKgEchiuVEgn0AZyfuQS4CPRYZKsfNrY7rjD2ljR8SW4jb6+kPaVW4gWE50bYd0ugliYmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7Xlsmbg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61351F00898
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958714;
	bh=7ovR92x8Z/N/u3SFG32f5HpKTxDqeJiLi9zXPvC0kQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a7Xlsmbgu4/3/LK06mzCdWtQcCpzmSJNgUihCh9+PCHXwM+gy63hjqgiIfEjkMSBB
	 Yu6L23L28BzyENB4OtAJqnAw8AdSkG2bYnd8UH0R68KGGBF7jfGFG5FJqIklGNsH7n
	 eaC6MuVt1jezbLQgtNoVmo+AwQLtx+/h4WOn/SOFb82teqVP8zraDEuyuH5Dvx+FQx
	 yzg60UXqT9exhiOigd9weocZ3lphry7HyPIFEuOmwj5xjharM91cYQs95h454949OR
	 mI7DYUYASmKYjCUp+5jEeCLJFHCtrSFjKIgGIdc5PMJDfLpUCu1C3tlXPvBezjC5xi
	 ChP3qb6zXUfZA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa624ff3cbso4846418e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 15:45:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8E9qf6wVeVUrU8VLwcUmigzYrY01FxIrEmSWhvkmTcB+AaH4exJn35B9Ggnzp1qZwSn3/vHqykZZ1l@vger.kernel.org
X-Gm-Message-State: AOJu0YyPcb/dfDWR0dgPwMP+tZpK7ZNyuro+roubYWTAu7UnXiQ/N2Ta
	Id9fKzK0Cz2HHtTE1iJejCS/xE6EY0NiJpU7sr1Iq4B3bl+b9b17zLo64gxQC9fZ1K5qTgaAzk6
	DsBV2eXXU2rXA++RucBnnpUHBm4m86x4=
X-Received: by 2002:ac2:4e10:0:b0:5aa:6cfc:771e with SMTP id
 2adb3069b0e04-5aa87b8dcb5mr5032062e87.2.1780958713709; Mon, 08 Jun 2026
 15:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-b4-serial-max310x-gpio-get-direction-v1-1-23bf84e8ee14@vaisala.com>
In-Reply-To: <20260602-b4-serial-max310x-gpio-get-direction-v1-1-23bf84e8ee14@vaisala.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:45:01 +0200
X-Gmail-Original-Message-ID: <CAD++jL=2a6UxD95r2wMMtaXsrQXVxRHWqw=jJKLsZRxMivObmQ@mail.gmail.com>
X-Gm-Features: AVVi8CdYZC_LNrT4lj-okPc6TIwG-u_u2wJAN03mvE0tz4MJaSgzc0ZXmRT8C0k
Message-ID: <CAD++jL=2a6UxD95r2wMMtaXsrQXVxRHWqw=jJKLsZRxMivObmQ@mail.gmail.com>
Subject: Re: [PATCH] serial: max310x: implement gpio_chip::get_direction()
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,mail.ru,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38132-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tapio.reijonen@vaisala.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:brgl@kernel.org,m:shc_work@mail.ru,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFF1465B0E6

On Tue, Jun 2, 2026 at 12:02=E2=80=AFPM Tapio Reijonen
<tapio.reijonen@vaisala.com> wrote:

> It's strongly recommended for GPIO drivers to always implement the
> .get_direction() callback - even when the direction is tracked in
> software. The GPIO core emits a warning when the callback is missing
> and a user reads the direction of a line, e.g. via
> /sys/kernel/debug/gpio.
>
> The MAX310X keeps the GPIO direction in the GPIOCFG register (a set bit
> selects output), which the existing direction_input/output callbacks
> already program, so the current direction can be read back directly.
>
> Fixes: f65444187a66 ("serial: New serial driver MAX310X")
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

