Return-Path: <linux-gpio+bounces-38864-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1WeDLjz2O2qGgggAu9opvQ
	(envelope-from <linux-gpio+bounces-38864-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 17:22:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9026BF98E
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 17:22:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fi1MufoS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G71yfOYT;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38864-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38864-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBF023010BC3
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 15:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C0A3D9DBE;
	Wed, 24 Jun 2026 15:22:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393973B42F0
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 15:22:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782314554; cv=none; b=p6aWIEU3ERmOKPboaWwq4UcT5MAzqnxpuELW2C9r914AVFEtqUG9spU2l3zaIWI0LL93Hqr0Ne+vIEjkczRYBe3VSprIAUL4uMTUR/SiFGVuhhPe/gRauJsx+5Pfyk9hZWcb2DWrN1zp5dD3Li6addR4yRQE32DoynwXnVz8aa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782314554; c=relaxed/simple;
	bh=dAzEIa5gCgPyS/LXcXfO8ZCVaQHGDO3KWaZwZoXIljw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wn2xs+GKAUpCpNJlRuyNYC+vR0MiPAPD6fr47MMDOIgbfZC1GJdSloTLT4ot85Sv+W420XG6L34djtaVTvpBsNJ17fqxClZXAlrF1auanFUxhfTogm8QzQhKRSIfxGBXVKMw1s4nULZ2kK7A+MD4hur+CCP95O3axy1GvZiIkeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fi1MufoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G71yfOYT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEg1V23078922
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 15:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQyO1fukYv6yKQbLyGYD3UltGOgqCJLVlIq2+ggbTNI=; b=Fi1MufoSbJmn6SyD
	zT0Pp6J0eUPogd9eN3YlRVyXhn+jqxtR7XsOZhHjvYWPyTQNQVsIUqdx3Hoim5q+
	8BMuUQdV4HKP9x/m8sk6uLEqtwWlNNDqXcs19VBP8tSekZtVrEgSGIyoL1Z5AoM1
	r4Rr8DHK/UXQZBe20JEAjdLeQv2iOeu91a3aW9AC1nnHwYQvqv1+wuTtP54fPHL2
	P700EJMcsrNSWBaZP2Ipivu0skR51iZDxWbVaSvg+eIxMEheTpH1q4uNJjmgfWHA
	8P4usNLOEfp5YirZc9IERqSJQ/XWaQHYANNq0xKK0wS+nBTuL31sPbG1SJKkA4FP
	yNzkxw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfawfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 15:22:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-728f9ecd022so1133989137.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 08:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782314551; x=1782919351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQyO1fukYv6yKQbLyGYD3UltGOgqCJLVlIq2+ggbTNI=;
        b=G71yfOYTYc611L6H0HeCCZdYDKesxRkUV4Uj3Z6Hl4hHMdYTzsE6BNy/UpgL5/w+i0
         DCqTJwKW5oPLZ+e8ck7AIkjvCdJnvR86yx9soxjfkWHrSce8u9G7CLVqcYDfhOcD5rXa
         A88C9JNtPeuZENR6J6bWqSTaq+yA8ouRvZA99oXcgCsbyyQ23pAkHFIzZJvoByKDnXbZ
         S4g6InaDG2fmonkJqoRJWkBLwiVTRbE84LP/UMlPaumDvv/o7fa9ZiSgiNsl/V7tVJPY
         Fs5z80MHM3jChcqwMqJezmiK8pdt8Np54rWRcahUh/AnuTSPCfdHaiskRmRkEn8WCSeR
         1sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782314551; x=1782919351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQyO1fukYv6yKQbLyGYD3UltGOgqCJLVlIq2+ggbTNI=;
        b=QOPtanWX4S0mhmeI1Xnq1s1uDtO5c6OX0jGuaXPdvLvJDS39vOhzgyeZ5+mS60FC3h
         0Fa3FLS+NYAdYDuVgqudbWiL8tpUVfe6pKIPb1k2XfGVvRu57ngrLM44OQj4XgUzwUk2
         +TEBPxYFHApQ+GvWzOiAgEIY/qfkBIMhDEOceLWDaNpaR3AVbdnVEQCl1WPQMZRQ15js
         Ennf4ZoSZChqmoAoNxlTwBUJjI9MlGu2l0yxGANby5DNhgxAGXoVYm8ytpZ4XWBO0rpD
         uazzArSDq03Flpb2o0t5IWI78/qf4+ttWVMhr3qLbZGWts1tx1lpQfcZ3idgeXb5VKi5
         c+JA==
X-Forwarded-Encrypted: i=1; AHgh+RqfXFVrENdwoo+PrVtF2gSfsxNwH/wxO3pdVUGO4XAjPM2MExuEbY3l523pW2QyXSeLtPekevYCzi61@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzrkwDuTM34nYWGbgj8ye20Y6amIdulpUx6LTX1uTooZ4HhW3
	/MGx8vk9e1evwf607dsHl9427ujj60Z8bdCZmUKN2MiaS+bfPw3iB36Q1+yCuXj7vgU5bV+j0CD
	sWjYf9sJWwV6BXpEf1gaiU9eegynTo65aDDZ3Qh93ZJb74FbvU9Ydo+pFTLchTvdB
X-Gm-Gg: AfdE7ckocnTtsdPIxnITuGvW2frABzd738sYeteXZl6dSTRo410rXQwMdzLon9dBaU/
	FiuLXC/SCf/N/UPi7PpqtkOQASdlbcgOkLAAcw8mBfqn8tgSJsQGF2Zl3LTvOwMkAlNkFLOkSon
	2oR3ajTApC8AVtHJEYtDT5hZvbopZaLDoYJdkf5m3XZ4dgXPNZL+0k+X6QFmVpBGk68g/t0COsO
	IWXN84vm8bKw7v6ecrnj1Y9ht+ICUkLwIC/N3rHeyScCVRWpNQp4AQFUfzMPoWHzOWwo9x2Ephq
	xN/URYIaKtSiwI/MzfetggbQ+kTHxNmsQCeOtZWiHXPvtgGCpbRPONuo0RoZUxj85/qPTS5p3vJ
	xHjxTM9x9b3oJQnYKPy8eGjpsjGUm+2JgcdX5Xuw=
X-Received: by 2002:a05:6102:c06:b0:633:7d88:c77d with SMTP id ada2fe7eead31-73115d7d29dmr2384350137.29.1782314551521;
        Wed, 24 Jun 2026 08:22:31 -0700 (PDT)
X-Received: by 2002:a05:6102:c06:b0:633:7d88:c77d with SMTP id ada2fe7eead31-73115d7d29dmr2384311137.29.1782314551132;
        Wed, 24 Jun 2026 08:22:31 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3725:ff19:11a8:a2d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d998esm6876931f8f.24.2026.06.24.08.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 08:22:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/4] build: fix problems with meson build option guards
Date: Wed, 24 Jun 2026 17:22:26 +0200
Message-ID: <178231454441.43560.15118933397134731348.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
References: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3bf638 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=swtTIq4wb2AAr_GuQh4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: NpVGyq6BgZFXLVw_yPzxQLOx4g204eox
X-Proofpoint-ORIG-GUID: NpVGyq6BgZFXLVw_yPzxQLOx4g204eox
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyOCBTYWx0ZWRfX6PzwqW7Uk3/Y
 ara7w2RdK8UR1QM9Yadjnw64EocV8w9f/X8qgr4JCDXIXUPM6HdniQ3V5DJtxmFDo1BOuILIQT2
 vRJpMPF8UIlRYVkoaWt4AYgzd/+saJ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyOCBTYWx0ZWRfX9vi9IJXZMdt6
 8PCUxahwBsDFm8FvhSQSwmXsb88diORWe5m4Ei70aV1igMPl5MDg2uBAUAn8teJ7t3euM74xP91
 AfUScDKe4GbgF5Z9oP6ALRDiCVIKKI45z5+DbHxbll8bxLJAN+q3+RNXHvtpABRCYi73HmHvbSG
 2+1d62FMilM92jnA63jUZOy1opbUiGLkA2m8kivykMjFnrvAm6OVJh7oHpDGl963sn1tTCe48B0
 AF+9HoMHJ6jj9ntnsYEPF/Is6fDHL3MC56sJpzGOmYNMUI7zo8ZkT5VjpHyM8cPLgJnTWIM4sEy
 UX6ClVRSOJPNt0S8/DUAB1ct8mxwYD8fmTBQIDCT6oZ0XfJcsIthVUlyBm6lS/bVM/lb7FwhDCH
 v2Wpfmrf3X5+1Ajo+WrGkJy9dCeAFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38864-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:vfazio@xes-inc.com,m:warthog618@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5C9026BF98E


On Mon, 22 Jun 2026 15:58:06 +0200, Bartosz Golaszewski wrote:
> This series fixes several issues with how meson handles build options
> for libgpiod. Most notably: the problem with catch2 becoming a
> hard-dependency if tests and C++ bindings are merely "allowed".
> 
> 

Applied, thanks!

[1/4] build: don't make catch2 mandatory when C++ bindings and tests are enabled
      https://git.kernel.org/brgl/c/7edfd6b7746c612195765649523ef6618b9eb37f
[2/4] build: include all test dependencies in the tests_enabled gate
      https://git.kernel.org/brgl/c/372a5da1d8fc408bdac362d22eb7396e74519eab
[3/4] build: fix incomplete dependency gate for glib bindings
      https://git.kernel.org/brgl/c/829eebf6a085141314bb80522b6678df58fc9d4b
[4/4] build: fix incomplete dependency gate for introspection
      https://git.kernel.org/brgl/c/1f38ba3928eb16acf85512ce1767226ce5413425

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

