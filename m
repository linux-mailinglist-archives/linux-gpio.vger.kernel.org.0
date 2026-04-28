Return-Path: <linux-gpio+bounces-35722-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LDIOuPi8GmoagEAu9opvQ
	(envelope-from <linux-gpio+bounces-35722-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:40:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E35489270
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A21393074AD7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9D8301485;
	Tue, 28 Apr 2026 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pf221uyL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDb1nbNd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41232D5432
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393731; cv=none; b=aUEu1KBlNGvyP0IAcpTfoQaotmoQOoGeR7YsCJ8c4/ZbmSLxtq34Mku0Y13xANKmB7FB+UlEdLc09rs6C3Dd9K9zZj9hc0INiPv2mDOruqdNq/Dmivmt8eCOQgP1YTOQEN+HYiSBvU51L2P58ZBu3Ca+N9jIKmzzQhplzR9n8gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393731; c=relaxed/simple;
	bh=vHbVwyyhzL+WIyz6Ayj1Q0HvdUZKYPVlvgRmiUjHIQY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UhR8qcdlNxmPRUCjd6SRIKT1qlXC617D7eQHFJlENfJa7tnSbFAT1nUJw3KDQHHwjAOek3P1WzuxoVGJmN414zxZvRzysO+E3pAAJyL07z7+8qH3V8DELtni0BvqGwJUzs/9imxotp0jipC0wMUpvdoxr1948YZEUOZH2cgahZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pf221uyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDb1nbNd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsQLv2946242
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 16:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTBXlzBBZlWSoHCmYvGZWSDv4F6oGnlfamm92+5TKeo=; b=Pf221uyLuPZpK6ep
	vGBz5U6reqNt6L54wSiRPN1rdkNdb6bzGCdMtrgoSNFnxOaBTZUKTkHhiblECSv0
	q7QklORkJ3xXbhoRVJzmKjQOuOUeqcs8GRE0SG7bQlrRRoug3zEiGfWtaXu84Eqb
	KfcZ2EElAZ1CBtp0FKCeudPh0Q3aAKSokoSdpTVEVdQsnPpWyITwxVy1pG7wQXpp
	fGu08dCQSbIuTZkc6yr++OLQtV6ADp+oqVRfAbUhhX+9Aa4jiIGMPGTTpKNE5hJO
	DxJ+z0CSK12No5nU0t8agAKmBvmbFwxFrokDOxUTEHIqO6mZAW9aKrGm5lw9PJmf
	GBRzjw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhajumj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 16:28:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ead5ab474bso1824354585a.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777393728; x=1777998528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oTBXlzBBZlWSoHCmYvGZWSDv4F6oGnlfamm92+5TKeo=;
        b=XDb1nbNds9Kk/8dmhj15NFyrj2b8GtAu1oVmjFNTzJdKDOUSCJsgyyuw/9tnnNvCa/
         LhviCP3LrPxlIuB7EoPPdsumq4ilSZCpdsvy35acgjEazSHyMqATY8p51orwv3ODYWLd
         CAbwuPNAMgrUkvyH8nWDo7cpxSi7YuoEZI3a71a0/GIrtRt83fsLOz2ZNL23xBXwjFoJ
         xJ7JsCdn+Otz8YJsR9m8Jmyvxqyz2ivJe1fa3XNgZeXl3NejGHuu0Y74b36cP9ixgTzd
         2AEHiaDIIi/pBZduj7J4YPGsZNqX5E5db8ZnJn7IJszIQGadk00d+dLYMgFk5yBfMj7x
         U2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777393728; x=1777998528;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTBXlzBBZlWSoHCmYvGZWSDv4F6oGnlfamm92+5TKeo=;
        b=GHaKDjEzjl2RvYdvxzdmXBnYRoLmRxRrWVDZMNdZZFci41w8MtFW6rpUZC8yfNALcj
         ncLlfNBxCHVRLbAk4S61dABWK3YspbozbUz/GchSYBdTGlKLBimzvX/MpOmnc73Qo6Ou
         9LACd0mPRTdJhRWJV4s4SJ0bskBtv/FsUp/krlMzp9lnjrgduJrhDgttidmPgAcGM0+2
         4/xsM5TaNq4sXwv4HxlLM7qdlbKAhG0yOydjzKAUw7GlAr6nU+2XwJrOBjfEz44FQupI
         mEXnhFHhP1EqK6JqjBihbP7aca8TwXH9Qc8oQD95gMoTlj8Xhym4zSpNiKswOatXqS3J
         jtvg==
X-Forwarded-Encrypted: i=1; AFNElJ++xk6dL+tDkSDMXbgc9IKxcBdNXgXkg+uuw46ExpdH3GktnsZWj72A2A6Rmcgcq9LQPtFAwNKheS/j@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59/4hXer9phureincYwVmXqyzwyvhmyjM7h935md592BtG/zy
	CNzCfzh3Wj3EDcJ/+sfv0FAGlQ2al58aWDH57oha0Nfs2/hUsu2Uran7BcEzGLjuN5R4Bgtzn3h
	VMf0kZIhjhMAS652FurTlN2qoRo6lFI+um2SQshCXkoj7TTQUxvlC1v7KflQQjPvG
X-Gm-Gg: AeBDieuDWBEe1jt82w4EEN+5tBqGOYNGLLAaJGOShgVw0xGNSHQL1MgfwwflMvatBO5
	MzeG4rLXBkH1GjpcmzPLvPeTA7Sa5/Q9/2YUW4BWx/PTIns47aCr2wxgQ6OdK16i8TpvkbKnOqJ
	1oKCOEcRCwH7Br55DCt0a/CDIxklDP7UOL57omiSijSOcD+lWJloAuHzO6Lg1nofwlCdzjgzmP2
	T+GsuhceTF9HNXshTHEIZ/oQm+BjCQi71zFic+u+wkoZ9I1+ERRmnukNg4H8uO48WxjL5KpxU4Z
	OJIZq/tGLXUS6AV1UmeCEi6pipEmt32Um9SlEhUckBRc/dqX3C+m74I76hd0XmZ4Cpl1s5z+t8i
	rHa2ItKGSOwhq8Vqt6YxcZcU5mC6FKC/qrL+lowLem70VMgSgj9GyG4f0pbg=
X-Received: by 2002:a05:620a:1a1e:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8f7d9207991mr522153485a.39.1777393728286;
        Tue, 28 Apr 2026 09:28:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1e:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8f7d9207991mr522147985a.39.1777393727761;
        Tue, 28 Apr 2026 09:28:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c7dcf4f6sm234844885a.28.2026.04.28.09.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:28:47 -0700 (PDT)
Message-ID: <e5e60e25-9edb-4b1f-811a-ce719ea89ed6@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 18:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
 <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1OCBTYWx0ZWRfXwJrSE2mW4M9f
 HM2zYMbYVEx00CH128l7u3vNbgNvOnULRZ5FivdiL1LN1J2bcrmiKK2ZzVbVGKB5SiUPS6vMjDE
 jhF7eZbr+XZZHFiGsPobURcxzhbJRQsMx+960WTrWGNLR/wkbvaNb7w8BiMN8ZBtE8D2Ftl0MGc
 QdLrJSbc8mvtXqIgzkTGx2iSD5xhr9WTukXP/62zLT1MHWWbVXzTQGMjKJQ37mWpqV9b9+BIrT8
 DJ8OHXzFQ+PrckmrzY5OVg5pn1EVnZHwzRQNnzzaQ5qWbZPz/oCGpjauosD3mc0qYbQrzVjObrL
 yG+8Nb1gs50mWpeJW12k3mdRgCARnUti+J+X2WURrxB3mW1Ua5odE9eTA9+k24ng/PY8Ci7NBbL
 JRhEfEg5rfEIcBlXSyDZmJyOeamEAiLchhk0rxhv/SkKyNz+/xAEzG1p+0AYzRV5YCtVUVGALf6
 L8qcOJtO7khmg7aAoEg==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f0e041 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=2BwYiXoGMfxsfh9iLqoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rWfCyiy2jJ_RInnNi3W6xs9M4mzIbHWH
X-Proofpoint-ORIG-GUID: rWfCyiy2jJ_RInnNi3W6xs9M4mzIbHWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280158
X-Rspamd-Queue-Id: 84E35489270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35722-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

On 28/04/2026 14:06, Krzysztof Kozlowski wrote:
> On 27/04/2026 22:18, Linus Walleij wrote:
>>>
>>> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>>>    platforms, which are already enabled on qcom_defconfig.
>>>
>>> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>>>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>>>    time and feels logical, because if one selects ARCH_QCOM then
>>>    probably by default wants to build test it entirely.  Kernels with
>>>    COMPILE_TEST are not supposed to be used for booting.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> Way better like this.
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> I think this should rather go through your tree, because new drivers are
> coming and some other changes from me might be touching similar lines.
> Well, defconfig also might be changed in parallel, so obviously someone
> will need to handle conflicts.

I'll rebase on recent patches you applied.

Best regards,
Krzysztof

