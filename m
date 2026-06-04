Return-Path: <linux-gpio+bounces-37928-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4HmOK+EtIWqsAAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37928-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:48:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A956363DBB1
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:48:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hjR8pqQ1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kp0xzVy5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37928-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37928-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44DEB30086B8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5003D5677;
	Thu,  4 Jun 2026 07:48:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C3337D137
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559318; cv=none; b=F9Pbj/FhoCu+t0OwBKejIN8bHRia/Wk2RkjRdwYJ2WwFCJs6X8zz+i7BzsjeTh2fqNaXYIM4ZcQHW2abGYL18qvfIxADhtYIuE1ve8yFD7MSqNVQp/v2MJu5+z4HeuRf54Zn8EdYJekRSFbQ3Pf+5DMULAddAh2wAnPM25MBjw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559318; c=relaxed/simple;
	bh=28YyTAdmf/ubcwbNgM+noft1YoY8MA+k2szSjMOE/Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ac0ozhp4xRnoVaQtS5mpNw7NlC4XZE/3oxaM+3so0w6F0ke6TL+M/79f7zcth9aBuDr5+7IllvIbbP3K4vDMRyWGcZDmqSvB1kdSc4w0ndW7kPfI7U1yJgavsG5eLjQrvey6/oEdtvfDH5sDwQnCmJxj6OLMCgTzKXV2aR6yEew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjR8pqQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kp0xzVy5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6544E7Vc1993447
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/YbW25v0WtXwj27+lwHh/Kx1g7xgd6IzmEeIqfC6pI=; b=hjR8pqQ12iy9+4sH
	ivAWNgoT18wrReeWMlHAy0ddQduwayEPVuKH9s8mKIgtiMuI+pegDJ9tpMSDliz8
	Ig2LYnCFcL/xGr9uf6EAJ3dz1JwCwygO24F0w0+IcjDyIBJkIn4OD19HPpC5vOnN
	xkW2vBJ2euSA8J2SyN4ldHO9uQeLnaWWcopdaerfSbmlP6yclAxzfVCgK6hPWhPd
	y/uPMFLvNlg4aCv6YUIQG7u9SbzZE2g67UgfjD/a5lWPKbq6br6XM2bZXdWWfms9
	0p1Y9FFpmhDf3+c1oSbyZQVKZ8tMhSbkCdBogd4U/anKBQTMUfp0Oa/zMn1Fcr8r
	CbVunA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8ptjb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51760f997fdso13911541cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559316; x=1781164116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/YbW25v0WtXwj27+lwHh/Kx1g7xgd6IzmEeIqfC6pI=;
        b=kp0xzVy5TPj/4t1yFvMl3mVQO4s4DEj4QqD0egbyhfOu5xOakLfMTmzJwJvwoARKT/
         Yj1JubO4nHiCkf9rt+6/cX4Oo0m9d+zbbrR35S4zVPWm79Q3lt42o0GSmh0QutkB95xU
         dREvTe7GmE/ZW1xBvHkAJoSu1i+tdQ4ygC7+a7yYEHlAWg7JNNVNFoWckIueSIPWFcRk
         AuzaaWnouc1/6QoRLPCvxTdotRxci3jZJOHdFvTFI3/ouKynRSyXYrPU8bPjLHsNm1fS
         MiPcRCKa+BXq0KJwUj72vzeBs3tv4jkl2yhqXN7Ci/Asc2Wq0k6F8uSVs3zC1cKh8V/g
         7Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559316; x=1781164116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q/YbW25v0WtXwj27+lwHh/Kx1g7xgd6IzmEeIqfC6pI=;
        b=WBdJrsp8nD+SXP85xuL4J6ATCUmPByEkJI9il9DmHvAaQMata0BnuZ98oFiALZTQPN
         uOOTSgBim+HqAx0T+XKXqUV4WDPY1IKN+Maw/0fIYTzSz1hyPuAMDgkiucsU19SezNpw
         eLhFh4DE7qbYGPZX5RSWYkT+T6En/XkSsqQ3ne8aNdsY/8hrp/fQqTKDYFdvWzvXC38Z
         0gKmXm3JGC9vi4H0oK9mltw2Qr0/oO4doxbWHOsyJ0bcZ6p48AAGQzFKQEmPmkqqJ5Nb
         JKPN/oO09yMLUKDt4YEwWDyYDLfEGbOyKW6cDYbH3lrNlIYQSTF7kRqNPKqinFJ/QneD
         uomQ==
X-Forwarded-Encrypted: i=1; AFNElJ+x3ikmh1JCmqvzIDJn5vFo6YgDowaosFJfCVbdb9GLqbIzrD0owThc6VMpgtrwvktuMX6d/sXjg2hs@vger.kernel.org
X-Gm-Message-State: AOJu0YzAKsCZIjim89MTSWpscBec35RxlOo2Q7dtscz+kG+k7RqCyWMv
	HVpvm3QulmDT4zUrdcm6Yu2pa52tYsh+Z5DqBzw1FjlOy9nrsJrXCYSiPMnyansSY9iG1ahGmyK
	uMdw+VjWIhWv67mqqugQtGH16ZbmmciD7hYzkvanxpI8KK4gVLN7AbJ0UTrfiYk9B
X-Gm-Gg: Acq92OH/5QVBJCs1C8rO/qozUgczWZBGac/7b/0et3vOUHcoYrM8AAEy7NwM2IyssAi
	2l4cX/dTtF+Y+gmZxMiFsMc+gDgKgY8LNLTujZGO7zuXNLls3nx8s8/Ircpdo3SVC6kESb9z2OZ
	WWfq4+BfbwJVVahc0Jvuuv5220qw+ud6e8cWKqk/p+KoTBsHFC9eflgumdU8DlANggat6/OCSIS
	UuZXwXu+pK8j8h7oak0anlGFPhx5nheNCxm3rPgZLW7YvhuMgehrlFjgcj4LH6R+WxeXD/LK8c7
	mexMafer6rphixupt4yqGhxvMT89hMoC15pOG/OqcN/1+tK8AivFjS009m7hoyXdFttRL3MzqUA
	YC9qYHA012sC3IarCxio+dIOxjB89HJqB/O3BASJIj5GgExG9H35Ge5eApjDXvutKiF1WHnpOuS
	OslfNH4Iw=
X-Received: by 2002:ac8:7dd6:0:b0:516:ddfa:23a4 with SMTP id d75a77b69052e-5177876293fmr96798441cf.41.1780559315809;
        Thu, 04 Jun 2026 00:48:35 -0700 (PDT)
X-Received: by 2002:ac8:7dd6:0:b0:516:ddfa:23a4 with SMTP id d75a77b69052e-5177876293fmr96798161cf.41.1780559315338;
        Thu, 04 Jun 2026 00:48:35 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:53 +0200
Subject: [PATCH libgpiod v2 10/15] bindings: rust: implement Eq and Ord for
 chip::Info
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-10-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2320;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=28YyTAdmf/ubcwbNgM+noft1YoY8MA+k2szSjMOE/Eg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2zls5zlk+cjTarTq6fxqmeU4dZhMqjOav4O
 yXBSjOJy3+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtswAKCRAFnS7L/zaE
 w77jD/9NEY1Yun1gYfnPi3qNc/10CIyiHm/Q6U0obOEEaKwOe8ArgcW5MTibp4GeUqKsAArGLz1
 Kt7dHurigxoxhnF8jvIlo4wPsy75A1tAQoSRR5BLAqb6H7YHWroMok5cnGCupmjl+roVEfP5GsT
 cjGilhO/6ouiiGbHTv/OBTBYlsSdJIhXlTHm2/7lq3rYa2QoVYfpWPJPuXCNtyObupfJZWWGvr0
 I2rx5DaVoIp814iUrT5FhtC9n9IbPhXIaPH0KjAGAIWfaDDxmqxneEjNuNFCfNLPpC9LvjVjKWJ
 +MXnS7KH2Jb4I+iF7hHAOp4ydj6H2HuLOFbw/Eq/hmCL1d1+ck/899BJnT7kF8+XisYPWzZvALd
 W4xQX00TvMWXPz9Fwn7JE25+NpKHf+gKDWn+rxxs2yB9SdAHWwE6+P0lR2aigul0eMZQR7I0AmU
 +PMtn1/lzPdAR7HDhtk4IxViXU/YLMk2Hu+97vPrO4Lg7KDZyymjwW8qHBdkE3EvABL+qBRorGo
 HtQvJT/JTgjNm28qnXeR/3MuvYcjFkGsZGhRJbB1kAW4+Wk3uVnryKsf9nE491KDcl6TNaKuIl9
 ETkhKobHJ60qEuCB2c/Wo+1PMElCxurjMrMwTPWAG487WcUmgbNgKx5tpO5Vmiq/wAea0ay666k
 KB85ISp4JfM/FSg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: l8ddTIOujO1cHcrjmzMxvTDTjW-DCKg5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfXz2OhrqoOUqUQ
 P0Wxg23o7l2+h9ENh3l1TgT4V7jUsJnZTZ+Z0C4citiXWoCrxbOmRzi4I65LJMwaZD06c7wNbHU
 fxZKPfZtQduF724AvR5oNp4kYlZzGRmfWi//N0pNhfc7vXlaXVyc2May+/CfApjgBZt7tSpoWgq
 LDTuz2R9lGg+vkc9yBaMznCpfG7iggUx2PGt2W5E9472S9dXXKuZqRi+c19DnHrWOWc3Thbqr/O
 UjK64EmoMjX2uX56dGwpVf35mCTwHQN3Kur3pceTmW2ERYV6dcQKUIWjAKKfwkO3KCJ4RoWYrlQ
 eRZA5IdNxeiUKkYfHRZOLms425gfsFu1Bsxitb6id8E1p9p/iSXPdwQ0kD9pnnW725I5qZpevjA
 FCOhw9uAWokPvVc+fLEWbEKIU6ZcduvNWLOhvuL/8GQG5bD9rRSoc+l87DUzpaCVHnZexYNRNpT
 /oNAGUTaencdKV5WLbQ==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a212dd4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3W9sBVhNAAAA:8 a=EUspDBNiAAAA:8 a=pkKejVImPdrJaLrAb2AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=38sOm0jhF1M2KuwyeTFR:22
X-Proofpoint-GUID: l8ddTIOujO1cHcrjmzMxvTDTjW-DCKg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37928-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,xes-inc.com:email];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: A956363DBB1

chip::Info already implements PartialEq and PartialOrd (both based on
comparing chip names as UTF-8 strings), but not their total-order
counterparts Eq and Ord. The omission is inconsistent: types with a
total order should implement Ord so callers can use the ergonomic sort()
/ min() / max() APIs.

Add the missing impls. Ord::cmp() delegates to partial_cmp() and falls
back to Ordering::Equal for the unreachable case where a chip name is
not valid UTF-8. Update gpiochip_devices() to use cmp() directly now
that Ord is available.

Assisted-by: Claude Sonnet 4.6
Acked-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/rust/libgpiod/src/chip.rs | 6 ++++++
 bindings/rust/libgpiod/src/lib.rs  | 3 +--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index 1e98cb28efe97d7cd97363a62cd5b2b346cf381a..22b4eeaea5a2731dfb1a56041d4be89103e29896 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -282,6 +282,12 @@ impl PartialEq for Info {
     }
 }
 
+impl Ord for Info {
+    fn cmp(&self, other: &Self) -> Ordering {
+        self.partial_cmp(other).unwrap_or(Ordering::Equal)
+    }
+}
+
 impl PartialOrd for Info {
     fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
         let name = match self.name() {
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index 22a3b87975318713d0fffd5a3e4fed214e984044..fa6fb0d0f65b1cd3fec710e8c8832fc010695b7c 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -12,7 +12,6 @@
 //! The API is logically split into several parts such as: GPIO chip & line
 //! operators, GPIO events handling etc.
 
-use std::cmp::Ordering;
 use std::ffi::CStr;
 use std::fs;
 use std::os::raw::c_char;
@@ -492,7 +491,7 @@ pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
         }
     }
 
-    devices.sort_by(|a, b| a.1.partial_cmp(&b.1).unwrap_or(Ordering::Equal));
+    devices.sort_by(|a, b| a.1.cmp(&b.1));
     devices.dedup_by(|a, b| a.1.eq(&b.1));
 
     Ok(devices.into_iter().map(|a| a.0).collect())

-- 
2.47.3


