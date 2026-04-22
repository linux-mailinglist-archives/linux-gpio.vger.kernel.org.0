Return-Path: <linux-gpio+bounces-35357-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKjYHFLK6GklQQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35357-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 15:17:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6095446985
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 15:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F5EC302882E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 13:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6120E3EAC7F;
	Wed, 22 Apr 2026 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pkmxffez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnnnEo63"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A83E9F7A
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863331; cv=none; b=kcGnrGKRzsQaXdIkFeUROfF/oESRcHWQ27VA2fLxGTIhjEOUkEXc+p/HAINvIZf/R6PZS+gr1YBUTYDiBtRRLpqimZDAMJ4JUvTIOvifOqYywxBImydVBTMphxVgO2WRmP1X5rIeL5D1XV5oa/u/vmo80N8KPcGMTmjeW1HmiOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863331; c=relaxed/simple;
	bh=jh2jMSSXcTJXd8vlLLS/y4BWbI+0DSavjwWgrZsTuSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTir/LXe35YiGF40GqIC+Qu9ohhefBX3eDi81ZxaPXaONWaNdA9VwWe8ZlhvYVNEUjPVJtiSGKVx6/wLs+2eARnELPEYg7IuLJO3ay+WUYCK3EwfPXiMmu8KRa6jaGPO+CQR6YKMae6Drvhzp8zyYmb5gn6udkjAmxojkRlJnRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pkmxffez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnnnEo63; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAariM4051049
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 13:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1qZsMsy9aONVEYgOFeg+h83ww+M66WJpHobjGnH/38=; b=pkmxffeznbTdM1my
	AfJ0umve6g/Ir7lEe3X85lY0rdPLT5PyGNTkztHTdTZsJxRi2oSBLDZALDcoJj2f
	9gp5VkWzYMQ7xts+yaz7olSdmqbToXO8ubNfz/iSutO5y8PyPkX5EWlfI/fdMfaC
	pGtBsBMerPN33Hg9gkt9DXi3MdRCa+NiWRs7gHvetZKAJUbW+GK1Oea5J4PycXKx
	28SnOJzlZYBiofUooOzCZT1FMhDDka2xf0LF0h6+8pyvWKLbG6L5xDptaSEjDAHk
	/9gmfKbtEFgsgOG0vq0RSlRhU6AU0U/I1PIE2j+DGfuqTkk273CxM/42Vr8oj8YV
	fnA8pw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfkj58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 13:08:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eb04e1b499so41498785a.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776863328; x=1777468128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1qZsMsy9aONVEYgOFeg+h83ww+M66WJpHobjGnH/38=;
        b=ZnnnEo63O3eEMcYWQXfgsyyzdZuq00EtwNqBPTxBdom1vF8fdgvOHxq4jIYjfZUyjg
         gb2AY97N9imZ9GCYSNWcjE5Wef8YA5YC8Okp8UAKoOGSgHO53lhexnnWI3/53NwScyXT
         DxLk/g7QepTHtCi9xkp9ojP8tqZOE8fMeY1Qwplb2BBSzgFmfGpoIahTWSFFd6Z6E4Y0
         94n/ji+nK2tZZeckaUEr+NwsVFEHH62hsivAkU8eUoxlFjCAMQT/tmpDfdXzOfNTdnLA
         s+PkDbFIipnftS4+hxLUUEdiIm3Y0sVMuSgvKcrEqb8LkSbtyZwjA0GgrdRDvVi2ytbZ
         iPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863328; x=1777468128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1qZsMsy9aONVEYgOFeg+h83ww+M66WJpHobjGnH/38=;
        b=gSEdApZIC5yZu5TxnbmvakLRUfwX/uPRYd6LTDMZHsAv3TlZibyQGjiQ4dL2su5Fcz
         d+4Rg8CuTc1Z/oAvP7T72UyROIZgA0Gl5exqODe7LBi3Trt+95E2CwkOM8oJKj1VKVLC
         yqd8m2ABAZgCQqQDjWfzfS8/I+DZaGScbs4OJSEOevrgi1RTREvtFrx5BQ6zpdAjcAQV
         Jdpe1DTQSWprZ+zs0xVgDe/9YTjtYdhioqrDUwHO45sUBBIk9IPMsnR0pD9MEe7UGie6
         +EsiAt7JKYZltECj/ITatznT9+G1XHC+gl1tqDM2UFCAQg5bvKiNekyK63jUO7Hpl2R8
         hDuA==
X-Forwarded-Encrypted: i=1; AFNElJ8g4NBC++grhekyrM5EEbE7zFaIJSP4f23/0x1TOK5YTPKUYnJvoiBavEXryds4VfxttzM239UkxHH/@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEHpxgLoXcdvSsOsyFofgHlcnLC5nl8ECztn050RnDus/thFG
	rLGXdxwtCMXQYWWlUt+Njy8ZjDN24QP+X7EZNZ2OWFEaFQjdBEeDEB0Jxuumj7VYWgGDtpuUFRd
	EoIMf8D7wIlN0mj+0B4ZnsRsKViQC6fO6FObXVRxj2iysX1IEIiTK07zD1nqQpS2X
X-Gm-Gg: AeBDietxTS2svG5krWIR48caKSFaZqp3beQDkBGY/7y9s2BKtW0eWUVRp+Qot7yVO3w
	jJ8Jwz7656bk7BmuBaQ0lo1KR54SyQxl8uxwq8UvXioc1zcdeG9E7djzq70q6u0KI+Eh4HwBhEE
	Ybz20uKgcwTETIG9qn3IHXQZSU7QhhHSacJUFm7JSDXQSuGTbj2pw+PK378WO53Xq/LWvAcmk5B
	njp8Gpj7FmXkEYxbgc6BYIcdtlDkzmMQdBR+kaOh4ZuU+ZA5goWxQyirmdR4b2b6zHo8BcyW9nR
	jd/o2OyIaHob2rJZDwGJB3B2DGoo+BHarROpTOu6LYuNu1zdYgyxaD61gEywxBivrHWzm3nUYcB
	uIwJsXESfpuKBZ5LuTXC4OceVqSOIpC+VUAKjC0pJzDDOUbgLmH+79G+EqITySqrCFNSNE74WVZ
	3BN6Ioys7JOsQEoQ==
X-Received: by 2002:a05:620a:4002:b0:8f0:7516:daa9 with SMTP id af79cd13be357-8f07516e2fbmr70755985a.4.1776863326038;
        Wed, 22 Apr 2026 06:08:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:8f0:7516:daa9 with SMTP id af79cd13be357-8f07516e2fbmr70741785a.4.1776863324003;
        Wed, 22 Apr 2026 06:08:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe8a0sm3291152a12.5.2026.04.22.06.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:08:42 -0700 (PDT)
Message-ID: <d661ca5c-4d98-4dde-a275-d4e6b9eebfbb@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 15:08:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
 <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
 <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
 <91812db8-9774-468e-8a8b-10699a63310c@oss.qualcomm.com>
 <DHRWGKASOFM8.15ZNMEOJJK9F5@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DHRWGKASOFM8.15ZNMEOJJK9F5@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyNiBTYWx0ZWRfXwBb/B5n22dwk
 nEoQfwEgqKHTV9VWs1MA/se0Dan0CAeIdFTYbBK9XTfJsGKhmVWUx8YzA660b1NyeYopMWM7ER/
 /jLOSg5BaJqheOo5LgQX96kEd39wabEUxl/Uh0cST6Z1WG+cgJSOTd/V3ogzpcApyxtOSNLu3K0
 QLhWga3dkwisYUI2zAazjp9JX8bWW2dIwhF7lS8vBkTt8uFQYO+8Zh1+PiNJ5YGexyAVi3dE1Ix
 +i5XY6sMFCRtgseY2IE8vmDMODY7aUMXeNuNFDeg/Z187H+eU5WBRExhTkqUgEUOV4ydHoUcxQL
 1b1Al38cPvpr3ZWYlG4NSuwdjcHWvyMGDAuUplVdZryC7uVrQUkFOo45rjWGTNflapiyScai57h
 UYi6zkWPPZ0CIWdw19C0awh9VO93wtkiV8RJhfpiFlkJw0ETN1AVKKgCaH714e5sVe6BtGf+kfV
 Kuh6S8KEdpoQa9G6ECA==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8c860 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=W6naqKN7AAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WRoefMb1mtoobpndLnoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Xp8b5NkTPdl8jt_qJiRs:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: eD7ziyRF4wmjYc6GF8HyyHiKj2_gfMLb
X-Proofpoint-ORIG-GUID: eD7ziyRF4wmjYc6GF8HyyHiKj2_gfMLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35357-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6095446985
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 10:55 AM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Thu Jan 29, 2026 at 12:19 PM CET, Konrad Dybcio wrote:
>> On 1/29/26 9:32 AM, Luca Weiss wrote:
>>> On Wed Jan 28, 2026 at 11:16 PM CET, Dmitry Baryshkov wrote:
>>>> On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
>>>>> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 66 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>> index 9f9b9f9af0da..b1fb6c812da7 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>>>>>  			};
>>>>>  		};
>>>>>  
>>>>> +		lpass_tlmm: pinctrl@33c0000 {
>>>>> +			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
>>>>> +			reg = <0x0 0x033c0000 0x0 0x20000>,
>>>>> +			      <0x0 0x03550000 0x0 0x10000>;
>>>>> +			gpio-controller;
>>>>> +			#gpio-cells = <2>;
>>>>> +			gpio-ranges = <&lpass_tlmm 0 0 15>;
>>>>> +
>>>>> +			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>>>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>>>> +			clock-names = "core",
>>>>> +				      "audio";
>>>>> +
>>>>> +			i2s1_active: i2s1-active-state {
>>>>> +				clk-pins {
>>>>> +					pins = "gpio6";
>>>>> +					function = "i2s1_clk";
>>>>> +					drive-strength = <8>;
>>>>> +					bias-disable;
>>>>> +					output-high;
>>>>
>>>> This looks suspicious for the clock pin.
>>>>
>>>>> +				};
>>>>> +
>>>>> +				ws-pins {
>>>>> +					pins = "gpio7";
>>>>> +					function = "i2s1_ws";
>>>>> +					drive-strength = <8>;
>>>>> +					bias-disable;
>>>>> +					output-high;
>>>>
>>>> The same
>>>>
>>>>> +				};
>>>>> +
>>>>> +				data-pins {
>>>>> +					pins = "gpio8", "gpio9";
>>>>> +					function = "i2s1_data";
>>>>> +					drive-strength = <8>;
>>>>> +					bias-disable;
>>>>> +					output-high;
>>>>
>>>> And here.
>>>
>>> I've taken this pinctrl from downstream lagoon-lpi.dtsi. There the
>>> active config for these pins have "output-high;" set.
>>>
>>> And fwiw this pinctrl works fine at runtime for driving the speaker.
>>
>> I tried to find an answer.
>>
>> A doc for this SoC says that i2s clock pins should be at output-low
>> (2 mA) when muxed to the i2s_xxx function, with no information about
>> bias settings (perhaps bias-disable), and in sleep they should be the
>> same (minus the drive strength note, but 2mA is the lowest setting)
>>
>> I am further confused because the output-enable bit in the cfg
>> register specifically says "when in GPIO mode"
> 
> Thanks for checking.
> 
> What should we do here now? Follow what you found in the docs, or follow
> what downstream is doing (8ma output-high)?
> 
> https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/devicetree/+/refs/heads/int/15/fp4/qcom/lagoon-lpi.dtsi#219
> 
> I think apart from this question, this patchset should be ready to land.

I think I'm OK with following downstream. If we make any discoveries wrt
docs, we'll likely need a mass fixup anyway, so

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

adding +Srini for awareness

Konrad

