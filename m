Return-Path: <linux-gpio+bounces-31124-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNClJqmCeGmqqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31124-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:17:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB0691962
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A6CF30054D5
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857992D876A;
	Tue, 27 Jan 2026 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFsZoGGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ItUS3KBL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCF1227BA4
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505445; cv=none; b=SOWGXAUw0krexV34Qr84pa8pkZAycXhatzW2/JKPC+UDK6lZs026FgCyhx+q+eKw1vfsje/rCnkIlp4RLei2lGAc0tluITLjRtxSxkBre1ZGI5GkbP4t5GmoMAMmEzZCHTh56Uuqc/iRvSsu+jrNAw73I3NAdMlbk8PWrp4xGVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505445; c=relaxed/simple;
	bh=lscktZ9dQIadEV+VqOMdr0Grnwc1OceO4vxIP0JnmBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbhJgpR+V4KI7yT8n8lmZml2bkRJeVp/6HaaPWkh3lKwdLSesrUO1QsY8wKsRIQd4yYpg8MYq9RrpPGBFpJO4dGDrpcJfcCYxEmFBC3dcW9DfVHv+GxHp2a9U+9wmYyYpfnYglJEI0wPV1WJbRM5Citkk2+FT5PxV7oqI9w+ha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFsZoGGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ItUS3KBL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UGkn184939
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXHR6MY7CFLSfA3JlEF1IVs8r25ADzVzBb/uqEQqBDA=; b=JFsZoGGXu6JlWFrB
	U1btt3stAPXbsi7DRIcg3+qFoR1VSBgsiLh19JBBoUgN/3AkeMakg82UThyzHHow
	ri1RdXi3AUVSPKou4PIgrjOAviEGOgI8O4fPL2OQWqlbpgV3IVrTfyUM0Uq/c9Wj
	KWICi/R9h6RQJR54+HJ4Yt00VoIxRg3xJi3rh1dPOL7HUJDWIJIoRBziJqhKNbw5
	6td28gEnFYEiXZ4LEEwpucmUM9vO9wpJljXSS6UJFhC92/KjyzC3Sf8iqt8wurSu
	Vdz5fFy4PLuTdySYLKu3RHRf0IwEXmz7RCHvsl5DAFu7UuOezIjXfzRUwNq4G4/L
	euKRTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9je13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:17:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5296c7e57so609637585a.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769505442; x=1770110242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXHR6MY7CFLSfA3JlEF1IVs8r25ADzVzBb/uqEQqBDA=;
        b=ItUS3KBL0ZRQIiQBARlNMJjnkl0jGWf4fsrbOCtSO4ZbivRJAWPWKYoNzp7nixLH8j
         0qybhinA0TjJ5VpN3m8pnvJEDjTCUaOQtB/5Tu3mJknjs1Hs5qXFygdyAYiSKfOauPme
         fsrdLRkiOsBQPFT/5xtW2ulYG4F9s+OAzeNbuXSp0Y6mHWKB/wbpGFzvLLIRCs1rzMqX
         YAqbt4utB34qj9sPFvT/uwKkOJp1rDOnr7JZapk3uvjQvbx5s7dZOWjTD4HDNS1bVIIn
         vRKPHqu7nThxUo17eW4UeDKnujz7dum38iREcjPLlc7EXwZzqIAQUxlmPju9Z2pJ1f1X
         nxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505442; x=1770110242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sXHR6MY7CFLSfA3JlEF1IVs8r25ADzVzBb/uqEQqBDA=;
        b=aI1ng+bRHi70GQ4Iy7EEuL/TY5BN0R7Bj2VqyzPtdnztYIF5/XWNyOvauuuBN1bOto
         iHNV/sxQsvORKmr03I3Q+WVzRBxgyr0h814qdaSnoU329r/3w5Uylub6pag+8VpFVEwN
         foC4Ucpl6WE4uDGYnf4G/SgHGbtBjbwELLeHoXwJF8JiExnUod9GDTVUiaKUdIfcjRuJ
         0YX/nu0WlvbHdyb4HOwH7pOEKDL8XT3ROC3UCqBufm+VKNcFck6c31Ozvs6OwdIznArx
         QLJuFvlxApsbasjfgq2TJpf6JvegX7Qzm/kuPB7PhGyLC0a5eQaEn8omeh6tJ24hG83m
         5jeQ==
X-Gm-Message-State: AOJu0YyxaoYP784EQOCSfRIpClXYhUv/SJuRAH90MCEIxp3AMblsxsdj
	tMUGq/Nm3vZfVUlM6drPaYxaOiXTqt36FrDb4CjgFF0RLhhe1AHcjyjqdLtcyHeBWUUeGA3gRin
	eeYDc1ubREVLPMhgkpQicOYfh2J+2zHxwCnOGGFOLGZdMnGndNH+xSpgRaTasir0b/XuGYcO7
X-Gm-Gg: AZuq6aJBMZSyY4FQyiqrskjMIvtPis0YFA1x4xITs/MYxFk4yAngGGYcU60wa06EHxa
	z/zisEdLQroTjNe9UnK2MQuqF7Jc4ku+rh7jSz/GzaZhymd/74WWOAhCHVRiQ/SqKff6oCWGbGH
	8T1BHQsUdUfm33kK4fvi+gmBqAl0M30DNVnQXB5vQIxLLMR51uiB503mBdTUX40Y7H2xrGPwrG4
	BHyZNMb/80uJ1rvSqKwJP7sUnDWip9+ZXACVzogBQ2//DeKmnKb/rQyoDecuHG6EY5pahfCYWIS
	VelKSe7a7l7TCOIO3QHuoAsa95uq8Wf1DVoMMhYsHbSCovcORx800VwXp9p2b07qnaYk4g8SX8i
	eYIPIyhcGPublHUEKHrOrLLRoIEBSjo1tN6MYjw==
X-Received: by 2002:a05:620a:2585:b0:8c6:aeaa:8757 with SMTP id af79cd13be357-8c70b88dc84mr120659785a.36.1769505442313;
        Tue, 27 Jan 2026 01:17:22 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:8c6:aeaa:8757 with SMTP id af79cd13be357-8c70b88dc84mr120658385a.36.1769505441957;
        Tue, 27 Jan 2026 01:17:21 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:262e:d32a:e347:8b74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f73855sm35856591f8f.29.2026.01.27.01.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:17:21 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Yuhao Huang <nekowong743@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, brgl@bgdev.pl,
        linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2] gpio: virtuser: fix UAF in configfs release path
Date: Tue, 27 Jan 2026 10:17:16 +0100
Message-ID: <176950538639.14023.10229567374455887978.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126040348.11167-1-yuhaohuang@YuhaodeMacBook-Pro.local>
References: <20260124162111.3945666-1-nekowong743@gmail.com> <20260126040348.11167-1-yuhaohuang@YuhaodeMacBook-Pro.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=697882a3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=49dCE_bbu2Yq34y5nY0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: LC6ky1slViA4sTVI5ReBI9_BPGxaXb6_
X-Proofpoint-ORIG-GUID: LC6ky1slViA4sTVI5ReBI9_BPGxaXb6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3NSBTYWx0ZWRfXyChQxSXe4eGz
 6apgRo40Sqkh6s6vUlanGYZTGpsFTmdPi5nKsbN9waTb8FxNQyj0Xow+QkAxcg+ty9v8OJ0I+lg
 EiZIOvU5nI8cgbZho0VpYtS3hM54v6g31cd9hIINVQEqKaSTMhFoB1q0F7mC6m/fX50mhVffthF
 524lgQki+l/Pvb1ol95bA9bDhsyBEdTmXDnCMq5AWyKyYdUtKbxt8BdK7zNKGRPVQsgOq0tETQd
 p+HX1c9eg/FGRolTSuG079hcUxMP2KTyTHdzMY5gejgo2LAGdwe8E7WXm0kMyEUGHjUucX/EZ1S
 GTk04il53JkjCbH2Ogwbc5xapD+duCT+H93BhwVnePl/8aOv6+dBrUQlRXdoyrjsGmpHfRhBRMt
 GRhXewa5mClkP/ioBlmPnHaBqhbtxQ78I+6p0VNaTfzJ+8rf74J/XliIQGNaj5K7c4fk+TGgjGh
 kMhTyWYVWQlhCmULAWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31124-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3AB0691962
X-Rspamd-Action: no action


On Mon, 26 Jan 2026 12:03:48 +0800, Yuhao Huang wrote:
> The gpio-virtuser configfs release path uses guard(mutex) to protect
> the device structure. However, the device is freed before the guard
> cleanup runs, causing mutex_unlock() to operate on freed memory.
> 
> Specifically, gpio_virtuser_device_config_group_release() destroys
> the mutex and frees the device while still inside the guard(mutex)
> scope. When the function returns, the guard cleanup invokes
> mutex_unlock(&dev->lock), resulting in a slab use-after-free.
> 
> [...]

Applied, thanks!

[1/1] gpio: virtuser: fix UAF in configfs release path
      commit: 320ae0de18e16ad6ba45f4bbc493a3d141d3b94c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

