Return-Path: <linux-gpio+bounces-36568-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI2EF+bOAWryjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36568-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:43:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6AE50E16D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB16331442F6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1612639F16D;
	Mon, 11 May 2026 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VazugB3H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d5NC42YQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AFB37BE87
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502758; cv=none; b=qEoH5OPEeMo/w+cVrVbbqtTo3LLaMzLQoRas6I/D7Z4UDhBYWIANS/eW6k2/ngmGHy9KRktWeLQtlDc2Z/q2v+6G62tdrXmQIDqhmnbyTnei0mvqik+0fz7hq+fvjvlwD4GN6bAbxoFBZnmStgZbiVsp4A+hE90ISTH074zWfAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502758; c=relaxed/simple;
	bh=kIPym10iG/aGZKBnnh44w9il4v0LaUOUIfS5K7p7yVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LWGGpifHleYN3Sjib7kZV5trnTSpSzZmL2CLp5+rUMg/gQYDtrY5D7r0ilHIcrcoKiw1ZLtKLXZVaF78p0QbbDt8nIFap7SUMVAq4b+Wd6YnfJe+V0kVgxqKD3YybRX5tzJTXhMC5UeUV9TT4OUAZGRkRX2GzyE3gdhFvIhJVc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VazugB3H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d5NC42YQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8HuYD1850348
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	me/a/CTC1/00YfGIzcLqTF4cxya1NIo7MB8KwN+d6LE=; b=VazugB3HNqtrs7Xs
	80d4NXfdHmn3Zlm/fg9cMtaqrhjyLpyamNxrwPP1eKXPdLj/tfdBoLOwLcgUkNW3
	xdS7Wx6ML1K0OC17TKAZ88c/vY5ooSzToSlWZ3ak5v4DIsFwPp9yv1fhZnBTP3ck
	Gw42YBFTO51jP+D25kI8KH3+Hlh4PrnoqGPcjgKtttvTcbn75wn1B0jdfhqDBOnk
	egtuEsrcp7rp/v5VjvWe5aPeWESEWazl4TqUvGoqbgtaBqSOg0HHDjJmfhAA2jYM
	EzUFUmhSzhpmkbxQUt0YJNrYeHMX2HfcxbgPk3Yyy8CKQitD+eFcclHYlsdNCuYF
	uFxThw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3bfvgvmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:32:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-632ad092bc5so1647250137.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778502756; x=1779107556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=me/a/CTC1/00YfGIzcLqTF4cxya1NIo7MB8KwN+d6LE=;
        b=d5NC42YQLYKjdlAGI5T5Uzh2LzVWwBnIH63SmQcARjajtGH5sg+Bh/krLA0tHfi630
         ZOOddN2Q7Ed9Z3xGnuZEAMaRgLdYJlyTgcJ54RXV0NykJKqBHviRKvY9lpdtcztz+4pR
         awfUFkWs+QmyGbU2z5UOs1R+iO0lddkNOA1mmTV4heTvvzEfF+UtGFN2oFLaCR5d5HnH
         3dWG5Ya9aD+wip5bhSMuqQ1uysZ6zPUHIeKBl8Mq/84WMHdao8fPAOjdrDzOQSAYMxXl
         q6LRYsFbOSbBsZeSjI1nPsqi/H4VMMe2MFGtvP1PaKo2OqHkLmJx/68Wy8fzqW1wwHTo
         ukNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778502756; x=1779107556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=me/a/CTC1/00YfGIzcLqTF4cxya1NIo7MB8KwN+d6LE=;
        b=UoJ8Fw5U9fi2a8zRCYQE4K+XqLxFwNchn4fhK42c4H6F5sNbs114N3+FWZrqm6kk/2
         DDREUNM/5zhCX2JHG7eAfJTTKlKKDy4t7K2S+1YOW72k7Fy7IQm7tWno2b/VZLzWjcYT
         ZxBObSYbQAlKgI1VePt1mlPNhlVqJfo1483ujeHIUEF58Lwf5Ju+Y/9Fp8iieF15vYpu
         NE6oHwruOGmgrMNC1U9Zlrc32RCZcLwe2FS1uacF8jGpvJhLGTKjAKgPx4/Tl+jGbsc6
         oevUh+t6qeuMCrjiw4K0rcIJGontfhUuohrTRlygGJETw/EFVAWmyriSsbIYXv0QKK0y
         VMzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FvXpBhq3FKxPS6uClAOKfelIUIPaet4q4YiUhigQxLBnwGZvsv4gSrl4QVs7C+xQW3MBWRgplWWH4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/uF/n+hpOU1WcDFUrhcMBl6dAYoZDVLX5nLinG/8LKb7pkPY
	LTFRSMKxC+RRgsTc7qC+4sEZrjShBrqayO9M8T+Bc3JftspE4uGTZVKHBR2l0Pm55Q4Jxr7v7vp
	Eauvut/Muw6dAaY6mSPWxqTiiXF8ehG8nOA7KPJMaTBmXJoXkrpVNhlE+/+hjSzVTeTtX3g90
X-Gm-Gg: Acq92OFGA5UoI/klKUcDoO8GmEndlz+IVf4cDK8lVSu5q6PxzKHjmCbbWAX2K+va7Ci
	a6Tcog7CAII7VQK74H4SoA2MWMy2kONsIWm1daMRfEj834ebetJYaPBSxtSERwPHctAxOUzCGeA
	7GvK0Igabm/ww+Ci6cXiN+ODwXUAjEOgON4CXFcDnWruAkbOarmLwfoKTY0DPXrmN5ha9DAcgMo
	ilhwhnTqQuJymGq+uj32Zo+z5Alyr3+kwlt2IaVssv5Y1FdZAtGMc2OuPLZdbOf+4/Wt+nzVC36
	kpLMhJ829IsjfB33tAZ3hs658LI+D9t0/knWkA3h3/2Q8t5Js4oBHjz41roje1eZJr/vAIuC+Rq
	P9oUKj+BW6q8IAL+h+L2vPVua8T5VFiDZGI+qp2SFFXrR1bJU+VJjxMkVcLOR
X-Received: by 2002:a05:6102:2925:b0:631:81d6:e152 with SMTP id ada2fe7eead31-63181d6e33emr4550998137.0.1778502756083;
        Mon, 11 May 2026 05:32:36 -0700 (PDT)
X-Received: by 2002:a05:6102:2925:b0:631:81d6:e152 with SMTP id ada2fe7eead31-63181d6e33emr4550973137.0.1778502755610;
        Mon, 11 May 2026 05:32:35 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2673841e87.0.2026.05.11.05.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:32:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@riscstar.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 0/2] Improvement spotted during patch review.
Date: Mon, 11 May 2026 14:32:32 +0200
Message-ID: <177850274681.64672.5290926520944173270.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fa4HAp+6 c=1 sm=1 tr=0 ts=6a01cc65 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=v6uCcXnbiXfIQ7eqmPMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Lq0S-xULLVpOoR81z00aM0i-WCLDy9FQ
X-Proofpoint-ORIG-GUID: Lq0S-xULLVpOoR81z00aM0i-WCLDy9FQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzOSBTYWx0ZWRfX+QKP8r3st8DO
 rxpOJQ3HWJNmTM4wQa2+WfCumkvL54WGmkoU0XmHxR3D/nI0EMbD2WM2cMYC2ja55h6W9FkZa/r
 2iC13VmcEEqvf3kU/vXO9sjCWqvMhl1p8tIetz+Om15xC7xBuN9MLpuKm3Cww/pA61kqGehHw51
 eaWKBG2+hCpKxAjv5xvohCexVHB5AJe3N+JdpxZvPRsF7FXS8SnYM+2efPTEtzzS2rWkxd+vYAJ
 KaXw05gyB4xISSN1KrekaXrq8B9uQT9CWio0HQzyIFqReKQxEgqbEwyxwNukW6UQkdjZU/oEj1I
 Nnjd0lqQ/UGZdRuoMvcuMQeJamRXXYSvohUmBKqBUkT8SssGAb2sJyJysAxQ8FpPtw1wdApmb49
 YI3Ob465Ohl5+NbdQGIAyoxqHMv+gm1gR63/uiMBjSihZ4Pbs9BMSe2iT3ZFrhTPhEP7/dxNK2P
 CveXKDuA9D1d+aZb0hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110139
X-Rspamd-Queue-Id: AD6AE50E16D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36568-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Fri, 08 May 2026 14:51:25 +0200, Linus Walleij wrote:
> Support sparse unidirectional GPIO lines.
> 
> To be used in a forthcoming submission.
> 
> 

Applied, thanks!

[1/2] gpio: regmap: Support sparsed fixed direction
      https://git.kernel.org/brgl/c/ae99219270a3d85ec38eee9458829bd45c11aeec
[2/2] gpio: regmap: Don't set a fixed direction line
      https://git.kernel.org/brgl/c/c3566b4a08707587fd52342f53cda1d7ee2607ca

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

