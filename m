Return-Path: <linux-gpio+bounces-8284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D56F934FB5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 17:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B960F28278A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 15:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76901143C60;
	Thu, 18 Jul 2024 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFcriuRp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4242A8FE;
	Thu, 18 Jul 2024 15:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721315608; cv=none; b=cwzt7XzeqzSyTyFfhvxmFRIkpOs0cFfNmpeKNoQVCTbR7rVufbdak4gFbXadY7Q8t+68jGJa/euRZ/Nmtyze0KrR/VBuU46pi4QbQgSVvwVQIBShTOTTDWLazG4faYcWuB+jzyE38eoxhgA4sI5NGFB5zc0FkblK8k5b68w+D2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721315608; c=relaxed/simple;
	bh=KGyvEQ54So9d/QSHQz8COPueg/2S62+77cBcHg1eiQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9BxwU8JTOftJc/Qq485t7bFFb+uP1HNFiXazHqf6XdSfYp5NtJHWskZArOquepiCA3i04HxkO2T+h5d3MeXY/9+lzCRQilylQCVyjqthdAUWYn2fyan5SsTsLxOzNaPbvtYc6tvPtIluj3mBSoV/gSCdOMU+cqAuSrZ7D2aM3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFcriuRp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FEFC116B1;
	Thu, 18 Jul 2024 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721315607;
	bh=KGyvEQ54So9d/QSHQz8COPueg/2S62+77cBcHg1eiQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eFcriuRpt2IrddShWruMkpSuTxZRhE5FthCbkGHMdZMbV3E5kb/2ifSgVZk8XgpP6
	 DlrbqC+x3duLCM+iR0NQvXlC7TDwlBhSY4FgEnqQGS3+e8BvahzC0rlA66RKQUfLMY
	 vikckXZTV48GNjJhCuKSkAhn6MKIk/XVaCdXLT54omcTX3TXJqT0bXOo9uiwM9BLQg
	 sBQWeIGv6RwJMxaTaL5L76qicIzjYJNvnKA42kTp8sY/sr0jxqtRyS5XlDeEgNxsqV
	 JWla6cRAkTka7yWlLY2DnoeQsTiW2ETeod84C086LfV4H2iwDP4R4KvfAcuboniE9o
	 4AY1/gxhBfRgg==
Message-ID: <b61742b9-0767-4e28-8b26-dfeb240726c7@kernel.org>
Date: Thu, 18 Jul 2024 17:13:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about gpio-hog
To: Conor Dooley <conor@kernel.org>, Bough Chen <haibo.chen@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "'devicetree@vger.kernel.org'" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>
References: <DU0PR04MB949657D9575090C71714D2A090AC2@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <20240718-smudge-splashy-6e8addc80c02@spud>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240718-smudge-splashy-6e8addc80c02@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/07/2024 16:47, Conor Dooley wrote:
> On Thu, Jul 18, 2024 at 03:40:49AM +0000, Bough Chen wrote:
>> Hi All,
>>
>> I have a question of ‘gpio-hog’, the property gpio-hog seems to be used in GPIO node rather than in users device node, so we can’t use the device-link feature.
>> (sorry for resend, I use text/plain messages this time)
>>
>> e.g.
>>
>> pcal6524: gpio@22 { 
>>       …
>> 　　　/* usdhc3 and QSPI share the same pin, here select SD3 pins */
>> 　　　usdhc3-qspi-sel-hog {
>> 　　　　　　gpio-hog;
>> 　　　　　　gpios = <16 GPIO_ACTIVE_HIGH>;
>> 　　　　　　output-high;
>> 　　　};
>> 　　　…
>> };
>>
>> &usdhc3 {
>>      …
>> }
>>
>> The board share the pins of usdhc3 and QSPI, a MUX use one GPIO pad from one I2C GPIO expander to control the selection.
>> So before usdhc3 probe, need to make sure the gpio-hog is configed. Which means usdhc3 need to depend on usdhc3-qspi-sel-hog.
>>
>> To achieve that, I can add a fake GPIO properties like below:
>> &usdhc3{
>>      …
>>      hog-gpio = <&pcal6524 16 GPIO_ACTIVE_HIGH>;
>> }
>>
>> Usdhc driver do not handle the hog-gpio, just use this fake hog-gpio to let the usdhc3 depends on pcal6524 IO expander. Make sure when usdhc driver probe, already select the usdhc3 pads on board.
>>
>> But this will trigger the DT check warning if related device binding has ““additionalProperties: false”  or  “unevaluatedProperties: false”.
>>
>> Can this be acceptable? Any thoughts for this case? I think this might be common user case for gpio-hog.
> 
> I've got no idea what this device you're talking about is - but it seems
> to me like the "hog-gpio" property is what you should be doing (although
> probably called something like "enable-gpios" instead.
> What you would do is send a patch for the dt-binding for this device,
> adding a property, in which case the *Properties: false will stop
> warning.

If there is device dependency on the hog, I would say by definition of a
hog that's not a hog. Hogs are for controller to initialize, but here
your device driver needs it. This sounds like simple pin configuration
for device.

Best regards,
Krzysztof


