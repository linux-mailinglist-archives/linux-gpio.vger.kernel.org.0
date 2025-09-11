Return-Path: <linux-gpio+bounces-25953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F3EB5341B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 735C13B4B96
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 13:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2746E3375CF;
	Thu, 11 Sep 2025 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="NsRlRzli"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42C32CF87;
	Thu, 11 Sep 2025 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598125; cv=pass; b=O7S7Ls6tDoSkl/0IzZOUjn5TDtk4mWkVnOx/Pxh/V8ieknVDFpEdoIqBKyimAhTheEJAbliKFRkR70kqvsh+gqVqz19/Cb/o3gasNqFFW35ZaLVjU+PT+ZxH9QFMh95eMkvCNrVWDBR7EMGrFny3yCImNCf/tz3XlQ3i3H5W+5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598125; c=relaxed/simple;
	bh=+j7wH6J9TwHPLevUCUsfv49hVVIfmnnJ50vL4o03eGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0NQbJJa1PT1tE3smNzd6Aj6LIXqEGnI6zLKCb3QguR6IkOinaKLdQsgYv4M3GNOfIvJGWzIDj5A+C5yzlaeNkM1VcGDZFyONDqSbkoG8MXGGvX9n6Lq1YCtEHVHggIV6TRMuBaXW21ckdvvDEqZn9gd+7QAoPKKC9ch+qO96RI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=NsRlRzli; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757598055; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wd4WA6Er9cB9s6Hkt5aT6OBU5Qo5bfiy5l1P+Xa+5VFE3pcj0EYC1irYclVw44xfA/LGEE1P3H5NoyDRj8g5aYL5DO6LFfOSdTi8Xo68/Y7PYyTuxxfNdOv2I+XK48iy/vJy4GjAsgOcqTkVjb0ACFfdnqJgaw2FRauP6e/Vqb0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757598055; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=akxgWnU52qi2aW5V4nycRXC1MA1p0XXtUX8b0SkdlHI=; 
	b=LfUX1aQVAVFdHj8+y0//AJhf1fsHBn+VlpRO4LG22OXZv6/dMLXEYKunDdZoe364LrK8PnREgYhBB/fWBvWDinro5SWb85l1HU8gYCD9V+RoB8cvwAKdJEOq+hDpLHGB00DB6JJkrLd/THhPkaxSJdT3eQR6r8MibvY/ip2bat8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757598055;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=akxgWnU52qi2aW5V4nycRXC1MA1p0XXtUX8b0SkdlHI=;
	b=NsRlRzlifXvTvvkDhLOg2YrB9VbwSR8DvKqJVdp8u4HzCFR5KM3LbVsfzq9vFNLv
	HWBTS+duRr9SPP50E7s5ev8uzaDXlk5sQhS7q0jMxjng1FJa7tsWMU7IDEw8Cg44Nka
	20rr30YjpaoW+uxdoNzBf0ZcDiNq8aysDR0/skEo=
Received: by mx.zohomail.com with SMTPS id 1757598052583569.5590919976829;
	Thu, 11 Sep 2025 06:40:52 -0700 (PDT)
Message-ID: <c473c6ff-856a-4950-9c75-7bace41886ca@collabora.com>
Date: Thu, 11 Sep 2025 10:40:36 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/14] dt-bindings: arm: mediatek: mmsys: Add
 assigned-clocks/rates properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com,
 edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com,
 jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com,
 krzk+dt@kernel.org, kuba@kernel.org,
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com,
 linus.walleij@linaro.org, louisalexis.eyraud@collabora.com,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org,
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-4-ariel.dalessandro@collabora.com>
 <20250821-electric-kestrel-of-awe-cb89dc@kuoka>
 <1cf0b296-adaa-4c80-864c-9b78f09cd3e3@collabora.com>
 <898bf39e-1b34-40e9-bdfa-ec4eca1c3f7d@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <898bf39e-1b34-40e9-bdfa-ec4eca1c3f7d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Krzysztof,

On 9/9/25 3:29 AM, Krzysztof Kozlowski wrote:
> On 08/09/2025 21:19, Ariel D'Alessandro wrote:
>> Krzysztof,
>>
>> On 8/21/25 3:43 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 20, 2025 at 02:12:51PM -0300, Ariel D'Alessandro wrote:
>>>> Current, the DT bindings for MediaTek mmsys controller is missing the
>>>> assigned-clocks and assigned-clocks-rates properties. Add these and
>>>
>>> No, they do not miss them. I don't understand why you are adding these.
>>
>> The reason I added these is due to the following check error:
>>
>> $ make -j$(nproc) CHECK_DTBS=y mediatek/mt8173-elm.dtb
>>     DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
>> [...]
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscon@14000000
>> (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do
>> not match any of the regexes: '^pinctrl-[0-9]+$'
>> 	from schema $id:
>> http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
> 
> This is looking like missing clocks or other unevaluated property by the
> binding.

Agreed, the rate assignment has to be moved in other DT nodes, it's not 
a binding issue.

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


