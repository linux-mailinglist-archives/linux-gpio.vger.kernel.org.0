Return-Path: <linux-gpio+bounces-38102-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qI3TLp/fJmqtmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38102-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:28:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C756580E2
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kNk0aaG7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IEMoBsSf;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38102-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38102-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B29FA30A0F24
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036A83CD8DE;
	Mon,  8 Jun 2026 14:48:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2B2989B0
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:48:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930102; cv=none; b=GHKuIe0FgaeyaFv8fuYTTseo6eB7UQ/n+cyirtdp4aCQWlKpniMQc28iyl5RcEOhP/xI03MHSbDjVzAhi3292dqI/WUFR4d6QGbQuSMV/+2aUy1gzrYBu/4I85WDOFgh+CzVHZuLZCS02mAQEk6AUArJWZvrxuW149vwZ5MlnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930102; c=relaxed/simple;
	bh=SDDxeg63wHDJAuT6uUffF5xIV66ht98AApqudA+IXH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFYm++zplG1uUAe3UZkPdNHTDtjEwp2mB4nQBar7fkFkxnOjea4CoZ7uORgF694k/62c7naMX+BrNaEm5PmCCuDDosNveGEX3wM0fb3hTqcDSpaou9VBS9V9Www/RNKQDPB3rg1R8hQoRaRhdeC5hXLuIqJDngIxHROW4ahOzaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNk0aaG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEMoBsSf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EXlK83493472
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 14:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E6moL9lFMIMqrv8f0qkPKSL8+ZBpttgd7Csfb3hbR+A=; b=kNk0aaG7V+dWkOOP
	WD1vAJOG2IWhD7ekvLqmc5ZZp0quEc1mpJkqPSC72BCr5lVrdfAvj2S1ZT4gpXQE
	wBs6AktGoLr4/vm/yocvgAQ/S6F63exp2IX0d9A18FqiOBoHH4TP9if6b82KjVlT
	ZB5h9+DhlQSxCvPm58SD6g7xudjPhUFdq4RjW+kN76eiN1g+IzV6zPENAtGTHnJC
	iyRPoHOW5HXcfxRWzpW0rLpkx21RlfTT9qB/2+Vp3fLZU5msip+S0UbFsmFuPjx6
	M5Z45JsYAwvRk2G/4GNhAsnNZOZxu90jzmTKBD8FKPwTd2DV88y0SSbIReasJwub
	Xm+tFA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m0v7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 14:48:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517582695d7so103505281cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780930100; x=1781534900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6moL9lFMIMqrv8f0qkPKSL8+ZBpttgd7Csfb3hbR+A=;
        b=IEMoBsSfAUkwR+41C2HR+KZxo68rejrwgPWFde93TbULzkIUe96G47XyZ3dKD3TpzV
         wUOL34GrPFmw4sgtFs1eM45/lmuaBjcWRF/VdRLMtnKC1Dz3D11016IgC3/2WmlOf8Bo
         7ohPk0QUZWkMBqJpaGGi37iRBL0SHWanHUnBgF0aUmDi4pgdDDUIV3yqNFREdAhJFfJ+
         kv5rUfgT7BtWM8AKXNikcLyF8+XFyRKjQBjnPxVD6TAA4NfzFcawHfObbvnLi4LjYGP+
         ivsdwI+gJX759hX72dbBOK7fYB3csNg4GbIBWCYOxM2fMMdQHp1b7fP1v31T6K24ydlY
         0SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930100; x=1781534900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E6moL9lFMIMqrv8f0qkPKSL8+ZBpttgd7Csfb3hbR+A=;
        b=o9Pq4pxNqZa+jxz7stvb7uYJ12ayXUXMWHdC6LsEZ9/2TxgGLeGcNjkn8bM144m0yk
         M4+SykFuuPHLGshKQ3KHhzTKnahQ4ifiKszM3RRcKAyrsd96amsEs3BQzJvDyvT7kUcS
         9/m+CwDOhn4BMicaRCmv3FNum3AEIH7cjg5PD/Zz3sWT5R4NEBV7982stteC967aC4Xp
         TzDROtEDZ7y7n8Cd4f+pZs7PELjVJylMHkdbTwsH9hvDBI206KzBwN12m1SyOa05kCxa
         uMhTSJqzwotVAeKmTlaflx9w7HBtlr+FFwJZStux9PCEbw0yBgt2YO2i5DsAWtYiIHNv
         5Blw==
X-Forwarded-Encrypted: i=1; AFNElJ8JCxZOR2NE8/WmEIjlyS/ziLsrsInWP8Efi9rVuuaBHTPKQiPAqfbKjr8KQ6C1pNNJXbD31FEofKCb@vger.kernel.org
X-Gm-Message-State: AOJu0YzrsdLLzT7KgTwPqs3bWSC/K7af8abB7dzr8pq34+XYSOrGx4yk
	Chrm4MVXe7tQ77anUYswb3+Y4E0hpzu7KQja/AQx9HPrGYaMrqYFBVyVUiFEX00tMeegM8f6Dlc
	31alJd8bVLFEGllaLvfXTBgdALReECq5KMhuOtYmjs5eaey8E3qadGQcXIdlAv6pz
X-Gm-Gg: Acq92OGHvR+VltZRBu1FM7JNqdF3UPn502pKo5UOkQuqTWUbIWrz2QrNANuEzgfPFmK
	1M7oynR5EWmw/vjJyGbGVbkpppDUC+24k7nQ05M0tyPHPLuLTTrKe8W6viw8Pz+53xDsl3Sj8Yw
	E++Cp56l19HfjEaDzg/PISoObKrhbMR6epo6DwwrTZ97cRyUoa6HfkL0Q6fTW8TJPcbXwR+1Ln6
	uHTEVscza1JWvOiPH0g6x5MxER97o18BXuzO8oSAkBt0LflLpCyU8kl9aktyGF1URpuVDpGP0jS
	+9KU/OMGRJO5ZUm+GtDjU2uGA4Go0wqHGs0zNi2TEllSJjxZXvIS8vPbt+jfuZx+Y074/Kv/LgE
	dRV19ginubByfE+0XzK7p1BS0pAG2DDlkiklQoXqmwAB1jyoDnUvfC3XntE/P
X-Received: by 2002:a05:622a:4c13:b0:517:5bc6:b575 with SMTP id d75a77b69052e-51798673664mr153311251cf.4.1780930099866;
        Mon, 08 Jun 2026 07:48:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4c13:b0:517:5bc6:b575 with SMTP id d75a77b69052e-51798673664mr153310561cf.4.1780930099267;
        Mon, 08 Jun 2026 07:48:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm462705665e9.1.2026.06.08.07.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:48:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 16:47:49 +0200
Subject: [PATCH libgpiod 1/5] core: line-config: use
 gpiod_line_settings_free() to release settings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-more-pre-2-3-fixes-v1-1-577a5ba426a5@oss.qualcomm.com>
References: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
In-Reply-To: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SDDxeg63wHDJAuT6uUffF5xIV66ht98AApqudA+IXH8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqJtYoimpnUCY7EtsbmOqm52rvTbe9SYsV1dIn8
 IPdUjh9LTuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaibWKAAKCRAFnS7L/zaE
 w8cMD/4jYUJH9TT5XViEQk5MkuCdC4zgjt0H3VUCrejpfF4nYB6xxsKsaz93L+7kEOPP2dw39gk
 AV2XFOKpMPWdF+n5wGamRrLbiWR4ZTfuMfhYll5Va+yUI3iqq12W7YUHlopPIGVfEOeykwuSYJY
 Su1eMz2uRWln8H6AI8g4VgmBKBlTUa8vtCPAnXVbGJ49N3s66v13przsePrzv3XLzyxfZotf4CS
 enJXnMlTGkCgVypsFEZnJyqNNABtBN0FkPpHratpayN15PYpHlmmRRW8T6zjL0DUXX5/lAm8Onc
 +RY8akNww0ldjNruBh6rKpulqGQGohOPF/y0Mnhv2uKXsJ2Bkh1ICL+JiLAGB5BAKTK4aZOI6ZG
 tw+ek3HBjMcoHrHl4SNZcXpCzu4lcQeRQm/6H84sMH8JMUnLEoVJgGtR9Qub+zyFaQ9M1YKHqs5
 rd3MQ3in6m1I5YOjFmN1S+QzVEPHMkM2j1iBnvSfn1tIRiu3fXzSfkswY87+E2AsoxcmHH5vfTj
 TslPT91z3CPqgca37sTIjY8Ns2ZgIljOEcGrjk1bv3cxI6w9GhephQJUogYk/W7JMWoYDlygjwN
 TRAxk1rXvbLfGdOanXSRJU+AgfdMWyuU85ddBF1P8+qpqz96YUhKWYhplPMlKMOdUW/TNJ+2WVZ
 ddKyLf3+dIGLvbA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MSBTYWx0ZWRfX/J/0o7uqe3Hg
 ZvwDS4mRHEHDyQPGw+vS3DeJvlaEnijQYGYGBY07O9PENMR9spMQPqfmEWVGkEWEMZwT4/EDf+q
 WEZtGz+r3RtHW8dfGnRn9wtCE+D60ssfb3A5dDONkAleSEQ9v/se7o02hcWh9BxpoENcDtqXxpB
 zoUBufs4f2XP7zY+G3tzpp9c3JyZAgALXOmdYYAsxxrDJIvQmHg/fqBVlEou+eQWU4sxjz374o5
 p3BkOx0QAovgQzN5arLeLEIAG8bLbEqpRt0kbiObhRkqm8l9oGxTFZP+1ZVn+5aQEtwRiMEt7Dz
 caIboDO2q4UJb56+xjn4ONvab80KHirEN4m0UQIP4dBz2GGDlhpnwGyv3TIxdwyMRrNSytoCDFf
 4SlxDCvQJTmojT3ajKf5b8M12pr7f2D+Sffv6HQSkOKurJXjf2daEOJ+0xuaZeBpHQ6gqUn0u94
 CUyFXG3OeE5wSCu6zUQ==
X-Proofpoint-ORIG-GUID: 1_dj0b2JYV2CG9Bc8y4mIsrX0eMZVLeI
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26d634 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gfqnp3Hz0WcbZfN9qZ4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 1_dj0b2JYV2CG9Bc8y4mIsrX0eMZVLeI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38102-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96C756580E2

When releasing a no-longer-referenced settings node in
gpiod_line_config_add_line_settings(), the embedded settings object was
freed with a raw free() instead of gpiod_line_settings_free(), unlike
every other release site (e.g. free_refs()).

This is currently harmless because gpiod_line_settings_free() is just a
free(), but bypassing the type's destructor is a latent leak should the
struct ever gain heap-allocated members. Use the proper destructor for
consistency.

Fixes: 2560a857ce43 ("core: keep memory usage of struct line_config in check")
Assisted-by: Claude Opus 4.8
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/line-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/line-config.c b/lib/line-config.c
index c9e5cb0d9d2f27e441856ffa1b09a0e57a0db2ba..f00892e6e78d5b36a8b1433701f752e7d3fedc13 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -182,7 +182,7 @@ GPIOD_API int gpiod_line_config_add_line_settings(
 				old->prev->next = old->next;
 			if (old->next)
 				old->next->prev = old->prev;
-			free(old->settings);
+			gpiod_line_settings_free(old->settings);
 			free(old);
 		}
 	}

-- 
2.47.3


