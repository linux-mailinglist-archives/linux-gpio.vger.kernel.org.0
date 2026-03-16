Return-Path: <linux-gpio+bounces-33545-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEXbN+gcuGlYZAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33545-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 16:08:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74829C054
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 16:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B590E308B43E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46370315D35;
	Mon, 16 Mar 2026 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onzAdZk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SgqSjWcS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E959929D264
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673421; cv=none; b=JLvEPysPF8D0X5Y08aTQoLKGSnGtXh2ddy6dCoVG1kX0n6H4Twvk1eXxZp0R/9pd9KeTG8KtUFpD7PvMSIZG19Q7Uuu4kLpms52FmL1A8eJG9x7WtQ9ers35w0m91sOLkj+sZVdxCOtO56nxg+8chOYWtcif13/EEkTKiNGgCT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673421; c=relaxed/simple;
	bh=EZNWj67TxgIq1VE+4I4fSpVFm88t6C/a3QFfd4xpnAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZcYrIk/I0qyrgEA94eCPEYYRfMOkShVYSITk3U07ASs6OZlMWNngypIO5dplNsB6E+0ckvADhQKSMxY3lmxjHXGJ4FicjKlKLdDfzLlWL+p3ZTj/am7qGYVozd5UosPyV8uiGnlDskyj/nfT+3mLWs2YtRSkPwxnoLPVwaY3K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onzAdZk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SgqSjWcS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBjkie1428820
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 15:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aCODfBGAeL0cibHdox9jxkGJAyfhaMDkIMYHx4tRmBs=; b=onzAdZk53HGPQGyk
	0CSTfd5m9dkxInOz4bsfgnWhW/ENpD8gR7TExcvI9R0u5gFhbRnQvOkLiOOy9hyX
	j7Rq66Rhej5PgO2H9TR8sosME3vdFqDbEXpXhJsLE4gg55i7XwPp/UdXKBjbXsMU
	yjkkhTcQ7qw8XRhECISMAiZZU3YYD4LSdKNwtfGHGIabjGJ3j7qmIBKKiNWQfXjl
	WGht/XV7VNX6yhDYactTSVnDe4YmJEMhTfpIz6nmfZlJkWovtEqlIzkNFyusXLCq
	Nxh4gZ1/vEmsFtBHHKG9t5LPyvYwmBjFaxyG7SeKE72tipNH/sAr25xxNNDrAAyW
	RozcAw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh998r96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 15:03:39 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d74d78c5f7so52311773a34.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773673418; x=1774278218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCODfBGAeL0cibHdox9jxkGJAyfhaMDkIMYHx4tRmBs=;
        b=SgqSjWcStXtCEk1kMDHHwHpBppQGbcz8JIS0pgn1XuY+S7EuVBW35PPI0ZAi9W/x3X
         u5EYxW1LE4x6SYECfHU65eldlJXCGkQCvSN4DFpr96Ht2+p7qgXkQURbf3VnB+23QBWq
         IAJlD8aRSicg9ROkTsfZ0Xo+ViZq14alQ/8IGFl3KXX6e190G1ThppBau36Qp8n57VnO
         U6GCy1Cj2vgd6VlDBKZ8GQQb8pF2huRmqoZiusAGjeJQtLHHI5zXRqwKCCtxvkZceae8
         2RCuvTguOVJ4BC+BzUiHfM8BxmrG1LEhmWoKJtQiw3KnFxtTaRqDB9yXiPdGMVSCID+V
         yXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673418; x=1774278218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCODfBGAeL0cibHdox9jxkGJAyfhaMDkIMYHx4tRmBs=;
        b=GSb1bcCu8lf4v0VaRY0ELhmHsy+d0SQogaNNSEzGISDETKR5gJ7040naz1eg8WzlJr
         Ntp459sqQwTA+OBZP3X7q/Q7QeRqdJNbwS132qMUIf1k1nO73hWXGSunIu5i0+I7iKzJ
         Z3zKPWiCGtfk/LqKNhY2Hw39ULFCBpFVw5d6PRXK3u6/WkbdQWEHNrIshTuRe+7erqL/
         fNCVq7DLcDEDH5Cv19d1LWmYrD2RFbjQ22w5qNfUa05JxSjfXab0Au0vJWR0HY73+YoN
         HMAD35CsJGzS0HQ5bjqDXNPWdJJpC5TSqlAlWfgISxnVfDyGEsZ/5NKxAeD90ctv4zw/
         0rGA==
X-Gm-Message-State: AOJu0YxlgGqGOR5YtA5089d6RDC+WcCQsSm5wle39+83sUNsNu0kZwcE
	2/Ax1pJQEpll8zwLcp7HS9i+FFFgFgZ0Bnmu4pToVPWLwEgIrtaPaH81h87IDQuB6h6Ehvgfp4H
	nY86nRcjPwzojXY5utw/xzHns8NBrtkNehE8kUmzv7pjoP9gvqsQYfz0TrolMSoCz
X-Gm-Gg: ATEYQzwJDVCdcpZe97UmlwAStkymK9aknJFjfzCHlFM1ckv0ZI6zTxQFXCpkj3idni9
	YrAYUsSg7Tm5SGGggkNXhqd5IeIt4NtRMb06dHROefArmhNdY9hIeFr4nhyai2qTHYAb7fIpMVF
	Dca4cBY2TGm8PHtqdbOwsdLZxathXW93RLyYg/mX+mLXXQJX1ev0DjxOWDw7s13+F5lBLm0KGuX
	UK1Qn+HTrBGZMrNkNXT2ONNcS83w+ffcMI0i6gLNxOvDVLjEDdXgGTUHzKY+Sel6txkTVnWD8B4
	n3oHGndoKu9nhTWl5Hl2HEK8j4eOS+T91snj1zyFGDNa8ymJXXjmAHXRWOgDp5qJ5ynMJEnX06Y
	U4XqIVL+P0/aFoWAPtIpyDWM64+P189rgGiTxxzAi4pEvzsC9dX6Rb8Vim5LVajnQKaDBpUBuIl
	VxNXNqgelA
X-Received: by 2002:a05:6830:8217:b0:7cf:cbff:85e6 with SMTP id 46e09a7af769-7d776c64ff8mr9921413a34.12.1773673418351;
        Mon, 16 Mar 2026 08:03:38 -0700 (PDT)
X-Received: by 2002:a05:6830:8217:b0:7cf:cbff:85e6 with SMTP id 46e09a7af769-7d776c64ff8mr9921381a34.12.1773673417911;
        Mon, 16 Mar 2026 08:03:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5dfc:3995:22ce:d286? ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855725572csm192675105e9.2.2026.03.16.08.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 08:03:37 -0700 (PDT)
Message-ID: <e3b1fedd-79a3-41be-a94e-a08ad0c85b66@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:03:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: mfd: max77620: convert to DT schema
To: Svyatoslav Ryhel <clamor95@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20260312085258.11431-1-clamor95@gmail.com>
 <20260312085258.11431-4-clamor95@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260312085258.11431-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b81bcb cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=3ki_b_XlgFUerp_oe5YA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExMiBTYWx0ZWRfX8AyUJfAFor5R
 PDPPeaO1iJVIUDsyjeWmf6qkixrFbIaK50rS2FdQXEGj5u1cbHblX9b7MzytyS+6CnleApaP/tm
 w6x9NtgL4+GQrRqBwoUu5wF+ax+5/VzvMUkYQyyOX1YgDSDBdifwJpgdO8CfF5zxGk119YpnwWm
 /zrmRh+MXepptVQE1twH8dXE5uD0ZDLkxBkKj+KdR7YpZsuNM5u5s3p2qaq/YEVf5QvOLfNK+fd
 ZWAJ382i+anBkuBQtQjQvUmZgTKWhZgTR4hIwj0MNE4jFzBWTkPD8XZzmwt2owFL3Sn7spJ2h9g
 4rbV0XZgj1VUJNyLVymKUtzBLeDFopmzr+5Io5qJAbNikWTVleJ716PD35jkCbM4zLqhE+w89fs
 Z/w16TVF8aS/Vc8kaddQg9p3JWAVH7zQ6fBNbc8SrmF+N6tAsu3vLhgNq8MLigLtNtTh7tnNi3d
 G75lV8YJLQQuxtuaNMQ==
X-Proofpoint-ORIG-GUID: Auz-pGrsvuK0EzsMvnEoNKxUo5duQsyF
X-Proofpoint-GUID: Auz-pGrsvuK0EzsMvnEoNKxUo5duQsyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33545-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B74829C054
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 09:52, Svyatoslav Ryhel wrote:
> Convert max77620 devicetree bindings from TXT to YAML format. This patch
> does not change any functionality; the bindings remain the same. The
> thermal bindings are incorporated into the binding. GPIO controller
> function in MAX77620 has no dedicated node and is folded into the parent
> node itself.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---

For the thermal part:

Acked-by: Daniel Lezcano <daniel.lezcano@kernel.org>

