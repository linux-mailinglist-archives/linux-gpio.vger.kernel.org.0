Return-Path: <linux-gpio+bounces-11029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 866EB99430B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 10:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90C95287296
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 08:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F78C1C3F1C;
	Tue,  8 Oct 2024 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="StnbA0xL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B883E23A0;
	Tue,  8 Oct 2024 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728377366; cv=none; b=oDwKuxuDqTKjPz2I9FrDQEsym9aDO8k4Ne8oUTwy+BI4VdS1KIJUe21OwcFoxxgGIb0OhU3tg7SxPL5nnF21gXVgiu1IcNsEvjcx+/q1ntZc8KR9EX+TvaW9S2EeQF3XBts4DXQ4jMR8Nce7G2trD2R3aIqhsW5/wVu9xV2l+iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728377366; c=relaxed/simple;
	bh=/l/VCM8P/tqLz/LGzZ0KAl22YoEU/fXM+/C2NF7cqFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGk2U8fV3eZVaY75bP4bB5SJT/ayWbcRg+aKymLF/pV3gy00Ljggxmky8Y68rUAXGuTmngtWZ/ruS9WTeGcVqmhjrGqyg+AuZcbj2XT5eWt9TzYcJlAtFqCMIA1XxlcnUR9UBMDMQrt7CvVIGVHyuZaYiErXR5pAleWqp/9xiAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=StnbA0xL; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9339623FD3;
	Tue,  8 Oct 2024 10:49:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVFrPVHNPkMC; Tue,  8 Oct 2024 10:49:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1728377359;
	bh=/l/VCM8P/tqLz/LGzZ0KAl22YoEU/fXM+/C2NF7cqFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=StnbA0xLmBFhMjaBJ4+1l+FeBZrffSvndACehw8BWVKdccuNoR13CjxsHtJbQpH4W
	 o/VjlSMP3dh7TNc4J8D679gGXAYYDhNFm0D/3ZBiyE5//gkcFnVFiYyG5OyUPGrtex
	 9pzuKx/Z4WTyZTgqVS5/uGFVy11HeYGFBWQSkij+XglBaXfwm8ih8PPaDa/3pkTV11
	 YJLO+q+j4jS/oyphBNRHZSjkBHI1sr1GPN6IOUzGyT87+XQNw5S1b0l03QwJP2KYH2
	 DUrKGTpHbjdO5RlhpK5sYA7r1zK2tLXqaDaPEtE5EhU4JH4qetgPmr+RlD61JujUXa
	 bGTh59MWWAZgg==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: arnd@arndb.de
Cc: andersson@kernel.org,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	exxxxkc@getgoogleoff.me,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linus.walleij@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mturquette@baylibre.com,
	robh@kernel.org,
	sboyd@kernel.org,
	will@kernel.org
Subject: Re: Re: [PATCH v6 0/5] Initial Support for Linksys EA9350 V3 (linksys-jamaica)
Date: Tue,  8 Oct 2024 16:47:44 +0800
Message-ID: <20241008084744.30819-1-exxxxkc@getgoogleoff.me>
In-Reply-To: <ad82005d-729d-4165-afa5-61ca82382bc5@app.fastmail.com>
References: <ad82005d-729d-4165-afa5-61ca82382bc5@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I dont have the uboot sauce.Also i did ask for the gpl code via their form and they putted that in the site that u sanded.I tried ask for the uboot sauce via the live support chat but i got nothing back.Maybe i should use the form again?(linksys dont have the uboot sauce in the gpl tarball of other rotuer as well. i guess it is the time for fsf to suit linksys twice? (See https://en.wikipedia.org/wiki/Free_Software_Foundation%2C_Inc._v._Cisco_Systems%2C_Inc.) )

Also Other linksys ipq5018 based rotuer is capable of booting arm64.maybe i could rip the uboot from those rotuer and flash it to ea9350 v3 but i dont have another linksys ipq5018 based rotuer.



