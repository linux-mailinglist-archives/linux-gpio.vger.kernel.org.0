Return-Path: <linux-gpio+bounces-30843-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGAqEgS1cGndZAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30843-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:14:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D0455CD2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 33BFB68785E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 11:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26343E9F98;
	Wed, 21 Jan 2026 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7Tm8dLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfJbhW+E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126583ED122
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993541; cv=none; b=DXa63V2EtRO/EzS4nyk3w36HSTJefNIIJahjZCrg7LbdmW6JD5QJMxLG3KOW8r5/jE1lGQ3A4ynh8Tae7wYQvQrUK77yCkjyytf608qYyuMBGKt9tg1YVt5NevI8jTD8+nMIYb/ciV6fJFioq1vZWAInaxSch0NCyQ4D9uks/14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993541; c=relaxed/simple;
	bh=N2pGDS/a9wFApEvBD5D6DlUyIUa4xe6Ed7BTBkbfaHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDBrjD4A6PvXlNZwye8MVG5BDnH50kw1EzyykoHTILbAjvy6bu39iAiVzQY1UOt7q9hMcN7V0RMitnGfpdwMVfF8nL+OwuWKgV8jg90T/TSOzw52PW1aK7+j927AgR9lDcvWZCEJAS6kYrgiGevhG7lVY8fbvhI3h3nZdhc7jFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7Tm8dLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfJbhW+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9ujLq2840468
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ld8GqU3D2r4/C65SErwrhAuPQ5LtbJ6Mpvp8+G50/No=; b=H7Tm8dLcmPfjMxW6
	s3McJIPA45uK5tmZSifE5nlsTOaNRNo+I+4maAkSVbs6z8376WLopnu09rnjEyq5
	8nDAvhrcEPl1u4r8xzmg1UcFlNdCEp2HZWWi8+pbdFAqX0oiMYRJGbdbR34GJ/Ed
	tfR6eF4fWIaNeEPQFo0iSadjhWTgqNy6SsGQmYUv4Ye55ODpjrwP7Fy5T4J4oFhk
	ZDe2tQEPmDz/2GsfHJtwL9N5Tho5aJk34esjqOkBaB+nooOmC5AbOtI+R+wN9BLH
	zntwzYU1KVKHx20Ocjt3lytZEAewoq6N0MTctcmZ8/xVFHoDzKlAEq/X8FgjdJxt
	Z26EsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqm1sp87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:05:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c523d611ffso67767085a.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 03:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768993538; x=1769598338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ld8GqU3D2r4/C65SErwrhAuPQ5LtbJ6Mpvp8+G50/No=;
        b=dfJbhW+E+qVXdqMvFtmbPTYoXyTz5YZcZlTYqM9weDMK8lf3QDM+B3GKT+NssjBWn0
         JuBTX/pqeWAW8YUQWYZ6ihrWVYhym8BwDnNezEF0m+7BxvPBblvyMCoQBQcadfdey8AA
         QVOqFMj6hOWAhlh/B/ketuSTa86L6Lpf5SDgLXdKNQoDo5xX69T1Wl3GfeJtAvQRSqu8
         4uU8xs2ATzV0EsL9zWpoLkysoENWhcqzT+eKDLegPqakmetoWk0Gx3M5sxFP0OhDK3yY
         tNqQx2Y+WglaC4nVaQKG5RYmijfkGnHwAgjtsjze+WVkHBAEW5i/O6AuoJ16CcM1zs/D
         JRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768993538; x=1769598338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ld8GqU3D2r4/C65SErwrhAuPQ5LtbJ6Mpvp8+G50/No=;
        b=OWdKqyhF9FLW3BXzmxUlV/84tPrQkXPiUx187y7REQ7WWcfwu/zj+rYoBhhLf74rkK
         JuOkKSZOv35JB8ImJwdVbF9+Nl1Ny0gEQ/4og2XqPr6uiAfRZHxhxpE+c1aXsJHdNMxh
         awdwU6Z0uWgNGvVNV872Yas0X1GSL4KxZfEeiSgoHZYuZ7BPvtBEldLVfmmLRlkxD9aY
         ERKoihGwoQmM9v4lB+XIKvDW5NMef4ebB79ZlS1QaZzWxANdXrJ01ficxAqg/XDB6hst
         cUmYkkleTRShaZVjuVMaSIC6eCiiogkXB23ocOvDNUGwMKXS8dzG6qzZfrQiYTFEa/pX
         kKzw==
X-Forwarded-Encrypted: i=1; AJvYcCUDHJctY/3q4a4Pm+kKMBFVsaIsXdBe1TfI7BI6KxXxA7uguvPk+mdPQnygFhIE3rIM2Km35R/e9ebU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4XqaiugF9pwgUiq+Ca5fUrUZW0MtwllE6TFoc4XScL9ZjKEjf
	+gdprVnE4v3DPj3+MPP5szR5G9/kn2JguLDxtaGd+W3n3URFfeABAsJ5IoSdgsSxMxSZumrx/gr
	YOEnGAFQ9FA1dtDZGFzfAD+TS4w3DTny7bp3zkTq09iATAhsb8RuVo6aW2V7XBdBI
X-Gm-Gg: AZuq6aKqnulaojGlisiWsZphcXGFIF6VgxLTxUF8SU1GbegcFBdltcf0Mgh1BYeOT/7
	XRrbKcgmTBdwkHZjV25i0uhszY6g+FaLkjEEt/1y6ZasVDq0ML37IM4+gCZxOy9OzYVDUAot7RR
	WLUlMBM3dL5cCzIU7uMQpXs2mFQqzm7y3L28V9qTYyLIPmkSUFY9YBVhWSS0xRuI7s02ufXDjZU
	k7Jj4WFBq7AIZD9rIarolsn3oa1n+Vl8G+9F+vCk9iblsrHZ9DzfGwHqVbKur+t86ZgeVtmA2yf
	6d43wDDoS3zg7jr1hqkiunbS7dFfNn/l5igatxyIB1zLSe6iiSmfaTfbVeHBgpsb2h21TLBtxXh
	0TbsBvMXhHrOCZP+s42mmtwkppySEy0XPp6p1tmLIHC3TrGDBud9arInfn7QgAb1+N3o=
X-Received: by 2002:a05:620a:19a9:b0:8c5:340b:415f with SMTP id af79cd13be357-8c6a67054f0mr1785396185a.4.1768993538415;
        Wed, 21 Jan 2026 03:05:38 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8c5:340b:415f with SMTP id af79cd13be357-8c6a67054f0mr1785394285a.4.1768993537980;
        Wed, 21 Jan 2026 03:05:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9fbbsm1588611566b.38.2026.01.21.03.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:05:37 -0800 (PST)
Message-ID: <6251ac32-a3ec-460a-bf0b-23d6f356b93c@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:05:35 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: document the Eliza Top Level
 Mode Multiplexer
To: Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
 <20260120-eliza-pinctrl-v1-1-b31c3f85a5d5@oss.qualcomm.com>
 <kb3eolcpmz7yqme6menjdjmypap7cadkqdnrgc3wxiwjmslmf2@lbwum5kox5ls>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <kb3eolcpmz7yqme6menjdjmypap7cadkqdnrgc3wxiwjmslmf2@lbwum5kox5ls>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5MiBTYWx0ZWRfX0tpGebvvYxLC
 /iAWj3mTivko0qdXlrR2ER2/THCB/utt4b9T+VaPofRGyc7ciMl+yruJ/VsOBn9u7a/ByHghV2C
 1//ZB2+BM+0n55V35+xvcbIlxnvy/XCjZXOdc06tHfrOXPbZKnBZ9qmFYrl3XLCtMepqmuc104R
 G2Sd8SqklRBZPXXvWnF+BGtW10/G/7XUo+d5bXhqxWHiZbsnI24ZIP+rhcWmCDHDTmcK4k9eG85
 en6EjP30HeXj2y5IKK/EQlShdU34S4Rc62epGan9M1F0fAN+NSzASErgCoLJtqTGHXhVJz/WkP7
 fqTsyASiXtRABlqHCuAWsmfiFKbQx+2kFIDO385+2tLk+otDh+JUTRILlZiWdkfv40l2rm59YQk
 kCRPIsXVNGNbMDN6JIQt3lH/FcYBCzP58C2lvQrREMyLTgDQER07EoNQ6/CXhDjmRwMtIsqFnSv
 2aEQEqxyUZg5Eejot7A==
X-Proofpoint-ORIG-GUID: x2eAiAPR2IoaQGWMGJbqWqP-KN6nuhrg
X-Authority-Analysis: v=2.4 cv=dtnWylg4 c=1 sm=1 tr=0 ts=6970b303 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nxOKBEek44l0jo_vI_YA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: x2eAiAPR2IoaQGWMGJbqWqP-KN6nuhrg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210092
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30843-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29D0455CD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 12:40 AM, Bjorn Andersson wrote:
> On Tue, Jan 20, 2026 at 11:56:40AM +0200, Abel Vesa wrote:
>> Document the Top Level Mode Multiplexer on the Eliza Platform.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---

[...]

>> +        gpio-ranges = <&tlmm 0 0 184>;
> 
> I think this should be 186.

I concur

Konrad

