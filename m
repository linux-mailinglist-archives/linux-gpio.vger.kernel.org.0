Return-Path: <linux-gpio+bounces-18469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0BDA7F88A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 10:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EF5D3BDA11
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 08:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2CC266B40;
	Tue,  8 Apr 2025 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ljoLSqix";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zlmz6sQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E328726657C;
	Tue,  8 Apr 2025 08:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102060; cv=none; b=lF+5HT4BAzc2J/we7175iVOTcYAycYBwWDGEE7VdKPHxCfKvkCTUp3SLXc+lwjDfDxuJ0Kxw2QN/KNYWyfyYWc9r5Xsu9jm5YSkLiT7bQ/IRaTdafBNp3Zxx+UjbKggt1E/e4XQC6pwT8UR4Ug3/50FmXqtKyx3XhjMG03/w2pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102060; c=relaxed/simple;
	bh=zEMRJkHCiItH/9yEO44fnqGsMPNew6QZ4ceTZmRrlP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oXcMrcd51pfMoX0BUDzdhaFzu0zvdKe79F8YpCaJFoASjfWZ/MIjXn441WewTX5fs46k1yGarqdVFJqesR7zPZAjBxvsgmcYjHeTXDK07VGPaSjHneN1JH2gZ3QBzptt8/jS7xHDeiW6ZL1bzqn1jMljzVIIP69zdTfTGSuIReg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ljoLSqix; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zlmz6sQF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744102057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r4BlX0lCwbiIFb4qchxJxBRV88YRP4RCgKqrrz3VFes=;
	b=ljoLSqixW5WrBxDLEm9j4dh8ysqPFujFvuy4u401FJUZcT6KpgcEhCrBPU73TtG0E4+GuV
	AEhK/VLg6faTU++ebJsXR1H2QNIFuidGnver9GWVVyHsVv/a7juoCJA6i87LXVyaDAVpL2
	Ffjue5OUd7T5UCjPmhF0zv9vDjQjZBGDBXACg8AdiMDC9kfMps4c2QAdUVmfQSBjb3C+CS
	HKiX8Nnq7cKFcTwfzrassHZMVKwvNRpWxRR+QMBxZhDh4/iWkO/QYTS/ygL80aHZakUiwv
	WcUz4s6I2QpYunlHR5HJP61Gt6JutFkm1J1QCm2Sts72M6gm5QQvtxRjCiy+oQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744102057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r4BlX0lCwbiIFb4qchxJxBRV88YRP4RCgKqrrz3VFes=;
	b=Zlmz6sQFQbmRosJeoqbAq2dV0g8gygZFHZ2yi9oSV+ZOE19E1xJTh+9EABGXwJuNt5sGnj
	aFSdX5uO+GIla1CA==
To: Bartosz Golaszewski <brgl@bgdev.pl>, Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alex Elder
 <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
In-Reply-To: <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
 <20250407103320-GYA13974@gentoo>
 <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
Date: Tue, 08 Apr 2025 10:47:36 +0200
Message-ID: <87r023ujiv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07 2025 at 13:26, Bartosz Golaszewski wrote:
> On Mon, Apr 7, 2025 at 12:33=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>> On 06:06 Wed 26 Mar     , Yixun Lan wrote:
>>   I'd assume this patch [2/2] will go via pinctrl's tree?
>> as patch [1/2] has been accepted by Thomas into tip tree [1]..
>>   Additonally need to pull that commit first? since it's a dependency
>>
>
> No, this should go through the GPIO tree but for that I'd need an
> immutable tag with patch 1/2.

Here you go:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irqdomain-04-0=
8-25

Thanks,

        tglx

