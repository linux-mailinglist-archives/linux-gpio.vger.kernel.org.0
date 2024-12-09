Return-Path: <linux-gpio+bounces-13634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4A9E908B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B297A18851E6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 10:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2788621CA0C;
	Mon,  9 Dec 2024 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="nFx7FiiC";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YPXwI4Rp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F20219EA0;
	Mon,  9 Dec 2024 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733740602; cv=none; b=JHZPwc6nFXzTRv6EMec5j1uT28zXJRXb06HIitJb3Uqp9NUZoRwhGFzAxi5C5C0xIq5voh49MMUGJUTT/DQKjdn1rZuGxC1W79bYgSBAkmREX8VI9Llh2FVlUwWVmFbBjTKNAzXGr/CNNqVuHvqfFdSDP8BzdM6eoeoW7iyKJiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733740602; c=relaxed/simple;
	bh=o7nEo9LYRiQ2Ltda7xmriw26ordD9baqdoe75Rd49OE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iJJ0APM2CPv24jAzBKqX2XNjq/Z30CqhuaC5sBzfA4cVVf8qjkvP8m2Px6sfTUFnb43slz5/Nzd1kGvoQKMy5YYT74WagaMWr2PoqXkf+y9G4bkdsgzv9V0MlSdj8/BgpV4Hwk83aJCxzh/6e7YtL3KD45ZB4gYqZHzFa3AIh5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=nFx7FiiC; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YPXwI4Rp reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733740598; x=1765276598;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LCAPH6wirBXXyZpyVhz3TAfBUwbEjX05N7UBoCkCOnE=;
  b=nFx7FiiCtyh0Wa5Gtufq4g5JUUIfkPlDfVZb+Wqk986cdrytIuX3bXJn
   YHdxfVUSVIZrhQHV3EslP4Hs/Iu52iFGqbv5ZbUDeXVzDhLFdt3d4OFSs
   4iJ0sggPJv4ozo6GPiBa/O0mWUiE7Fn1l+W4b9rbPBibZtRwyVgXAWSN0
   JV7PU3c/NEh6WQAUJ6hL/jOy26FH1oY9qi/B3VxJord0Rk88PZBd3IrSu
   3OD+SRwVm2NPWVjl2Mv7s14U1aeJtq1DSdjTCB4s1tKWCxceafMopQ2kx
   1NzjgEqPuVplsjEo+kPMPzXreJheBzn5wm7p9QYla2vO/j4qZC2w7PDjt
   w==;
X-CSE-ConnectionGUID: o6ZG3EIORO6iwKyHOnslxQ==
X-CSE-MsgGUID: oZRKgbh5SL6h9iS6RGAesA==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40482999"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 11:36:35 +0100
X-CheckPoint: {6756C833-51-90CD5875-E0265C0B}
X-MAIL-CPID: 8F6127AFBBFEA355CBB14F7A369993AC_3
X-Control-Analysis: str=0001.0A682F20.6756C834.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01EF21666E0;
	Mon,  9 Dec 2024 11:36:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733740591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LCAPH6wirBXXyZpyVhz3TAfBUwbEjX05N7UBoCkCOnE=;
	b=YPXwI4Rpl2Rad6emdD/6sloijiaBOrubnKdCGVhPRjmAXTc86b2jPfso1cxjGn++Y6rp5w
	pguA8CukOauuWn0TQxbcv+3iR6/0cbg1z6v6v2GTQGxX7AZ9InBv7vWx3uHemXMbVS8NO2
	K8ObgP5MgRGN/GFS9AqDTkaNXjkW1DlRN+2E0GWh/UGSa9jSH9DZujy0sqkICt4kT4CQ1U
	iSpU9CDa731vcZWBn5zRWfM/mZzq4e9WGztuwScj1XVS0c/teKmOOesAw8LKTwtFpAKxu1
	K83FVY2HL9ry0LfNjFds7J6P0UEnZTqLOP4lhb2dz2ocV44ekQjH00xpSfyjlg==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 0/4] gpio-tqmx86: cleanup + changing directions
Date: Mon,  9 Dec 2024 11:36:07 +0100
Message-ID: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This is the first of two series adding new features to the gpio-tqmx86
driver. The first 3 patches are cleanup/preparation and the last patch
adds support for changing the directions of GPIOs.

Once this is merged, the final series will add support for new TQMx86
variants (SMARC and COM-HPC) that feature up to 14 GPIOs and full IRQ
support on all lines.


Matthias Schiffer (4):
  gpio: tqmx86: add macros for interrupt configuration
  gpio: tqmx86: consistently refer to IRQs by hwirq numbers
  gpio: tqmx86: introduce tqmx86_gpio_clrsetbits() helper
  gpio: tqmx86: add support for changing GPIO directions

 drivers/gpio/gpio-tqmx86.c | 135 +++++++++++++++++++++++--------------
 1 file changed, 84 insertions(+), 51 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


