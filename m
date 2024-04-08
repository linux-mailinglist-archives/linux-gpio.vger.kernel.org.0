Return-Path: <linux-gpio+bounces-5182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA3189C77F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 16:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6396B277AA
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 14:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B8C13F437;
	Mon,  8 Apr 2024 14:48:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8185E13F43C
	for <linux-gpio@vger.kernel.org>; Mon,  8 Apr 2024 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.25.134.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712587686; cv=none; b=gK4/oaBP2Z4FiSKs1z0Qqofdj68h9h6e1hg+a2VTrMAGbiXMoG5w26khDaRF2AwKKK/C13hBI4XDklmP1+SWHtywfcZebkcSqY8+RmZfFfw9wMFtx0K7sCgUMeZC257OKj1XMrnZH/LuHCoZKC6TBijHQA/8fukPAH/ZLGuA9kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712587686; c=relaxed/simple;
	bh=cYchh2G4kde1skkQmV7ig5I+bgekn/LsTGKAd//ZgAI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=NynOyoAFHYQ5Z4q0LGF2vZxuklrSvcybZHwQYj9VAuRRPkyg50+c3IyZqYuoZp3/DTfqV8JqMHLLW4WSJ6XtBv1ie0h5ciWTCOn7IyXZRH+SIRJAWtAz4vsmabIhH2JAww9KIW6sbMkk6ZWTcbGzCCeBNRGQK6m11++6WWP/MkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de; spf=pass smtp.mailfrom=t-online.de; arc=none smtp.client-ip=194.25.134.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-online.de
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id B643B2F028
	for <linux-gpio@vger.kernel.org>; Mon,  8 Apr 2024 16:47:55 +0200 (CEST)
Received: from [192.168.0.32] ([37.4.231.157]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rtqHq-1MUxmb0; Mon, 8 Apr 2024 16:47:54 +0200
Message-ID: <02ee3fea-5099-442e-9fcd-4167c7bb4a80@t-online.de>
Date: Mon, 8 Apr 2024 16:47:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-gpio@vger.kernel.org
From: =?UTF-8?Q?Oliver_Sch=C3=BCtt?= <oliverschuett@t-online.de>
Subject: libgpiod 2.1.1: Installation under ubuntu 22.04.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1712587674-077FD915-F5D9A663/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a9b2658-95bf-4447-8630-2f352f9bbcba

Hi All,

i am currently trying to utilize the GPIO pins on an embedded plattform,
a PicoSYS PC with a Fintek SuperI/O chip and Ubuntu 22.04.4 installed.

For this i want to use libgpiod and gpiod but i am very new to this and
wondering if you could kindly give me some guidance.

I downloaded the tar.gz for version 2.1.1 and extracted into my home
directory, then installed autoconf and invoked the autogen.sh installing
it into a dedicated folder in my home folder. After make and make install it
seemed to install just fine, i could call gpiodetect from terminal but
it gave me an error: "cannot find GPIO chip character device". Do i need
to install it in a seperate directory or am i missing some 
driver/dependency?

Thank you very much in advance and with best regards

Oliver


