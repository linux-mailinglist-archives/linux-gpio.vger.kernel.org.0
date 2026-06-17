Return-Path: <linux-gpio+bounces-38638-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m7gvCLqlMmqq3AUAu9opvQ
	(envelope-from <linux-gpio+bounces-38638-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 15:48:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5A569A409
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 15:48:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="hCf/d8pR";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hbZZZCms;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38638-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38638-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96C9E300DE09
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 13:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85864244687;
	Wed, 17 Jun 2026 13:46:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A6F175A8F
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 13:46:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781704006; cv=none; b=UNTlY2VlBsoqh3nm+boHuuP9rIJrZSi/A7WDkZNCjSGNlLBTssDacMnD9sYfKUac/HaNUrn6YmsNDXyU5WMvI1sy4UxK2tsJN5vpcpyIG3xWlvxktmuBa6vmdBbF/pAZ5GM7YyludlY1sw9svOtuHz1lIGfbXj/iTebpnhQiT3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781704006; c=relaxed/simple;
	bh=EnBqamAkPR2YiK+a6x40CZjf7kvGfZTOvGbSTNb7WLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KxGfC+HZLO881Qr5mIqemPcjDAMF504swzcB412PSk0A2/a3NSOennrvQuDGfcnZhMqmEXlPNupG+IcTrnRRdeL+zoXLzYpPBdKjLp+D6RJy4EJgWfSV+9rFtkv/J3ylrrK63sAJUhIQyoJEsUE+NWkFT2oDXriZ8KdYVXHgOJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCf/d8pR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbZZZCms; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UFUq1735148
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 13:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3CBZ6riIAhZup/FyX2DM/B
	Ae7FL8yX4i3xgHlUguoz4=; b=hCf/d8pRHqlER+Y6L8+rvVPMVqOPwgN58zhdqU
	6EelCND+nsgzXCGMBckGNzVzBWKhKTZ27y08iIyofxPnE6P0Pyh5CRlQ8TAtbaw0
	hckFGgJ0Ey8jOgnMqlGCg8m4Sx8c9PoM8SXQ7o2YadyPFAInEu3tUiBzl7N1zFb7
	5I4nFB10Viu/p+P3ifVfbeXElvS+1Du2cEdkUE8TesS3B3knVUJsYnf9jnfxwsH9
	QOMhpRMKeRyj45arAFJzSNOSGoZGzIVlo5tVElm25H99v2qPY8cYDSQU0knDKk+6
	Vjm7fooV6FXtQiQxIIfiuFNL/bxPfLca7Q1JBk7qGvi9eRug==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemkdwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 13:46:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-966cf5e2a48so475885241.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781704002; x=1782308802; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CBZ6riIAhZup/FyX2DM/BAe7FL8yX4i3xgHlUguoz4=;
        b=hbZZZCmsV94g3HTKYwvLeHnJXdQu23NiOHc+QXZRXfx6n5W12tam2aGsE3L6exEqRy
         6WdI1VbGlh9xHMhaxZTLRWHmkkCSrBHqobIPUVUpYkCSmFmFmUDcSmedwsuetViqn+VT
         3IE9CF916DGQYIRSuo2LTVNJwuNR8qJExfbbomXXRwTRYgeVdKl/kcB5jpI/DV55fyxY
         AkVbSYApYnpyct7S/VVw9/JMF7rcgZu6zZbKasIHl33bNcxw6vqeVxFXNWKqJnojqNeD
         AIC8F/QbZAccucecdFrF2RN+SngxvpnNw4pbHju0av160P4ve55HSvKN9YCADrQAJAVd
         kwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781704002; x=1782308802;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CBZ6riIAhZup/FyX2DM/BAe7FL8yX4i3xgHlUguoz4=;
        b=VQHYkgv3G0ZF9qz/lPWni1fsN4BMNGV9TSacnRvkNRza4ttfVaD5ulRxCI6zS425zG
         xE8F1bzi6HNA2wOsB9HdpkpaH7rRxi8C87y1MRyfYygNpmS2G9TfqXvGdQT9/u2IbMz2
         NR82GY46QiYVbZL9XD8VVS3LrK+/bfSC5JOmd73cp9tt9VabQSOZtA4tF7ecsqEx9y3n
         eI2OyVzxMWdO5ZvyUO9EikmaZI9IdGnfuSwzobW4Wq7NQaXl/rqSK/4el52oqXUpkzq/
         2BTcEBIbdr1RVuOSGpyShN9N95EhpwsDASiDOAKXNZD1rWWb/1rWBMSICF3kxg/630Ii
         WJ+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/27/84xWNmmpXWxzEuswjjtNLYrnyWGTQtquceIuMxfdv7olW9tyfZB1+6XBZDRoeIpPvnxmx/AhUW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2tyMfDNDR9YBRWZ5djv7+tScvxeoEhf8+vmg0wIJajQhjkYR
	EGpxYsFqRbzQdret5hsIm7pQeRS5xD+ShiHP9pTnhtYShe+SkajAs7hSYpJgXs8QwtteY8FWIi3
	Cpi+ppQ18PLAqRh1BOgG700k/crJPmmcLbt2ETm6735fjkTJPkgAP7zktOhisJP5/
X-Gm-Gg: AfdE7cmqQTi41rB8WS1gxxLnit2/+ow6G6DlANLeSmuPFPtbginIcCj0FinyfQeSy3s
	t3nNmdBJ6hDvnhEEC9wshB78HNcBk5mZOutCjEhr5askTyPfNQ5qfKmvMzJh6cdbUMwDG3Y6e7c
	dMCkYiX6jYmNYyt0h2wxVOF82LMUr2vhOL1zFXRthkcYcFmPzwNRfO0NW5l20POIFskJRZNgo9M
	C1brrL3UsfmkllZg7gKrx+RgFN/mAZSmcDa14XFVE4lvt+enRTyuFNfv56GQpJh5R+GLBl2I9y6
	TXGbAuaFRXByUfItBjH9Dk4S58SpdAulC+q4FiACyRJpzjveRP9CTOUkMhMYPCS1467ye8Ipk9i
	BDQy0JQ8RJga7FwMpklaqe6F6RMNau0xGZDq8Vd4r
X-Received: by 2002:a05:6102:4425:b0:6ef:f6cf:1b32 with SMTP id ada2fe7eead31-7246d430786mr1866028137.27.1781704002238;
        Wed, 17 Jun 2026 06:46:42 -0700 (PDT)
X-Received: by 2002:a05:6102:4425:b0:6ef:f6cf:1b32 with SMTP id ada2fe7eead31-7246d430786mr1865869137.27.1781704000630;
        Wed, 17 Jun 2026 06:46:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c856:25e5:e249:5e0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa3abd0sm185683255e9.1.2026.06.17.06.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:46:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:46:28 +0200
Subject: [PATCH libgpiod] build: gate subdirectories on the *_enabled
 variables
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-meson-enabled-checks-v1-1-2ff45c7691fe@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADSlMmoC/x3MywqDMBBG4VeRWXcgsRJpX6V0kcuvDtpEMiAF8
 d0buvwW55ykqAKlZ3dSxSEqJTfYW0dx8XkGS2qm3vTOODvyB1oyI/uwIXFcEFfl4WFjMGm4Oz9
 RS/eKSb7/7Ys2CfMuJdH7un6wqJnucAAAAA==
X-Change-ID: 20260617-meson-enabled-checks-491cb0d436af
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3729;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EnBqamAkPR2YiK+a6x40CZjf7kvGfZTOvGbSTNb7WLM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMqU59+v5Ko++KmLFZDB9wAtQgW3mVRC2z8U2D
 gA4Q0UJAseJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajKlOQAKCRAFnS7L/zaE
 w6jFEACSKQtAB0raDK9EQaKsKd2r8YGjMzwbmpoUQFqZlmM8nfTJgAjVyeTAi4b+7mRMvxUUGkG
 AtqRiOujzGaJDd8jDDE8suWLZG7NjaIZU7ur4wraUYqAkF66NGjXsKH8WTem0H5t4yOg8QItKoP
 irsXqXYerKUIuuRHyqJA662140NSRjkKiCL9hl5r+skxOxmSqs5eji0vtha+R/e6UrqGOl1jhcT
 xC+5GhUX++CCddMxoVXA2sVP+DSMjYvtMkdkDSiD3clSVxLNTprOnCnxR0tM9thLC29VplqDb4O
 G7l+ZRHlm7WqY882l4NsWJHuMzPcUX5DNw9k+LmlULfrRYO+XJMgyI63YIM+EenOZWX0NZtxQq/
 Z4sTJ1a9R3m7YYZtXLOkqbQabLHI1ybhqwzhPn+FICMO+j8gwRypt10TMyEE0H77VX1A/oU+nkM
 F84pHAVwSojZHvAn1XTYdf93+yqGa8Qd1OR7e7gf2jDWTu57oDu2Ix7k6lyTOLma7gvQ4jWyi+U
 RqYz60FTkqKHRJHyG3hDX7RR+Vzyall4cuQe+mgrOEK52GNvwy4cfagn3uKkHp/BOabbrN7Kt7J
 QQ359yyCkCKhDZuBhLD0YGa0Xc/1OtpwMlY4MiwZ/aOfa9r0vcdktGYqtot4w5oRRFhH1kQX9NL
 zsZmw7f1fqeVnKA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzMSBTYWx0ZWRfXxrjJZGlU1K45
 4kmsOZYMh+amLMicYfiFRFjlsmjIG/DPJyGEHN7JO4wtQVS9YBDZiwE9vEphLpYk0Gu1PFV7m8y
 oMFF6FUnhebFN8eiUYnJ5xsxUdQgKCQ=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a32a543 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=K4pV9_SV6i2r5HlK7ccA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: JTkk1ggiGDOvuYyhBK9bOHJwaaQaak9_
X-Proofpoint-ORIG-GUID: JTkk1ggiGDOvuYyhBK9bOHJwaaQaak9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzMSBTYWx0ZWRfX74gCzIENpkMZ
 lcVNaAAoAqCEqnCu8XjwdskGOhT/NGUx9M2f7Lcon3tdH1GqELiDm+4hs606s75sPWO6H9Di6gn
 uK3Zz6fLNIsdNPzZtILiGETHguom5Mbwi9vgJWMgiRNdcFErD5zjyjxNdIUT9vR4JPHuCl9gt08
 chxijQhhfyRdbYGPqbbkjXbFIgYBScqmdER0y1LVj9XMAtQzJYfozfQ3TGRh//WoScvPJhiGCjs
 MIGY5++We3j6SAOrvLIVsw4/xF7mSdvTLkEOJ3U9PQiFDyNr85EBApu1XMmOq+R1v+2y2bVAe2e
 6Wxwc6gM3VXdjihSU7mlzWpW55PPRiZqqP+/tMwUKLY4QHZP2eoW4a7e35OQeFb8avOyiU5VjxV
 V5zmhfRxYCzpoUXDOr5WyedY6NqjTvqy5iKDEo9CJuxdtOww+8bRNW6b9ClDouLHD6bxnC6IsDZ
 j68FAC5yGOXo9t0fPBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38638-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:vfazio@xes-inc.com,m:warthog618@gmail.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 6D5A569A409

The top-level meson.build descends into tests/ and dbus/ only when the
computed tests_enabled and dbus_enabled gates are true, so the test
helper libraries and D-Bus executables are only defined in those cases.
The per-component subdirectories instead re-checked opt_*.allowed(),
which is true under the default 'auto' even when the dependencies are
missing, and then referenced those undefined variables - failing the
configuration outright instead of quietly disabling the component.

Gate every subdirectory on the corresponding top-level *_enabled
variable for correct and consistent behavior.

Closes: https://github.com/brgl/libgpiod/discussions/190
Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/cxx/meson.build    | 4 ++--
 bindings/glib/meson.build   | 4 ++--
 bindings/python/meson.build | 2 +-
 dbus/meson.build            | 2 +-
 man/meson.build             | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/bindings/cxx/meson.build b/bindings/cxx/meson.build
index e93d686d50e9cc28ee986f6236bc02dfaf25e6fc..f7f8d9c2fdf231304e3dedd8aa4fe8645da639e1 100644
--- a/bindings/cxx/meson.build
+++ b/bindings/cxx/meson.build
@@ -65,10 +65,10 @@ libgpiodcxx_dep = declare_dependency(
   include_directories: cxx_inc,
 )
 
-if opt_examples.allowed()
+if examples_enabled
   subdir('examples')
 endif
 
-if opt_tests.allowed()
+if tests_enabled
   subdir('tests')
 endif
diff --git a/bindings/glib/meson.build b/bindings/glib/meson.build
index 4c36cc5e23e56a843d03c9f939bef0643cb6b98c..b8f8f53c2a4e564de1012ccb4979077e9813e7b5 100644
--- a/bindings/glib/meson.build
+++ b/bindings/glib/meson.build
@@ -112,10 +112,10 @@ if opt_introspection.allowed() and gir_dep.found()
   )
 endif
 
-if opt_examples.allowed()
+if examples_enabled
   subdir('examples')
 endif
 
-if opt_tests.allowed()
+if tests_enabled
   subdir('tests')
 endif
diff --git a/bindings/python/meson.build b/bindings/python/meson.build
index efd99a9d8118106005a4a42edcb906d6a5b65818..f01923cf33cd9bf2f9a6d2c43c36f6b38622d1a2 100644
--- a/bindings/python/meson.build
+++ b/bindings/python/meson.build
@@ -5,6 +5,6 @@ py = import('python').find_installation('python3', required: true)
 
 subdir('gpiod')
 
-if opt_tests.allowed()
+if tests_enabled
   subdir('tests')
 endif
diff --git a/dbus/meson.build b/dbus/meson.build
index 2df5906298c4edd20377d5f90d62189f46d17eb9..3b82f2d552526a41627a645ed2fdfe7549c44540 100644
--- a/dbus/meson.build
+++ b/dbus/meson.build
@@ -6,6 +6,6 @@ subdir('lib')
 subdir('manager')
 subdir('client')
 
-if opt_tests.allowed()
+if tests_enabled
   subdir('tests')
 endif
diff --git a/man/meson.build b/man/meson.build
index 27b99ac98afc873554cabd5a01a4a50439286298..f3a2d4e83698e3f9ca1a8ae35cdf3642dca90f23 100644
--- a/man/meson.build
+++ b/man/meson.build
@@ -4,7 +4,7 @@
 man_template = files('template')
 man1_dir = get_option('mandir') / 'man1'
 
-if opt_tools.allowed()
+if tools_enabled
   foreach tool : ['gpiodetect', 'gpioinfo', 'gpioget', 'gpioset', 'gpiomon', 'gpionotify']
     custom_target(tool + '.1',
       output: tool + '.1',
@@ -24,7 +24,7 @@ if opt_tools.allowed()
   endforeach
 endif
 
-if opt_dbus.allowed()
+if dbus_enabled
   gpiocli_cmds = [
     'detect', 'find', 'info', 'get', 'monitor', 'notify',
     'reconfigure', 'release', 'request', 'requests', 'set', 'wait',

---
base-commit: 3591a62952275f91388a4c80dfa95e4970093a7b
change-id: 20260617-meson-enabled-checks-491cb0d436af

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


