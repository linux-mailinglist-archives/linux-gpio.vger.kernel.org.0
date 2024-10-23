Return-Path: <linux-gpio+bounces-11893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A20999AD894
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 01:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E15FB215AE
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 23:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35691FF60C;
	Wed, 23 Oct 2024 23:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="C6TuwGi+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16931F4707;
	Wed, 23 Oct 2024 23:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729726964; cv=none; b=GB3ffMgtCL7+7qa35dQOtCv5o7OhZ+B0yJPtOWozmpfc02qEzGLr1GHk/rxGkEn7vRSdzg5sb3U0U+1+Nd9nHKDtDykLCM/YXiRubrPnvwEZMWSTS9NfCZ8xhvzc16Gyi4OsA7sqwv/7TDmSkXb4K+6xjSJOp/Ct8O892HZPsFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729726964; c=relaxed/simple;
	bh=BI6v3yvMOxexD3sSG5ohKly6PqVC6npk+POPlf5PUAE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A7FAtuYVzawuorhhxPHS/uYKGiI9h6Eiqpp6XbnoFCBSZ6kn1o+iXVmDKydAvG3J9twV8OnBeIAnPrDqtWThQN9Xm7vWN+6XlvzelMA+fh1vCD2yRO0hCmesyr7wdC/Sl67F1+TM8oMxXqciqRM4a7YWRjjkpa06lXr+r+r9nEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=C6TuwGi+; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729726953;
	bh=BI6v3yvMOxexD3sSG5ohKly6PqVC6npk+POPlf5PUAE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=C6TuwGi+JuUDnThIMHcYfPM5VI3p40hN4IiRDyJfTzJUfUIeZt8tfLzWKK1QgMuD9
	 IdW88uxyoXan2U6yyhOcT+smXUXf7+v2s47kGuJ97r0Tn6zZFuLTGk7q5lqEZBaWdg
	 FGSUsg7UIHHz6cg4CvwE5q9KpIXPB8yKvzrSpf4XkNpSI1ToYFBQKyXF/f0Oss4rED
	 cxEO9uBgfoncQ9IRHEHCsoanag4T8x9/f9dovX7tcLULAphXD4Cp51ozAe59apxXPj
	 p5gHEc+LRApwAPvxJGx15Bl7kVrBAnErvsQh8q+VRMC0+iKP0olsOLHZY0xO8YrQOB
	 IGuOD3gCaJr3A==
Received: from [192.168.68.112] (ppp118-210-190-208.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.208])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 030B16494E;
	Thu, 24 Oct 2024 07:42:31 +0800 (AWST)
Message-ID: <f60e70982efbc3d1ea3379b0036b25c74f953411.camel@codeconstruct.com.au>
Subject: Re: [PATCH] pinctrl: aspeed-g6: Support drive-strength for GPIOF/G
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	joel@jms.id.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2024 10:12:16 +1030
In-Reply-To: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
References: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-23 at 18:44 +0800, Billy Tsai wrote:
> Add drive strength configuration support for GPIO F and G groups.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>


