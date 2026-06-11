Return-Path: <linux-gpio+bounces-38324-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nBdQKQeRKmobsgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38324-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:42:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B78670EFC
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:42:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QqKmRy+S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dQ8UUn32;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38324-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38324-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C3F73053B15
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8ED3D565C;
	Thu, 11 Jun 2026 10:42:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD0B3D5663
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:42:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174526; cv=none; b=GyYoPlDg41HAX1Q+bg9CI7ElVlTu4NOaTm/axTH42zrSPdcM18ll8weyAoGpKs82ABrfbFmmJi23plULP75wMUZL2QKFOtoZDYWcL2US+5FX74TVzosjqgQG4TCu2jdZK2f/5NO/fn4y8zwY2xq6r+YL7Ru3OGxFh4qb0H6I4QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174526; c=relaxed/simple;
	bh=21cWswCL0Q0kYSh6xDgX0mv4iSr9gEjUbFziq4WHFNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTj/nvRfrC4PjRTJJhPcNBX2CDUoO0NJW2U3GRIvgyAPZSQuQC/5kCGzIf/ACCAEAWmcvQkJifdwuloM1I15oBo+Y/GhJLZxd79PqUXd2EQU1d+iWuhOYlla1YtdYDM74LrQM19XbDz91tAadlkXE/VKiqpWvl9m0bNrNUIwG5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QqKmRy+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQ8UUn32; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9x8Xu267623
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U41hCxlzsgoTEJO/Op9kFmPFy1dFVq7ziBQKpmh6qkg=; b=QqKmRy+SapmjE5r+
	keu3nMDG4KxDYYjdhJ6AB7Xytn4kY6wvdawd8lDO3HabGMgeNInsfihvxQRGW+z9
	0Zx3Ta2yRdBjyXL8zuhGBLeNk5X+8MoxVBS6adVxrstjD+6dRlbzNj/fJY57TiK4
	Hwpo2yzJzQ6/JWQLKB3bJ1kcjTnS84uvsymWuZBFw5AVx8Umxoxcy3m9128LQRZi
	QOJ3nu936F1YwlJ9O6cg8/kFMYlJNnncjECC1OolsFllhki6u9OSRXVAlu6NF4mS
	O/cNEzJkcd7Ne2HCvqlBUTf7y9mSh0TlJ3vGf2ugDDNMx6QoAPEiCpOYDS8/OdsJ
	pGoLfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u304r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:42:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9156dc90fdaso190442985a.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174522; x=1781779322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U41hCxlzsgoTEJO/Op9kFmPFy1dFVq7ziBQKpmh6qkg=;
        b=dQ8UUn32mE461J35gRjfAfsyKZ8bAheNMD+20b/Jv3J6zCbY9wDWAvcWql96zFr+ty
         zTQRNhhCnDoa8tHDB64r1Gw7+mNel5JOkdsHgSuCV+JBYqcW+0pr0Q8SdpJCl68Yo/d1
         xS9jtpv/Hx8pmdv4nCZGBImpJgsfvwF9G+3bLGi5OAHqxkLyT9zMQDnKd4ZDknN/GTXs
         MN6yKUXsRmhDPVgwKWBjuFuS0/peUGR3bN0R9NU6RIL/UdF3svPNU2yRUnUFEO+s1/XT
         XDr3xqIViTyJXzbz1aW1dX9M/2SLML+v60w42H9Ew++0TymvN6D+RatHBReJxbAkgMQ2
         Tcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174522; x=1781779322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U41hCxlzsgoTEJO/Op9kFmPFy1dFVq7ziBQKpmh6qkg=;
        b=CPwEMjoo0hlHQjfZgjPaVXJoj+L14TORSoOLClBH82nUUoWR5JGm8mGngwdHi9mdgf
         2VmgtlZ3WrSdDkB4tMOjTfCH5qX9xHtlktIOwm4gd7zm2VokBK8/vIQiLXQbhmgWQ+Ze
         vDOi7/P+U6Hiv1i46xTT7eZHkRmdk3qaLmWjPng0XgE8uf8kfM8tSJHh/D2wJjjO18q8
         MuH6HKJyzUSaaUiCyuUBIygOE0D3SEkKdTcQP2cPo02/MqXH7GRsbhcTAj1NeEPGeKRt
         e3FznrLJBuoHOZr3VPLE/g4c32FmfLt1BBqoTbxEVIgkqFM+V6KRUqkshto0scSsxWma
         vm7w==
X-Forwarded-Encrypted: i=1; AFNElJ/jH+AzKMfntr3bMzKbcpBvu3zPcFJNwMiusPpjKT6upBfN4dayoYCPp31K3gaMSTXkp6TM66jjhtQ7@vger.kernel.org
X-Gm-Message-State: AOJu0YxOUrMWmyKWjYSSWtLGSKrqUD0pSJ7efkcjniWqzr7pDRI6ABH0
	aXUf/1oF3bGfeLnAV/DpTSP5eINs5dANddIiqmuCTm53qtXDSU8Fqxj3PIMuy1OhR/jrKbxpy4t
	bz0p8WLgIRb9ytRtg3KjlPu42iwQFctOMF7afdrZWjG7bowYTDt0cClQXMVdLI+pw
X-Gm-Gg: Acq92OGfasqtNOSry4FMx+fMQmby/XSY5JnIdMk4i/32CgTKcxXrHHPev2L6+R/x1qL
	Z6kGrZzSw7f+7O12i802T5z87ZI+j38bAViJ6np6uNELSvhWlsAOgN1g34EHs8lDsN977BCNxWo
	CgY8aKAuY4tYm2yfiTPjizbnkdqb7qlQxec5QYp3EzcGW5BsBm1dWA2TriMTDqgjgAohabLlnHW
	4k19bJbEBGkahUSBj65fiRkjanirdvEdFLpVfu4X2q6hRe0T2e5oeNZJKltjO4uihzrH29Nzj3R
	AmqyMrSQVXbauJMWTfRGrGsFVOGBLiH+SlY+yPWECgNlWnvqdV3qKsCKP4f5RkFKEAUe1B+n8Qh
	L0C/jQMCr/LAXZxh81Ew1hdRoQ/qUcNLuHol9Nmw3KyriBVNpIav/PKXc
X-Received: by 2002:a05:620a:4494:b0:8d7:ed38:8189 with SMTP id af79cd13be357-9160a49b154mr172361085a.0.1781174521965;
        Thu, 11 Jun 2026 03:42:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4494:b0:8d7:ed38:8189 with SMTP id af79cd13be357-9160a49b154mr172357885a.0.1781174521401;
        Thu, 11 Jun 2026 03:42:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c72esm10435523a12.23.2026.06.11.03.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:42:00 -0700 (PDT)
Message-ID: <37390682-ca24-402c-bf45-7f6bfb87f4a8@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:41:58 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RWYHDIfmhWR7ZmexsXxcrIpPHTgrOlqK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX0ARDqJc3nVg5
 MmlwbTwagOqCwE5l7uT2k9A2fIfxhndwEVcfoTa8MNpNV6AnUqQI4YcVdOOMKtPnc2aj6172HGJ
 s3LVIFVgng+XyJGzlay64+wJpe5EwUI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX/q9XP7zMolI/
 Dad5Lnz51MT1+tymm5mWdzOhN1l3I9bhQRRZDhexdUFLbT8QLLn6N5cGbBPcZdjweatywMdtnj1
 X0SWVOiBU6FeU57a4yC3Kv24VxgHoJK1P+T6UQnJzFAls8tNgcZYGitkP2ab+Ob9D1RggCLmVuH
 nPyTErnFuLiV1dZmhqFgNxHLp1LmpU5MghNM6SwL+UiI2B3E8tzPk1TSduRmOBj4+lOYYZiLTLb
 2UxGwmO0vjGRkMDuLm9+8r6m75NvG+PNNwy0piqMl2N0t6XrGelPrjJIFotnWj9GHOa76ooObY+
 9Oz47NW54vBBqwAAEmo0qUFvRDnK+2iyqebTItIuO7BuiAvpabtiLN8buVEP2wso3WzBIK+kf4b
 GD2iSGtHjAfQVihrR//4G/kLqPLVCM1jVuS/oNLbxu4mwsQJfAc21tcudAsU16N9fracKkEPN2l
 UNz5n0iJJYnzoE19oeQ==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a90fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=T_C6tPeZwmvWUCtsfMoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RWYHDIfmhWR7ZmexsXxcrIpPHTgrOlqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38324-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16B78670EFC

On 5/26/26 12:54 PM, Maulik Shah wrote:
> There are two modes PDC irqchip can work in
>         - pass through mode
>         - secondary controller mode
> 
> Secondary mode is supported depending on SoC using PDC HW Version v3.0
> or higher.

[...]

> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260522-hamoa_pdc-1517acc2dcd4
> prerequisite-message-id: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
> prerequisite-patch-id: 152df6e30f70eb1b45909ce2793bc4277554b7ff
> prerequisite-patch-id: 118bd4216e0386e7214133f53153684947fa8dd3
> prerequisite-patch-id: 1f2f272d8ad1f7930d462e6349bc49de815e1ba1
> prerequisite-patch-id: 3754ffdf536206353f74953fd6d39804ff7787d4

This does depend on the changes you made on the driver, but not on
the 30 bundled DT changes - let's just point to the actual dependencies

Konrad

