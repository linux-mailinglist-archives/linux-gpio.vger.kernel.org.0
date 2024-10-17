Return-Path: <linux-gpio+bounces-11512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B1C9A1CE8
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 10:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F71B1F278DB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD21A1D5ADE;
	Thu, 17 Oct 2024 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TMEq17bF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3242056;
	Thu, 17 Oct 2024 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152944; cv=none; b=Caxdv3VoRgNAercrHXE30df/nfhicSPIR2TPBTMsdWhYjNgggDaWZhM9OwETkuWaJp73nMIVecYBsf2hqZRfivRYawKR3YDxPMxqfBxKOzm6mKyN2qyzeXGB4ZsZgfsbD++SuQQcaLzMpqYn6NzDyYFQ57ifjwKOF/DezRjx5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152944; c=relaxed/simple;
	bh=G6hNOVeDggqQbVNUc0/wip1gX8AR9sqCbjIxljveeV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A7RmVfgjcHl3CFhcmIsP6M7B0cYj5tqnzd5nf+zjWSgqxc0FlI3Mcn/8doN58BxgvxDBzjg3rFZLJv8bKTQbFUDsM3XVpH+sc1V0AeqNITBCxvTExK2u/p+JNnIqeQxpCtvuWPcrv92eCdnb11wGpgWFMf+oh+hCmAuB93tO13g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TMEq17bF; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fb55b6b68c5f11efb88477ffae1fc7a5-20241017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=PB5WhQujeElFpl56LXFf3cDTX5MtznAh+J+4T0I+trg=;
	b=TMEq17bF1nBaefJOAFQXpHGpHQlT/ttuFUD1zuqdA7N9VjSyXm2u3+IArrmLmwSD843jncwcRetX/K8vYQZ0qUxuKp5lhrtbOSlgXpHU1QBDcQ1jCanKKyrprce1tbtnOsKDWNc6QNXJnyG3B2i+v3+2GOrmzz1A1CGsuZYy2MY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:bdd200df-a6db-4ee4-b6f8-607b433bfaa4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:64be6465-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fb55b6b68c5f11efb88477ffae1fc7a5-20241017
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1576536991; Thu, 17 Oct 2024 16:15:33 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Oct 2024 16:15:32 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 17 Oct 2024 16:15:32 +0800
Message-ID: <433295fe-8d34-af8b-f6bf-be1953b6e479@mediatek.com>
Date: Thu, 17 Oct 2024 16:15:30 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] pinctrl: mediatek: paris: Revert "Rework support for
 PIN_CONFIG_{INPUT,OUTPUT}_ENABLE"
Content-Language: en-US
To: Bo Ye <bo.ye@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <Jades.shih@mediatek.com>,
	<ivan.tseng@mediatek.com>
CC: Yongdong Zhang <yongdong.zhang@mediatek.com>, Xiujuan Tan
	<xiujuan.tan@mediatek.com>, Browse Zhang <browse.zhang@mediatek.com>, Light
 Hsieh <light.hsieh@mediatek.com>, Evan Cao <ot_evan.cao@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241017075522.178337-1-bo.ye@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241017075522.178337-1-bo.ye@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/17/24 15:55, Bo Ye wrote:
> [This reverts commit c5d3b64c568a344e998830e0e94a7c04e372f89b.]
> 
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
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> Signed-off-by: Evan Cao <ot_evan.cao@mediatek.com>
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>

The "Fixes:" tag is missing. Please add it.

Besides, please update "MAINTAINERS" file with the correct owner.

The Linux kernel is open source and anyone modify it.
If the patch appears reasonable and has been tested, it usually
will be accepted as long as there are no opposing review opinions.


> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 38 +++++++++++++++++-------
>   1 file changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 87e958d827bf..a8af62e6f8ca 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -165,21 +165,20 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>   		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &ret);
>   		break;
>   	case PIN_CONFIG_INPUT_ENABLE:
> -		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_IES, &ret);
> -		if (!ret)
> -			err = -EINVAL;
> -		break;
> -	case PIN_CONFIG_OUTPUT:
> +	case PIN_CONFIG_OUTPUT_ENABLE:
>   		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
>   		if (err)
>   			break;
> +		/*     CONFIG     Current direction return value
> +		 * -------------  ----------------- ----------------------
> +		 * OUTPUT_ENABLE       output       1 (= HW value)
> +		 *                     input        0 (= HW value)
> +		 * INPUT_ENABLE        output       0 (= reverse HW value)
> +		 *                     input        1 (= reverse HW value)
> +		 */
> +		if (param == PIN_CONFIG_INPUT_ENABLE)
> +			ret = !ret;
>   
> -		if (!ret) {
> -			err = -EINVAL;
> -			break;
> -		}
> -
> -		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DO, &ret);
>   		break;
>   	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
>   		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
> @@ -284,9 +283,26 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>   			break;
>   		err = hw->soc->bias_set_combo(hw, desc, 0, arg);
>   		break;
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
> +				       MTK_DISABLE);
> +		/* Keep set direction to consider the case that a GPIO pin
> +		 *  does not have SMT control
> +		 */
> +		if (err != -ENOTSUPP)
> +			break;
> +
> +		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> +				       MTK_OUTPUT);
> +		break;
>   	case PIN_CONFIG_INPUT_ENABLE:
>   		/* regard all non-zero value as enable */
>   		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !!arg);
> +		if (err)
> +			break;
> +
> +		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> +				       MTK_INPUT);
>   		break;
>   	case PIN_CONFIG_SLEW_RATE:
>   		/* regard all non-zero value as enable */

Best regards,
Macpaul Lin

