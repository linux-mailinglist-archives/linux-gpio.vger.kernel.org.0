Return-Path: <linux-gpio+bounces-26733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50FBB15D3
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 19:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C6A919C0829
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 17:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06372D3ECF;
	Wed,  1 Oct 2025 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="ayZLW0XU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8630A2D374A;
	Wed,  1 Oct 2025 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759339712; cv=pass; b=T25P86YSVQaiawepoRBXXG3KvO0RPv4PcC6MEJ0HJSbJZtESdE+GBTiJTcIQ+TQE6FjSdL+Ga/g1mraavZYMxnaC0gX4NXrh5X/Ouu2hk2TUPBhMX5G5l67vOpmwmthaIRnjZRy23b5KDxzDCeMz9P7qZNyOkTwSr17wL0mO05M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759339712; c=relaxed/simple;
	bh=IK8WEEqSDExpWz2f7En5/R9/r1YFlPe28HNQLepdFy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7+bY7BXMSfXFJmmXNGbvPNPhfZNvAvscMXY51rm1wBX/i0HASSVajyEogAdCj0vVCE5GLCBRbMK8wUL5O+kSUBsjqWn2U2nTsxk/CTqSKnMs3nc2lBfnOABnzyxuMUXdoEIPj0jS0goe1bITGwgoJOpf2ZbR5d/Y4IqcB93Dnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=ayZLW0XU; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759339654; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dkp23wMelI93bQRBVAh4qzEHuDMvqEOtoSvdXxl/dCc2RST94/dd+ECyBhd7rmZZQBzInVt+3r87Nj+j2eogPBFO2zcRxZ0oASTeprZ/CtDxaGmjUQ1L7s204PulOqJ9IJfFtaEbWhx3lCZXLWsDSdVR0hFA5M4aIpuXvg8cM00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759339654; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T7mrSbEy/aAXg+6oqjnfTR08iGllMdtI2IpFi/J5V5E=; 
	b=D7FJuPtuW1gADbBSn6bbvkh0fP0Zx2wrTVz4MOQ332+7LEBrZ8QCh/J/fugV2uyGQ4+m55Hwc6Z+y2kXOiRJ350oRS1UihIhN+3Z/Sg2OiYMo7uILAXC8M9V0RmzpaSeHySMjHgJJT7p2y0VN4UJ6uPYj6qHSYRNS58idfhy6zA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759339654;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=T7mrSbEy/aAXg+6oqjnfTR08iGllMdtI2IpFi/J5V5E=;
	b=ayZLW0XUN4u7dJENrthFwUqHzKCDhi5MZ/2z3kwIntkS1giAhgscYr0ggvdmgqxu
	P1f5y5iKqKdyIhfIA/8gvQwUzkGiOQJ44EFtm8y5mUaEioqDTQ+FX/piTv/FbvMwjkL
	XKC7Kt6A08WtQwH6KFer0lKPTgDyK0iVLrO57yCI=
Received: by mx.zohomail.com with SMTPS id 1759339651509186.59741864627483;
	Wed, 1 Oct 2025 10:27:31 -0700 (PDT)
Message-ID: <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
Date: Wed, 1 Oct 2025 14:27:15 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] dt-bindings: net: Convert Marvell 8897/8997
 bindings to DT schema
To: Rob Herring <robh@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-4-ariel.dalessandro@collabora.com>
 <20250912140619.GA1293647-robh@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250912140619.GA1293647-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Rob,

On 9/12/25 11:06 AM, Rob Herring wrote:
> On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
>> Convert the existing text-based DT bindings for Marvell 8897/8997
>> (sd8897/sd8997) bluetooth devices controller to a DT schema.
>>
>> While here:
>>
>> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
>>    schema definition as these are currently documented in file [0].
>> * DT binding users are updated to use bluetooth generic name
>>    recommendation.
>>
>> [0] Documentation/devicetree/bindings/net/btusb.txt
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 ++++++++++++++++++
>>   .../devicetree/bindings/net/btusb.txt         |  2 +-
>>   .../bindings/net/marvell-bt-8xxx.txt          | 83 -------------------
> 
>>   .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
>>   .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
>>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-
> 
> .dts files should be separate patches. Please send the bindings patches
> separately per subsystem so subsystem maintainers can apply them. All
> the Mediatek dts changes can be 1 series.

Ack, will fix in v3.

> 
> The schema looks good.

Great, thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


