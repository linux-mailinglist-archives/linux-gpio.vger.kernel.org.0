Return-Path: <linux-gpio+bounces-25913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B853B51B13
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 17:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 929DEA0378B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 15:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BC0329F00;
	Wed, 10 Sep 2025 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="jQPxB1FV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE3F1E8320;
	Wed, 10 Sep 2025 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516625; cv=pass; b=NPfXtVQzPpNAND/qnb2sYWnfgJxaVq+Xu+kd4OQzb2AYYWpM29AjqwXC01jA7tcdpmIzJqPYzeLm2A1JEshjP1WYSeeifPusncKZFcDZN1KGpW/wMmz/qcFBRyHJBeodSTe3OCTZSFHl4ZzJUVQjSldJsO/8nMBxbgn2h/IuLcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516625; c=relaxed/simple;
	bh=Xw+/4WyQm5ISX5P9Xq6fcVT5Ub7wAv4zcJxXCMGhux8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZljhatN7/RgSYxQajzCZRsJUsJqrucA5+VPQ6nIDKSg2+jA0AbtQ6x7DNfseez4lEH6uL4X0wteJGKWLmmLAKCVKByJbxn1Xsm5UL22uVAc/4FMn0ZCctW0gQqcnNGSy1L8htmfgnwVYH8QZF4bKGWWwEAFaZmX6abJGxdG28cU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=jQPxB1FV; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757516557; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OjGcbwHQ7qFc4F9AAkVwIzKWD5HRtNcVph5abNLqKUYPGk4w1ePjBCj0tz7hti9MHbxdOhEYELdQk/ziPXJHC2RDGoKpa9/5V5AU76oYgTS7M4uFLMI+DKOBXicgR2t+7eQlayb2lIUGu7Thpeqbqbt6dIgRH5W5B/PtH+5r7iQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757516557; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QfGtFkV2BjKT/6QYgO3xE9sPr0RNHiuBKm13evHqiAQ=; 
	b=LOEC3tcunob47lit5X+QQ9cxlFjZCpyRGy0IBEJP/2ah/bJ6nUgxS8poFqqzD1B/vLwVrqQVOYrF+0STYNRWbvQfXdnIeWb9becwEvVf8U6HrNC2fD1GBVkDCe8oB8ETdatHQJqPnph74AncKieCSksqeFj/wxL2bVtsipVvcOM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757516557;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QfGtFkV2BjKT/6QYgO3xE9sPr0RNHiuBKm13evHqiAQ=;
	b=jQPxB1FVZqyhfX615s1wyOYg+A9wixZAqzUKYwPAYzueo/S9dJFzf0F2jcR21D0D
	Scy1nrNCr6VGsY3IM6pc3R62vRrVdqtj1AgrtdZQRCsDrWeQgb1iGdpx2unAltp3b8y
	RazFXuHMg1VK5VGe5MWq7DkXjZp4cPizww9OdPxk=
Received: by mx.zohomail.com with SMTPS id 1757516554744986.7207805498508;
	Wed, 10 Sep 2025 08:02:34 -0700 (PDT)
Message-ID: <6ebef7d1-69b3-4f40-85ba-3c15653eba8e@collabora.com>
Date: Wed, 10 Sep 2025 12:02:22 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/14] dt-bindings: media: mediatek,jpeg: Fix jpeg
 encoder/decoder ranges
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
 <20250820171302.324142-15-ariel.dalessandro@collabora.com>
 <20250820185508.GA273751-robh@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250820185508.GA273751-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Rob,

On 8/20/25 3:55 PM, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 02:13:02PM -0300, Ariel D'Alessandro wrote:
>> Commit 14176e94bb35d ("arm64: dts: mediatek: mt8195: Fix ranges for jpeg
> 
> That commit is not in any upstream tree.

Ugh, indeed. Dropping this patch.

> 
>> enc/decoder nodes") redefined jpeg encoder/decoder children node ranges.
>> Update the related device tree binding yaml definition to match
>> mediatek/mt8195.dtsi, as this is currently the only one using it.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../media/mediatek,mt8195-jpegdec.yaml        | 31 ++++++++++---------
>>   .../media/mediatek,mt8195-jpegenc.yaml        | 15 ++++-----
>>   2 files changed, 24 insertions(+), 22 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
>> index e5448c60e3eb5..b1f3df258dc87 100644
>> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
>> @@ -36,7 +36,7 @@ properties:
>>   
>>   # Required child node:
>>   patternProperties:
>> -  "^jpgdec@[0-9a-f]+$":
>> +  "^jpgdec@[0-9],[0-9a-f]+$":
> 
> This is wrong unless 0-9 is a separate, distinct address (like a chip
> select #).

Ack.

Thanks for the feedback.
Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


