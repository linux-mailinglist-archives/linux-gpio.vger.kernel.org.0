Return-Path: <linux-gpio+bounces-8286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A076B935113
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 19:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E30D0B214C2
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 17:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE75144D3E;
	Thu, 18 Jul 2024 17:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="D1rpZxd2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28EB47A73;
	Thu, 18 Jul 2024 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721322527; cv=none; b=n9adUzEjUCTTI82bVsVfmE4rCtHuU094arj0Nn/jvPoEQpKo/7TACJWlMlYMGjNUfj7s3XfSxAV0GneZn7apYpln5pOLjKI6Sx/SXzvbtGZjSWcFmKDWBHqrUAY4QUMxvHIGhHQdWR8uTTymkETeRTC6/XUK8QHGu1v7m/xwsyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721322527; c=relaxed/simple;
	bh=HB8dfb3UJPZxA//Ds4TzHgj9flc2H8ljylk/vKM5fsk=;
	h=Message-ID:Date:MIME-Version:In-Reply-To:To:Cc:From:Subject:
	 Content-Type; b=goC0nAsvyEYM+BD8nkBflSKILfKzTLBYLxogV2irLN8+XBnS3UdSEdhJ3Fsk6jXAwJ134Bb5wlJ8Uw8l+uydeqsjmEjNiaWBWszh0PtTZ7vgSw+Wt5NuQ9qmTWUYNZU3HOMCMBTkRawswRGR2phOAQJ/sJDHGJpptV0VRMzlxxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=D1rpZxd2; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1721322521; x=1721927321; i=wahrenst@gmx.net;
	bh=HB8dfb3UJPZxA//Ds4TzHgj9flc2H8ljylk/vKM5fsk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:In-Reply-To:To:Cc:
	 From:Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D1rpZxd2lj1IhXA5nv2Y8qRkcvfGW+c/Ctpyu1DSVPTFVxzajjwGVwLiThOSgbnE
	 eT5eeS1V3u5xGYdPDblSPi3fa3MvV5LNApht3L6VGtOl7aS+sgJa4iCA3eOp6r41n
	 2LIu0lxWY8/+O2FsjDGRMTqva594RIUnKrhhwBjLeD2xhGwkCgmjF583kbr10KlFD
	 kPqh07aQPTcQE6Qb/cn0Oj2bM6yNOU8UMgWHb752+W+x2RP3iU9r7on7jqT36U9gd
	 0kCavSksPideJSGCSZRCAWtYwonhnLe75QMUwmwFOqGLbZQPp+wUfJO1Y8Mow+pIB
	 qAS2df+yzSwbCEnkpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfYm-1sb7Oj170K-003CUA; Thu, 18
 Jul 2024 19:08:41 +0200
Message-ID: <09eb7049-269e-4616-a33d-5b304c7aabf0@gmx.net>
Date: Thu, 18 Jul 2024 19:08:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <CACRpkdaRxoEZT1_KyJ3QMDgBcciw1XUXKr=cEiPxbcwSnpmyiA@mail.gmail.com>
To: haibo.chen@nxp.com
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH] gpio: vf610: always set GPIO to input mode when used as
 interrupt source
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Prz1EgVU96L/IE7BzQCBQAF+oWvB8fuBCdgc10l3MUMI6+ioS5P
 tAGEpLadmcNT9SLrZcvUConwpJZkRdOKZh6uNZkaciYiaJb9dHPiaVw/yucEB/DeqVoziFl
 U6NrWSaaalFOhoNkNq4PlzVOFGBMHTRAX1l6o+VjJViC1LPHibrFPuFkTnv5FvP86gaCU6p
 Gp07dBNxWyLABs3btk8Lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8n6Yt+MBNW0=;4dBoCuPdnkYnY0CjmEgeFg5zmIi
 4OKZxyE235YGutky2N6L0fyFrysH2e9ExzwmCDEwfDcSquQ9M+upxV32Wg8U1vYF+8z8Id2fL
 Dfjq20JIFW6OXRYZJlcoXdHoEfnH4oyAV4DbVQof/Ts3lVqL7zsUSFQlrjh+1NSjWg4eTxD9/
 u+BxEx8MvAJdveBteTHjSFdH31gQd5/cxApY2LQ5OxOdSrgiJfXGUm2oJx+GtDcpi3c6jN6/R
 4y6QdC02BrcHOoDdwhsCvMoE/34gsUIq3+IIucLlQQ1etkkwy6DkcA0BLJz5ABJzE/0/NOPMR
 ElX6VBfcDQHrZrr7llnp7BZvsIj5M8YJZwqCLXSy4iRIlpmGUNHAeP+F4MWUTM+3tPecw4e8m
 VtD86UWAnoyf8WMdpobFj3Wneo5K5B5APC9iP7bPc7BZNJA68V/gga/hobqchtTQ2fGAKVE34
 pIbWTKiG379jG5N/pwWWH4w9fTNVXVX6SIHpxgt+IJkwMyXWcqFTPbD+0a3ugXBgrz1G6lGyQ
 ORUfZeEZLATnLqq9Au/cUpQ67se8XPPWOxag95ydtSz5sdbxGxNftOZPyY0+F1xX6t6kgOxeM
 DY0uYZq434b3EZyhHxNCVXAW0RNHG4FFmpv6lF8l8n2uum6cyuOy1lbDjkZY94ZgxeNUuK3tu
 69QYJVF6XSkOQ/aSyQ1nrsTTcvpziPgWxQSmm+yQ8UFgN+9EQAYA05B1SfFNyCkZ4eE76tcrf
 GDKVndklJEQ8A0LQazbuBQXd91/qfVEVBjzs/L321hMpSS4cQ/OidQ+p0fUMouFX82tHX5F0W
 lvTrYVMr3UpD+WEuJ2yxj84w==

Hi,

I found this thread about the vf610 driver, because I noticed today that
the i.MX93 is missing the GPIO get_direction callback.

Are there any plans to implement this?

Best regards

