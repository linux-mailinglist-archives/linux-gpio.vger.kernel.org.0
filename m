Return-Path: <linux-gpio+bounces-37698-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FplGq3yGWp10AgAu9opvQ
	(envelope-from <linux-gpio+bounces-37698-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:10:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B6E608474
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 799B130C6B55
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 20:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D98B44D031;
	Fri, 29 May 2026 20:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8YuViiZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59540337B99
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084876; cv=none; b=JpB4ePyd+h32JhT8DeU68cUNwMelDljS08AK9QXNdXdx9JmnVP2gXnLgt5qazppj1+1893PA+0lvlQJvVFu+gYczlFdIGSIqORkGK+inE0ExgqSy2kAKJyz8ET0FfNDl/LYX04rp2TgAZdUeecwbcFp3IhMlS+6CclSMQT7JtEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084876; c=relaxed/simple;
	bh=gpQUlKH5NGXNx4BW0dbm4YRXddq/maC4M14dxVlc6zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQvSRRnmXIaayPRQbMgKg0lzTFwOXCZJC2pTGUU0lGi64YwB9ffyRZI7VKueg54ejtPI7aTwgziV4wQY/RwSLiD4E2efz92ArgVNN39n5iLaR2eWU0IVSsS//sKpf6sh/nOE3Yy4AU4Lt+vVsF8eMHeuXbpj+DEoYrxUIZeSAJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8YuViiZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0491F00899
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780084875;
	bh=gpQUlKH5NGXNx4BW0dbm4YRXddq/maC4M14dxVlc6zI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f8YuViiZM1UMzDAJAq1lo0WoEGF7KHuV4swKSDdmjUkqLe6rdRSf6jcLcu0HT2JBf
	 XCeA1y8RrLdjDQEmLWvITnnf8jy51NYHxyRQARI9jnVrkfNWoojnRufmxYeuuIJPix
	 bqzpnLfAT8Pb/w0qjdFhNg5ezIGs/24C1/dJ/qNWC+ko6x40oF0p5wNA0fyvNWLtSp
	 +xSRnOq+jNRZZa5vvnsHNr8ddDvF2lw6GrH4MwVFRYHicvoySQR/svBmwffiHS6Zhi
	 WcxZo6wzF41oz/KvUdFCJm88oFGQ8Og9uSpI8fUgwnPzNt8/9t9Jh6+EobMQdudF3l
	 5wXsJlWOjW3yQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa5f06b16cso384805e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 13:01:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Tszvum8i9kIthgaZJMDRwIzdMhHNixYkQXrqDsxlXxZ3sBEGdQc1YfvS1y6872PVWaQJBZWeeLHol@vger.kernel.org
X-Gm-Message-State: AOJu0YxoqU582CjXuicIeE1B/FByak4wQgvPdUGg5DKFXIWAw/JM7NUY
	1fJ0tSsKyuSg5wu/vq8ZoKdyp16cfHzHbDO9ZKv9Mjne7RyrXTZnD2RV2qJ3hIe9I/yNnkm3Y07
	NS71dIkDoqx7mPtmyiOPuPajfRpeiSxQ=
X-Received: by 2002:a05:6512:3b9a:b0:5a8:778b:7df8 with SMTP id
 2adb3069b0e04-5aa6092fb8dmr422996e87.40.1780084873900; Fri, 29 May 2026
 13:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
In-Reply-To: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:01:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLnAyHeDD5w0Wg2PmdFjjcSa5s3gN=du6edQhGtfsc185g@mail.gmail.com>
X-Gm-Features: AVHnY4JOm0-WzW1G9MqJXGq-A3i7d7XKJ22NGKYBCGIPn2yAsSH6lKQkt7oHVSE
Message-ID: <CAD++jLnAyHeDD5w0Wg2PmdFjjcSa5s3gN=du6edQhGtfsc185g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
 pinctrl drivers
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37698-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 06B6E608474
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 11:09=E2=80=AFPM Peter Griffin <peter.griffin@linar=
o.org> wrote:

> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung pinctrl drivers and have an interest in helping
> maintain this code.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

As Krzysztof is in on it, I'm in on it.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

