Return-Path: <linux-gpio+bounces-35242-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MZzJzno5WlkpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35242-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:47:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F14286BC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EC063031AC9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 08:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0AB388E59;
	Mon, 20 Apr 2026 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAZghM8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGn0g5/T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F171A9F88
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674533; cv=none; b=sEBZZgVrIt6oQ4LyiXZjhd2bRSsHf7R75eqzSWHuMVszY+JtlTFL1z3W6YCeS2G7E/HE365/4pyXjj8GlTBpv1+JtW8QBrIlGF2kxzbWiT7UYjJrOsD2l58GpFrYVRlnhWjNTq4sOsHDJAV4VKhqNlqoqltySLgFAGIJa5muyE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674533; c=relaxed/simple;
	bh=5fRZJ8YA8KbJQU7yUpodTShTa4RfulvrCn7zbvhtIoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuP9TZNZn5InkXoicLf5J75DKHs6ghYsCHR+lPwz6z5Kz1HvvB4/piqWKCFkJ3dN8D6MZscQcafAv73qKHy3r6DaOeUueAMauN/9MRlJduJvS75hfnL25Y2+dXqxOs7ZkKiE/eTI9+96BPudcppRA29J4kJMC5cspx34K6dn6Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAZghM8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGn0g5/T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7WtWn1532100
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8iMjMN4YKAgD5WlMa8L6g5mmJh1v/Zzj0qvsdzGArE=; b=ZAZghM8y16lfL9Zv
	Nj1MZgZ26Wbrs32PhR0n7daWHOuKCY6AZQhsoJH7kaC/qFLfybXl6uJ1aKiFKKA3
	zqyhNKBb4g+llkwSaK4cOKgP/aviGLDVS1aKBtTQgZGrPa63rLWV4idrOnAlrDwq
	R+BjlRv/w3JLrkBGXEV+BqaIxfKd6vFogdu0oPDqWnalwzkFDwbsyynyLYvG6F4o
	Y+fxddAirTHgrYIG7GovU6HuZWoym0M9fZ1s9dyLM8hAy7/O5FEROvOJhw5q9sAw
	zFWBgL1u0e7BmqmkgDLf2f4ToY5q+ImqwxtOgNVlBARz9TqGBFHcdodXUpQV8SYx
	zzAHhw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus0f22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:42:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso5492328a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 01:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776674531; x=1777279331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x8iMjMN4YKAgD5WlMa8L6g5mmJh1v/Zzj0qvsdzGArE=;
        b=aGn0g5/Tvh1enK1M66saNo3k0Oi3I9YkiHb9XVpe5RmQEGraXwBPRfKKqxM2GFZKKy
         SF9o2j7vxWpKKdIni3a0JNQ5r58jSiuMIHZNowwNB3oMGXJfoNYMLhabhAeh3vPo6p3j
         6J6epL4JfeXhCeKuB6ZHzVRn3JBbDlCkF6xrdxyyv6+hEUOPk8k5YhjKfFjyoYmuU4mh
         18d9VgVMtHkMTVglsARRdqwVLCOU0nZKA+coIgdGUWQP5yPjafdx8qYHUZLNBFFglZW9
         7QOFVb4tWsUXV+hUDpGWpu5xEwaYECZQjO9nKlqEo3rFK2MFIjnJ9Dh42lMPiejONTFH
         Ze2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674531; x=1777279331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8iMjMN4YKAgD5WlMa8L6g5mmJh1v/Zzj0qvsdzGArE=;
        b=G1xHuYS97wupqdd931KljDmuuu55QGrATodSWArrNdupaABGzMapNzwiHvvzxyFff9
         V8Ri++nVduNiCxxoVqE1XmZQwNgNe1E8d7Dyi/uaw6sClGWtFq49a+lZJnvvL3xOIyqq
         mJNW9iC0zJKp10UVOEaNtk9BgkOo3MT0z5i+uHYOfczlT9K24xNS2IFN91Nq0+J1bRJ/
         58Ikq94C67LHcH6FjNIzdwfqPH8JYupEUYb09fk+4a9eosOOoXFStb6pcOT1aVv38BM6
         d/p4jUhMrt5mX6sHT8peNkWdtrig7UIZqir5BXhGPj7fS3xqsZvRnhbtJ42NLfZ4TqmW
         ubJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/Kn5vLg6a0kcRpbVeW2WhFDdEhy64caRgQZ7LfbtIIeAFK4JyZes7a+Hm2QujY38mLMxdpLgVzeZU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgc1RsCLmZsn9b4CjjWsUAon7ENRDb979A8LhSwzVuf/Iz4H8Q
	DsuRbxVouy1TxqgAJvzPgh+5ywt+YNbz6s936bIBwJsXP9mHMSsJbDGdWlh3pMCaQUv7w0+Znsb
	mor98MWS2rq6Q7emCuqUMmUUsA4uV21U4SJPvL84D4dJZq0lgHVuk1Uy3yqyD1huM
X-Gm-Gg: AeBDiesEo+apOY9lqr+NGQcCZrDvxK+whgct/EXG74SM+Uq73H9sGw9Zr+/U4u5ETrS
	SRis7iIVF/xZ14Go4dhfgwjRDKAOnhJ8aGguo72syx2Fujf88RmtJLj9cng8sff0pJgnFHwbwCB
	NTZPxgflmXCggTnyZm/DksDHU8dSdFBq3q/lMejHKgEYMZ7Y5Rj/sbZ6+ym8JwRy2ucpITYZ1W3
	KuOar2uY1Glate46EF0fAFrxCakynBe/61nSEvZa2y8jCXn0DEibr0G4oICux2BPan5QMiCYM4D
	qrbKY5o7FPhPpq6d8UfKetMq72XcC914neND/yDPn3nx0tgLAHH7G+O8cldkoQogGCZzKcuhcOL
	KQwm0Ql6TYnsooM4PeWslbHpQvj3s01okhQlnBJ/ffQ6Du8IdRiE7xTxfcVML
X-Received: by 2002:a17:90b:3cc3:b0:35f:b6d3:da7a with SMTP id 98e67ed59e1d1-36140469f66mr13175737a91.15.1776674530440;
        Mon, 20 Apr 2026 01:42:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc3:b0:35f:b6d3:da7a with SMTP id 98e67ed59e1d1-36140469f66mr13175705a91.15.1776674529753;
        Mon, 20 Apr 2026 01:42:09 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab30f29sm94300945ad.68.2026.04.20.01.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:42:09 -0700 (PDT)
Message-ID: <7881bf0a-27f4-4a54-af14-9b2a5b7bb295@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 14:12:05 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] pinctrl: qcom: lpass-lpi: Fix GPIO register access
 helper return types
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-3-ajay.nandam@oss.qualcomm.com>
 <c73eaf9d-2ee3-4d18-b1f3-061711948688@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <c73eaf9d-2ee3-4d18-b1f3-061711948688@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MiBTYWx0ZWRfXyGWRAHf6Wx6E
 nc+2bR6kl0ngEHw4JA0cBekn0cU1oJyHdoT8nobSZeX/78Vy6e0mGh3ojZ62Gl8EkhOPsLYv6TP
 V8mxPSa/Sz259TWYS31v4PrBM1BZbDlTej466s0v7+KgHihgMQXHDQ24j1C7agHovVXjM5O0Ufx
 CbB6LDXeidJ4sDG7nrzNsUII7W7N6r9SjAw0lNK7+JQ0xAY7hR02yMmGi3nsWij/vEVCi0DqlVx
 Wmw+mAUVJMVEQgvUks/IoOpYVQSyKLPQa5E234wZT1PPHNtRTk1knd7cdZBhlIUvHikqjoOKsks
 Cc+GOvsPjVfhoE1KjBn47q5j6XwUxnctCDKl51FEWH7lgXBFJwBlWREHCt6DivvVZBIQxaSF4dx
 RRu7ROfFpDaKvMQjBpxxzAJQPCobRxSd9pcAQl35k6W2XQsaguM8s85gMNGypUo6Wl+MH+BfexC
 2QUfi+oSekuujtGHhYQ==
X-Proofpoint-GUID: Qfd--QKy7E8tpvQkhPcOaTKPBj0NaGrO
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e5e6e3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Qs0S--QKVP3T3cQB22MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Qfd--QKy7E8tpvQkhPcOaTKPBj0NaGrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35242-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 060F14286BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 2:09 PM, Konrad Dybcio wrote:
> On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
>> The LPI GPIO register access helpers previously returned the value from
>> ioread32(), even though their return type was int. This mixes data
>> return with status and is inconsistent with common kernel helper
>> conventions.
>>
>> Rework lpi_gpio_read() and lpi_gpio_write() to return an int status and
>> use output parameters to pass register values. Update all callers to
>> match the new helper interface.
> 
> lpi_gpio_read/write() can never fail, let's just make _read() return
> a u32 and _write() a void

ACK, I’ll post v2 with this adjustment.
> 
> Konrad


