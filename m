Return-Path: <linux-gpio+bounces-23505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D3B0AED5
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 10:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634653BEDE1
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6DB236A9F;
	Sat, 19 Jul 2025 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYluWSHX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794B023534D
	for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752914332; cv=none; b=PMOTcs9SQ2Rq48m4zrgUgN0kfXvZz2Dh75Tub6CRzMvh32AhVYbU/FFcaRoYV1+D/mqoa0xolm+wDAMdAnpYnRDd2cV9MYwIUNBXhhC8RLQDENrEwGPN7iOzlj1jtK4ScDXWsx9ei0XVh6bh3KbxT6jvsQKPllQT4nFLOS8PCKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752914332; c=relaxed/simple;
	bh=Ur4VPWnq3uw4FdWmt/9pK+hBwvb6OqyunFEN7NVZwmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGxsDxGsEXWZNMsOvWEkIPfA117yVCMfG3dsQp8KjyYqEa7FPmYY+uabY8tY7m2HeJiGrO5u+yPTMd+3w3iq9YoiuYFIJLbOTPpm7JhrblQ9610x9qt2KiyLd+SIvZnDHRWH28XeKmuYwuR4gVLEiAPugGJ3QHK8UE/tIZuEfDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYluWSHX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J7O4kD011263
	for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 08:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=glsksHZF4qm47GLf5Dr0eBBk
	p9qudOP0OhFzI5tDeNg=; b=iYluWSHXdy60NCiKDZwACKpvFtNJB7W1ALMHW34Q
	KWZL1uZi2Xvln8LjANXoqFM14m4qzLWEtgZqHWl4mOiPL9B8PVnVEvV8J+QMHJoP
	sadZ44Zo8vACLx3zQt52G9RB3H+1VIa3/1n55zFrEoo4kWQuMGoeCNm72HD/RUKg
	Faod/Mi9FJcnp1VS3D2wTDtmmScXmZWwwbOwC8Ryk+3Z1tnJHcBE0BU3sCCpl9WS
	kCJMjeCa3CWM+H6bInMXhNGdCNualDhnbp/suXLC9OgdHTGFCDUXV0ysQP/KPIAj
	E3IQWdDFZU8E2hsOEDUyAVJaXAqte5NIgwn2248M8yIrow==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044f8buw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 08:38:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fd5e0bc378so47479076d6.1
        for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 01:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752914329; x=1753519129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glsksHZF4qm47GLf5Dr0eBBkp9qudOP0OhFzI5tDeNg=;
        b=ZEaCFtkbyGStYB5BLM6eLHPjLEmHAXR6sYP6ztmzitmeBfIyxJ/Kdb2zybc2zVio49
         3W6VMunM563RH1A0AzdbEnU9jFO/UECB2Nq8nQMK82AlxY76+X/4yJjUuKNf1M5swl+m
         VdkFgJcmgQP8v/kzDZ/hfouFv3/vpQhr3/kAPhRCC8B86YdVUH202n7BRCJ/xyuMccv4
         igGGkaogvR+DM9cSGnD32QwqJiXSEe7qReYtJGq5at+wVcx0vu4BwGJKTPlMkTAlemBP
         rpN7zYFImwF+NuqUQXyD2XB1XoEQuUbo0mwoKVDwYOWkCsuL6r1ISGhpTGNGg2dq/BKk
         L+/A==
X-Forwarded-Encrypted: i=1; AJvYcCXJ99uQDc3sh+F0KyshJpuFLA542kMgafiOKxcHpWLCwAJUmFmW6+MOOWLrKgwENUnsahMTtvj8Pd5t@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKcTHYkk3VrPRh/r6NnWNbh7os7Y8XDkj35OeGeHTs5V7v13G
	mvLkpTo0otWo39gnAOuywKOOVd9reNVVbTgt7FJ1dh1w6kkBK99tmoM5A3NHyhT666YkrUxPn79
	5gWc2LjMLfk6Ijb7WmgaYGhmEZToJjDjB7Z3541oNQvK0JZN/W+HVxTIkGsIyGou3
X-Gm-Gg: ASbGncsq0LSr+miD/yj7JuH9Yxzd7RYFkK/yZxs/Z3SriihDKmG2k/JAEKZoHUB+4R9
	qO5nrgcf2hREr+7ZIhvs4YtrQ0AzRA9wlgdc+oTuXPJvEB1mSM9wCmto44oZ9MwiCt384mfadr4
	c9JwLYGmrV2L9H+E5MU02iuZnwEQxSESM/+mJ1C7PI3uGYzhmrsBp/bJUnByqc7eA9aNGWOZD9+
	uB7BizsuQ2igbaFawNLimEhmGlKXIYS5ggWYBb2AUjIJjnL8Ii72wR0qD7DUvQ5421ME339IsaP
	RoA/foZQo4AtUOIPdGuytll/05ZayNAsjyMFSouH/4HWUNNr5CO17cVZKJyAtc05P/b1qDKHj1W
	sUT9RsPk520zOxWC8YkdseMT0/gbbvWSdNjozAVCetyDjauTCwVPe
X-Received: by 2002:a05:6214:5090:b0:704:8f24:f03d with SMTP id 6a1803df08f44-704f4825428mr238950226d6.16.1752914329103;
        Sat, 19 Jul 2025 01:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQsvNQe0y0XkePnP7jlgYK0y9weg7ronQqAfB9AOD0zuVM4AIPd7Z2x/hqwuEfSMzAV+Y4bQ==
X-Received: by 2002:a05:6214:5090:b0:704:8f24:f03d with SMTP id 6a1803df08f44-704f4825428mr238949776d6.16.1752914328437;
        Sat, 19 Jul 2025 01:38:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a911b775sm5216151fa.45.2025.07.19.01.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:38:47 -0700 (PDT)
Date: Sat, 19 Jul 2025 11:38:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 7/9] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Message-ID: <iuojvg73siqfxq4ejv4g7o562k7i766bbpg36sxsljq7z7tqrs@ueqfdknfp5zw>
References: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
 <20250715180050.3920019-8-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715180050.3920019-8-quic_pkumpatl@quicinc.com>
X-Proofpoint-ORIG-GUID: YVhDZFnnJe_JzEmquPU3oOgnSXBCIPAw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4NSBTYWx0ZWRfX1mQLKf0MzrxZ
 QwmOIp5Rn5SNnDMTVsMAhP9P7vv2JnJotaDI1Xf7XyoHsizEgc6OlYn9+Vw1uIeOfSfdd88Y+a2
 j2hcb1dfCuyi2x0JyUmU2xMEc5F4Wmpw6NffKET2djYy90aXv912GZolLHE+zFHuELPh0Abki5x
 4IuCsaLljPf+2OkNNtJYdCyJcNMaXZtt2lRuYOUJHXKwRHY3c46T1H50R8GQJ2RyF06qwTwINI7
 QHTDrJ3Wsq3NCvx0aLkMjvkBNZvsUg2E22AkzljSP4F3A4hUMbuOgbDKhSUoBLeo4U+bIMKOxkv
 sJlhMANkwITWdCK2DJXMOdNWul+yx+2F/8ss7AQRiU/n5WTVjy7ggxMrIWosNWK/tmYua2C9bNs
 BpwuTaTpYqTbOX9UkFxECE8eXACy1GnCW0rcuYRsY6VmxKH3ZzowAFzzOMOiTbC3CgO6NLti
X-Proofpoint-GUID: YVhDZFnnJe_JzEmquPU3oOgnSXBCIPAw
X-Authority-Analysis: v=2.4 cv=YtcPR5YX c=1 sm=1 tr=0 ts=687b599a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=rRvH8sadIMNe52h8dg0A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190085

On Tue, Jul 15, 2025 at 11:30:48PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers
> and digital on-board mics.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 ++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 82aa69d715d9..4ec3501eecdc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1048,6 +1048,51 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&sound {
> +	compatible = "qcom,qcs6490-rb3gen2-sndcard";
> +	model = "qcs6490-rb3gen2-snd-card";

This model name doesn't seem to match established practice. Please use
'QCS6490-RB3Gen2'.

> +

-- 
With best wishes
Dmitry

