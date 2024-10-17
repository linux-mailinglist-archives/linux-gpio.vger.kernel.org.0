Return-Path: <linux-gpio+bounces-11566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 106B59A2AD7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 19:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9367B2A4EE
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 17:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5D71E00A2;
	Thu, 17 Oct 2024 17:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="XIVu3Fyu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF31DFDA5;
	Thu, 17 Oct 2024 17:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184671; cv=none; b=Eijw7cNqKzfyNWIcdCPi7/Fr4EXgKKmJsEza/EoLS9KStBVMOTz2Y/l1kUZVGT9LUcPz0SixdNg0Tge9yghNnfzD9wAiNVLjT1cBLXh5t6Sf+vtjQpf/X6UyOLnd1EDMKjMENhQWqV1ui41idnLltkAckuXGAmlRAzfBYVXH+AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184671; c=relaxed/simple;
	bh=9kF3uG5mtFLIpIxt9J0owzkxQz9OgiM18CV4F8ntZRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrV/KqGieiZ6KQ513y3Ri0I8OJxJvdxkJSllupsset25NhJnHYQAvgiCfjeH+NtVKW6/n7+02zwLoh08IMciqVU7aPjpkrb9dve1jLNRgKcwlqfvOegv1ZU5oA+05EPvNGEBh1boo3QokIOsckf8wAeJqHK90dXHH0pEfYqhZuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=XIVu3Fyu; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729184647; x=1729789447; i=wahrenst@gmx.net;
	bh=9kF3uG5mtFLIpIxt9J0owzkxQz9OgiM18CV4F8ntZRI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XIVu3FyupPh2j6A6YYBPWHvM6fBfz+mDMrN5rmKDRzx3c9M06U4VgpjVHo04zCGk
	 SNAIFeYkYHJ1LerCbzc7x9zbDCl8Umm4i9/8hDSHVXHMdaJraipPoH+HDQetzToeZ
	 kinHl/a4VHJs4Gt6DI9xnqK7xMIPoxIJCBU6tXabGXgSogGS7cZ+X3FH7eKp1o/A6
	 y/IMjzvxj3fdvKbjROo3P7EryFNt70mPlTkuC1vTfWbYx0jJUcqo13hZd6+OiMHt/
	 9YQo47zoRL/rAK5qPIGoKONW3pbEymJ7sV+ftxTcoudnnGOjlTxKYoWqIUys9a8XL
	 PQF1yD/5Qafyh0f2gg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEUz4-1t8gnd1MC2-00FySO; Thu, 17
 Oct 2024 19:04:07 +0200
Message-ID: <16b45842-1a8e-4425-aca3-d93276e59d5a@gmx.net>
Date: Thu, 17 Oct 2024 19:04:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] ARM: dts: imx6ul: Align pin config nodes with
 bindings
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-gpio@vger.kernel.org
References: <20241017000801.149276-1-marex@denx.de>
 <20241017000801.149276-12-marex@denx.de>
 <aa21db7a-5b05-4529-ba75-e2111e9e6362@gmx.net>
 <a5026879-48d9-4557-85d9-038ab73deefb@denx.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <a5026879-48d9-4557-85d9-038ab73deefb@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x3xTmGKxtGTyIFc7f4AZpbSe2Gpiz4p7hsrf2f1CY1A6cdUFBDn
 X/lzot9IQ2mFycJM3/6ksDraTMiV3PKZFSYRQi5fsMiLHEgXZKf7J2/VWYcHX2QnQqvAclq
 Y5AaMiwIM1BcorVbU/2wNKtzHDSbC4b2PJDdDrfBmUAByahkp+rl5KKfyQcdrELAmHuKkS/
 3snPncfha76l2Oo5ysEog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8YIS1CdQyqU=;4UvcURc/NSs68Qj1h3993yJpusX
 QdWcUhxFD4UWBAAjNLTQiDBoWuD7vLJyPht5FM0LbUDPLDNIY9BWz/0lqm/q1mf6WKwlmFW9V
 mS7LF02mW3nVYj+XekT8mPvPplAk52KSxxP/UHA/QGWGEyXetpeAf45hGGabwqkBY9VghQ1eO
 YefNaETUd1lblMGA/f9a2rgtt/rxuh/8iOh1AMSsHUpRAwxfndgtUOiyHHX2P6edExWmDhEM9
 QBFA0QZS7UD9bbGjn8YhTyYJnOykzmQEIDecr9Wj21/O4v/aU6nfr6eJd9E7eOcl+lBQhY+xw
 OIhxDEEUw+rzXpTxr0dGXcloNVWoQ8lWxbaCbZtIlOugr1qbdU8ALYnaNeVcGaAyoQg2aSfRJ
 83xitRQxTc8DzmVFk/R9Cc+/PHUJNjeKcyxTSADhtSrfsFpwZ7Sw62lnySvUqSgD7ShVfoI2e
 AgEFEvCymG63xbv1Kh3nTY9Wx4sCLRFuiRAfPyK0jsJxeWkWVz5/ddLy1c71BQGICY0H2sz1A
 lOKtRP+GPawq8va6tTexhh3mBBsEfyOsXfWkWLJ12712JSI+bjle/dMR221JAIdY5coaIlrPl
 M15clrSdEo5TfZRX97sSUK0jxd3TJHOw5OtHoXINpXdOBrKDkM5BvtHuwl5QN1zilQZdnhGvB
 0c3/0Umoetz3/ENwXSHS0g0PJHCtGxV2b9cLWQQaVuCnc0nrdI7x/FNmqdAszRlpc4z4lw5sF
 oR5oFZGV22DzuRi8mHJJ+Om4GHLZDZ47EWxI9F7D1831WTSfC/KIrtP+PqdaB0MiomS23Fp5e
 9Dot6nwMyb/rfnwUk0SZNG3w==

Am 17.10.24 um 14:30 schrieb Marek Vasut:
> On 10/17/24 2:14 PM, Stefan Wahren wrote:
>> Hi Marek,
>>
>> Am 17.10.24 um 02:06 schrieb Marek Vasut:
>>> Bindings expect pin configuration nodes in pinctrl to match certain
>>> naming and not be part of another fake node:
>>>
>>> pinctrl@30330000: '...' does not match any of the regexes: 'grp$',
>>> 'pinctrl-[0-9]+'
>>>
>>> Drop the wrapping node and adjust the names to have "grp" prefix.
>>> Diff looks big but this should have no functional impact, use e.g.
>>> git show -w to view the diff.
>> thanks for addressing the YAML conversion, but this specific commit
>> message doesn't seems to match the change?
> Uh, right, commit message replaced in V3 (or shall I send this patch
> separately?)
I don't have a strong opinion about that. Luckily this is the last
patch, so in theory the rest could by applied if there are no other
findings.
>
> Thanks!


