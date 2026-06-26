Return-Path: <linux-gpio+bounces-39020-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lkw2InExPmoMBQkAu9opvQ
	(envelope-from <linux-gpio+bounces-39020-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:59:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E86CB2EB
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:59:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f0kZtOY5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JyjarP0h;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39020-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39020-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D30C30591B1
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 07:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB913E44EE;
	Fri, 26 Jun 2026 07:59:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236B13C81AD
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:59:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782460777; cv=none; b=tyW6xdcqP6Q1Jd4O9oebpMkzq3b9rqARqC4leiUuQQGfmF1eQsqpF+9MwK1iiI5yof1iDPM3LCgc9E/n3sd+O6oL969oO2PbWmF9Gwpa3wVQ+hvsVkJyhJ3KHM78eS9jzg1YOrcR15CLyR8633Dav2/9EK4JyqZ9FjTjh3crH2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782460777; c=relaxed/simple;
	bh=eU9erqxmOI9bp1qVsL48/3etnRiI+uwIYpYoo7incyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxlYQhR4hYq+3EJue6CPxaXYagITeDE6I1gg+RSZyeaJ4e3IRM6lMwCqWzD+5UnZS/0Zizq12VRI9uyRn4GI1fNY8qyarqqsvKqP5cfZJfmnPEfyIzi1Odv92IxrxXFVSgO3qL/toY5rf3vR7gip0bQF16VmyGlUSWGNo0MYm/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0kZtOY5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyjarP0h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VjsT320964
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a+neq75XTJBxmxfe42uxCnPHK3v4gLkEoljGEQEm3Po=; b=f0kZtOY5Z2QPAWhV
	MbpoALzKrNivtW6K5Sn3a0Ry2PfO00K4WKFmYQGU0a0Kz1yS5YxHf+NwsIV2HAoZ
	smu2ZBi+uBMjR2sz8DYtzCR635Mrxnzh1Cy4qGudjD5FXb7AFGu4XzBrcJZEp9JC
	OcFF+TpW67pbePYn1uuFGVxD3rnnBwg9ueMyPbXpcOvT61YheNKAt8lk4NE2X66x
	PJD417H0Je5Md/5NLH1pgH++2MKjxZAeZBPUKrHAb9ovAd2/TtNS5HZ8aIKLeCTM
	JMk9rDjXlOhc1Tslq+kKQvmGIxkh7oK10KzDeI6vNY56hYiq6wFWITc/liVJQ4zs
	tKc7aw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eeq9r1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:59:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92adbf757cbso21210785a.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782460773; x=1783065573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+neq75XTJBxmxfe42uxCnPHK3v4gLkEoljGEQEm3Po=;
        b=JyjarP0hXSPsUrQiz2p8XBb2DELqPjX9oZAHkDeJJSiatwPxNIDWAfWwLWQnzlur+D
         Dr6S+wmB5ZEh+vXa9RafM9GOO7ahH9xprT9T5VPInVCvewuUmu4PkPEV/+Q4d8ZmqiSs
         bKAFnPg2Qtmr7v7EdOMRQnm4Fh+TLJab++jGSBnERCXSw1j2MwgIYfYN0ASciZ/MjSz4
         vQi3TvMV+3qZgargYMM09fV08TKo0VrVFW8Pmxvr8kGmXtjyAmk8vma8tDFpt2fiPJox
         pGiH41lGJXgrMZ8lonUEubJpdwm/B0jazzMBNDTg+nQtb8+/iI75foXcVC+qZhs1ZI5X
         TR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782460773; x=1783065573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+neq75XTJBxmxfe42uxCnPHK3v4gLkEoljGEQEm3Po=;
        b=BZ3IO85NmLOVRcbnoIgIqgNJ558Ahwz+TmVX0+cpGg9uctNQENQG2BCIg/iOr5uYhP
         WqWd0Z0X+or1lr42DScbC3Bw67nR8mpJ5rZhgQkpnBN0rfFI4TRbJEObTRKGSUuWOYjz
         K4TpPk2wZ6S08ZSH8G11DXLBGnkty/3xakg8i0gfhyk/iow7qlqVsU2Wx4lBeZ63DjFH
         PwKP7UK+Tb+pPQBi8vLju8a366VNrpQ9DoVJ4yCHPgycCsGB1vI7hqLN3NCSK+HQSkAN
         jAjkngEmqPxIWXykTjZXjtmGnip86kJ4/uhB69tcl2+tSyR4j5tUhu5ZqDc+CamjND26
         Cu+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9d3YHC5d3wrwQqSihu3RqZvsiLM0cWJLBls5opMI4/0kgIGC59R9tV71juprWSDYibxOnZF2thtjOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBszs8x9gVrqISre27ak/x3VmD6oo4xF+ED74gf/sdVe6cfEy
	bO8UmGg7B0SDqAh7HkWNa1WAhNJvM0Di5iw+6jOk63MXbLqGDJsRszggH8YMlpu4cPZTSW6m2P+
	9ciaowBEv1T3OPS/a6XnpPZ4KAyRmt6Hm7ae9jyxDLsDzCa0GO8MdzfMct/Rlc2vc
X-Gm-Gg: AfdE7ckVf/nt/1kReKIee/5KImrAXo4IAj8xsHNSx3RQMTPZiJ51aU2NRkmauA3xUBr
	UgnGbFVFeFW83LoOJMWUcC7QCGUuYfgS17VmpR8pjy50aEoGFGU4/B+yRCVeG6rc0ouRrnxtkQg
	XA1B+m9/HJ8sANBKdES5jloI4JqMTZmGDLtbVN/gk4Q/335s3gyybN/eKb5ZRG9A6rPAb3R5OUG
	vaTYUi7gz1esuncDIxxjSxMMZumuKH45bDlf+SNzOoyaPGzDM+M+RKsILwB+f8afqjQ8gPBoO9j
	mPoXxEQYGdeyvj5MUFEsS3FlJE0UAHMs0A5TVZo9Sbbo0qSkoGEQwPmS0mXrPrS8UqGMRfeWs5+
	g/7TRojrgR/A2MCEl1w+uk17TqI2Ckzkt0PtPZr8=
X-Received: by 2002:a05:620a:6910:b0:921:700f:fb41 with SMTP id af79cd13be357-9293cae4464mr896106185a.49.1782460773239;
        Fri, 26 Jun 2026 00:59:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:921:700f:fb41 with SMTP id af79cd13be357-9293cae4464mr896103585a.49.1782460772760;
        Fri, 26 Jun 2026 00:59:32 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9e77sm54432355e9.4.2026.06.26.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 00:59:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Igor Putko <igorpetindev@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] gpio: tb10x: W=1 warning fix and style cleanups
Date: Fri, 26 Jun 2026 09:59:28 +0200
Message-ID: <178246069892.6685.6018964536653587543.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618155626.18751-1-igorpetindev@gmail.com>
References: <20260618155626.18751-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfX5coY/rU78YT9
 8+Erdmmb5vjy0o1JYTRzsqq4UzdE7BvQlsKwsrgBjlv7MGXWfSyBoZPAx+Icyy8tvuP6eNk9Fsp
 P14jukx5vIhLVww1JmWqdp0XeENGqJnmbIvGqqSotuU6Z4LpjYeqkuOxZ2vQzNZ3YJF4W8VJkmc
 z52mTNNxGscwC6/nwXGx2M0YZJ1Vi9o/qi4Jx4uvmeIpfBr0uklpqul/lITb1a5E2EQCAOob08l
 mZ5P6DkYacHxfuc16NeH/p09PRU7+irh/tQZXW4OPv2RE4oulxuK9LR+bouvr2xsWFslZz6+Gma
 vdDlHwkWrnbk9/3sd6JJ5n8+ssNVv46IgbOCY+5LbFb/ZUkLZSW398hLzatzq4yhot+bf7j2/ys
 YK7B7VhG00RyyttbrqetALjpxv7MgL81+na0/8aehU7S0v5IiL/xQDq3IZ2GfWjFpB94aa+sXl7
 FohsPClzzgLYIpcIG1Q==
X-Proofpoint-ORIG-GUID: TR0l2g908nQ7CoB3W2JzcB1djlicDZiz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfX7KVTMbvGr+AO
 g0xSF/OZYiLnv4oLmMdrDHWs8b5lm0l80w9tUH1I6Q1BNPqakyqOGHmBkHsZaEhCsT1F+qQNcFk
 Az6Uuk0IpryZPRKCqilVOjuC0PWoSB0=
X-Proofpoint-GUID: TR0l2g908nQ7CoB3W2JzcB1djlicDZiz
X-Authority-Analysis: v=2.4 cv=MLpQXsZl c=1 sm=1 tr=0 ts=6a3e3165 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Um6D0ZJm5dEpkXDSItUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39020-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:igorpetindev@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,checkpatch.pl:url];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 330E86CB2EB


On Thu, 18 Jun 2026 18:56:23 +0300, Igor Putko wrote:
> This series fixes a kernel-doc warning in the tb10x GPIO driver
> and addresses two minor checkpatch.pl coding style issues.
> 
> Patch 1 fixes the kernel-doc structure formatting.
> Patch 2 replaces bare unsigned with unsigned int.
> Patch 3 removes unnecessary braces from a single-statement block.
> 
> [...]

Applied, thanks!

[2/3] gpio: tb10x: use unsigned int instead of bare unsigned
      https://git.kernel.org/brgl/c/23cf763ac5d084f9459a10a9fece9cb1ddc023d9
[3/3] gpio: tb10x: remove unnecessary braces
      https://git.kernel.org/brgl/c/309f81de06c00c12a41e318633e1d1d0c9d67e2c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

