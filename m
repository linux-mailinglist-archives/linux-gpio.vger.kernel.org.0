Return-Path: <linux-gpio+bounces-10158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 032AF9799DC
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 03:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A78501F2310E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 01:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89484A94F;
	Mon, 16 Sep 2024 01:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="CrZH3lD2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DC27483;
	Mon, 16 Sep 2024 01:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726451500; cv=none; b=duw+vYO+P7zr1uCb0TuYQGV6v/Rox6OnfcxvQSbcoz8sgArP0AQWJTKUtAi2drnOQKFE3nhnO7Z6NDOfWVFBRq7HHUKBUHBKGssy460kXa6ZQp36qvoXF1UvXtbB5iCVFjMn3JmmrdIpRd5atsOmMGxZiKMr/lM52ksk4lOV4Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726451500; c=relaxed/simple;
	bh=uZEaSeIL9EbteI4kOFz1NSnE7w9HpzPFiE8x0WksUXA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=czcksKo9rnze8UwtqqP555t1G99uKFieZsphwtIktFkjV2SAA6J8ThL7DB7wSdSUe9u+53SEZgMLx+Xs7M2v4JL0hrddVJWe9aBuJwNz2I8kxWPySFyxdll9hpv1F4x+sEFpVZ7iXdF5C/O8yuCmNXvPFGl3HD3qPx3AuPYXDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=CrZH3lD2; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726451490;
	bh=uZEaSeIL9EbteI4kOFz1NSnE7w9HpzPFiE8x0WksUXA=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=CrZH3lD2I9/qXVN6rUU+bh4gfJZgmkfPHt9m6YWpsvjPIWqMCEHAKpvO0XPsHLNc9
	 xjFrwkAF5i7KEcog//0OIw4cmC6X/Q3r2zLe9nzCLIi5xc2vs1tJsxV9TGpHxK6bPD
	 oETSy2W1TCAmLkZuTqU7WtnTds6w5uijd90soOyhaCbZlhSfDt544ed6leB5qFSl7j
	 9EFRUHXc6D8mbY7CfBkk3uVaClw6eXqataajYwg3jQ1PsjYXbe3/eUGAP/Q3lqHHyM
	 jMEeFBnwlwspob5PnwwsKoXIWToVXEy/J14kxWM2dlslF9qWIrcq/GLZGqt1eua0yG
	 eEshF1XuTX05Q==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BE3F56506F;
	Mon, 16 Sep 2024 09:51:23 +0800 (AWST)
Message-ID: <2dc5f4bea2fbafa4f69df6d9ba167b8b62794e57.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/6] gpio: aspeed: Remove the name for bank array
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com, Peter.Yin@quantatw.com
Date: Mon, 16 Sep 2024 11:21:22 +0930
In-Reply-To: <20240913074325.239390-3-billy_tsai@aspeedtech.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
	 <20240913074325.239390-3-billy_tsai@aspeedtech.com>
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
> The bank array name is only used to determine if the GPIO offset is valid=
,
> and this condition can be replaced by checking if the offset exceeds the
> ngpio property.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>


