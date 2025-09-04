Return-Path: <linux-gpio+bounces-25569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA23B43691
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 11:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 736091BC423C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 09:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AA82DF15E;
	Thu,  4 Sep 2025 09:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fX984a9m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93312DBF48
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976716; cv=none; b=E3kWA+0Ioq74JlCjuBFLcNFgOfqiEWIuQpXqCwURFaQbbDdo3vTc4PciFapoXjG/jFakM7sEOjAuohW82EJFgZNOk4PpmlYhVSkvD8Ymghsd1XkSTmWP/IYTr7RXdloAmEdlbvAIhxY9a5eJFJkuUwlO7iTbN6mAmWvr5j2Qyyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976716; c=relaxed/simple;
	bh=Sfrg9M2z5FZ/TjS0lIhxVa3hQyyN5eG2q5tz3HsFm60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+gDIDuPkz4NxTfRW8bjOdN5fq789jQFv74lMqlM+d9BHr1XmyAMC75On7yPjcIv5gqbfIBtPb5PZ6yR6V8pVchNpBsDWP8Y0U8FB2T2dCH0BucVZTx7Pt3GeBg7CuDgTOts20Yn7VjEW+hA9b7QPNGPB/zucyikdWAmeADxWNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fX984a9m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58420Sup005765
	for <linux-gpio@vger.kernel.org>; Thu, 4 Sep 2025 09:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF0hC6l5JZ6Ge20n6xQnqgPWUXlQn8IFqduagSkQakE=; b=fX984a9mTYG01Spv
	pxVCFwWAwFFqyvnOCW3Ag12UujxQOArmrIlH4hBk0nFg81nmmN+uT6mlCvbWCN6D
	ZnMN3CaQCrukPQhyY+tffHri+v6qJTFg+SGnKaOXnApT8lYG2l8+1GNASh9eOG5R
	ObfdroRmjcdfgfcXIqZohroXczVGJfc8c2DOTy+n4C9hewyOjXUQb0JXBFg6QZ+k
	qNA0GY+DZvR+Yz/DeL3RemU9EoEZ+ie+7s7upBIwb+tzwjEWj5sxwVzhRtYOssi5
	S8VKUYAR/I0v0jFgcz8zL+jmw06d55JOUGGtZvmDVIZEjGvKF9OKntJOKjWQwDbS
	LdoWNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s6xxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 09:05:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b331150323so1910851cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 02:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976713; x=1757581513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xF0hC6l5JZ6Ge20n6xQnqgPWUXlQn8IFqduagSkQakE=;
        b=tuAMh2EbSg//rZW1vw2moT9zPzCIr6VOYUHJziBFCHZRW0mV+PsVQaL0ukbxndNCP2
         yTOUwa04TWEdAi2BaNOQ2IEacNPO9l01obFUcC2OQIMf2Xs2RhLcfc6g+BR31vo/TZo3
         evSvbYk99DKoo7m3MVYNtLk/+UCtSsLzLa0InNiXFnbK3EsHxdNLl8p6yZ/cOBZh4uzW
         UMmp0S1YX3x/ImftLAwAdw1DqRFT74BewZfcUS75Mp4rfXsXWwh+8QAMXuZK/LuLB+V5
         QUFo1DRGaG50BZmsAGfC1IoRk8YXNz1+oCNZWj2GzJJD6mqfBBeXE3EXDalzNZpAEVD8
         FUAA==
X-Forwarded-Encrypted: i=1; AJvYcCVpVHpw24t6NmNxMLHT0NxkCmVjESA9k6IHrcXF5LTikVjm2Bn+mFTnYvIZ78wgZTt7lYLW7x+9KsIM@vger.kernel.org
X-Gm-Message-State: AOJu0YzEE/L0s1ck7wThWfe7gUQ1wp1uZGZf/4WMTzWm/YQEDCrYfxRZ
	mntiKgtRmqc7j92ZxAKWVRWBiAycJe4fb5AaDqG1DxdXORLTq8ZxkQWGphXQQmlmanH3upb8Ukf
	dsFtgxo3BSVTIvEaL/AG477sO6envQFUsvFh2g+K7x79YQiQAn6FQcFQRsa7/M0Rc
X-Gm-Gg: ASbGncuLlZFaI4NTT5+JETWzJV1Zv/5VC8hMoLjNEzh820lqt7ka+EMfQ96B9AdUJNh
	59M9jpU2gsaZ6qPZ043kSGm51WT8KLl6V5MDLrO/lraZK0JZp4cSRE6Pe5oAoOP+q3SlL2AG98I
	WmxGLTPJRkjCsvWimQfoxelpQjBl69jbfJPeYRJ+ZrBYI0pLMB3AyDDXc4/BTo7zWXpIYU4kALM
	vzYjlo2U3fWn8rQWQB2f9mqn+pwqacwwAiqPgnpAvTqNElYH1SuKmjyHsB83eEHPgXFhqRGVXK4
	eQ2dmFbZzvtIKf7fs8m9MaHAmvCa1DeuZBxUBv9SvEY3L0GgU1yY7KRDgD/v9i/jRnVGVPGQ918
	DtmczmuTQL2tOT48G/hteIA==
X-Received: by 2002:a05:622a:1ba4:b0:4b3:2c2:8843 with SMTP id d75a77b69052e-4b30e98a161mr167907781cf.10.1756976712386;
        Thu, 04 Sep 2025 02:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Qp86ciG228KLCiY7qG9SpMLg/p9RWq4SW9peO7VU4ceuMeQRSa0cHLhEVy2hzVv6Pg6ttg==
X-Received: by 2002:a05:622a:1ba4:b0:4b3:2c2:8843 with SMTP id d75a77b69052e-4b30e98a161mr167907431cf.10.1756976711628;
        Thu, 04 Sep 2025 02:05:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04189de5b5sm1085623566b.10.2025.09.04.02.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:05:11 -0700 (PDT)
Message-ID: <3a00018f-7573-43c6-867f-eff4041c0ca7@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 11:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] pinctrl: qcom: lpass-lpi: Add ability to use
 custom pin offsets
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Nickolay Goppen <setotau@yandex.ru>
References: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
 <20250903-sdm660-lpass-lpi-v5-1-fe171098b6a1@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-sdm660-lpass-lpi-v5-1-fe171098b6a1@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX0zDYGa13rX7+
 VFPJAV1pZMoNT0+/FYBBqL5J4bl1fq2A36y2gp3iXZGEPvuob/mqdxCpgEEIPnavnQElqF8+7L+
 AOvdCiTxJFZGUIZ6ICGbQZg++3ivjyfP8LivWFRUoJAur/1H/F8wwkYbYKJVUs6Q3bL83bsP4OX
 rIdjMy7PWcvZOWBuu+RGQtY4eyc+RtEyo2un4IoqufxMnTCDgpa4wTjkPjPfNqVYcoRDv80EDXt
 9LGg0QH3Q4KUjL0/TtkqY/yUWiqoI1B3EsDWnpRD+e3hDoNsS6IG1+k/N8ih1ah85iPGBrxQv/v
 JfgnorymQNgx9r3m3ObcPYcAeLF678djJynDT7Kt/S/+E5p0zAcI/0Uz6+Cwoe1g0shYtaXX49I
 U4ZKZmEg
X-Proofpoint-GUID: X5OJUbQKJJu4ncmn2K1Hx-9HTzmpwOpz
X-Proofpoint-ORIG-GUID: X5OJUbQKJJu4ncmn2K1Hx-9HTzmpwOpz
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b9564a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=BJytJd1QHtw-lo9AdRcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 9/3/25 3:39 PM, Nickolay Goppen wrote:
> By default pin_offset is calculated by formula: LPI_TLMM_REG_OFFSET * pin_id.
> However not all platforms are using this pin_offset formula (e.g. SDM660 LPASS
> LPI uses a predefined array of offsets [1]), so extend lpi_pingroup struct
> with pin_offset field, introduce extended LPI_PINGROUP_OFFSET macro with
> pin_offet field and introduce LPI_FLAG_USE_PREDEFINED_PIN_OFFSET flag.
> This adds an ability to use predefined offset for pin if it exists.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

