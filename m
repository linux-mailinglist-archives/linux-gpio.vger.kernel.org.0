Return-Path: <linux-gpio+bounces-23956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C71E2B18221
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 15:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41FD3189DB8B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 13:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EA7251792;
	Fri,  1 Aug 2025 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="leL8Prvo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4FC23B611;
	Fri,  1 Aug 2025 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754053471; cv=none; b=fthHkoxdsEu6CYAfmnp5L/Ih8VmSazK4yB3cWiHUjWUJyIlBh275p+Mj/T0SEhvPqqO7JSoDnrjsStP2viWNSktfLyX4nZXWE+cuQJS1ZgH3/zqjdNDLoEPvwu8g/Ps2SbfAHO7yNh1cmX+Lz+5hcl9bATrPqMIYR00ajwH3rV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754053471; c=relaxed/simple;
	bh=0ofQnYkYP1zm9pb/GPwWwKnVLvTK+tBM+9AqSedKsCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ictewXkqkS0PACH9g2lFMyo1LzbM60crrPNepM54paOZn3WED8RdG/9IexmHkmSryr51hQQ4Qg/tVbZYL2yj4ppugmrz5FGKjQ3Mp2TsJ7EzSkjJN+gZ9fSvaN10cayJHZywvJ+RENGXm0ikdXwhYclFaSv2rdx+AwogkWzmrVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz; spf=pass smtp.mailfrom=dujemihanovic.xyz; dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b=leL8Prvo; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dujemihanovic.xyz
DKIM-Signature: a=rsa-sha256; bh=0ofQnYkYP1zm9pb/GPwWwKnVLvTK+tBM+9AqSedKsCw=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1754053454; v=1; x=1754485454;
 b=leL8Prvox8goe7kSsHPdB3r5gKN6jipe+BC9yjECFUNnB76ctnWjQGG80JDSlzG4ddVxFe+7
 VufFj8WgHlUIZYLqD3NHSS7MFTLiDt0trElyvo24SmYfTaoE9aUzaRAQiN2PU414yAUy2Vp/ak/
 Yq9wTlJwQAOSDQMEoPoUpXdAe1EblAMJ4xW+olySYeF4qsspg7SVhhVYvpkaARx0XHNRo0CMi1S
 k2g/pfYFMHG9asAt3sFhTs98MoUwNNphwOSQwDh7dVWbWll3vYnC1ScYfbC2LL8l901Pu3502QS
 5hpQPzzr5LfNys7FRx9tH4iSgTgIgmziIniX4sjBEBewA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 50e07a10; Fri, 01 Aug 2025 15:04:14 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] Revert "gpio: pxa: Make irq_chip immutable"
Date: Fri, 01 Aug 2025 15:04:13 +0200
Message-ID: <5030606.31r3eYUQgx@radijator>
In-Reply-To: <20250801071858.7554-1-brgl@bgdev.pl>
References: <20250801071858.7554-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 1 August 2025 09:18:58 Central European Summer Time Bartosz=20
Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> This reverts commit 20117cf426b6 ("gpio: pxa: Make irq_chip immutableas")
> as it caused a regression on samsung coreprimevelte and we've not been
> able to fix it so far.
>=20

Tested-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

Could the fix be backported to v6.16.y?

Regards,
=2D-
Duje



