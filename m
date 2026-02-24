Return-Path: <linux-gpio+bounces-32124-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKwBKxBxnWmAQAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32124-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:36:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D1432184B2C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B59343077344
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4E436C5A0;
	Tue, 24 Feb 2026 09:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIdQGvEN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC136C584
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925459; cv=none; b=RTUbp2YGEI5ZeHCE6wxz/yN769Pi19Hzh7mIGjUFS3mx1eYXeQlzMFWonJ7K7cVErP2YqhJya1MzhibKBPoaR9ICBqRF9kDrHp+jnTq3bCfaIwQsg7AZQx4QdSx9CApOacSQGmUD4G2tFuXEYbyVXMrktkuW9nYXODf1pBc9dIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925459; c=relaxed/simple;
	bh=qFoSCUCgWPxot+zyIzeYtu7f0ut9mFHpqgCHWGjjgGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rf0obqOo/Fn4Gtb6LJluX4YrXNuMAsyn7TX8BFtWJiYqtOeU1Pbxq1UAy0FUxh8L512VZA9Q0IM1fz+uWud/9/KT8u5ZXps0FiM5PRwKY6VROAER3AakoUTraaXxCDTlHolZspZ+VNUdAE3mV0q7tCjHB2YMwktkrfWD5NwMPjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIdQGvEN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1737C2BC86
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925458;
	bh=qFoSCUCgWPxot+zyIzeYtu7f0ut9mFHpqgCHWGjjgGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mIdQGvENKyirm0I0WbhQANOO+Z0g5OknRWpF+j5J1bW0bYVbY2b57HH5fyJi15/yN
	 iekaDjeGMnDnx5eMOKOQF3S4VCE5O0eLumRtHBW2QFyOBwau0DApAQspVvdjvVmFvQ
	 Gf5DNTW95ovOUWqHDYU0B6vudj6h0PeECfX/fnMqU7WH5DFSrLEboKW/fjZKOwe2iB
	 +b5Jse5UWkDXGlfq1yruRFq9QtW6tx2/7jmnzOL3ZYN9aCwkmBPBhkVkA6rMEmx/8J
	 XXRZdK1pclyWrd3j/aBxiO7mqoipsfC1JgPYdl41wA4fnLCWGj4o43kdTiKpuNr93p
	 rEZucbdiVpEOA==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79860421382so539757b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 01:30:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMbZTgjebl1RKo3BAhLz+6Yw8p3Jx8sbN3H2naRt+aSm8crp6OyI90rwSI10tj1JQequ9/BA9u8R0p@vger.kernel.org
X-Gm-Message-State: AOJu0YyMcIurPfdNBeZgdfp2EkHqYbhZvjbk7a5/YHDNfyE9cvcWqM3C
	s5Jvdar0ECqxqHn7nJeG6ysJ8YWKHIvIhGxWZMskY3bg4G8YWCtUdiUL0jivlTaeVmHGEXp/HpW
	QF1YVewAhF6O0ufbQTuheTgMZaNUynZY=
X-Received: by 2002:a05:690c:2701:b0:794:7866:263a with SMTP id
 00721157ae682-79828ef26a8mr110201917b3.10.1771925458159; Tue, 24 Feb 2026
 01:30:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223105717.48779-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260223105717.48779-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:30:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLmow3f-_W9hCRDHBjxUkVbS96ssnPchPfGxXNbSgrJyWg@mail.gmail.com>
X-Gm-Features: AaiRm50enX858ywcuPInWGfUc9Lmz7V_abesy4_4DNC9RBPnw7kMzwtulXV191A
Message-ID: <CAD++jLmow3f-_W9hCRDHBjxUkVbS96ssnPchPfGxXNbSgrJyWg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: Fix configuring a deferred pin
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32124-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: D1432184B2C
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 11:57=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Commit e2c58cbe3aff ("pinctrl: rockchip: Simplify locking with
> scoped_guard()") added a scoped_guard() over existing code containing a
> "break" instruction.  That "break" was for the outer (existing)
> for-loop, which now exits inner, scoped_guard() loop.  If GPIO driver
> did not probe, then driver will not bail out, but instead continue to
> configure the pin.
>
> Fix the issue by simplifying the code - the break in original code was
> leading directly to end of the function returning 0, thus we can simply
> return here rockchip_pinconf_defer_pin status.
>
> Reported-by: David Lechner <dlechner@baylibre.com>
> Closes: https://lore.kernel.org/r/f5b38942-a584-4e78-a893-de4a219070b2@ba=
ylibre.com/
> Fixes: e2c58cbe3aff ("pinctrl: rockchip: Simplify locking with scoped_gua=
rd()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied for fixes!

Yours,
Linus Walleij

