Return-Path: <linux-gpio+bounces-33805-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAnaFsi/u2n1ngIAu9opvQ
	(envelope-from <linux-gpio+bounces-33805-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 10:20:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCF2C8835
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 10:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B55B303DF73
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 09:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FC135DA55;
	Thu, 19 Mar 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYEpPn4b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtRy2MRc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A113B3BE2
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911921; cv=none; b=jyM13foIYFBXMxycIJDYtkX24oRS57m1gJuNaIm+nAG3X2+VtIPVKyvdoUoQNMwKoabh6GBPMvyQqdYHtKhx7vXZRKyyXYRZACVioxiTIBXB1sRc51kPa0MMNxkfzrp2q9lUOcQar9eobTPcZ48E57Zf1gfmGC2JV/RdbZYN2BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911921; c=relaxed/simple;
	bh=0yrja59WDLaW+I+3kDSA83GaWPAXw1HLdErbPGnNnws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4y1XBxZaYur59a8AjvSW/2q740+aLGowoNh2SLf5TLYzjuHo0cksai5MoPOYv2k+nNX7kYft8GFmwvVb/NHuAAeOmnHiPu1YSU3QCvPfzefrcENzTeTuQiX65wlXlk3yn2DiuHmzXcnCobrkZa2WxsqAKpMx8jN/BHEo58PAGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYEpPn4b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtRy2MRc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J746VE770715
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BdXIWeXKtjnBRqNW1WeJgnSQrpj7euoJb6BITymMODA=; b=EYEpPn4bNIWfHNSo
	5K4UV5cd1VD5ppLbh/laCVPlhAL6cXdGiDq+2d1X7lsTUyMD+LQEjyxUnZ1nZcQX
	XLbkypnHb3HTssZA7ul2If3dsTJzVv+SLjZLJA+bsghLCGgKGGD/u4itURwwND5X
	JmCNpLDyFMWkj/1WYQ3dPJVRoGplKbr8lkHfTRgbbdWprSo7LryZ0BW5jvO/RJi8
	VGAHmx12ZBvrWkdxpQeZ+WHBgmizYHnVvDHfgifs45huZvWOi4+Rc21AMqsaA0Gs
	GP3v+4ZCjJFYP+j246vtvexTy6tjwSzHzdTN5xtiJwdljq6SlhRdmYHe/tpeZbq/
	S833sg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00egakne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:18:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50939597b85so6028121cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911917; x=1774516717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdXIWeXKtjnBRqNW1WeJgnSQrpj7euoJb6BITymMODA=;
        b=WtRy2MRcDk8u3tfym5gfIC3724QsuLsjkm5BGD2loF/K+gU/961tQQuUMnKlpzb4aS
         dgqnFRyNJk7CzX527NfYM+TyS0iuybbWUiqJ61bnLldI8yTVhhlnSL6yekh/ceiLj9ML
         FLjRu9eP//OuYk3cj+WK/wID7xhDz76vUtIL/zMAjdTV/4oPrOn+4rcnaEmxD8d1ga89
         6DlO/GOVNS00jNBIFlLyFxZpCOJRNzhBYaMwV3CAlWXl5b1dGLAlmOFAl5ofwEjBJhHh
         +eR9QDvRUOSLXtd3hdYzEm3O46UqDLkRe+iNToj/aT+pU5T+WiJlWb6f1xaFdZjRia7/
         ZmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911917; x=1774516717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BdXIWeXKtjnBRqNW1WeJgnSQrpj7euoJb6BITymMODA=;
        b=QkeNpP+I8L1G/1LYTwdsB1BneKZDTVmxbQcx9Z+4VvNkjoKM/8q3vpMOsuf2rfe7cd
         sLg8fFSIl1ZjQH3Tl/p7IOZbRTB2E3e7tx4KkD6dDK7nQyG17fIW8YyEkmoy1QUvaAqo
         T0GRLWYFjgx57b2jlFobs1IIec/mhd1pUQFmg5pnSHRdPF97iRcbZSz1mT5Hyuq5HS+g
         Z/r9hlbf6XgsXNDPpiLTgSuQsDZVVujcHoy6iiT2DABdVMHQOb4ifBZuWrCk2R9N6187
         e1/YGksoZIcuF+snknfHCsf8JT5pviZXzWid6RxIx+tMB9h+jT9qjL5l9Jt0/6UHCdO4
         jn7A==
X-Gm-Message-State: AOJu0YyBoy5LmlhdnwV1uKf+1at3X+k/FmCv37cHlgynXWWavHhMIeCM
	/U8xoQEWXo9S2RW5rejdIPE90F6l9e66YS8AOT36jjd9nib4G3JM3yI3kU/xNuPaVu3oYWJKeKD
	No+PDI9FznyAMWci1+ueZHPZ6b4VyHiU1b96rHUptu53KbNr0hwKzL8dE2NE0dXXnQQXkTWn/
X-Gm-Gg: ATEYQzzb8/ex4Aq7RZDCDm5d6igZIcH0D+JPbUzfW4I7dD+G2Lp4iufT4Q1aPt/cP1U
	k1vv1OpovfMaCE2YGZNIxYrTNLwnPHJ8JIte+ZDW9MLIWjGsZpvOyAASnpqDHKV8AKN2AOl4bur
	i1o/gaO7FzA0owE05KwGAA4bdynKzm+7N6hkG/HAT8HWJh2lphlQg9RanY2CsDnOC1/WOQf2Ltu
	9LK36rDOExU021F/l51eP9tnAx1XiIHCgv7evWjRqT7NPU83d/mbyIkBZunHDtwDlh3PPZOdSwt
	pDF33AO0Xojy+Cv6WcSVQtCo5qhIPTrB6OeVFG+FIv/Knlx7W1aqkRm+zozKFR+hnGBclmsBnex
	ULgWvRe1r4FFXGgy3G1qaGQS7u/iifsRSbszmBlOS6Pu9ZOkufS8=
X-Received: by 2002:a05:622a:50a:b0:509:2677:68fc with SMTP id d75a77b69052e-50b148072b6mr88734451cf.10.1773911916732;
        Thu, 19 Mar 2026 02:18:36 -0700 (PDT)
X-Received: by 2002:a05:622a:50a:b0:509:2677:68fc with SMTP id d75a77b69052e-50b148072b6mr88734281cf.10.1773911916366;
        Thu, 19 Mar 2026 02:18:36 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ce80:6f29:7752:c44a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852aa8sm13165716f8f.15.2026.03.19.02.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:18:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org
Subject: Re: [libgpiod][PATCH] tools: tests: remove SIGINT test cases
Date: Thu, 19 Mar 2026 10:18:33 +0100
Message-ID: <177391191153.50155.1254986179651799789.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318131413.56575-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260318131413.56575-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bbbf6d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bsqj0Bv36eXld0bsaQIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: qVcwkas3JkfidFCzXVmKdepmrVNUkHFp
X-Proofpoint-GUID: qVcwkas3JkfidFCzXVmKdepmrVNUkHFp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MyBTYWx0ZWRfX9MihaFBTsgs1
 cPf+zl97HrNcjP+Qnhkupd19zkWM2NcbiLgf2ob9ZX6xG52JUnlPSEqHZ03gUxnJC6Ao/PeFmSb
 8rMabd38n8cXjRuUIkz/bwlPk3od3kYQ0JzhmTMkBrVYzadMEYTs3ABv9Apv4i8CE6rU5PnN5AT
 v9xXeXBq4QEo/HZmat9+xDrgYLPFndVwHnkY9S9hQdIQ8U8ae60kG+YO6U7ubaXOWTm8meYnLdO
 vDBixEfdBmPexWEuZSmjyCKlUKgrA4bDRJVeRPqEef83k2wzE7SJ9otEEwGRtXKjYMMAG4OsvRm
 OND2JcNkwiU+JpPu05w+3Deo24Yczji+3YSxCDXJSwS18rXW0eudh4HQCqjApAaj7GRFzhFUeFX
 I1bLbAOTYp05MAqOLmc1+MvB3HZ63O2kKvU69FAoBwvr1fWYSdSqL/QXELCJA2JVDeMlOSYaqCc
 qRAIK7UXdxGFU9kW6Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33805-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7DCF2C8835
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 14:14:13 +0100, Bartosz Golaszewski wrote:
> In coreutils v9.10 (specifically with commit 8c2461933411 ("timeout:
> honor ignored signal dispositions")) the behavior of timeout changed and
> it will no longer propagate SIGINT or SIGQUIT in shell background jobs.
> This breaks the test cases checking the behavior of tools after SIGINT.
> We have to assume that if exit after SIGTERM works, then so does it
> after SIGINT and remove the failing tests.
> 
> [...]

Applied, thanks!

[1/1] tools: tests: remove SIGINT test cases
      https://git.kernel.org/brgl/c/576e3f5ba73ff8bd5ceefefe5145a885413ac06b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

