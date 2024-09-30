Return-Path: <linux-gpio+bounces-10543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379CD9899C6
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 06:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ED1D1C20B49
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 04:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76CB7710C;
	Mon, 30 Sep 2024 04:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="a7K/pn8o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75B52F29;
	Mon, 30 Sep 2024 04:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727671065; cv=none; b=obrDOsKC2HjjCDEAGtqkvlxYeXWbv11mVBH/ya0ttmmpO+t+Pjo/Ztq0zZzFYvhDJL5n5QHVIV2fFohAmlEvRa96It4ae/y4cIqVoCGcWv8ePr8Z65IH2RsRCzWJQdeyeu4G2hPWAMz8pT8q0IVhLQDq4Y48oCHZjtt8nhsLocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727671065; c=relaxed/simple;
	bh=bvNCgG5pDPCrJ9FPzlk4/5b/7wAGKiINpTHJvUlbEt4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P7zt5HXmxpMjTUfmmxoxS0H1FuHRRp6QnV4vI1lU01Gj2S5hCtUgn36IcaXI+3PZxkAtsIXqy+CAHvnotCU5j8JSknG9gmbuzYSA2TY+MQfJ9jEamGcfr24lBzy8XcABCxHElgOJRAn/jxw38Ij9BwiMNUyhBFnRic/J+qw6hSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=a7K/pn8o; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727671061;
	bh=bvNCgG5pDPCrJ9FPzlk4/5b/7wAGKiINpTHJvUlbEt4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=a7K/pn8oOX1LfnnGFls8ZPATsQ2330fK1bPIn7KFcvQLQ2WtatKDuTcwpk8QMtgHz
	 8PKUv+2ppcDQJlAo6y4XGeg4+ICHUxi4LPZDhZ0axFtRZ6rsztaE/e30ZRQg2Jz8v6
	 oi6vUtgGZQyRQKZG0QqOhhqDenXJMIHV+NWwQpjR6aeAwUo7ZMXgogvli0YIhiHjio
	 kaqctOE4bh+o0y9ukxAiMMXP0p8bhyfYBxaZI6LRyFj13RvZW4ISO3jaEbfpoZu/Ii
	 a3ltVqUXjWU4mlIs6aiwo0bQmtjCr7XJKkwbM26PIt5xCq7k8kGHuMV92DyRKhGpwx
	 fpDsrsXTwjrwg==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0C30A6511E;
	Mon, 30 Sep 2024 12:37:39 +0800 (AWST)
Message-ID: <506c41f97dc0243ed156f1775006ef30fe4a3f54.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 5/7] gpio: aspeed: Change the macro to support
 deferred probe
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Mon, 30 Sep 2024 14:07:39 +0930
In-Reply-To: <20240927111744.3511373-6-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
	 <20240927111744.3511373-6-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-27 at 19:17 +0800, Billy Tsai wrote:
> Use module_platform_driver() to replace module_platform_driver_probe().
> The former utilizes platform_driver_register(), which allows the driver t=
o
> defer probing when it doesn't acquire the necessary resources due to prob=
e
> order. In contrast, the latter uses __platform_driver_probe(), which
> includes the comment "Note that this is incompatible with deferred
> probing." Since our GPIO driver requires access to the clock resource, th=
e
> former is more suitable.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Seems okay to make it less of a deviant, though maybe we should fix the
sgpio drive as well? Anyway:

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Andrew

