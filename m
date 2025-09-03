Return-Path: <linux-gpio+bounces-25443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C4CB4173F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 09:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E99071A816EE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 07:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749BF2E284B;
	Wed,  3 Sep 2025 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b="aXiXgkj8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout3.mo533.mail-out.ovh.net (3.mo533.mail-out.ovh.net [46.105.35.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD67F2DFA32
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 07:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.35.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885906; cv=none; b=oVEE7BC7Ol+N64m0yuOPSg3/cSCfxAB8oo3Pn51PgqMpfkkfyP3NZ8e4avpEJIJ2oYCf7hys6BMnlWGRXPk2Uw8A4/VBZASY678uvkniayHxRMA8ltc0hMYNeV0tX7JTglmys0/Y8q+fHkvjBmS5DswgLElOeRadnzk2CNc8YYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885906; c=relaxed/simple;
	bh=663KoJU1ldM4IAb3QXT68+FeZh2kwq0BYEZ09XzUgbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLntWzIxum+51QFJgkmR3CUX8liyQBXxwKEUEaul3fzvqd8wltC7m+4+3yT5pfi8bq5PAykJk8k9Lzcw9/VdS1yHXVV5zlycp+KQVbDvkIZq6MBlObr+pRXB6NV7ZhPH0+5zcVCkqNl0VkwcoGTcCJ8mkaLdK/InVi18RHr0HpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b=aXiXgkj8; arc=none smtp.client-ip=46.105.35.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net [51.68.80.175])
	by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4cGvkM5C5Rz6S7S;
	Wed,  3 Sep 2025 07:43:55 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net. [127.0.0.1])
        by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Wed,  3 Sep 2025 07:43:55 +0000 (UTC)
Received: from mta2.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.113.54])
	by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4cGvkM1bbPz5vR1;
	Wed,  3 Sep 2025 07:43:55 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.5])
	by mta2.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 11D093E3354;
	Wed,  3 Sep 2025 07:43:54 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-99G0031b4fb290-efa1-475b-aec7-15426595f32d,
                    FA25AB0AA1A9BF3DCBEBCC83EEB30DB7881EF5C4) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:79.117.41.176
Message-ID: <4057768b-82f3-4b5b-b301-afae30bd5bca@orca.pet>
Date: Wed, 3 Sep 2025 09:43:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] mfd: vortex: implement new driver for Vortex
 southbridges
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20250822135816.739582-1-marcos@orca.pet>
 <20250822135816.739582-4-marcos@orca.pet>
 <20250902151828.GU2163762@google.com>
 <45b84c38-4046-4fb0-89af-6a2cc4de99cf@orca.pet>
 <20250903072117.GY2163762@google.com>
Content-Language: es-ES
From: Marcos Del Sol Vives <marcos@orca.pet>
In-Reply-To: <20250903072117.GY2163762@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17418515985921168998
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeforghrtghoshcuffgvlhcuufholhcugghivhgvshcuoehmrghrtghoshesohhrtggrrdhpvghtqeenucggtffrrghtthgvrhhnpedtgedugfeiudfgkeduhfelgfejgfeuvdejffeiveegteejvddviefhiedujedvheenucfkphepuddvjedrtddrtddruddpjeelrdduudejrdeguddrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhgrrhgtohhssehorhgtrgdrphgvthdpnhgspghrtghpthhtohepkedprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
 hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqphgtihesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeffegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=SBwCDNG5ruuO0roHhgmwKoJ1Cs1X4uZOY7er01eXoUI=;
 c=relaxed/relaxed; d=orca.pet; h=From; s=ovhmo-selector-1; t=1756885435;
 v=1;
 b=aXiXgkj81uCW4s1t3tuig22XwNhncczb1zlf7lPR+84igv15/kf8LVLteBOQ01F+GJOuDPKm
 hI0ZJaT0nkJzGvFgbt7vS2lnzzNMW9g4mUmfqsTRH7aT7xsw9Mb1LMZW4tkp00mYwDFFizhHY+h
 U9nozsL3rSTFfkkNM/hLQM6pzdT6bvBbubIBCakC8+Yw8ROg2MUA4r9iH0S8GBWH8GDYOwiJlTO
 SCgNcjGmH/PbAP+esraOOWqeMVC95PJRi6uIipBj7Ic6+0/dAGeIomhR7+WfQefFRMp3g+TQiR7
 MomPGPaAMDx7KrUNPSut/VtviZqyI6SXauSVYHejum7ug==

El 03/09/2025 a las 9:21, Lee Jones escribió:
>> vortex_dx_sb are "struct vortex_southbridge" type, not raw MFD API data.
> 
> I like your style, but nope!
> 
> vortex_southbridge contains MFD data and shouldn't exist anyway.

I'm not sure if I follow.

You're suggesting not using driver_data at all and using a big "if" instead,
matching manually myself on the correct cells to register against the PCI
device ID, instead of relying on PCI matching giving me already the cells
structure inside driver_data?

That seems to increase code size and be more error prone for no reason.


