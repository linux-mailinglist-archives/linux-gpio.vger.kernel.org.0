Return-Path: <linux-gpio+bounces-39234-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HrkaMx7TQ2pujgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39234-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:30:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 710C16E572E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:30:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UMWmGIG9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DIOdAQ8X;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39234-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39234-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94AA9304CDB9
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE5D4279E0;
	Tue, 30 Jun 2026 14:29:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AE6374A07
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:29:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829742; cv=none; b=u5BGUAwBBX9xyqn67oX3iFLMSXXGMcLH+GAKDIsp4AwYP5PNebJtrwgJFcN9Vea2+GjjUPB5uFjsH9ytk2Yp+Ys3o9B0rpXV0rjcSAsPpjdb31dbWXQwr9hh2HHA7MrmLlzV8VcS7p/carepcEK3mnxTEyyzFBKqxcqPEKsdfhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829742; c=relaxed/simple;
	bh=HUFWDZfNw7WipMgUyrCAM9Ngim6VAGB1h19UECb3n6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BH2ds60J9/6vif80PWmKI+QkCyQnrQI9U5a2k1BRHpkAVFVVKQxHXP46/3fXRMx72DQxIOm2ndM1PBbKcQ8Md6ZZIxJxWesSNo92ZwUm0qmMKg2r8llEQgtjWwkZXrTMQeKOjVbeDCHOOssxThhCHgdkGzcd4mSrpp2UaNOxqjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMWmGIG9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIOdAQ8X; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UECvfg2198242
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjISe6TAPM1HCMXm8SEJgRT0KiG/F2ktMgsSUEc+wrs=; b=UMWmGIG95sdZBCSi
	CTpmvWEL/Y1Fq5dKOFMiWsrX1k9yzT03Q8cGnHLGVROpPbxGbX+Re2Mra1YSmTeg
	HZGKwi383ZBfIxC1OVTRjNQTXP14bwAu0CwDbsWa0UOVTxcNCE1hZEMQMGNZsSZd
	WanSCx+LLZaVUNfsW21TBjNY6x46rB8YsGfKnI0fHvb5SBIW0BwgRET9cCFmXp4o
	ir0hkYh4VWA52OolDzE9ON5uRbsxZzyUM/cinJhnuE6ljQZGxBuPlZxI83AOTt7S
	rIfBVVGXOoMVjerGMLTI4EIKqz4NeK5lBpQmm5QGYs8xfoABOz5ssbRqhK27hrrz
	TM6nRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc081ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:28:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso18272285a.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782829739; x=1783434539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjISe6TAPM1HCMXm8SEJgRT0KiG/F2ktMgsSUEc+wrs=;
        b=DIOdAQ8XxNSmnTvne/pk+UAbJ3VT4SXlBDxlIB7iu3zXHQFkOMyiTpxXv3B2ksdmIJ
         /Hxi3+btTTXgYsRa9LZQUWK32EcNHDgB+x96BquCoZZ6LDE6n7yMZ9nloRN6rm4NpTXD
         XiyMIFf+BR2fSZ+fzDOd89eIXBKhiBMFS1nIO8oTQ64BXoss3aNGnIxtyhQAwlBplCTG
         o5N8sOSC6EAwkM3Z5qDTfPaKT07j+ytQcy0+WLJ5AajDFaxl3Xf/4kW/f3TlVUM4Elr+
         07nzeydo607X8tYiZiQjC63rnkyZTihuxCDqmRYyhMroSefn5JBnvHxgWZIvCU/crCJF
         OI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782829739; x=1783434539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjISe6TAPM1HCMXm8SEJgRT0KiG/F2ktMgsSUEc+wrs=;
        b=PwkB2jxYamo71z8AuoUpf2DIxBLWoeORRzFbrnPlhdUivwun6ONNJ3pFWVbJ7THYUv
         zTrST3MQMlcw8rzNFy8z4Ar97QidCX8Tzzh5SXVHUUVs5CwoEmQTY99dKkdMX+t7MRjS
         ZXKq2D9ZOgRntk7eDgknueu3FnUAW65NzRkRFjUg9eloY/Hk6NpMjf6VPYWJCjhtWWri
         lzamuPvv+A7M3xCbps7MdLGVEUmWLOZhVBOTjGtpjnB6rYOB5X2uCqUeCuihgUHQ9sK/
         mWoOvQz9Zz+oQ/Ktp2ZVZPbvGPoU6k/bPaC5n4s2bG4VuEDryCDGSt8PL1+ZgU52aPM3
         AvrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bgH0I9jMHaI8csUm0XieM0OpY+02RioCdmqy+gFyxm5bgxGY8uDVcvD+W/E2eDzaQtkfSImKK69PU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8w8QPMvdQeAxozDzGJML6PDWUC67EHcyfESfT2uWKx/BQgt91
	vkJGS9OtpOReRmVcyBzJ3AIgTbB+pJSgpPlnUtgDe+5DOFCBHUyC18e5pDRFj/JROuhsh0bhld/
	shsV6HPSPZnrPVgWIhFUxSyBCfj2TX29nlrFRyc2mGm2cf0b0Dw0JeMK0Vb9buvwg
X-Gm-Gg: AfdE7cnWjP8Y3aYah5XMyfARsj/P8N+sgjQ5yg8gZMbeIGSCZMShhtp6+lK1F8UL9+W
	UZN3uXTU1V8CLy91Q2Mqof1Uv1LHXFJvzFUrxfCsAF0xCmU7S8f/t3Vi1d6L/19Pmo87GTz3ACP
	OFIXyV3PSQX/GmgAIdMdCSwP4uEyTtlnDw0O5YmeXLhAW3fOkEclZzaj1/D1x6tVvdckdwC3DLf
	DaRhjro78I/N7HuLLBRPwY4K2xF4YTSF/MKSSqvixKhdUlhFs2fERn3uHaEcabh5TXu/vTAK5/c
	npexq8cH6YAT4CEPPzJukcrUFP5bub+tfQx1CLKexcLd7rgnMddfGd3fWeFXywxlTMUwwAwT+L9
	Y5uuaZY54AGlIcIkW7NgZ5eCaCLuwZc4VHsI=
X-Received: by 2002:a05:622a:48:b0:50e:6311:7380 with SMTP id d75a77b69052e-51c1081c072mr38698751cf.6.1782829739189;
        Tue, 30 Jun 2026 07:28:59 -0700 (PDT)
X-Received: by 2002:a05:622a:48:b0:50e:6311:7380 with SMTP id d75a77b69052e-51c1081c072mr38697871cf.6.1782829738458;
        Tue, 30 Jun 2026 07:28:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ef53sm140103066b.7.2026.06.30.07.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:28:57 -0700 (PDT)
Message-ID: <88b5d0e1-4b78-4b79-b9aa-d6438eeced9c@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:28:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
 <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
 <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
 <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
 <837dc7e2-4db8-4a7d-a19f-e53ddbcc9cf6@oss.qualcomm.com>
 <4edaf745-d24f-4ce0-9605-e3971f067b68@oss.qualcomm.com>
 <ao2bl4vzgb3mvqnk2kgvgqnifujbvy6oyzuj4rnvjrv6teyrel@56txzbrtwm64>
 <c0478a3b-dcc0-44e0-abfd-2c86f24db733@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c0478a3b-dcc0-44e0-abfd-2c86f24db733@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzNiBTYWx0ZWRfXwcPPLuNsor2Y
 5/7PADzuu+nMN025Om8KISdGIEFBG5F9ZzRDWOscLQJ7dl4AEHvBRfqFgCNqy/ckv++RowflhBP
 UwLHdVIEyJwcG2WB4WgRizFqhopRD6eh5Rvn65L4vHzDNa0A5SFubJUeJaDxphLq61jiFpslUUv
 9ahcGbD/xvOz3uOo7yLhkyNNL1MAXZNXr7EIdVFMICpfh0i8ERqcYkOitUOJ/4aXQnPTktGon+M
 Ds8PJ5z0v9479lH8g5irvecRGjb3c1/IOP3G2cpERdklngk4B4E1BXEFuGxNH/EfqaBS4jWzopC
 1cYwUynTJzpacKOHOJLXkemmSCvPwu8vTcedAzG8uCVOS4j4MJaxC+59oUVrq14euo4kRxuJJN2
 k4LpOUBXG3DYnBQFzBaLvl+zjq2hn0pK49jZdCQwfDKoXjWG0EeLRVZYhlsOXzeFHXLP03Qpyp/
 99jC+mu6GQQElrYj3vA==
X-Proofpoint-GUID: zhE9lwWD60lZgdQZ4hIrL_Fgt8jtdLr5
X-Proofpoint-ORIG-GUID: zhE9lwWD60lZgdQZ4hIrL_Fgt8jtdLr5
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a43d2ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=W5TR1d-vGbCmV6bVBKEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzNiBTYWx0ZWRfX6jgTCjP2hQfB
 1sADdb7wb+K8zYSBoHBhSW/Sp9fGl/UNEQmFpklP10LDtXMqNGgAbF9X/hWLyOG6TF+UJLsFqVC
 cfO6nNuFO2rCwF82tI1CcwBLmc2Q5HE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39234-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 710C16E572E

On 6/18/26 8:39 AM, Fenglin Wu wrote:
> 
> On 6/12/2026 8:27 AM, Dmitry Baryshkov wrote:
>> On Thu, Jun 11, 2026 at 12:36:43PM +0200, Konrad Dybcio wrote:
>>> On 6/9/26 3:28 AM, Fenglin Wu wrote:
>>>> On 6/8/2026 5:21 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Jun 04, 2026 at 10:02:43AM +0800, Fenglin Wu wrote:
>>>>>> On 6/2/2026 3:29 PM, Fenglin Wu wrote:
>>>>>>> On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
>>>>>>>>> Currently, the RPMH driver only allows child devices of the RPMH
>>>>>>>>> controller to issue commands, as it assumes dev->parent points to the
>>>>>>>>> RSC device.
>>>>>>>>>
>>>>>>>>> There is a possibility that certain devices which are not children of
>>>>>>>>> the RPMH controller want to send commands for special control at the
>>>>>>>>> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
>>>>>>>>> level shifter (LS) peripherals, and each LS works with a pair of PMIC
>>>>>>>>> GPIOs. The control of the LS, which is combined with the GPIO
>>>>>>>>> configuration, is handled by RPMH firmware for sharing the resource
>>>>>>>>> between different subsystems. From a hardware point of view, the LS
>>>>>>>>> functionality is tied to a pair of PMIC GPIOs, so its control is more
>>>>>>>>> suitable to be added in the pinctrl-spmi-gpio driver by adding the
>>>>>>>>> level-shifter function. However, the pinctrl-spmi-gpio device is a
>>>>>>>>> child device of the SPMI controller, not the RPMH controller.
>>>>>>>> This replicates the story of the PMIC regulators. There are two drivers,
>>>>>>>> one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
>>>>>>>> driver targeting only those paired GPIOs (and we don't even need to
>>>>>>>> represent them as a pair, it might be just one pin).
>>>>>>> Thanks for the suggestion.
>>>>>>>
>>>>>>> I agree that adding a separate, RPMh-based GPIO driver would be more
>>>>>>> straightforward from RPMh control perspective. It makes the new device
>>>>>>> as a child of the RSC device then it can naturally use the APIs for RPMh
>>>>>>> commands. The main challenge here is, we need to make the level-shifter
>>>>>>> mutually exclusive with other GPIO functions when the GPIO pairs are
>>>>>>> used in level-shifter function, which means we need to write SPMI
>>>>>>> commands to disable the associated GPIO modules. I am not sure if AOP
>>>>>>> already handles this; as far as I know, AOP only manages the
>>>>>>> BIDIR_LVL_SHIFTER module registers. Let me double check on this
>>>>>>> internally, if the GPIO modules could be controlled along
>>>>>>> with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.
>>>>>>>
>>>>>> I checked on this internally, AOP only handles BIDIR_LVL_SHIFTER module
>>>>>> registers, it doesn't disable the associated GPIO modules. Also, I still
>>>>>> have no idea how could we make the "level-shifter" function to be mutually
>>>>>> exclusive with other GPIO functions after moved it into a separate driver.
>>>>>> Do you have further suggestions?
>>>>> So, for my understanding, we still need to write SPMI registers to
>>>>> configure the pins and only then AOP can handle the level shifter?
>>>>>
>>>>> I was thinking of using gpio-reserved-ranges to prevent those GPIOs from
>>>>> being used by the normal SPMI driver.
>>>> More background: "level-shifter" module is actually an independent hardware which is not part of the GPIO module. However, they are sharing the physical pins. Which means, from PMIC chip perspective, these pins can be configured to either a GPIO function or the "level-shifter" function. So in PMIC base dtsi file, for example, pmh0101.dtsi, these pins should not be restricted in the GPIO nodes in "gpio-reserved-ranges".
>>>>
>>>> Also, we need to make the GPIO modules are disabled when the "level-shifter" is enabled, to ensure that the "level-shifter" circuitry is not impacted by the GPIO modules internal circuitry. So it is supposed to write GPIO EN_CTL register (offset 0x46) to 0 through SPMI bus when the "level-shifter" is enabled.
>>>>
>>>> That's why we have the requirement to access both RPMh and SPMI bus in the same driver.
>>> I was thinking about other ways to solve it.. maybe someting like:
>>>
>>> &pmh0101_gpios {
>>>     pmh0101_ls_pins1_2: foo-bar {
>>>         pins = "gpio1", "gpio2";
>>>         // appropriate pinctrl config
>>>     };
>>> };
>>>
>>> &rpmh_rsc {
>>>     // should this be a gpio controller? a mux provider?
>>>     // is there another class that would better suit this?
>>>     rpmh_level_shifter: rpmh-foo-bar {
>>>         pinctrl-0 = <&>;
>>>         pinctrl-names = "default";
>>>     };
>>> };
>>>
>>> // but where would it make sense to describe?
>>> // fixed-regulator or something akin to that?
>>> &some_consumer {
>>>     someclass = <&rpmh_level_shifter 1>;
>>> };
>>>
>>> i.e. the "rpmh level shifter" driver would consume a reference to the
>>> pins, configure them as necessary (just like any other pinctrl consumer)
>>> upon request
>> SGTM.
> Thanks for the suggestion, Konrad and Dmitry!
> Using the pinctrl state in the new driver to disable GPIO pairs is a good idea. I’ve been considering which class would best support the PMIC level-shifter, especially since we’re moving it to a new driver and it’s no longer restricted by the pinctrl framework. Functionally, the driver should provide following capabilities:
> 1. Enable and disable the level-shifter at runtime. Consumers, likely I2C client devices, will enable it when active and disable it when not, mainly to save power.
> 2. Allow sharing the level-shifter between multiple consumers, even across different subsystems (currently managed by AOP).
> 
> I see flaws in each of the following approaches and haven’t decided which to use:
> A. Using the mux subsystem: The level-shifter acts as a switch, so it fits the mux subsystem physically. It can be enabled/disabled via ‘mux_control_select()’ and ‘mux_control_deselect()’. However, with multiple consumers, a second call to ‘mux_control_select()’ is blocked until ‘mux_control_deselect()’ is called, so votes from multiple consumers are not allowed and can’t be aggregated.
> B. Using the GPIO/pinctrl subsystem: After moving to a new driver, the level-shifter doesn’t fit the GPIO controller or pinctrl device concept. It has only one pinmux, and each level-shifter works with two pins. Also, both GPIO and pinctrl frameworks require exclusive control, and couldn't shared between consumers.
> C. Using the regulator framework: The level-shifter is controlled via the RPMh XOB resource at the AOP side, which was adopted from the idea of power rails sharing between subsystems. The regulator framework’s APIs and reference counting fit the requirements for sharing between multiple consumers. The problem is, the level-shifter isn’t a power rail so it is conceptually not a regulator.

(keeping all the context above)

+Mark, would you accept not-quite-a-regulator driver?

Otherwise, I don't really have a good idea either, perhaps the mux
maintainers could be open to adding refcounting for 'shared muxes'

Konrad
> 
> Please let me know your thoughts. If there isn’t a suitable approach for supporting the PMIC level-shifter right now, I’ll stop chasing on this until there is a better idea.
> 
> Thanks
> 
> 
>>> Konrad

