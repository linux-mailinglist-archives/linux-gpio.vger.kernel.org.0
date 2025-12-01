Return-Path: <linux-gpio+bounces-29201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17001C96B62
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Dec 2025 11:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A53DE3A39F1
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Dec 2025 10:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6027304BB5;
	Mon,  1 Dec 2025 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Z/TYHLBz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A095F303A2D;
	Mon,  1 Dec 2025 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764585977; cv=none; b=KCZI0X5S25UQvar63GKv+zwYOq3HAjz5Woy16fxEFR09OWEXjRbB7jtS+epRc0IPXPJmhVCrx6ouAPE+ZSTkwDTiuTCZo9WVbQILN5R2VLyKqdHGkUyi3jARZasm9m9ugA7evVzACeBVWMpPQo5OoG8SDEqZ/R/eD9LDMX5A9/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764585977; c=relaxed/simple;
	bh=iAbzMU/aa8DktfQl0YYqV0IRav4AodZLgHJzSAoGutI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p2Yc+MKXqjkqK8F1VzG6emTMqzVbek4AbWWiAGRTlMxz8t0Zk50xfvNN8cjFJZoXQW04WM6Fp+mf/Kv3u8g1bsS0mW4w6KjUFCZXELGtWWzc2Jg6UHbOySrvEKCTRGYBiMS0eXI1vMsq+JWSNdX58w+9mozriUIxTnAFqXL5kg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Z/TYHLBz; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lHyTIw/aF8t1SzGYdif3Q6mjMcYrehiOc7i7hAL3cq4=; b=Z/TYHLBzwdAY0NfPDiSsJAvB3l
	zR4jZkSgbInAzA6bFYSpkHeYrgeiYtCGHwdMOfN940MBCVerKWccgogO39bbGZo4JYr8sZeDfTU4H
	IKEQleb/B30Mza9cTceeLSwLgDLosQrLWJ6xPEY+4OHe4dVtPz6JqCFEFe0UsHByCHznkhzq4z/3w
	GaYp/d+Itpcm1bKmCbLQopAzYbZnB4Ni7/cNTg0h3qFP0xvQacusitiZ2Wa+CB1x2YkDWuZ88PtPc
	nJcc7lxJVdaxhS6iPrlT62y8++wwzqzzdGkXLXmjVVsy6eki8RTyVQsYcEG7gJpMA/3pmVeK+m+wZ
	qwVf2YvQ==;
Date: Mon, 1 Dec 2025 11:46:02 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: cjz <guagua210311@qq.com>
Cc: linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Grygorii.Strashko@ti.com,
 ssantosh@kernel.org, khilman@kernel.org, linus.walleij@linaro.org,
 brgl@kernel.org
Subject: Re: [PATCH] gpio: omap: add kernel-doc comment for omap_gpio_get()
Message-ID: <20251201114602.094dce74@kemnade.info>
In-Reply-To: <tencent_BB49A52B7796EBAFEC293B0B5203602BD608@qq.com>
References: <tencent_BB49A52B7796EBAFEC293B0B5203602BD608@qq.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon,  1 Dec 2025 17:54:21 +0800
cjz <guagua210311@qq.com> wrote:

> From: changjunzheng <guagua210311@qq.com>
>=20
> omap_gpio_get() is a core function for reading OMAP GPIO pin level, but i=
t lacks complete kernel-doc comment (no function description, parameter exp=
lanation, or return value=E8=AF=B4=E6=98=8E). This causes gcc W=3D1 warning=
 and reduces code readability.
>=20
> Add standard kernel-doc comment to fix the warning and improve maintainab=
ility.
>=20
Can you elaborate on how this improves maintainability to document
obvious parameters of a local function? And why for this local function and
not for others? So why omap_gpio_runtime_suspend() which is also used
as function pointer does not need such comments?
=20
Citing coding-style.rst:
"Do not add boilerplate
kernel-doc which simply reiterates what's obvious from the signature
of the function."

If that is just about compliance to some rule or make a compiler happy
in W=3D1, than do not disguise that and add fake arguments for your change.

BTW: =20
andi@akm1:~/linux$ touch drivers/gpio/gpio-omap.c=20
andi@akm1:~/linux$ make LLVM=3D1 ARCH=3Darm W=3D1
  CALL    scripts/checksyscalls.sh
  CC      drivers/gpio/gpio-omap.o
  AR      drivers/gpio/built-in.a
  AR      drivers/built-in.a

Silence....
with gcc again:
andi@akm1:~/linux$ make ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- zIm=
age modules dtbs W=3D1
  CALL    scripts/checksyscalls.sh
  CC      drivers/gpio/gpio-omap.o
  AR      drivers/gpio/built-in.a
  AR      drivers/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o

Also silence.

Regards,
Andreas

