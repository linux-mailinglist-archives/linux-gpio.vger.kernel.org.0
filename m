Return-Path: <linux-gpio+bounces-30014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEF8CEB83D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 09:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3352330181AE
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 08:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BDA22CBD9;
	Wed, 31 Dec 2025 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="LlMTtoud"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m15588.qiye.163.com (mail-m15588.qiye.163.com [101.71.155.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0981EEA5F;
	Wed, 31 Dec 2025 08:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767169081; cv=none; b=bB6HTpyqBFpIhCoB2XIjqJwkHSr9WrHsUeXG+QrQPJQAdp6ZpmTobIQWjgh2MhRlFYTPtxynefSibOtj2QTXVEx+uohEa/K1XTgPvbzvCwZHKXLVSBep++lh/Vxl5lGDRQ0cLGqs+1eHhcQqdH+2zwNQWe/53mWv/IF8OgrGtE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767169081; c=relaxed/simple;
	bh=I0n3A7mzL3U4w+3Swr+xXS4INVRThIKDmoFu3BJDm6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rvk6UiMXLARnVEzV7p4gYgCTvX6BCRvIe5C7PJq3XPGW4EUtvNMfM0BVi1m9Pb3fImkd9P3i0HrA/G6IE9+OZNrhSE3rbaAGehGiLuzgD/ZtNZyEvTn48yRbSDhXLjC75bApdjaaKvCq/r2DSPg4bPJz+Cbe+/fDoBE+7A1n+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=LlMTtoud; arc=none smtp.client-ip=101.71.155.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.16] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f223fb0b;
	Wed, 31 Dec 2025 16:12:33 +0800 (GMT+08:00)
Message-ID: <0de0f505-5858-4ea6-85a7-4c386ac205e9@rock-chips.com>
Date: Wed, 31 Dec 2025 16:12:33 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] ARM: dts: rockchip: rk3506: Add pinctrl and rmio
 dtsi for rk3506
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-8-ye.zhang@rock-chips.com>
 <ebb720f6-4756-437f-a71a-d94f45d732e8@kernel.org>
From: Ye Zhang <ye.zhang@rock-chips.com>
In-Reply-To: <ebb720f6-4756-437f-a71a-d94f45d732e8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b73773f5d09d8kunm7d1b63c029b1073
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxhNQlZCH09PTEMYT0IeHkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LlMTtoudwY0r8GtTq3kRlvFU7O9LrvHrzRYkwTvLuJkRNjj1JKUg8aTA2zm1GVSnbB29fNF/sO5ZNrbHF630uTJfymHO6MMom80zaV5fR4MvcHbT3Q7Z2oGbuWhzpyiLPBMMVoNSi4y6+caIs3cWB/JBkJ9NjVt0dG5DjCS22M8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PJXRdk/Jm/8W9JuE53zA910TazhkvqSxi7iqm+rHlCQ=;
	h=date:mime-version:subject:message-id:from;


在 2025/12/28 18:37, Krzysztof Kozlowski 写道:
> On 27/12/2025 12:49, Ye Zhang wrote:
>> +		/omit-if-no-ref/
>> +		rm_io28_touch_key_in6: rm-io28-touch-key-in6 {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 49>;
>> +		};
>> +
>> +		/omit-if-no-ref/
>> +		rm_io28_touch_key_in7: rm-io28-touch-key-in7 {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 50>;
>> +		};
>> +
>> +		/omit-if-no-ref/
>> +		rm_io28_sai0_mclk: rm-io28-sai0-mclk {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 51>;
>> +		};
>> +
>> +		/omit-if-no-ref/
>> +		rm_io28_sai0_sclk: rm-io28-sai0-sclk {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 52>;
>> +		};
>> +
>> +		/omit-if-no-ref/
>> +		rm_io28_sai0_lrck: rm-io28-sai0-lrck {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 53>;
>> +		};
>> +
>> +		/omit-if-no-ref/
>> +		rm_io28_sai0_sdi0: rm-io28-sai0-sdi0 {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 54>;
>> +		};
> Why are you defining all pins? This is wrong, your driver has to do it,
> not DTS. All these definitions when not used are just pointless.
>
This file is auto-generated to provide a complete set of RMIO 
configurations.   Our intention is to offer a generic library for all 
future board developers, so they can simply pick the needed nodes by 
phandle without manually looking up register values in the datasheet 
every time.   This improves usability and standardization.

We also used the /omit-if-no-ref/ tag, so this will strictly not 
increase the size of the compiled DTB binary at all.

Could you please reconsider if this  approach is acceptable given the 
usability benefits?

If you still consider the ~25k lines of source code bloat unacceptable 
for upstream, we will have to drop this generic dtsi file and let users 
manually define only the required nodes when adding board support.

Best regards,
Ye Zhang

