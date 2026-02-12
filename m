Return-Path: <linux-gpio+bounces-31629-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIuQKqKYjWkt5AAAu9opvQ
	(envelope-from <linux-gpio+bounces-31629-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 10:08:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6171612BC06
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 10:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83877302F6B1
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 09:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185572DC35A;
	Thu, 12 Feb 2026 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvrGsBpc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gq1MV0sb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D252DB7A7
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770887325; cv=none; b=dh0B0FtBpdnNUdGMyzQlViX9J4tD8j5BoP7LhumlToITI4x+JnFrrT54YTlsWqPvkV/VfN030PW4SLMZNZC/C+GvHszM3/Ztq3RherKJRu4d6ZhGew0V4V1syLhVVAfZU13Fzv5G/KQpJXavwIxf5X5Vow6OHfQDkYm0OvnIwTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770887325; c=relaxed/simple;
	bh=TQYHB0NaTsht6zkI7ahTX1HLDmveSk6IhPbAw73YKCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2ewsscu9I8jFC2W2XISrRAgxXChCmMbGQDwWFwI2naTef9Oip4jFmrBDJd6QWw9NPJu80+T8tHmFmoKgmrVhMNoBofiT6FIzPS01rKz+sFysrDYeJCOihTRQgX6Ak61hGmZm2qOBV0LhH1QhcoXnQH7GisuXrRQkB/f0+fHyp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvrGsBpc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gq1MV0sb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3SIBY357714
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 09:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOw3EO7nLkYLFzIfBkPtDdBHcC4vS3EetnLmKhKyPN8=; b=WvrGsBpcy6KF0unu
	lofmjU1IdzrGCd3IRdKv/rrdSQ+ofMHZ25uD/oe82wevvz+ra5Ljp3WYs2q/B9Xt
	1b9F+jC3iGwTy9iOc+tcV53fQaW738o4sG2fdBBzSYbwrN+2zHnES396iTggWKGl
	x+ng8t8ob8MVRR2WqPN8DQjAFZtwg25sIj3/lt35uPs7V9CE2cGFKRIdVvbHdmzV
	nmGTg8VlU0T4lXqslWHUjpiaYyV3r7W+VC4aG4fj3gEs4k3ZzBeibDK6fLgtvUyD
	SWaj/HGg5z6Lcbg0+ORb2qo2JjdqT2jzl0fz1NEn8RqTs65ihFhiPWtLWzg5U1fp
	eaYC1g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8uy6b3mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 09:08:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89547ddf32bso17011696d6.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 01:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770887323; x=1771492123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOw3EO7nLkYLFzIfBkPtDdBHcC4vS3EetnLmKhKyPN8=;
        b=gq1MV0sbDNFkuonCxPYT0MYn4y7w8Vou098gqA94K9oQXXmi8mBtCW+B83SkUWN8e6
         zndGSXBKvaOCxv/nvuOF1ZPefHp6S4v1KepqyLJF5bAZ3CIX8lb/H22c2oUgP7iqMHjh
         UB98XzMdX57/SW4NIiqE0VNYGUi93gUlIf3p03u3YvbUyyYIX9F+WImEnb/k7gHxuChA
         Li68MTyy+VYZF8bxy9PlwDRYGRi4zvF384Ay2yVEEX3PsxCbLWw0eGhU/HKV/2YR0sCx
         LUDJaJr9MvtZZJOgT2a4U7CFwZE+BvsYpFREaSrnIpF9lYcbnsmrkq6RQRYkiFeqk0uL
         jiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770887323; x=1771492123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOw3EO7nLkYLFzIfBkPtDdBHcC4vS3EetnLmKhKyPN8=;
        b=lB+4G71pBxdsIL45+le8IN82OlF44CpV0o+4/0HTzBpvYxU0bCTwKoOgOol/W7WHBj
         TFWGx+WIagYuON9XJpqZNEO5xe5549XzzFz15CZEPyluWizYJvn0pOFTF7RfAyuD3C1w
         SHjmkAJ7DOpVhyS7zCivvD0TUbqpPrsULOlo3auOhpvET9jzsH3hHn4T7Rik8qz9U2MN
         iY9gqsBlQ31T4r+7beB8FTjTYq1A7PfIMQUTswN2nYM0iohVuYggEU46X5SyHLKMUeZ+
         9tj7DKZrDvUVmSPleOI10cVtRN/TASD7bBbupQpJLjKcRbt/4Km9+m1vZDPx/2k05hoJ
         Fptg==
X-Forwarded-Encrypted: i=1; AJvYcCWiH5RNDHbvA5UF83gCgmaSwwYEIMpPK+1HQU9GDDDdKjwlUZr+tyJ605dZTICj58po5XvgpYxY2EI+@vger.kernel.org
X-Gm-Message-State: AOJu0YzjvCy230Pz2ukoAdbFXm282XUGJPGlg/2Bl8F2/5MKA5HOsssc
	R+KDhh6g38HHMjN2InSyYj0pmO6N78YGaBF1xPjebmjEr4E70oA+CoXZ3s4VbXMkLcU7A+MGOV0
	sB+n5lWTBXHg+qoHQ+6sxMzBzlvPqMjDVWN/mFKsrU6QHtwsgrTqKPN5UsrkJPHUo
X-Gm-Gg: AZuq6aKzWnxK+km2ZFt8g43Qc69RgAfuwt/0j9arXXpmYFSU6qgyhA+jzGBD2q8TEId
	N7yWmcYyOh8vFUudIKHIWPtUOlfEiljnWXr1UEoTw86V8Glhrd5IOtg3dWE6JliiWAfsmv7hki6
	5C4S65Spbk80fDbfPHb+XnAU/gE5z+2XIe+mBxdYw2rA7lYgCC2UhV0k2pZKSx5j+R4nHncwyao
	z62lGeGyxSzO0acQH8uSlJzlZgHPHKb4D3LbgwHrvAiX4tPFF+z67T1g7um9gBy1IEt+pk+VH5v
	D6CVVs4/2e7XRyQ6s8TkNcL/JQ1PfHRF4cNF2nT1qTXB9hxUIsKi1kk35MZFhpRgilHn0J+PW+h
	022U5BoQP6npvBRRPvULVoIwQxGf6PJz0NwMDm9IO+olcRMqM2KX7rztbyfi/yjG+zC3TrCL/Yh
	/UCrc=
X-Received: by 2002:a05:620a:2806:b0:8c0:cec5:148c with SMTP id af79cd13be357-8cb3319d1acmr191639285a.11.1770887323251;
        Thu, 12 Feb 2026 01:08:43 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:8c0:cec5:148c with SMTP id af79cd13be357-8cb3319d1acmr191637485a.11.1770887322827;
        Thu, 12 Feb 2026 01:08:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f9bd846c0sm17898566b.3.2026.02.12.01.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:08:42 -0800 (PST)
Message-ID: <3698abdd-e864-47f1-8041-fb129389d90c@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 10:08:39 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm670: add lpi pinctrl
To: Richard Acayan <mailingradian@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260210021109.11906-1-mailingradian@gmail.com>
 <20260210021109.11906-4-mailingradian@gmail.com>
 <2b3d9528-56d0-407f-bd3f-e805cfdea5e3@kernel.org> <aYvMCCWxVPXQeRCZ@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYvMCCWxVPXQeRCZ@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2NiBTYWx0ZWRfX4YCLxAqF9yNv
 q3SkBtKkrhBDAzmXI41Yx5Ucly5E6mCIR80flp6FwVdOimtzBqm2aAPNELAJ5QCd3ovaSnx6fqU
 ej/rPTgWvMb2fmPdp/k3DJ7nyr0eX/Ii/RtuHEsGIPG/YrKJFP5Dt0qWPQf6BxqIsDtrs1zPFGa
 LcdApi3i/lboIBON8Ur9mjL0J3g5wkwV3vk5oLbLTGGiO5r/NdSyhtCxWCmD0yRhphYMSAlMScP
 ApYcRTQQMYaTcYV5DT3jmeO3pmyMGIf4Thg4pvjJTEzFwTjrbah9xbP0ZugkxAJulH9qot68jiJ
 Jm/Imb422GFnz7N3nDc/gqen7cchyW6/b7h3Ht4jt+bfr4qf7c+/dhrlo48Thc0vWMQpVM9jmRY
 SoaYd3nEtR9AiWPBqwM/m/mnQDPrLjYV6qKxkBhoQYIm0CCeGEQigDw7Ef3+JTZoAom5lLbO1Ah
 9nvUdc8ECWolMGmQSqw==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=698d989c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=uYbBWpVSLx0Ciq3iwAUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: td8G6hYh5WeQby4gNHI8sUl1RXN7iVp1
X-Proofpoint-ORIG-GUID: td8G6hYh5WeQby4gNHI8sUl1RXN7iVp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31629-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6171612BC06
X-Rspamd-Action: no action

On 2/11/26 1:23 AM, Richard Acayan wrote:
> On Tue, Feb 10, 2026 at 08:42:59AM +0100, Krzysztof Kozlowski wrote:
>> On 10/02/2026 03:11, Richard Acayan wrote:
>>> +		lpi_tlmm: pinctrl@62b40000 {
>>> +			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
>>> +			reg = <0 0x62b40000 0 0x20000>;
>>> +			gpio-controller;
>>> +			#gpio-cells = <2>;
>>> +			gpio-ranges = <&lpi_tlmm 0 0 32>;
>>> +			status = "disabled";
>>
>> Why is this disabled? We disable blocks needing external resources or
>> being busses/connectors. This is not the case.
> 
> There are reserved GPIOs on the Pixel 3a. Since commit 4f0d22ec60ce
> ("pinctrl: lpass-lpi: implement .get_direction() for the GPIO driver"),
> this can't be probed when the reserved GPIOs are unspecified.

Are all of them reserved?

Does gpio-reserved-ranges help?

Konrad

