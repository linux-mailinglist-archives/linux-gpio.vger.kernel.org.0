Return-Path: <linux-gpio+bounces-37764-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJCwGk6IHWrAbQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37764-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 15:25:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E084161FFFE
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 15:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22C36301134B
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 13:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB0D371D08;
	Mon,  1 Jun 2026 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ku24NU0f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADF937C900
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320330; cv=none; b=EuCvBtaoxtJW45yj/ixW2EH/qDX84Y2d+hywxDzMSXdPnQxF6+PxAMgvyz2rRzIBvJFFUgkdElPL9GmGbPXDI17KNlNSHDCzq6wT1dtK2lDootIxebldU10zpj6jhm1oV9i/3k7se8SvhTuZxCoydUkm7qlSEG+NvgOzlxNsYHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320330; c=relaxed/simple;
	bh=g+ARJzeYGVysWNGwW96zLCTOS3FmIbBfY2CiC1rxcFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/w7wfevFcZCa5xwsfdsKi6labE8wXcS192I7CdIwvSXnZ/aWC1GBjc2mjHozWztFHkha0wzgy/LHPzUsUOTYfrp2CeIRUx8LNqCjSCX//rdaqNYuJd1uTBCAGZxLE6/cTG8VWNhPnzX0wXqu8dUdZoQYYbTKf+eRY//ns7vyB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ku24NU0f; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735BB1F00899
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780320329;
	bh=rtByFQInNkzl/RZxexPMe7rG7ew4dafJT90EhJESnrc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ku24NU0fnq1uGBJMb+6q63gLX+bAe13Mp+G6A5hGYpxlR0gzDbXA6c8lWhjXKhXWF
	 R5CrJcwyWZiVZDY/v7XDCtmUwbG3LBY23Le9MbnW9y0S8Eg5NWzKGBCM0KAO+Y4Grb
	 PCOIeSVVcoNrxfEBZdtaP/hC9HQR69aITsyWX6FP4kDrKi2lP1JDzlHXBozG7UyLVV
	 qSoPeFiOv9VsWs0ibNlyzmE9rj+TSRYhgSTZ9O2nm1yM6VB5T7/0/TWMaHIL7TrVQc
	 PmWlJ1tPbkcNvalUTPWKyHakF32H5HZ5zVby9zD3eh0o3jT/voy0GeRjgpsJr9MZgl
	 DgLU20Sy1SkGQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa63628d26so1706167e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 06:25:29 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyhh4isG8QJjx9kv3SMqLtcPVYh07ZVpCRCMyvo/y0NxthwtAJq
	7tfTGxyh/cm6UgXloxzVbPt9iwvQlvCppWeTUYJpxj2ZcntrBAbO/2z3iZXIaLUIR4nDpvSANww
	Th0zr1a3tBfWAU2lHchdpnN21JcdS9Ns=
X-Received: by 2002:a05:6512:145c:10b0:5aa:73ba:6b0d with SMTP id
 2adb3069b0e04-5aa73ba6c81mr51940e87.13.1780320328264; Mon, 01 Jun 2026
 06:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780319402.git.geert+renesas@glider.be>
In-Reply-To: <cover.1780319402.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 15:25:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLncCTdyKLBL1Nc7LR78v=cj1oOk5jAzoJueJAWhHitNXQ@mail.gmail.com>
X-Gm-Features: AVHnY4JmQH7DRwaHr2y1RKCnglAQfej7g5KjIK_bxPSiPWNRL2TZ7xDVSFwwIRo
Message-ID: <CAD++jLncCTdyKLBL1Nc7LR78v=cj1oOk5jAzoJueJAWhHitNXQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v7.2 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-37764-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E084161FFFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 3:19=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit c7c8352fe569d17e3d379a83075a8ea1216852=
6f:
>
>   pinctrl: renesas: sh-pfc: Implement .pin_config_group_get() callback (2=
026-05-15 11:15:19 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v7.2-tag2
>
> for you to fetch changes up to 80538a53978bb9788080caea6e5ee3393dfb6a72:
>
>   pinctrl: renesas: rzg2l: Use tab instead of spaces (2026-05-28 15:07:29=
 +0200)

Pulled in, thanks Geert!

Yours,
Linus Walleij

