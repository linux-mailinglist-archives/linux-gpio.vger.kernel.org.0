Return-Path: <linux-gpio+bounces-40091-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9l3ZInEnV2phGQEAu9opvQ
	(envelope-from <linux-gpio+bounces-40091-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:23:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 298DB75B048
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:23:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f7wPHOrk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=doVS7NL6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40091-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40091-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19F00301AA9E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 06:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC5531717D;
	Wed, 15 Jul 2026 06:22:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3127F30AAA9
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 06:22:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096536; cv=none; b=RWpeMNfCtJ3nF0cFUTByugZjEdKc9UB1r0dk6HmZ5CShmu5o06mkyebL9wH0CVvlbNWrUW7aDz077R7cWT4pXfdnU1WU1cyBHBStyDjsK2RCDIxI/E74pHHQIgqnYP5wr9j8AnpsywTiz5G4XqX0ztI8p/wrNJo2yy8ULLT0+go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096536; c=relaxed/simple;
	bh=+bo4RFif1gu/wGo6HC5YBl1wzRAY1rIbep+HIpYss5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJZvZEcwqx441y3YMZGyZQofrpZJ2p2WPidwM7507VjLF63AfVkYYQOJTRho1RWeN1b+agRioJiF+OI7iAIKnozGfNwI8h/eUQx5/V16GBtOs7OBkb/a6UHF2AP1unjmuDRV8PcUUmELB58mygI8aI/oXoVdGIGDr+eholWyAK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7wPHOrk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doVS7NL6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3kxlv2588260
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 06:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PnZim5DOaYpiQZz5/Qs4xB+vmbZsDrFngCnriAgpVuE=; b=f7wPHOrkQEeqGkid
	C8CX445v8cZ6A86F9TYy45JgTKWXq2JEX4Q4XnxwY0/eHnpfhYwjxFv/x8Db6dXq
	vLfVjY+wI3JA9WC5gDiwWhivZ93mDTa5aGwioaNq1TUb2QEmeg9qvRozSeAn8ftr
	PLL9NJUr++bF2TzO1+6MOqHnMNrqhO40ErUP1bkU2VsizNvj88q68AVu2RM9DzJu
	HKk1haZ0KThJq9yplJhmrnJrdQDKs6QtsexrEHsI7wPb/cZ2kM/lf+7y+bdej5qA
	LBVfqwqXBCsHs/G0isd5Dd5KhYVZHN22BRFgjFYsPBOsSDX5vEAJ7S3BhRVonYL1
	STxIXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9ht7dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 06:22:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce406883eso15698705ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 23:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784096534; x=1784701334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PnZim5DOaYpiQZz5/Qs4xB+vmbZsDrFngCnriAgpVuE=;
        b=doVS7NL6uaFIjZANOY13v+wECpk1x+GX80QAa2WdVmKldXKl3EQPVkyqulgwZ3Y8/t
         7kcAU+lbHEsvfDVnIGj8IEp/fxss/A+K3R8XsmIy1viFYzNVLgFiPHYalXXnk2Q6PwHV
         BQgVaikxlqfUD58t9RLY9HG73S17S28tayWBxODptEiXUj6c7IDtaKDN81AxvTZK52Dk
         LYxGMl63pvVrNw8TQzYD4HDxqk3HrT022cOZ8EPkaJiA3q1HtdNPLjZ07jTZrPV8vWm0
         sloRKuUhl7ilrXRfbw7f//K3Msw7BS5BM/0BK8QajtxWqI29MD9ubcC4EcdrQssMiAET
         fW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096534; x=1784701334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnZim5DOaYpiQZz5/Qs4xB+vmbZsDrFngCnriAgpVuE=;
        b=Kzt/BqjE3zuAl64yWxwxqyXpTGOcaenJqHTf7Tw/DH3r+Izj3Uld0M5t0a3PkJwdMz
         pG0ekTeR3Cb3y7PdOi2LR6lTmhp2w6fgmzcxZj9q4nI69+ibutPi5zCuGhPYqKjntDDd
         53q7l9b2kkMiTSNrDdNLWZ+/1sFnGmKvSf+j9AtUwcGCMiF2WLcWlM6iWZAj9MfCanCw
         YRflHCuFj4BWnKgjb5j18sjqZ63R8DzPAos66sCM1dsDUsk37M02ESDOVLHcZehVcRgx
         i/39Su4J0uou7AgbO/CmCBXzFOOwxfqAlGdhrcbIPgkUUzMTiG1q7jJe8mM1q7Pw37OW
         OSWw==
X-Forwarded-Encrypted: i=1; AHgh+Rotl3ar5N44j7gtyYROg6r3Vja+UYpr/OGEuePwEvDBNTuHUG+r2fsy7yi+Yc8PUxJ413xV3ukq4aO8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd67oj0czG0NH6NIcPX+77ltuRIap25WM9MmHjk2r5xGQ3RwME
	AHUWjpPJJj1G7Y/4q11LL6HLzPkB/yKn2voUfPgmR9skptdSMzcCyPcUr+09WsiQkFY4dCAoI89
	lruO/LKNoYDXvkfB+JI1bm7mGpIJdQ+vg4HX8qZ+/v+2SaDuSYNxpfiinlhZCDfz1
X-Gm-Gg: AfdE7cn5kSeEdYcOzMu5EcdEgAgUYEscabE3KvGRfVSVhvH3VHQ7T657ep2q1DK1wBg
	Zo48oUDvDgCMx/qY2p+zktfxsVA1bFfUD4KVl5IvhMA3o8f5tstFZ4ulXSiq315NgYdu52deMrU
	dITm1ahiD4phcGOd9Z4qzZnjdgTUi8zfGK/TKORtq0jr8AitQqmQOYnTcSryAvmCZNU2laHhGE9
	M8PNebxdf6cLhfWSlzazXCJPSjtEIaXl04DFWiLwFFzeaZ6qGLHHJNGkeTjrEzSm0x5JL15uWFF
	QQqVXOyu5rnWVTLnzqq9qnnkBTP9k0uoyuBiEUuZV4OFwtPeya7dq1ylW/Bvhd6174YY6uoqI8N
	0tbmfVjQC8uhmW60o6QXnwFJANEF1Dzz7LF7jtOfz
X-Received: by 2002:a17:903:2a88:b0:2c9:d8c6:1db8 with SMTP id d9443c01a7336-2ce9f284e45mr158543245ad.28.1784096533779;
        Tue, 14 Jul 2026 23:22:13 -0700 (PDT)
X-Received: by 2002:a17:903:2a88:b0:2c9:d8c6:1db8 with SMTP id d9443c01a7336-2ce9f284e45mr158542975ad.28.1784096533314;
        Tue, 14 Jul 2026 23:22:13 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf08fd77dasm2386245ad.72.2026.07.14.23.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 23:22:12 -0700 (PDT)
Message-ID: <018990d8-2a6a-4725-8aee-af221057d664@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:52:07 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
 <20260707-hamoa_pdc_v3-v4-7-dfd1f4a3ae89@oss.qualcomm.com>
 <alKEUhRgyoPs0q0c@baldur>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <alKEUhRgyoPs0q0c@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ib+3n2qa c=1 sm=1 tr=0 ts=6a572716 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pOI47-Q_PV5DkGHPJZYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ROP6NpFXTJXsiCsjKHMMXXcyx-9Rjaxg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1NyBTYWx0ZWRfX/BZHo/un3ZX/
 DSj8okOJ+woWHugjiKkKNXnr2fn+bWhg7rhgydjsIVj+WHKbLw90p3uCLsCs046DArsMexbJE6p
 RXzrMjWk+M9iWmQj36Q113LnGNx2JLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1NyBTYWx0ZWRfX69U3HepV07xK
 JrvtI4naoJvrLwvD3JRPooS/F7cfSrdWqJuSKd9SCnOsq39/CQhq+3cPrCCw3XhLV4vCx7NmN+1
 WYFmbYHn89Ie7Cf4jjd9bN2lCnrdi3nGEDLz8q40jOohdcE3Lp31+nvn/59AR8px4aLDN1KDoC4
 v2NxniW5bM7jS5enFr/E7xi/75ZGjr5tkg9m+7AVVDdsGoKUx85hvS8N1jYgpScNXyt8KTh8QO+
 cea4sSfihm3OVq5+lnuc//Dif9Ou+YfaGZGxDvsDSw1qzIdZH7MAFHECQdLoVhSZtPv6UvEATCE
 qBamFGMjoHF6FqYAxj5ebccTkRP6SbWEDJTGWtMRtaBUaFRbbFPB2N7RvBbJ9EQru+iKBAzPN7Z
 WP6jRWDg0Hp239Gwom33e0l8np8xDf77eO/UdHLxXQu0Mg38Z19KMqoN3dcgA/h81J5nQx2gGs2
 BBmtkvXbJ8T3tswAtwA==
X-Proofpoint-GUID: ROP6NpFXTJXsiCsjKHMMXXcyx-9Rjaxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40091-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 298DB75B048



On 7/11/2026 11:37 PM, Bjorn Andersson wrote:
> On Tue, Jul 07, 2026 at 02:51:39PM +0530, Maulik Shah wrote:
>> Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
>> in deepest idle state.
>>
> 
> There's a lot of implied background in this sentence. When you write
> commit messages, please intend for them to be read by someone who don't
> have your background insight to the problem. In fact, if someone asks
> you about this sentence in 5 years would you be able to retell exactly
> why we ended up with this patch?
> 
> Please rewrite this to start with a problem description, then describe
> the user-visible change.

Agree. Added in v5.

> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
>> Update entry/exit-latency-us to follow DSDT for cluster_cl5 idle state.
> 
> I don't have strong opinions about bundling this part of the change - it
> could be argued that it's a separate change, but I won't force it.
> 
> But as written I think any reasonable language parser would consider
> this to be related to the addition of the deepest idle state, not "While
> we're adding the new state, also adjust the cluster_cl5 latencies with
> values from production configuration."

Added in v5 commit message on why its bundled in same change, 

"The newly added domain_ss3 state has entry/exit latencies of 2500 us.
The shallower cluster_cl5 state had entry/exit latencies of 2200/4000 us
which are higher than the deeper state — an inconsistency that would
confuse the idle governor. Correct cluster_cl5 latencies to 2000 us each
to match production configuration values".

Thanks,
Maulik

