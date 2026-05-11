Return-Path: <linux-gpio+bounces-36520-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKl1LomtAWrXiAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36520-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:20:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5844B50BCE6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A583045221
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86DB3C9EDC;
	Mon, 11 May 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiNq7fq0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4SPzTgR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D853CA483
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494544; cv=none; b=N4j1LrS2Nho9922xbWaLUMOjdvjLBL7uL91W+f61lazQbZyAueS6MsEK1cyAcmdrbhtkv+WXwcgOhrUUeQknMsso9Tq6Jt/qYkI7JCK2WacbWFpBK4Vm7nfrA/+ResuMnoJpvx+VM3oS+njBrQzZFGXq5ss8GrT1pfGlEafLHGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494544; c=relaxed/simple;
	bh=qCFmi2WE0b/9isfH5tCK0ORAKQGM0Sscv4pL6+8J+Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HenUL9AcvS1OnVXiROgfA/3xXXdBG9rEzIJc2IgvyAdMkD3lbIb89v8bkby6EA0AJOwS4+c6u5P/15aT2f4kvxNfWXdl0IysYh2DeJgTpnfhZGQfNjx2fikGUlEtZZHbRgtluHilRcAdDusfyyk/kR8e3rgxJL1nSQaHO8gqecg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiNq7fq0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4SPzTgR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7AOu1453236
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0IW6Mbyowp1qrDASdEwXlyxz7dThpdfwBkhdUssH0xU=; b=TiNq7fq0PpZDTTly
	jdqX083tF06dpnsjyRtgiHPFiFm+Byg0zh9Zj1itwJZVecdiaXQnEC2Fuynd1o53
	qEFA2hMmkSNwfiNEvaty+oL1sMe3WD7ChjkEZkfpEuKsGmASk0wDk50w0gcm+uvO
	0tCrC07fpez1j/KsZ+clmTXFMEL3HDwgyOEYMLsVuNtj/3dynz0haiDn3/tvEXzg
	Yp2FJH2h9cf+B3Dufya71vE2ccz1OTEBVL5DX3zoDYpsjk4axnwL858kSq0IVQki
	KN2r09PmuHeQQfB6bAKNtkyEhLli39T4oZfG9ZEakoM1/KRKFPtByLNyqg/GMBD+
	y0yD0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag6gp4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:15:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so100229201cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778494541; x=1779099341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IW6Mbyowp1qrDASdEwXlyxz7dThpdfwBkhdUssH0xU=;
        b=F4SPzTgR55tNlZsGy1emKYMJNUeC1vprMTPpMrScWu82iitVl/RC58vYDa6u1h0WpD
         hZCIYHE5tqQynOjv9AGmyWH37G/aPkhH041HMp7/H5KMbVL0u+6I1B7ai+kB+jfK0dFp
         8K36w0pQP75bTKpeMLvsvA8kE9qK+23gR5YusnusRjcprfeMOIjX8lz6tP7UB5I/Foie
         gZ86hPjffRRQvizimEMKvYTwaNAhcaG10NUNIpXUdaiZXOosIE8XyueIkzynNRZvmoN3
         8bp7BxiL3x7XjZ9IZTfNTQj545G4glQY06Z54s0JUqHr4z45hH8FwknqS4W8Ews4D2dw
         y+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494541; x=1779099341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0IW6Mbyowp1qrDASdEwXlyxz7dThpdfwBkhdUssH0xU=;
        b=mRhCzPozvetpSg8wF8QjTVP6/8I++Euy5DGUM/XOdRVb88M/8+GQV2TiTFT0CPqzgh
         Qaf4ndNvnnsY9/OTk0FaNeSy0X4Adut4LyUgTHLg4AHTkolj/avHHtqpLrun3RWg/UC6
         BCgP8lOCGWNmCjlp84Z1dtb6TvE7KYs4jaiVCNhd/jyyrOx6pcCX8EB3u5H6sJZegUUu
         MBu4oApspXw/3UtA0Fiwjdy2adp2kPy3KVwvtCs588bka0eFcNXjuLkIcOCh/LrkYD9L
         BSpTxARfxsILKkMFnBYkw1BHN6zlCNmFwfWZ1st50MzufMTIscZEaqLBNDC0UPweBlBU
         z+kw==
X-Gm-Message-State: AOJu0Yyw8j9n7IUyFzHkHa0WqLDWQ+I9UPLiSit8z6WM4W6IW4CFoqcW
	YhdeYrHpsAjBUiA00V59wceqJAZqlnNPnBj/N1OWyv3jzddWzndjm+NfzeMfd3dIN1AnQ8HAZsY
	l5RwGdV1JCeN49l4emQcY9Quky006GC64V0HPXwOo9DPAFj2aTU3EyWsr7DYOFYQegHheHKu6
X-Gm-Gg: Acq92OGOdyRa50bnA7joBfwTaXFKrt1kM3mncV8BKEth5I/I57VxS5zS40c2cRA/ZV5
	w92JRnxHUme36lWlDlfPSMsc3Ahia4DisXVHFh+6quW/PfZbt2lbZ7Q4ILa5T1cURLD+Fv9rmGO
	0W+UyS1REYDMnERdrHiOqQfF2FRaPW1g6QF5pHGoMgaLIE5Ib4BzJnREEnI8OeUNYAdED08/bMK
	Q5cb5p5XyLJh2+KqeiSszO0nw0cyqecbVZS+hSIvF7fDo56D4sZppOvT+i47pC7OE2ymz+dJKfq
	fWCbiaPKdE6Inhtr/6nWJj0PT8CTMocxgD7g0QDF2XBcPijpSn2kT8pij8eUld/QWRTx8+mmows
	ks2LYisi8egqNTTpFcS6YfxM3aZBbeBbQ4QD/TaQ6j3AZh/cQIA==
X-Received: by 2002:a05:622a:1ba5:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-514a0b23c5amr132024591cf.29.1778494540537;
        Mon, 11 May 2026 03:15:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba5:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-514a0b23c5amr132024291cf.29.1778494540157;
        Mon, 11 May 2026 03:15:40 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6daf496bsm85080275e9.4.2026.05.11.03.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:15:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] gpio: zevio: allow COMPILE_TEST builds
Date: Mon, 11 May 2026 12:15:37 +0200
Message-ID: <177849453421.42829.2470918922771750909.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260509003438.956051-1-rosenp@gmail.com>
References: <20260509003438.956051-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOsJG5ae c=1 sm=1 tr=0 ts=6a01ac4d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VdHRNR7Al3-TMIprLfEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExMiBTYWx0ZWRfX5zetbrj/BKfd
 tIg/MWY14c0WdTWIMqtQHfmiVU/tcs08tPBiw9sgERlv4oPK9RDwErLMEdcbZg0gPvWIpcqxH1g
 MiJUhZvjxIyqPl4dMqtwdu+nkIyTRFd/Q3elrQVV28UY41nd45B1z4+UQHppmzrPXNCW9vN3IUK
 IddkZ3kHewkbWsb3dWnB9FDFM/FnehIB59GExHL1oHaQnXTYb+yqHIldhk5RIlCO6RgXnSSK2cI
 3w6ZEwFbbmitcT8HLwjmkJAou85FC+Wih+YZskWLLwvH45efiOW0eYEgqacimuIhkkhw+7fwYdi
 TLsp13ILZsR1JLNWPLGppkVJbuQ+xaWsEzq0nWEKHmlzEMs45je82104iWT1+lm782q/n+Rmqkg
 O6fdYV6ab0PLCeyEEH0dVdJ/NNLufuq218VF9LaUK66zZ+EYYV1J36DseC7ODuFpIfG66xFnCcS
 +UltsSaydzul/AzrmgA==
X-Proofpoint-GUID: RV4s6a88__hkL6260z52NySwSrUd0Mv8
X-Proofpoint-ORIG-GUID: RV4s6a88__hkL6260z52NySwSrUd0Mv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110112
X-Rspamd-Queue-Id: 5844B50BCE6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36520-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Fri, 08 May 2026 17:34:38 -0700, Rosen Penev wrote:
> The ZEVIO GPIO driver uses generic platform, MMIO, and gpiolib interfaces.
> Allow it to build with COMPILE_TEST so it gets coverage on non-ARM
> platforms.
> 
> Drop the ARM-specific IOMEM() casts around the register pointer.  The
> pointer is already __iomem, so readl() and writel() can use it directly.
> 
> [...]

Applied, thanks!

[1/1] gpio: zevio: allow COMPILE_TEST builds
      https://git.kernel.org/brgl/c/5d6f7ce387c09fbd30360f268168606803ee9ebf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

