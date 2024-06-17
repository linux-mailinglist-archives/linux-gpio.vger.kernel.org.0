Return-Path: <linux-gpio+bounces-7479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7BD90A7A0
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 09:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A88CBB2DB83
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 07:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDD818C33C;
	Mon, 17 Jun 2024 07:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="TikU2bPn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106DBE554;
	Mon, 17 Jun 2024 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609781; cv=none; b=ew5H5Qaenj/DiL6Vhj29yG7q2qeCtRb2NyQOp9oJQUhCFYP2OSVDYHyMTCSMjKXd5rgw4pcsi6xZdsEyXDH5tA/l/8P90yb2P/VMH72Amv/aGUsR4UhaqTkqF7XwrDG5nyA8aasJQalnn+t9lI2LXvk+iha95eAWcylHaBNUUzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609781; c=relaxed/simple;
	bh=iOiT9XbaETPh/FvCvqtFzcLzSYCSL59RFQR96l/c+sY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p3GuYSR3qclm/ujGiXdFaq24VgRo1kCWhx7XyTfdjue2u9Xu6rlrghTzhtObvI998UL0dsBZODw4xbblyKXhCrW2aw0TNWMr4ElI7iijdVsYE8IKZm7SjyKu40tmguc/w3eR8SBWD/PXlD+j+qvd3xaefMte/iU0WbeDlAKK/XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=TikU2bPn; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 242482014A;
	Mon, 17 Jun 2024 15:36:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718609777;
	bh=iOiT9XbaETPh/FvCvqtFzcLzSYCSL59RFQR96l/c+sY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TikU2bPnSvNMKifTDiW9nN2PW7diSyrEPF2VcwSk0Gc75oNTixqOtJue9r6SQp9YT
	 m/Ils3hmxFlKoIdOFroZMBwAFEL2B8hNR27a9Ma2I5lHcrnuKDfjLOWXok4Fn0OKhj
	 3bvcfXScHtyjk7h8Uf+vOZua7UMu/tQBI6uVzyca7G78KgmRZp38EyO89tYS9w9f8i
	 RCoAK/OVhGm1bga7v/ZjJCOSxpqjPw7JtaUOXCnmmLIiFEzTtdFi/bQ5ga+FfuQRA7
	 gfUWDjoHmvuDSYOLiq52zuuaXFa2xAWYpV+eaqe2RF6pTWDp1pNB10FWF9rAA55t99
	 GWufr9eYjWttg==
Message-ID: <28297cafdf748dd3e2da3e6b54012bf3c88a1be1.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] dt-bindings: pinctrl: aspeed: Define missing
 functions and groups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org,  openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 17 Jun 2024 17:06:16 +0930
In-Reply-To: <CACRpkdanSAkR-czs=OUKLh6dpiRk0QDLR-T0ECrG-Y4cY9=Vmg@mail.gmail.com>
References: 
	<20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
	 <CACRpkdanSAkR-czs=OUKLh6dpiRk0QDLR-T0ECrG-Y4cY9=Vmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-06-17 at 09:34 +0200, Linus Walleij wrote:
> On Fri, May 31, 2024 at 5:03=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
>=20
> > This short series cleans up a collection of binding warnings concerning
> > use of undefined pinctrl functions and groups. Together they make a
> > reasonable dent in the volume of output from `make dtbs_check` for the
> > Aspeed devicetrees.
>=20
> All patches applied.
>=20
> Thanks Andrew!

That was quick! Thanks!

Andrew


