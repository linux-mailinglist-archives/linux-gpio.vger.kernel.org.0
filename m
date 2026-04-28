Return-Path: <linux-gpio+bounces-35675-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4cI3N4SC8GlwUQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35675-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:48:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53631481D2A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 064FB3039FFD
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2933D6CDA;
	Tue, 28 Apr 2026 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAGNKr26"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29BD3A63FB
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369379; cv=none; b=IUJ1wyb8zkIQIal92XsDvOtx9npL5WFsh4OG2Z5aYGoPYvb+jIVtZxDsE1hGSL9TUL1pN+aA/dwPqUhR/NuF4IyXeZv8C1I+LHr8fzBnw7cLBZi9OyYxBo4qdVGVIQLNYg8oSd76X7d9QWg8PJueWy9HV5jAU9gd+pq0poIDh4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369379; c=relaxed/simple;
	bh=p8Nv0AJoTta5EMpsjb7JOmpE8H5YhktE42ZUJI1zgRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuhndV1XOCGHcdVw8HfGxu4mLBkNIR5jWFykkH8Lm6PEygY0xkmQ7Hq4aRA9f6VjSPn9xpgojM83r9VlBeoP45AILv/RxTCcNgKz51I56KSZnpg7A815W7q2EE6pnRZvVWZYQTTv3qZk65ajgOmjPrtw9CG7NkCj0KPwZjzYI4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAGNKr26; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B40C2BCAF
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777369378;
	bh=p8Nv0AJoTta5EMpsjb7JOmpE8H5YhktE42ZUJI1zgRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CAGNKr26cUeT5HAiyKc2K3chcRHBw7C7WpyNZdpPX99El6jXpyiszvphYeq0SFCA+
	 sG0WubbC6HwsSx0ZE7ymc3Tl3xbzTRroiM7YpM0EH1yMiZ+CTshpfUWwRHcaYPk7Wk
	 XnETXIbT/gw0kLptYlAHnp4I1HPmvNVPsktQ2Crq1nwjlbUgU7G9uQ8vfyjhl0f+Mr
	 JTPzfNTwfJKtonc9WVl/EhEfAwiwPqz4CLqvFDfy386FPUWEbURMVx99BfxZD8Ytic
	 2cRsKv73dVjAuXKW+0s4C8TnbKWSyBQ5m2nBLYHo2QhwFx2ws1BAVaIJpBM0kgnDzd
	 i/Jdp9AHSmPFQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso100433761fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:42:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Vlcnr0Q0oQPe+WodZNyL4BiY8e3vd86aHZU5BGmg/5l7QHFhXO4HPuGSXnNCbLPDX2HPw4hWW29a1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg819wF0SSsVzos8ZEMqbNASdw7iQObPnPoblzDXEJq5RpwdPG
	h0Q0cATA5AN/ztBYJvsUO96b5irvyjc6BhSF7GrbVaaBnR1qSQzeIM0IJ2M+HlPY+9ssWPIx/91
	ZPclHuYV3oKUPBb6eobQaAHSAvKAdsdg=
X-Received: by 2002:a2e:bc11:0:b0:38c:562b:9bb6 with SMTP id
 38308e7fff4ca-39240d1f9bamr8432241fa.15.1777369377303; Tue, 28 Apr 2026
 02:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-pinconf-v1-1-82f8276d8aec@gmail.com>
In-Reply-To: <20260420-pinconf-v1-1-82f8276d8aec@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:42:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLkfGi2rVF4FVPOgVSphGPHNFiLBLDiK6Bkoroy4KZf8Zw@mail.gmail.com>
X-Gm-Features: AVHnY4Idm6EHTtMScZdydO2A6TPmYvJ1MfBTf9NLYxUfXvnpkhcSF6iKRWa6Ec0
Message-ID: <CAD++jLkfGi2rVF4FVPOgVSphGPHNFiLBLDiK6Bkoroy4KZf8Zw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: fix properties bitmap leak in parse_fw_cfg()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 53631481D2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35675-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, Apr 20, 2026 at 12:56=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote=
:

> In parse_fw_cfg(), if fwnode_property_match_property_string() fails with
> -ENOENT, the code returns directly and leaks the bitmap.
>
> Use __free(bitmap) for automatic cleanup to fix the leak.
>
> Fixes: 9c105255108b ("pinctrl: pinconf-generic: perform basic checks on p=
incfg properties")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Very elegant Felix, thanks!
Patch applied.

Yours,
Linus Walleij

