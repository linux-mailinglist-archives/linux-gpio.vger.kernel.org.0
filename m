Return-Path: <linux-gpio+bounces-25915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE68B51C77
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 17:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95E625E7643
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 15:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5561E32CF7F;
	Wed, 10 Sep 2025 15:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="H0jHV6yu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26582327A2C;
	Wed, 10 Sep 2025 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757519532; cv=pass; b=rpKKkt0a3xkLKc8yRHHh8dUMZi+hGEIidHr4fdkkfYdk+MjGYjJCGjc6DnoWKupHOHu/4psSJ7qyybAkFXzijtBQmlvxaZLBwqfaVfHYW/T1qBW08CkUya5ltGsj1Z+BL7We8RPJOLhQcr7rRXA98hsS8fk/esFn52iETRVsNik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757519532; c=relaxed/simple;
	bh=bHbPI6UhuYtRvRSt7bYBxVi+CqA6cKZok96H0N6keKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qABhSn0o55wK39RwQc35Aw4sEEqCLcmsbGnGOzRZCdcFqnQEIRwf03ZPnuaeN950EQhbl/bROYELR1R6+xuBvO56/mVx32Hw5Lyt8c/mM/nR3/HJFp1HcyW/3R5Aw3edMpHP1KObRLYNPZ9kXHpmViZH6laBXUDZMm7jlMCKdPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=H0jHV6yu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757519478; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i/p8AVc1BSekWX4Lt0Dw6EglB1upCj+tY/DuxcJdAKelj/805ap6QjnB2sy6CU4hs8AQVtSC9XTJeXT2YWaC7/kF1ukjvjy5E+FhYu0Il5ux3IKxX1sgRBDS+D6M5jDA2si7QOLHVHSPCN4UdV9LXVoI6LbJcSuxlppaxNOeszw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757519478; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mipfafpKe4+epi8rhd9VJ21QHidqNimDzrKTJaqkwGE=; 
	b=SrfTp56rOukd1bPhU1vdDrOhe0AzS34sHk3Wu6wsqq7DFO/XQW6X7KXa3fB8iRIkjWyASiJSAQGg1M758xjUfqxM5usDXjSzVMJswWElqXp8oNLPHXEg0Ah/NfkInNB9acaEK3lbp0mPlC9XirzHHrZcVOU7lTr3a7ZB5mkayL0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757519478;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mipfafpKe4+epi8rhd9VJ21QHidqNimDzrKTJaqkwGE=;
	b=H0jHV6yuSzKnuEQQ6ZummRHbYzEC6s23vy+gecAvVk4q+zdPaRfXyUsiDW45SgiY
	YQoq8ZVhkDgBo3pDR4uCWRhKZC3ONXuWa2MffuAMX8ndEqU98xYfQaHFgQmGUNybAW9
	Tr64L2Mc48Djjk/cg1JvyPmmiTsPJrhpkwtRkfyU=
Received: by mx.zohomail.com with SMTPS id 1757519475232994.3231024073066;
	Wed, 10 Sep 2025 08:51:15 -0700 (PDT)
Message-ID: <742b8fe9-bbff-4f36-ab81-33772aed2d6e@collabora.com>
Date: Wed, 10 Sep 2025 12:51:00 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: Rob Herring <robh@kernel.org>
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
 p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
 simona@ffwll.ch, support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <20250822155257.GA3865729-robh@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250822155257.GA3865729-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Rob,

On 8/22/25 12:52 PM, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 02:13:01PM -0300, Ariel D'Alessandro wrote:
>> Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
>> controller to a YAML schema.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../input/touchscreen/melfas,mip4_ts.yaml     | 55 +++++++++++++++++++
>>   .../input/touchscreen/melfas_mip4.txt         | 20 -------
>>   2 files changed, 55 insertions(+), 20 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
>>
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
>> new file mode 100644
>> index 0000000000000..170fd4212467e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/touchscreen/melfas,mip4_ts.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MELFAS MIP4 Touchscreen
>> +
>> +maintainers:
>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: "melfas,mip4_ts"
> 
> Drop quotes. With that,
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Ack.

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


