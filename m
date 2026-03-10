Return-Path: <linux-gpio+bounces-32989-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCUWCBshsGmCgAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32989-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:48:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC10250CE1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DFEF931B7AA4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DB33B47E8;
	Tue, 10 Mar 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLB7o+QS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ejcu0kIf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB383B27DF
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145713; cv=none; b=M+GRKvjNp85jH2XsNNzYS2by3RVbDMOxJy7VKe4NdJNp514nenx28YG38QcB0mLxkpYAX97FymRnmVz3tQnRKZxK0w+u7x2M2DsAJmkIWxJZVtOtKnfNYkxP8MFwoFWiKArDDce1qcZhKsI+05x7a8sO7bEA+f89hHMgyn9tfz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145713; c=relaxed/simple;
	bh=W8K8DT9RRhwKV1rFdpcjXSpr21vlkIa4gpW5h3LPOBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dv6VwiWlDxAtDsrQrNBTKs3LjcgpKu16HA6eRx3bgs2BRTVemnXeDq5+DJgmnqkTFvGyTxXeIahyIq8y4CP4FGHb9uutiLw8SipxgzlUvL9mhjdGbaeymSo6r6j1K2TXj6R1mRAK9UsFu7yq2gWkw3oMP78Y28Y+J9Di+u8msYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLB7o+QS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ejcu0kIf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h0uj2753873
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 12:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fbj26tjaW0oauXAAKR/Dz/Bgp18J/CRra/i+8EEiKQA=; b=DLB7o+QS8r4JskxZ
	92z7o9VwiRdqJpa2StsgudD7PDbNrzTACFhbBaaLaRsc3uZZp+tI6aZyVShL2EW5
	LnnbG7PSlk4ROE/2UTEgT3rKiM8Q4/apsvwiXjxrVjGduINvyjtZJEE214vWw0eh
	zd1UbQTyuBlyRcjM4ZFFEiEzDpNexdQsGCfRrJPlpuwMcnxFwrrwknpPu7gJVfwT
	tz59E9jJWLQCVLtFz3cPjWHNPTzF4q3YvyykTgEGxXW94WCp4OiOVfiTCpH0/inA
	U7W5EbfkeYaIUU7ELmFe6rWbqBAJOQZEjRGWXAiEDcwcDJhCWdu9w0HRt/w1dwRs
	OeJklw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mrubc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 12:28:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd93c91075so64091685a.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145709; x=1773750509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fbj26tjaW0oauXAAKR/Dz/Bgp18J/CRra/i+8EEiKQA=;
        b=Ejcu0kIf7/9MjkgpsbTB3OeqS899qg24stHlkynheh2JpzrvGhg+BGFZO1xmbPcTGI
         wyoFz4YjCUHGvWWfiPC89pLeO+haRZkg2zRq3YyIuNhyt8ju+x3oP/YhzK3/XPYnxkz/
         PA2MlAWY7FfftEvgzWzTx+BfDSRmwG+IHq9xuGzmpA4js7KNqY4zOZLAqSjOv9gCRm4W
         Dx7I59KnB/an6gjGrrBMlwGyG8THn8bTB5qiexgT2AJRpsfZlrY8mlaEb4AaSHACntkx
         KU5NaQdkwS32lySJfhTObdZj+EsIits/so/P052iib/CP+7Bs8t+3xSfC6JsUmayFFu+
         BARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145709; x=1773750509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fbj26tjaW0oauXAAKR/Dz/Bgp18J/CRra/i+8EEiKQA=;
        b=l5n55tCIjptbLuMfh8WT7oGjDK8zmW7Bb5GU1UelY7h43YYdIJXVFx+b4nJVF5YkZq
         4zSmJYe5aj0rLF0hMBaG5iJ+4BFpIj56IY9uy5rLqt35SQZYTLgQqrNt3DOe88naa98v
         3tAc8VPJIsNXE/9LOlQ8nuLli1ucfRF8e1bJkLUIb6BYSzMLdhYup0h7MAjjwxmPUZij
         NQmfnCVra6KBo8FP0RMdP66zPrX/JVLmQnC6fB7mLfbKI+FsX1Ym5Lg0m6CR0VK6M6uM
         LugZuMeybaavXal0gSFp+8o0fXWek6mUZc8nZNM6SnX4YT1LD7B1K6UcasjmC4p/FdS/
         yDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvTTDU75iAj4sYHtMH7dTz5xR5s26DtTh/2kxMcXb+k9Sj7mfEBOcgVemWijpNPQFQtHBQFhDej+i8@vger.kernel.org
X-Gm-Message-State: AOJu0YwFAq/yvc2LaS0l53vhU7duzsC8QYOF7PabtGexkl3uvCAYyspI
	pXKDTiF1tiUIqOFAvBz0qPfIcLtGkzCSRJyoSPok4zOTiUJMWxEuD+nk61ieRcxQuYhefylR1DL
	vkfYfTGfgi548Vr+ZaUxZ71tg+NdoCkCxozyEjB35O1UTCApbOYElENqJ8samw+Ym
X-Gm-Gg: ATEYQzzHcPDYrdJ1z/Sws0Q9tecyBEk1oWSNo3R09lVnSUBVWo38fdmsxIRHQ2PYqcf
	lA10dPHfpocO1Hpf7XLuV9aUaE3uHQihCNkWdOan7o8uAO3TZMOqpTzBIEuXHetmWBFLCh4zL7p
	QjxkGcOfzE9zyjlVz/L4h5WYN9VtpxPfVOgNSuKSwTyGBfgJERzvh4hPPRonmp7akeoqNBvJimN
	oOukXECpB48gg7Upq+OdW9Y2wH/m5cO6PQcksBdGrnzeclwyRR8SA36RywwhbJgVJ0RYZwel/T8
	r1lT7f785ni4x1dbU1/2FplHvnCMve947QYKyDm2kj1F4KY/GtTQ0tvoPzGyU1+sE6+ClEJ8t5A
	jljatd4y9MXvYWJ8eHmekxfq0lZyeFRVo7NHT5mSzFBF1TgqVQg4S33YaYGDGSvOhKjN8UGHeCd
	g4F+k=
X-Received: by 2002:a05:620a:1a17:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cd6d43bc63mr1485246585a.6.1773145709195;
        Tue, 10 Mar 2026 05:28:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cd6d43bc63mr1485242385a.6.1773145708729;
        Tue, 10 Mar 2026 05:28:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f18b009sm477024266b.59.2026.03.10.05.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:28:27 -0700 (PDT)
Message-ID: <d9a1f44f-6e0c-406c-9e88-471f197e0490@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:28:25 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos: Add LPASS LPI pinctrl node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
 <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b00e6d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=B07o7Mun2X3wBQy5X0wA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: J4GMfR4ud0Vu65IJ7OtGCDwjXCP1i6qn
X-Proofpoint-GUID: J4GMfR4ud0Vu65IJ7OtGCDwjXCP1i6qn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfXwjn7TIYTJ/fy
 5edRNJTTlQf4bBNM6Trvg5DjDrv8R16/kv+kdppcFQ+r5MXJYoCxompBmVpM6KyA/5eUPD49A8D
 GuONxBRoG6q83i/Qua62b2bXM+nKlwUZjXnzn06NFO9/kvLm3JFQmyKjg/dLcldROEUBjBsTLaP
 9d0Ov9e9si+i0kBtBicljj+rndVEAavX6hyqq1hHJui5AJxzRWrMpXZ2xr4zUaMvOBs7SUGUKp3
 vqNN04aOQjTt0Muilxja0narOh0+ZBSclkGfBQzYqZMBUb3RX7RY6v7wftZiaefGIbGweGZ5mUm
 zs8LafGEobbnhrZv8mfoECBtf1NAAA/2VV8H6IP1j3NBoEsOHaCEzbjf2tDZN4kwQ4SHSB6r679
 rj9mhi1zUSDwlfqXgXSG55bVtChblQaUB4W18baOViiojOZddSnFUNh77nK5N3XXqXl0S/hMPu7
 cVoX/wKVDMM57bGIrLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100108
X-Rspamd-Queue-Id: CDC10250CE1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32989-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 3:22 PM, Luca Weiss wrote:
> Add a node for the LPASS LPI pinctrl found on the Milos SoC and define a
> few pinctrl states that will be used in the future.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

