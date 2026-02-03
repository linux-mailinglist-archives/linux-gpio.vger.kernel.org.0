Return-Path: <linux-gpio+bounces-31385-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI13Ba/mgWl0LwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31385-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 13:14:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A089D8DD6
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 13:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C90B1303A5DD
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 12:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528B233DEC9;
	Tue,  3 Feb 2026 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVMwo7JK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YL6/xAEa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE06233D6CD
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120562; cv=none; b=N+oYGMZruUbC+ACU8Rjzk/MSG2KRjbmfjqmbxxweSeHaSU6qPCbw/m5IvePqjp6du7neKt2MWD3lnRAEa6GR3sSFCDui/JMyio89quWU38AP5O7vl39MhU026Tl8bPBlFn9yy31orfPwW7A8Ax6tsty6DQ5aGdQGjZI7TVbLB7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120562; c=relaxed/simple;
	bh=LhX4W4966WbA5RsY6vvGNAKLc5ZklFBLRf+iIcs0fLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZgL8QDA46Uf1lenLjUXojcrYium91r/c2/7uJb7wlUKuoF07Pa+Yycu6DlUVvl4NRteVpp0I9c3D2XrLHT8UJGpYoTSK8zYTElJ1UwBLbJ7YJHTjrTAn15CfHriUoMOm+Lh2xZxSd8vU/0PgwpwxpWaz752BAxrJtGdItSmDY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVMwo7JK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YL6/xAEa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137PHdq1319475
	for <linux-gpio@vger.kernel.org>; Tue, 3 Feb 2026 12:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPoB5vfU+XGoctzE9w6IbSeTVRMHd7Q6eL3ax+WmBsM=; b=UVMwo7JKrp0aSnNN
	MzC2V3Hmrn578A+I4RYHamWF/NMEGQ/mq+YgWorxlsvVa4nyNC34yODoazIpGE/D
	l/uScc8h0Z+z03Jb8FfyWWHYXoX0iHbUMjJRBksxjeKqLkzoMHHmpnEUoxD/jBJr
	cpTYWe48Ax5Xfz+FkvNxaAtBg/UrCEsJNJSA3die0nfn01Ve5TLbD9uKhLTfy3UT
	KKHSFYa8Dkomk+vWB6WzdFI4jUsxRYXHGaRwGMWZ8LhycRdfwal/ebDJ37WddCgq
	Jl9bur7MaXtwQmfzqKahXvqqI4uksSam3v9bpGfPan610lrDDQoq8C7iAZV9o9OQ
	ElB+4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3cm70un0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 12:09:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c536c9d2f7so160449885a.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 04:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770120559; x=1770725359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPoB5vfU+XGoctzE9w6IbSeTVRMHd7Q6eL3ax+WmBsM=;
        b=YL6/xAEahDazUv6MUYDt9id15vAv0h9hkg2jpyDMdsFaI/mOBC+JM6f/DLDAnqBkX+
         CJcLVzHueWPOJfUZVK0WG9E2Cz0M4926hgoAryK9UuvgiTKQsJFosztpnYT59+eGxMgm
         4Oc9UfNOt+2vO4b/ed8Vyp07MtNo80Ao2ltgnpALrQigmmkdVwKcN5r47WvHq6ov2M/i
         ze6TVRGhNOyjc95m6V3HtvaTZ2/TynPv5OtB4kqPsjkvYHVQ+ut1zXf2IQIL1piyc5LM
         krtuqVpqHW/aZT7DcT7xCXvR26QPEUmwjX5Y2n9HeNtQMBANKT9dBJYMG59PcCj+SZAa
         likA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770120559; x=1770725359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPoB5vfU+XGoctzE9w6IbSeTVRMHd7Q6eL3ax+WmBsM=;
        b=XBTb4T87hMyEp7BRXOOcFE/o331jW8u3KK/nEM8Av3lA6aVuz1amdep+royCe7tgPH
         AWvaFz1DOp1lgl+W/FMFOF1JIjWdnTkAg46En2pmh4XDrRlBFt4tus88KjM0Fd7nYvbZ
         zH9yBU1oI8xLEh+2e2aciMNs/WXomBcxVAbbzjzOU7rmktlB8gal/Yvy8OTnZ63ibtBX
         uTx7EcPOk6Lw0hEGxNMuNISkqs+0MXwJjv6CmuRNxOBmqBZhro9F/5DagKQ5lOPzs8+c
         jQaLEwWVA7ZG2hfjhBuuEYaUyuyYCCE/i37fUE5sYenUO71UH48/0UIt1J7cADp3stmx
         YlkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ74dHyytQPrQ3G1mfBiRDmWyMm9rPfEywa5fJYS3QvPcjDrxWL1OHM2H2bHy0vN2/wDtXQEeXglfs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/M0e4yyLd84DfHUmDoHz8LsUSXo7EopWVPWx7TGZJv7zAz1N
	cyw9wwGYR8M+8ULSO+Hrm5W2gQBCjVuTCypwRgigmHGQlpQ8UemmBrV9jcuCbcpHL6Z9g5T7aIl
	5A/hyS8IhbSGSwgwg8BnQVYcyFgmrgfDHLG20lBKR/HVy/7DhkD4d8NenZ4D9CUR2
X-Gm-Gg: AZuq6aKpRFJLgAoEv2JcKpmQWPSdhVH6Bfrj8wrb2OgtndYiN2O4hRWf0e2YaP4dH+Z
	9KSxfrwc62rG18ewV9y6voCEag96jkFdJT+RS5+IoC98npjgfKvVpq+InGtK9Pl1O0VGGzlW1OF
	Wn9vrZvOaIw10kmofn6hCfjqV5rnLtsOHsUs02jviv8zLu94bJsiLVxAZInNMC5O73BVosHvD2w
	yCr3cIqI4Ohn5ywZ4cQEPeYzp2BsxILsqVx6dBnfzV6yGzkLHy8URUhaDcZ2G4Jc4rMqT2ZMzS8
	MSPOiTXYVVBXNM/Bmse9UkJsfxZuS+/aaMSGpQFCQF6XjKVet6eBXicjwTFvPsuDceTh3O03lEj
	6T9BC66I/1/PUAqCthRxEK+2WeoQLqjJ5Tpti34RBEeEkPYEkq3vcuR/3i+k3xW70cEY=
X-Received: by 2002:a05:620a:bd6:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c9eb34ff20mr1529517885a.11.1770120559095;
        Tue, 03 Feb 2026 04:09:19 -0800 (PST)
X-Received: by 2002:a05:620a:bd6:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c9eb34ff20mr1529515085a.11.1770120558684;
        Tue, 03 Feb 2026 04:09:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-659390c08ddsm751708a12.11.2026.02.03.04.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:09:18 -0800 (PST)
Message-ID: <006f6c19-d923-47c8-9890-c7431c8c1e77@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:09:13 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] Fix TCSR representation on SM8750
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das
 <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, stable+noautosel@kernel.org
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202181917.imo5lk3smwott2ue@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202181917.imo5lk3smwott2ue@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5NiBTYWx0ZWRfX94NieitGAdN7
 nQ3rqv+nqZueV3MkdXG9vE1cVHcOWFvSqENG1Sx8Euz5+eCz50ujj2yei41JlxzxDmGp7FQgLEi
 BpRWxInhqarD9Wb5QvQ49v6Te9aXPAIf6I3wGFq8vZGt8My+cI4B2t7El4MTGkrw2RsxPn9uE0k
 G9CfyDOe/gn2LwjgexrijnHd1C9v7i5lEbDnomEE94HOTmouGCkJ+zaqGfiFFlPsiozBBqWZydH
 Flv6trvdnZk06EFlKCL9z1++MherIPILGjYDKV4snFx3kGWR9j1vwx2RtZzMNPRGc5bPAE27V+r
 SA0ePbFr+XVVDY/fWfrCjAUQVjStfFQY1y7fP0uhLConKYfP8XfAAaEvxsWuK5MAwQuk7vMO6nD
 3N6Jm/CCFOMmGF25pOyAmRkwWG/qEY/5xpMdIIBmnP0G2UQsiV43o1MsQuqHG9ccG4UcPRneTLN
 5/UxmLDUCN5PZXp8osw==
X-Proofpoint-ORIG-GUID: GTpKC8A7n8cDuzsWmUo8EBKyQ2VW_BCP
X-Authority-Analysis: v=2.4 cv=L4sQguT8 c=1 sm=1 tr=0 ts=6981e56f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mv6jPIj4YeSnJgRhVR4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GTpKC8A7n8cDuzsWmUo8EBKyQ2VW_BCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31385-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt,noautosel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A089D8DD6
X-Rspamd-Action: no action

On 2/2/26 7:19 PM, Mukesh Ojha wrote:
> On Mon, Feb 02, 2026 at 03:57:32PM +0100, Konrad Dybcio wrote:
>> As sparked by this thread:
>> <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
>>
>> The current representation of TCSR is wrong.
>>
>> On platforms post and including SM8550, the TCSR had a sub-block in it,
>> containing gate clocks used for distributing the XO output to various
>> consumers. This is what we refer to as TCSR_CC upstream.
>>
>> SM8750 however, is notably different. That same set of tunables had
>> been moved to the TLMM register space. This is made worse, as the
>> sm8750-tcsrcc driver consumes the qcom,sm8750-tcsr compatible.
>>
>> This hardware change had been undone with the generation following
>> 8750.
>>
>> This series attempts to unwind that. It's difficult to merge, both for
>> bindings and functional reasons..
>>
>> I think it goes without saying this breaks backwards compatibility, but
>> it has to be done to represent TCSR at all. The patches are ordered in
>> a least-destructive order..
>>
>> I gave this a quick spin on (remote) hw, the UFS (one of the consumers)
>> still works, but more testing would be greatly appreciated.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Thanks Konrad for taking this forward, while I was also working on your
> suggestion to make tlmm a clock provider.

I was under the impression you abandoned that patch, but indeed I
should have asked first. My intention wasn't to beat you to it, but
to unblock it. Please accept my apologies.

Konrad

