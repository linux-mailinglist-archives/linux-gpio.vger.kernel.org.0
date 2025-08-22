Return-Path: <linux-gpio+bounces-24831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50935B3203B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 18:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79A1F3B8577
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 16:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6492571B3;
	Fri, 22 Aug 2025 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b="R5ErbakN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from 11.mo533.mail-out.ovh.net (11.mo533.mail-out.ovh.net [87.98.181.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7432405E1
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.181.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755878923; cv=none; b=bO7RKQiIUM5oJOhLNn+PQkojV7ac0ipUtOL7PSugS/BWm5mjfAGy1OQHQW8ydDyV6iKYRtMCUiMinspJRw2fs+Lxh+fR0hWacevztK56yR4mM+LS0ZzXriM52Kq93VgvrpB1y6UabSKlRKTAjsZzRY/8XYGRdhnEPN0Pxvr/wMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755878923; c=relaxed/simple;
	bh=Muy7A70ZsK2eQRnxqNVYMyvIfA2QXop/Nofswsm16qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVB/IORpYoDmAnWxPelJIqVQwXki5LOPEZCPaW/DtvTc2UOMdqsv+ZG0UOdKjPuygkJhBHQM8DhjF19OEZbj9MXogbzD1ceYS9UUqKBMa/+rGQZKnLk2Y42s/cOPa6RGkfDGZx9iGPpkOPjDMOYgTULel9O7tbaJpxaAEnWb650=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b=R5ErbakN; arc=none smtp.client-ip=87.98.181.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net [51.68.80.175])
	by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4c7lVG4bgsz5y8b;
	Fri, 22 Aug 2025 16:08:38 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net. [127.0.0.1])
        by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Fri, 22 Aug 2025 16:08:38 +0000 (UTC)
Received: from mta6.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.118.160])
	by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4c7lVG00x4z5xT3;
	Fri, 22 Aug 2025 16:08:37 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.6])
	by mta6.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id BB32A8E32EC;
	Fri, 22 Aug 2025 16:08:36 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-101G00461199434-89d8-4298-bfef-9cf54b1e3b55,
                    ADC0680FE15BB91110492B9A34CE42AA242C155A) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:79.117.22.109
Message-ID: <7c325631-c209-4df9-a259-4b9c4e545f87@orca.pet>
Date: Fri, 22 Aug 2025 18:08:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] gpio: vortex: add new GPIO device driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>,
 Lee Jones <lee@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org
References: <20250822154903.GA685390@bhelgaas>
Content-Language: es-ES
From: Marcos Del Sol Vives <marcos@orca.pet>
In-Reply-To: <20250822154903.GA685390@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10810327957363381862
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieegvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeforghrtghoshcuffgvlhcuufholhcugghivhgvshcuoehmrghrtghoshesohhrtggrrdhpvghtqeenucggtffrrghtthgvrhhnpedtgedugfeiudfgkeduhfelgfejgfeuvdejffeiveegteejvddviefhiedujedvheenucfkphepuddvjedrtddrtddruddpjeelrdduudejrddvvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhgrrhgtohhssehorhgtrgdrphgvthdpnhgspghrtghpthhtohepledprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehhvghlghgrrghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrh
 hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqphgtihesvhhgvghrrdhkvghrnhgvlhdrohhrgh
DKIM-Signature: a=rsa-sha256; bh=AGiF7sh4zThSv7GNcqRgASdL2+wKj6I58TlLd/g5bR4=;
 c=relaxed/relaxed; d=orca.pet; h=From; s=ovhmo-selector-1; t=1755878918;
 v=1;
 b=R5ErbakNFYd4tWQVZSxIMyxRTfyYn4y75LTbQiiwt5NlZbGebT3sZFj3d33tv51gPQoxxOP5
 ZtGifOwJsAawg4EFc934hyUEa+qbtuk1o+15vzN6BIoGb1hrmdvhlir1uR/3IGFaWE6TugxbOaK
 EBWpqiLO/ATW9nHM/tfdiPR50BP2VvDM2jwCIRW3e7xlhGAdQUbDKsBsRbtq49z0Kja2H97YiK4
 MRV/w4MrP4TVrFBdXjUp6QOUc+KRmQa8Tm7JkFiQgVVBZ1M2ukg/3cx291pun39qqY+olxIYy0P
 H1D18nF3mwfhNCVCFkAbaRKwHMlRXqfFRqUUXFjpJ097g==

El 22/08/2025 a las 17:49, Bjorn Helgaas escribió:
> On Fri, Aug 22, 2025 at 10:47:20AM -0500, Bjorn Helgaas wrote:
>> I'm not the person to merge this, but my advice is to wait a few days
>> and post a v4 that cleans up the includes and updates the commit
>> messages.  It makes the process cleaner if the patch you post is the
>> same as the one that gets merged.
> 
> Sorry for the noise, should have read farther through my email :)

No problem, thanks for clarifying!

I would've waited for a couple days more to give more time for review
before the v4 if it was just minor styling details, but I found a nasty
surprise yesterday in the DX3 programming manual (I was using the SX/MX/DX
manual before): it has two discontinuous ranges for data and two
discontinuous ranges for direction, and the icing on top is that
*all four ranges have different sizes*.

So as it was a pretty big change I wanted to have a new one with support
for that for review asap :)

