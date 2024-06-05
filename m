Return-Path: <linux-gpio+bounces-7146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B198FC0EC
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 02:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE61E28452A
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 00:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC7B2F43;
	Wed,  5 Jun 2024 00:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="kP8qrqGF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12197163;
	Wed,  5 Jun 2024 00:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717548440; cv=none; b=oKGr+1rJvRiY6l3eq5rDaOwTiZk8XJ7k4KlI/bFNXvz5HFj8fJU+rX8TWxS9qw/1ncwVJHvz0QkvEzf6tUEllBaMk41RemePCURQxgVLG3iCnnRKNvZs55+gzK+3N/a8/65wIZSbx4jH6iOaD9M0FkBSDv4Z6wzdq03fNoS+U0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717548440; c=relaxed/simple;
	bh=ANXb6zc3UuSOyX6FxuEvTkWNM9eC6npStLm/IruWE68=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D+YClYPMo1F1K5HyXBK+BhMStvG9q8llgc8Nuh4rOIlkY+srFx5/Lp/bI6K0kSUFwvRMMRkbC3sWXGkdkILGKcKL17IE+y0Uhg9Mi1lPUI98xwbyulh9h06TDNr6A2CeCdwRqoGhENOHChWpqbxpQQqJCsei8ogpyy10pZfVyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=kP8qrqGF; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DBD032009F;
	Wed,  5 Jun 2024 08:47:13 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717548435;
	bh=ANXb6zc3UuSOyX6FxuEvTkWNM9eC6npStLm/IruWE68=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kP8qrqGFDNRLThPf7QY2mccgHy7qaTo0F9H6onVvhw3Bll10+LvUt/xZHTaGwhRFd
	 FkCyVVh2EZ4k/nTG0FgLSkZhXqMDmNP81hUXuZWMN9qgiEL1724OhCIioAvYGBf5tJ
	 ol61Gx0duyW5kbktYsE/UQ2jdzS0KCKAJuFU9UyjqrBavlAV8K/CPUlkHCAo7zlG8L
	 DheyAK0GqUPhpqqQ0cO0BgVW7khE0vzcO2AEMiy4n4vrQiOvTA4TBaneVkkUlMJ8nc
	 nLriEZvSjEeUtCCUvFf/TWjsI4F3aXkYfNCOFlhve96arT+AcfBZJZkgS4PUKrAOGi
	 tOtafZ0wA/TqQ==
Message-ID: <0908995dfd2181e687181bd1b075c4cb27624e94.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: aspeed: Use block syntax for
 function and groups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 05 Jun 2024 10:17:13 +0930
In-Reply-To: <20240604192755.GA1065421-robh@kernel.org>
References: 
	<20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
	 <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-1-a6fe2281a1b8@codeconstruct.com.au>
	 <20240604192755.GA1065421-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-06-04 at 14:27 -0500, Rob Herring wrote:
> On Fri, May 31, 2024 at 12:32:47PM +0930, Andrew Jeffery wrote:
> > The expansion makes the documents a lot longer, but it's easier to
> > review changes to functions and groups when we're not having to deal
> > with line wrapping.
>=20
> Do you really expect to be updating this frequently? I would leave it=20
> as-is, but whatever you decide.

I don't expect to be updating it frequently. However it's happened
occasionally in the past and the diff chaos irks me. So I prefer we
explode it.

>=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
>=20
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Thanks.

Andrew

