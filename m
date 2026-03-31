Return-Path: <linux-gpio+bounces-34479-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEn7GvbHy2mnLgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34479-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:11:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0B9369FBC
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F7AC3006993
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8853BAD8B;
	Tue, 31 Mar 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hkw4RIiO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctwstU3M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57943E3DB0
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962293; cv=none; b=OwWqv8eSBWAfaXMvGh9EDLj4/XGIA5sMN96iwcNPzO8FPZUZrl+xJTgHH8wtGNBcULdhq78ktNl0oXR4BTxmDQdmOzuvuPrEJL9K6aZWMtidVV97JMRYJ1Vo6QYwtubZuERBl2sHO5Tt30X8tVIDOYDASb6yJxv3fFNqxNSM9wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962293; c=relaxed/simple;
	bh=OCuw9cGecgl2mkYbY2Gw2jDcCL7+0VNIAKW5Cxuig6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xh9ex7CyMAkx/mADE1Vn5zSyIAloRGVrVjH9JaCki6JJ1YM5KslE9W/R8pr5Cn0LlDt+gusNtb74rVNL6t0c5woq8e1xCyCJz2efNdZnbfnhnunL9LNCypbPS4qvTODIraQUpy0RuQCZUh8sfi58ycn4H3nxPS2StS5uS6k2ij0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hkw4RIiO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctwstU3M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9vmlx4053772
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yzIwm9Xffjll+7lVXWgJg5JK5ikkr1C8kESG+CBKFEQ=; b=Hkw4RIiOeN2Mi4vA
	9JTVGyZcckLJ48wrBjg7Mf2mnTvtHA2uEKnC1KzvLuWubLdfDMRT8oFgJAvNy7T3
	UK3ZU6crilcBrX9NDeqVMYfMGL/TEf9MO9PckDdWP/TsrZtSFB9BHy4DknNrArqa
	cf9XZ6HXHIeecc8x8Yfz/xaShPvm9UVU+QuHMFajyq0ngDQAls2h8g8sZaEkmcFY
	NAdhQo7M8sGyrR13Y2EPaFKLrgOwE55W05IWJwB2snG8xTu66H9ZQRPHEF6hpyrh
	BdE2G4ZNgTG6EyLvtNNBYH/8+ywyMU0nWs8lrxL+5TIdw9PAQY9aKpM1u5cAH4Q3
	VGeOHg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3bp78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:04:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-605636e8f4dso81793137.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 06:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774962289; x=1775567089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzIwm9Xffjll+7lVXWgJg5JK5ikkr1C8kESG+CBKFEQ=;
        b=ctwstU3MMzIkDX9Q6BBmyqsokWJXCR+NhvG6YQjC/LM610R/dhVZ1S5s7epAstNez3
         CWxU+Tc3ysH7QonUpAcpz673sYWDCa8Hn3aEfAhys+q4TGc5dObpZT+nRXgt0m7H0dg6
         q2AZf9mkW4V6OYFZ/RotKcPAJjS4Kxxp+Oyf4UXfWlAvzQsOqRKqV7bFisxMuz9n+L4e
         laxR4pmdChoe3/6QqPt21BdxHhaVeWOhUYe56cCUakg98KvYLVkD1dvI/MEhWv3Fb9n1
         PASQ2gYb1G/N4QonAorUwjWfM/Kxg5YSYlxWgQuBz1LprW1+FMqAUEQDEiVc1my1BzYL
         ciTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774962289; x=1775567089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yzIwm9Xffjll+7lVXWgJg5JK5ikkr1C8kESG+CBKFEQ=;
        b=jWvzPmrZoEEn9LptvY2h8YTJSNgHtMlKH5XF+grNov1xnYvj9LM34bw3Zop7nRVRFK
         myVAVI2ht5tlpvhd3Y+/xZ03DofvZ2Uu0U4wk8+C0wRomWkG5FMHetJ9nXLnOH30OcDt
         oUGji1HUWBFnyGbnQGvI97wy8ofOj8UtyqxuDWGw/pj//3EpHtak0pf/UTNpDCCOlhcf
         VOEZ9zasAkfQLp2skOOqaBdqosblCtGFsNkk+dvY+R0kFZ9mfSetdgoSiatwERGzk6Et
         zXAPQD+KX1s083D9KnPiyhQaP7J068C5/EhhelttobsBUtzp3ZY3wRV6jLoeuJOpRivs
         jIkw==
X-Gm-Message-State: AOJu0Yxs005nQykojuC0NEXPpwTm742NJbC/3oqyrPV4HK6tVYLCBLLy
	fKqPkJc4gAMWRv64EDLvGHglwtHCGoZiHt715JF7R0DFkBsdY/tCQah4KLZb4BtpfvFEPIx/ety
	AM5kAihK4Vh35E7N8/p8291OVVwIcVbzTWVhrHzuTfOuGxvZn2TiO+xAvt2R+D5VcN1oYwyc0
X-Gm-Gg: ATEYQzwOGsD+97nu8ob01iqRC3dgDawuIRDcD1Xegn+M2mcSlX9gCnbHQSyQAwoXh7O
	P2qR/IZ1fVVX+gBIKRaBqMBaL6FaiszLtyMqdozhKx/y+5K+WoqhDatwZuzUQ5ZlNVKJfvCFeUx
	+BOZYcRbKvAd+vxd5udVU5XaDoaAEVaDisauxuuaYOGic7B4v7+Gv9M+bOd48evhy+pOLxfjCNt
	PCVjso+dzfoC2KLrvAun5dNs3+RI0JhW9HOdQdw8g0mY/COxHXBJVLBVZJgiwWOyuX2zOrzJALL
	4SZUatQBr3eMoG0ykqbNDs0HkURBux4o7X3G7LrhwguZ81lBOvi5IhEL5xoeTrpBZfy3z44PsPG
	rJSzNdSMBzRiHMMz5y48c75/2b9K6DowP9+KALE19pMl6A4Afz8Q=
X-Received: by 2002:a05:6102:1609:b0:5f8:e41e:e5cc with SMTP id ada2fe7eead31-6054fdd0972mr1130178137.9.1774962289328;
        Tue, 31 Mar 2026 06:04:49 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:5f8:e41e:e5cc with SMTP id ada2fe7eead31-6054fdd0972mr1130135137.9.1774962288911;
        Tue, 31 Mar 2026 06:04:48 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:977e:e16b:6244:a86f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a63esm47482945e9.3.2026.03.31.06.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:04:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Vincent Fazio <vfazio@xes-inc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] Revert "bindings: python: replace PyModule_AddObjectRef() with PyModule_AddObject()"
Date: Tue, 31 Mar 2026 15:04:46 +0200
Message-ID: <177496227959.10775.13288328059278288948.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330125023.109789-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260330125023.109789-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cbc672 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=I0wJSLaw1uNxdiW87fcA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: NPkMuzXcfHuD_QS8b3vA9oiylGXHz6di
X-Proofpoint-GUID: NPkMuzXcfHuD_QS8b3vA9oiylGXHz6di
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEyNiBTYWx0ZWRfXwu1xINFcOrk8
 /DxlowXpLK/TzWtTffNkgy6bpxpBXW6VhRnHgMMPSZXKa4h6XEze7lEW18ZMTeV0c16UYallb8e
 KENRo1WO2NlwuQ4JSTnzcMQ0tLaXXN3jhRzF4Yp2RrMWw7tZ0jSmGcOjRb4NBX+9VkcLqUmZlvZ
 5+me15gYdxjmKw65ZJ1MaPI3PxtdXL6DQfrdR0AU3D8lZVxPXkQxgJ87tsor5fhG/ALa+oaBlR7
 Vjhf2nR5sOiM6qn1k5MAtXwtpC8sG3HtCppo9Oy8EOxw3NZ2uGRDIHO0KwP7ah0AKiY0jg8rQm6
 ZL9XgyJjzCY3DZvd2JAjy4GlcZAvauBzvrgNDbsMqW9P9wnAzeqYe/c78JohwHKlzK2QRkUrHiD
 86XKvKHyjZ9hY3kv1dAfonsaYHxX+UuC4i4zhUj6buhcWn0K81jEk16CdgSJxFapXGzgCiQVuPW
 AhM0+yb1qg1whVTgAZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310126
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34479-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A0B9369FBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 14:50:23 +0200, Bartosz Golaszewski wrote:
> This reverts commit b436d05809b17ed734d08a36a8913eb687506433.
> 
> Commit 950ff3d1b300 ("bindings: python: drop python 3.9 support")
> removed support for python v3.9 and with v3.10 now being the minimum
> required version, we're now free to use PyModule_AddObjectRef().
> 
> 
> [...]

Applied, thanks!

[1/1] Revert "bindings: python: replace PyModule_AddObjectRef() with PyModule_AddObject()"
      https://git.kernel.org/brgl/c/2e47ad76bc66c2abfb02e4b9d3982fa246af07e0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

