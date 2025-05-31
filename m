Return-Path: <linux-gpio+bounces-20824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D26AC9B04
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 14:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88B9F4A15ED
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 12:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982E023BD02;
	Sat, 31 May 2025 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5wT/oTZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9691A2C11
	for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694920; cv=none; b=XM8qBwLZmGZSwL7/qb+JZJlF+Ahi7NS2tIXbsvE1YCTg6jJK9CLm7I2tnIlVJA2QUWDQa3AcvcLcrF25ic2rVupHqYnO8GfECn6MuNVCtS8CTa7S08rT87fidxynLforHR24+1SKpwyz6QVnpLLqGhDfK+Wlr+2CD7vfb5R97fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694920; c=relaxed/simple;
	bh=fcsNL8Jr3V1Z+L+0UjZINlA1Qo0B6Y1X6uk25v4J7ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhwQ0CJCjTZCUvS5kN6xH+kxXnVQEYXOcTvnuzuGQVmfAHoGsrsVR+5wYt289M2bstf5uqi9WsaLKDMcPi7KXjkJj/yHTlbgV+y5suSyzI1ViYaaX359SlyOdNn8PlEBUJGq411gmxyRMwP64BmQIy0dJADTT+NW3nRJuwIWV4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5wT/oTZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VB01gj013273
	for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 12:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9S0yvnR5M8oQbjjOZBfaKlPYmTY49vYzeIuyHaPRtpQ=; b=R5wT/oTZ+k/atVwz
	akac9bkVfTDUZ0s9t2yQ3edFAlChnAhVDdzYFDpLJbGHP3GDJ9BIoA9rBujwqOmb
	t/9O2rFJFBsxlT2lv2AATzfJalvE4xxUd80WmBfCCcSaiOWtncVAFEDlDJU+MrUD
	PgzzWKp5gom8WA92G4oL7hFIQie0hY6MLsDyn2eq526obuxsXTMgAlQoRuRmdfSc
	vp22AkmjLYD1+OCakBdTidTiKM18e8vipAhs3v8hL7XFf2qm4Pdz5e9YgYh6ng+L
	3MiHm5UlW/6DqbsTCIzjYxTI+ZCftEg6C34xc5xmIHP2d+DWL485Zbd1xh9pTdLl
	BQxXcQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkw8nqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 12:35:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a42e9c8577so7767531cf.0
        for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 05:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748694916; x=1749299716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9S0yvnR5M8oQbjjOZBfaKlPYmTY49vYzeIuyHaPRtpQ=;
        b=sPWKHKMfeb+tuKa1n9RTObi4VaXLt1UChXMpRVintyTpdS/5vt9sHimr2/ojZ2NSqD
         3Re88t+vGCqsX/+B6HPtSDYLSIQROWPoLYP01q4LgJ4e0faN7MynWM2oXzx1j8ba1/B1
         EcBLIUeEAkLYal0jwo1MxwdE5LHxP7ofG1Vj3UBJ+bxhqepexCnO3jHbbRS2NLGZtt+2
         QbVQNPQkI2QTaU6G6QxoGnHkM0ohcqFaiQx6iBApdSlyq0YjWvcca82RNVJQF4Ixsmx3
         4fCCbfjcUBthFNkJhHdgfhONIosX3izeCfadlPhso6w7yxtGO78Bi1Fd2OiI94lTTfMv
         YTkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoEyfp5u1n/hGkofDwvcZsfJxRme2H8wH9n5d/Z/yudyNQ79zU8zR1Kjqc5tVBHuZ3cv2eqV3ft2dc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc7tjaVitpn0CjEQ49Q0tLz6aGHSneYQ3igDlTzHNjUHQMZ/4Y
	efCy3HCe1a0Et6J7hKZhvCM2JlMv9eLOcZaDOKTOZNEdXCBe/lglbN0muvJrE0b4RxI/hTfBY8w
	NXmhCQylc0E2Lh5XLVhmAGVHkMMicm5Z+1CDPwbr/YzZpR+oyhFqYTGZhVd9N+gLr
X-Gm-Gg: ASbGncsMmKR4gCOrOIwQWaUTvpKepbZMvzO5HxRDufYWoQPu7SekANy36r2B8ThVxmM
	j1FgreJduF9Ma8PgXVsSrO93K3lbw4p4kEczh5+bSBkzJnA3ee+9FbgRrjQCPDJEnBDdwM5zp04
	73uicDpqP2VDzCIDsjNhlqkrDT+ngYNvN2wkqiKZoTf2Mp8nbnBIyDSKuOUyjRf0Xu+n/R6fH7n
	Hob7q02CPJ7fo/V4Tzn/DMkdyQPlFNqcoxrb0HWPqRyWuWUpjSla4KDYczh7cdYY+zvPqOKdLER
	WLaSvEr2fo3lR59ObGMXbt0RXr+Yf8FKYdMG9+PPgUQlnWAV3Hh187kAAUxoipHlRw==
X-Received: by 2002:a05:622a:1995:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a44319ad30mr35732871cf.9.1748694916339;
        Sat, 31 May 2025 05:35:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAFHOKZwSa7Oj9a9fuVNjpeDyKERIwciylzFXlOnRCQf2AWDWhuEfkezhvglK3hxxCoL2fQA==
X-Received: by 2002:a05:622a:1995:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a44319ad30mr35732611cf.9.1748694915801;
        Sat, 31 May 2025 05:35:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c7332bsm3179441a12.35.2025.05.31.05.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 05:35:15 -0700 (PDT)
Message-ID: <43581d09-4e30-42bc-9c5f-9c40f5d2cb39@oss.qualcomm.com>
Date: Sat, 31 May 2025 14:35:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JIE7s9Kb c=1 sm=1 tr=0 ts=683af785 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=7yl-E-j_GsxE4UPiD6YA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Kxe8AxINNQ5M9hOdch6XviNGc27-gi-u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDExMyBTYWx0ZWRfX0wNnfRqXZxlD
 i8MduY8Y//C8Gue1FDBtsb2ZG4IFlN7gxRuDiejU0N8bmVJnFnDEL/2vdKCBExElkvZ5IrWB/SP
 Nwg5Ay7C5mwTRmY0B3ejCAdY5O4R4p4eCgoj9l1DcRgazCUpatNw15siHLHzdke6zdlxRscszdJ
 A18uOsHKF96SMMYhMzpOGXHrOpwGzmNHQ3Ki7vBxEL6LAAxgOw1NQ4vCjp+pFARPoofHiX/Au12
 roACK76fKjJnsnZCbISaqvQqVFZqJEKruT5nx5utDDx5OlwzFrF4dfqkSnRYGxe1e6Kpa9Pvbsc
 QpTUNKXgCur3GkBLaMRFV3PI9VNCjNbdqeLrS6hRWGz4Cphatq3U47dSbQU2RLbSTrg7IV4n+Ov
 9y8ux+Poj+bbsXNptaNt8P/Ze+eZjLOpsFtoCzJ9YDCdZXS21pO9+n9OzrhwdIEp/ti/vZsy
X-Proofpoint-ORIG-GUID: Kxe8AxINNQ5M9hOdch6XviNGc27-gi-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_06,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=824 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505310113

On 5/27/25 1:12 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers and WCD9370 headset codec
> on qcm6490-idp board.
> 
> Enable lpass macros along with audio support pin controls.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

[...]

>  &uart5 {
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index 542a39ca72bb..2e75e7706fb4 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -29,6 +29,30 @@ &lpass_dmic23_data {
>  	bias-pull-down;
>  };
>  
> +&lpass_rx_swr_clk {
> +	drive-strength = <2>;
> +	slew-rate = <1>;
> +	bias-disable;
> +};
> +
> +&lpass_rx_swr_data {
> +	drive-strength = <2>;
> +	slew-rate = <1>;
> +	bias-bus-hold;
> +};
> +
> +&lpass_tx_swr_clk {
> +	drive-strength = <2>;
> +	slew-rate = <1>;
> +	bias-disable;
> +};
> +
> +&lpass_tx_swr_data {
> +	drive-strength = <2>;
> +	slew-rate = <1>;
> +	bias-bus-hold;
> +};

All other DTs that overwrite these pins seem to be setting the
exact same settings.. And given this pin is connected to an on-SoC
peripheral, I think it would make sense to consolidate these in
sc7280.dtsi

Konrad

