Return-Path: <linux-gpio+bounces-2049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BAB82689C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jan 2024 08:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5DC71C219DB
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jan 2024 07:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330A2883C;
	Mon,  8 Jan 2024 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ll3ys4zK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9089479
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jan 2024 07:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1704699205; x=1705304005; i=wahrenst@gmx.net;
	bh=KHU7GBjumZOwn/wTnI2elU57I6vWMfj/6wt4HfDkcQs=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
	b=ll3ys4zKJSW2l4YtP7x+hzOgQGby91iRsGKnJsD+XgRg4w/fdAR/iyvvPb0jjtoh
	 ZWXCyI2HLzirO4QsjnwyNirv2yX2L1/Q3WmSmmPb2HkLhXfRffcP11gP+VU7bIcVi
	 0CHoikO7DCnqQxZY1lbwGSY8bj58bhtsU5djI94UWQCZiYNwT4fANBX3MuXfjXb/x
	 oUCGD8aIeBYhspahXEIAZeWsGXpAj5qa/PGcYbEH69mgprW4FKOspGz9OFXe5ES9h
	 WfyMj5arke4RWeTEE2bOtin4AEFz7vaX4uaRUWiJ4UOerRqAB3bcn5PTiWpexRg6v
	 IDP56YC/NdwDpwjeqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0oBx-1r1VrM1O69-00wpJJ for
 <linux-gpio@vger.kernel.org>; Mon, 08 Jan 2024 08:33:25 +0100
Message-ID: <ac3e2cad-ea35-4d23-8b40-551569ade7e2@gmx.net>
Date: Mon, 8 Jan 2024 08:33:24 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pinctrl: Questions regarding pinconf_ops and bcm2835
From: Stefan Wahren <wahrenst@gmx.net>
To: linux-gpio@vger.kernel.org
References: <bbc667b5-366b-430f-afd5-fa8a9326d9b7@gmx.net>
Content-Language: en-US
In-Reply-To: <bbc667b5-366b-430f-afd5-fa8a9326d9b7@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q+y/p7dMstPjMevb7pvnsh7HqfCoJqAqbyWvOW0p//K7fUmjNDQ
 JgCEQqnMaRKpr9IGXGh8PmBLV8Z/8YT1urksRxb8LxiYsVq6ZAqc1341S+GoZnceThHDoqv
 sG4w5v8A942CnCAkAoC0zb3br5zWtpVWxUoMrlO7d5DR8tfhMKlaV5lPPGaqxpI8+S+q96c
 M7Mu+peTTJc3fJgAbFe0Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YWaQtJPGUpA=;30kJUCF9oCLqcFU9NoFGkafAUQj
 ZmrFGT3NQ23WNnuLbe9rY5hHNruzmjk0gJVY5vz3eGMv4kgYr7fbxb5RwNT3UxBR1OmMXWJuA
 +pTbUL0Vc1PKkCLG+s990bFnY4XngYWG/PwHZkjXlFwJlRYv6Iya16f7JqUK8CoJ1U8IP1rIs
 mVw6OXsmp/ZNUPST/dVJIHcNh2e2gc2o9A9EUAjMCtxBD0fbHNdldZc5PS0n3hUMI6mK926h8
 xRr94HgmzbzJ66u/UEvD6ajSBnP8VfMiQKpvKx4BXKgodwZysW7IBfl6MENYMZroZhQTu7Y7R
 dIYFCMqNjbojkea1CZBlLx9jlTJlLB/RabZctdcgqjP/B8CZG6sDahPKvn6YBw4cVdrhM6AVR
 scK/wRvCj34ltBHhV82bw5yviqAKcuBh7nVKhIqJ9luaoNmeXLybuTILDD/aQ4YBjKTxcPWpB
 ykoAlHDc5hF1D5RMoDvk7D0jc1XMEve7aRtyikLlp5wS9fpcTJAO15/xRDmoKi9wW6BP23Muh
 vXqxk1zLdZEYbeESNFu/4u9Hkp7w2vpEChooicXTChmR6yN8AQx7nyUeb32OBLHqnjUbucc4C
 KDxgtOyFHs6bEFPTtI8Yg582km17AlNyrYATOBh+mxdpmlqW4ZsyILh7WIcWQsRqiqhbqjhta
 AU00YHAIQ1UcKOBtSN7jOKSuEXAR8aB79bEW9hP1jpUjsEmYohoay+a0jLfF0eeIZnLltNZcz
 Nyn7rtPIwBYVLJIF65rAc8Zl0ioR/FlvsMLr5vPX3OovMSvzBQstygDzLkjLKygvZjgWF+VWN
 aJ+brbIp1y7/5m10wmcx4aCNFR2aIbDHdNBG7rW/LfWk4xFrGYCuG2+QnJNPDwWycvI98wPJD
 Kva0dYxLjF5Yry40YuIF6V3fsHtRthK11qQ0bmqGtHkcWQ49ocM9z6f3tAU8tQheUA8mB+OwE
 PaYC2g==

Am 03.01.24 um 13:12 schrieb Stefan Wahren:
> Hi,
> i recently noticed that the BCM2711 (used on Raspberry Pi 4) doesn't
> implement pin_config_get, but this SOC is able to read back the bias
> settings of the pins. After looking deeper into the pinconf_ops i had
> some questions:
>
> 1. Are there any other benefits from implementing pin_config_get
> except of a proper debugfs output?
>
> 2. Since the pin direction of BCM2835/2711 (input/output) is already
> handled by pinmux_ops via gpio_set_direction, how should
> pin_config_set handle PIN_CONFIG_OUTPUT_ENABLE?
>
> 3. In case pin_config_get is implemented should the parameter
> PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_OUTPUT be handled?
>
> Best regards
>

gentle ping

