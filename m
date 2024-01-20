Return-Path: <linux-gpio+bounces-2371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5A48333E4
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jan 2024 12:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EEFD28344E
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jan 2024 11:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE55DDB3;
	Sat, 20 Jan 2024 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="DirjJnhT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D74FDDA8
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jan 2024 11:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705750473; cv=none; b=FsC7LizZJbeStdaPe+tFc9G4GreeWafb5uLwlEc3DFgnMmsbnfCa7yxuNfhwQOXCaNB3PQbUS+MTfD7hORcmwT0rtyLAVryOxTcvJ1agR6Iz39zrMcBGHnPIc4cHewLZioj0zhRPCfoyv2un80KPwrh+gfeo0QxnLeaptkCBxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705750473; c=relaxed/simple;
	bh=I8IbvcqJ/V4BVgfuSlOrsiazgtHjYr9gQ62c3psKhEQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=IqXkGwwBIn4wrXEJ6HLtRquxP1UXzCCYa+vPkkCZRz6W4WlGLpGHRaUONHj2asP4aEUG1/yOD/InRO8uGRHmkQrqB/0n2+rqZfhHZ9h4/AkIcoYuPQA4d4W9AqD58zc4fPNUKyHaty8FiTNTn9uSc/Pn1fo1IE8LoEuNec9Fbl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=DirjJnhT; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1705750468; x=1706355268; i=wahrenst@gmx.net;
	bh=I8IbvcqJ/V4BVgfuSlOrsiazgtHjYr9gQ62c3psKhEQ=;
	h=X-UI-Sender-Class:Date:From:Subject:To:Cc;
	b=DirjJnhTcqOslKk7/AeP/R/ziFGBaqyO/fEf6hCPB4hrzplI3E0omp5KJDHf5hgM
	 Sm3Gz70vu7x6wvSC/f/G9SHGM6nIIF2gz4Awqp7w+hPSnx6cZmBI58KxhO405iY4Y
	 ops+O3gCWAl7SXamcuhZy2YwvJYf6T3Lwd9Tx/a6bh1lckG9vzxw4arh2rCYLGvmp
	 WuITq96bwffz3v4uVTAcHcNx/Np7esY/0z+s+LiDdrvdeObjINkRGE7SBV9g5vZBY
	 XKGBB0IAQwThmPj7RXY+r+GR7Ka4IFyEGiPDkFSXzOBY0nhZM+j8kyCx97+JgEro0
	 rKPrpdFrOntcnpwUFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWASe-1rbe0H3Owc-00Xeeg; Sat, 20
 Jan 2024 12:34:27 +0100
Message-ID: <102ae999-6574-4b14-a24b-826533b47a5d@gmx.net>
Date: Sat, 20 Jan 2024 12:34:27 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stefan Wahren <wahrenst@gmx.net>
Subject: pinctrl: Questions regarding pinconf_ops and bcm2835
To: Kent Gibson <warthog618@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Language: en-US
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nuctsur8ybVZoIxBNPmwULE+9iQQXZYGEdYruvRocbYKvKniIYy
 ZaJ9rjycRRcS7cLIXnv+gAvIkruOYIqQKm4hZnBXkBJsuLTLdq8B0sOuOEoaaXTDLAM6Ppu
 llDixpZ4YvpfpmPNgF3OWy/mHu8uZPIZb+PoUZMzruyDRQhlGjijeiuFxr6/octdW4sBiBB
 NzlhneWjy8CtzSbKj+7CQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KuRKiYtFsQA=;jHMfoLsLU7rSakljjBoV/39He+f
 z7wyoF+4zIub7B98bnUg00EWJdWSQbGyKdHGjRO6n2DBU8PlELBRfRCX5gTn80p76K1gleraN
 g5Pe1IBePuJiyrZWHks3ntD1uHXriccYSITnLyXy6aCTLdABt7u9tjQPDEO9fSrX3/LI3xjrz
 quqegMxA7eYTNp12wBodFapwa99KCdx1NLGfdu+mvMMsX0l9xn2FyxEXxMhCUK0OE+M//F1Mt
 Qje2KSQlDDAYRNxkTD6h+xAPOnmymByCIBmqWiDBynJ6PCxyj4s4BrQOxVaGO009D8BYz7GQX
 aEYs49sXztlqv2maDauaWtp0ey2tn/Pjug732rd+iTIN0lNg3Ykg+RX2Aelmi1U4PTCJlbzCF
 Cc8NDqqjfZYowUTxaTGPL/n9GTFTgnTN8ThXcKXLSd5QevZNnah7W9jSwDzyG3tulzcovwg2O
 vRbAIp+J+I/9E1PJuZBcGxwVAyR65bJseKgRLotdOEJK/L8N3ougWMOOFgj8jbNi37lenY+pe
 lnR8tjIzJ7jjUSeIBiUzZ6XDnYAUyX5pJCTh9iq3S4fWSxThrmZcrjZJUF+GBCQJBQpmvB/AH
 uzmSExVyQqGnQoeCk2+gTSgiO3+jX7xP9tgToBA788kZnvYKD70VkE3NfpgL4/OHomMgbXvYq
 kdCQRn4WeSlKQ/IAQxg00qa24mf6kfotlnCzjHCcs2wsEZ8kfA+/sAIO5xdVmKba45RrYxpGp
 5kjkY26plPnw9Nf2rP4cWACR4AEdfiTziVhoYnU69a6bGbs7iX4JQieEA/eCXrNZMuoemF/EL
 6xA+MUq0CHmrdZCL90JnGyo/O1gWIQVPDF5R4Lt0C5Ez9XCNmjI8vlaOQzh8zC55Kw3affUQe
 DpkSViY94eWf2YKO0vD2l2PAwONr8WpKNdxPsggmhiYPdjS/HIWFSVAF5yMdj2uP3tMDKOsil
 MciDzPCwbU8hwFx7dO6MIP1cUCQ=

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




