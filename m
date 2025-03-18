Return-Path: <linux-gpio+bounces-17709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E46A66417
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 01:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6EA016A3C5
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 00:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7905222EE5;
	Tue, 18 Mar 2025 00:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="mxfwYheI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6832518E1A
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 00:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742258898; cv=none; b=NC36DgQEeoLcQqnt2tj3HH8Ez5hsTFN8N8TkxEqzI3sILF8T1DBnHcoLLW9Ej9HwEPpyPoUcxF99ZramoGU/yKjJb624qIyniZhXMc2LL2iODv688tXCp4ncnjCwZW/xyCxzYsfAqYgEgR+JIHyDe3kMKsWoy8AR+hZ1xR6OEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742258898; c=relaxed/simple;
	bh=v2CO4TxTFLaHlHXsp64wi5Bonh0U5j8YWCIUsyAYMQg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EvLeUwAcVdjEzh1+4OV2/q+fEGyOUacvNaWB6YHY/UU80ZNHm+oDzcKPVO8FFKagIIA3KLiHbAxD440cUQuoopodp0Tmj/dasijpHySNN+7x96gdS3iet2RCxykdx+8ZhqOg8U4qMPA3Z9wy83MKyK2O5ENdom+M+PQLZxF/MNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=mxfwYheI; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742258894;
	bh=v2CO4TxTFLaHlHXsp64wi5Bonh0U5j8YWCIUsyAYMQg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mxfwYheIL1RFJUexCjsK8ww7S62u8nGYf/qObDqOsqcbuvRJgceVR+zarPNkTms/2
	 jjlyyHNTqrLQ0AqNxllG4FiuHjfkmfYARwCwCW45Ia2pDB0/PlnjnRE+WG2CToNbbw
	 vYvlGg9Mmjn01iPxTbaKu+J7vWCsPTKNpOiQNb0Bxu73t0cn87y15kduLz2SCvsOkT
	 bfhDJw9ZyY5++iOmIqViUa6nDgscJE5cHMtvV3cAHWiHUou1XhJRdXfS1bffFAfrnl
	 EGhivetLME5STCPHWpCpAjI2tvHT5TjRyE0p+jtSrjGHj/bad01ljfzXixwx3CRWo4
	 ECOoIR5yZWt9g==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 35A2C77BB4;
	Tue, 18 Mar 2025 08:48:12 +0800 (AWST)
Message-ID: <0d0c60dcd2eae1d8bc6113a4678f5e362c3244fd.camel@codeconstruct.com.au>
Subject: Re: Question about ASPEED GPIO value/direction set order
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Nikita Shubin <nikita.shubin@maquefel.me>, Joel Stanley <joel@jms.id.au>
Cc: linux-gpio@vger.kernel.org
Date: Tue, 18 Mar 2025 11:18:12 +1030
In-Reply-To: <5372f57d61f31ac681e295964cacf2e23df3b3ed.camel@maquefel.me>
References: <3cd0fe0ff42a751fd0738dacf16badcaa8ff51fb.camel@maquefel.me>
	 <4878ed9cfd9ff20550cf0d9d8933ec993f4b288c.camel@codeconstruct.com.au>
	 <5372f57d61f31ac681e295964cacf2e23df3b3ed.camel@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Nikita,

On Thu, 2025-03-13 at 10:39 +0300, Nikita Shubin wrote:
> Hi Andrew, thank you for quick answer.
>=20
> The reason i am asking this is that in QEMU the first time we set
> pin,
> all below if (diff) in aspeed_gpio_update() won't be triggered due to
> direction is set after the value itself (so no qemu_set_irq()
> triggers):
>=20
> https://elixir.bootlin.com/qemu/v9.2.2/source/hw/gpio/aspeed_gpio.c#L314
>=20
> aspeed # gpioset 0 8=3D1
> aspeed_gpio_write offset: 0x1c value 0x100
> aspeed_gpio_write offset: 0x0 value 0x100=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <-- VALUE
> aspeed_gpio_write offset: 0x4 value 0x100=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <-- DIRECTION
>=20
> And i doubted if it's a QEMU or Linux driver flaw.

That sounds like a bug in the qemu model. Please send a patch to the
qemu lists for discussion.

Thanks,

Andrew

