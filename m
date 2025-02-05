Return-Path: <linux-gpio+bounces-15364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD66A27FE5
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 01:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78D007A2CDE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 00:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBE033D8;
	Wed,  5 Feb 2025 00:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Ck3e/lCE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0E4B67F;
	Wed,  5 Feb 2025 00:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738713741; cv=none; b=COPxc/DO+irB2X1w1SypRC4r3tzvOOZ9v5G8tdyl++PaeiYXKfj8pqz23ZRlU1zNh9a31i13El9mJ9hk9VGcxsDkbw233DZ9yyHGAv3UqcKkybSolmEZWSFPerqRwKapf530HK+Q5UxH1OafTNdx8hfEvrnOET1Lmoc3kJ5ycII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738713741; c=relaxed/simple;
	bh=n9dR3JEhqnb9OApW3VcHCh5n2riOWy7LJANruYsyTtU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OMiyatGfLMQa/E7+mFUC6RjBOCh/az1L4RVcRZZ/CMDubATsQDG1S3H30k8Fq5euYWQItrE1mSDPsMtenq2TWuh3UdT1Sg69ZbBdhMzkiW/52SPdwaLP6laUAkfcVU8D6BC6kI2cmhIAbGQo9rTpgJbEK8y0Ga2Uh1a7tXG35kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Ck3e/lCE; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738713736;
	bh=n9dR3JEhqnb9OApW3VcHCh5n2riOWy7LJANruYsyTtU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ck3e/lCEXFFuuoAL69bUJWIek/Bsj52kXXFN9+Kl+6EcYVipvo8ygxrtNA4uMA1rt
	 t8UHG4JeGtRi/K1MhrhztJoZrDC6WPv9ESbvBEmNQ8sDfoqES0Q8Dxr7DSXZaCBG7G
	 FsyjTczGpcz21wcVTOqimjz4E+oHG6J5ABSwcd5nm6vx9P3rhr+I7F5ee6nNxnEnhv
	 z9AOwwanF4AZO/zfrRJwdBAtop2B8lrKQ394MTiFEPsrMHRBCh/a84XlYfYJhvWiW7
	 a9/g7PIXNWyWs8tHO/8KTFCI8uh3UXtHQ6dmZyKxzL7IUvqP6jfd3tt7ZgBam590Ec
	 y2AaxNBlxyPIQ==
Received: from [192.168.68.112] (ppp118-210-185-209.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.209])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A112C7104E;
	Wed,  5 Feb 2025 08:02:15 +0800 (AWST)
Message-ID: <114b92f993a1b5e2c77bbc91b42c21817af2874f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 2/9] dt-bindings: gpio: ast2400-gpio: Add hogs parsing
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, brgl@bgdev.pl, 
 linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
 krzk+dt@kernel.org,  conor+dt@kernel.org,
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au, 
 devicetree@vger.kernel.org, eajames@linux.ibm.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: andrew@lunn.ch
Date: Wed, 05 Feb 2025 10:32:15 +1030
In-Reply-To: <20250204194115.3899174-3-ninad@linux.ibm.com>
References: <20250204194115.3899174-1-ninad@linux.ibm.com>
	 <20250204194115.3899174-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Linus, Bartosz,

On Tue, 2025-02-04 at 13:41 -0600, Ninad Palsule wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0.../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 6
> ++++++
> =C2=A01 file changed, 6 insertions(+)

Would you like to take this through the GPIO tree? Otherwise I'm happy
to take it through the BMC tree with your ack.

Andrew

