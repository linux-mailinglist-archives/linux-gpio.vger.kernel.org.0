Return-Path: <linux-gpio+bounces-34890-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JiXLrhr1mnlFAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34890-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 16:52:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FDD3BDE0E
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 16:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B44843010D94
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 14:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CF03D3D03;
	Wed,  8 Apr 2026 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSt4HlKd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE122DFA3A
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659953; cv=none; b=kSzP4jziOIXctXA1XmtlFvy2vNMpm5tFvFw6zy+SvEVaQyH0WG+wWQVYvTo2LOqEoxBZwOXJX8uu+2wgFzWNhxDviRKRg9ooKcHeMd63qTJ1chvrK5FpNdwdrUVr18/zEYKkg0TN9MyRHZrewNstOUr1pQfiNLv6kW5MV8RmOtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659953; c=relaxed/simple;
	bh=6Lw/Eoe9ZoD6jthuPKa1ibfp0TkJ9tLImTtpG7tP2pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LG2W+wifD77WA4UoGyK2DIibbPPnbyNm3U2HCzrFJnIC/lkaXaSt1IsNMyX1Dk7Vh3FwOae2UEJ/rW5D8a2pxV6YYGKNnpzVgbaf8fFHPtTCz95up+X8x8M+tKrTMZb0avcJ8pyVj8ek5nh6LIx3iepeYX9iKv6sT9u9CsTvIsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSt4HlKd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C902AC2BC87
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775659952;
	bh=6Lw/Eoe9ZoD6jthuPKa1ibfp0TkJ9tLImTtpG7tP2pw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hSt4HlKdxTwjgm6p37Rr9l2jgKxCW0L1HvBWiY+/f+FfRap7BjxXZVJprpPyXj7GX
	 0MjdSbFodJDoILNBzFxkOTUVcma+Yk1OlQgekmR59+k1vV0PUIydtn8KWuHFblVGjd
	 7uytPOONXF3Mmyw+QJtrlGaYUM1MQIP2c6fDCgUIDVWX+Hrrieu9Alu1zNy8cN6pQF
	 xzFj4HlA+nhrz7V/A3zZxz/5GxGMMqQSxcgodNDe9VfyVVRc3uUZ/gaDsA32pIdAK4
	 HwUk40xIPbqarAbmI6EgYKb/qnZvItVy0OVU0TUjQiIWzjh153YgrYQhwV3dy85Z4f
	 65+BaHMOMV1eA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66f74fa69ceso2880950a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 07:52:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEA1txRcqJbOmvkyT9/YFldjJZivGrqz4F8Pk5/MsvRcvJVyDjCClgi18o2vgelqJsLEb+yNLFHjqK@vger.kernel.org
X-Gm-Message-State: AOJu0YyJKTZmM8c9174/EwswfHn+4cQPoxrSEvdSXXOD26xcZr42bTNH
	hHr88zP9tS09pkMvI1300jZRl9Xu6zvKDSkzRwP3QNjAjFkM+lIu64bG9yBOcASLNkuR1gz+9Me
	KDjQnogu8qP9OgJsxeOvzfbRnJlNZ1Q==
X-Received: by 2002:a17:907:d27:b0:b9d:166f:ff82 with SMTP id
 a640c23a62f3a-b9d166fff95mr311519766b.6.1775659951347; Wed, 08 Apr 2026
 07:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406075114.25672-1-clamor95@gmail.com> <20260406075114.25672-3-clamor95@gmail.com>
In-Reply-To: <20260406075114.25672-3-clamor95@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Apr 2026 09:52:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJcKb6xpevQh7C9aATh=p-H5_y05PzVYi3YMAZaH5iX4A@mail.gmail.com>
X-Gm-Features: AQROBzA3f7YSNHZDG2jSbl1BDtXRj5DsGY054stV9bbMGP2ohdg1jN5t1jiEhGA
Message-ID: <CAL_JsqJcKb6xpevQh7C9aATh=p-H5_y05PzVYi3YMAZaH5iX4A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34890-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 64FDD3BDE0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 2:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:
>
> Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
> TXT to YAML format. This patch does not change any functionality; the
> bindings remain the same.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../pinctrl/maxim,max77620-pinctrl.yaml       |  98 ++++++++++++++
>  .../bindings/pinctrl/pinctrl-max77620.txt     | 127 ------------------
>  2 files changed, 98 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max77=
620-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max=
77620.txt

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

This needs to go into 7.1 as the MFD part was already applied.

