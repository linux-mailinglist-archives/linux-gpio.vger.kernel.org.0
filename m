Return-Path: <linux-gpio+bounces-39032-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u7Q5EDJ4Pmq8GgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39032-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:01:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 354006CD42F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:01:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lkw+zE3N;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="cqQj24/A";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39032-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39032-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B635303A507
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 12:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4F23EBF01;
	Fri, 26 Jun 2026 12:58:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD9C3EFFC8
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 12:58:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478702; cv=none; b=BkigEHt4+ifTDKfX+NcE6PBJ+6mvQYzI2Ywlzs5U9fx6yvqaHq5UYtXs6kq1s91QVKis1xZnItdIOengLsGq6egSN7JwEiw1Hgm3nLtkCdNPdDAFZZNB79LFqtEJOSP5yJXn3xv9Zxqa9ko1EfOS4Mtkeb5aM5PvojXnDI4+edc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478702; c=relaxed/simple;
	bh=5PW6BwHeAxYBEfJx8kSjwf1f5+lzJMWTv9q7N43C06A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtWLfkrSEgxJ0kROLTLIbRYOcYSPNbw8DJFwNIY18uH3X7lmE5ixM8G2EHwCbDzeZ3p+VDjJd0iERH/CWTaMi3cleh7QjE2QwdRPDOE6HEPKgqV5wVsYszxB1QEpJNvUewoyPc5ntJcJy46FsSvvd6NMm5Lq73yrkMGMgWo6dy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lkw+zE3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqQj24/A; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAe8oh607340
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 12:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7IBvZXi/bL+thCx9o8SezriI/qgo6tue162S1kt6Iw=; b=Lkw+zE3NZnCpTXqX
	OhZNMEbBZ4SCdAABSKx7bW1g8bQxwiZUhlxbJHwfAOq8ZLodVD+nS9n/KonEOaFY
	7syxSulZygsCndF0BiTLMx6G1Em4xDuludbeyBv+t2a52ak+v4MZsW7mHaxbZVG2
	mWBFDCfMajijcVQZkSQHm5WZLTpWRPKGir1Hm+WdkbXNoYWklJVPeiXyWxb5Q/uP
	xrLJh6ar6v9imSg2jr3ROV/ThufEIAB2T1mEDM+nnfcYpd77YK4U//C0yWVV/m2g
	HbcStWQf5HnzncMO7uDofBwaLtBs53uEj3vdyCA2cMmoqXV/kkAn3dKMmkkMPI49
	pn5rhQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asjbht4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 12:58:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8dde1c4da4bso21006436d6.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782478700; x=1783083500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7IBvZXi/bL+thCx9o8SezriI/qgo6tue162S1kt6Iw=;
        b=cqQj24/A5D8UWLWJupyiHA56jldD/uSUq+WcuOeU+q0YYLClYnoy048Eo8ikyPxUOf
         uCUNoI+VR8FcpBdMY847trOA3QuuY0HDIcR1iFRmJYOAUIwFA+fOkYA2widbgURDfWDf
         fn99ffN2xy0JwYbQf/95uLlnSFgaczuLB5kwmspfCZokW5v/DZGKdx7avZTFRN8KRENa
         Xt01Fmz7u7zbt+5UoL7tmKn32dp6jP6YLVzawTuFnKwF249nkCR1RL0Zx0rSj6GWgWS9
         byX04PSZxJIdk/KVYZCW+HNgUwj92Ocv6439TCm4XAVsUCVnaqTIqL7TH1uJ5Xd50Kp+
         Gfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478700; x=1783083500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7IBvZXi/bL+thCx9o8SezriI/qgo6tue162S1kt6Iw=;
        b=QL8kNHR7VD6eS4m7Kd9Rjve1lUyDxnJwcC2kv4Glf5kTjvURQufvaKDHvxD1FudbeH
         VaX9Dk1F9ShGNa3To3oAOr3cet+nT1H8SrE6Ta23Bt2EY/VxnQM7nhULV+Q5zY+O9AvD
         CNY5bpxhyAvMmXK4icwXhAiGa6LXQiGRMHs2tbNRDt7Is9UzqnFfvoqAXctAFD1w17Ab
         I+Yv67pu4MhEU5M7tbVI39mESWZwGSwuxVf4TyrXt0Yv28BFnbQuMRkQGpKIkHd5uzlS
         mnrciWx3hQA3YKBzAB1v2mClhgmtko5sSsghoERQab0zSwwjYMPFAyx36dsTxg1TNRax
         IGZw==
X-Forwarded-Encrypted: i=1; AFNElJ/DZAxdvqSHKITt5gre7KevhudoDj1CZxPYAhyKuFiqKCI1PU+sIkl/uTLNd1pOdeieit/JT5UEuyvA@vger.kernel.org
X-Gm-Message-State: AOJu0YyHWO+7G5yvfsqKDLu/93nPVSHhUoww8aY0tl+uHLGnP5DWCTxQ
	2CAncwWJarG8E42ukMX2MaiiHrncf0O013BGj5s41N8cZ30d4Fw/zXkSe1JIAge56fmWyrYg0ci
	ZiaFrGmQCrT3QnxKvE/A6tO2VF/vPMHVVjVR8+mYIrq5Yn8QxxQI0r7DnRX8mMlFD
X-Gm-Gg: AfdE7cmBTuUjEklDTPht3Y48xPl1E912PisR5SAZPPPDrRDUQYCS80OK0pRvb4wlCmB
	UM50e2oKRS42qfLHFSYOr3dugJT9Qh/bu4fzmE/tmfk4J+m4swWHJMXJ1V36ag+vV0oceVzyBq7
	WtziFDgDkMcjb71DP1uQntpo3w2HYZzU/fEaL4t915ruMJP0UK2oBQP78AykLWz2W2j5oUZFUZ7
	EovuMVrJDHGMEQvIShFvIu0Br/6L4b+ZKIhsIvgLj2LkKoGOD4vwhTxPNSJ+ik2eNjZbkMtug+h
	97WVx6jp1huvCU7WdfPCX17NeRrrJSGVUYz6KWXsegQt3XBB+FwwSx2hOuWotgfTslUTHz9XKW/
	V8ws4qFJYyhok0mAZBUwGlQxHgqPuUjM8LEuHqhnGh4WyBdceXehVpRO+Eaq+cQ==
X-Received: by 2002:a05:622a:4c06:b0:517:6d75:a2cf with SMTP id d75a77b69052e-51a72a55f9fmr93953401cf.43.1782478699794;
        Fri, 26 Jun 2026 05:58:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4c06:b0:517:6d75:a2cf with SMTP id d75a77b69052e-51a72a55f9fmr93952861cf.43.1782478699250;
        Fri, 26 Jun 2026 05:58:19 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51addb1csm95193201cf.23.2026.06.26.05.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:58:19 -0700 (PDT)
Message-ID: <52ffd107-0967-4249-a6fe-cf61d7254d89@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:58:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] MIPS: TXX9: Remove txx9_7segled_*() forward
 declarations
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1782389357.git.geert@linux-m68k.org>
 <7f91d0735efee29d6d03fa7ff43eed3c41b5b5ac.1782389357.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <7f91d0735efee29d6d03fa7ff43eed3c41b5b5ac.1782389357.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a3e776c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-ORIG-GUID: bjBA_OlWBWuC07Mm8F8xg3GidOcL1xI-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNiBTYWx0ZWRfX05dkxI8uWuNm
 zf7eRZDrUHp77UMUlrQhe2gv/WlJNPF+pOdKHdF7vSmY+1IMIsQCR1pIxIeVL+x4fE/Qpzl9ckF
 bmKH39FvM/ZwKnxxRwFGuykwLLSdvNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNiBTYWx0ZWRfXyh3ie4umkg8g
 3CN4TzDujrORZmDOisu9rvuXdyoBOU/BRd8E1y1RaygLoflenswEN5CUc2keqsHAJvGyz0Ur15S
 f9EIWsY4oK0N/MQqVztcJxnsANIkhLVrrX8j0eBciJEf4ERTIcVLSa3PpqyisdlHz28udqtMX/0
 wdvEsmdM8U57Bpb/50D12ifBrt88o57ePXFD+hnIhZyR+sKT2OBm7uzcmXe4Sw0t+k/2zt59pG3
 /hLNfbiuQ9Aw4PaL0/STFhg1+034pe7sPN9yqyPP621skjEcXM8xBjaGfynHxRo5HI0qoAJpm9J
 tpGzU3EuOwni80895II7bCI1QQlaN75i4F8Z59xJ5uch8/2EQgFZCUvweIZQjF6mwkcyQT7xTyW
 PUeYaIIIseS2yqPnWToKUWS20QcMp6tRUYCpUzgXBjL6+lwdCpz6DlF3ihNH3hhU7PcNjntmnU4
 QDiZlY97KQ52Qbje9KA==
X-Proofpoint-GUID: bjBA_OlWBWuC07Mm8F8xg3GidOcL1xI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39032-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,linux-m68k.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 354006CD42F

On 25/6/26 14:19, Geert Uytterhoeven wrote:
> The actual implementation was removed in commit 5a8df9281b052ff3 ("MIPS:
> TXX9: Remove rbtx4939 board support").
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   arch/mips/include/asm/txx9/generic.h | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

