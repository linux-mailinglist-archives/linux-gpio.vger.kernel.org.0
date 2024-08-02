Return-Path: <linux-gpio+bounces-8541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98753945E95
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 15:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3958E1F21EAA
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 13:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C8D1E3CC3;
	Fri,  2 Aug 2024 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="lqTRRKcs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0721E3CB9;
	Fri,  2 Aug 2024 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722604931; cv=none; b=PRA/9+fAwHL/2pG+IF3TKpuyD5Fct/By3VRwG4LZ+mGevwhdmBTC3sFPZV6gWtC9PN/aJ+XiQoYRgbAaFFc+cPkWc4suxIN8/gcJKJ3fTv9aK5Aw1HFRshJ7plRSuwVAGrvDcr+mr/v1lxkfwWDb1HSm/hPgw+URe7LYlCVgxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722604931; c=relaxed/simple;
	bh=HfPLnTAXMglQ4l/sE73jsNf0agv0oUhzdQzDG8X1X+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGj4s/hncV/ElJhO0Lt6/UIcHE+VCrtCdybYE0nRB/jPCvkOPyznNtBu0R/4IhtfKibBVwM8Bu4n69FGdNHpDZR6eqsnaGe/YRqQPH3hc9jt4dxmXGox5PbEdafmsutVu4RTGqLN+/zE+X1Btm+xPEI4O8wJeNijFeh0XNmb9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=lqTRRKcs; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722604925; x=1723209725; i=wahrenst@gmx.net;
	bh=HfPLnTAXMglQ4l/sE73jsNf0agv0oUhzdQzDG8X1X+Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lqTRRKcsfKnd41yZ4wrGV16cbW4JubEMRZ8W3YfaBIwVfv3Uc75hAiqA6QgYFMIk
	 oLbv6VWvo48OuvdlQQ1p1J+cYHU4XWQLBqCA4nXLfxsH8EJ3mD4SOoPyfV5bp9Ub6
	 mxgjICgR83pL15C17gerf3CsSFarmbjdkMRzWSoPOiUoG72gyje6HRNOySOltWvvn
	 q4QsLTC6laecIpAxtIUBliz+ghBY49ag9hTuCIN5QtGvfO1OSk1ymw1PmFFXZ+rsF
	 PlLudT7cIBsxY0h1SRCuDeqwlCcCYi0eKEMfDmcaGS2PnZhMfI+G0kR/zqFxwuVII
	 AAWRGCSDqMgL0EFvSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1sCa8f07Bk-00xG0F; Fri, 02
 Aug 2024 15:22:05 +0200
Message-ID: <50b97539-cef2-4a75-a750-96adc2467f67@gmx.net>
Date: Fri, 2 Aug 2024 15:22:03 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpio: vf610: add get_direction() support
To: haibo.chen@nxp.com, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20240801093028.732338-1-haibo.chen@nxp.com>
 <20240801093028.732338-3-haibo.chen@nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240801093028.732338-3-haibo.chen@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gUs7kPevwMftD1htQ622/u4ZuODOzLbNWPM8w0bocT3ThnRFGUo
 T6dAymXWzrgpPa+mXN2eiyxjMM0XsbdXhWyIR3DoEXK+D8Xm/VVabuDmmCXXFe6h4+r7uC/
 I3NHWhQfV357fknl7zo1PZqGXIYKqnp7Q+eOEmjZClwi773tFBw77DNsHwqWmSn6Vt5XVuC
 jNMn2LvQePRDks34Zu+Nw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k/Nh6RCPm70=;zcgVHQ8PtnvSvBnF8x8bEnebvvd
 AicgF6+UfzxFPZ2l+QYDLVgZHG7Kj6nP0eGDAgNUHDuSY/QGFsy4arexzo/3yNxvUpzvQ4emr
 Ip/ncFxksxsh2CGZtqlvfjmmMTv2w8/AkBVmMf/422lsSFte15GLWruOkXtXwboAGZh968/nO
 1n26ICqYM4B9yopvhY7WcwtoFmnQ/4FjFw2UnYCAUh5YDER/bCF7z5j60o5lWZleaFK21xwgA
 s8mFIZ1IFkfE6yYDDnz39qNGXUAcH8pVlfY680D6rv+ex1pafDNExODS9iRBVeqlK4/KkzF6X
 NermG0aIC/RYL7k8B/noSeLi4uXdMGL0SL4Z10py5DKv5YUCI48qHBSf5R4jbcgc2uc8s6aWx
 LPa5v8JUGt9lNqOo6ycRGnPc6wwopPCOZtd+QAEGNK7m/a31mscOVsQLq9fpRvRy2lp7HJYSi
 iEb0R0F0ieIYSZS6Vb10w61GANMd5vtJQ+hZ9IANi4+4dblZSlZaXyWi+P8Gxyi91CaRHWxSC
 XZ4PJu3VQoy5N369vyC6bDq2bOh8eYhAT1GtZnV4d85Ez2MnsXfhqZSyILWIoGDD33vt34Myw
 41ZKeU/5hLkSz43LQXlEuRVYAPBLseeGduhLdnBA0Ute9Ae27HsFkRAkzRXKF9AGML6iyWEks
 BaillnCKrU6CNf963cYyNWSDULiFhMcTS0vxTUbO2D/7RnxYFyvmhEshgnMZ6UrdOOldPGSiO
 Yj/70/9F+ljTekTZ8UVm71flgB9esN5i6u3Sa0ufLgsdgAhnFAgr+fcBocpe8IiR/SM3+6kpo
 nUDdeLr4jplkY5Q6NL5aDdeQ==

Hi Haibo,

Am 01.08.24 um 11:30 schrieb haibo.chen@nxp.com:
> From: Haibo Chen <haibo.chen@nxp.com>
>
> For IP which do not contain PDDR, currently use the pinmux API
> pinctrl_gpio_direction_input() to config the output/input, pinmux
> currently do not support get_direction(). So here add the GPIO
> get_direction() support only for the IP which has Port Data
> Direction Register (PDDR).
just a question about how things work:

fsl,imx7ulp-gpio and i.MX93 have PDDR, so GPIO get_direction is handled
in gpio-vf610 driver
fsl,vf610-gpio doesn't have PDDR, so all GPIO direction stuff is handled
in pinctrl-vf610 driver

Is this correct?

Best regards

