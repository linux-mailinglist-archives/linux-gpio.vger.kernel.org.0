Return-Path: <linux-gpio+bounces-39667-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a+zHKgo9TmoFJgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39667-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 14:05:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8537261FA
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 14:05:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kcZdjTgT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jZekRMVp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39667-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39667-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38C0C30128D2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 12:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3371C438470;
	Wed,  8 Jul 2026 12:05:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188742B30C
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 12:05:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512325; cv=none; b=kZ1nmRRgKzVzXdquHrSPUIr61Rb2iD+URK8rzJaiPpejFgqu0WaYIklxuB3Vmu3YXFr1jufoJA2sFPIlwUmIrX/OJvziC6cZuB/miYjZE0cp1KZV24Ms8Uj2b9K3HxaR+mBr3HYokjFc1QeG0hMJ7XwyIDQLLe+hf3c/Q5gfmPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512325; c=relaxed/simple;
	bh=anAdk3+q2EYSJKGrPjer6ryFnzqyIRHCiaDPVv+7KGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFiJgyp6KYtM6TM/MNZYEKxzdwpfKRH7c/jHpCXKvU0OOc2qeb6Q1gwf7ZUnNBGuNwg4q8es+TJqFp8udY/2S12Fk60CMyxPZRKoY6GFG/nwuuigCOoyZsb3qSZqlbdYSZyNUjKuiRCUW6ZQPQvA5srbrEGVgrU6Y2ZUrBBlsu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcZdjTgT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZekRMVp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Dpj2751366
	for <linux-gpio@vger.kernel.org>; Wed, 8 Jul 2026 12:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQRmL0ZvTTxPC+rDobO0WPLzYlTh2sMuqa89A3z1Nro=; b=kcZdjTgT9MvJJlz7
	rgxJregTG9wHVWEJMjSsmbSplNOQzn+t3WtgB1puugqz6eUsdwkWF3BKE6/FgxyV
	K5M+/4X5dqc5v1m5iO2OhrdGO/xDEw/C08PYascbyHMgDkmrDJWqIoa/XAFU1Pgk
	NKCVixC/FlBYpTIC1sQ9LPrd0SGB38xbT/fnDFgrnu9lnNpvxUjWqLbSs3a8BX0k
	E22VeTNUTPNAsH0WdegC7UMCyuXl8W8qvssOZgymSMoAjcswrbBjrSR7ekIhAU7A
	EjyAR5VXDIkI10wm6B1l+E7keXpNjBgnMef5YUEQ634DaS+nIcSKHKOz++zKUWn0
	qNjDoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hhhcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 12:05:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso7332811cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783512322; x=1784117122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQRmL0ZvTTxPC+rDobO0WPLzYlTh2sMuqa89A3z1Nro=;
        b=jZekRMVpc3yC2XenhSM6WMcYY7gzqsHFzyHq8J+3UdAWSBAR1PQiy5ac2jWXkWwPwE
         MxMosoY26SelcDRawCAbg6Tq1RB3BLtGLpbg3ecYqf8sND0WFhFT5Wsb4gCe+IhhonVU
         C7TYgYFzbkROrQHZPy1Opep27XISzNaPW5LuJpiVHPO5D5kl97fBh+KfjERIFvKqZ9MC
         sTUC2/k7dYzxlNgoSalSGWntpNtVGXnODkXh/C4K4D4nCcfgogTCvG49ZgtwzffdqOf+
         Ia0bp3kwuzK8LtcqfjpUPYb8H4LehXgQiBGuVcTIJmVX4qdCm/oCYBVHa26CyHcMe7ls
         vwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512322; x=1784117122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQRmL0ZvTTxPC+rDobO0WPLzYlTh2sMuqa89A3z1Nro=;
        b=c/efs9rx7gq8vJQbkOAT3uKQ0VRgvzByC2kW4sXn5UcIQcOKPVYn9JPEmyacQgUWrL
         MRtxmkFX3rOJluo52mCOMBx7d6ms+/OuyFCqLW9RSlsUPpTKx8Nsa81y+bynKnvUch84
         JVg5oZ6s+/oTHtGX72kkPKG4vE42qfUn9HBOinW4XbwiqOvPvYfrCgfLkSc/4nCKCKTJ
         +hXMYIQcirfkojY20jJBWOIL4+PS0eo2cIRKmvoUnLKIm84+CGMLpyg0QkfFXNUUMkJ1
         lZYOkZM2GJE38Jud08KS+0pDs7OnBoolV86ujLzHLiP02dNlf9vAVfFl2NPF4uIs6xsN
         f5FA==
X-Gm-Message-State: AOJu0YytXvTvY840spPW3pk3kOkM5c/IWJwq3GT7darxrhXsTeeTz+N3
	EplxptS/YJ7Xn46i/BRt9sAF6vulwGmfQL1dL+knLcY3vqumPm++hbVv3x+nod+V/9xkP7Vuf4C
	xC7zLB8a09N5jcYN0OEZLZU9oeKhXtv4Gw1kLp1KKQgy7GvVwcpMrowhYkFc8cNKZovclyOM2
X-Gm-Gg: AfdE7clc+mRlU0QV6XdR7hXtwEgV2DKSY3Whvm68egw81rCufvaGDaLSEC10kju75RD
	tk+ffmMbqu7euypR3+IFTonLcgBskpkVwL5unFj7hOGts2hTibETD6CU7WgBTruJrZyukN3bZzI
	9qCuuwsIXpCL6eTZxPgm/xz/zdAd0KUEeZPq8H6IRYXNLee+2wELQ2jGEfNNkLIQ0Cil2+L8Pcs
	ryOVOUGtjGaX/GJ1i2mm/GMVdSAVnZnWriJejjx225sNAOFfbEDztjJjST7kh8EjzsFuQU3A8vC
	qf49ZJzjFnzwjaCDb8sTWKPNlVa9QAKm1NWgZgWzdJLT3gCvyH4z8r1H+baRac32/UsVyH0LUIv
	J9potH5vG9bRivyJZcx0lSti8X6P67dyxO95Jww==
X-Received: by 2002:a05:622a:1f87:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-51c8b2adf8dmr22444061cf.12.1783512322097;
        Wed, 08 Jul 2026 05:05:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1f87:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-51c8b2adf8dmr22443651cf.12.1783512321658;
        Wed, 08 Jul 2026 05:05:21 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6d02:5f1c:554:8e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm41315117f8f.36.2026.07.08.05.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:05:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mvebu: free generic chips on unbind
Date: Wed,  8 Jul 2026 14:05:19 +0200
Message-ID: <178351231599.17324.13492824194064659154.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707232358.1218077-1-rosenp@gmail.com>
References: <20260707232358.1218077-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNyBTYWx0ZWRfX19sHFwa7yjbg
 AoCGQZqjfeD+VMkei/nX2pTtETBbZLJ0RF89Q2AOxjAdzIfcZHB9bsl6T0GLjWOy2icFSWTTu+t
 dMDe2cLvkO7HIZ7sgzytgsvbBGyoDcSxoC9h6KfUvZI16T6mlHseKckrvliRfpyUg02rYWg+drK
 56+lUxPeFIiBqz+rIavdBViZoU7w+M/AiJW0QgbJuZUE2FtigIq2TyB83JgbF3ztbyt8CNT/2th
 ShDYdNJ9w+XDnOko/qW/C3SD1SDQpzUdaohicPmsQcG2rAoM4mr8buiGm0fKrBs27P/K7yF9gbo
 5CsClFZXJU9RNVVodOFIYf0QmDlQKmWP8mR3xGFBZWCgOsEif8e0ycDVXSwzJl8aVF8eQojq5Zv
 iz4b36/Xar1SlU8nfwk7NF48CAQdRUDvsEk1GYJoabWqTkcaS39f5yM9RjO3lBF/BFQvK21JLfu
 Y2aVk1w/uH8KAzpFViw==
X-Proofpoint-GUID: LLlPx-4EoQ1WbMqrtBuzAHP7XRWsWFY1
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e3d03 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-VwHXlPuIgyaJlrLoW4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNyBTYWx0ZWRfX+gWt4FHQiYfL
 V/djxQI9Vd1SAXy/U5ALGsawKXSNMF22kcG3kCN6BSBj3XgT9DbhZukvqlErBpY65rKpcOWsLx9
 bvp9nPpSYwx/sz5tZh5KXCy93br1v6k=
X-Proofpoint-ORIG-GUID: LLlPx-4EoQ1WbMqrtBuzAHP7XRWsWFY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39667-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:rosenp@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:jgg@ziepe.ca,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A8537261FA


On Tue, 07 Jul 2026 16:23:58 -0700, Rosen Penev wrote:
> irq_alloc_domain_generic_chips() allocates generic chip data that must
> be freed via irq_domain_remove_generic_chips(). The devres action
> mvebu_gpio_remove_irq_domain() only called irq_domain_remove(), which
> only frees the generic chips if IRQ_DOMAIN_FLAG_DESTROY_GC is set.
> Call irq_domain_remove_generic_chips() explicitly before
> irq_domain_remove() instead.
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: free generic chips on unbind
      https://git.kernel.org/brgl/c/b11c513ad943f35cf5e8007d3a56279c79b7ed4b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

