Return-Path: <linux-gpio+bounces-39659-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uDcTFnY6TmqAJQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39659-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:54:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A11177260DB
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:54:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jChbQOBb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cw7bdkml;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39659-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39659-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DAA030CB877
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 11:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA00242B316;
	Wed,  8 Jul 2026 11:48:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C62434E4A
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 11:48:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511303; cv=none; b=Ewndrr7dB9Et1YFpYd9L+wMhERfd7mdvcWExGEI78buOJV70fwoLqzcDOGOYbaZp+RRkNkBKMShJHje6cIooF2cBrpqt0Z3cnPBQj0IId61e0yEg5lf4yonxqBLUkZ6wtZgRZ5Z8y9wWfSooC/cyhlPHw6X9YxVlCZ5waChT3jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511303; c=relaxed/simple;
	bh=DKaMiz51hJSN5aBtvjZDxlx4cjM4O3lcKCLkFqBCN9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YjMDBOV5xvvB2uPKg+2bK35TlyejlJ5aCCABiwQv4mv2MgoC1ZNX5dwD8j+oP21yLH7jCzIMc4SGGv7C4WA1RlLl3dCoh5CzC3sgS8BbJQ2zXuRRripvjQd2UUBHYDy4eMC6jcOghiqgxkPxBMe+TD8lVEEzHdF0DubBRQUDiJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jChbQOBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cw7bdkml; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BSwib2681009
	for <linux-gpio@vger.kernel.org>; Wed, 8 Jul 2026 11:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pa/U1NVCyyJ+akFY8ZxD/81CpAOw6SBbllI/G7eXaPQ=; b=jChbQOBbdMTp/Bf1
	IuoT71KEAZhHLAl9mJl51NoL2KA+RY6JZSDSzA1GB+TqP0w7MVKrGOJ4uhlHqYh7
	6ipvijxd3p5LDZBOtTkpiVyNK2mz6/ETfe9F9u+TGWzGzx+yXmIeDJYze98p4UHe
	NwdaA2EqNOkOfhhXzzMZlODLWKUm544cogaeZnVLTXwmMJWhjdfDomPVpMk+TdF7
	0Z6BxExPhq6SbgalQez/Uccd/YMAo63wCsVqPMkljuOrIoOODn9bIQXJ/k6eVDJH
	Q46Ih40TxKeg7W+9IPtEo0Pt1aCXdhooa4qUfjrJF+w3RonrrUJn+ZU8FfGNWMYA
	Hz7QZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5v89a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 11:48:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so6743211cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783511297; x=1784116097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa/U1NVCyyJ+akFY8ZxD/81CpAOw6SBbllI/G7eXaPQ=;
        b=Cw7bdkmlw+6vrghffY1Gfs7UB9M56xfPqETL+Sr41/xaEBAmYElhE6UVZn/RHNgI5H
         ++y/FUz9wDubyuK50RzXuXlMcW2lLbW6eu7VYddKsGXXr7EcPu0kLQLRtNnfvYjOTRQ2
         RyzgZDQ77GU0/PEcUwx1kbMVGUxDUMKWkreEAOi3BzR1Ghc4YSJfzluMnZk+WuLpGcp3
         tDD9a+vvwh3CevaF1sPtH5bsvLI4SOLrHyPftD0Bns8PI29ju72M+UIJUG9lYF7QBq3o
         CqkEmPS9sFAuNyJhEwvvQPCz9BeLLyxovt0T9UUv/GTxWfa9sJMV+Ju9dtvMUJytE1O0
         ivmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783511297; x=1784116097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pa/U1NVCyyJ+akFY8ZxD/81CpAOw6SBbllI/G7eXaPQ=;
        b=nmWqhXZVMGN3amugzbcacPx+6fjhQFt3eGzxa/arbdGV2kUF2SSn30vaqy0zwx9ssD
         iesg+UXZAbLoPtX86+4UIr0bg0qmfq3hMOiPQZhfBhbWYGGbi6Im+SY7YOnwHNpwIZkc
         jQEIc/DrCHa+54j6bT2fxTdIcKSfmk8Ld06sn/9f7+AWt95egQ+QGxCms8N/rSpSNO/3
         U+YZM8NV6yagL/7JMM1nnmbmuyMFqBhKdiOdmKfkmaDYczF4rC/vCkA7hUN24Efi8ahj
         V8g2uClDw873+vccQQYfbWihu8vBCetbBMsZHwHUItZcCOulLm1dFQ7+jcpiW2aFMFSO
         ix2A==
X-Forwarded-Encrypted: i=1; AHgh+Rrd7BlWpAJQ570moNlEhaR8+wwIZgnp2l5sTranm5YrmvZmYxeXZ8eAF97ieYh/XOhZCWoHHXVY/3KC@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiB4onYEjeCuCAsYNqVL/yilXveAbohjZaViI2QPtoLQ/g0c6
	fc6jV18JruH5L9h52lYynKyov6cFYm91VfN/MTI5lYp9YY1N6oy+sULsQj/K7vW8FoxKUkMo/Bf
	7U+fXmSshKc+g1AmaX0FxRgQhiH5LpNOE1rOoJc60vLAzs+qD6rRz49ccJ9A46ZGy
X-Gm-Gg: AfdE7cnyxIqVtdG1+TyQhzG4TY4xPlIR4PE8k/27oEAHiTuvPvFNHiBTiburJrCCsta
	c2tgWYnpJ90Q+JRcsFfpqksll7vYH8clxUXzlYBHrCc57cQDnbGwwr2PwA9P7OvsEZKY8JDo5BQ
	mfzxsXiUH7u098bunDXUWgZynBp0NjxFPbEeOtaSJZQXWehd/Bk9beI7bjN1O003naeZLRwYIi8
	bK9MNKqiRRhGZvWluUj3bjxVhQ/6RBUNponp+/YfHh9nFVjzkuND+3ptOyR6P5/rWxK4ck+GrP1
	9t/3aBtca0gVm7E6K10LkZy3PjES/PaK8fZKn2dL1oszbjRRbG5mpV6B+eXe0sqDj8/ABwvbpLg
	wyfUhS2ft81bF8R0UlKWubpO8D5QLRgjAyvJKrQ==
X-Received: by 2002:a05:622a:1312:b0:51c:7b13:62f9 with SMTP id d75a77b69052e-51c8b439112mr23122091cf.79.1783511297086;
        Wed, 08 Jul 2026 04:48:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1312:b0:51c:7b13:62f9 with SMTP id d75a77b69052e-51c8b439112mr23121741cf.79.1783511296654;
        Wed, 08 Jul 2026 04:48:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6d02:5f1c:554:8e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa09608d4sm43390968f8f.25.2026.07.08.04.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:48:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: (subset) [PATCH v4 0/7] x1e80100: Enable PDC wake GPIOs and deepest idle state
Date: Wed,  8 Jul 2026 13:48:14 +0200
Message-ID: <178351128411.15863.15352829199730625357.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tHBCqBoFHAcley67vxF4j4CWTCuVyZ9c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX0kAX2Ypav0+v
 s3ZfxMx0FRznkyWXQmSbJw809DzUNFF2LEQGa8Bgx76C5NVCKE+cp3KT0r7rEsFmfZhC+ceIlGV
 7moGfC9i+DbYXqOLhy6kxq2SMPh4PcA=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e3901 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3rgbGgh808wYF3KoWbcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: tHBCqBoFHAcley67vxF4j4CWTCuVyZ9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX8JoKQoS0rHvq
 wpcsZwPlNiHtxoFtMSyDY1VMo36yBiTQV6V4Z0Q0PceDFlh101IAupSogNIFfMRuSFq/V1YZbhZ
 IHqSACf9w7Az1SusCHXcZWJwU2oU+6WAHzOYuwAxOL52aS9Qgx6fRWSH5uyqttPh2dYxN2clpDM
 a25m3+8qIFjiRt5wGkUW8EXUMODrrJiHgydSwZ4QIeIw43k7s95333hcyicO8ZOYiEd+D25gI0Y
 XgmbFSdQt0sJH5IvpAtg3ONk37jXYdf6BU9DfALeSUsTvHyXjjUt5ivj2frS1bcm0OiMzauUVcy
 atXMUbyp9pVouqNYO1EtepajtdRJrXZRr74qmCI/Vmt28tk1AcOkt5pQduq/a9kVXqIFyXwBjCu
 v3BbXMnjcAPhsDAId+V9XEN3ONdFE2K4GkL9FHrzi/xOWU0Qdvvmk672VWGYz8pgC6zN5dsC/QF
 j8zV/BA/OSw9PYOoDSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39659-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maulik.shah@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A11177260DB


On Tue, 07 Jul 2026 14:51:32 +0530, Maulik Shah wrote:
> There are two modes PDC irqchip can work in
>         - pass through mode
>         - secondary controller mode
> 
> Secondary mode is supported depending on SoC using PDC HW Version v3.0
> or higher.
> 
> [...]

Applied, thanks!

[5/7] pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller
      https://git.kernel.org/brgl/c/f790ea0b699d95d18572979b1bc1673d8f31eb3c
[6/7] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
      https://git.kernel.org/brgl/c/77fbc756d9cbe53a9496cb2c53ae209d37d5af2d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

