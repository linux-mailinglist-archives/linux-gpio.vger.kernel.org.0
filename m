Return-Path: <linux-gpio+bounces-16755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708EA49187
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE4116E9FD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 06:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0246D1C4A06;
	Fri, 28 Feb 2025 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ditMs+Qb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DE41BE87B;
	Fri, 28 Feb 2025 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740723797; cv=none; b=ttNAcT/9lHwiyHuS+L6LscWrcXxf4szHofXBxeGj0JIfI/dG8eu86gxBepqthPr5iAAE8nDfGE4sZdmp2Z0Kc9l5eFMhNb5GcTwPhB+fUFGnVYzH2Hqz1l9Ym5g9KEKucI8IVBEBnO5E1iuZ7g9JXrsdevLIp0ION8TeMNjVKDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740723797; c=relaxed/simple;
	bh=C3MrKuygS1TVvfU0HAceaUU2SFTPkAxCKpGcFBSxwYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D96JKVPafFoz9jjhgEeUeTd4SvVt/6bt57FHceyQUvS2yRtw/ZMRpIlF4AL2cXcLOFcKfXuGX+AzZw/duJhK4+XqK+sEMuAuto25Dx+3bXSbQ4ebQK3ccryvl/iMd05sIIlFvcW4JYL91FOMRO1upQnr/JvqBex4NroLY/8He6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ditMs+Qb; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1740723203;
	bh=pp9IBKUNCA/ZJDCgfry7+1Ltnk8p0iW227IRYl0yOXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ditMs+Qb4Ve+EarpPSccKWAdGQWMzmrpNYywK6GlQojWc1Vahufg9xsyjz3kGCk5O
	 gIcp3/Sj7bJmQSNN1Y6xLJrBClGqr1UoSrEbSpYEnP2EkzRUjDZorc2M1SYpPqjg4W
	 xvBjpqq5yBPccr9WMXq7iAoNM72bd2XppoXdOiBbjXj9+5UHYsjhAKKGqD+KqIYYL3
	 bw0oyu141KURV/zuC5UdSEqIRXpyP4r6johtqrPaopw+QKjfhWEIL6jLgCzH7lw65F
	 wZ0rzC32U8Uc2MEcI7qET4/5vBwqKCO3yU1mHoO7QioJWAg0Hucx8Qx3rAjYykmMna
	 MSARqv1UkfSEg==
Received: from [127.0.1.1] (58-7-146-131.dyn.iinet.net.au [58.7.146.131])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 65FE977DAB;
	Fri, 28 Feb 2025 14:13:20 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au, 
 devicetree@vger.kernel.org, eajames@linux.ibm.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ninad Palsule <ninad@linux.ibm.com>
Cc: andrew@lunn.ch
In-Reply-To: <20250204194115.3899174-1-ninad@linux.ibm.com>
References: <20250204194115.3899174-1-ninad@linux.ibm.com>
Subject: Re: [PATCH v9 0/9] DTS updates for system1 BMC
Message-Id: <174072320025.3245072.10865277615164271412.b4-ty@codeconstruct.com.au>
Date: Fri, 28 Feb 2025 16:43:20 +1030
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 04 Feb 2025 13:41:03 -0600, Ninad Palsule wrote:
> Please review the patch set version 9.
> 
> V9:
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


