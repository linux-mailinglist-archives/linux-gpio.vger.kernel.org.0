Return-Path: <linux-gpio+bounces-33391-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG5XJsQstGkEigAAu9opvQ
	(envelope-from <linux-gpio+bounces-33391-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 16:27:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4671D285ED5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 16:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 817E530C581B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760BA399009;
	Fri, 13 Mar 2026 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSKbESfP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQq8ShEb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148A2147F9
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415057; cv=none; b=BYHgrq/VQX/FYMRSoa+5+za1UvNf4Up6GRwQxNxAQ7ZwKs7t3KB2LqG9vi8HKPL8DSHE20pmqGKrzymKPYoGkoAF2oVMcO9LAl7J7sfH/NXOGciB5zYkAER/YHAt3MXqYp9HLEJQB5s8SWsFef1F7kqUKK7zOwCtqoCl3kbkkFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415057; c=relaxed/simple;
	bh=l4HEowm5Fwgt90UaF5x2GYpYEwjxSinAsmsMDdusFdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqGmMJRz4RLSm78Kqj5qyoa/BgpE/jruFIlSNpRdqgQkU2dFQrY/gLyfqarPCrzACM2YBcHx4EsVrLcpqxJeUNYJOxiZsz/x/ybjpxUfoRzGLfNEOlRDKQLToATLlcMGHCOYLF2ct8jcahhtyDqed9cav+b0fGzrWwIFrVcSKE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSKbESfP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQq8ShEb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DEZ1ZV2262549
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 15:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8W61Muwi7dV63yRzThS1OSpPDfzReo082YGSyg6OME=; b=DSKbESfPijDRGU5Q
	PlLfExsCxVuH3htsE1f4t1mJ3nX1w5/rW0u/r4JFCXkpBSKNWl5jvu9rZaYcM9Pw
	EDBK4geza49DvwZBNkZbT7FuqnXwSIAu4gr0L5b8kI5uM64O6EXUi2YlQmu6DwfL
	FamQrNjhN8JZ0iVoaYjgQZRMdCBbZz6rT+/zW951Hxk2ZkehzwUqfKlcOZ+5tBGL
	6ynZVvhLT/Y/bLzqfKb3x/iEN3sNJySMszUcLq1bSjKhDwZQSwfRe0do89RfgEWs
	xbnESEgGaBeZvBRDOGOIhDTs834FXqblh6SMp7wbpm8UtHmBSPV652Qmw3oBkXjb
	+3fHEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4sjp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 15:17:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso16817910a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773415055; x=1774019855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8W61Muwi7dV63yRzThS1OSpPDfzReo082YGSyg6OME=;
        b=BQq8ShEbv0Hd+MuIXHs3GwlSew4kyj2Wm5CkNMsD2JYAhxqR+LbPpHoJ/1jB6PogxH
         HYndDX8MCGhisiTPAZMWXN3ey27ZvrvjOBzoUj7YC3EF0j9fkbzuDatXEcMCchmS9QNx
         0blyCv9pQyy/eMOrtwkUNo8e0XBfvwIAgbOWvq77C2nSwqWyMHCsOFdKzFepsezVj8DJ
         EjE7ZbPw+w5VoptMfIRHBCOc4qm2SH9usqV1MHUYiadqAJFVvfQypz8d2p5WMcSAbobs
         jEabEOhpUbKQ2cWYTgWTUnWReqnC+BAES0kUcMSlMPHqi4IvR76APWn7k4kx7+PAKBvW
         NqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415055; x=1774019855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8W61Muwi7dV63yRzThS1OSpPDfzReo082YGSyg6OME=;
        b=HeU2rkBnUeGV46CB81OmTtv+jSGu/4uIMr2ANAZxbh+/8i9VHBRSz8A6+PRjwx91fH
         IMkWr/V9u3aYOoCedrMFltIn8VDe51WRqIZatrnOOBNHqRpIytDenAHIW5VaSBmmeTcN
         ZxG0I8FTY5hqLKrC0EWHdnG/vI+AUtRAKaWElg2GV2OSzWxFdG9rfhR8QqSwfYjKSHIc
         58K0821v+5/O40PB6SbdkT4ENabWLsbuL+gORGwHjrz5Y87+5E0NmF9VlAwPquccTdGi
         qCJ5kAo5LsRPHepnzW63xcU6B8h/zkhRewqf5NZvLiuCF+gtpe1R8JN3c/q0WAybprqB
         DVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfPcJgV8NpacW+9r4BCBHmbW/9LSO3sD9USz8yhf5QvwfiJmLaxKsv75lJ2UXfEEId0y01+iPWkCNB@vger.kernel.org
X-Gm-Message-State: AOJu0YwtPCUiVeK5cHTocRmXnv+L8c8iHL6cycxOsb9rzkpITwbXcH3O
	6yq/9JOic9OLER5cu1FcB9jK+owbEZchgynxwZkoXIa0ADixXSkUQTJgW48QwFFz/hVUpz8xIZ1
	a3HLMiTEP1ABKIW0aU3O5dXYpINmrRDo5zX8SIFGduHQlA2qQpC0RmWq5DFG5D9dA
X-Gm-Gg: ATEYQzxjmnLKlr/rKA5MzbO8dPa6L6p4rj1JfKacswmr1I4VSujBECmYAsrCp2t5eFn
	USulAt8/kkJ9ZvuML8TwSI4HDmgLlupCJKiqa1BLMEqTUcGtNFc71ZjPb4ccHY8IQh0/KpfieG8
	S2QYUa5hKEfin8XGwkgP/ZEWPX4klmhpzRW1vVxtueOwaPXwPONfQfVgBjjffm5r+9zPF4GgRiV
	QqTwUt708oGxire/9J31e0Yorv/2DSV3/XOixLP9oL6K9Y4buv6jMFSmJUOY0+uZaPwfOUysIwh
	l65KDqgWkoK2Lc97l/tP8Qg9lnRx8c5FIV+uKzhBeiilEHUbRf1jzMK0r3Z4u7BQ04TuucekO7X
	zEgXePhw9foJ7Jn1VBb4s7sbplF4nRUlNyajG/4qw9e2O7IVCAS8=
X-Received: by 2002:a17:90b:1b10:b0:356:3ba2:122c with SMTP id 98e67ed59e1d1-35a21efa8cdmr3431192a91.9.1773415054475;
        Fri, 13 Mar 2026 08:17:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1b10:b0:356:3ba2:122c with SMTP id 98e67ed59e1d1-35a21efa8cdmr3431152a91.9.1773415053961;
        Fri, 13 Mar 2026 08:17:33 -0700 (PDT)
Received: from [192.168.29.179] ([49.43.225.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a17be605asm7039006a91.17.2026.03.13.08.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 08:17:33 -0700 (PDT)
Message-ID: <8a857ccf-1aef-4214-a1a6-cbd910ae5ecf@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 20:47:26 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
 <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
 <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dgn3XD_9u6OboJ_9GGxA56U9PyHYhyJP
X-Proofpoint-GUID: Dgn3XD_9u6OboJ_9GGxA56U9PyHYhyJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyMiBTYWx0ZWRfXwBGiRf6UiiWq
 FWY3XjglE41kFtsV6PoiYQWWWqYEZaj/LCcZUuw7cybE0aJSIdfHWy9htSHCqj8SKaLcRaWKCrb
 T6JhnyHfhmh2/JbmiRHUJiHvXXkeR3ZwMezR1BGwD+Ucdgm5WI/DWK6R0CGC523eI+BayaZzdCV
 HQeCcaZKn1BVAdiah1N644OCAyDWB1ytE5RtfzsKiksJeu2h+uMdBRrl5PidKBynpPFrzh9L0gc
 XMM9VQVZxPqLJQLrOipboBUm5ekUQ3Xm+DGwdP6LPb7mV3R8sX1ypcDeq6zFm5ofDhZm3Be+yj2
 C7hzSBu68bh4ChQ9p2Z3UcF7Avx2Cj4i0inVs+to3TFXCKKUYDPalKhbWYCqv/AK7TueIDfVvQY
 XrasEPvqpF3HShCkwrf4Rndwkub1vvpDt2MaQT9HlASEqsDPyOYJ1Pzo54uZg18l+q416ewWJBK
 oiYQ66LURJVuX7p5q7g==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b42a8f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=G0zgsK738vOuM7T1zJuYQg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=9LLCEl3WuFZl3W-Eh58A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-33391-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4671D285ED5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 5:29 PM, Konrad Dybcio wrote:
> On 3/13/26 11:12 AM, Maulik Shah (mkshah) wrote:
>>
>>
>> On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
>>> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
>>>> Interconnect from SCM device are optional and were added to get
>>>> additional performance benefit. These nodes however delays the
>>>> SCM firmware device probe due to dependency on interconnect and
>>>> results in NULL pointer dereference for the users of SCM device
>>>> driver APIs, such as PDC driver.
>>>
>>> This sounds like a bug in the PDC driver. It should reject being probed
>>> before SCM is available.
>>
>> The SCM driver provides no way to check if its ready or not to decide to reject/defer the probe.
>> A new API like below would be needed here,
> 
> There is, qcom_scm_is_available()

Thanks, i will use this API in v2 to defer the probe and drop this patch.
Deferring still delays PDC probe significantly but it would unblock this series.

> 
> 
>> Let me know any preferences from below options or any other.
>>
>> a) Add the API like qcom_scm_ready(), this has been tested and works fine.
>> b) Move interconnects from SCM to remoteproc PAS driver for all devices
>>    Take the vote before invoking SCM API and release after return.
> 
> I think this is not the right decision. The crypto path is only necessary,
> because cryptographic checks must be carried out in the TZ in order to
> (dis)allow a certain firmware binary. This is not a characteristic of the
> remoteprocs themselves, as with a non-prudent TZ, the firmware loading
> would amount to a memcpy() (and some SMMU/XPU configs via reg writes)

This does not seem to be a characteristic of SCM either.

Loading and booting the firmware is part of remoteproc and not SCM.
(Documentation/devicetree/bindings/remoteproc/*)
The votes required to (dis)allow loading them faster (such as crpyto) should also fall
under remoteproc otherwise any driver requiring SCM API (for other purposes) would put
the burden of placing votes on SCM driver?

> 
>> c) Remove the interconnects from SCM and rely on crypto driver already
>>    placing the vote, Route the remote proc to SCM call via crypto API,
>>    This would ensure crpyto is being used and it would have placed the required vote.
> 
> I think this would make things even worse, because instead of waiting on
> the interconnect driver, we'd now have to wait on the interconnect driver,
> the clock driver and the crypto driver

okay, i was just wondering if crypto vote can somehow be leveraged so SCM do not need
to place the vote.

Thanks,
Maulik


