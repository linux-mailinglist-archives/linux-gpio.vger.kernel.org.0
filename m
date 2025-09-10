Return-Path: <linux-gpio+bounces-25916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F1FB51CE4
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 18:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39D841C87351
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 16:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DB7335BC2;
	Wed, 10 Sep 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="NNi7LZBV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14EE321F3B;
	Wed, 10 Sep 2025 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757520152; cv=pass; b=pniU4QJiKCp8YIL5pb8RETbUPaYx7fRMNxoEqfBfoKR2wtKWkPb9l4w5daxJt3j9vjBEMtG+438KbVCbGZwSyclJ/dGP7Tpt94SxCRXirJwX5iVfd9/N1pOg5HMArQczlZcwDe28w+zmtXzb3NBZLZySvrYoFeRrtNOv6VuFuUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757520152; c=relaxed/simple;
	bh=VBGasfSXDfmNknPuWb239zD2FB/oTXbNwUswyjyWCcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u00B4tX+ycayT6qOVnzzWHlPE89lIJ3vBQyvYIcsNw3IpaIV8AZ4hlMWPCmdVaW5fXpJ2u60sD+n46/ae1OADd4+apSnJnpgvT0IFUvqfc+yC/Hzz/gC8HFDjTKd9R6xs3i403vvVjVrItj3sO+w5H2WPuir0j8NqtrxeYKABFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=NNi7LZBV; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757520086; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R5DDqmabhsADtMQCa2PEdFT6F6wXS9UD/gGmpLywYcPrMKfhq88xNdBkGb8waBzjsKLkauIkTZ7z1RrkRmx77yxGkMbmt4pn6EQY273AbNRYhBkKrWQsQCCodV5fCFt+Cj1jRCQZhj/po422gXn04MM32CEJaiiCea5eXeOEiD0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757520086; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VwPPYJTQ/XXwyamtgAxlZ1NzteBcBgnI+IIDSuPw/fU=; 
	b=R1Oct9/K0pgrsE6ekil11c92iYphWLbg1NfznTSVdecOiUThXFJD1HAwSAGsj1jCTP4WnUmmCJzdJmNTcxwzCvtPBuwMVx9tq3arn6K65HuQ6uowbNLYIFAbsWPnMc5xk99S9/1Prfjkr5wM34P6crUTigUGLLtUVHH32uXx5Zw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757520085;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VwPPYJTQ/XXwyamtgAxlZ1NzteBcBgnI+IIDSuPw/fU=;
	b=NNi7LZBVPN/l/xAW+MYrNHuVhd3P5biETVJMrjrMGhoO7Szh7a/eXWCGKVyejaWg
	AUU46rWM9rcHy4fqDfkLmO5jQ3oCB1ppq9L7YS+VbG/zh9hiHS+HkbgMig99r/4Z2TX
	wYz1HTF4q2uewOLrLqy2+D5+3paLJyIyf7EEXJJk=
Received: by mx.zohomail.com with SMTPS id 1757520082828908.8305273727573;
	Wed, 10 Sep 2025 09:01:22 -0700 (PDT)
Message-ID: <7523752e-eb7b-4211-84f2-33916c39ee2b@collabora.com>
Date: Wed, 10 Sep 2025 13:01:07 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 conor+dt@kernel.org, davem@davemloft.net, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, louisalexis.eyraud@collabora.com,
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
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
 <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
 <CACRpkdZRHQ6vuchN8x8d0uPCVMPPHOdBVWiUhzFJNs2paHGbYw@mail.gmail.com>
 <f199fc0b-20c0-4c22-b0ed-c508514b60c6@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <f199fc0b-20c0-4c22-b0ed-c508514b60c6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Krzysztof, all,

On 9/9/25 3:56 AM, Krzysztof Kozlowski wrote:
> On 05/09/2025 13:33, Linus Walleij wrote:
>> On Fri, Sep 5, 2025 at 12:02 PM Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> wrote:
>>> On Thu, Aug 21, 2025 at 01:56:24PM +0200, Linus Walleij wrote:
>>>> Hi Ariel,
>>>>
>>>> thanks for your patch!
>>>>
>>>> On Wed, Aug 20, 2025 at 7:17 PM Ariel D'Alessandro
>>>> <ariel.dalessandro@collabora.com> wrote:
>>>>
>>>>> +  ce-gpios:
>>>>> +    description: GPIO connected to the CE (chip enable) pin of the chip
>>>>> +    maxItems: 1
>>>>
>>>> Mention that this should always have the flag GPIO_ACTIVE_HIGH
>>>> as this is required by the hardware.
>>>>
>>>> Unfortunately we have no YAML syntax for enforcing flags :/
>>>
>>> Theoretically there can be an inverter on the line, so from the AP point
>>> of view the line is active low while from the peripheral POV the pin is
>>> active high...
>>
>> Yes, I think someone even proposed adding inverters to the
>> device tree and was nixed.
> 
> It's not about DT, it's about board design - you can (almost?) always
> invert the logical signal, so this should match what hardware requires
> plus any inverter on the board.
> 
> 
>>
>> It's a matter of phrasing I would say:
>>
>> "Mention that this should nominally have the flag GPIO_ACTIVE_HIGH
> 
> No, please do not, it is wrong. If hardware requires active high, then
> just say this is active high. But the actual GPIO flag depends on the
> board design if signal is inverted.

After the discussion from this thread, will mark it a "active high" in 
the property description for v2.

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


