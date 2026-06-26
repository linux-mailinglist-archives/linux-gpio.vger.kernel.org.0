Return-Path: <linux-gpio+bounces-39031-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jc0HIMR3PmqVGgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39031-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 14:59:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0890A6CD3D5
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 14:59:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MB5rT5Db;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fsAginrJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39031-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39031-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BACB309051E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 12:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58903F4DE4;
	Fri, 26 Jun 2026 12:58:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690683F4DDA
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 12:58:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478696; cv=none; b=NcihvdcCns3151ExN8CHVCcOFEW3bJhTz2/MAb7+l7a79UvbBqJ181qclvwCXKUimYKKsvExTlU4knSKw71aSDZIUqUgisGhnLpQ0raOjXbqQCzR/VaYNaviowmOXhglaWnQpfYXR8xdNYtD2vGeGJzFS3ekvyz+RMEXQxB+4iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478696; c=relaxed/simple;
	bh=Xsi4plSt004PdKbPEvPkJiAI1d81eNaS0IM9EFBxgy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPkDYz+fzG7N00/QtqJsBOiL8K+mQ+Jg7oGI63MCK+1zSraa3+DmUI5ApN5yGnOtsQcQMrgWCeaNafqRpFNf2nDr7pP6Sx/xDD44STXPCfhMC6Ey8K6cdqIO9T5UWyiQS0HZHLUHM9qamZBmqjjsruwGxwR4jak0t4wxB/MlTaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MB5rT5Db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsAginrJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAe8Ao607344
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 12:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUo/RJ8kDLHbJCXRVEoIGLCHtsWiRsM9ovY5zCH6yac=; b=MB5rT5Dbn0XJH9Ql
	9Ph9wMx2cbjYHILoxa747lVBrmhx7nx0Qd27m62rk32Ewt21RE/xeXN9TmdAa0Xa
	Pg/kvduSy3wCh3wBybScM4/GiZ7wkCeOVSrAe/WBTD5PZ/z3G5P9dPhYuNBVN6hl
	wb9JS4N+PHg/AM2udfClCKHfEbNdIqoTroEC55rdybqjHfdweQ25stv+Mk4oedBg
	XFx/lVyxjBmmViAwtMAthzWR/X+iidkNmgJp04MbTWvEwqw7IXwafbGx174Dp1Tp
	xHYoqjpHoGRZ7o9fS0fojDoDssM2GZN1G4L0l1+u+JomiiIZwt5Wy7qOZ6N3pi5z
	+ZqSHQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asjbhsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 12:58:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a0761fdbdso17552151cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782478693; x=1783083493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FUo/RJ8kDLHbJCXRVEoIGLCHtsWiRsM9ovY5zCH6yac=;
        b=fsAginrJeA2sSpRxhSGzbnIPaPrO5Zzj18wWXDcsYUF8dpnuJAGA85e8/D7LEsI2G8
         rOdjxkn3bwOqrluBkM5Hi7OfFnUnM68tz9nMjtKVtyQoowqBoXCA2UijbpgSY3BYFSJy
         l279RhQU1NThc+IRN/9HZ8tl3LikAP7js1WCaptkCSI6vfJaqXDNLhdoVnpV55XovcPI
         WKEFIyguL6+E20kRUHD65Yn61ijqJBuN3IyswsvjkfgPWi3ayMaT15+s7FmnAOx+P2+t
         ZtKpDKi7+LjQuyO6MZ4dUUauDNm/4XRo/JuzfjcrYAdZ735ON9HkVu7HIiKek4Lgx+Dc
         Q4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478693; x=1783083493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUo/RJ8kDLHbJCXRVEoIGLCHtsWiRsM9ovY5zCH6yac=;
        b=aUQhxG47OTS1njImbm4xhDMrMJtk0Sz+mmaTkBVvjfHT9YrKpnN3FmurasTUcuM8Ix
         +rMqlNiXv/lRRqsep4nvvgjJ1Xb3o9h81Yy0zzOMAftQqJyLex5Vn3O79MwNca5DwzR/
         eh6IcbdYwmaOqlif+o5n/sqilD2E31HnlRDnTUZ4/CkvVJb4IBo+yyZXxTJAbUEjwbX+
         0kwGIP3z6/LRxuxgqFfd2GILX108UKWAUsPRcb0UnFTtKNsvw2ZU08BOCClgy3RQAqgy
         WMo2fSPghYmHtG9iVGko4832uGIdBQyrA8Gz3R8pLtF8KfXFAYFNOscNZfQhS7R4gWhi
         Qlyw==
X-Forwarded-Encrypted: i=1; AFNElJ+FoMBgRxvxw7QWmK6KRxy3VACJufQ1Sr8UIzfxGmD2mjgQShutm+2ckhxHLi33XFKcjDjoCpMViTfq@vger.kernel.org
X-Gm-Message-State: AOJu0Yykr7EQgJffV+2akYESDKb4Hjrb9/R//oeT08Iw7NuZD9hwvdhC
	igumY7vokMg/IawxrYizpRfBkCsHw9quD5k8WO54+mQWbzRgxJmlj34G1Xjfx//avBLrYxZJVnM
	H6z2NHqmrwlNc+MTSuOjAZrQnEtSh8vd7V5a+jFT4iRKQGvPKyCmJpxd/In+ZoVLz
X-Gm-Gg: AfdE7ckDFgSN4fSWJ9StG23WChpV1/9Q77VSLXZZ1/eT/sVywMcu+t8RKtN50D9CvM3
	/RQ93mBo9pgHprIhbs++qCf5Uvj5HphjQj5379/ZWWTULF4tnW5Os/HosGve/4EA/G7qVY9c81m
	ysqHRyVJSclkPQYiIM5SF0V8dylPJoBMxiuH2iqGMApKSWJffaMITauNTiHzuXJI3kkw+cpP0dj
	svUrMugvTKiLtO1MLVTz2RWlvUdowcTZcOShKakdU6G9zBLu0dxxeTDxivR9kp1P06P2586gE7q
	4aUofSPNeJmM/8RxhcpHOwyqQ2TjVpEB7vxiUPkaxlZspyGBZwiY++KNUuXRW6o0tUCs8Opt9z9
	2DtNlAGLZwYEIRG1RB1hgyGaQXGpHV/fK+hpnDwL3TfItzV9ArU10WfwJMjSBng==
X-Received: by 2002:a05:622a:5c08:b0:51a:56d:1bec with SMTP id d75a77b69052e-51a8b09f1f1mr5862891cf.32.1782478692761;
        Fri, 26 Jun 2026 05:58:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5c08:b0:51a:56d:1bec with SMTP id d75a77b69052e-51a8b09f1f1mr5862571cf.32.1782478692362;
        Fri, 26 Jun 2026 05:58:12 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51addb1csm95193201cf.23.2026.06.26.05.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:58:12 -0700 (PDT)
Message-ID: <608ab482-c739-4767-bb13-e6a6cd96dd86@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:58:09 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] MIPS: TXX9: Reduce TXX9_IOCLED_MAXLEDS to 3
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1782389357.git.geert@linux-m68k.org>
 <77535cc848c89d339fc5efe9ce1a30e017164a18.1782389357.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <77535cc848c89d339fc5efe9ce1a30e017164a18.1782389357.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a3e7765 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-ORIG-GUID: zCenj6bLqmrbyKkVs0AW3jdJfcl4qCrT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNSBTYWx0ZWRfX1cspWBUkKAdP
 HwEyA9WiRgKd+LLe8nqxwNlV5a3M7RSIXzH+eXUoEB8O6nF0xENqkm4MmIBbZN4Kd3udGc9SYjV
 XZDbdRhW9BjbLFC0c5HQq4TcLZj9778=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNSBTYWx0ZWRfX3VhqB/6Z/HuA
 X0eCaz/3blP4t+eDbKqUQiXQL236DUL9DlACf0stFpMiz2jTXnNQm9VfSUYFOr61l9edf+oRyho
 ES+Rne27mBQ8KIZrcYpNFFKJAAdtXpnW1MP/otEfgCVP1wQWHj/2iySJlqHHqi4R0J+Vdb4AFh0
 HhZ+cVwhZaZv371HhsA6cfKfCcExJQzBwuuG0ah0IZAOL071V8Xqx2rw2pXbUwwvVqmNUAuRGnp
 zhrM6Wb7FDzlmt1PZw/i1ueP1XeEJXv5QSTSGdqcdinTq8Yqv16fGzDjO8zhbvd8zQmR92oU7vW
 s3zxXvoj3ehriM5KX2aPJBkzhAY4cyvEBP+gK5N5vevmAXpZpWJ1j7gQsdxr5LJBOrOSW+VsYwk
 ZY4CqKpJd+/WqUGiwu2dlEMRKsmmYWoYdbag78EcWEZEd6G7JpJY7dDjWPSEw9omC48h7PyqecK
 kjJd6yJ/Nye/brWfNJw==
X-Proofpoint-GUID: zCenj6bLqmrbyKkVs0AW3jdJfcl4qCrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39031-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,linux-m68k.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0890A6CD3D5

On 25/6/26 14:19, Geert Uytterhoeven wrote:
> The number of available GPIOs and LEDs on the TXx9 IOC FPGA depends on
> the platform.  Since commit 455481fc9a807798 ("MIPS: Remove TX39XX
> support"), the only remaining platform (rbtx4927) supports just three.
> Hence reduce the maximum number, to reduce allocation size.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   arch/mips/txx9/generic/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

