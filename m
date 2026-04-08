Return-Path: <linux-gpio+bounces-34863-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDGoND0B1mk7AAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34863-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 09:18:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EBB3B8028
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 09:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 998323009828
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 07:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3911A37F8A3;
	Wed,  8 Apr 2026 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVc99Idy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsvOZ+TN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D242D376BDE
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 07:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775632694; cv=none; b=R/TKm/H7zvHz0QigkOYHyLNXKnn2BcxBWUNpzXSTCKla3Kd4bCRfuZsp6CmDJiV4r9jGCwy6YmdCGrANWYTPKn3UMVvTqZDZgKT5yQUcQokdlg7OYI4RJ8Hym++EzH1BIznd2LZj+dqzfS+sviJUPnQyYdf6auxAtV/RvOH95es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775632694; c=relaxed/simple;
	bh=jmuV34+wNBLBBgk5KDHMrHeomv2KevH9mp7wN2Hub0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D1fUDhMFZGJ3ttHLO6+WCcfDihDRr10LRnctFUTC5OVe5B9LqYm9Z9p0E/igyaiukCnDAG68zM5Asn1I1txYxl9g3+rmJ/H6r0Qjuy2DanNEy2f+iVikPZhFwXjKYRdu4NsbWqnotP1UjS07EEe1MaALfoNpJUb0Z/6FBNZ9K5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVc99Idy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsvOZ+TN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387EfZM2860432
	for <linux-gpio@vger.kernel.org>; Wed, 8 Apr 2026 07:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4gw6Lc1Xmfyfq29E7dcXwlI45s+LeAogihi3h3rDwI8=; b=SVc99IdyEaJBBe7q
	ek0VZxiHaQL2DWRLotMHoPlAbSnq8Es0rML6gWh2Xn5QqyTDBXdJCHiDWRSWCgkF
	jBV70AKczBdTQ/yLbnpOo/Sa2Ot2iPS4JLUGAjJuCagWjoUv3hkxDlDIAMSvg0hI
	AXDrRj0V1ylhyoTgOiWTOUnU0PAfJztL5d0KEkhyzIChBjQeazez9eKqOJRUa9zc
	rqD8zFmC3enqflaEVJTMm8VqjNkcakICShBWQHyNnITmn+xg8Hr9jb0bAveKfoT6
	YPQMjAP8bpjfqH90BHSPsY4AKzYXoF0Lgkcb4w3E4hxOaiCEEA2a9T8bXF/zuHO6
	44xfAQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8sggq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 07:18:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d58bed44aso183750221cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 00:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775632691; x=1776237491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gw6Lc1Xmfyfq29E7dcXwlI45s+LeAogihi3h3rDwI8=;
        b=VsvOZ+TNYPeA3LNr7pHP9fd4k24doxMISLSvh/jHtLSJmaDx5eVUdb7sQtK7xzesPz
         dxClh01jbCb1Gtk/P5TaQRHdzZ8VWZCqUfQcMgnu941hijbeSPysWxAAn39xiy5a8tvN
         9wD9v3XbaeNggdrQ1lw7MqqdCn3QCPvDZi2HVsKwv+JGLpSxFV2PsqvbJqJLFW7vB+be
         PaDFhslEhbfsNPqXCP6ynT2rPSsrVHrz56sapPzJTT8l66otEdszHGEjk6WRSiWlnhrL
         JfEM0SW7MKQSjYkqVdJPkmYq7Uc+jhb9lZXu+ISkT9x/6ZyzkQov/WONxeLPgQvyHLFc
         8/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775632691; x=1776237491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4gw6Lc1Xmfyfq29E7dcXwlI45s+LeAogihi3h3rDwI8=;
        b=YayD/vFKlq137JGnQBPltpYKMo0huaCbCwwXv9W2f/Wc3p9uJ4xiIbIk4KUnHiOTrC
         5xxFnq/+wCQGbjEEdSJzZ05ZJAuzOjziXdcztjVu1m1ZE9KV+doKVLV/9fNO8omNfaPr
         tUbscpjxZyQ2i/0W+C6jwcr4GzURIVtMxUF2Ma3e4XT3Ia/YvBSzsYor+0JbInTPY1/N
         4tqwan6RoefsDQrj5mVOb6JhXoTbi1/+hw8a9O21V5jmXt9E/pBp6siLQtQXS0VnNp4P
         I3wuM02IVF/UQ40L/vBAr8D4fBF7lfIUszPc0SPCprUkMyAeBYDpx+7BveiVp5KlvOY+
         x8FA==
X-Forwarded-Encrypted: i=1; AJvYcCVyc+xE4oa6YK5pj0ZSAAhD9R6FMUzu65CUURm9640B/Yqf0RJSujJLZoiP8B8dPGVBj2ems672y4Lc@vger.kernel.org
X-Gm-Message-State: AOJu0YxfASZr19l3Vznj46Tqo4dlRK9rgp22aK9LRFTMtQdCLIm5fYKi
	AK7YR8S0VNn7NJKhaDlCqqEbroA5l7EAWSyq4uN928sQYt5L1NyTmz/zR3npbm3mOgbB8Ixfdkn
	0heJPZ5sTH/KRrp+thiinM6VkMlKF1NgqziXfSSNTNFfUvc28UdCJJG/vfbwETKDR
X-Gm-Gg: AeBDieuQspRNn9URiecXg4zMHLZySfC+Kbb5PeMzKo/BWziu6veZHZqT2XlU/tOU7kk
	zLjtzKKIA+ctb3laCdrtpES5om85VbSUtF9gSM+tZkF0ElPe4DICTXh/rDInypIBJgUqkg0ci+y
	gsH72QMRF3NZXtruN5N3LfJQSnchgAFGvdeIiZXA2tL9F43bssXK+ZjxlbS5lA4nmCkAriUohIm
	aOvKzhgFf+26bwfURfDn/r5/fBJF5W10cz8AEg13BNvU5LfMjpvRlTTR5E5FkF90JrOgZVhpG3E
	by5+736e3DgEDfRZPlxaVraUFh4G1pveMrP6g8D0bGbTCe2LGoUAedfrVH9Rj9B5F39hjgGhSTI
	mjF2bwBMQzKgf4RH4WJkul6cB72yTL6vfF9Jdmg2fmYG61lPi0w==
X-Received: by 2002:a05:622a:8606:b0:50d:a96a:f481 with SMTP id d75a77b69052e-50da96af7ecmr45297241cf.9.1775632691103;
        Wed, 08 Apr 2026 00:18:11 -0700 (PDT)
X-Received: by 2002:a05:622a:8606:b0:50d:a96a:f481 with SMTP id d75a77b69052e-50da96af7ecmr45297071cf.9.1775632690682;
        Wed, 08 Apr 2026 00:18:10 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc37:6e42:61d1:47ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d28a5sm51429269f8f.20.2026.04.08.00.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:18:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
        Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] gpio: handle missing regmap
Date: Wed,  8 Apr 2026 09:18:07 +0200
Message-ID: <177563264634.6152.117129686332918058.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <5bfffee380863bcf24f3062e48094c8eb7b1342f.1775565381.git.mazziesaccount@gmail.com>
References: <5bfffee380863bcf24f3062e48094c8eb7b1342f.1775565381.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -PPVKpRcgzY7tkpLs6qQDm8PjzyzcG8S
X-Proofpoint-GUID: -PPVKpRcgzY7tkpLs6qQDm8PjzyzcG8S
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d60133 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MbVOzOUJd2jf6Wf44BcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2NCBTYWx0ZWRfX+ny0iZxOOVOP
 dcMkXYm1/A47TNEuUbjScrpd2ZOdjZX4FJhldM1bNcjc8FATIv24CE39ODNP1xYlu5asmkCA8NS
 +4TvhS1riMd6bkBK7hPrXiyqwEbftomeVSazRWEq7XpLGt69+S58LRTwr//lokxMU/YHEGornE1
 9mLBiLtGaYO54R5OGNQNICOFrQeKoFtukNQvbn7aaLuhMbJmMhioAxJHJ9LcpDHkDxlSnpZ1O81
 EgBL+o4t9HCcnNhp38hUsmPMJ+rxd9PC/jMh1nImnTgTLcQVj/vU2eGvkAWHLMm6m95/Eioal3V
 RwEFnC6LQOwha4SEQ7U0UL1RYTG0CrqhHmJGsItPx9kwd+HncE2CczMx+tTEI/Y/tBLG/ry9eJz
 InmTBxWSKo5/dhbgvKr7KVVA5K5R9hLyupRyaOYFvcZys0H2nNP4P4b2pzgleFF3lxmGWa5W0Yr
 c1OqrihxGp6hQD4J0EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34863-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,linux.dev];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5EBB3B8028
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 07 Apr 2026 15:41:48 +0300, Matti Vaittinen wrote:
> Currently the probe does not check whether getting the regmap succeeded.
> This can cause crash when regmap is used, if it wasn't successfully
> obtained. Failing to get the regmap is unlikely, especially since this
> driver is expected to be kicked by the MFD driver only after registering
> the regmap - but it is still better to handle this gracefully.
> 
> 
> [...]

The subject should have been: "gpio: bd72720: handle missing regmap".

I fixed it and queued the patch.

[1/1] gpio: handle missing regmap
      https://git.kernel.org/brgl/c/828ec7f803f41588a120e6d804297e74a482ab9d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

