Return-Path: <linux-gpio+bounces-34077-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKsKO0dVwmnNbgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34077-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 10:11:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749A305538
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 10:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87B7330D940F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 09:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81AE3DBD7B;
	Tue, 24 Mar 2026 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eobWxcRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pdcz4TQ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB13E3D9DB5
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343075; cv=none; b=gzsZ+ydIynxdkeHJzu4cogLIKvg49QevBefv2F5PeJ1So86JdnElUpIY7V/T7vNA5Ox+HE+nT01oFYdakwuvlnjZs0olMknjDyZ6wYovB0fmH6YdWvoCUH+eAc/zuic4VLeoQhBCFPSnHTmgDhzLjZUJLG/CqUlrrJKRMKNZ3AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343075; c=relaxed/simple;
	bh=jsWgh1Ti4adaFW3/HADaqw2MCIKnBpjGviAHd/Q/Jb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjSnZvp/J05cUi1b7Js5wDfD8lxf8JnKJ4/1R2V7OzCKnJDupuXZ7+PldgpPFVSMLY+7hvWNhr0tnJHbqc+giT+jPvRHj2fNdzBq3FR7ZP4TCkmIxx8okzwv8v6rCCliLU2wC2MbTiqzeKllOEQomRXa1JflVT2DJ3VjY9tFu0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eobWxcRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pdcz4TQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7ROD32372277
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 09:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=; b=eobWxcRqzLnx6L7E
	Sf1sa9GOx1ymukjiv7nmvyorMZyFEEEIWs5RIwb9MhQ6f2z/otzZBsq8jJkDb1uN
	rVybLrcZFmWgBaVQEKfGaGdmCjqIkTL/rfzcAy60xjCyyad/DpMXyVq6ZdoG+0Ia
	wEQMp0mCSpTNigow6FiwQ4SnRpux5RaoBsg3nhVrZjRIxswYoMCF30A9N/gR2UrV
	nNnicvThy2P2BYx3zvbu6YRcY63WHOOlQBb48RRhCsPT5JbQaRR0lW1OF6ZzCZE5
	rnqUWAbSs+lrAlApu0Io40IGtc6+u0BehQY9LiRi21gOw2zrXLE0Ym/0KUY5enIi
	Bxz+2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p830a7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 09:04:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso226873121cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774343068; x=1774947868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=;
        b=Pdcz4TQ2A8JQo+sQADgNLJlPzAqPdNE1x5+fvHArq4z4q3KEqF8naQR+hesVMHlhqg
         9XU7GmhdSBLMg4ISD7t1slg3D6kGELGeUpoHfC7mGjCEsh72ICQ8u/TGJ7l2gv/MWeLL
         pTACFBAAZztElujiZIwbztD0phsFJ680zXxULpg9u0xpazpokwbIOusQidvRo3Gj+9GX
         GMaXJZgDMA7jIHNTx6yJ8U4sufoaYeLhi1GOMegbgq+1MF6evk5e5kQsYw3uJwesmiGd
         rOjyeMCUn3A2TLPcNR+xqpGNL3qepEXtJrgw9uoQ7wtQp+/mYuzwvJnZnhmrFqiJSidn
         ovbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343068; x=1774947868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=;
        b=sDFfPBY0faMwZX2LFVLiknIiEPFdCEKVZxmHuksyvaxd3VeqakfbVX71O1JJj9W6D8
         bPG62ibyf9GwOnBm2dPIKMFFccuXCJosr/1vjq02a3gNV8+dBUNhtsfoLQmsx6ZygBIF
         OeHmnS+Q93LLqhXHkEyIRot1A/evvme9Ery9LMDEP3uaiOg4l/3ykKEaVbZmc1+t1h/j
         j/CwEcXtthyxVVetHgEvDLzURdr1/49skpa8EXelRBGE/uBfNtrBynL6hShh8TtMNOlM
         8PS9qzLRkMw/OqNYBhYgGwzY7j7WyfKmoSZe68TfiAYd9VOMcraOARbgOnWSTdVMv85n
         NhcA==
X-Forwarded-Encrypted: i=1; AJvYcCUWGIaeZKnkmzVxlPC5ICK/N/k+x60K0ImLNT1vm+OQOxQ5mckxxUNEn1EPK6itBR8eUV6AkorG+TtM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/I3arv16sBN6WN8Oo2qA5BIJP11nlzIa3BOxB/aF8DHrlaGor
	4Sz47re6FLUWiUMVUZwy28fV5HfX7NRSOblAuUz9ksGij/gRqMeQ1YwgTMsIp/2d69N5lzdiEA3
	ugnd+RAPg+df8uSuWWSkErg74P4qwKTKX+IqAzmFm6s6jPGkodShvy74RoJ+9DKk0
X-Gm-Gg: ATEYQzzEjzGB3fDkR38o2ukQMLbAVrWRbAIhLpwjiozvGVVEj6aNK+Yc6Ed/4dksiwV
	L1luYuL6tZZTUSJZuSOkSHCp5lrLfil0KLDrSNha4T57vy79pjM0mQcPO4MgmI1d6LFTgBOeOGZ
	QsaJ6/ao0sZ6eT0a9xdZr4nv8U0bxHWQ81h8YdXL4QgGAUUtdjEKdWHLZnbqergti8dHUAVIulc
	DkT6kbIvy/PCX2Gx1AyDQQK+y/BVSHesd+S7z2oDzbK2y2eGLaKtzZfxqNoev6KfliFsjl+0XxA
	OMUqvpmF13+xWwZPEjRqkM6mdcK6GDIaJ+Rq4kzAFaMr2kLijYIsXdCBIzWEFd2LOFLKmijDJAN
	946DT3/6fCuHeooeIPIprEl2k8jIibm8kRwgCwFBAkuwx2x2/Wv4=
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr133853121cf.11.1774343067819;
        Tue, 24 Mar 2026 02:04:27 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr133852721cf.11.1774343067138;
        Tue, 24 Mar 2026 02:04:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:99ae:5c2c:ddf7:d77a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c086dsm40007565e9.8.2026.03.24.02.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:04:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Tue, 24 Mar 2026 10:04:24 +0100
Message-ID: <177434305814.8385.4412622204610388581.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3MSBTYWx0ZWRfXxI4dHV7VuK5L
 bC+MGOgKKt0/Vb6jz99YcZnV3nIAsnSzuz/BRqZ0Zct/vqIVydziHOsV+B+K+TCBMjbagZqB/0D
 gG6/SDmx6r9/6ZhDcK/d2nB6QZIF6PRX9VAeSjeaLOYDrR9XR21/Qglb/oAmsDALdR9BwReAHlw
 8j+Bo2ya3CA7E5WdU2E37HP6A7XRoHXKU+03HY9PhbA81fdRFA4m0LC1UwYASVZI/bXgf2KPyl5
 qgxodEw03bKRoEWzT1njRQpea8EAGtZXD6PdiEJzgherdw5CObxfh7vVz1T0CvQKN0u1Kxry3OR
 igPpqIRmGmjwtRbVwj/CmTTO90o6GKhEIeZa8XgGmcNvw+1Uy8lPkuSP1emfvyOANbWByBrKUgt
 cvO0HCwIxgNmX/SU+hQhL3Wt2eJlOc5sUkL1L+iTKZwFFtPTMZT1WJ5rSXWaILXHlPjTLuv4Wh4
 A4t1LSaxXebsXHGRE8g==
X-Proofpoint-ORIG-GUID: 0ZL_94GHaLECLdeUf89NC6PzL_SCypPI
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c2539c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_HlkyUIfcI8kue4dcD0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 0ZL_94GHaLECLdeUf89NC6PzL_SCypPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34077-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,qualcomm.com:server fail,oss.qualcomm.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4749A305538
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 16 Mar 2026 10:45:20 +0100, Bartosz Golaszewski wrote:
> NOTE: Each patch in this series can be picked up independently into
> maintainer trees.
> 
> CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
> module. The module itself handles GPIO lookup via the OF-node tree and
> is automatically enabled on all OF systems. It does not export any
> public symbols to drivers. There is no reason for them to select or
> depend on it in Kconfig.
> 
> [...]

Applied, thanks!

[3/9] gpio: drop unneeded Kconfig dependencies on OF_GPIO
      https://git.kernel.org/brgl/c/7803501e5754dc4b295ab22b20562e2b965358ba

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

