Return-Path: <linux-gpio+bounces-39282-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AZMnJyXORGqq1AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39282-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:21:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA44E6EB0A0
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:21:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Qw2aAMsQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39282-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39282-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2D803009510
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 08:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D173D9DDE;
	Wed,  1 Jul 2026 08:17:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2583E364927
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 08:17:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893861; cv=none; b=hK6eGnZyKHgeR/OVLDz8NkOC8bEbyB35fTIq4NiNPCKEyvUKJ5x55C4uzF8u1IsEzA3ngM7TYkTNQQi4UDziYpTccz21onNo8gT91+k75Nn+Or3hxW2Ry530Ra76tfIr5v4E/Mr1ExvGawi9QGFeLnk69JfhT3hPdUSvnrRMrkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893861; c=relaxed/simple;
	bh=7ZzAF3yeVyhvS1C8NOqosE3dLLNvqUJdcQifyae1v4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IE2w2bDtuOLlUaHvUXLsiQu64XWJRE2R8v2sWUR6bcjljj7ddPlWDoMM2S6XvTaswgJqhd83bb99covtIhlFaP4eJ3WNJxbmZhWuvKyRRdNoF0uKsnLo9srPpCC0/WkdkCDFQKiCFaWK2weX5mV27xEuL+fmanVO31ohiv7yBnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw2aAMsQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85251F00AC4
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893859;
	bh=7ZzAF3yeVyhvS1C8NOqosE3dLLNvqUJdcQifyae1v4o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qw2aAMsQo1zbo7CWVV8LG5hkkCeONghjAjG5/A47Z3GCjfdBEXVM3XCLQmvPJ2XZs
	 bnQm2OrvIkG8DGShSUa+q6EqCdSxMzHJx8b0XuxxwwwZ9oOPX9ELUcfMz9Zo/Jvsvg
	 lUVaPLVk2Lxgmnp/W5T/RVlx4Nj7mO5DdzJJgGh6zYosqwGaEaGOq6jGZEkcEu71e8
	 isb3fp1hPye1ExpVtJDwhAnGgL5dGmOQsq8cIDNrDW6EXiH65JSo9zprN2iA2zl/d0
	 Z5NANaB5LFSeOvxUiQv1SrqHvbdCiheX3qpdQOr7+M7Hd4I5r/1RjJ7WFZkrbUzxcC
	 pFdGjmwLXuMiw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebd52488cso371218e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 01:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq81rBSb83eB893SzOzc2tf47hL7jDizL3/EH1yWWcMmB75sSwiMM8O+QuGGRssKy+oM3RB7Sd9wHgk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4MdsFgo4brncn/cOG6ciNUHpQGKjEk7XpsbNb6XF5YYnp+rz7
	Hpd2EK57RIMA381uYrEQcPqgpUcjg103fKdVyZZbc7eqaO8+I7BrOOna3LRXzFVoMclKxOZUKku
	P1Hx+eXjaplUEL/3qcP0EKZz4faO7r5Q=
X-Received: by 2002:a05:6512:138e:b0:5ae:bcf6:b07c with SMTP id
 2adb3069b0e04-5aec6795a7fmr143250e87.4.1782893858641; Wed, 01 Jul 2026
 01:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
In-Reply-To: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 10:17:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLnGTQQ5wHeWjxju245P__eMjL+yXeu69JRcWS1K6Yc2ZQ@mail.gmail.com>
X-Gm-Features: AVVi8CcRnR8C05DDeiFKIRK6VYenfHJh4p5GtavyLsyqgQL7_wooc_56sUvYIFQ
Message-ID: <CAD++jLnGTQQ5wHeWjxju245P__eMjL+yXeu69JRcWS1K6Yc2ZQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: swnode: remove deprecated lookup mechanism
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39282-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:andy@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA44E6EB0A0

On Mon, Jun 29, 2026 at 12:55=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> GPIO software node lookup should rely exclusively on matching the
> addresses of the referenced firmware nodes. Commit e5d527be7e69 ("gpio:
> swnode: don't use the swnode's name as the key for GPIO lookup") tried to
> enforce this but had to be reverted: it broke existing users who abused
> the software node mechanism by creating "dummy" software nodes named
> after the device they want to get GPIOs from, without ever attaching them
> to the actual GPIO devices. Those users relied on GPIOLIB matching the
> label of the GPIO controller against the name of the software node rather
> than on a real firmware node link.
>
> All such users have now been coverted to using attached software nodes
> via the fwnode address lookup path and the kernel documentation has been
> updated to recommend it as the correct approach. This allows us to remove
> the old behavior.
>
> This will allow us to leverage the upcoming support for fw_devlink for
> software nodes in GPIO core.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Nice, I like it.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

