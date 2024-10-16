Return-Path: <linux-gpio+bounces-11485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F8F9A16E8
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09556286ECB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC66D8BE7;
	Thu, 17 Oct 2024 00:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Qw9GOmRO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474404A0F;
	Thu, 17 Oct 2024 00:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124687; cv=none; b=S9/n7pEUBZhQJaEfjiReYzC2pTv/L/yyw769rP5jEgg3Sj6fsQxxVLaXhkj2ioqAyEsyYY++HgjsK2o3PVj4+TiDL0VsGEfrD5+jAVWRub/OgHPzpBoT7zVzBx77mXEnRlZ4lPvBT9yvKjXGBjQyuiG0f+7GDCUccBSPjbzPwFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124687; c=relaxed/simple;
	bh=or7oM1GecA7JZWwNxb8lD2okcf5QUxZ1AqFXIFSRoWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kdet/r8W4njohE50aLPhcbT9b90p+8fRhyC6i/3SAIO+/VlnJHtjsY0wHAJWd8Pxk03EiApwkoGJ94dNY1AQmClz+63ViA2QXPHrpXmpUTbpWmt5EIVx4qV0Co36tZugBRCAa0E1Zfs18WDPK3oicw2s+fP2fNrtFbK/w8oUnOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Qw9GOmRO; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CC1CB88E18;
	Thu, 17 Oct 2024 02:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729124684;
	bh=mb6hYpy4uY+qu8u1XIVVSOVDrUsFEIqgbup3x8+Parc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qw9GOmROsQmzUNi+X2HYwWO60NAQdCwfEnV0VT/wvPGcVbYgUAN3PKqeConlMcugB
	 OW7r8A8AVb5cLShtzw48opeezic4lhlA87Yo5ZQpcpOQZHrFxPcis0gnaEm4/NMDRD
	 AoFmdzsDnJMQOdkrEkGVBA/J0vN9j5rTUs+YMQCmYVXmXp/VMJjJCNXC59r2n0aLNy
	 uuIJ4gvbzCv+FdhjM9FpwrVw4cLNHhSL8yjw7wvsYRpe8dgKOET8mmLioly8YAim2S
	 9gQ+cNzYvkUJZf6BtVKjcMx+RF3QixCSA/mS/9Br6itiqAWnGno+Jt/oWyX5sXQMaJ
	 WVAB486XlXXiQ==
Message-ID: <9265a263-ccf3-4e9f-b7e0-69f62ec61eba@denx.de>
Date: Thu, 17 Oct 2024 01:16:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: fsl,imx6ul-pinctrl: Convert
 i.MX35/5x/6 to YAML
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Jacky Bai <ping.bai@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20241015232107.100771-1-marex@denx.de>
 <20241016172642.GA1991636-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241016172642.GA1991636-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/16/24 7:26 PM, Rob Herring wrote:
> On Wed, Oct 16, 2024 at 01:20:51AM +0200, Marek Vasut wrote:
>> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs,
>> except for the configuration bits which differ across SoCs. Rename the
>> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
>> strings for the other SoCs and fill in the various bits into desciption.
>> This way, i.MX35/5x/6 series SoCs can all be converted to YAML DT. Remove
>> the old text DT bindings description.
> 
> Just a nit, but I prefer 'DT schema' over using 'YAML DT' or just
> 'YAML'. YAML is just the file format we use and YAML is a lot of things
> that's not DT schema including other uses/attempts with DT.

Fixed in V2 and also in the LTC3676 conversion, thanks.

> This generates lots of warnings (patchwork has the output) for pincfg
> nodes which don't match 'grp$' node name convention. Do we really want
> to "fix" all of those?

I had a look and many of those are simple, so I would say yes.

> We could allow anything, but then we don't
> enforce anything on new stuff.

We do enforce grp$ on iMX8M , it just wasn't enforced on old DTs yet.

> Or this could be split between new and
> old platforms. If we decide to fix any old ones, then just have to move
> them to the "new" schema.
Strictly speaking, iMX6 and older are all old platforms, but I think it 
should be easy to fix them up.

