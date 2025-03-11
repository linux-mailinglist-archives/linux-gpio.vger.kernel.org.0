Return-Path: <linux-gpio+bounces-17412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD78A5BD15
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 11:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EFE1175E89
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 10:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936D6230BF3;
	Tue, 11 Mar 2025 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="wiVwRcDY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1C723026D
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741687247; cv=none; b=oCtAX7xSCzYsyRzoTMCsUJLJEMOW4LNSE9h2SpdYH5NrHLg7jDqLN0nJRVDPaCizmw6UGaXFnVekCJ6zvDY78SxH1NFEtgvFP3CYs/XXAlDQd/KG5eaeOBayXm8ZzndSWaJoRPcdWp8actOy1h1d/3q64z/sgfTReI2jvVxR5ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741687247; c=relaxed/simple;
	bh=bzjSQ5ENJ8OEhyg7dH8NU6moLNSi+xkMfXAZBJZMBKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VuqQ9jCJO9ai5RxvKoVnamOdtRtqtyy996JvKnysobZ5+fjYczrZCryQDgn3qJIIiYBZj2VrPAXjBcfvn4Ig03f7iooOV4Q9b4h1YvwUVbVnWTo4SQK+vpblJBKzQiiAZA0iRGMWP3fWQwbQugdIAQS0jSDd5KxNww9sp3CgQsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=wiVwRcDY; arc=none smtp.client-ip=94.124.121.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:message-id:subject:cc:to:
	 from:date:from;
	bh=66TijA0IFXMJXHqHmJ3sBpcg22+/3uWTnc3GQ04Byno=;
	b=wiVwRcDY13LoE2Mt0d+TQTljVU4lsoInuxprC9CtsFnP31NtFepJ4si28sQBvRe+vm5C4BtbFbiVO
	 9H7CWucU0/o/iyR3LPdVWE3b7oNOx+epwTzHTIps9tOmsJzKrBF0GMBIF6qsRLXvt4aGvnvJURHHgH
	 N1QHETSG/QRsUu6tw5ZP7XAduI+YaZJc/alr4oo5NP261NuWqMe5isS5fqwhsERLuHgHq4dk+FBtzS
	 tEbE7e/Afibh7n2gOfSkjReG/mnRKxyG8wveISTS100+Gvw/QfpJcMK4s9OMIv9sRrIAtBAIHNl7jw
	 iPLFurW6wHBr6X5Cx2y/yVKkEVqvTAA==
X-MSG-ID: acf174dc-fe5f-11ef-8b4f-005056817704
Date: Tue, 11 Mar 2025 11:00:34 +0100
From: David Jander <david@protonic.nl>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
Message-ID: <20250311110034.53959031@erd003.prtnl>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Dear Bartosz,

I noticed this because after updating the kernel from 6.11 to 6.14 a
user-space application that uses GPIOs heavily started getting extremely slow,
to the point that I will need to heavily modify this application in order to
be usable again.
I traced the problem down to the following patch that went into 6.13:

fcc8b637c542 gpiolib: switch the line state notifier to atomic

What happens here, is that gpio_chrdev_release() now calls
atomic_notifier_chain_unregister(), which uses RCU, and as such must call
synchronize_rcu(). synchronize_rcu() waits for the RCU grace time to expire
before returning and according to the documentation can cause a delay of up to
several milliseconds. In fact it seems to take between 8-10ms on my system (an
STM32MP153C single-core Cortex-A7).

This has the effect that the time it takes to call close() on a /dev/gpiochipX
takes now ~10ms each time. If I git-revert this commit, close() will take less
than 1ms.

10ms doesn't sound like much, but it is more ~10x the time it tool before,
and unfortunately libgpiod code calls this function very often in some places,
especially in find_line() if your board has many gpiochips (mine has 16
chardevs).

The effect can easily be reproduced with the gpiofind tool:

Running on kernel 6.12:

$ time gpiofind LPOUT0
gpiochip7 9
real    0m 0.02s
user    0m 0.00s
sys     0m 0.01s

Running on kernel 6.13:

$ time gpiofind LPOUT0
gpiochip7 9
real    0m 0.19s
user    0m 0.00s
sys     0m 0.01s

That is almost a 10x increase in execution time of the whole program!!

On kernel 6.13, after git revert -n fcc8b637c542 time is back to what it was
on 6.12.

Unfortunately I can't come up with an easy solution to this problem, that's
why I don't have a patch to propose. Sorry for that.

I still think it is a bit alarming this change has such a huge impact. IMHO it
really shouldn't. What can be done about this? Is it maybe possible to defer
unregistering and freeing to a kthread and return from the release function
earlier?

Best regards,

-- 
David Jander

