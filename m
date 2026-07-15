Return-Path: <linux-gpio+bounces-40098-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T2v7MGdAV2qNIAEAu9opvQ
	(envelope-from <linux-gpio+bounces-40098-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:10:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0875BBE3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:10:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WLuoVxNx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PCRor7NF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40098-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40098-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09A8D30022DD
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEC93C9EF0;
	Wed, 15 Jul 2026 08:10:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB413C7685
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:10:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103014; cv=none; b=Zr2vtHB9gDkdc2dAvMpyHP4CIa44ELDefLzEmz1u5VlN4Mqv2RugL5dGaPnT/a5flZ/47xT8KrLJIMrEsN4kDp8UfxzmOFGrXCT/SJ8I02NbJP54+5jCGv7U+QIuhfQsI/OE8NWHyO5fspViFoG6PxmH+VfgJ2BZ2ZyHl6fGVpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103014; c=relaxed/simple;
	bh=VvkgfagcT1vc5nSolZR07uI67Ql8O5XmnZ1XQyW+g9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VcEjOeTN6wx0DT341Kj3iztBrQJGAM54UdgIOGRUwJdIl9m8Dllm9J90Z99//hsj4gpfmh8HwROgq8EQBAMzH4ErIDVwtbsI5sFnZTb3M6La8q7woWat/TgY9ABpW3wTNVOxHdzvGrhN66ywbGW25xKsUYZpTL+ac6ZUtflSFzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLuoVxNx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PCRor7NF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lGHF2555502
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yk+1ptSXLSxvsQO0q4HPMx+UcFjlR3FYDyGfnwcJluM=; b=WLuoVxNx/Ya7RoNh
	2jXsrlMbSLMzDyK8uH+pX6pNbYWwG0IwJjOujO7xDk0uxWi14fSrsswOmAoyxVW3
	HXvr84yjunIdV9FgBNdRC3w2HhoEmwdAASNdEyzHcUZUdZJlyrignG5O7gjGDfKv
	BwluPw4Fk3gpbU7isTYnV1pISXTjphhg2VBgBwNN3ohLK3AAqbwJ1Z8QQcN4fNFO
	YxJIlRwFPc3iW8o5bj12XQjriR7YQISUFS8yGPJJqWIvCMJ71M0HpeBOtQHuKcL2
	oqnmCz6YUAz8c4QSUk0qOAw2Hxy/hz24Ro4imQnwZHyTPCDMuhdx0h3du3P4X8ut
	rxNVaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9ktpe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:10:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso21076101cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784103010; x=1784707810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yk+1ptSXLSxvsQO0q4HPMx+UcFjlR3FYDyGfnwcJluM=;
        b=PCRor7NF+XtXiyDbOdaR4nugBpC3LvwjfUfBFQcK2kgpZCLRPyy32sUEulImjCsG/8
         nDs4VmXmNZpBPXbV3j3b9sdNUvJolReycC/1oXY+vsTVm73Xstls8++2bNd1ikQw1chy
         cicTWwdg4WZ5/NpLil/Q4kGGJj3rLCMASw7XhvBJx+4XO76oDi6xHrb+4Bzd02NnIkZ1
         i3dh2YikAQVYNFPv8VeHApXmegcetuWkjG4DccRMpRnnDC2bywc93r1PLmHh4+Pfypa6
         edP+c+dF38pZMLDB4B8NbUIVGvJvrttQ0CDP1sVsFHzMnrjDh6SDcfIGhznE+fxRb8lb
         Bgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784103010; x=1784707810;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yk+1ptSXLSxvsQO0q4HPMx+UcFjlR3FYDyGfnwcJluM=;
        b=QtSbK957OO6WsABQx/CllqAR5FEaa6KIYp0ZjH1icDlFKTwdGpurWudmed2cCkdCBd
         DgPd1sx177IL2CQysyEua5dzD0QeGDxzBLDaqtT3G5HZCO+xYXNISVTrJGAPYGi/k6s/
         VVI362/WTK4uKSIaAfdrr0F1/YouuvqC/2NhB+a+htfFJ+DH8ULlSn7w4cicYQ5xubHj
         3Z7AxvMzghFSb1VzcrhV8/cvMfMwXPFiFk4wjp0V+zHgsFHXwE64ycB5s6ukRclwyxqX
         2yJ9gMRuNTWX+jVjREuY8k6XVOQQTl3QZS12ikes6DmRV7bvPSfQse40jttYOR4yqSjO
         CzjA==
X-Forwarded-Encrypted: i=1; AHgh+RquE/OJQdyLhlWbGdoWey17/2IV0GAW74S7WMwEFw8XiyOlUpQ0X03P9x0DPuP9/zW9l6OdPjFkduHp@vger.kernel.org
X-Gm-Message-State: AOJu0YyDxnMvK0Pc2UqtZy4Svfnlrl/slaAIaPIQAFCGRJ/+q8geDBw5
	AWGJk7N7Dd38W7xTRNv02f58FJ92Z05MXotFlRA+QsqGw95zyeQry1kRAI5/xtkjjV7RmjeQMeL
	l5r5Zq5ww5Ltdy6nbHCD1rP85c7Wzc1s3edu8KKaZd58RtLfEVEN7GKlJswmdqFb6
X-Gm-Gg: AfdE7clCjqeyGcr+lqyjpP9gmdxX5K2f55aTiJmXMKfj3WlBB8I5iIzzPRWG5hYGo0Q
	hKcBI0JACEGxbYA8mvf3mo6mw0tLuGyP2r2XRTDzGTgiUXgI+2TXtGZ+0jgw1wYnd2qGYzwkHsQ
	qMuKr/k8Jp/9FadtLPqC7NDfKiwX/LKVdnt0o31+wycU/cChDaXyuJRHDCcjVSB5lfQ+9+kUa1r
	JhmGhB/Ay4ruNBQBJLJYgMWKl7vpbV1G8D0UJdJuXjZTgXAQ3PhHQYxfi+erMJJFL45KF+W3LlG
	YOrBpEz+25s0aXWsSCo3wxH92fcBm+yJOU/92hipAkie4bo89p8GQabgdz9XwNX/XIr0JYVi7KU
	CPJQmwUgxuksDD30EuxKhAi7+l+PQ7a+mDW9nnkQ=
X-Received: by 2002:a05:622a:1802:b0:517:8f2e:5d97 with SMTP id d75a77b69052e-51cbf0c1050mr160004271cf.22.1784103010245;
        Wed, 15 Jul 2026 01:10:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1802:b0:517:8f2e:5d97 with SMTP id d75a77b69052e-51cbf0c1050mr160004001cf.22.1784103009824;
        Wed, 15 Jul 2026 01:10:09 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1716:4a80:ed58:2ab3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495086ca93esm134353965e9.0.2026.07.15.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:10:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: remove trailing comma from sentinel in GPIO_LOOKUP_SINGLE
Date: Wed, 15 Jul 2026 10:10:03 +0200
Message-ID: <178410299646.7541.12283743392491841786.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <alV0wIgZAY_InGYV@google.com>
References: <alV0wIgZAY_InGYV@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a574062 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2svnfwD51bb5rAGvsvYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _vDWyJ5h_yhL7Ut541BUBw6rsJYoaaq2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NyBTYWx0ZWRfX8dYb3pdcmnSi
 1UPlNk9EkuwRR4OF5abSop/NvcnXLJ3qWWfl9dDtexRZBHTcOrhg/PvvnfmKslbSZu3OC/6OF8i
 20rI4ZvKmkL5hPUzmAbmN6lqS9rNrI8=
X-Proofpoint-GUID: _vDWyJ5h_yhL7Ut541BUBw6rsJYoaaq2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NyBTYWx0ZWRfX2GZHAQHeKtan
 tWSi8Z2kU0f/41V4sF3D4KG9aZZ8+p8EXg3O7Kxbh1zWDolT9XnLyz+XXG8OxwvLQg58Sj9+3da
 QyLZCru/kMyhxE2x8UfwMw9LfW0nBj/o5R8kBMRu0TkMRr0Oo54LlVeICnvfj9ngPq3vlVwhYWn
 E9GIs3DAL2GVgSE8jikfxwTwOoMRuebKNF03bvN6V2MqyKa1QNlB3ve7PatBnH3trpbw6nFBPHH
 etoTVeB2b0Sz377ta/s0rXV5+Md78rTRTXDijx1Cnmk1zy/l4l3yh8ldnTvrbsgQYK2lik4kd2o
 eVbkEI6/+YNiR1unnlLL8Oqd0jJi2722QwrHXRLQldPHlYIfjayc8uHWZLy7S1h6TNQHG0gwcVB
 xqP3+LpZfkqJ9yP56OJolwCnFxAcPEdv9CNmMm/kD8F4T4gcxoGorcCrMwfAEW7GAB+vwbS3gXE
 ONJXzGgFfka2xPJ6ceQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40098-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CC0875BBE3


On Mon, 13 Jul 2026 16:29:16 -0700, Dmitry Torokhov wrote:
> The GPIO_LOOKUP_SINGLE macro defines a lookup table with a single entry
> followed by an empty sentinel entry. The sentinel entry has a trailing
> comma which is unnecessary. Remove it.
> 
> 

Applied, thanks!

[1/1] gpiolib: remove trailing comma from sentinel in GPIO_LOOKUP_SINGLE
      https://git.kernel.org/brgl/c/7cefedf0c4a2d943f96f440b433bf71a1a8261d7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

