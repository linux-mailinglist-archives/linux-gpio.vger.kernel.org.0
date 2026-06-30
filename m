Return-Path: <linux-gpio+bounces-39258-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EiBoOLhDRGpurgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39258-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 00:31:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C786E86BB
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 00:31:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=n0FIWZsT;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39258-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39258-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3622730331B5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 22:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D48432FA1B;
	Tue, 30 Jun 2026 22:31:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2FD2ECD32
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:31:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782858676; cv=none; b=tshkOBMVjdabjawBqilDBM4RqmOwIgk9nmO+5l+VqFlwV0nrv4ccTw+Phsw/p7G9bNoPCeeJBcZHGXWrpRzLgRVvr3T0FY1mGFME/ExR8QX48Wg1Z6VTBW+UvBx7boObMduTk0NKlC5GOXNxuTD6KsLfWF+w8ame8xWKX4yESgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782858676; c=relaxed/simple;
	bh=5xJeaRAiKHKbp/aAstXnsYKTpc6E8XcGidN9PLbZJKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtVOT16SNBy/KXJ+GYnt0lgXL76aGgLF7aVK9n8Zy/Z8frKXLU+IqZzPnpYmf9Dkbg8b6uBt5jFGm4sXFby/xJ1dqQM5IY8bGPy8QeaHk/lth+jxlIBFwoSPNAqEOWWT2ijVvCUmY4aFaA3urbQpvVs6t9wdNYAVf5IQbhuHZG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0FIWZsT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001DE1F01558
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858675;
	bh=5xJeaRAiKHKbp/aAstXnsYKTpc6E8XcGidN9PLbZJKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n0FIWZsT64s808ZN5DPQCSd38F9dqMBDTr122mpLWcKUL0U57cT8ZcAddOD67hQNU
	 fNZ/8wqFSf8V6QQ228spyMlKPuVWnIE1blXFXK731BSImUJTcPxQSskBwcSj7WMei9
	 bXTBGXSxdkxkA+p2/YC5Yr7EsI6B5AWT2ZPn98tudaS3IIKwJvjNlg81CSz6Xk/yaS
	 OtQKvHGIunLV/piayMiPOg7kYP8cq15wEvsVGwK78KB/Zeo6Q95TgTPU3926joVlqe
	 dV+nJsISLi8KftA6SfEI3tcM2ChKiKeuxCISq+bL9mXRqaL8UGhdyoLEuMNq7Kwwwy
	 6IrIeWkGYLfXw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebd52488cso1983179e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 15:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpGMzt3FtwKIer08aIyaFfKrjRZiie7h8YX0NEnkhSvzD9Qgi/73UosgLKPJrfgCEks8gWEbFA8MSbq@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUkxjbSnWUidi+WwVPdyelEWaw1x4nyE1gVrmk3zxOfXzfsEi
	bGRfoJGsr3++bB2V+syY1FordyWl4BC7X1fWT1Vlhuj4j29UowFZc4zaJs7unTO3uX5D5vpkSy2
	SEHwlGKzBwSOinU7A9am/QPXn6jH5MUg=
X-Received: by 2002:a05:6512:1389:b0:5ae:c286:c54e with SMTP id
 2adb3069b0e04-5aec286c65bmr321902e87.47.1782858673751; Tue, 30 Jun 2026
 15:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com> <20260625115718.1678991-2-v@baodeep.com>
 <CAMRc=MfpXEFreGynUtAJfvW+27OgKiTOEZvkddt5U0+QG4cYeQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfpXEFreGynUtAJfvW+27OgKiTOEZvkddt5U0+QG4cYeQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:31:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLmX-6bQeYnFz1RY2pZYO6M-WTKusknXLC7qBwKSJD3sFg@mail.gmail.com>
X-Gm-Features: AVVi8CeD_JGR0lMhBhRY5S2FOUVA0y7Fr83_izAzoDl2Cf1SkECqUOqmnWip8_E
Message-ID: <CAD++jLmX-6bQeYnFz1RY2pZYO6M-WTKusknXLC7qBwKSJD3sFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Viacheslav Bocharov <v@baodeep.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39258-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:v@baodeep.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[baodeep.com,linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49C786E86BB

On Fri, Jun 26, 2026 at 5:02=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:

> This looks good to me. Linus: do you want me to take patch 2/2 as well? I=
'll
> send it for v7.2-rc2.

Yep that's the best, I'll add my tag.

Yours,
Linus Walleij

