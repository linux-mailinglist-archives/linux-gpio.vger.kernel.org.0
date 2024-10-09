Return-Path: <linux-gpio+bounces-11083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A01E995D86
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 03:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD9922897EE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 01:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DB348CDD;
	Wed,  9 Oct 2024 01:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Wrw3pHZL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB127DA67;
	Wed,  9 Oct 2024 01:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728439027; cv=none; b=W0oM12GyhNVvWgWOHCpn+xJqqvA/iuOL8JmL6w3fM4IzvE8C6DCwVm5xrUO28kjPZsLqXdkJjuB8fZKfPU3MZ0dTIuFYND2eq9la47eoB8oK9rTQGFCCtJzP33GfxmshlxYuLQiCongdwIynHlX3o++ykHsPJ1gevLUT2cpr+EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728439027; c=relaxed/simple;
	bh=0qIf2Ra8Gj4K+mN2QHbUYTSzc881tgucRsibpFVJjHY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t3tWO0GCjYcRayU9CER3cM3WaRBUQEKpLabO5HG/QrxRghhlY6Efnyou8sO+m50tGN1xZIXeiTfFLIz4EctIyDfXl4HkipAJKXBgPMO96j6xWNfMFlQQL5P7NhmTLi5e2glx5Jkjxg3/eiqA7r528ZlNDfFZX6mN/UNTC7l3ijA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Wrw3pHZL; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1728439024;
	bh=0qIf2Ra8Gj4K+mN2QHbUYTSzc881tgucRsibpFVJjHY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Wrw3pHZLxa/6sZT06tIslv8qoZa2AOEiAy/CO0Gb9yi+rdClr/wzQLXlwxrOqtBNm
	 dZpM+LB507nlDwPl9LoZbUbJIWw173I39js4qAL4PoXHnWwc7YfaU01iG4xEK1JF3P
	 extxiTWqNB2+PPi5Ckol25bWJxrVYY228entsvxPJcoKhLg4vklzGF03ZYA1YnsP5E
	 QGBm1hJzGz4YQe4Jt/yHCKDi5bab6KiOJs69EAeqL5i4xDGM3bwosAzdc8DGhRfvbT
	 pOHpTaepqqiHiEVcFlIOXLqpt+DuIL36jBDR5O7oR4iATKCexfg5lFMA+yqJFpNv3E
	 UR7UsRU5k1AXg==
Received: from [192.168.68.112] (ppp118-210-190-105.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.105])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 58DCD6497F;
	Wed,  9 Oct 2024 09:57:02 +0800 (AWST)
Message-ID: <38c72aa9f4cbd3d4a6dc9f8baac20e9bd87db644.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 5/7] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Wed, 09 Oct 2024 12:27:01 +1030
In-Reply-To: <20241008081450.1490955-6-billy_tsai@aspeedtech.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
	 <20241008081450.1490955-6-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-10-08 at 16:14 +0800, Billy Tsai wrote:
> Add low-level operations (llops) to abstract the register access for GPIO
> registers and the coprocessor request/release. With this abstraction
> layer, the driver can separate the hardware and software logic, making it
> easier to extend the driver to support different hardware register
> layouts.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

I've applied the series to here and booted it on a AST2600. I did some
brief testing with a logic analyzer and gpio{get,set} and didn't see
anything surprising, so:

Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au> # AST2600

Thanks Billy!

Andrew

