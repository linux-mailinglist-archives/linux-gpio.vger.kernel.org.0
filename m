Return-Path: <linux-gpio+bounces-24899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E7B33B91
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C9F1B25F99
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE94C2D0C97;
	Mon, 25 Aug 2025 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQTan+/f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA51C29CB32
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115300; cv=none; b=SS+kMRX6vSh+CL+PQNYzuagRCAROP3NV4wC7+StyrI6gBTqOdpkDcVUUtnFrGYPX3Kr3ETPUgb/X6wTjrXcdydTDlQIDK1TpC/AbSnEKm7TXLVmP1Z3TsQj4CA9VLX94izd0PXjl9NSSvoWvsyXFGSy8wM1btMfOWt+ABwcyhiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115300; c=relaxed/simple;
	bh=RGPjNT7eYla33Kxu+DaatsNooHQFM4EPX41laHhicrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4Rr0h7S6DLbvpAauphtMrMf8lu4LlyjuiwP9nsjFxVEMcJos176f2G8Hrq9EqiitY/mDJT/rajsmhmQ74Xxk0gcnt6JLIxJ39UGJ3sB5JEAyCXrSDvlga2sv93SNzsjh68QjFlBsORZJFCYpLzWE01u2HunRAFp0OLg4S+5MzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQTan+/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8jWeG014572
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TsxGny5bZmfquQo3c1L1zs/H
	NsPbZHYPUMZ3nblGGiM=; b=mQTan+/fHsOrHGVNQefyE5T5MCZ9H17uK+l5Qq98
	kau9N2gHiyDWr85nuN7oNhlxCAB19HeYYI1LhPOcxfuhdJ9aJmFrRxMUfv9ST7jm
	bltkZ+i7BjHg/hgYmgiD6lJ7Gq3XSeEcHFq0H0vW/JS8Isl8vJtSnp/x3MN8GcFc
	ZggqMXpLOwbD1XMs7GIYpl+EAXApXT5pYydv8273vu0dS5CqzKfIR0/ZNL4Qkuaf
	AW6lyb3oE5duJWWEoTe2QTJ2OZwowiThAbKKPWaTYqOEUxpw7L6ilrd59oV+HhZZ
	LHPy/jGqBqGEUjHMepibYQN9VxfIklQDyTISRnHCbB/LRQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5cjnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:48:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b2d09814efso12259471cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115296; x=1756720096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsxGny5bZmfquQo3c1L1zs/HNsPbZHYPUMZ3nblGGiM=;
        b=OyLtZYmQJZqcsfa7qrGaQnc2NCAQWEDjh+WUaU1NJdiA9cNkbUULSE0Q8pEcg/NXPJ
         dya7Wm045/fmJqH3ZgMBbK9HkEDOha194q+wSBpJEIDsooxrkA2a66yd1Cn2FhOK9aPG
         Klwn4R9EhxAakTaZRerRaR5bqRD4dLu2rfAHXYBrwCqK15H8lpTHPD88OCIYE1XP9KLy
         dvP3zad36SdT4An0hSPZaBb+sGL7KVD73YuoocquMIRVtdNLLYwA128qjAk+YpO8gCXi
         ItVLJ3Jgelr5l+5Sh/E0AoV3NY1rJc0XUHNjjHf6iZa0KE4MwhDc88ziuFq9MWiO9Qe5
         0zWQ==
X-Forwarded-Encrypted: i=1; AJvYcCULeo7+w9cQ87Y//Takb0Ko41gbxx7C/6Kd0yE0UkCQ6KUBpeqxKGVdHItcofaheCo5wY+ABhkfbQG0@vger.kernel.org
X-Gm-Message-State: AOJu0Yza8/o9d3zNa7KEna6ailcRvHErwB9z2ZN7cRt4wLPqNpDEOQox
	vqZveZTLnH1hBkI8N7RQBBrff0zZ1r7Avza1ALsrQsZ9IRGe6/Jny4Pc/WW4feKUuDHTzAobha4
	hIRfF4cYxoSl5nLNhwLQkC04+W0jbyZuaL+bzp1IRMqBMs8DwGm5BPgEa+TPUr9sY
X-Gm-Gg: ASbGncuuz/+v8sD2E10dVTPtso9mAik4U5GHchfErViKwAtShjHHuJ5SN333Db1GK9v
	ixzpgSfMUQkugQyL2WBaE5DXaCpknTmpPgVEuPouu9JhqgrMrfvkoApGD48FaiiwyWuxmDM+e3r
	wLyPcVS/RFG0aaIypNA8KsR2e8Qk0UB6eVytRkE+f1rrgAfB869kuPPzPjvV267wkRlMzgHCr3I
	NyprBi00YLnZ9DpPNOvU7ebgshbZVPBl5lNsHDjYdnaK5E6CgqIO4zV2HNQBAYyBzhzfxrFJYlW
	Z65ix7UxvUm3HjAG25V+9pgsGmCmBG2vNtBi3AMk5Bdj9u1JX/7AuPPbKhjPC04b4WydJnDaNvA
	0fzfGUTnBLX6roT7BsVH05T+uHZ7FPyNvZNa/NH2X8yiNCZowbr18
X-Received: by 2002:a05:622a:199d:b0:4b0:7ad6:ea9c with SMTP id d75a77b69052e-4b2aaa6e769mr105923901cf.31.1756115295744;
        Mon, 25 Aug 2025 02:48:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA24ublCRv50GDQgudcMmYvfl+amokeNBspHjLCVwUTk/6j0Vcg5F5U8Vdo/x+kxEbdB1w/Q==
X-Received: by 2002:a05:622a:199d:b0:4b0:7ad6:ea9c with SMTP id d75a77b69052e-4b2aaa6e769mr105923731cf.31.1756115295226;
        Mon, 25 Aug 2025 02:48:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f49af0439sm95112e87.109.2025.08.25.02.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:14 -0700 (PDT)
Date: Mon, 25 Aug 2025 12:48:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@yandex.ru>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
Message-ID: <lkoealhzrqb6obk7qqchu3pomwo6bklczqtycnrylo3p7rhgug@h7wd4cofmwxi>
References: <20250824-sdm660-lpass-lpi-v1-0-003d5cc28234@yandex.ru>
 <20250824-sdm660-lpass-lpi-v1-3-003d5cc28234@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824-sdm660-lpass-lpi-v1-3-003d5cc28234@yandex.ru>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxtLtLYjya8c7
 8wbXoI3fzAkccomHY/yaZgXEwukFxTv4nFlX35gwHO6U/KkYeFlyB/2bYxoUJjnSHibzhRoKRyX
 aHVLqpX5ZVt11/0bVttP9RI8fiDl9sj7mZgQCaFKXlYA6Wt5lVJmlZLu19n9qB4IV0MHsojh4/E
 bViYQfgo47zFiqEYOUf7E+F7e5xObTb1dMnhBl1EH56ewUv9CRKdXFOPwKfrEAkZ1WetxkYTu0s
 7THvPGytY1NqOhohmlY9dAdS7EetAAQPJfi6XgWu0u7m+2Gj7kqUjt01quZGwv+EFkRgalACWBI
 oYc7VfXjP+723nr9Yuh+rdVUWr++5FKxhh5zUSCFIV8ZJtENhK4XA54lgVdfT6z8+dMaAA84JgC
 /2t4xqcC
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac3160 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=pGLkceISAAAA:8 a=vaJtXVxTAAAA:8
 a=JhL1wmR7AAN73KXSh2AA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: MD_cKcaoR3k4aYyLU9cXEu0fsVFDiVNq
X-Proofpoint-ORIG-GUID: MD_cKcaoR3k4aYyLU9cXEu0fsVFDiVNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Sun, Aug 24, 2025 at 11:42:25PM +0300, Nickolay Goppen wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> Also, this driver uses it's own quirky pin_offset function like downstream
> driver does [1].
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
> 
> Co-developed-by: Nickolay Goppen <setotau@yandex.ru>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/pinctrl/qcom/Kconfig                    |  10 ++
>  drivers/pinctrl/qcom/Makefile                   |   1 +
>  drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c | 196 ++++++++++++++++++++++++
>  3 files changed, 207 insertions(+)
> 
> +
> +	0x0000A000,
> +	0x0000A010,
> +	0x0000B000,
> +	0x0000B010,

Please lowercase the hex. LGTM otherwise.

> +};
> +

-- 
With best wishes
Dmitry

