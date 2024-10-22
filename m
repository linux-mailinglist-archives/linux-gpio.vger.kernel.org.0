Return-Path: <linux-gpio+bounces-11754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD599AA280
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 14:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2F001C22233
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 12:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09D719D8A3;
	Tue, 22 Oct 2024 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="zNeRSXLn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AF819CD01;
	Tue, 22 Oct 2024 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729601542; cv=none; b=S1bOfPdWqUnac5hYWEKvenxdG9zj2KmHfnW+Jhkai953Zy90U+5ZzfxaPXEgezNMD8jESc8PzOzzLf8kz6eBYqvr2evjQ5DKf13dbVRstdgJW4DASsZpW/CAyfFDTdNBBy88gObbI3ObikubLgjZZv5Db7Zjfa1GZZNZjhlTS4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729601542; c=relaxed/simple;
	bh=5BJzw8OeL5RxI2XBz1iZG7KaTvXSK/izAGyBEdyk8sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJv+Gc6o+4pXpHn3u4pZmzxHs3t10ZxMValSDMS3aWWxIYQ+jkBet2oD0wN6uAGvIeUUU6Jh4kC5OM74qchLhemTtqo3QpZ6hjS+l5XBrdZDf91q4dps3kqTTS7orwJ1hFNPe/xcPeA+OTTe28pLqNAxs77jimO3WulXzbVNqgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=zNeRSXLn; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3D3FD88EBA;
	Tue, 22 Oct 2024 14:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729601539;
	bh=9DOx6O2cK3IrTdgG8pysn1acDSlZP8m21uO78nQpmWQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=zNeRSXLn9Z1iLHCgLS+g2i9ljpqBvKT9QR28j/93614sc+VbjIBfCXCZFSttbM1cb
	 QatBSjzxmomh8OhXkOOP2CxuykCxJt2eQE88/sHM3aeoRDdmDXXEds9l/R2qkFjC8x
	 cYJyLPMelL9Z2ahnz3U0ngtuS06Io741MMy8e0OepApq+M+Aik0B5LnV2v5wFsq71u
	 UP1mKxQOfcTJni6lsk3WwogVOVMdDbyyd/o/fyHqClvhC12Oi0YPEe3F+VDUngzR2j
	 l9WSGvzhx15+tw92NUi0PVr3ZESj5knYTy1FiCA9e7hIHVnkxn1+zGdt5G4FnqRS4z
	 dqCFpLR6A0FJg==
Message-ID: <d985668f-9e53-449a-9785-5cbb9b14a8fc@denx.de>
Date: Tue, 22 Oct 2024 13:23:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl:
 Convert i.MX35/5x/6 to YAML
To: Shawn Guo <shawnguo2@yeah.net>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-gpio@vger.kernel.org
References: <20241017211241.170861-1-marex@denx.de> <ZxcbHb5v05+XhFnM@dragon>
 <6eb23f6c-fe0c-4ee1-8f99-568041524073@denx.de> <ZxdDPSI4i/nRawlw@dragon>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZxdDPSI4i/nRawlw@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/22/24 8:16 AM, Shawn Guo wrote:
> On Tue, Oct 22, 2024 at 05:52:08AM +0200, Marek Vasut wrote:
>> On 10/22/24 5:25 AM, Shawn Guo wrote:
> ...
>>> I'm not sure it makes a lot sense to have "fsl,imx6ul-pinctrl: " in the
>>> subject prefix.
>> I can change it to imx-pinctrl or something and send V4 , or can you tweak
>> it while applying since the series is somewhat large ? Which do you prefer ?
> 
> I expect this binding change go via pinctrl tree, so it's up to Linus.
Oh ok, so just let me know. And ideally let me know what kind of prefix 
do you expect there, imx- or imx35- or ... ?

Also, what about the DT changes, do you plan to pick those or shall I 
send them separately ?

