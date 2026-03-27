Return-Path: <linux-gpio+bounces-34271-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDL5DD6CxmkhLQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34271-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 14:12:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA247344DD5
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 14:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B2B5311F33C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 13:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A6B3EF0DC;
	Fri, 27 Mar 2026 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHwkPbNh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYGM/Mix"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543823EB7FA
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616715; cv=none; b=QeZ8W8mWhkNPY3s0GsCgZkdI9iZpkFTwFTGjlkAQgABrzUbobq5XtroeG5hiM5NxBsJNSeb538gweIBsTMU4rJxY3BGZykKKIvwDnG9E1r60Alm/byyIPh9YmRz5SBMb5MrX19SmgzToxg42neVMqdboZ7EyxA5z0XRxZnJs8Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616715; c=relaxed/simple;
	bh=HM0UqkLUu9WqALVJU2c5Cv63fC0p8hZ2Hqz8KblmXZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLTXownAdYaU8PTgChZ43oZZ2MeJa2dJ8vsNv/6U9UjwssvHYYlLlQYe1msSLQ2korsa6R0bH6ruOICClHqc8HJu94AIWtFFU8iD8qHF7VNvPddMblPlo8spMcwPLiSPAhTXinqNU+UeEWzXiMdpTjXsTsuUgrPim69GZfd2NVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHwkPbNh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYGM/Mix; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RClVNG2378956
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 13:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfDlh3o5rWgfZDS7lEAmkiCGhj1ewWw3OQldssX7OhU=; b=EHwkPbNh+KpdhkQN
	6mV8U5x55Js2M/cmZRe8Xd2+9xxqoL/jYEGUXzxvjTeNTkfmNI0fflrMkLOm/w+3
	RKzQYUuDzpS9WFBEmI8YgUKweNg6YNF/p1pPf3NVZ3tY0m72VYU2gtBRK0F7MpMB
	r6kiQcf/ZyADM+gstE1zzzy666QnKogqosi3qa73n0Z4Wo+Pmk/iqL7g/8FOpVWP
	8eGAw0yJrxXSiFuHTYNnLdi8rDCaleQ21U+BjhVanmH242/9P/FFYd53kAnrFoNq
	xlxbmTIrrePhfWTDac2ZLAswZmzlRzR6ptmRAKfaYnaxR3CcROgGvoWzi4RwgHNp
	X9lozw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx1x1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 13:05:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffd797184eso156498137.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774616711; x=1775221511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfDlh3o5rWgfZDS7lEAmkiCGhj1ewWw3OQldssX7OhU=;
        b=CYGM/MixyF/Ac0qYhpZK+VjxQfYsM7Hh75vMq8yqnVVVmbXqYkUAZTWIWzU/FFO56M
         /vb1d2Azx66KmY86B98bCqsvTrvqGFT0w4mFQsDaBT6q1btlVO3a61qwJIYaH4o6gMrf
         SSBUP6BVRSSgqau0vk97SQ8XbxnFY/epNZCpBiCNFqeiPLSGaH0JHVvJYkK1b20JTZYF
         MeaTA1pkfI8khXQ2MIH1RJjVmr0r/VOkDQfhaUY2ah0J2RYGgpZ53LhN7FTrmDa+J89l
         M4/UrH9DX2MdEM8Jta32vM/iGgTRvEVoROrb1ohE/NYt4OTUmM54YNa0zANnEw+6HnKS
         /SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616711; x=1775221511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfDlh3o5rWgfZDS7lEAmkiCGhj1ewWw3OQldssX7OhU=;
        b=P6JDgWsUH4sWuy88UD/+VHvJseYOLXhLjxFLWdsQGyXoaUddfH66Wk2NgCHuXoC6kU
         DGUgd7oVTkeGi2RK9Z3MU+27DUKRUY0UuhsZMHP1hElcoqb3eQuv+3eLNbaUG4UShZmN
         8VXdFgEy5ZBVtsZwS12+FV01ljDXl6uexD5dBUkbFpUjMg1bWyNQHNqM6tfT7ObIScaq
         zp8/oY+f4DUTZUMoGzz0V+pRnwq4sTl7K1u6KQ1Ju7o+vdO1OWw9nhxFIl4GcxW4rEhR
         5vurqlFDSfMUhYEgg+v2G9lfpnKiSy0lpQ3pNdw7WcUY0iNwwaUt5toWVecuUp0tZCPH
         nAqw==
X-Gm-Message-State: AOJu0YzAEDSSgkSGxbjX/r+CgS31tCF7KMKbxQ8ywJ2OKB+Ct+PU7GgB
	Y3fSOGCjx/Fg/RgkO/x41PA9BORjM2Fyf02xo6bH2Ce8PEVm6s2h2RBUk5zj4MGy0ZAjitghEBf
	JPu/+7z/jNOPtxT4FZv+cRUGKn6AToxvYNr9drG3NK1aMpgJgY4HxjFros8FcBY+A
X-Gm-Gg: ATEYQzwhxJVOiPkJINe6zt+/dX3U4BhVwxgBWAm5lRIOGt1XvoYMl/OG32fHpf20KWY
	A48cCKHJb0fuA1giu540Y6ZPvnTKFU8AS7hrPT+urKt5sLyTHAwlwyjv7ASWpPCDUK/DCukeTrj
	pOX+b+arT3SLDHW4fSNRTW8uBtE8G+7dnJVzbn991dQU1XRM50QPl6yOTIzeBYkWoyc6f7N759x
	hSCPtAyPFgN0sNgZAZNtIW325DFWVrIhKr1cwpOpwIBetFCGbZt921ZMWBGnLg8TAuxCCAolJbl
	WzEmqMY8ZX0sOpHQjdMXjEu8kCdjobQSJQnLN7nGKLCYKvnqEmKEmGIb8VOMF06tUX4CnZ6m1hH
	rj3iV6vCD3XE29/PhgGlPA5uSIkKWFwLLuGyLe+0ZDqFUeF6Av0Gd2CwdRej/+7ojmlJUfM2jyN
	xSVjo=
X-Received: by 2002:a05:6102:2423:b0:5f5:46f8:465f with SMTP id ada2fe7eead31-604f92c14e1mr304039137.5.1774616711452;
        Fri, 27 Mar 2026 06:05:11 -0700 (PDT)
X-Received: by 2002:a05:6102:2423:b0:5f5:46f8:465f with SMTP id ada2fe7eead31-604f92c14e1mr303995137.5.1774616710719;
        Fri, 27 Mar 2026 06:05:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef860sm247393866b.48.2026.03.27.06.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 06:05:09 -0700 (PDT)
Message-ID: <c6318d9b-c706-4d09-b0c9-3bca35278478@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:05:08 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
 <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c68088 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=4Zt-9WjB5CLmpKvnE1MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: eF7mrOjwG63xRdQ-42dtucob8M-4SsL6
X-Proofpoint-ORIG-GUID: eF7mrOjwG63xRdQ-42dtucob8M-4SsL6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4OSBTYWx0ZWRfXzzXA/aa250NQ
 krCu6WZp/zoku0gzAn+857v2AO5YLtSaDZJp2m0togXgPgzVv9dKmPekh0QTDUY24dCW+u8TCSy
 MmtXVF7B3gvm7TMKTL1V0GvG2zuRlzhTMOErB7xcfgc6fG8lpfhyxzA4+DkOCcY6Hp9Rvnew6Vr
 IGp3gRi7STYyoBNopcM7Z7RPSToS0kMC9RorXZtyBSsA/l07DDRsGHwuJesPNYpLtcJ7qv+M4Iz
 KBfPuNVHB/QWhHBNkfKeT2Pm8Z50cLr5tZqXWkxpKSGlG/qKIbEYnA0HxlPT6b1fHX9xmEBoIvx
 gNqyb64r7YAVIwEVGxWxOkNyiOWxX7hTaqeY/0szj/W0huZYQEqHgm7XpCaPMDR3fH5xm8l5qPu
 RFG4S++/X3F+V5IuDZHfPreEBTR8cFMavnKPLb/WgxAGLzq+XN3osRFHzZYdYQ3FRNKVsZGmJ6n
 d2m6gxf35/WTTye5rOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34271-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA247344DD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 11:12 AM, Jon Hunter wrote:
> Hi Bartosz,
> 
> On 16/03/2026 13:52, Bartosz Golaszewski wrote:
>> OF-based GPIO controller drivers may provide a translation function that
>> calculates the real chip offset from whatever devicetree sources
>> provide. We need to take this into account in the shared GPIO management
>> and call of_xlate() if it's provided and adjust the entry->offset we
>> initially set when scanning the tree.
>>
>> To that end: modify the shared GPIO API to take the GPIO chip as
>> argument on setup (to avoid having to rcu_dereference() it from the GPIO
>> device) and protect the access to entry->offset with the existing lock.
>>
>> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Closes: https://lore.kernel.org/all/921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com/
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---

[...]

> Thanks for sending this. However, I am seeing a different issue now ...
> 
>  ------------[ cut here ]------------
>  WARNING: drivers/gpio/gpiolib-shared.c:499 at gpio_shared_add_proxy_lookup+0x118/0x1d8, CPU#8: swapper/0/1

Not only this, this breaks suspend on the Qualcomm X1E CRD (probably all
/most QC devices by extension)

+CC Abel, Sibi in case this is what you've been chasing

with the patch:
[rootfs ]# echo mem > /sys/power/state 
[  226.043580] PM: suspend entry (deep)
[  226.047470] Filesystems sync: 0.000 seconds
[  226.058513] Freezing user space processes
[  226.066296] Freezing user space processes completed (elapsed 0.003 seconds)
[  226.073489] OOM killer disabled.
[  226.076843] Freezing remaining freezable tasks
[  226.082353] Freezing remaining freezable tasks completed (elapsed 0.000 seconds)
(give it some time, it dies)

without the patch:
[rootfs ]# echo mem > /sys/power/state [   38.047570] PM: suspend entry (deep)

[   38.053506] Filesystems sync: 0.001 seconds
[   38.082615] Freezing user space processes
[   38.092528] Freezing user space processes completed (elapsed 0.005 seconds)
[   38.099860] OOM killer disabled.
[   38.103222] Freezing remaining freezable tasks
[   38.110329] Freezing remaining freezable tasks completed (elapsed 0.002 seconds)
[   38.469231] dwc3-qcom-legacy a0f8800.usb: port-1 HS-PHY not in L2
[   38.652848] Disabling non-boot CPUs ...
[   38.668957] IRQ205: set affinity failed(-22).
[   38.669018] IRQ206: set affinity failed(-22).
[   38.669029] IRQ207: set affinity failed(-22).
[   38.670351] IRQ274: set affinity failed(-22).
[   38.671257] psci: CPU11 killed (polled 0 ms)
[   38.712308] IRQ205: set affinity failed(-22).
[   38.712323] IRQ206: set affinity failed(-22).
[   38.712333] IRQ207: set affinity failed(-22).
[   38.713634] IRQ274: set affinity failed(-22).
[   38.713821] psci: CPU10 killed (polled 0 ms)
[   38.754187] IRQ205: set affinity failed(-22).
[   38.754202] IRQ206: set affinity failed(-22).
[   38.756479] psci: CPU9 killed (polled 0 ms)
[   38.789962] psci: CPU8 killed (polled 0 ms)
[   38.803178] psci: CPU7 killed (polled 0 ms)
[   38.816286] psci: CPU6 killed (polled 0 ms)
[   38.828479] psci: CPU5 killed (polled 0 ms)
[   38.847479] psci: CPU4 killed (polled 0 ms)
[   38.873528] psci: CPU3 killed (polled 0 ms)
[   38.894399] psci: CPU2 killed (polled 0 ms)
[   38.905818] psci: CPU1 killed (polled 0 ms)
[   38.912658] Enabling non-boot CPUs ...
(resumes just fine)

Konrad

