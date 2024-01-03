Return-Path: <linux-gpio+bounces-1986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E93822CC2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 13:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D9F1B2136C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 12:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E3A18EA7;
	Wed,  3 Jan 2024 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="tR4LAQLy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8A819444
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1704283960; x=1704888760; i=wahrenst@gmx.net;
	bh=I8IbvcqJ/V4BVgfuSlOrsiazgtHjYr9gQ62c3psKhEQ=;
	h=X-UI-Sender-Class:Date:To:From:Subject;
	b=tR4LAQLyxKBUfz+ZvxYFcQP8XP8Ebu4geGF9w8ecH+tLIzayQaTgn1eOgU1AE4o9
	 onOAG1GO6sYQmE9fDxLRV1o8iJa1K5JijepdS0ApP0aZNynRZsFfyRZgqrF3B84uH
	 /nDvyj4n5LDw3BWiTwrHNEBTDZf2/2h56ckU7kNpCW6cyIomCKRPRmOTM7ej46tVS
	 gY8IkJRVIfjrV9i39mBnMmLRc7iid4bbGnrzg1R/68qSnmFrsZ4ReDU37LzSAPoeK
	 aQ1uGXmg4WJ0kG9n+EOmIiWWiBCfCU6GDjzF/zCaqytUpTY6l6Wipo+PvB5eDBUjm
	 VKD/sfxRFW0pMiV1qQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6Mt-1qmDG71vuN-00aDl5 for
 <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 13:12:40 +0100
Message-ID: <bbc667b5-366b-430f-afd5-fa8a9326d9b7@gmx.net>
Date: Wed, 3 Jan 2024 13:12:40 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-gpio@vger.kernel.org
From: Stefan Wahren <wahrenst@gmx.net>
Subject: pinctrl: Questions regarding pinconf_ops and bcm2835
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rYAG3VwmYe8HpGxQYKsyrV6OUtH/Ijl36po3pD3XCLNXkxDLFOY
 zq5AGvkQQvdUGu+1uFZ4YO0hBvOwV/Qkn+zgsMbhZPZjIyaVfWyTVotG796r11kQCvfK7QM
 WeAJSReUJ1nHvqvonH0vr0h5USijR8iSzwIEPZMfBPUbZyXCey3WOdEzyTE5c4wBB64m9L3
 fAqda9DpHXqfMM8JOOAjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lo6d+CFui6Q=;38E+iNXLnH0VymnssDk/eqv0ug3
 oytNOIXZn23CCWuaOWZka8FdHU/OEDzTxek25S7ofJD2C6olLk/1HVk1gsnWEyjLHX4NBPD74
 ZWuUqn+T7sM+pDJnfYlYpLg2Oj9AMN76jzzIcZVh4mXBE86EIYiIVKa4w6RMwmGKJxkG6UySR
 lDTTlcAyr//Zld5ISDlLdA1p3uEQitRec+7DSzKZ1bHqHaxGwm0QKLv7rjsu33syLOUt3fxWv
 gWaJeigPib7JoPbUrKVs0vGAma2GEfnvO7NvohpA9OGyERh0vX37j22h6tGaHckMafVO3eWnc
 i0PZsNlG2If0Z6S4jTDPEnP6EPDa9s6ciBInWYO/l4fq6bVzi0yyE0c+jal0O4ShpXW0WeGOO
 oW2r66EWnMidfqbcjS/D8MUbEl+k50tJkGrzg+4Y4mW5aKODB960weMbRQThGbdKBgsPkySvC
 2aGAG7xIl0Zx+fTzWyE8DjrfZFkmiFhjnKUr9cQoGao+FEDLsMUs9D4VM/KRNhYCnG1WqMGx6
 yGN7YrLz9pGOgyvXPUyCw3ZGPpysSdqWv8gIlwPOencm5tgpg6WdEKYApU91w+mYHyz6aV5fh
 yIaxMP5V1qQKXd7JLsT1KKcmwos0h72v/2KaTBd66H5+TjDyayQUPCQ6MOjvzUD7UUpT7rugu
 yyl4mEtCPPQdQ36YDNyzPQ0q20HAtA4VhweqJts7zSz9Eo9O2tVPRBqUoc8i74+IREPK58jjU
 FyeudiVG6C1zp0PGghmLNh+Zwz6VkgfJm209k9ND5Qi8rOvFo28Y6PQi+SVtEkNTuh90ftSKW
 9Daz7HZ7OP9hwes2d2HPFj6EqY38UAv7O/aTITHFuOw6WQ9QtQ9+Wwcipmq8jLq0qzWigd2Nd
 dmi4EL7yMKkS4rJTOcSV5g1T/kbogXkGTrkAHmK/x66EoRjMkVqEMV7jrrkRF/szst+5NCcyt
 EKaXOw==

Hi,
i recently noticed that the BCM2711 (used on Raspberry Pi 4) doesn't
implement pin_config_get, but this SOC is able to read back the bias
settings of the pins. After looking deeper into the pinconf_ops i had
some questions:

1. Are there any other benefits from implementing pin_config_get except
of a proper debugfs output?

2. Since the pin direction of BCM2835/2711 (input/output) is already
handled by pinmux_ops via gpio_set_direction, how should pin_config_set
handle PIN_CONFIG_OUTPUT_ENABLE?

3. In case pin_config_get is implemented should the parameter
PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_OUTPUT be handled?

Best regards



