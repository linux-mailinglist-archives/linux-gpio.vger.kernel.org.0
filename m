Return-Path: <linux-gpio+bounces-26873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1903BC1617
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 14:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DC9119A0F9F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 12:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BB72DF15A;
	Tue,  7 Oct 2025 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deNIUuG6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6520D2DF123
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759840769; cv=none; b=XuyCskLbIPGY1lYyFhIwmt8KIOsUUrzl5wnQcYqtfO8ERwWGp1iNfS7WaIC///ALhpPCq18083wYGBXT4h5KP2vESwM8b2yO68RojslMxUIPAnE6mlgBYCAQgNZCVo6eM6cXO6SZU5ifuBZF1/uEknWIsihpE9Exclfw9c5eU9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759840769; c=relaxed/simple;
	bh=UPnFCkbAAqYodYYvidAkc2Mw5hSlfS7wopk3IkQjvIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YN0+4z9dwjz8yYvYGIy1boVXz42BMubmSw8OG/t0FVfP8QaGYv3nRAnTpUKwO+ZDn4PI47cwZeOLHGK9z3MyeBDMYQ9uCXce90dADaQWl2mQUdeDwXCye5qjlZ1mrw7gi0jvtMYLV3+xEnhMNgxBz5m6BHfzHDV/LvXQWdcJrJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deNIUuG6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973LpeK023896
	for <linux-gpio@vger.kernel.org>; Tue, 7 Oct 2025 12:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZrWyGE3gs9+GLL34onELkx++qF0tEM4y9SytX+wbbUM=; b=deNIUuG6MAaSiEih
	79Yj7xhMjsEva8COdIUzR3DRV2L/fgm7E3AiEFExXhnGZnQPmEcGj49XqoXHYeD0
	OSIqf6rMzFTdQwNpTW6lGZ7l6Ek7CZmVSf3EYzlHiL//MGbxZtvIzMSXW4+rmoQU
	oQLJUGvR1rxirkbUCyiOzPwja6p0qrH+3QmC6SDp+Rt2qAD0jDdgM3boVpYQUHba
	IN28eXrStO8O3aS9brbJXluFZ2OnuRBJrcGZOsT7pcKmt4XFu/a2atwa0Hcf0TTm
	ONbLovEQumn7FZ0oJEil0lIZxe1i61Y6yJ6tJbceuf0D/IlIaGGNKKuVIfASHsHN
	N1+4xw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6aawex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 12:39:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e231785cc3so25846101cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 05:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759840766; x=1760445566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrWyGE3gs9+GLL34onELkx++qF0tEM4y9SytX+wbbUM=;
        b=lV0PvqanYdEmvrN5ukPpaX+Tyu+xnSEJhvTF65CPeOaI3706rYXcK5ceefuLqkmZ1X
         qY6dDzTNeZGxfVC5lvuGXVrKNbCu2LO7T1DQXkjD/GNOvzdGcOn4n1Jz3fHOj3bcro9y
         DMwcmO2cPtDWgJmgjmTznvuGUu0sS8g/4UAIOVWwo7aZn1Y1arUbjNFnBwnSK28TJA0L
         Sn0GfI/DAYi1tr8ePsZDvX2j3obGERM0R+DczpVJEGA3njBoGtHJTpI6NXIrZrtPV4de
         H210Z0LHOU1aivMO+Z5TAauEwDBZrKAs4diEeZTzbbjvJ5TTUV526LTeGaLrPXwN8dJZ
         D4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCV2XLuNQVEWpzYayqk8kkqKDvKTUQ+5a5quWhKIPnvWmrApq0kEuj7BwE5/oiswHRJ7qGGPj7Y3usV1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx/7SNAAsa8jxgZjbRZy4qVz6YnK/IYeHxqvKdaXHj3Hm/97Oz
	tGSPKozuhE1IcgAKZFUVvVCmAJ1Urk6LtD8zrp4qROxJiTxVS+nVY0xzVdj+h8+ADfZBIFJaFM1
	tnUw+x1xdQOuhpUyC5dneuAKZw07R4Hbj4rKIiNLAXvdgvDxOOwXgqMKOjiblZ7Nf
X-Gm-Gg: ASbGncvVSRaq8/hqCfI/uiehTqytvkX94seYKNhCx3WjZIOO9kovrafBhJwQiLTPs8e
	xIC7vm1qVPGt1O7ukWO3hXR2TKhHKUTvNGaheNWIbhU0D5A3p7SbR5xu/wC3btuH7yBiu+3Oy+H
	i/SqpWsWMivKMMvwAzYyamti/2F+aXPuFOUVwiQgu02lEziZPJ8C0tsVU6zNeIMDCL8dYiNUpm6
	CxqnV/ag1Oec0QZtt8KNZmWieL188MsyvVjB2EKj0fLIF175bn411xpOaArNnb6+fVZrr7/Z7nd
	T6urnBNZuNy10Rf5p+dyLc7SiOkjF5or8e5NL43JH0IlJGgfMJ1I6CaGgpjNBpGKodHRoxXe7PR
	amFPLiV2nT7vE1E7VNNjZSzwFPDU=
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr145453701cf.10.1759840766102;
        Tue, 07 Oct 2025 05:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBOfqIkALCYby5/GHjIjhxo1RktcdDyNxe0vMnZPbSP14BURV+Jd5BfDc/NgetMniX/+yEhQ==
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr145453201cf.10.1759840765488;
        Tue, 07 Oct 2025 05:39:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2basm1386434866b.51.2025.10.07.05.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 05:39:24 -0700 (PDT)
Message-ID: <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 14:39:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e509ff cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=83KosTCz9JabPjGXDAIA:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -b6eTccRPg1DszEnnkiyiPD5a5R0RYF3
X-Proofpoint-GUID: -b6eTccRPg1DszEnnkiyiPD5a5R0RYF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfX51VXgkOu3oFT
 ulCod9i1ziB7C8LQ6VcvKGFYP3n+71Naz/fvEr8mN7mMw+R+xnKDZm2avfCj1IqGu+IXK9u3SQq
 KUH4fOZAdOfHdac9ocPA6WODaRdP3n0mmI4Whqu5OZSq5SNuF6EpW518vMEAof/lqaeSQZv8r0z
 HuE+0Pxsvan92GPFoX8TafRfVuutEbTHk45sCljBzVuBAWSmPq9thEIANwdE2gAj0Ejv75GtW5f
 lTR5eP+/R7x2nnA1QarUdF1OohK2XQ1UV2T0pZf32T7O+mEp3erYzg+7uQJhdEzIxdtDvEzx1wE
 Q03EvGHN+2e/9ZQDg3iH7vleOULJkTcKZyhsLCxPh+gd8ZiAtKb2X+ebyn4PSg5TK0hG9JOVOX5
 PM8Fc64PWdynZvrevgbdhXOt22KjXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121

On 10/7/25 4:03 AM, Alexey Klimov wrote:
> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> controller device node required for audio subsystem on Qualcomm
> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
> 
> While at this, also add description of lpi_i2s2 pins (active state)
> required for audio playback via HDMI/I2S.
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

[...]

> +			lpi_i2s2_active: lpi-i2s2-active-state {
> +				data-pins {
> +					pins = "gpio12";
> +					function = "i2s2_data";
> +					bias-disable;
> +					drive-strength = <8>;
> +					output-high;

I.. doubt output-high is what you want?

> +				};
> +
> +				sck-pins {
> +					pins = "gpio10";
> +					function = "i2s2_clk";
> +					bias-disable;
> +					drive-strength = <8>;
> +					output-high;
> +				};
> +
> +				ws-pins {
> +					pins = "gpio11";

Please re-sort pin entries by the gpio index

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

Konrad

