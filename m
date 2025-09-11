Return-Path: <linux-gpio+bounces-25956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBFDB5355D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 16:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3A687A28E9
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 14:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231DD33CEA8;
	Thu, 11 Sep 2025 14:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="ZCWq2Dt/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD122259B;
	Thu, 11 Sep 2025 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601071; cv=pass; b=AxW569ca/UZ9VVbILIlOHvBwNV5H7uKXnt7AW5X+Rql6M9tRF8W/EPfsAt4+0u5dwKj0umNqXkLGDckr+v7MSZfyBXXW/hKE0/81GePp+AEL/yi2PeCOEWZIQ11kj1c+ysiKl247Dc82LPnlCYWma2mpzVUSOnMK0WYWGU3SQeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601071; c=relaxed/simple;
	bh=ENyo8hlExL0a64lneN3wYIQx9ceQ4J02gvt6LoyVFaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmdEz6WnYVzJogjLHGGT7dHaNP7KbvF289LTQcJkzHcILlYjDPF0QXKsM6z7zrgwZLd+F+g2PCd9S7qQ20mvYrJbN1hy57upXwzq3vIE/JFDuhCTgwihrvyXioR96Y5mIWM0rVYgGMvn7z3ubc1chgK4i1tYhhDs3ABzpKPVgFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=ZCWq2Dt/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757601008; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fKylatfoGlWuRdvSCbn3egSlJ82Cbc81pjdBqhTrxvRWzYzpTEHGB+pEol0MxJFv7cSofmdSTGfeMveBJ4mREx8G0LNwE4bLDqwId4ZgLEBpbzxFN5xNm3TfnYFrjN4gd9GASWxHA6CkqAJFTwF8ahTJVfVL7hALfGHbVQ+PHwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757601008; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Mt87tHkCDrz9K7C85pTFu77GL3qr/zrL67mBd2f4Ly4=; 
	b=ggbsi/0msrtWqOmLEDVikyKSGUHKt7JutW13zHhtrhLZBh0iFNMP/iLNtcBHMM8VJQQloVCdWfwAJp/kcnqt5JjF3WtDZmfGJbgZoBeqeXi4CvWMjPiwUzZUx0ukViLgRPnLZVHklPCxqzP1hm9l0qN0YxKWLqXUyk6AsisUGWc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757601008;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Mt87tHkCDrz9K7C85pTFu77GL3qr/zrL67mBd2f4Ly4=;
	b=ZCWq2Dt/O+0lXM5sUN/qed2Rp3/lwSfyQJVEzLijcl+pa7YXFipLOLT0myJB/N9/
	Oq1o7TaV4NBQPNCrbWbExkBpxQABWH1+bda9C3mCLe1Nwh8zGc7CcC7tk4gO6ltwUvI
	XH41PpeHAD6HBnluijWBcoUR53jddWzEKR6ukUKA=
Received: by mx.zohomail.com with SMTPS id 1757601005694334.08530516479357;
	Thu, 11 Sep 2025 07:30:05 -0700 (PDT)
Message-ID: <5486a77a-7c5b-4316-9ff9-4cd458fb1001@collabora.com>
Date: Thu, 11 Sep 2025 11:29:48 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/14] MediaTek dt-bindings sanitization (MT8173)
To: Mark Brown <broonie@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <9401aab0-1168-4570-a0a1-1310f37142eb@sirena.org.uk>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <9401aab0-1168-4570-a0a1-1310f37142eb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Mark,

On 8/20/25 2:19 PM, Mark Brown wrote:
> On Wed, Aug 20, 2025 at 02:12:48PM -0300, Ariel D'Alessandro wrote:
>> This patch series continues the effort to address Device Tree validation
>> warnings for MediaTek platforms, with a focus on MT8173. It follows the initial
>> cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780177.html)
>>
>> Similarly to the ongoing MT8183 work done by Julien Massot, this patchset
>> eliminates several of the remaining warnings by improving or converting DT
>> bindings to YAML, adding missing properties, and updating device tree files
>> accordingly.
> 
> Same question as for that series, what's the story with
> interdependencies between the patches?
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

I'm resubmitting patchset v2 with several fixes addressing feedback on 
each patch. While doing so, I've updated each subject line according to 
each subsystem log.

Of course let me know if this still need some work.

Thanks for your help!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


