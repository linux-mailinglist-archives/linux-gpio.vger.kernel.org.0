Return-Path: <linux-gpio+bounces-33487-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLrvAWvPt2mDVgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33487-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:37:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D73297212
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8939F3056D95
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EE338A285;
	Mon, 16 Mar 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/PkFDeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwLA5rgc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744C9347539
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653707; cv=none; b=K3EHAFa85KDnDvbpf4plsOHrt3sUzeYhDv0BPlWpJhNzD+Bxl+QNvTFyn0EF7e6E9R8dSLfPCeq+KldR0fAdf0xkpPCzTRXyaiuxA76IMiqYA949qZSSlPLvZoDa15B9PiiCZZlAbXqZye3EDAbsnbR1GkHbJ44wvp60egW1d4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653707; c=relaxed/simple;
	bh=4r2iMJNnjHizHuoua26v+38XXw7c1p7R6XSQ8WsVbGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dU1wZ3L+yBYB6/jMQlma2U1lgN6N6z+y8fcFbnS8w+VvWN2t10Wsv7EsZYBqzaXN4Kv3Q1qTAIg83oVi23ET/QxtFxCBNanGSwqaUOW2WqGTG5KCj2Rnt/SYKhmbMfFDXmRQOJhz1v2ruSGfihRtOsM9x6O2PEIE5C9SAEPlvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/PkFDeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwLA5rgc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gXM323604
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1B/hBs9jqGXN0SatIrrTFMFGQGJmlKhZrWp6PbywrY8=; b=U/PkFDeBlrTsKB4C
	6YsBXWqQLQNNKucxb4AjteIqyUsG8InibHHx6ZMbPsEHm3s1HGtUDQt2fukXAI/i
	V9XJXMqCRWxJ9/furxhpWWH0hrEWX1uv6n35rKXt93ceeX7jR+O2MfoivZoWdbe3
	Mktc3TXJHl6eUHdW06qqkfjP5NITEW3AznvFj1vCT0mBJhEauqWHJeVL1v2zf+5R
	848vXObuf59Ise8YjfczNFrguqYdJ/D7ge3dHodfA8iPDDUJ+Rsn+GczS/rWdrMj
	Chr3Jv0eRUZ+jQ8WyKf2NXAknettViT57x748EZ88KUQoriLMGMwBqhlQlua4dpL
	u7JHow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qn56n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:35:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8ea43d4eso216200585a.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653705; x=1774258505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1B/hBs9jqGXN0SatIrrTFMFGQGJmlKhZrWp6PbywrY8=;
        b=HwLA5rgck+WARMxmqfoRwWXl9Gen7H4HE04DVLYowkM7x2oc523cLwk5IXj/Qac5T3
         L3mhs3a1s+SNzY2LnxkTaX0o0mA7Q97LUJT4Io1B/NnOZFxtBLRz40vHB1bu206aqzB+
         Aij55WrfAOZLWYkNX1/k+/+28WH8NTDzojAhKV9GkEVEPzAtWTYhSaz1yvaICrBOHIlw
         lkJSWe42EOIWJYDvimXi4DvwZ3ElXw8foJUzEBTcMNKSs18zorsbKzcQYDdu8xfr0sG+
         4HekIYE8ZxQpaS1zPqQvW1Bh8dYGDp0gAs/nEj8+mcRdIOoN/Sghfhh210CO5oVU5liO
         Cqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653705; x=1774258505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1B/hBs9jqGXN0SatIrrTFMFGQGJmlKhZrWp6PbywrY8=;
        b=sQta5+rUpDTrke050u/TlJM0VxwN6LAy5YR2yXgU5ikK5jL4XbprXlDwEwW/wcGZvc
         T7Ko3x5kcypi9TCtIYCxB9vXW3eD9eCBHUuubRMdIVlTzQlcWyYm+QyKY9cb95dilUb3
         JBMfynT3KRaPrUI2MUhCxK+/T25ZIKO7KKrLOifgXpfmImhVW+hpN8v7qf156IB39HDo
         9SKchkkPVLRYwZ+avOAVAyNDkwbj97X/RtD7DVcvWCh+RJ6cZWSL+ZtuK8vRkXNpFCfd
         Gi/So6uKFF+D6BXQJkd5fOJ2QUpnQ09jvPqYElLjBOW2DRTvu2sn5A5EMZQfm+OqEfo+
         fBTA==
X-Forwarded-Encrypted: i=1; AJvYcCVeRzydwQQa5ihiy++zJDW+3jixjp1oxTxrkuOMGDgtORO5wfXh3sImQJE8AC24bosdtSwu+5wzDHRK@vger.kernel.org
X-Gm-Message-State: AOJu0YzPZuWbIUjFrr/wWPY5YDTYna/pLnBIoulIxKSSyRRGCf3rb9ND
	ZngHdy/kYZ0ebXAp8W7ghvAC1bPGJbyKE9aAsy0gYmrIbjGEi8LhoegFqPAP8g89l5IIh9vG3B7
	c8OZYtGPM7KNHGkE+8YCQ5TfpAYjgOMaemy8K3Oax9ESVWzh73MzN4kAToe84x9JG
X-Gm-Gg: ATEYQzyqGvuJHMrH6sBONQrujnUGMHHnUypuLZN9iXlvhQ0bnERFsHLCvLgmKoi4Va1
	wiTd66SFiGMfuCI9O8IUJjVHc6A8gpz70zqh3/VMYC8L7SdIVTZgpmprZyulaJbVSSXgwdYZema
	Hwm1JwdmixSo4NX62sIs10Xn5qaSmop+KAzdRTjZAeMiCd8TG2pWgsYpQJK4x5Ufm7JGS+SA3AK
	1+xm12FUYnMXLbbx72nFLYAu+PFuzMv8BmCy7UenECQL4M/g029cQpWir//sYxLCEFYp7/P7stI
	uQG2IGeUYQLdeYdcHhzig4Py8rciN+vajKeQX2XWCsunONHPdvsvWSRuYAdN1BZP1eNAaUFiA//
	VBoFn1vftCwCRGFhJ7oVabpvc0HR4sZOYqKH7ig24kil+qv5hqQ/vWY3/wYmzK4aBus5NCvcqZw
	Ki0UU=
X-Received: by 2002:a05:620a:290e:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cdb5b7617bmr1232412685a.7.1773653704567;
        Mon, 16 Mar 2026 02:35:04 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cdb5b7617bmr1232407785a.7.1773653703814;
        Mon, 16 Mar 2026 02:35:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97cb0d2df2sm45121166b.54.2026.03.16.02.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:35:02 -0700 (PDT)
Message-ID: <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:34:59 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
 <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com>
 <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HEkVWSAfihxXdsLVUXr99HwnF0F08LcV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX8lXebiNu2c/k
 eDg3DXiF8of4rqaDW0dxMrUWRKySftbOvBixbFt71xu9A6M83I9ExsYabfMLjbTRAwCbbnLa5lN
 UQzz15OXfAByPrjQl2Ne5iGPzQpQO0DzV5WxxtpvEuxT6rSsc+JMt+PAPkoXUOlHYE46kiTg7W0
 Cb1hX78W/ZSSoGQueAm61e7A9RNHrXrKZxnsrW+Vp88hUV6WFxVKIJw7R5j8PHs1lEFvjQFTBwC
 FutgFYo/kAy8YzpCri/94gbxjuIDIc72vHzWQFLi+FCN2W+lJREfo89UElbZ0/XdAvI4mIEPRAl
 31tqVJkBo/9iQqdrQBApU3RiOW6SLPasATYn5x1WTl+YITDAG5894OTq7QKkY3qjxpaNXtRHcUW
 hzTAuTCxTGLO2gXTC+m8ckCSUv/FZ0mkZfnoaZKB0Caz3Y5oCBaSBzSd3RzPWm9TIaJSkqILv3E
 Tq1ZG7ztRSKx+tNecHw==
X-Proofpoint-ORIG-GUID: HEkVWSAfihxXdsLVUXr99HwnF0F08LcV
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7cec9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4Zt3pBCKRviRSeEyxVwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160073
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33487-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69D73297212
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 10:03 AM, Kathiravan Thirumoorthy wrote:
> 
> On 3/13/2026 6:18 PM, Konrad Dybcio wrote:
>> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
>>> rdp504 board.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---

[...]

>>> +    firmware {
>>> +        optee {
>>> +            compatible = "linaro,optee-tz";
>>> +            method = "smc";
>>> +        };
>>> +
>>> +        scm {
>>> +            compatible = "qcom,scm-ipq5210", "qcom,scm";
>>> +        };
>> OP-TEE *and* SCM? What does the former do?
> 
> For OP-TEE, we have use cases like getting the random numbers, remoteproc PAS and few others.
> 
> For SCM, setting the download mode is one typical example where OP-TEE doesn't come into picture.
> 
> Please let me know if this helps.

I think it does, but it's odd that OPTEE wouldn't handle both

fwiw +Sumit is poking at OSS firmware for other platforms and may be
interested

Konrad

