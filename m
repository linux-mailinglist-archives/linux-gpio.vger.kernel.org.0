Return-Path: <linux-gpio+bounces-8287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4606C935130
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 19:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 772941C21FC5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 17:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD3114534A;
	Thu, 18 Jul 2024 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="tkbCql1Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCC2143892;
	Thu, 18 Jul 2024 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721323072; cv=none; b=OSe5FrvD/8y6UcX8DNm7kN0tvbCUjX5LpbCOFqIU7EWhdg6nAFz6/N7VE92ZbWCWTjUUkBreMfCAb99ygN2xPH0WmHhrC3t4GH5psDg71SYx4VSolxDzyd91qtmTC8v0zI14Xil9mfGP3XzdhTjQWVDTBrw+E9qMhN8PyhVDVMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721323072; c=relaxed/simple;
	bh=oLBs7BK0hgANmIAl32bb1XgFQfY3h8Gfa0QUn86ly8E=;
	h=Message-ID:Date:MIME-Version:In-Reply-To:To:Cc:From:Subject:
	 Content-Type; b=h9iTogiv+WeeeMU3b/YzMysfpLv2IL5A63KLyQFZY7pTlTvPzFiBY7HBj6r6rS4LdLvahvtgm4ZAZvvykHbPhonCikN/N7SpHG+x3BOpvQp2IgCL8GSUK/SB6ilJc0s72DGMuMTMcVechEMfBo4noV13pvGsL7Z6npfZSRy73fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=tkbCql1Z; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1721323056; x=1721927856; i=wahrenst@gmx.net;
	bh=oLBs7BK0hgANmIAl32bb1XgFQfY3h8Gfa0QUn86ly8E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:In-Reply-To:To:Cc:
	 From:Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tkbCql1ZSKhm66hxtB5p1v7heB5MuKodRvVwf2o8NUm9cY9q/MMsnzyDjNcxtiFh
	 7TMOTXDO2xpn7AiL8jWSIj2vP/P2O+UAi0CU7D2yKZczer/fZTGYJc4Xe9NkPWBO2
	 ANslB33ZwAxrboPi89N+1PaVTineXnyPTQLFHvTcKPu4msPQs0UfU1cCmaWUkXO1D
	 ++lfMQRCLV+4pzcedBrFpPDXmNKlb3/JHqM7ywB4RtAmmGKM6xRjlphRWpPTf/xUD
	 oE5QoQ+yyg1VJ8yri35JjoVivhKhuEHgd3U+s18/KOfZNdEDUOKB/HVcfVMIwzQg1
	 gztejd8+eKRG3YuVWA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYqp-1sB20B35eV-011sVg; Thu, 18
 Jul 2024 19:17:36 +0200
Message-ID: <8c42a979-2244-4862-9c18-4a658ad258e6@gmx.net>
Date: Thu, 18 Jul 2024 19:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <20240117094453.100518-1-hector.palacios@digi.com>
To: Hector Palacios <hector.palacios@digi.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, linux-gpio@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org
From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v4 0/3] gpio: support i.MX93 truly available GPIO pins
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:v6JvCn7AHgoIYySf+r9Dq9dSmR3riDPxjxOm1Yn0WV4WvzV3Vm/
 wRcIfWnVym3ayvoomI8XUQ9lE2xOGMoha1/yzf5PgqzYvGTT1PGm7nuQYyeS6nICw9eqEPz
 jlWKA6rUdWSRQDelcoo0FDq+d5cvGiparEOf7lnhOjzaj7QfMHav5934u5wS4aR2neVjRik
 naJ8Id6kB9zF7i0jA2MZg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4X0O3L8vkLg=;jieTnQPhS5RV+HS5/2cNyoxG77A
 3s0x28xFkSh4+HHSVc3q33DCiljTYT5urcGoCyKMy3IUcVGmrRkUnegQOOdwLA3zRKtgd7Qe6
 uElhzVoPFUlC2Kd4pqqNzB5MMiyFoo2weGIn6YDterASKad+QBfkGd6iG3WbRj8+g9rEgtUNz
 AXiWyp8y8uAImYAX8oiwpWbD5IJX2xCwItcWb+WuYCUDSSVpyaPQYLdnn/yIY+H8aqXKapJ6O
 eWz4ChZkYXYbgImJTc8IJIhK5pethQvg5GLO5vM9iD4KtcJnGNDv/HdPhMA2+Qk0HIWP0TmCE
 GH85vhIC5/UiuZKp4Tr2fjk5LCL2sehtZCg4Un5lf+98aAfPjPR6fBDpol7nwaPbLrPzxV23R
 u6UtVQXZ/uiSYmTdRUJdTmNGVlHXIJubdEq4YzfwWsBKGqoyd0MJsfYZDzj3H8Vq8eU0ijPmc
 15pgmEI4ar9ADWPgSW8hVoAWZ70trPjf3uOQ8RpiK8dUBBTRYqJFR51jEwSMAWJUlqAGbLdgk
 spk4piN1ttb2UzMdXPmr4d03gIEKEjLW1kKKPuACwVT2Ye5sHVjRf+oZQHA58lfbGSHuuCRtd
 jIhRaJXsiovuaKAdhMor2i147Wbi85N+KnzqNK+6kDfpkn/Dlj6Fvh99dTfqNYTr7aO3HXtJB
 tLoMKDcuq/3/vCo18QR+BpcmR2ffLEZfWj4D0aYAohzIOhm9701aXNiiWb4TV+ra5OhFoWrE7
 95fEg7BXb7eTk1LTQU7T6ByBhpB0uKGhD+GA7AT3xVCcsADz/0XtWVvG8Xvwh+hjFqIpLBiKC
 RKIUut8+AO/fxWj0uhIXYd7g==

Hi Hector,

thank you for working on this.

Do you plan to submit a new version of this?

Regards Stefan

