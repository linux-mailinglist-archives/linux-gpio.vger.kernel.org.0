Return-Path: <linux-gpio+bounces-38179-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aI7dBVMTKGoh9gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38179-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 15:21:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 613A86607F0
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 15:21:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fkrMf1wO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j1SSJZKv;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38179-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38179-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13B75308C5F3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 13:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AD7233926;
	Tue,  9 Jun 2026 13:15:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7B019CCF7
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 13:15:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010923; cv=none; b=VSvjvRWyUd9bornX2pNzvKgCBDb2ujaGZ64unCRbd8cZGOuJi0dnmJCCOTPviXidbJFBHQlt0wKiXSutr/z4dKHVAMt6P7d/9FYxchsdL9J1SKWRDtEL7wYpw2tanKV3QQD2PEteFcwFUnh9bEWGW3iXo2yIXIJYMTxKXOLAltg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010923; c=relaxed/simple;
	bh=Lb/MZXyMjJM/nnkIwYyOQRhGKpbuBykgD/YE4HiGR+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCU+7MtX23FVsemgo3SYRpgMhIAgFZTEBYakUpGxUBSd1QAGjE+JDuTFXZcMHNLpNu9LCh1ldo2dPoMu7CeKIgIH3ocTf3tBuyxIlIVbXYZz5osgPPy3U9hUxkOWiaI6q2vfTeBTlROVQgiYPFNDUWD28mtfhUu+0tXZG+QQtKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkrMf1wO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j1SSJZKv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Clc992247987
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 13:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J36Lv/6KiRlprtNoYGijhIbdhXLKcydnuqjl+rojm0U=; b=fkrMf1wOKUAkVzkT
	Ran5OLFziSmE4WbKyYaeT0mm5NG3AEq9xoPWPg3Efso18tni7lmwHfJIukw1BOEP
	fS7YjRc8lcAZt2pdIGoyVcuohfoke7KvqHoKjSwVNcUYVfifoCXiQQGmnw1G6yH8
	lMtoTmqLYVDNzS01fGqC8Dc4vyfpRIq1oDwltAtJB+Db1xTcwTbGJtSvXQO+UHV2
	gaAG2BxvP6dyQ6/ZGqNTXMXbmhC8o5wsoy8Jy1qzOsPWbeqVh4mpiLQ7Z8Em3uaS
	hj+841qOhYp6I1XJNmsgUo26Nnjsk+iNkeu41nK6XobtlJvMVbeLbvDuhU0/KqF7
	W68BpQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeesreq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 13:15:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cc6b92b8f3so174081137.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781010921; x=1781615721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J36Lv/6KiRlprtNoYGijhIbdhXLKcydnuqjl+rojm0U=;
        b=j1SSJZKvxa1HJF1i9XA/K8YT8jqDg/L6oFkA/p9QC9jIjgmLWSCgWFBzsScjkTLyBv
         w0SVHQFy33an3iBAXmYeqHNlZhHv+Zqro/QRYpQs9VwAWwXNtrBX7aaWwi/3X882NvNJ
         T6bcAQEt1LQCll7P4nKt568yhs5rSz5BCARbi0F09E78tvPp2h2DHMrZ5aZJLky3XEut
         Dr9+tuR8Puv9gmRQaoRThP7ZWS4qsouQCYuJ6yMFSF35jMYkv3NHwcXGQ9YmhtyCrnVD
         qb2U0vwTwXufUzeRREeTu4OP9W6l+e2yMXJGo24Azfqb2dPFWqU8Dw1M0EP7iLr+9iXT
         bJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010921; x=1781615721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J36Lv/6KiRlprtNoYGijhIbdhXLKcydnuqjl+rojm0U=;
        b=mDc/MwNaaNm0MA8DKuFbou1zgnP2kWcOe+ypChn1+jxMKuC9koAvAztRV4C/ojbfD9
         xfC8qsO79y+E70aaT3FxRJIBGVAjD38EoEictAEWPh2YYl6rl2pkpsxfusmttFKfElu/
         tmx/2NLUyJBdOXOd0Lk/Lu5MihJxTiEbbiHh5PJ33134L+uvPgUUELNGWv9vKq9fBYSZ
         lk3gWN7b8HQcBZUB4D/gqHo4dvhoUQwhhqUgGUFm098t1Pd5HTpRTLTo+bpID5srkrv6
         IWwXTgsLP7FWIr8r3tW+nfuoX0bGj1fB+PLXV192G66w2U27cx6QedmD+GgMjcLghgdd
         40yQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XYd5s+7Z6oe7l9wmfHAkgXTSpLAfsbZFwa1ExU4vnDqEW7EKQ7z+Gk2LdeVAWtildJF34KpAqoDTm@vger.kernel.org
X-Gm-Message-State: AOJu0YyqT0Nr0wUkrQxUgyzhv1ID6d392okCjpdcoGWukWAqAaSj3udn
	n7cLWxmKdjnLXYoJ/GIJhCinEfTlhStF4UeaOlI+uou1lp7NCar6WRYh7Rfo/whDS/SJDqRIR8B
	B/r8qe7TAiHXvhDkOVP6UwxuatdITfYaghlSK/WzJWxCarLp4mpoliv3FhvtaY/+Bo1W3FcS6
X-Gm-Gg: Acq92OGIY5PQ1mNM7VUHdZKrn4WQJo6uU/p35kE0dHvZxF5CNnM/hwAlZv4GxI9gQsE
	Nb7nkRFXV3Mqd1YLCFcwLeyOhACeMEvy5jmoWrfDXdgFJUVbvPXMCQ93Yvu2JLSsFPlZUstYLkw
	uTkBZBsclW7oM5hMi+2wKrB0GXZWBJceX2153ptY71ru/uzr3/tip16spdl+pgkeJGxTZ8AVX+y
	j3N0+bwG1heFcZuYKPXBT11H+0Bk2Yu/wlRFn0mzhcqldQQhm18ogOrnFQbsMIo5svNuPbZ3zjb
	lim9ZO637w0PTi35vv68uRx0FTdPFgekL2aH26Re++Xk4Cu9jEVsR5TXqTxezN6zTAYMOXkbgMz
	CfeSMxw8iIMMwuksMQeihWJZzmcwLGQGmsMYmfjZMuoCWC+XxOekXh+0x
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr425184137.5.1781010920627;
        Tue, 09 Jun 2026 06:15:20 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr425100137.5.1781010917727;
        Tue, 09 Jun 2026 06:15:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm1041955966b.50.2026.06.09.06.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:15:16 -0700 (PDT)
Message-ID: <3876e21a-8462-429a-8fc3-da977f732743@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:15:14 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: eliza: Add missing sdc2 pin function
 mappings
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609-eliza-pinctrl-fix-sdc2-gpios-v1-1-cce631b7e7dd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-eliza-pinctrl-fix-sdc2-gpios-v1-1-cce631b7e7dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a2811e9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Jll_wphTtbybbikUofUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNiBTYWx0ZWRfXxfE3Gc45OPaI
 wEx5zOu5GOjxsGGVdOa7B/2tQ7idYka4dnfM6K63MwB36qH35T/oHCrkYp5i92qBqNRig6hP3xy
 Kzqw2GkhRmDhHI+NPu7D4i84r6bQRk4WXD9KgOpeLUgClrvNtI3BKVlRMZfzllU7g3g1kDq+QZO
 9zu7kOt2r3HK2EliwS08NDbYKEq9fc0mcBuXvFCziQWAaOGeINTKSVO8/VQRe0sg7a+7J0kfbV8
 OSb2IyzocmkbSgglrAIY77JaBIaPFKBd/YCGb4/6KtED9wkXWgiGrNJMOivsOA4NNRPR+FnpplD
 yNZ/XCuPLnT2YWSXa9TsSfGbtM9+5Iugnf7h9IBpwteVTO46LKuBXy0CwkoO7ZywanYumpun96q
 VtuGB93ifJ8itltdWp61IkIA2R32acqTnz0tmwspes2GXPmSlVCARhthfFPsjFFoJy7t6C464C9
 qNUoaDaRf4CCxH/Xcfg==
X-Proofpoint-ORIG-GUID: 7ng-1bqKr0OnCy3yuzyihFGkxpwoD5Hb
X-Proofpoint-GUID: 7ng-1bqKr0OnCy3yuzyihFGkxpwoD5Hb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38179-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 613A86607F0

On 6/9/26 2:02 PM, Abel Vesa wrote:
> GPIOs 38, 39, 48 and 49 support the SDC2 DATA function, while
> GPIO 51 supports SDC2 CMD and GPIO 62 supports SDC2 CLK.
> 
> However, the sdc2 pin function is not listed in the corresponding
> pingroup definitions, preventing these pins from being muxed for
> SDC2 operation.
> 
> Add the missing sdc2 function mappings.
> 
> Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Interesting bit that unlike other platforms we don't have a separate
group for clk/cmd/rclk

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


