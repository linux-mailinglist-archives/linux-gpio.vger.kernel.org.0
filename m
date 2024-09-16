Return-Path: <linux-gpio+bounces-10162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE08979A05
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 05:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F7D1B22916
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 03:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30492E57D;
	Mon, 16 Sep 2024 03:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="QEzKyZqu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C390DDAD;
	Mon, 16 Sep 2024 03:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726455796; cv=none; b=fJsUoxn3FVwrBCdd49xiNVEDA37QMxLYt6OQLqgJDr0bVExSmBd838Zx5SEtLPeYKf9840DJFvCR+KdeJJur2uwJ4xGoiP3M2M7JOgxBuy/CcqdYaTHI6xPaA+HMCz5/pDsUYu7IIN0dIOOP3IB4EVSG74Uug76ujprkFNqPFqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726455796; c=relaxed/simple;
	bh=okRapjNKLW645UiL0c7hWRusBuuLukpp5QX/qWB33u4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oWn/VYRtyQU2/xIio8ghRVyZU7kUlgfmes3ciUI1ZzHIGQ474LCXTUYGYM9DveKC5ON9MCOgPyPV+0alyPg+cKPf2jMSvMnFQXHZ3NiU7IuojaFPC+wB9U1RcSU0Jm8XGkoeW7O9HxHBrrldiZcrjq83qp8PWU4v6F1+FiQWlj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=QEzKyZqu; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726455792;
	bh=okRapjNKLW645UiL0c7hWRusBuuLukpp5QX/qWB33u4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=QEzKyZquXG705Rcy3D7f7sX/6t5Ei4Dzn9KZnVwPOicVaqMrgWjFnf9vzNBuCICi4
	 7QoKWunrmwbb816bOFUoHLczB0tD43ufehjPKczaYaXQ121eT8r9Oby1B0w8jDnQRA
	 q1ZFZtVVgxoQLYbhT3XZLBQSzfgvsGVh7nSOCX/fygfvCcWWURcf3wb5skfCSe8qoO
	 imR65Qe2LNzQ8+233phyIOATVg+qwd8DPORvgQG7/Uej/w/ZBBE+HWoRreGGOyb23b
	 bkFUhv2NkcPub5eUhkjh64dXpu4T3hIyZ+5J2+/7TMxnQ17wYKFE7DQaHWNRUwWlf6
	 UQ/MSrIUg4/4w==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 493FC65027;
	Mon, 16 Sep 2024 11:03:11 +0800 (AWST)
Message-ID: <7433f7d95a0a51eb54ea0b1c9db102adb029f946.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com, Peter.Yin@quantatw.com
Date: Mon, 16 Sep 2024 12:33:10 +0930
In-Reply-To: <20240913074325.239390-7-billy_tsai@aspeedtech.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
	 <20240913074325.239390-7-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-13 at 15:43 +0800, Billy Tsai wrote:
> Performing a dummy read ensures that the register write operation is full=
y
> completed, mitigating any potential bus delays that could otherwise impac=
t
> the frequency of bitbang usage. E.g., if the JTAG application uses GPIO t=
o
> control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the application
> sets the TCK clock to 1 MHz, the GPIO=E2=80=99s high/low transitions will=
 rely on
> a delay function to ensure the clock frequency does not exceed 1 MHz.
> However, this can lead to rapid toggling of the GPIO because the write
> operation is POSTed and does not wait for a bus acknowledgment.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

... are you aware of any other driver concerns of a similar nature wrt
the architecture of the SoCs?

