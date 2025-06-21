Return-Path: <linux-gpio+bounces-21956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E90AE2C32
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 22:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79DF83B3C06
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 20:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0090E26FA69;
	Sat, 21 Jun 2025 20:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="c5nMNP/2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76861211F;
	Sat, 21 Jun 2025 20:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750537233; cv=none; b=uhH8U4tzXyxpx6pBu7nlGjQVq558dNyviKyrlZOr1m503jIG76PEBAmcS5hOwKwFti8HjKG5zdfEqKalpey26y8aTt7+/z8benQEZMaQegh3EI11gzq6H3Ct8+IJ65LQYgr5XCYVcXDL2EYDM6jx1ANZTLVleRwC4BzyVb0jsSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750537233; c=relaxed/simple;
	bh=w4e/fCUU/aHzOrTZ+cnX4K1qrjxfJtCzZePU7cxhMoY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Kh3NoSo+pPuvc5scRj3aT2HD6owuUNEQ17TyqxSGXZRL3fAVWAkYV3LHfLLTrf6QAk4Q7rdljCeDyLAdu3N8PmRn2ORrMZmCUCM6x6UnbNHMjE5JxQg7CE5zC2w9n9V+zw7Le0vIrEOxY+Ed8J57ea4ZAv5G8MX6zlrEmlPEB8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=c5nMNP/2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1BC0B41F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750537231; bh=BgrJoGYd1mlrQAvjw00oAqv1vfs8tpuQ/PQr4mdOjT0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=c5nMNP/2rORiVZKNR5nxxpagZ7Vjk0xZ002qNSm1qRFkPkIBhrJTdHsDXQDggITIG
	 3XMiaifHQXINW1tov05JaKr1zddotqjSZ8cvZnE59Am2g2dsKT0Wv9rOzCUCz6eaNj
	 x0PTqBZQL5Ka6vQ5DzYcK5teb46+AX0ozbDiDDiuPobf+bbZJcz8JFAkhGZ1drwH3K
	 pwZWcsmIXj1HlX32esd6prlWqqweh38Noqn1SaqfQPkiCrurOJYhkoT214F73veU+R
	 5Sh4LwFtWSWR1LnxLzvll5hK2zl9DMxr5xabw5qsvb/nDSgcoH9FqApaVThMAJBd8Y
	 WLfGxqBYKyavg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1BC0B41F2B;
	Sat, 21 Jun 2025 20:20:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux GPIO <linux-gpio@vger.kernel.org>,
 Linux MTD <linux-mtd@vger.kernel.org>, Linux Networking
 <netdev@vger.kernel.org>, Linux USB <linux-usb@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Richard Weinberger <richard@nod.at>, Zhihao Cheng
 <chengzhihao1@huawei.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Pietrasiewicz
 <andrzejtp2010@gmail.com>, Felipe Balbi <balbi@kernel.org>, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH] Documentation: treewide: Replace remaining spinics
 links with lore
In-Reply-To: <20250611065254.36608-2-bagasdotme@gmail.com>
References: <20250611065254.36608-2-bagasdotme@gmail.com>
Date: Sat, 21 Jun 2025 14:20:30 -0600
Message-ID: <87tt48c0dt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Long before introduction of lore.kernel.org, people would link
> to LKML threads on third-party archives (here spinics.net), which
> in some cases can be unreliable (as these were outside of
> kernel.org control). Replace links to them with lore counterparts
> (if any).
>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/driver-api/gpio/driver.rst                    | 2 +-
>  Documentation/filesystems/ubifs-authentication.rst          | 2 +-
>  .../networking/device_drivers/ethernet/ti/cpsw.rst          | 6 +++---
>  Documentation/usb/gadget-testing.rst                        | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon

