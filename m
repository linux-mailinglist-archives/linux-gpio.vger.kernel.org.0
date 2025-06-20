Return-Path: <linux-gpio+bounces-21944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7FAE224D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 20:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8DE81882B48
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 18:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551C52E9EB0;
	Fri, 20 Jun 2025 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5nx7/Gr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18F96BFCE
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444545; cv=none; b=G4D2IDps4dUuHNIvUF52oTL8gacBSB4NwK5g3NJVvfjCljo/RomUvpmrJAHbW/8znW/XrnnCciKIKrfXTso6Pk6URylrxVSp9sv2eKswuthTEkX5IJto4dqvE32WtkQLUle4JlxoSfzuWWaqr7ICY1td5iJlHDsiDwOVPgMpRHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444545; c=relaxed/simple;
	bh=JWMSYzBtLnLZCvwsZk3KkGLaQqwSbdl7evbVSyyidtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wb8eaZLW5z+REC11cX/GFAohw00SbSOGaLcDPl3z81yUL7rMJOAp2BIzxn/ddRW1KuJOUU/QLtLFKJfMlCbZqtIq2uvHauP0paF6ne7sc51VBG+Iv9gRR4ojoYTUJ98K3jxJojrhW2AfmNCLNty0rZy+baf7w++4Fl9qIFeKfnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5nx7/Gr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KHGHot020751
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 18:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJw9p79NQp28rgL0YjqCtfjNT9ZaiNa7ynXf7QFlFhE=; b=X5nx7/Gr7MmRCnEu
	ylS3DFsjLg6Dqq3SlAo/V3lwIKBV7b1RxrEClRzwr7TloClwe3i3vX1hRNTY20O0
	lltwffkVdYLQYVcoP51FkX7yBVYgwGWFV8j09CNuUWVKjpaa51WYwOQMDwiOZEux
	1lUFguT22EJv3rd4mMGu/LYPAjC2sYMHxd01+T6xUUAx3Gxs6CF8RimcXXzYeSyZ
	ZD2VcC5CJiVw5ZGvX1R/XdzA9kIPNxvgDL7YFboE4Gi7K/5KaAY4v6XU8tJiq5a2
	SRJJ2gF7NBP5vOtA6dw1LgPkl/GNwb4otu6qBuRAwN0KTGIph8WMJsI/ooBcCcfe
	PmmcNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dbvtr7n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 18:35:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so420090785a.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 11:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750444542; x=1751049342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJw9p79NQp28rgL0YjqCtfjNT9ZaiNa7ynXf7QFlFhE=;
        b=URMJ6sZKdSIutOLrevQ4F4wQ3hGGSAJu4Sa3Ei+K+HM+zJFsZG9gn7iqoqiQ6I5DBk
         r3K81pkTdQHIJ7X/VhflbCgbeGLWW8CYDSF7XjFGZEMg3XQWCMUN2mp685Z2hF15orRn
         ZhqtR9I8htV60U6mPBqtSG3HCb6EO9XQtWGQi5bmu+gbTIkUXtX3pXKeFfBIHmppHWuY
         4zzi3W96P/Lw7WY+1rNdAvMb7YSZJQRtEDZJz6SSSqkfIdpv0Z2pUfjvnSQlzWbTFxdP
         o6qN0spwwA/Pzu/RdtPX0APVt7zr4Xm5i385ZANisMVU6a8HWVvYxycsZLN/tg+O5kmd
         Pk+A==
X-Forwarded-Encrypted: i=1; AJvYcCWFOfUZtGJpqIGPeh2BxkMOlY/mSqvYDETP2z7qWiWJAjWLWcWeOoO8LZ8q9lDXsGCSwhKIE3nAJWjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyCMuCFa6+1QdRtHVW8/u2yfIfnFMJcGnyfvQC2WJLJZv3HnRJC
	FKfrehvGYuMA/glC6LYceIq70ZNlRk/XAa5ne4D2wQYF3044lxBPUFIsXgqdNkXytyezDpOyRHO
	e83qgb+tEmpw7OLQyZdk2DKJITUuPpk9C832R01tcyPpTkiavQx5TgGlUx00M1squ
X-Gm-Gg: ASbGnctTFYUYozLGeAjV5/LXHxa4e4UyX3QyLE6sd7uus2ed2Oy3rq1HnYajOyYjnE7
	VmaEARrvoRwHQlsiGaCvEsid3jwbnBQFMslcCbR5Xz1cPZdbjq6SjW+JKZUas/lVRyh22GXdLA4
	iHrG1GJBFUgCX6wZdgQSreCDcDEuYQUVj29G6W7AFkvTt2ccU7L/FkumDNRsiGMpxtB1s59zFez
	UVf+31/r7Pwl+YUvxGKF5VtSy01wv6CCtWQ+0fDEZQnl66RoJKV+yAFMKKHjW8hrEW//eyRQa+S
	pQaE3o/KMqTpco2i2M8oqWrknOmNaSfljo/1bPjn2EkC7Ffc8t+MamZJdUmi4FjTK9QKg9+ssrm
	VaRPTL7mV1dnvDHpcL9K7GWb0wSO75htAXkZ36WsgDeWujRArjpk+xGEY4YZoEujZdBPJOmqP8A
	A=
X-Received: by 2002:a05:620a:7003:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d3f98e00bfmr464035485a.16.1750444541642;
        Fri, 20 Jun 2025 11:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsuEvU180uOuJG3lc80Lg0/m23ATne7omtzgMrhGIFzbRZsPZTYyD0LPioJVHR3t63qkWJcA==
X-Received: by 2002:a05:620a:7003:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d3f98e00bfmr464031685a.16.1750444541092;
        Fri, 20 Jun 2025 11:35:41 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:64d7:15aa:a456:4eca:f826? (2001-14bb-a2-64d7-15aa-a456-4eca-f826.rev.dnainternet.fi. [2001:14bb:a2:64d7:15aa:a456:4eca:f826])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbbe4sm369113e87.110.2025.06.20.11.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 11:35:39 -0700 (PDT)
Message-ID: <f9f96bf0-3539-4e77-8d3e-b87ddc561925@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 21:35:37 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9MMzJuULgGVKKsu__ydMomYOXlhUuURj
X-Authority-Analysis: v=2.4 cv=NZHm13D4 c=1 sm=1 tr=0 ts=6855a9fe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5BTet7WxsRtOupFzBhsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9MMzJuULgGVKKsu__ydMomYOXlhUuURj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzMCBTYWx0ZWRfX4P5jg4yX1qBO
 UCc6SRF6dkz3WxjEF8++P67rEn7xblmkaIS98bRFAXUfUNX5c+geX0ZQeSNxhXjg41xwZixk1dP
 IQgmzu4yDDQINuD8S+8aaSuS2GCXfhJRAe9ivvG7Bd4oN9aRmhTSz7mfwnHXAVzu10jUM8KYKvi
 YKaIupoQzZuQRP35dcggYqKqjajlvKPR4106IEZiGThvmAo1bKxUC5GLNbsumVciWK0xN8xiXwq
 Pq6XMGnOk96pptEKLS8j4ptglWcI/g2pcvMFmPQZSnf95HeU5PXr3n5piOuXbwK/JySpixaI0QQ
 /S9Uj4aeYlq6kMeT9xqrWEXNtZsWXZzRDDKROxnXSIbuflUIPQVojHQUyM64XkkIy6y1QzfVHSh
 k4YSStHI4Cn75+IgfU6oDlmbFzVZWPPHEZAZtlcnwxJQrLAxdoIO5QvZNXrQh6NzSxkaGDUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 mlxlogscore=748 spamscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200130

On 20/06/2025 13:30, Mohammad Rafi Shaik wrote:
> On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
> multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
> To handle such cases, use the reset controller framework along with the
> "reset-gpio" driver.

How does this handle the fact that resetting one codec will also 
silently reset another one?

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
>   1 file changed, 48 insertions(+), 9 deletions(-)

-- 
With best wishes
Dmitry

