Return-Path: <linux-gpio+bounces-32452-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFUcJuf2p2mtmwAAu9opvQ
	(envelope-from <linux-gpio+bounces-32452-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:09:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3715E1FD485
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D26F231A419F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 09:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0230F396B6B;
	Wed,  4 Mar 2026 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KM1nxb8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSdBvOcq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F6D391849
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615008; cv=none; b=M6bcqgm3G1q5g83dNUUvqtbB1CYCSJpkUWOUlWoKxbbFUHTlGHeNf+FosFs7jS7UeB/Bp0YCSZJf52DQCzOWNJyD/jBU0p/7oJRvVB4oQuPU91uJ7C1ZSgaiYzkuBQSnI7fxQBc2ZBeS2WFEiQO1UXZwL1kLD2fxjxch6aPJtLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615008; c=relaxed/simple;
	bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grK26A+VXI5mivmNU5TipEfYEa2SzOr96vo8qiH4516zwtb1fIAKHH5A/BFeiyYs4yGF6Uvsnp13XepzU8aic8UEzx/cGoeOjaEqvMNeGrOXnIGlLaG50X+1IPJ9swPCwe/gD1d7SAK+B+juhiKNyiFmt6kjk/QasCK61GbH/SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KM1nxb8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSdBvOcq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQsX2275097
	for <linux-gpio@vger.kernel.org>; Wed, 4 Mar 2026 09:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=KM1nxb8aj0tWlKAq
	b52Nx7se77o3CBamhSkfMSBNL/LoHsX6BkUJw8XnmD1Hk32c0FZXccAxHNksV1kf
	fNRo/k1ZAt3VNvk16Evg4xhW52CXIfNhQiqDirLYASsnk31X4aLnKZmGdfZypEwU
	YUXXRyyM6MQxSqtbgN01xRiU7PnUPmyqJNjLj3J8QnRYxDI7QOvrOQ2ZkNSAKCtM
	a7lNFKTSwcYExx9osupgM7HO+JzSxfF+A/fFW5Vyyx+qhBCGWyYkzfftDhOr+6xh
	iSCVrsUVqMbrd409to0DbK/MIt8YJrf7MQPa/SWIJn40kd+UAL3tUJrNjzQTJDaI
	g5mi2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4ms5y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 09:03:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso5037240385a.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615005; x=1773219805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=bSdBvOcqWbeABc8e5vQbfAvAAEkZYQNGAFrYXSYt2MIMOh0+PndbaqWWHcEw3CzWwl
         jsdi0kYg/mElKvRtYwkzgUShwPpQqVuIGDKpz5Le2w0L8sR4LdiPcGljrTd/jQPUcZGw
         BWX2sEUV6II2MV2VF94551s5e6uMiRtiQwOvAz+inSZ613o08RZDI/9rv4Ju+JbbS0R5
         bo7miyFaSSuM3yICPV2seWTT3Nf2VzRnp0x8n+XpGUBxC97epcEkNpUJ5rCSgZDYpsce
         JGSgHlzAI2mtVT8QzIzqYUZSfWo59JV1YsL80H/z6GP1BhCpYAbHjCUs3igf0n6TLufm
         dqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615005; x=1773219805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=xMXNb8c0qDisL0+rgOphMhZQgUL2gJIU/oQClk8fB4JHuV6bEhpyucHCA8SWTDy8Xp
         Wyy2QCr4YsOty7JqwaQGyDrab8vP754t7flteTjxoyOeHblaU6Ev+t8g1JJhGChOo1QD
         rKElutOnxpjfKk4Ve/GIpTMGOZU9XqERCAyJBDmHEIbz5NlpROgh8Kpn/ym5Y+3PPPVm
         r9nZCDV7C6YgVaJtiEyPNDv+xCmeQGg3wp8RAUa3T64I3Q7ftKwjGBFSL+JZE+qPkd7r
         2zdTIV7B+sf9Rh2W2IC/bDiTCr69Yr+c8pLv5Ubws3k0adhH0ET2Spd+1nO5UOewl1bm
         bRHw==
X-Forwarded-Encrypted: i=1; AJvYcCUyE364hJChZhl+m3Hq5lMNOka1IaU0b3xIbV7KE5G9HA6GcjA1XE0sLoMXQZRJYax9hnYGJYDDuWUV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7w6gz5LTvHxl+i+n9XGOFeETbpVeYFqxBP273oxUmyHPxh2N4
	2FLxg/ZJ0AzBBK+4CpA8coMN/uFzZGvZwbSpTX8erASmpUob0VZvbo1slDtSALDXnbRvyQHr2Z7
	94WxQALkJ5rbvo4063TXWkI859+N0JrfszVPiru1VLXrVyMnqJ2OFN9+4FTaOgz6b
X-Gm-Gg: ATEYQzzrLieT3S4LmyoScMFvsHAS131VBvf4Pyf0MPC8ay5vUUlXaDXEbut00Z5S8gG
	xy6/qsoyPjQO6uJ4WxZB6GRaHtU26y6s4ZBf13pa6Vbn/4wzWCKbOoPadVwDLlCu4yAqob5Ukmw
	AA5zDgm6Wk/2zyw9ZXkCFmOQOGgISJ3ttztcWlAzKEx5PT2BUxFzYEs6UPQJpd6ss3mYrbqICWI
	1GbaAzp+dlUgmB8gLOW/5Xl6vXyyXHMBdxHcC/IrGg9kNO6+DZ8ukNwIVU+skizUDM6AdUjM51/
	5SHLqxyDzD9TcNQ8/DMpjxSTlEbYK4EnXCjj5jS5wP6Y5XrlefcsoIu2ojTj0RFABQqOG+92pZF
	NJ58/Uj3W/SosXouWtDquEKudSsqerqlbqZgEBFobSvdQOHww2lxB
X-Received: by 2002:a05:620a:2a11:b0:8ca:2e37:ad07 with SMTP id af79cd13be357-8cd5aedc525mr148302085a.8.1772615004798;
        Wed, 04 Mar 2026 01:03:24 -0800 (PST)
X-Received: by 2002:a05:620a:2a11:b0:8ca:2e37:ad07 with SMTP id af79cd13be357-8cd5aedc525mr148296585a.8.1772615004301;
        Wed, 04 Mar 2026 01:03:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:29 +0100
Subject: [PATCH 08/14] leds: Kconfig: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-8-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=808;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UyednvCwSCoZ+nWGbhEbuv0oD/DsD+ub+SH
 Bayu8pZbRSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MgAKCRAFnS7L/zaE
 w1PEEACFpMfWSUuL7d1juKi1HvQOLE5EdxG8E6A4QaKtXdS3ANVfIy0qrGuEIUQXgicbWadwYfl
 OaTottfXrufEJmdI0fv5wm/Ba0Ce+dGauXb9LT3oWERf8IIESub3fSBxQR47tJ3RvMiImrdQvVN
 kKc/LD7R2+gjpCuPPTddvQZJ0tlkKy8e1ZTmaa/hkzkJ94XaN9nPnEIdFCu9Kr62779GyMchvXx
 BxRd++vsdgYSwLCw/buTmw5zNTr370yDqP+1qH+rVjMxtfO9Zw8zkY6hmSt2xTXNEqu7awNMt87
 y9s51NYMLEt/5kNRRBWwiQXOTueyUnFLcKDvppzruElRsoI/mAX658xGSGoP67hp+abb3nb6OLi
 JL4vTng9bv5lINhV3xT8Atk3VZh7t7iysgSY7rfnm/j5+USEIwNtWYLtSKS/Joc6vNav3MgRLhO
 4LmEv8gppfOWfvU+papRncEUoxZKfsuyg5JDM3qszyQdUxzbvR7uaaxIY92hvizidXOfkzZHiUm
 xis1G8tdtqLlUrRO525gB+cnSkXockjuD9cvWhGSr90WATkl8RtxCNSTacO8tjTGK7UiE0PavPA
 wmJlJkD5UNPd6btvf4QqiFjWdL6XosBMIn6BtwfkGMIKJS7BPu0sIS693sDZqL7tU3J1U4xbUVW
 GuGQMI9pJeVyrkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: YDkvVBvY9nUiuyxi8dKAZD6P0mqGKqwO
X-Proofpoint-GUID: YDkvVBvY9nUiuyxi8dKAZD6P0mqGKqwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXwvIGwAbI/Gs3
 XiNR2TuVU1bgP9XE3SD3/y/uWBW/Gl0bZaNLn4iLSVqtGauCl/wHOhzxhZYLc3Exp2lrdpEKQa8
 Ap6evGCrdgX4rgpidhvcCefKdEVFos73PRakH/q+ecbSBGsnQvI9gAOtC+f7JAOBehdvYw8u1+V
 hgJKus/UFGegUPs8FC40nkFRnMLpAlYm5E8gb6ENG0uLRQGZI0vnUYaca2zWb2qQy2UGxvRAlgv
 twFahxD8i+bgGdALSMJXpZ8xFQuI//07/7SptarQMhACJXvswTwwFUdhsD0Qid6eQHeDEhMiD3Q
 NHcUWc/yC20jvYR4jBfK+XZxLRidHJyo5pkTA+j4Fki+A63/xkscKT/SaDJQhpXL/RZl3Tb6SAP
 l84zW8HekYgwiAFty2zOwkd9fpV56WYub9hjJdOikEytgOsXqKiQzYw0vSFgQXehDEVwsZmikEd
 57yBTFdVNVppiVtoCkg==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a7f55d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ULgK7OEL32dECu8VbM0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-Rspamd-Queue-Id: 3715E1FD485
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32452-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/leds/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988b35f304e953e873af3afe2ae04b8..f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -765,7 +765,6 @@ config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || COMPILE_TEST
-	depends on OF_GPIO
 	default MACH_KIRKWOOD
 	help
 	  This option enables support for LEDs found on the LaCie 2Big

-- 
2.47.3


