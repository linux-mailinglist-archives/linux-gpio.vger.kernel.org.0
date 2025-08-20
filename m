Return-Path: <linux-gpio+bounces-24591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4EBB2D4EB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 09:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6780A5E0EAF
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 07:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7802D7806;
	Wed, 20 Aug 2025 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+8V4XH0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018A52D77E3
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755675258; cv=none; b=spPsgKfwapGxXZKKaX9bWAh4odLxYPItGHBdJvYtyvcfr9Qna2kBSe6oop4taeVqRrmrovXVPgKlwMVyqCRlWMImP/uIK1ORgKv8L3jTtV7hUjA8oQ2+eCjFmfESzq0rWVHeWwp0n3TLqQ2w2M/bJB71gfGgIO4xSFzAZSG9NjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755675258; c=relaxed/simple;
	bh=Iisg/7t+/UfhBThWqhBkCbnrYHd0FsQDYG3FNeciXNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekWMarSUboH/3rJ3Sz7qvMOD9g49L6giRguSDKy3R6fyGxAbpzIGIc8UBLJqWj3euMCwl8BAToO1rn1jUWGwb8JOH+LIe/gvfRwjBYnlTt70Urrg63D/tSKRKVQTePlIlFhhPSHolIRnW94+/xOQqGcRLd6IVXCH+XERbpfK8xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+8V4XH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oeW5027716
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 07:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nly9DoWpxiIK3Bux+9KCd5jXpmFRSSnatyDWGlMobUY=; b=T+8V4XH0XIabcTiH
	+IVr4RJF7+wP1APLtXeMWx4sifFCv2vr/EQlpAAI0REykMRM8JFYRhIU/fUScWc5
	TqP/n7M28abxbu0hCs+Bny+nmQCVkFTiX1lq5+7I3QIeOLWjdAk675s9pJ04a5dx
	eUdS3ok9vpnHMaxob5IferiocSMwMDo0gtgQ0nwNZD83XvidrYZsak0pJGQgBznO
	KDCqAlI7VPaICCx2AMfJMvTGAVHCWILxb2PlJZ/CHTbgaJ+zgKsWe4wqUG40rCF1
	OtGrAAWwoXlSNkiGo5gufFwdICs3jtSPp9crF0ez433cGdYgqWaN3PuBi3GIVwuS
	ZPDMiA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52art3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 07:34:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32326e2f184so11358991a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 00:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755675254; x=1756280054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nly9DoWpxiIK3Bux+9KCd5jXpmFRSSnatyDWGlMobUY=;
        b=J4CW/o9wT97ZrMYv2aZTi/v2DiDCii63FTyUpve9L7wSZSYvl4QoOgGIrFrqBaZn03
         Y146pX/XN2FvLdcXLtv503i43VffXis0LitPicRx/ZlWICQCCdC4UZrYMv3k4SilWxsS
         0owr70l+pBMyRNQPbABlLKsWoQDycT3iobD9oGbktfnhgmSjk23UkiZqdPZktmmqzkFj
         BCW4XUtuuqaCs2e6R1OiSAVsvYTBkYJwbNnzQ39M7QWWoask5LHQ1GsHq2tVhbFMK2K3
         eYEovEI6Fzr4xCeGBlzlzFQSdlIQMuEvw3LHZFGJ7Iu2ujqNd5E9WUWtTssPUdRi+V2A
         ZhfA==
X-Forwarded-Encrypted: i=1; AJvYcCVyyMB/kvB9ZbJC5fTRf0PvsyIT4sOXYI8u8Ot2M5Y1JyRyhNZrPhqlJsHGtyiH+BaxixNx5uXB9vbL@vger.kernel.org
X-Gm-Message-State: AOJu0YyKjeG4Jt9/REaPFiQxmIiOSQI+m+yJ8pN67mGMqHzTNz4XL+eO
	s5ea5nEkVJ7mMI2HfDf/rIimxmuoPO0ruc7pjfxrP3d9XOE48myrgDmvesBBE8m3Jla9aaL7VVk
	gBnm4cToNmFgZKmRaAF2B1xejckmS6Nan+cOCT1FFMESbezaLnAJx+a0j2rQo/vL3
X-Gm-Gg: ASbGnctYue/J2YxazUvaGh/ZAqaeiRm0Os6MtrxzStI9oty9smBhSZfqvy0LyBV/ItW
	7kXLdEsRbZ8BjFP1Z0ik+iIKNBsh/nx0WfvVUgYs4Li8cO3knYi0OhnTX0+GFfxsh/uAuBxYHLz
	BArW44l2UcwJsPCiKCeIY6HPPvSDWGzwptsS3cVF137JWAZUuFA1K2ggVq0BCucasBlTaSH3HdY
	XrWo2iCvdpDUxrDt4O72RtSJfFkufoCm+emyJHUXoimrfDeA/0Tf2PV0jVRmoZSOeYj7QHC7Hii
	sdE3F3F7Dz+jBT92vxmEDOGURsxvRdQhGzrZdsIeUS6YO+0HAv0z4lgSe5BuUXBrUQ+KmjP/1y9
	Uv5+aNOm6CwqOJCMLHEKq/zyGoR9HJ+OcT7E=
X-Received: by 2002:a17:90b:3844:b0:31e:c630:ec93 with SMTP id 98e67ed59e1d1-324e131a899mr2888527a91.16.1755675254449;
        Wed, 20 Aug 2025 00:34:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXDivTvpj3UqHfz74ALWqU9rV4LJoYCvA5ve9X5L/gyN4sJRnjaY/HUd8dxtuv2EansQoL7A==
X-Received: by 2002:a17:90b:3844:b0:31e:c630:ec93 with SMTP id 98e67ed59e1d1-324e131a899mr2888485a91.16.1755675253861;
        Wed, 20 Aug 2025 00:34:13 -0700 (PDT)
Received: from [10.249.23.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d14efsm4661557b3a.2.2025.08.20.00.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 00:34:13 -0700 (PDT)
Message-ID: <453a4f7b-78dd-4831-904a-27d882400c6e@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 15:34:07 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: sx150x: Make the driver tristate
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com, kernel@oss.qualcomm.com
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
 <20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com>
 <CACRpkdaeAqD=mpG4y16CPKwJ=pjATY9TxeRnXR9abziCOQb-0Q@mail.gmail.com>
 <aae972ca-5b8f-4329-ab32-12da1522e01b@oss.qualcomm.com>
 <ab60bd1f-0000-47a8-94fd-899b4e3eefd7@kernel.org>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <ab60bd1f-0000-47a8-94fd-899b4e3eefd7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXylxSNguoYoFU
 TsQ+WVJIkBhOPUyPWCUejIQmClyL/TtnpLaLoZQzoFnoZYp982lvU96F7Y2OHgNjEDchQGS66IU
 xWucpaWNZLcmLFGQQ+BYuBeDflBqRoaCz/sq0LoYzu2sKwGga+iQSiWjbdtByAuBMq96blYF72S
 MUk5XM1//oqgKnhNfGChCMpwMOiSHR7z3CxVahXd2n0BdU6eeQqVnBamw9izg6lS7beggOqQSHa
 SPMYWprJnxjhIwnDMuFCMRWr6l4agEX88NWucSu2TXaDvZ9Vi+9nWpc6YjmwDL+0UOoBkZn95jA
 RPjUHL4kvXYaVANKKaBuqD0/dGCGrHInZtueHsDFeQdK9Qu3pRra35F+501OoEIPNQzyVNPcBzI
 xt7PMRvNkj3dbWzAL1uC9NxFGnJRJg==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a57a77 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ss4ELvlYdx4pI-vPaQ0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: THlEDM80P9FrcDK_UrBRUQ-9j4wVV_4H
X-Proofpoint-GUID: THlEDM80P9FrcDK_UrBRUQ-9j4wVV_4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/20/2025 2:18 PM, Krzysztof Kozlowski wrote:
> On 20/08/2025 04:55, Fange Zhang wrote:
>>
>>
>> On 8/19/2025 8:55 PM, Linus Walleij wrote:
>>> On Mon, Aug 18, 2025 at 6:41 AM Fange Zhang
>>> <fange.zhang@oss.qualcomm.com> wrote:
>>>
>>>> Set PINCTRL_SX150X config option as a tristate and add
>>>> MODULE_DEVICE_TABLE()/MODULE_LICENSE() to export appropriate information.
>>>>
>>>> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
>>>
>>> Fair enough!
>>>
>>> This patch 1/2 applied to the pinctrl tree.
>>
>> Thanks
>>
>>>
>>> Please funnel patch 2/2 through the SoC tree.
>>
>> Hi Bjorn, Konrad,
>>
>> Would it be acceptable to include this defconfig change, or is there a
>> preferred process I should follow to get it reviewed and accepted?
> 
> You need to send it to them... Cc-ing people on random email does not
> solve the problem. You need to send the patch to proper maintainers.

Got it, will update in next patch

> 
> Best regards,
> Krzysztof


