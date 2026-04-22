Return-Path: <linux-gpio+bounces-35359-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ3yJffV6GklQQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35359-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 16:06:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DBB4470D9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 16:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 863B7301ECD5
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 13:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D023EAC9B;
	Wed, 22 Apr 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4dolBQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGP6SaXQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0D3BFE40
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776866373; cv=none; b=sefJemd1i1cRs4/AhQmQFvTK1wXk5TQ/gfebwemBKbJTnbZL8OZQldaK1/2GVz3VN/nh6AGuTmbhG5PeKdLBY431oUi/mVyoa28frbnk7Q62w6DP0Ad6B3Wp+0U22yrt53dz6UuQTZsj0vZqv93fR2zhHqIYp5InqifPQl0OFhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776866373; c=relaxed/simple;
	bh=IMF9AKwP8iOXxrvM2rinSGWmnqq5UGxTRmKfXU1O7c4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OOR1g5Dz1bF3+E7GEB70GHf+EJTBv/CsyyNZRDpra+bh7IW5Au1+G2mqRoj4gLhqY1J4aG/CwqqlgQAFm3RcD8K4mLS+Rmym6/BBWTdHcVKUrTFxBZ5VFPXKKMIZfPCa6t5RdGr/l4wl3tjiZSXsalRq0rQ+//vRKNx2XHNFObc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4dolBQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGP6SaXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M992x11442696
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 13:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjUPUnze44QkHLlS3g7xZj4Do2gjEkO4KGheBr8e4BI=; b=i4dolBQnnG8Xlyf4
	lnxTeoyTnT2evUYb+aNh/Eu9lFGn863vK8tZsb8py/UQn/AkHjxFohL9ebw3pDq7
	U+UruA555inmfIuPFwE14/0WtuGHiEHE1flYbAE2unN2QG1TlRiA1Ujn/unYDeeR
	eH2JLNie29LjkrxIW3TPs0BYemP6G+Np7N9WZU4BEsAHh3uSo03E3cGMBYZNlGw3
	k6kBIGofPGorLWgDA0EFx/bObzQOkFEkDWOgeNhZvcEmTHSIy3xfSWuOmu4UuFMQ
	riZMTOZADJRWU6FLValIdmyuKL50hX0bLeCT3/Gbxy4xXtKfiNZjHlj+IRmw3Bwi
	CFM8Cw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfujpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 13:59:31 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-79a670a5fe9so134906907b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776866371; x=1777471171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjUPUnze44QkHLlS3g7xZj4Do2gjEkO4KGheBr8e4BI=;
        b=TGP6SaXQUoaHr8La56Sc0EaleULU1kottkWA7RVj3y7vBA3sUqMKOOStxUXDocu3BO
         OZyMRtY+lJZPvIT5hLXbhmmpnYFDgmDHjvFSxAzzM3tgwhcYYq0HJjR1wBvPgIXb8Yu0
         IujOAFvlwtOUDdXi0Lx7ojkqRqi3XnNbsV6XL9BiqorurlSB4QccemwlGh7XEoNDOwPB
         Pa+FxdypHguvIwIfX0fPqB7dGLyYA2MAJifiY+atj/0Z9rX5qvKR09YFozemLVjNnEx/
         NDLWawEtb4Y7O2AaKpF65wXurqnWD7+XtnxNzYrMnrh51uemGsdPXeYIpUpNnKt3rAQj
         t4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776866371; x=1777471171;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjUPUnze44QkHLlS3g7xZj4Do2gjEkO4KGheBr8e4BI=;
        b=hOSMNKTiDfbCOYD4uagMcfedM3qqku4AmIctu/qTJoqRuW5+U2LqUTOqkKGg20P/sX
         /Wp9amgJSHohKLJswQZ9FFm6m7Y7MeIcN8eBlRY0YyuCM2d7bAStyjyiR5ueZ3DxY60s
         4ytErRSLDox+MCIyiRO1zhtKpVW+elkY6M3XP4RoYFzxLa4xbdVXu25df0+geG7vAJp3
         PxndTHZx1AKwPkwTvDmJb8wYorvKoeUH11RNetVG+E9b+NflbKmb7XOU6+7SJd4HjSS8
         XjwbKtNh6plXqNz9kH6hg1NrdlL8JJedRsveOPT9Ne2zM17jQbTeFjfor8zf3dX/kD4V
         OV8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/bY+pfio6dvCjC65EdsRiWIAgmKk/wARNpPR0C9oHqR7odATvGykLCYxbwo1rG06gFLkswdd99Sk3+@vger.kernel.org
X-Gm-Message-State: AOJu0YwZot9PLoJWdZdtD0U3rzOEsS9BvPF2MoxlFGA9KkI+gAbvJtbF
	G2FoGNyoLcf45esJXbkraWic8i2BC449td7cfj8KDVWW1yoOU8WC/SQKCYYvgtnH8FoVSlzlyAz
	uGlUD3c1V+WLuR02p3VJOUDEh4i5Z5Cpl+AatCQ/TEDq3rP6CAISKY2eN6N8GjQuc
X-Gm-Gg: AeBDiet3D8WV2nmtZyepthm+vLdcsy3WMxHtl0oKgNgOyX7/H+RSKDioIxpr9+NfwGQ
	bGqe+NPZa6xKb4q2XsTRaCGGJAHHsH32Xi9fpbvBu4HGsRr8WDmPpCgGNaGASA2/LYiNjM86s4H
	GgcT9dAZ7Az5LPvmBOHdTaiiV8NLwbdfd6MdbhHTeOj7uYCASw2WnNn4j6yoIXGlwkGL0aGic20
	jM7HiQPqcrRUhryoPK5gVpMkMFY8RaZ8dvWVIk4U0ZDWYINlWu4bH2lRXZH+FNPl9c8ugVzMr8B
	csMxanpwP3W0NY4o0KP3hUPh2i8Ocxs02i+eT3AoLrnJl5M+1qTDj7ahn6Ke7Pdb6zJmIj/58iI
	UY6TlnQDxeLZ75fTzrtzRr9+ZT/5Rj5lFdEbD1BIiY9FaCQTWTSenKw1FatWP/UxRlZJpRtrU6E
	rprzRG8eYe8+s=
X-Received: by 2002:a05:690c:399:b0:79c:c51c:7f4a with SMTP id 00721157ae682-7b9ed002905mr237930847b3.46.1776866370929;
        Wed, 22 Apr 2026 06:59:30 -0700 (PDT)
X-Received: by 2002:a05:690c:399:b0:79c:c51c:7f4a with SMTP id 00721157ae682-7b9ed002905mr237930497b3.46.1776866370488;
        Wed, 22 Apr 2026 06:59:30 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee9b22e2sm68141337b3.34.2026.04.22.06.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:59:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Alban Bedel <albeu@free.fr>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260317-descriptors-wireless-v6-1-b19ecff9cd2b@kernel.org>
References: <20260317-descriptors-wireless-v6-1-b19ecff9cd2b@kernel.org>
Subject: Re: [PATCH v6] wifi: ath9k: Obtain system GPIOS from descriptors
Message-Id: <177686636868.2964412.1526610010779202688.b4-ty@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 06:59:28 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 8NvA32LygfQDsc2CY2QXmKvdRGK7n2sc
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e8d443 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5V_q_8t2rYx36auOB6wA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzNSBTYWx0ZWRfX9tqxQSg5k1m0
 LnqaaBsVErQR0Az/3d59JPn0Tgotbn8HKMGhiDZzflQ2yoxjxOTwABKuPa+IPnQKNwEwjB0b5E8
 dTONfyDgtZ2LvmNhVQ4h45l9gHPqttcLLPcUg+s7Wr5mIKs7nPOUtYSemrHSMgZ9OJBheaQrhOL
 BuTaRxfchZF1YQcAEhWl7ZDa5jBYFkWhdVqqZ8A+Ndre2yay7PdlH/g5PVJBmuVuxoWestSAp/E
 9YjJ5nRPCIsb74+inttwm5hy72T91JfNdSSPVoh7kZ8FNL5roOTrInQBFAfnAOXqPdyjDEaNsfW
 RR8PBaO1tvRmbzi9eGbMNxvHIBv4J8dB+LUX1MgLj7Y0m8D5/qLDiS/4rP2BSSECPOr674S3L8I
 GUUGcox0eQipwaF7bw4L3jOQw2B0ooSSNz1FjCaoyMbSHu+vW4cVRBrV4kOZn27vwjtE9lX0LRh
 t6MJoVbmX2mvsZ+y6bw==
X-Proofpoint-ORIG-GUID: 8NvA32LygfQDsc2CY2QXmKvdRGK7n2sc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220135
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-35359-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,arndb.de,free.fr,bgdev.pl,toke.dk,kempniu.pl,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83DBB4470D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 17 Mar 2026 09:45:20 +0100, Linus Walleij wrote:
> The ath9k has an odd use of system-wide GPIOs: if the chip
> does not have internal GPIO capability, it will try to obtain a
> GPIO line from the system GPIO controller:
> 
>   if (BIT(gpio) & ah->caps.gpio_mask)
>         ath9k_hw_gpio_cfg_wmac(...);
>   else if (AR_SREV_SOC(ah))
>         ath9k_hw_gpio_cfg_soc(ah, gpio, out, label);
> 
> [...]

Applied, thanks!

[1/1] wifi: ath9k: Obtain system GPIOS from descriptors
      commit: 34a5329beee86a22a446e27eb37f06caa63479ca

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


