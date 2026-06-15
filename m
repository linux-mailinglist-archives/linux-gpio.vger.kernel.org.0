Return-Path: <linux-gpio+bounces-38491-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sNfCOQ71L2rtJwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38491-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:50:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4105268665D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:50:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kxwcLyeH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38491-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38491-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6E5330E0D4B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2372F3F23CC;
	Mon, 15 Jun 2026 12:35:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6923F2117
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:35:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526934; cv=none; b=GCbX7ZS4yb9h06hp7Hsva2IvMgUwOvU0nPeNpG0JWn9Gmtl3uc+OplfD2x1YYNXJ8YEcErO/grMb0EG3f3V+zp8Bm6Amo6CY+sRkkg8cMmR1okVC+G7dkqhpSSo8AcczJGGlu7yeb1XJ5z/fmoyvnkHWTq7bu1s+XkOvX+BgFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526934; c=relaxed/simple;
	bh=y9Q8F35MhKZIisfuG0LCXKbKa5u6NU6/SFtzuvh2/9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajxQGjmXg4ku8TR5G+e0/wjiJwtTo90RjmIBhGUjbLqDbnwqxp59zCItB5u5a6Fj6k3qKrhEZJf5OjqjVeVfhP2kzU+oU0N6FTrO2+IJgq/ys8GXJ65+otoS2TTiGRThUkjxh4jboLBmfBMIsdIAyf1AqMcoOm3b64JjdqV3Ahw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxwcLyeH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804141F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781526928;
	bh=eg/S3vCdvXX7wfre3KW4NN5v+IYs2iJdroqwZBfTznY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kxwcLyeHn7weGIOBXd7KLJsKWqz2Nqs/org9nBUFgwy0dYLILZEQ1NDoXr20tdFt6
	 zvgM6+/ScqboCTPpExjUulfQYmH7c8+KCWfHCQX9Dxfo6Vc5/CcM1oEf9A/O9PHLkR
	 5/OM23lS1o50AbJYjk5jKohYG0zlMh9M9k6sQquRZt28N8UmN7TtuWpAZyZ0UeLUnt
	 f0KM3xJ07C6SfMboyKw0O8q846+MonMnO+w+0HV/+xbcW0p6E+PqMuaDbb647Z1/AU
	 2WI+cwBR2ni6CBZ1WoOA8kmaYIyTM6rU99jrpBXw6yZN9sIa2MNE+k+Dc3hT/jJBPT
	 UUu54zJVjDcpA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso2963656e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:35:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/bT/o6DksK4SPJ66O/7n+1FlVUm0DHhz7R5d3ftqGev5rC/kkcv1n92itoS9NAiwwEkd0nAiDj46+d@vger.kernel.org
X-Gm-Message-State: AOJu0YyMYUj5AdUwH7Hh2VRF+9EVK1WlDnOQwzVY5I0JoE3lxV6J4IZU
	EMvYpS7wDayR7jz2r2cwWioGMEUqPa0631xj14pxOXLNvfevY1OwVDR6IkmOENdeAvmADyI9zGL
	9bwBElZzesDqKofj/7zSzDn4aKYJNsIU=
X-Received: by 2002:a05:6512:3d0b:b0:5aa:8824:156e with SMTP id
 2adb3069b0e04-5ad2db895a9mr4085163e87.46.1781526927347; Mon, 15 Jun 2026
 05:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615092120.54741-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260615092120.54741-1-pengpeng@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:35:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLk8-E=43ZxBW6NgVAqMyCWtCFPpZ_ZqLwe-+ayUPyNMpw@mail.gmail.com>
X-Gm-Features: AVVi8Cd9RN2MLMxtgY1Z-f9B8cnJyQPRf-dQahmcrn4hxIu9T326Um7JVXkGYKQ
Message-ID: <CAD++jLk8-E=43ZxBW6NgVAqMyCWtCFPpZ_ZqLwe-+ayUPyNMpw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: fail probe if gpiochip registration fails
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38491-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,iscas.ac.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4105268665D

On Mon, Jun 15, 2026 at 11:21=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn=
> wrote:

> The MVEBU GPIO probe path ignores the return value from
> devm_gpiochip_add_data(). If gpiochip registration fails, probe still
> continues into optional PWM and IRQ-domain setup as if the GPIO provider
> had been registered successfully.
>
> Propagate the gpiochip registration error and stop probing in that case.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
(...)
> -       devm_gpiochip_add_data(&pdev->dev, &mvchip->chip, mvchip);
> +       err =3D devm_gpiochip_add_data(&pdev->dev, &mvchip->chip, mvchip)=
;
> +       if (err)
> +               return err;

Can't you use dev_err_probe() here like in the other patch
you sent?

Yours,
Linus Walleij

