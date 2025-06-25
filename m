Return-Path: <linux-gpio+bounces-22189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B47BAE8475
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 15:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 281EC4A1EB9
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 13:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD6126156B;
	Wed, 25 Jun 2025 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leSlgYCU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1D25C80E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857554; cv=none; b=jHx2zl12E3AqxF8zVo5/l/1tLANr7qzsBnkN/g6Q8SzxiVgPNIjADDmqKEPsLVFhXeoACKFwMF6PEJCGFSKSMQpwMAH5KWGXCJunXULcv1SoXduOo23t3THIGu32eGuORxlTxQqjlVfoSWAc3agYq0PO0KXAbt3N2DTqkdrhy+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857554; c=relaxed/simple;
	bh=OLbZLCeEIh/QhsKvBR05z93Lz887to7p39N5x/NgpCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HK8jOqpw1S/I5ulYBjPHSh4tVFNbP0iEFClw0YKMLrxhH3ljIJm/cVCaNKWwNmr/mbZH36LiVpCEULTwshewAkVO0c4RCh1SlYHDfbJ3sJJSzKxczCMLtNhikdNRLXGdb3je2SKkfmlL9FI0pUD81m5Sn7KGFve+STiBJYOUBwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leSlgYCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAcrsH022979
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 13:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eQaxjKeabn3poKnIk9ut7d7cX6un1MCActTxh/vj5s=; b=leSlgYCU4S2q3GBB
	1lbhTVp292Jsbnzfu0mSgY8HM9o8ujQDXR2hA0Lr4FXdf1xNMALD5mzetNA+vDkc
	ymcLd2JH60xEunoIq19CPr02YjJgwkxcCdMy6HUtmBXUv2GEr5JFDwR8XG0iaiiB
	XWrw2I0lN3ZJHcg8MLfqhdk+QpWN3gk/vxZhYvrfv+7u+0HCK2NOZPNx0RS9vt8T
	5o7CFjYS4psQ1pzk01QmWvB38mo8lNG651C612lyekzXDTNq8wD3d+OLQEKcXObU
	FB5qcVE3hteNuy6OfEL3hG2RgLEpZP3/sVjJ3bk58UwNwvqKL4LdBEqEddJntp7k
	pl3bKw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88f9rmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 13:19:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso6592336d6.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 06:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750857550; x=1751462350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eQaxjKeabn3poKnIk9ut7d7cX6un1MCActTxh/vj5s=;
        b=YYc5zAptldla9iCZRoXWfVwqY2cQyWbpQvjJOtQlF6VNEyOBUA6UB44Oqd3vj+PWiU
         U9tjB2PXR0AA7rFhHooYIxXlVw8f8F5/a3L672zUe+r2ds+hqtrNcpzTioXGFFz8RfmG
         5XLm/ETAkrFThdHuaFAt/xwgsNyE+OFm9cDuv1JEV1YR+o5Z+mzdiuksV89y6bUPRouE
         Barj1elPyxp7okyOsIw4Z+gC36h+iprgbwNIM9fIQuBfpdEKuB36S18LOv/66p30pLF7
         dnZna0tS5smoPRCN9rN6WPM9oJBjzjmLqku4qc9SOFCuq3Bu1D4MsKno8W2jnB1p1+lS
         5T/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQmkZI8FGwuGHljkubqVYf5sYwch+YGiBI+T+v272aGUbGnGqAZonN2dF8+Lf37K/cjmgG2JCQy3d5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+S3IMXObRWcekYb7UXo+oktxWndOHU+bbUXhd84MmAHPkSJDZ
	7blwYYyrALq8tfYrklh0ueaFxDYj0mvjR2yVuYjBjGFQ78ZWmBOUF85Cp1meLtSvtgAROjz0m6B
	G2dubv+iZZJfQ27f/B5K2yPqt9p6jLbceIs7vhTjdSRthyconX8nJ5HGWLdzapXqO
X-Gm-Gg: ASbGncuRXgI9y6tQeaumPlPiMpqtnpYI6rLiId72EWrHiGxOhwcgndrL99sKDDWv/AC
	tnZA1/Bt8iPIfvjVm3dlMq3pd3KMNIrH4msQa2kkY7901py/9Et4kvIptrZ5T8xL8KT7TJ96pGf
	OSBqqUHx0YOeTI3/pwGAZg7vuOtPGBOVrPzeP+g+HrdBR4sKRkg4Mw5/jQJ7EYOGNWqWXaeUQ4F
	Zz2zKNwPYlQMq4SA24xDeirYCv898uFgyAyPGH43f+PKx9/FZkiwf/pC6/jhRykXawy+ZUdL/IT
	fqhSCrVX/vIe3hWd/K8z2qoXWNt5i0dZ9kpw1LFYr51jjd5RW5udVV//ZdiVd/ROpgdL3O3/cSl
	ePJU=
X-Received: by 2002:a05:620a:8801:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4296eabdemr154346885a.5.1750857550464;
        Wed, 25 Jun 2025 06:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqGtKUmkLUVvMQx5KRJ0CRLAplizpPsb2y5iNrRAnX06UrCQE5yCFeuIbo7mZ8pru90VrR1g==
X-Received: by 2002:a05:620a:8801:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4296eabdemr154344985a.5.1750857550072;
        Wed, 25 Jun 2025 06:19:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c3ca7b8cbsm1919553a12.5.2025.06.25.06.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:19:09 -0700 (PDT)
Message-ID: <50fd7271-5311-475d-91ff-03c3c593866f@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add PMIV0104 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
 <20250625-sm7635-pmiv0104-v1-4-68d287c4b630@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-4-68d287c4b630@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5NyBTYWx0ZWRfXxEwoRn0LMGQp
 o7MJlIOgnGgKBhd7phojquMZsHLFUVbkkP4hFt8OoPMo/J/cqZXZ1WounWq+K2cybCmKv/vbse+
 Il1H1n87F7ZZg2vMMlQnKAzDulijej7Rb74xNhNiq4sYpwqKSHlIrQPLZ2mjTuelsiuGUQQf2W8
 bf4ZGSZlnsiFOBX489BlwJX15uzFFM5njonYrCrj5pedhd2uAi6CEi111VnFCgFMawQn9UX6vUN
 JDdcLM9ClLSrnEQYrQylTth6Rh7s0W8a6/O6stH27FE2IHg+dbu8xyauWIbcT73WUoEbX6ycWSl
 Wt4Itnu4qTqbpy4UzSHGIeE+R5VlUi7AwWcaBcRtoDciYXXHdm02p+OPiKgsWBXMj9swAzL3qre
 Leue6bOvnIlYmtb4IPYiHngRXgLOzt2Pwuir7e8GKitCU+IE0yFqLpG/Mfkl8z0cpTrb7llz
X-Proofpoint-ORIG-GUID: P48AEqMaB1MneL4vGVZp00iXQs4HL-yH
X-Proofpoint-GUID: P48AEqMaB1MneL4vGVZp00iXQs4HL-yH
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685bf74f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=gG0EGFSrpznu9jIhvzsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250097

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with SM7635 devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pmiv0104.dtsi | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..04d929db76f409c49c47ef0147a3de568006973a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmiv0104-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmiv0104_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};

Please also include a 145C critical trip, which is probably the
most important one

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

