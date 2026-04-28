Return-Path: <linux-gpio+bounces-35677-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNYtDs2K8GloUgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35677-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:24:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDD6482884
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAF7C323D751
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F9F3DA7DB;
	Tue, 28 Apr 2026 09:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQtxjLVg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F2938F62F
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369856; cv=none; b=unLyjjLv6BAIlfAG4J/M8oDPS4qOUI4OdPU7xguAbouHl6LKNed1aY2CWfGfkghAyvoA0TtHPIqYDz3WIsrLniNDUZqhDhtyh2ctpIO8NniX9skYLAjVz2Gbp4fhhMeJcQ7EGxBq3q//x+EkTYRhUKv9MrG8mFcDCmYTdq49Zv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369856; c=relaxed/simple;
	bh=BC5O937iyiNhZiumC7m5YAaGDlwXTXa+qfnkEp1/d6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VApwUgR/YbnjN5zIOJxalIiUUbzORSyT8vCU0Y+OrtNcNQEc+7PAxv6P09FWoPe+wnVnj0jFAw/SBJ1BguJTB2qI8XU84V1WjIgmCYCfT0xMbYGtT8LOx2n3a1GkpS3wjBwfCQEnywy4EVhdAQozslzVDMxinoPi/sliPnyrAwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQtxjLVg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4E9C4AF09
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777369856;
	bh=BC5O937iyiNhZiumC7m5YAaGDlwXTXa+qfnkEp1/d6s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UQtxjLVg1H6w9ZPEXKijvwyGG6ju7AzehKsOQ6wPd0LdvjGrdaDkvh7muB/WuNrEj
	 Owd3ylY8hw7DjW84ipQ0VtocZQFcnsWfSG71KBSzqjaX78OHTdxQTS9c/FVIlBTmlR
	 yS1oagKHMkXQ62yIeEAEwgEyleo8hWIH5WVlPI0UwjC29YUoNcl3BSg3rJ366m/te3
	 3aGRWkc6UWICb2ZoUwPMq2yFFFzTpGO5Go5kJf8PKMydfWnnRadIEq3MSN8JxzKU+g
	 civbJHg8g6sdcuauwVXRPo3/efh/DcesNQJWT4nNJPPHSKqyE8PDImYcV6+ujdhYBb
	 1U8k2rq3Pju7A==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e800deae4so96988271fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:50:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9obw5fAdFRgVQJBLsbK4a1B68PF89EP9Lbl+6ZQpw49vefFQtV0ljSWBH51TnMsNlBUHElmnuJctNw@vger.kernel.org
X-Gm-Message-State: AOJu0YxV1TplDUPitSra3tlVD+X4gJXa5TOpu9vnfnIH/vpeGbnQGvkh
	ZiqiAGUik8R60PQOSeGa+xFFF8kl+DtkktbFx7JggmuFsMaez24/9FNgLm+DYwg5XRlhtLOxRZz
	AfichoZTOd0rd5oPwNnLie2rMRyF06f8=
X-Received: by 2002:a2e:bd12:0:b0:38e:d78c:b16d with SMTP id
 38308e7fff4ca-392411ffeb9mr8148211fa.29.1777369854861; Tue, 28 Apr 2026
 02:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422-fix-pinconf-v1-1-abb4d2e0da55@amlogic.com>
In-Reply-To: <20260422-fix-pinconf-v1-1-abb4d2e0da55@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:50:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKjhw7xhSwg-b0DNm+SF000wCFKVWsmt_5bN=CCpfP1w@mail.gmail.com>
X-Gm-Features: AVHnY4KHYfTu3c9NjEh7-gGu4G_oPSv4ZkBHrghlIhCkbK9VzyhYmoslSQdRSM4
Message-ID: <CAD++jLnKjhw7xhSwg-b0DNm+SF000wCFKVWsmt_5bN=CCpfP1w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix deadlock issue
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8BDD6482884
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-35677-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 22, 2026 at 1:44=E2=80=AFPM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Accessing the pinconf-pins sysfs node may deadlock.
>
> pinconf_pins_show() holds pctldev->mutex, and the platform driver
> calls pinctrl_find_gpio_range_from_pin(), which tries to acquire
> the same mutex again, leading to a deadlock.
>
> Use pinctrl_find_gpio_range_from_pin_nolock() to fix this issue.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied for fixes!

Yours,
Linus Walleij

