Return-Path: <linux-gpio+bounces-36566-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAq/ElfOAWryjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36566-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:40:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B483650E08A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA55130729AA
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06B93D75C4;
	Mon, 11 May 2026 12:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0L+urWE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MtISa/jW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758773CFF6F
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502446; cv=none; b=Sp0gVtgL139y2U6JvEsx9UGbra4UAkhVBbLvyGpN4K9MpgZ/MdHmXGZJU9NKYb6ummI/Q03aYWEPx/m0To5dLrt4fyWFZEvZcpv4Et9P6BpAecM/tzu4j+CK+TqEc8OVHu0rgsd+O25F3jHWsO1P+9/n2K7OgSZXqnF86tpoLf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502446; c=relaxed/simple;
	bh=F7yDLLjZBn9qTvN1qPfHQLR1zoSsRmwCTJhdtIi9nmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UOQQwIHLciBf8dKCs//NaaLu58oYHgA52Wf1mEsTg98koNBgAgNOSaH4QFTpqbM1e1VyTW11kDxFSE0SF3aGC/WUq4hENKc87E8d9hBF2WM5zoDpI0fX8WrctvMs7DpWkUm7jaJJuTL/zIQMXvvbXWslC/0q4eXWEsjxyprWxNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0L+urWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MtISa/jW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A3IX1258452
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZfpF2A+uxvitd/l3HalifYt5udh9syYv0uzc/zxlKZ4=; b=N0L+urWEiiZE5O+r
	2fd3SBaODNpaDDRlrwt79P8uBnJ1NqhJYUGHly5fdMgS7dKh99+9Tr1UUhYMTbsQ
	/5AQlz1hglkp4VbEC25yW0Nbx/HdGoneotm0nk/V72/AUlPSOu7xuVtY+xpJvwYs
	H/dy1L4tYg9LMChTYI45gZt5muNt0QYdT7Nt/dVB6irahNMZTF38pzIPsS/4Gem5
	hdRGPteStTxvMm5tA0N1CLDFXahW0nBMh71W/ZRNnU23qZOOeffcc+vPHtoxGvJA
	xA3uguEbXUOXqiqGSboiazy+OhDa2LY707kv+ohDkY3dKWpwV5txvFgVOG55ejoV
	KK2Dig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag213w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:27:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so1884441cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778502444; x=1779107244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfpF2A+uxvitd/l3HalifYt5udh9syYv0uzc/zxlKZ4=;
        b=MtISa/jWIf5Nn7NqX9ETfnQXKt5mWDZ/rp8UsegDhSnBZAQbAMqiA2Vk2BDyzTjYGU
         oq+/tWYifBSG40jScW4XWgLySafM7QnWFZmWh70535BJQKEC6SUNwJOpqdW42WKbE0sf
         Sa7VhHNDr8E6W6ZTBw0v01ItchECRQ/RrA5lvW0MQ8bC2bGoneJTa6f0APHgNkepgJSK
         mB4rUKe/CshCopVc53iv8EdXJcB9S89Bx2tehkbmIqnYXXFAcsuPjvpvSysExn2qa3gJ
         EY8eOmCuNnkvKon2OnJKEObfuLPvMG4+EwRsxLhM5OgHmJOdIGwaDqAq55qlL2LPitUU
         sl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778502444; x=1779107244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZfpF2A+uxvitd/l3HalifYt5udh9syYv0uzc/zxlKZ4=;
        b=EX9Gh6UgnyHP8gjLnAfyS4Kx5D9MiAvgNMrE2EVF5Mi+fjpnaYm6qSzhLMPiM17ehV
         4weqI+qhJtGHxboy8x+vnEIeQb8ofhQGZUA7Um6AVft91zTd5uINX40qSgiUZJJ6ckaM
         Q/oGFYzaiPRT3pOulmWKUs5V5AXb20176PUW/QsXQ1tZEGtLMJS4e0Vk9dy+aTadkGrG
         XL+s9Wc6AeArupcs2AzeDiideqnthZoFx4jPaz/XoUnCrdiCSorx1j0IQ/g8/I2bFas7
         wNlmQF6pAbIjKMYApRkbJj4f0j7sPThdE9pVPw/ziAp6MdXe0LdZJ3a00kHwROlxUVFx
         DaZA==
X-Forwarded-Encrypted: i=1; AFNElJ8sazanUTcnn/8Yxnx8bk9gH3GUqkaMo9M3ofmuJcsX+LF/a2A0HMPmqi7UxskWDgiCLwSoyesH+vdj@vger.kernel.org
X-Gm-Message-State: AOJu0YyAYely71pAh/NLcnyjcEJosdJzorO1TwSeHHTSlKrAZNCJkWk+
	OyqTg0sHOZfROeINfn9Mt5C0EK5wwlSkzfUCD7RcL690EcLO07hzm9gv+bXCf0gvl30PYXI1YFC
	L2ucsZNhFBwBVpg8FFbg8q4SkFUhz1Huqv4S6osaQTni8aC4dMvahKusn5Ll7Db5n
X-Gm-Gg: Acq92OGVILmowIrHJwgl5F3P968aWSvoV9VbCMeodC2N5WvsBy729UlaZ9GVdfHHlzU
	bUPwcjsMgBaJuShoG+Rzy4sKnq8a0L8f2hokMEwLBppsRqALvvahlmSq38F62rg/qmzAQwyQ3pG
	83ljT/eL7s6s5hB/BKhs43LKokTGYqtA8PRdOTBkumCzAaSLin3oG7RHTxDI/b53t+Z6lTaJe76
	5a+BPEpVe/YDhkD1RUmBoQnYKvVeNP7U4Z5g9zPgfFuBSErX1C4A7vqrwmnJ+pxVn3FZ3+rJMZq
	74uh2JqzcxfZsIUPoYnH9TiUMxB3jsr4jPCupcQ9JMdHd9BngENf8QjqkBYqveiiQbmnjcjaKVl
	9y05jlBTzTsIs0a8aJUy2ARViCPE1MkGX1akHqTxWx9cKnyRWWw==
X-Received: by 2002:ac8:59d6:0:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-5148e838479mr204535441cf.18.1778502443682;
        Mon, 11 May 2026 05:27:23 -0700 (PDT)
X-Received: by 2002:ac8:59d6:0:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-5148e838479mr204534841cf.18.1778502443095;
        Mon, 11 May 2026 05:27:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6f9fc89asm193817745e9.0.2026.05.11.05.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:27:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Jie Li <lj29312931@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Li <jie.i.li@nokia.com>
Subject: Re: (subset) [PATCH v5 0/2] i2c: improve bus recovery for single-ended GPIOs
Date: Mon, 11 May 2026 14:27:19 +0200
Message-ID: <177850243044.63956.7149095798134345124.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511113726.49041-1-jie.i.li@nokia.com>
References: <CAMRc=MfMcEbQ3kkW3fMn-jzDoT2xdJWjp2xVBVsu7n683_5g9A@mail.gmail.com> <20260511113726.49041-1-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4KKP50ImrOGvdmt92yFoHQzj0bSZQsm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzOCBTYWx0ZWRfX8vJQgi3sNXXJ
 4khk+EkJmbXe8P4/aHokh2+x4l1GfbbFz4WQA0VRglQ3D99SA1e7qG+LA0BfE5qNhR+Xd2Z9efz
 4Mr1FF7PNQE5G7usca08v/urGUctT335SZGbiFT4Glisdm2hjq9DqyF/keU3hXF9CiUbT3wfyeJ
 KKIv2GnZBaGg5xQxs8FXQ0FF3uZGKwiBPNJgb/OH4pHSVh+pAIJEUhLem+hkclUECfT7eH2Ln8M
 Vgk37GHsHef6lQSD1/e4BiLYW1vdP4UzyyUnbcvyLbx76Whp2sT193sflywcfxTYJDnBVIOTdpp
 4UBPMOTavmSvNWD67HMWgM0wo6ZF0TKzDMMEtwt774mqTUCv5Qw+cOUG9hxxowUwlFlKLGLv0jZ
 oAI2kF7Tll/vlvTZz+2C7U9psZwUiNiDyVy5bhyxSn3OGxvSZslhN2EaLGVF1kU+qefHyi8OAmo
 FiH3y4O5sc3tt6ViIWQ==
X-Proofpoint-GUID: 4KKP50ImrOGvdmt92yFoHQzj0bSZQsm6
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01cb2c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tcrSvMvFkzysuFRZ2U8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110138
X-Rspamd-Queue-Id: B483650E08A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36566-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Mon, 11 May 2026 13:37:24 +0200, Jie Li wrote:
> This is a respin of the series rebased on v7.1-rc1, as requested by
> Linus Walleij. No code changes versus v4; only the base has moved.
> 
> The series addresses a limitation in the I2C bus recovery mechanism
> where certain open-drain GPIOs are incorrectly identified as
> input-only, preventing the recovery logic from functioning.
> 
> [...]

Applied, thanks!

[1/2] gpiolib: add gpiod_is_single_ended() helper
      https://git.kernel.org/brgl/c/b5fafa01bdaade5253bd39317f5455d13e6efc7d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

