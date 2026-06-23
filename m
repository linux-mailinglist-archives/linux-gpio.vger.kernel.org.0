Return-Path: <linux-gpio+bounces-38838-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9G51M8VNOmqm5gcAu9opvQ
	(envelope-from <linux-gpio+bounces-38838-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 11:11:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB36B5A38
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 11:11:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Mgp0G0dF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jK9W367I;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38838-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38838-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 454CF302AF29
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 09:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6247030C366;
	Tue, 23 Jun 2026 09:07:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3802D4B68
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 09:07:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205636; cv=none; b=m8pKjkwB0C7ZJJ2pv1UyTAyfp+9BZzzBYLHBkRrNjK3l4qZouiVCy+U2tLVKv96P7r4Uy6/rYOzEBL6ivuLyjl9od0tAcJrl/nMvevuDecA+cz9aX/EeEb1f3V62L6h4yhTuMqYIXYwdUA8COvH/LUA6/aasuxvTeqUm4X3aVDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205636; c=relaxed/simple;
	bh=WukhzqxNcZwMEQXcGdz89FN159EkYgGHDb4TCOJ19SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7dHiZpO+kYuAh9g8RP/57Mkz1HZrfIKQ0SUt0xK2EYPbMoR4hiIqimt+/ZS4IQKhHf/mJwslKvutFSx7lSHuIdG1cXt/FtMSxIx+HYh70HKbJ1UMc0J959OfMw4OcaU3qv3N9GoNKm9gOa0sd4mAY3/Oedze/DaEvwnAx3zMJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mgp0G0dF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jK9W367I; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6ckNr3564025
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 09:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynNpB9XvAD6eSLMQywfDBUNke/Uf1A8kYmXY2NhjcL8=; b=Mgp0G0dFB8pbwVk0
	wj9ryNpuqJbsNfD0LfJuCfFhYshjeTITf8942Z2YbyqEF5QhWqpEwGzz96VTF5dr
	94Jo07mIDrkXisOOUXKwyJby7AXRU0CmqX5D9jNg3s4mC9Fp7YfqFxycjZWSfGu/
	r3NWrAyJ0z9oVnlvnOXV9mo1HabYIYRwipKYtFhASmM5A1he1pjWjsZiakVYqYi1
	R966iBcb0fUwcrWgxIRuygV+GYFFsXiankjWL+6MLton7ac+q9ag6Zc8HR80NiRZ
	ARFbUttYAfJOJNxr5Fl1LB5tjUc0sDxsNzs2gWnx3R952Dei1U4GRC57Bjq7/m/8
	n0YvCg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n43ww0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 09:07:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso60347455ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205633; x=1782810433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynNpB9XvAD6eSLMQywfDBUNke/Uf1A8kYmXY2NhjcL8=;
        b=jK9W367IT4DOi3pyzW+JYy/woyV2Wm33NodipDAnQlRd00M7DuSa0epui4mZumwKJX
         pI3DQPjcvy3iv4K4oicOiRoSEefO8JEFJbGIrGHVrlg7jMztS/xWqQ6vIAznQ77o7Lde
         rcRfSJkb+fAHLogFu1O+/E3gns/OFHhXOBYaxkfzYexlqNl6xYic27tFShT/fns59xso
         /oZCsdF72v1uVPUCYrhh//Kc2IlMsp+0Ve1AA/yGVLmYKgEHmQuA3KFYebJhIZdCS1+F
         LpSFe+l/Tzt5kigYnHWEKBxRlF2z+o/vgtofGsd/ihUjMIKgG2ANIDLf0h39/dW++RET
         j6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205633; x=1782810433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynNpB9XvAD6eSLMQywfDBUNke/Uf1A8kYmXY2NhjcL8=;
        b=lBCbIDU74jrQeSDTovM4flaHz5ufszrSKijD4IEC/TpI1F16QmruATsBxshxS/waut
         +m0O0c7LRGXg0I5F6zOZ9q6f97S+KM/2r34SdEo7/oTAfvY32SOiwY+BKn5OgfJZVf13
         i152BM/As8peMWmJOMH+Vzn9xgpEbmx7d2XTl2zbCL8tFQ99UaysUE7z6q2hU98UOcdl
         q7DPMlJw2T47qWS2dXx2jbXjL9zL5MzK0eXMDeI8XENocQmXQgN4cymWmDK77Pd+GczD
         40nQ9SqiU52BQieujdvElH4qXnd08ZXfqsgCT4hEk4LYkdpVCBPZy7qgIk/Qns+L8GC6
         FdzA==
X-Forwarded-Encrypted: i=1; AHgh+RonjQn5z9ua62wE8ixmDBvAdGQAvVGlRJz1xV70zQ2D3bxLs2+rL8nlsDMPtu937d3oQUkClEi+Pucu@vger.kernel.org
X-Gm-Message-State: AOJu0Yws3pzUDFXqyUagyZQAkce0BEzPpXd62DOtlhkas3rWBs6Tp4Gp
	egXd28omOBXK+hvQ6M+4NUDtblyNwovJZlMIlogG5HGqF/kG6jfMljmHQe1xYP0wvxqws5Wkl08
	xidRO9yb89h+V84QcMb33M1nr9EoCr2gUjozbaf1JI9Umonh+yNwLOjSlWy+3bDNg
X-Gm-Gg: AfdE7cmewvYEhKN+PeegirtEHoxQ8awoun/ZzI0D5ugp5fLjHsZwDVzkriQUqn8EiYc
	Kq5br7+1bIV7OVctfr9DOwNiN+QJoSzmBZt35e+4p5L0CTUDaGPdznWbjBY3lRjGMV2j9UhZc40
	99QwTJdsHzEtRx7kF1+R529CPllgIkl5Ihvv0SpJDgFdRubFqST0AJH77b6tSJWdBnb9X7rZRQJ
	p7md22KSj+ccXBz7lcr6S++IcFnQ32kmgDihfMWe/PhEikisnyicDAwFSPRFc8x1J1LCHWsE0bv
	DXFEAyGScW3LfUoAJtzbSz8dxKpFYBrbbnGD5q0+/5soPICuSebsMRuS+odbDQtZxku/GuIAiLE
	OVObuUyfa7LinJsVBykioahVftNJ8CsfHExh4cXnW/WQA
X-Received: by 2002:a17:903:1a68:b0:2c0:b19b:ef0d with SMTP id d9443c01a7336-2c7c99de67dmr14775825ad.19.1782205632591;
        Tue, 23 Jun 2026 02:07:12 -0700 (PDT)
X-Received: by 2002:a17:903:1a68:b0:2c0:b19b:ef0d with SMTP id d9443c01a7336-2c7c99de67dmr14775255ad.19.1782205631977;
        Tue, 23 Jun 2026 02:07:11 -0700 (PDT)
Received: from [172.20.10.7] ([106.192.20.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d3505sm102101125ad.19.2026.06.23.02.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:07:11 -0700 (PDT)
Message-ID: <89dad28f-c691-488c-bfc2-6ca3bd2068a8@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:37:01 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add qcom,wsa885x-i2c
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
 <20260611-debonair-barnacle-of-action-ee9d22@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260611-debonair-barnacle-of-action-ee9d22@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX2x3A16H8M1O8
 VkZKLmXa2DDMytRyAM2fQq2hCO4txo7r+EIvZsUOcgRwBNSrhWwtwns7th7wtkN5xVfjzSzNy+j
 UM7ueyZGJ0BjfHnuteaKQYQq+Dk2xmA=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a4cc1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=GtHFPjVsJ1z6j8OeKiQY1g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1GWs3Cmanii3QIT9qZoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0loI8vYr9dRHPS3O9EbQ9fNCTcdvGDSN
X-Proofpoint-GUID: 0loI8vYr9dRHPS3O9EbQ9fNCTcdvGDSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX3Zgl2+XwGZZ4
 KII449rx8B3Xv6TZ2OEDNodamskS72K83mbAo3yCvp32eZdgvGzI51LToNEB99GAHWvqC2A7zFx
 XMIVcRjqS/scPnzHhdwT2nVMil16wFjvTR4iHtDmG/FaZP+PBABe5q1F+nHDvgprY8CFKqN9Tq+
 rWr0deif/BT8ZzLGmggl4ltQHllv0tQCl3NI0vwvPcMpaNaidyHFX9ZiJAhV1dj97gpnskilweH
 P7wHr44ByjQYjCVcrT6SmUdYkvTncuyMGIXN66PHGsFSmA0OuCwBbt+d8Lpz290wAYaI2VwUNOJ
 HncCr/7ELYWQnLb7ui2sn9CPFUDf6fDYG0yDU3A3vII6chfZwm248Tra5cQHLsyTEoG+LGqg9+5
 T/nbP4xqaQD6ZL3BLc5VoYwDsuaApvzrPduBl8PjqK7Swb7xlrrqPYV3t7nRbD4uafXmYL9dt4O
 ZuraTMu3jf8tf5i3cTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-38838-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39AB36B5A38


On 6/11/2026 3:04 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 10, 2026 at 09:27:07PM +0530, Prasad Kumpatla wrote:
>> Document the Qualcomm WSA885X I2C smart amplifier binding.
>>
>> Describe the required supplies, powerdown and interrupt GPIOs, the
>> optional battery configuration, and the optional init-table property
>> used to program the device during codec initialization.
>>
>> This matches the driver programming model and documents the DT data
> Binding matches hardware, not driver. Please describe the hardware.

Hi Krzysztof,

Thanks for reviewing the patch and for the feedback.

Ack, Will add more HW details in next version.

>
>> needed to use the codec on platforms with Audio IF playback.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   .../bindings/sound/qcom,wsa885x-i2c.yaml      | 89 +++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
>> new file mode 100644
>> index 000000000..1069f470d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
> There is no I2C in device name.

Ack, Will remove.

>
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wsa885x-i2c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm WSA885x I2C smart speaker amplifier
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> +
>> +description: |
> Do not need '|' unless you need to preserve formatting.
Ack, Will Update.
>
>> +  WSA885x is a Qualcomm Aqstic smart speaker amplifier with an I2C control
>> +  interface and a digital audio interface exposed through ASoC DAI callbacks.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,wsa885x-i2c
> Same here
>
> Also, incorrect usage of wildcard. Look at other bindings how this is
> written, so you will not repeat the same comments:
> https://lore.kernel.org/all/20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org/
>
> Read writing bindings before posting next version.
>
> I also cannot find traces of internal review of this. Did it happen? Did
> you receive toolset comments?

Ack, Thanks for the reference link, will cross check and update the 
bindings.

No, there is o internal review done for this patch due to timelines.

>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 0
>> +
>> +  powerdown-gpios:
>> +    description: GPIO controlling the SD_N powerdown pin.
>> +    maxItems: 1
>> +
>> +  interrupt-gpios:
> No, interrupts are never written as GPIOs.
>
> Where is this binding coming from?


Agree, Will remove this and come up standard interrupt bindings in next 
version.

>
>> +    description: GPIO used for the codec interrupt output.
>> +    maxItems: 1
>> +
>> +  vdd-1p8-supply: true
>> +
>> +  vdd-io-supply: true
>> +
>> +  qcom,battery-config:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Speaker battery configuration, 1 for 1S and 2 for 2S.
> Use string
Ack.
>
>> +    default: 1
>> +    enum: [1, 2]
>> +
>> +  qcom,wsa885x-init-table:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 256
>> +    description: |
>> +      Sequence of register/value pairs applied during codec hardware
> No, we don't store register values usually.


Ack,I'll move them into the driver as a register table,

making them easier to maintain and avoiding opaque DT data.

>> +      initialization. Entries are encoded as alternating register address and
>> +      register value cells. The number of entries must be even (register/value
>> +      pairs); maxItems is 256 (128 pairs).
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#sound-dai-cells'
>> +  - powerdown-gpios
>> +  - interrupt-gpios
>> +  - vdd-1p8-supply
>> +  - vdd-io-supply
>> +
>> +additionalProperties: false
> unevaluated instead. Again, OPEN other existing bindings. Why doing
> something completely different? Is there any WSA88xx binding with
> additionalProperties? No.

Thanks for pointing this out. I'll align the schema with the existing 
WSA88xx

bindings and replace additionalProperties: false with 
unevaluatedProperties: false

in the next revision.

Thanks,

Prasad

>
> Best regards,
> Krzysztof
>

