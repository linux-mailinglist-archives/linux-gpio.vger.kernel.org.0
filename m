Return-Path: <linux-gpio+bounces-11544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BEC9A231E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 15:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93DA11C262A2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAE01DE8A4;
	Thu, 17 Oct 2024 13:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uyZ21wNl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E971DE4FF;
	Thu, 17 Oct 2024 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170491; cv=none; b=CbmExtCUr+grvUnSgKUX1xEd0YNeq3XRNdUSgD76jhulc45wQsF141Tm1gn11One4dgKrgRWtlHJDIyg3UaOYCx54u2zNEeq2lWn5N750huum4QaribImVAmqGY+FicoF+2tAzVYYt4Vjg11BspSr3W4IzbeqSVA3hdjdcJ16mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170491; c=relaxed/simple;
	bh=LjOmfM6uUIDdQR5MPrfSKKZ1tiLjWQIo0f2A44NEoZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TYslmySNOStsTzce04zf9BrBkSIm10uWSYGFbf2+bKAQJnV2giraC/2Cymd8Y+6dfj3hADvV+JfdFDf2QkcOmgoh7iWkeaaUZ9KLoWY5Sy92CQhwV+dYthecCHE1xD9+oh6pmMQ/keVQMu086/pAcbW/Fc08oqWBKhlMMn8ucoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uyZ21wNl; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d52d9df48c8811efb88477ffae1fc7a5-20241017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=sAzYeyhGebQ0dEi2TLDVwCGX61/HFQTh+vNjDu3CzfM=;
	b=uyZ21wNlDkBj4Pf4lqVfmmU1Zjan5onrL7vASBAmPUYntWYh4mI7yTIBO4NppZpqEhekBdodHI/gsoCxZN7ngTmClw4KXjs78imTKC7QA9b7ot0yCHyoGcZCg0omz/d9tx9aswHFgOVPEtjLtPFD7PPoCgv4qGCP14dHV24qZIY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:283b1c42-4175-4012-b021-d999102435eb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:87776a41-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d52d9df48c8811efb88477ffae1fc7a5-20241017
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1266342419; Thu, 17 Oct 2024 21:07:59 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Oct 2024 21:07:56 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 17 Oct 2024 21:07:53 +0800
Message-ID: <17a8f8ce-0623-2e65-deaf-a760862f33c6@mediatek.com>
Date: Thu, 17 Oct 2024 21:07:51 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND. PATCH v1] pinctrl: mediatek: paris: Revert "Rework
 support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE"
Content-Language: en-US
To: Bo Ye <bo.ye@mediatek.com>, Sean Wang <sean.wang@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	<Jades.shih@mediatek.com>, <ivan.tseng@mediatek.com>
CC: Yongdong Zhang <yongdong.zhang@mediatek.com>, Xiujuan Tan
	<xiujuan.tan@mediatek.com>, Browse Zhang <browse.zhang@mediatek.com>, "Light
 Hsieh" <light.hsieh@mediatek.com>, Evan Cao <ot_evan.cao@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Bear
 Wang" <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>
References: <20241017091238.180920-1-bo.ye@mediatek.com>
 <20241017091410.181093-1-bo.ye@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241017091410.181093-1-bo.ye@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.173300-8.000000
X-TMASE-MatchedRID: QW5G6BKkLToOwH4pD14DsPHkpkyUphL9gHzgwy8qV5oOkJQR4QWbsD7G
	etjxIg5SEH8iVoDMqR50XH1HHT0dkh9tyJCN9GW1+nWmWoRu6rE5vit32ngSw8lmyIrLVcm1tpB
	ukiTrasdP7y/XtCN0jd1d7aF3CVBvfnaS/XTl0BLhuXUWQoMQt0yQ5fRSh265CqIJhrrDy28Lhh
	yrdR5RU8z/3xojTGB1HIoH5j4GqUBI/m1jbRW7J7Muc03hWzjbsuIso71Vk6LJYIv7y0tu9gOR3
	tZA0vji4vM1YF6AJbZFi+KwZZttL7ew1twePJJB3QfwsVk0UbsIoUKaF27lxRlt5C0CRqm66uYV
	UUIJYEeWUQGHWRoNfxbMd1Bwmhjvo2Kdp6eQFqcuEtc7PqLQMJr9hTHcIyXRTAxQSHbx/8uvb6Z
	OHTB4DHzlz/HUVCh2B6+0uCqc8tyLs8R3TAgGUSPYQweeBxKQnqg/VrSZEiM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.173300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	DD1DF661CCD454EF9FBB90CFCF196A981024EA541D5F07349B705F1DA149245F2000:8



On 10/17/24 17:14, Bo Ye wrote:
> [This reverts commit c5d3b64c568a344e998830e0e94a7c04e372f89b.]

First, this should be "PATCH v2" since you've already modified commit 
message.

> For MTK HW,
> 1. to enable GPIO input direction: set DIR=0, IES=1
> 2. to enable GPIO output direction: set DIR=1, and set DO=1 to output high, set DO=0 to out low
> 
> The PIN_CONFIG_INPUT/PIN_CONFIG_OUTPUT/PIN_CONFIG_INPUT_ENABLE/PIN_CONFIG_OUTPUT_ENABLE shall
> be implemented according to view of its purpose - set GPIO direction and output value (for
> output only) according to specific HW design.
> 
> However, the reverted patch implement according to author's own explanation of IES without
> understanding of MTK's HW. Such patch does not correctly set DIR/IES bit to control GPIO
> direction on MTK's HW.
> 
> Fixes: c5d3b64c568 ("pinctrl: mediatek: paris: Rework support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE")
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> Signed-off-by: Evan Cao <ot_evan.cao@mediatek.com>
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 38 +++++++++++++++++-------
>   1 file changed, 27 insertions(+), 11 deletions(-)

Please add change logs in this section.
For example:

Changes for v2:
  - Update "Fixes: " tag in commit message.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 87e958d827bf..a8af62e6f8ca 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -165,21 +165,20 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,

[snip]

Please reply all the questions address by the reviewers.
For example:
[1] 
https://lore.kernel.org/lkml/433295fe-8d34-af8b-f6bf-be1953b6e479@mediatek.com/T/#m168c6138c374009990025b0407f617ba10dede8d

Otherwise this patch will hard to be reviewed.
Any open-minded discussion contribute to the improvement of Linux code 
and the community.

Thanks
Macpaul Lin

