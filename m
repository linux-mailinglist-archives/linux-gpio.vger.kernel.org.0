Return-Path: <linux-gpio+bounces-30267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 380C9D02E96
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 14:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E86F30C4888
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 12:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A0B466234;
	Thu,  8 Jan 2026 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="UV8AvzP1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com [45.254.49.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0FA43C045;
	Thu,  8 Jan 2026 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767874454; cv=none; b=PVS7sAuaYafrtG1dbmyeP4ZzgESn6EcAI1e2J0yXrG3Z75bGbiuYnA961tUiqEKBWvPDr7yLFy7dxW9JCR0TSFA1ZjMmQTEbxiLwAc32TZleY7osMAiXXdQVlYq0kQaFZucimeUlo8M/UdpNyl6uiJQx5QrF8GVIAwkLZ3QonbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767874454; c=relaxed/simple;
	bh=Ilk2WGvg3Kck0HZM3LZ+QljxkpJY4ZY3QQ5L2/KjwmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0xzfj1sNzt3PdSjJ65YHdoEeln8h92+RbG/RrC4rCPh85HT33JSH6KlVGDg1p145TQiaWh8GRwXxu20aBopOQYjhSTtvI9/ct9cpybkjd/JNC/kjv/ci5CSoHeh6NlzbLmAx4kYvTWmOJLlZwjoIxN4I/6XzYawBTLpw6iKN4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=UV8AvzP1; arc=none smtp.client-ip=45.254.49.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.16] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ff5af838;
	Thu, 8 Jan 2026 20:13:52 +0800 (GMT+08:00)
Message-ID: <a2f5c2b3-2168-41b4-917f-183ab72a4499@rock-chips.com>
Date: Thu, 8 Jan 2026 20:13:51 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com>
 <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
 <85032ae4-4d82-4884-aa7c-b69fee76d509@rock-chips.com>
 <CAD++jLnH2vLNxTLj8Lw8RnOHxfitwi3G_8WCBtu+_=XL3ryH_w@mail.gmail.com>
From: Ye Zhang <ye.zhang@rock-chips.com>
In-Reply-To: <CAD++jLnH2vLNxTLj8Lw8RnOHxfitwi3G_8WCBtu+_=XL3ryH_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b9d870e4309d8kunm04506d9976d9ca
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkoZT1YaHh1MTktNHUgZH0JWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UV8AvzP1G+MxRLfAXtJtmMOMR0xcdDJUv3mojtqaLqKD+Z5/M3TRVtZjk3TfzxuWQYa3jqB77SY4oVsFjc5DjUX4G2ETFwmBWpscdhdvUh8j3EUCwEdcuzXbkpI2mBU2hvzcc+HqdPGhZ1DrjbsNfaRZRdUdW6NzmEOva4rFhc4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=qKUPfb6RjX38dUPs0zWmKo6fI+2s9bZCTUhRH83gC7Y=;
	h=date:mime-version:subject:message-id:from;


在 2026/1/4 19:44, Linus Walleij 写道:
> On Sat, Dec 27, 2025 at 3:46 AM Ye Zhang <ye.zhang@rock-chips.com> wrote:
>
>> I understand your preference for standard bindings.  However, there is a
>> specific constraint here: the RMIO acts as a secondary layer of muxing,
>> sitting behind the primary IOMUX controller.
>>
>> The existing Rockchip pinctrl binding uses the vendor-specific
>> rockchip,pins property for the primary IOMUX configuration.  If I were
>> to use the standard pinmux property for RMIO, the node would contain
>> mixed bindings like this:
>>
>> node {
>>       /* Primary IOMUX (existing binding) */
>>       rockchip,pins = <1 RK_PB1 16 &pcfg_pull_none>;
>>       /* Secondary RMIO  */
>>       pinmux = <(RMIO_ID << 16) | (RMIO_PIN << 8) | RMIO_FUNC>;
>> };
>>
>> Since this node describes a single hardware pin configuration that
>> requires two separate hardware settings (Primary Mux + Secondary RMIO),
>> I thought keeping the secondary config as a vendor-specific property
>> (rockchip,rmio) alongside rockchip,pins would be more consistent and
>> less confusing than mixing legacy custom bindings with standard pinmux.
> I see the concern but I would say two wrongs doesn't make one right.
>
> The DT binding people will have to say what to do here, but ideally
> I would say the primary IOMUX should be modified to *also* *additionally*
> support the standard bindings and deprecating the old rockchip,pins,
> and then you can consistently use the pinmux=<>; binding in new
> trees for both pinmuxes.
>
> I understand that maybe you are only working on this other controller
> and might feel that the primary IOMUX is none of your concern,
> but someone has to stand up and take the responsibility for the system
> as a whole, if no-one else then the Rockchip SoC maintainer, else
> we get throw-over-the-wall-engineering.
Hi Linus,

We have discussed this internally, and we fully agree with your suggestion:
the driver should be modified to *additionally* support the standard
bindings, allowing us to eventually deprecate the old `rockchip,pins`.

**Regarding the RMIO support in this series:**
I am willing to implement the standard `pinmux` binding for the
**RMIO** part immediately in this v5. This ensures that the new feature
starts with the correct, standard binding.

**Regarding the primary IOMUX:**
However, the RK3506 pinctrl support is built upon the existing
`pinctrl-rockchip` driver infrastructure, which was originally designed 
around
the `rockchip,pins` property. Refactoring the driver to support the standard
`pinmux` binding (and the suggested nested node structure) is a significant
undertaking that involves core logic changes and regression risks for older
SoCs. Mandating this refactoring as a prerequisite for RK3506 support
would effectively block this SoC from being supported upstream for a 
long time.

Could we allow RK3506 to follow the existing driver's style for now to 
ensure
consistency and timely support? We agree that migrating to standard pinmux
bindings is the right direction, but we believe it should be handled as a
separate, dedicated project in the future rather than part of this 
enablement series.

Hi Heiko,
Do you agree with this?
1.        Use standard `pinmux` for RMIO in this series.
2.        Keep `rockchip,pins` for the primary IOMUX for now.
3.        Plan a future refactoring to migrate the primary IOMUX to 
standard bindings.

Best regards,
Ye Zhang

