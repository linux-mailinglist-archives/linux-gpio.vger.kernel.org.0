Return-Path: <linux-gpio+bounces-37495-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPisDztbFWp7UgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37495-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:35:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B32F15D2833
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42E293034A04
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6121B3CE481;
	Tue, 26 May 2026 08:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CU8XWO37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1sr6HMR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1573CC7F1
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784474; cv=none; b=mVgVQlokmErH3nX1M5keK1YNea+QwSD5eEh+mc+VpR26Bs8G+u0WcFoaahxKwcQvB5cge1Z9ub0udqzAeHxUWQM9hU5zVpLGPYTVppIl1yFoY457RT+RPOAyESNTJFhUnlYk8I+jkYJPymzoytQ7b8++QujBbAXrKzmwO0TVB04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784474; c=relaxed/simple;
	bh=zyVZvYVS2YZPcpeVOAZ62uG+LGw0phivDVfxaxXtNrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ffzs8QDe95/Sc90ykX+HhlctXyJGH6z0kkSQrxWardwSraOiUwKLXqoSF6GFs/HgV7iq9AINHj80iBh/QMf9vVWUz6f32TuqrudhgSsKnZsjKjZlcJE3sxp92SD9LrPXqw3F9C9ZwqAOIc5+DyljrzGfkTuq1nNUIye0E2nInhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CU8XWO37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1sr6HMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5xjUk1604515
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4T3+ldKSNTWpMoc+vUyfnMAuek/rUUbqDMUHalnfifI=; b=CU8XWO37pHWJkv7s
	izd5ODBQYcQBzpd2L2xtoLpFgRf6Vgmv5E1gGhqo7Y5Y5+J2AIppM/nNUvaFWP0z
	xx+HE3NOddDYYDEbNN/tqFEH4sWFreN2flu1tbFIHwBPG8x/e+67zSWIPFGQxmBn
	adpYk2p1Ba7EzgvsQVfhRJ0TWc76rvdy1p4K0DCIy00KxurFoQVCdXAiM4z76XPz
	rl8iXMoyvNVlsqLQa/RJ940/ccs2GqIqQ4QdTVKLbeyUgZyPOn/dOPPRUx8Fw/uE
	LVTzaefWP/QB7NHBI4AOIFBbgWHaQFYQtSFF7yMJFLEdFjScc3vDDErUXI6+Pz+L
	mhR+pg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3rktj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d19f68acso90226291cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779784471; x=1780389271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T3+ldKSNTWpMoc+vUyfnMAuek/rUUbqDMUHalnfifI=;
        b=d1sr6HMR0D2+eBXjd5ZXEFZLoCT3/lKYr6Oh4mLncNCN+1rwIcuaJyB84MKetbpf4e
         eBWb4XeQjMo3tDW2a7eqdUJGr//9zw8+T8acQxL69EL3XEoTSEG5Hz7LK5v+bVChnVmd
         ZcifjKaDlFmGizmwpM0YvGv2+ZndkrDKZxhQBr7T0HFQm8UlhCaNAZbNdrsQqPwns2B1
         lGwZRhW+5nTmsDlQzLe8QTSJOmBximIGJfZbm3bY1ASbhVVRpeL9yQ0snmfHCOHoFwRM
         0DKeN4cpZvMx8N85BbzRQ3JphMNNAD3javVd0upCBoDGIUQq+DR1emOUBedkADPdSP+/
         O7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784471; x=1780389271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4T3+ldKSNTWpMoc+vUyfnMAuek/rUUbqDMUHalnfifI=;
        b=lU9vawvx9EoL6gnzY8nytfSolsV0GvCk7A8DSRiv0wlTZpNbeVhd/d0va6kVp9yKNz
         JwW2DBWXOhB6iBe3yhRTdAG2PtJY+VKNBte6ReNJnzfrCqqFs5XVck2/JXtSuS2SX2AH
         X3SCakuUVSst/FCtpXfwuQhEs9dshzi3Xr04k7eVaWMUCBU8FgNf77bLg3skWkdiCzsZ
         a/bSVOT+z2Lh2EnogG81VnVYXVBx2AsQPjQMIjws7BL1fpts3n7qRBNx1lMS9KzBc3sa
         hXbhXZ5ub3Z/+zRUL5C+44HsrLMItnl8FgNcVBNLY6gN/L39E8DAfcwltods3p7zuZKl
         cqdA==
X-Gm-Message-State: AOJu0YxLcc2dw4gOkknlShwMp+h9A6N3D9+z6+LDsfOlBrUhpS3kCYGD
	bRVziPyOmClv7n/EB55NOIWCsJdmKe9u88G7fboIwI+5cYkVNN7DqH0xVmSt8Miqakv+4iPK3KT
	4AVXbOZObIZPgBZrHSGnWW9tzU/u86Omf+GzHzkyiJJ2H3ghZwQbygZ9i5c3QxpwO
X-Gm-Gg: Acq92OFebp3pXEBAahEhk83uowtrHRqJUPMIPpanAt1YL66fSSwbzbs/GCibbFb9T7Q
	aDbEzhl9CKyyqbn+pcDAuHlvU860gBqOFzDjuIysGpUp/H4si9+UELLBpOUXoUy5CCnWaDA2NRM
	MBnPSRjVI79+D+69Bff2wkC/cpf4R8raEbvK07LUZOOwK/vT/1HuLvhE/JSsA5DK0H4TSSsSx5v
	7YKm3S9SPV6WBEs5wTqpXI1WAxxFZhh3BOqXShZHURhl3qvGwPmUXmjiKPfMYv7axIL+qSKEzym
	Vi1bdGKMpaWs1S0hXIXH40xmelozF6b+XuyDWeoTxiqCUcpNRqzjKqtbgUhR+ljfzFLThS01sdl
	3MDH0pbFBBv/9nJBgXfSrh87j8QdzMdDx7S3pSwRyp+oPPcOhtA==
X-Received: by 2002:a05:622a:1452:b0:50e:60d7:b286 with SMTP id d75a77b69052e-516d42856demr248985391cf.1.1779784471359;
        Tue, 26 May 2026 01:34:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1452:b0:50e:60d7:b286 with SMTP id d75a77b69052e-516d42856demr248985151cf.1.1779784470892;
        Tue, 26 May 2026 01:34:30 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49048c6acf8sm92904325e9.10.2026.05.26.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:34:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: shared: fix locking issues in remove path
Date: Tue, 26 May 2026 10:34:20 +0200
Message-ID: <177978444194.19212.4138855292775439477.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com>
References: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MyBTYWx0ZWRfX2mp+Zc1WKdYZ
 qYw3mC9s3d0g8zEV3uBmKsifAHmYDsxJDE+3qmoDBGW87ekUeovUWwVbsSs4FA4W2H7ZcW89DJz
 431i/x1kARFHD5bFWkLcFrphhPzTMnxI8Y5Qe7O/9ZFmQ719s4iasCsIq5ylxB+P0n0ggPSpXwP
 9Ncf0Xu8OeMq8ceZPkX5gS6t57sRfuEALogsX5TQ4RpoM9//9wc50iczWMe5ftkWFDTZjsVw0od
 ksXIaeX7aYEVG86XizS2SLWNgvxfv7GPnTZaBCp+DMq6V2Ptv5tXkpm+wepxCRt2I4eg6eyDY1S
 1mndSr4jZdg1Xx7YEMYnBy16TjRL8fhogUMJ+5dXhKgFH3Ms5Gbu7OOIjmSjSoawKsmUD4Bt9jP
 tai6w4w4gqRU6pXq3eFMMa7gJrW3YeAu8UqHSZZxI44bqIOiu2HX7AgZIKbRcC4HLBt1iYxufOi
 GOY6KoWTKP1qJdw4ITA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a155b17 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TSCg4LgC_SF7kFt2K2AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: AHKyOqSRpoiLJAYodxT6Q9_H1bBvxF14
X-Proofpoint-GUID: AHKyOqSRpoiLJAYodxT6Q9_H1bBvxF14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37495-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B32F15D2833
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 22 May 2026 11:12:35 +0200, Bartosz Golaszewski wrote:
> This fixes two issues observed with shared GPIO management enabled.
> 
> 

Applied, thanks!

[1/2] gpio: shared: fix deadlock on shared proxy's parent removal
      https://git.kernel.org/brgl/c/755825b2ed6f3384a7f5d9cfcb2c8225df568796
[2/2] gpio: shared: fix lockdep false positive by removing unneeded lock
      https://git.kernel.org/brgl/c/8eaf57f93f1a43776c8a0036921bda9089ab72b7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

