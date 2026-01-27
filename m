Return-Path: <linux-gpio+bounces-31170-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB21AnoAeWmOuQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31170-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 19:14:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D29898DC9
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 19:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B06B03060579
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 18:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8093932570A;
	Tue, 27 Jan 2026 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ou/yhYGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnrjsuvK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18B322B80
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 18:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769537614; cv=none; b=bEO6PD+fSP3UyabFkQfy/TWLgYWF3rfw4WQN6OZEZUK8I754nzFhPHVqMWNa1U+JffHky0lsFO2TOfFdnWFmirLlq1R05r3FF7mAc9ZFhLIeg0EomLoJ1emvDJuWNc85lFTn3ckoRV1xYz6VTOqSBjr9ZOopikPHinQNt+4rUJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769537614; c=relaxed/simple;
	bh=ZP9jD5oBd6p4cx2ft8JtLqpa/EzTPpDlX6uplfrO2XE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7ub876AkZU+HayJ0XwddqK5Bk/PZzz36QqyyBixz+upollQSyOa96SEGS3ded8QEuja3rbvywtUM0eiWXglvvNnScR/V4azZOTCNC+A3cH0x/Q38XPQtQmzlfnE07VSdxxuyxz2SKt1Kibt8Zs6/KjzpQRTuItKl6kBZMfRhLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ou/yhYGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnrjsuvK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RFL1rX621206
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 18:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVOW5CGJHEDR3nYWnM/7tFR0BEN89n9x3EXWGMv4peE=; b=ou/yhYGMRM4LwzGb
	E4qvBiStIcXtWASzRfsdEFehMEKrw77cn4SPAbGGApt1J/psJCEzLjeKeC8JOIuq
	kRL/N/+4Y9ZHSlGIVkBsmR1r2JgiRZPlvoNwacnq4Vo8PpCSyLQId/zSe9RIthol
	CvnLd/Ns1MQ/HCGRdYsSngV1AGwEnp1JH3l8AAoP3YDBHQKAbO1FMnukAjMZYkkp
	D1ktPADmCkTNeLDcGMkfAH6v3SGxzqbZtaYBgjBiTegm9V1uHlggsGeSEOzFCFKD
	6CuzaMXPahrzKEqZeb+95/I/4jbY2PslhFlVcSLNVOBPIFvv8lU5Oyn82cXF6obc
	7K1DLA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjej0u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 18:13:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f3c36dd2cso4350337b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 10:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769537609; x=1770142409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVOW5CGJHEDR3nYWnM/7tFR0BEN89n9x3EXWGMv4peE=;
        b=NnrjsuvKOFwpJEmlmnxMw+VZU8z3+45WX7RNK4qOw+N+DLxw0/yqw7w1c2ERXajQaq
         u3yM24I6pCZeMHj/oUwpwlzvRhOdKEFACeejtluntJphWDbb4UoESXpsLSfojp2DYY2T
         h160FLXhd1Zq0qxW6tk0cZcT/pqwWwKDa6c9q9RkVg0pD0CJxoU9czvoXiBH0oF4Uqpx
         Uv8tFC03j289CKPZBkg0VpFhmP4RrDF6FBps3jqZ35nCu1YBPK+nGcwoT14RfAJH4cMQ
         nEYNAwZftpVWF9uPmku7LM/pGGw3qNfWXiqQVncak4v+l+oimEn70TLVarSasxNX7CZW
         rgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537609; x=1770142409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVOW5CGJHEDR3nYWnM/7tFR0BEN89n9x3EXWGMv4peE=;
        b=u20p8xV4gdeSVoxGnfCv+mh6y1C5OBwGMLl+2qi21nYplf7ai1EUd9OcwWN4cSsiPr
         NLn4oLS8Ghv8+lvCgf3EgeHxOBSCt/FcmDP8AO0fsP/2exr3kRSp1gVZz14v/eUl7jXb
         vQh/ZkZArq5YD58UrW3B490IdFSjS8jfim24tRg/oS2vl/up0eAWP33vqXzgsxmr1UhH
         y+EtbrN4q2BfUow999dtdw6zkqTTZl1vEHKZQssWXMBqx50ahPpzcTI8Fs9S7gF01/7d
         ZdgOil2SZntjEOl9XcSe5YON+K+ht0Lhx4h/STCmmCkJm+ars1Npu4GbuFI7iI/RWIgK
         2SLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgC2QSn2+PWz+XTDwbde1SyqvyrrnNENSvWjjq3OQw/r3OXicGLb/SAd2p4vznwipn29Lkv44LlGLF@vger.kernel.org
X-Gm-Message-State: AOJu0Yypx4JUcPD64Gl+Gs+VBja9eTLIE/h/0XccvQdSbdcbXjRDmePG
	1riI0ez8kNdaIMeO0zhoWx3KpXwkao7xOO3i9I7pUqSJpOD+EJg8etojvlJeIaH1n6KVYrkpydq
	Zbn4eK8v7VxZmzJsltX5Cy+2ndT2NGsCBkBCfBuObZ2Ui0pj6XjcLB9HrxRAHYSsJ
X-Gm-Gg: AZuq6aJXzOXYhkAiPttF0sTF8ddFi1S2dWugq34v7v+DAJld790lmd/1A1tf1ZUtkQX
	242H4pwjCjqJQ5YZ0pe4qi04f4iPyVoyqAMoeBKnZcP1156TfmYiezxP0sGBdxWpmWU9TFSAO/V
	JBL9AmnsHe2fAYulYRnIEc/vhJRUaRFR5hLqSoLss++tZ/ftKP0y3kHZS7frCmfcnSDuloFq/VK
	jyv8A2Fu3q2aR7ScwxGvF1O4QJ6gTXNHCXwNtI/mvCF+RSA1T4aU0nfEb8EwZuO2lfCkEgVJxtJ
	IFwWjOZWRqWCxUvFBlexUjimtc0i5/vqZaOf5SNMbyPMolWYOXacNi5NENLt9NmxejH+uOrt/v9
	jyPghe642MTcvMrkCAVRmg4iPbGagPbzcSA8Ii/Ys0GqZt1VL
X-Received: by 2002:a05:6a00:8d94:b0:823:244f:1f91 with SMTP id d2e1a72fcca58-8236916b19fmr2106852b3a.11.1769537608921;
        Tue, 27 Jan 2026 10:13:28 -0800 (PST)
X-Received: by 2002:a05:6a00:8d94:b0:823:244f:1f91 with SMTP id d2e1a72fcca58-8236916b19fmr2106816b3a.11.1769537608266;
        Tue, 27 Jan 2026 10:13:28 -0800 (PST)
Received: from [192.168.1.5] ([106.212.237.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c226afsm217807b3a.49.2026.01.27.10.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 10:13:27 -0800 (PST)
Message-ID: <9f5436df-fef7-4921-85b3-b6fe4e942779@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 23:43:23 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl:
 Add SA8775P and QCS8300 pinctrl
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260127141740.GA1574044-robh@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260127141740.GA1574044-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0OCBTYWx0ZWRfX3/wlIJ0vgioB
 hTb7w3PuV+QJ+1OqiIs9GeKrzw7U/xzjY1CD6CU9jmm66aIt7SwU8SOQNI5UdyIXabuZoB7kyiE
 rw3BPYVLmEvI8DPZYwjsUtdbuWb+EiqY1qdpDVVbskfFCbZ4piZf3SKEB4ft4ScT58kCByJpjnI
 94XtMeRhdXKoJ1wFah+J/SjhQhnLuUgVFppNsVyQzf3PQTraqT1ZESuFxHWUiBhViOUplj73UwN
 Ay//90PdWzGHSpvSh9SCK56qc+uCW0S75+/MR3XsrrJ9O4qid8fJ+7Hc+0e/VoOppYwWfdy6Yys
 4CMvT2SjUsP02q4EqwzbaQCgwL/9C/y9dISqqH5v9ScNuERYJpImSTngel3161TmiyrEQjYtpaT
 iq4y/FFy8jsJgPUawyfX+ypkJi97eMFtR0Jy+6PJVeYjf1woVT5lNO+PgSJe8N4LGsMbOUU6duw
 JinOG7yq3QLihNE/gLA==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6979004b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=buDgOHdOW+2HB7N8kE10CA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HaOfPcbtI1sGS6EAhDsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 7UTyxXTtw6PbouYRjOKLstLKIotwyqy_
X-Proofpoint-GUID: 7UTyxXTtw6PbouYRjOKLstLKIotwyqy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31170-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D29898DC9
X-Rspamd-Action: no action



On 1/27/2026 7:47 PM, Rob Herring wrote:
> On Tue, Jan 27, 2026 at 04:25:11PM +0530, Mohammad Rafi Shaik wrote:
>> Document compatible for Qualcomm SA8775P and QCS8300 SoC LPASS TLMM
>> pin controller, fully compatible with previous SM8450 generation
>> (same amount of pins and functions).
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>> changes in [v3]:
>>   - Removed the duplicate driver code patch as suggested by Krzysztof.
>>   - Reused the existing SM8490 pinctrl, which is fully compatible with SA8775P and QCS8300.
>>   - Link to V2: https://lore.kernel.org/all/20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com/
>>
>> changes in [v2]:
>>   - Fixed dt-binding errors reported by Krzysztof and Rob.
>>   - Added proper slew rate value for wsa2_swr_data GPIO, as suggested by Konrad.
>>   - Documented Monaco compatible as suggested by Konrad.
>>   - Link to V1: https://lore.kernel.org/all/20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com/
>> ---
>>   .../pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml         | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>> index e7565592d..354629c38 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>> @@ -15,7 +15,15 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,sm8450-lpass-lpi-pinctrl
>> +    oneOf:
>> +      - const: qcom,sm8450-lpass-lpi-pinctrl
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-lpass-lpi-pinctrl
>> +              - qcom,sa8775p-lpass-lpi-pinctrl
>> +          - const: qcom,sm8450-lpass-lpi-pinctrl
>> +        minItems: 1
>> +        maxItems: 2
> 
> No. You are either backwards compatible with sm8450 or you aren't. The
> h/w is fixed.
> 

ACK,

Agree,

Need backward compatibility with sm8450 for both sa8775p and qcs8300 as 
they must fall back to the sm8450, so initially used enum to pick 
between the sa8775p and qcs8300 compatibles. I see enum isn’t 
appropriate here since fixed h/w.

will use the const instead of enum like below.

  properties:
    compatible:
-    const: qcom,sm8450-lpass-lpi-pinctrl
+    oneOf:
+      - const: qcom,sm8450-lpass-lpi-pinctrl
+      - items:
+          - const: qcom,sa8775p-lpass-lpi-pinctrl
+          - const: qcom,sm8450-lpass-lpi-pinctrl
+
+      - items:
+          - const: qcom,qcs8300-lpass-lpi-pinctrl
+          - const: qcom,sm8450-lpass-lpi-pinctrl


Thanks & Regards,
Rafi

> Rob


