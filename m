Return-Path: <linux-gpio+bounces-32024-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0By8KZcknGkeAAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32024-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:57:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C91F174641
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8083F302DF8A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4733935A93B;
	Mon, 23 Feb 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4MNGvJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/4bqoSK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCD43563C4
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840653; cv=none; b=HoK4vARz5oWqDh3ZrH2etKM06EGTvZfwcv2dJa6yrD1pBDvDn4Eu0D4UWv9iLVAnlZSjLC7+Rv41oSCr83XhuFq5V57jAGfYh4dgI/2+LSzI8rKxE3g7j3DURSQkWl/KT8TcMqnFd/44214RZSxwzS60XmERAzhChioLxCnkWB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840653; c=relaxed/simple;
	bh=7nVDqtCup22pNRFEve28zhWrAGI7hhwlhwkxb9H4gPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fYbwZqMrdfEb+ggiWqRLVt22wPnSzMVrZLLtcYmjj1fY+lbuIEiSrj3bqGj+9mVDQ+YMhVb2TWrkoMqmAy2UZ8dvAn/aSHmmR1UQ0V3cLg4r1pFQIAQZ53+SW+mBveEa9iJnUby8HL9zCqeC4IwaU5ubjEIIxmRTv8MkFl11NNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4MNGvJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/4bqoSK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7BU31670853
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ScrHJ9bgkQ8H1wD7s7zEU/uR/2bKZoxS/p4wGKMa/BU=; b=X4MNGvJKYWlHCsC4
	JzbBHSnDPazLJSJZ+UWiFoAE8QRSVedmoo3fV6JjvMyVdygXIaSqEOYsJjdCs6Cj
	Pwwyq029Kt9pL8Wx8O/HILGzzhMg+9JhxAf+lSv2c2Z1yr8KjQdU5VrHzhPHWgoW
	CKjEu78CwUxEgci6GEJrv9ydvm9zGTluTkGO769Wvo5IT4o45na2CCGdeMcneiMu
	2Tj5ipY1EH3tVwaAX21LWSQ7i/j9t+mYIdcHfJwcE5RZFUTpGyfUCGHpgJiqrB6J
	jF3PdAYFsFKdTF1vWEfu+42HQMV8lpebDJ2OoxYndclGHbC9ST9x5hxZuq24DVns
	p1cM5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav93j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7166a4643so4453426385a.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840648; x=1772445448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScrHJ9bgkQ8H1wD7s7zEU/uR/2bKZoxS/p4wGKMa/BU=;
        b=G/4bqoSK1pB7KlWTUssg4qTbZ3EmNI7B4kEC5DFxoruUz+pZwZqifalBUWwqaYFa6H
         4KJQ9AGB0qLl8FiuwhDLp6tNaYbcBz0+D6lejJq28k4t8NuxE1iufW5NWwps5JcOJu+Y
         isvQtMkjGfAzR/BPTkzql0/O1J8he2EkbZpdURdm3HmgnUJKU+HvxEw8lZ1/hvXtPfuJ
         9o351pJ17rqHDyJuv+oAeewSbd6axLdGyUpIdCNZfLFq5vxnY7GcafR2clssPNo/uDto
         Dx04ZGTa9SN+zLMLqCMS5gocYEiW9BeKHcxx1dtD5GKAVpapNWXfbo4WNjYAjuuwkWJq
         6tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840648; x=1772445448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ScrHJ9bgkQ8H1wD7s7zEU/uR/2bKZoxS/p4wGKMa/BU=;
        b=gPHu8A5qnwstFKHNASVavpjWBuv56cT48R3maIKr/Z6+dTBdnQyDmlJCZGKBNh9/yq
         6rygusDaP4l0gWAmq0znbcSOzRQeTLdmoWNL0PIvLzltx15XFDdh3cbfC3AlZqDq+67N
         knHp8fcpFeJtMZCcntVw1oSo8LocLA66npQIoVCrHGiWDPRKdzlszl6jRq5b2quw8Rrm
         y2HnwrsqcvjgDgrcK+xXSUGG3vWAWVogp0/5xMwX/mD/6a+u2eRW6BHOgLvGHQ0IITjI
         hav6N1qnLGpzL5F272KFiLLK1txOx0DVb3XPdl8pkaPLub20CEzjfNpD7U7DHEVqYCtN
         DlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgz2IWyoOg24ansYys301mY5WlI7pVex4+SesWkhAMuspLVTNMcGmkb3OJf5bTn/aAjvozMGSpc/b1@vger.kernel.org
X-Gm-Message-State: AOJu0YzCiXWCPhFFCflAhMYctfvGunBAGwHfndO5Z2uawkZ56+czbYzd
	FLJF24XxqD9rtOAfHv1XF6TSm00LU9QTMpctPUCl8yBheLwlp0g8302ebeWePfvGwOdAGSagYV4
	zuRFbK+QbZOTY4nX0RdfVErzR2c3c8cAOVJ16lOg8l5+FjpSNfCkSVmGR4Iiffu0T
X-Gm-Gg: AZuq6aJuceT2/kuK6LEnh0ucspTTNDZitDOUHJzhJ0pVNWvDssIZ/pjOJuaYTV2u9CG
	1s0DzOfYpEaSOjEjrD80t4NAAnVOvh8IiRmxQUswocn0OLhTCWRF2aRznbehUUqf12ZzI6Ci7gT
	nJ3TsPEU/d0ULw0oB24fFsrJ3xxwpqel04+cL9rNTQBvWxcZy7eOangfs15jY94njUkJ5RDbl1C
	YA92aaSLggNErUntAiNkEgZtVeqDGJ+j2uvjNMVvE3QLUjoUP6QChRKSP4xUEcF7JWcimwy1QAq
	pL7/RGdjjHc/zF7LHCeRsrDXyApeXm1tQvXuDmsP4vy62fh1xNrmRLoUmV64t2K/3dBzLOFQMHM
	rT9vEDXq729bYWWxUx0w4FxiQe7tAu7ipzeDHelqW60k5jfkRKOM=
X-Received: by 2002:a05:620a:2906:b0:8cb:313f:5ce9 with SMTP id af79cd13be357-8cb8caae494mr885539785a.81.1771840648053;
        Mon, 23 Feb 2026 01:57:28 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8cb:313f:5ce9 with SMTP id af79cd13be357-8cb8caae494mr885538885a.81.1771840647635;
        Mon, 23 Feb 2026 01:57:27 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm275752805e9.3.2026.02.23.01.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:57:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Thomas Richard <thomas.richard@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/7] gpio: bd9571mwv: normalize return value of gpio_get
Date: Mon, 23 Feb 2026 10:57:14 +0100
Message-ID: <177184063428.89486.4830676695551371408.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
References: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c248b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Wo2u6a-5YBMPhz8o0jMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXz9YWXcd4ntBE
 s1p7tyC+Y8AXwhQEUP0apNR7W1LD7z2LxQxnAA0esADIBqNQOvP55xAHLwDopcII1pnClbLP3Zv
 yyLop0HICrgruu+0XvbN+R69IlxzCugoOpHB7bt0PedRO8/Son5S/cU1zUdWU/Dxh761R5LQ8gS
 vFFw2AWcAdW3/6jlcyC2n1vf4h9ANUJusoVZjTqYWiK0yeUKyJYyLYU8GvZekNPd9z8f0nA37KK
 N1PqSaF/++G3jBsKA0yX0cA0K1O24WnKXh03EPByrUmKir6G+bIvdnkBvBtP//S7WP0/3xSyxfE
 LGhZwcfguUSOjpI81Qu/ianbG0tBKF1IsKlReS/48Ferbk+wfFRo5f4vQ/754PYIiYrWFJ//dKP
 u5RGQk3Y1U8z2eggDihsHQi2A1B48ryIMIQ/EkCxXwT8MMXwTdu115arkAl+fbclswHcWZCiA02
 cOG7Xty54zu15eVPY4w==
X-Proofpoint-ORIG-GUID: sy2SxjHEjl3oRhIRq8RjGOHR5qtXNZOq
X-Proofpoint-GUID: sy2SxjHEjl3oRhIRq8RjGOHR5qtXNZOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,bootlin.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32024-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C91F174641
X-Rspamd-Action: no action


On Wed, 18 Feb 2026 11:06:50 -0800, Dmitry Torokhov wrote:
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by bd9571mwv_gpio_get() is
> normalized to the [0, 1] range.
> 
> 

Applied, thanks!

[1/7] gpio: bd9571mwv: normalize return value of gpio_get
      https://git.kernel.org/brgl/c/c43778680546dd379b3d8219c177b1a34ba87002
[2/7] gpio: cgbc: normalize return value of gpio_get
      https://git.kernel.org/brgl/c/49621f1c97788216f2f10f1a9e903f216e289f5d
[3/7] gpio: da9055: normalize return value of gpio_get
      https://git.kernel.org/brgl/c/4d720b0d68e9a251d60804eace42aac800d7a79f
[4/7] gpio: lp873x: normalize return value of gpio_get
      https://git.kernel.org/brgl/c/5a32ebabb6819fafce99e7bc6575ca568af6d22a
[5/7] gpio: stp-xway: normalize return value of gpio_get
      https://git.kernel.org/brgl/c/e62b94a690c8cd7050c3d308e01ee1b24ee9bb0b
[6/7] gpio: tps65086: normalize return value of gpio_get
      https://git.kernel.org/brgl/c/9eb7ecfd20f868421e44701274896ba9e136daae
[7/7] gpio: viperboard: normalize return value of gpio_get
      https://git.kernel.org/brgl/c/c08381ad56a9cc111f893b2b21400ceb468cc698

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

