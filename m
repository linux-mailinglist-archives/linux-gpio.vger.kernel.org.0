Return-Path: <linux-gpio+bounces-39305-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HMTmBsztRGp83QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39305-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 12:37:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6539E6EC353
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 12:36:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K9LC9yvg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EBhjt5mb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39305-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39305-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E28F30891D4
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 10:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BBA425CF2;
	Wed,  1 Jul 2026 10:34:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E61F4192EC
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 10:34:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902098; cv=none; b=CX6rec152McjEumFOe9DcUgVOB3p9HPye8Smd792HdzYCWdYJUO3GrlVNSBDoobhKk/yAvZIBoBN7p41UvBNSJ/yPDXE9WB0kTSflFRiminkBubjTsPxcIe97PclKECE/408Opmu6v2RqdOE2hh3lz8Is0+sNkXcw0zsbeeMwGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902098; c=relaxed/simple;
	bh=WjORSTQJi4DjiuCw5yf+DmwwcwYF23dZqQgQowEN+Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jZOEcLYKDcSgsgDdK/mTxFNeoMHtWCVm6plMVPZFQQ9/QUCRLI/kf3Val67gbtuvs1qEShv9hjBWp7eBM1tzrcbN5uyeLJj3x6mVAD1wgmk/VWjitKEfpDfBX4SZbQ/ilOqXVltskBBb3sPEvUcH9A15oWEKykfpd60Kw/9O7qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9LC9yvg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBhjt5mb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8XwU673206
	for <linux-gpio@vger.kernel.org>; Wed, 1 Jul 2026 10:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DfcHfQ71nCBzB1qK6laVbaOukx9owWta9clgzqygaBo=; b=K9LC9yvgKeDK6fsB
	GGqhPxUBMg8vkJCzVZlkwMQmUm+3Yu9E8aEM9qRoxNzNcjTeTUhDj/tCo2YbyJjZ
	4Nuzi3TYy2m8eFYjQdDF0s4ieV9myXuzie5X9T9t1Kz+GfbpqVXGVHG3iWzo7tae
	nukHDNvD8BSTvczsL8CzbjIjOnN/osOTfj3mFu7lFqCuqQG5ojWtO9Xvf7cGfC2q
	C3O59vcotMCl2FLUUjiHJuJBmrmfZVEmNYMQXIKq0SexFdtoMnoCP5lvZWGCumV5
	DQBy4trc339l+Jv3o/Yg0OzSfDepZQ20YwuTgZ8JRcH7lQ1vna3KqHuxl2CR4mqD
	+xkh+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502urb9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 10:34:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c364ae3bso58202185a.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 03:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902091; x=1783506891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfcHfQ71nCBzB1qK6laVbaOukx9owWta9clgzqygaBo=;
        b=EBhjt5mbAo0dwvM77lkaA2pBtzyGv2V4NYpOr4GDJt+OlTBa32c5K/7Ao7RXIpvDn8
         bFl5ejx4ySPMobYEO7439xEDZJpqBG3ajDJobFaPtd/cqAGSPb3ToJxGvyJC44Y0b1j5
         L1EAVzbySvmsTZvxi1srNP4LvjRuF6/oZ17pUNoPohHjyCAYKHZbqzCT2ZIV7U2aDUvg
         ZsiQjZa5+HjR+AcmbJcnrxy2vlO4ENVHUsLBP7aJwjq9pytboAEXwcMVLunllLX7Ha8M
         dUknhxY8DADOK9L8uFUFxAX6iPlfxdP5Fi8G5TSxaCWhBZPN6S4JL/2GP2DRr+kf0so/
         Ue5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902091; x=1783506891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DfcHfQ71nCBzB1qK6laVbaOukx9owWta9clgzqygaBo=;
        b=CtOOaZ6NLU8HBHeXaK+aNwsuvfLD19O8TBOz6Hh5ufUlQpmp/7RXEJZQ09pP5GjAWp
         K5bH3jrS1jXUfdKp7rADg9GJVxXxjMx4aklAi2LY9j4PwBAWesJRLTIvOq/HB7vtbSY8
         oribA48HZw4Y02W0UY+9DEhJFNReXmXboBk4fbmcViw/uA9oKl8BGCPb5XtGptp0EEaB
         erFQ6g1Edmc60FWjRqeIWYEUW0QJfx1zq2iRfe5UA6JwFYWuBULc6c7i9QdJ6FHymO/v
         BPDt3LwjcNYbNGV6W3kCU4pSS8vgC7H05e4g1d++CGY0Uni+2b4NuVLvqsMAsH+j/cSl
         xBSg==
X-Gm-Message-State: AOJu0Yxf7Gs2WLqaZ2hmCra2EharJ1fED6yj3t8PzFgfG2cjKur9wRLG
	tcRRpxZ42h+OMqOrftRhymY7xNjkSBWAwgxokl3DCUfB7qZC5HNeoLGdFMWvL4I7m5yowDowixN
	xcJe19IW+5t6Cj6fv9bE0XM/IfAWBGN/ZV16E/WXRh8Iv6eGaklITrK2UJXKoByYqWOzENPvr
X-Gm-Gg: AfdE7cmlobP1JRfx+5K/TZwFZG5/VKoji9EkF/P38ShRFCphJFyZnCBtE1Hz/WCJcie
	q/w0zT97iq3kjHaUOG1DA+k8z1glPYUoLQfZGV0Vj/c8yZRcysSNBVTRpkRdHv+sEFttjngeNkt
	B+GqRZpiSDamxpyK85k5dVbCJOp/g/amuPx4koNzAKu5AH9zt8zcOePvLHHwFgZzNADsK59NowU
	CpFntZ/YsJWxkUq8XCpuDr3QbRhx4FNiPJhMrvJh5xRMhO8ZC1q5eS45BLbGFKXaGFFA/noXvRi
	ZY2ciap5SqY4U7PF386J5DQ9EDGTpo2jzL7f8nh1BLkDrWFZCxSp4gT0m+jJX8GWG/snjeP08SA
	uJ0EV0T1SuATLXC7YuBmX3g8FfCCMfeLN3EgcKCg=
X-Received: by 2002:a05:620a:2a01:b0:92b:67e6:4b66 with SMTP id af79cd13be357-92e7850c8eamr152377985a.61.1782902091306;
        Wed, 01 Jul 2026 03:34:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2a01:b0:92b:67e6:4b66 with SMTP id af79cd13be357-92e7850c8eamr152375085a.61.1782902090869;
        Wed, 01 Jul 2026 03:34:50 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4718:fd49:e3d7:676a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be810c02sm72072395e9.11.2026.07.01.03.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:34:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mvebu: add wake-up interrupt support
Date: Wed,  1 Jul 2026 12:34:48 +0200
Message-ID: <178290208605.12495.6204770182196326158.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260628230202.1209991-1-rosenp@gmail.com>
References: <20260628230202.1209991-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX0Ql/CvQyI1Hy
 ZmZtgB6fjEQQvQHClKB2S8DeK6QyuxyqhzCQIrn/wIgGQpvIIpSHf7Lpj5c/9XyiXUXRw3ui5Oo
 0qcb9Oe1Y4Jd3jFXF59Y6Z2v2AJZqlQ=
X-Proofpoint-GUID: JLA2yT7f1ivpBUR23joVw9ZWHTJ2UzbM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX32Mg/y2MhwRp
 tYMreFsN/Jhm+49BjtVzn+49JymJRh96ZtTGvhAPqzTZ5I+3ODa3QHKczSz0Kp78zkEKC9k67kN
 1juaL/XtFOTcP6xoMhJLzDw37ebSso39655FtX/YPBBapou+dFxB3+tNPvHNpV5RmyoGHn31gqJ
 SB1Vw3wM4H/iLMzBNuTGZXVJNvIePRtctg1r1NeBVcOoXWVqPou6lIAr3s6JTJRwwBJoIazC/KX
 C33nhGQrcR9DlVTqV1LfdR1oIFcXQTjkKvqyJNzli/sCDIM/phEtIms2THtlFYNlmDp/9/ufpOO
 F2T8ZaVEvwKNaGID08vRUaKVJNSOklT+M4DRIU28YqNAbYujhgf5D50zpQnoTMVQ595/3zXsMz2
 oM5ykQd87my4gdJJ52cdDTqdLH49yaB68jHzBtFE4a9diXEUkjamHOKjLPSwKmI3lgltMAmm2tX
 xOvdU/vkUj1szROSyXA==
X-Proofpoint-ORIG-GUID: JLA2yT7f1ivpBUR23joVw9ZWHTJ2UzbM
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a44ed4c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zQxGFWYXtF5Aa-UEy5sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39305-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:rosenp@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6539E6EC353


On Sun, 28 Jun 2026 16:02:02 -0700, Rosen Penev wrote:
> Implement wake IRQ support for the mvebu GPIO controller:
> 
> - Replace unused irqbase field with bank_irq[4] to store per-bank
>   IRQ numbers for use in the wake-up callback.
> - Add mvebu_gpio_set_wake_irq() that forwards enable_irq_wake /
>   disable_irq_wake to the correct parent IRQ based on hwirq.
> - Set IRQCHIP_SET_TYPE_MASKED and IRQCHIP_MASK_ON_SUSPEND flags
>   on both level and edge chip types.
> - Set IRQ_GC_INIT_NESTED_LOCK for the nested irq domain.
> - Add missing <linux/interrupt.h> include.
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: add wake-up interrupt support
      https://git.kernel.org/brgl/c/b67e64d4eb9765d23010f423e29a627a25f5ac2e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

