Return-Path: <linux-gpio+bounces-32033-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJeUFxExnGkKAgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32033-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:50:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CACDD175260
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 959C830300C9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E76356A3E;
	Mon, 23 Feb 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFqyrSGr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kA0rgQmZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147E35C18D
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843778; cv=none; b=E3V0DT6SrdKU2/H6tl5vo746Ic1+sUOD9UuGy+X7gqsZK1D6ksySHsgTdgzWsaoNUSn96yz4epWEktVBrHiFmxqekA02k1eCWqivAVgprmIPJYIQv5crT5ANwVdNrIWRIUhpI5CepL+7I+sLJEzEABSk06GNtNOfvQzZ0eiOgfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843778; c=relaxed/simple;
	bh=GC0VfP4esaZr5rSCEvFooS80d2grlfnSp82KksiJ5tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxdNBS5oqybCQGnjUO34loKyZY03d3QVV/61QRhdAksCsUix9Tf405TeQ+cW0oUxP/nQRc/A6r7Cn85MaCLCKIiJgKF1t5y4o0hJwiva2PG+d3uPU9gdFZ3dOO7P+VyctPAWPWfaq6qy0UswVBWE9dLAT7JV0W3gf7mthp9ZHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFqyrSGr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kA0rgQmZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9hFpS1195528
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4v89inTDZEXdrd9RJRHgT2h0ptcHr+emdXUC5U1ttwU=; b=gFqyrSGrAA7DWawB
	AtkoMH1AuGUJOODq8G7Ie9sJUrZVYRx/Je66oqCbPXZEoRJ70OhG6eFaG4LhSTOh
	m+Ng8YsHQMRFm8z2N7ejmcrrWQLSFpLq/92nfOkPiT0aV6qYgsY2hr6zKZxkVsmB
	Rg25/QMueG9G51qMZSZYOPzih+duvqeg3dqU82arIdM7KPljGKo9Ls7CfFiE8ukn
	IwLh07RJIK/qjVapYMgTcw1OGdJcbu6baNjqo41XAZEIeV31jJiHpIiiIXgweUdy
	/wJIozGSaPnJxFdcaD7KyaZ1SMOVAYKGsReBrC9h8nw9pCqH/yMwK8uv/07G3IRc
	Q9tOeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603mf6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:49:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4d191ef1so600278285a.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 02:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771843776; x=1772448576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4v89inTDZEXdrd9RJRHgT2h0ptcHr+emdXUC5U1ttwU=;
        b=kA0rgQmZjR0hzoW7IBo6AO7sCIhrS2qDEPlWC8O+NZS9VNDcldtIDyUYE6om8WDMbE
         D7AcjNAHhuzdQFcPymgKO7idr+jAc3A0xioSWSPwxhEktB+DwhDnI8+qOwQlVBxVA70A
         sjvp5ckkcO+Q/pnn5ou72lVimcRMfnQP6HVJKGPWJjFScTQ0En9zUm/ZFKQKeV5wPfsp
         1yVVHznn0yAg/AOMiW0GFG4AO2reWuFAclfvOipxwfsL0B1XkZOeN0o18bWCrracPIKF
         7nGAGAXdtBPRD2pZYsIaJERy+bip/ly8+u6f8ABjAxcrIl9fH3z6KPs091K8MsTwCk4B
         hHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771843776; x=1772448576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4v89inTDZEXdrd9RJRHgT2h0ptcHr+emdXUC5U1ttwU=;
        b=roFI3jEzfSA17b1dL7sZzNH58DFIR0M1qsmKk/T8iAlHkWRVb6JYHke+E8jySehsXD
         21KXCzBAjmN/4ro+WPEW2FZceUYhiwwwFNBy30IkQWK8kXe8sdb7G7S94WCDYKDEeTQ5
         tMdcyQHrLx1t60T5Zo70wprR1PSyHzyQsbTZOxXqoIV/spJeYEf1d/JOn7WXNk8Uu/wQ
         7YaiMIxxeoP+LUmE9UqvjUtnnIK+CNEILe4lSQbA0vOsbbIQgM/YBmPv0uTXI9piosbR
         qO704jigDiARFhxxbp3PB1N14G3IVebSHlzkmvJkNdSjGZTWOcQgBcvLnvL7LAZXJjRm
         hH0g==
X-Gm-Message-State: AOJu0YwXraqaiQdbuYAPnDBhbZkI6AIZalz8lSkhcngQUPxXkGgLvEGD
	Z6sSyCBjrAiTmptaMV+SzPs6mnyXdgVnTDw466B2Qf0VgXsSpt91qAsob80o82vl/mKRKKyh5Xk
	M0c8U0r2MXx/iGuom8lnqHHNCQZAIbnGtRMSutq+qkgaRXnkRSeI/mi1sq8Ropo8UabVOC2z5
X-Gm-Gg: AZuq6aKIOMKfLmMzzCzPgZEQ//CnOBhCwyszYrdxxfIZ/tdxt3whR9T9TfeqL2jfPW7
	b52Vuwvk9rIhr0AhEmOP2pgaux0uzq5FjcMUhCeJIdFhWOlsKzsn0Z+o0kH4DSaYmnIAzhuzj0F
	jQqkrPw5SHSwqj4Fa5p7WYgsttBQc8pRwdAFiqt4uhn42+mhWDDiSp/3Guvi+n9eFPemnAGk5Hq
	hzTprta1fe6fzM03Y6nUZfncMtKwAs7eHSsMDWqWYAZbvTG5+7iB6KPaRNqwuTVK7MOebjjsy6o
	+8pCKwsjLqMZWwlWphWtolusXpsFnVVZyLk63UIFlZdlZkcSooyKz++CAIAVk5Y7lP/ITE347Iw
	89yjPa7Mp5Kt+th9undOu7+Upwme8bYDB1Zgq0t7tiOKNau5RdKU=
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr996535985a.52.1771843775955;
        Mon, 23 Feb 2026 02:49:35 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr996533385a.52.1771843775432;
        Mon, 23 Feb 2026 02:49:35 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54c5csm17969876f8f.38.2026.02.23.02.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:49:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: normalize the return value of gc->get() on behalf of buggy drivers
Date: Mon, 23 Feb 2026 11:49:33 +0100
Message-ID: <177184377034.141773.496278586164543775.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219-gpiolib-set-normalize-v2-1-f84630e45796@oss.qualcomm.com>
References: <20260219-gpiolib-set-normalize-v2-1-f84630e45796@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c30c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=67SJ3es6nUsVzo6b:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qavmD5TIkVLpn3QFz_0A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5MyBTYWx0ZWRfX46pO55AzTtbr
 mZueRacNEeyvtXuAMfRXgWLA5zFERJVwb82AFfpFBY1iI/1Ppz9Fj6JrCRnUrJUSBOoJzPapMNW
 miBGz+H1c944YRAfzxBdyTpA1mtHXml6NxOKhO5rnDTLbaeYH16TIo0BUx4Np3z+irSIPc8r5PM
 Rwr5tJXvC8gp8ode2WqHmhNqOy4DJlu74ootB14lovfhSxcnwnSHq6FvsrKDaK4cG6jXgH8GTsE
 JVacibc7uiPAu4MGWZsYUhxpVY5ecSdNTXldvuFPevIkTTl9lerbVnGHgIrFj4qU+15OM6r/jF5
 mVLYLr0fjpEWUPOQ3CygcgwrVtMO15Whcli4rs0Uw+bzVMYCFjMr5upHvEAoYpWmMFCnTB1PlVL
 LdcupmASRAU8m5NNjw0rq7V+k6a/zmFcS9TI3fcaYsgnhDoJA9S/geKb4HAkBaLPD1pC9r+SbOT
 Tm77d3eBFmGkftajE9w==
X-Proofpoint-ORIG-GUID: _6ZPpHRJmtioRDl0paKFEP3UYbDB06j4
X-Proofpoint-GUID: _6ZPpHRJmtioRDl0paKFEP3UYbDB06j4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-32033-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CACDD175260
X-Rspamd-Action: no action


On Thu, 19 Feb 2026 10:51:33 +0100, Bartosz Golaszewski wrote:
> Commit 86ef402d805d ("gpiolib: sanitize the return value of
> gpio_chip::get()") started checking the return value of the .get()
> callback in struct gpio_chip. Now - almost a year later - it turns out
> that there are quite a few drivers in tree that can break with this
> change. Partially revert it: normalize the return value in GPIO core but
> also emit a warning.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: normalize the return value of gc->get() on behalf of buggy drivers
      https://git.kernel.org/brgl/c/ec2cceadfae72304ca19650f9cac4b2a97b8a2fc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

