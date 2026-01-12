Return-Path: <linux-gpio+bounces-30450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2AD11F87
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 11:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDD8E3063F6E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD0731AA9B;
	Mon, 12 Jan 2026 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otdsNDEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGA2qXtG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9A029D28B
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214484; cv=none; b=aqSUsbV9wWUU/Ic7zvZ6aV6i+gse47TJaDtYxKsxF7UcHLGyBUaaWjx3YVTpp8zLjZJdP35p30VIppxBvhL9T877vLQauRmKtHbpvKIYatEDyobHQpSe/hP82RwF9L8nbmmrY9+jUFXS+j9AUi+bC5FadZBiG8CzjokfAwKI5jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214484; c=relaxed/simple;
	bh=gxx8rPP9oRn7r/QWnUirO/nMc+mwgRrCDHSpmCS/exA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gq4uJD9ALV70GQVD1l1P8xMP28GL/fLjOJT5MOSq6DsKi8CTj0GV+yrfA3pe43Y21CRW3WO0qDWeveS+v2xw4cN01kg5Ah5kJ8yFmbxYGkRRD6AU6kp9jyXBVyuKjKAMHPkz3DUy9W0H6ocSCKxruMzXL8uejs+lg0F8QBNrfO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otdsNDEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGA2qXtG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CA6pnS1381374
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 10:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3QWgSirYzzznIwBV9Rl6utuizoHR4CF5kfxtFtGNuPs=; b=otdsNDEbba2Yd4Ir
	EuxYcD828lRecEgPcHnDKMFjawb6ulNWlOGzkem7mE32lBqYarViufT9FW3Mrz0V
	bT8zHzsQf3GIzqqMXJGsqfRGnrwZp1FolsOQKKnyhKclbEQE2AJ3bvAvKE8+n+ka
	ub3A6cni5D+tYTrdN8ougHTj+XxInIkrSF5tiZCw+PZihJS8G1vAD3UhsQAZwGk9
	C+L9H8haI4Vp4nxZI1pCg1Wp+X+2yYekq42dWR9i/gNuYrUk/fLe5AprbP01h64+
	8kMewHoKoc4FHyZOg6A/cTkj29HyLzRoIrAP9wrl5bEkSzNn2Bz6JUTo4iYH+y4n
	8LSD2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxwv02q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 10:41:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b51db8ebd9so2113874285a.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 02:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214481; x=1768819281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QWgSirYzzznIwBV9Rl6utuizoHR4CF5kfxtFtGNuPs=;
        b=MGA2qXtGR+XpXVG4j3lqznq3tMHKxyWtYLLCxf0fqA67z8XFiSt0BI2ayCnrchqMQI
         udsh1k4J2ut72ZiTjxY8oOTazB+Oi0xD5GANHidtwrbAD47oZSwby/RZUnOkqffCeiZc
         p+TQJ0QAXGK1IAdSdpLWTVo6vDh5DRa0OTlCP1eWU29+bFg2n9Hoc6CMye45tEz3DBGT
         yCiIkfJHjFH0kIGpoC7/iBIc0WXy76FRCAsS7pL1Xe+TSbfTVl8AMe8iBS4Jb9oJgIx2
         YZ0UTHKggn0u7vdbUHTM14hohxXfrx082Wc4Vg7KRMhhVNpo99k3Ym8F2agOb+8HavZx
         GhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214481; x=1768819281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3QWgSirYzzznIwBV9Rl6utuizoHR4CF5kfxtFtGNuPs=;
        b=HXDm0n2J89DUdS5yrf/85LX4Qx7dwIMHCLuoJWlnGznOdxgNZeV4/gRQwPt+6P28EV
         IQ0/j7IArG4HRUzq2nd5lRIi9KigkC5TOUjN9tPPoZKxTUc0E44MkA0kvRkncYX2ogdt
         nzu7s5k5A0FZyNWXmhwiDIbAZ6cNRakox13Mk7aROX/M53d3uJ/4D3oxuYDOWYIVRZoe
         eQOBA+tSy9Tt251dtSDu6QJg/rDYfro6LokAHFbB1c0AWuTuWeSTwJMF4F0bn2nwwai+
         627vu8kUGM9J/slTENeWWZgyBlY7hFIV5ndXegnNIOXZ3vF2arWHoFekTZ0uAblGyvzS
         ubgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2oxk3qvPFm5Dj8jbuk2I48ibkzjMkPDUu1m/uJII8jnaleAqLCJHwAz3EsuWOUahXHudwIz3iTqby@vger.kernel.org
X-Gm-Message-State: AOJu0YwpZs4//qoOQY0M/RjSLNuTBUJaMfP8mEoK+sBQW1dHnr9X2k0U
	eilvqtP5VOADgucpBiF6gDPcEt/9Kv3KDsjhhEH0eLuD30JBWb/rOGc1EBCQ2YSZpquGO0B/zmu
	QNPHue5eMZ1hKlz+SIue/wM1Okga0lHVqbQ0voF5tgHabbTQ+/nT0qlK5a1ASWLm6
X-Gm-Gg: AY/fxX7RYTbWIZVmj0nveChOjDQ1T9riturjThQSYeukAqCUrtklTvMA17TfXJ0OcxM
	GT3fbXeHbjcTphBsh3FmYZFUx53AyKgB99oWG72IzLI8WSQwLV70jC4x/P2VIi5zJ91sS2XgRdr
	8lwe5hfqvpPcmE9JTTf42hJs/OXMa/ZlbM4WNBcAicJWCHB/g4TYPVUH+erotdEnhl4rkSs2EkZ
	etTtD+qLxbgoNfupLDJ4ecLr08ec7WEa4vLrN0Vz6HYwb6XwVGz9Q1Vmxi0Nf8Ez4++6Gp5Lyyb
	AGhThZE6myvUu2v4MD83YXKsZ+gxzma6hvDat+W75AkBMoZ4EIAcBMNNbgovB5enGaV4NHj1h8/
	5KpYYOmwib5DT5hulBYIjlDSMN8x7Bvh/Jc9w5+k=
X-Received: by 2002:a05:620a:4512:b0:8b2:dcea:fc78 with SMTP id af79cd13be357-8c389379cddmr2455488685a.16.1768214481421;
        Mon, 12 Jan 2026 02:41:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnMJKdD7TnoiXuy9wag/M2gnhHbRsN2onqBx2A3Hz1wFnxTGgE2cSjLR7f1TtAtXTfMYr5oQ==
X-Received: by 2002:a05:620a:4512:b0:8b2:dcea:fc78 with SMTP id af79cd13be357-8c389379cddmr2455486985a.16.1768214480994;
        Mon, 12 Jan 2026 02:41:20 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm38437424f8f.17.2026.01.12.02.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:41:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Swark Yang <syang@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
Subject: Re: [PATCH v2 0/2] gpio: cadence: Add Axiado AX3000 support and edge interrupts
Date: Mon, 12 Jan 2026 11:41:19 +0100
Message-ID: <176821447522.14821.3003241286321804635.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
References: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e2klASwPW5oRxj9TDSBlT5eGorguowE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX/aAxzC8GgCTG
 meOUHnbR4NqLowFIxj77uPWvxboQHz8AZob8owh/cIfStqYXswpH4LV7t0PUF5m40o42UlqdUX7
 BLAVLfnc7DLcguHv1OzcAvM/fVXODgjo3F1fU4QPWY3itah+bda25dZnth6IM9C+6YWo9uUFM2K
 PxpwdTZqu1RmnZKRVO82twjxjW5bMYNFohlNKulplLg8664wWPcBNQNm+m+XzkHCoXwAcvov4FI
 /+Zji9tZBwykiCcfKR/YFiahDNbpm/43yjKl+zPelgJSPh128kiP+pgqhHSi4fMqvOf3nKziVdO
 WCz8TJ/wGSpxBZELALMQk0+FSlUO1pPY1Vs1sjZ3lPdshksn7BcYuExR1OHWqVuPXmeG7/cPE+a
 NGwsTGuV42rhOjh9a8UpqWqsD2bYbGK5EcFK79YJQDEYPgRNsawSCxz/bfGbFqeO7xdtrdoi+gl
 xcdErhaT5P/SoxwJ7bw==
X-Proofpoint-ORIG-GUID: e2klASwPW5oRxj9TDSBlT5eGorguowE9
X-Authority-Analysis: v=2.4 cv=C/XkCAP+ c=1 sm=1 tr=0 ts=6964cfd2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bCYjfYi5PzCXYrtmsVUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120085


On Fri, 09 Jan 2026 01:26:05 -0800, Swark Yang wrote:
> This patch series updates the gpio-cadence driver to support the Axiado
> AX3000 platform and extends its interrupt capabilities.
> 
> On the Axiado AX3000 platform, pinmux and pin configuration (such as
> direction and output enable) are configured by the hardware/firmware at
> boot time before Linux boots. To support this architecture, this series
> introduces a platform-specific quirk to skip default pin initialization
> during the probe sequence, preserving the pre-boot configuration.
> 
> [...]

Applied, thanks!

[1/2] gpio: cadence: Add quirk for Axiado AX3000 platform
      commit: ea5b4c68e097412f2d3ca13314b672837718a446
[2/2] gpio: cadence: Add support for edge-triggered interrupts
      commit: 43f37d44f2b8a75a896e218bac1e43d75063f8d3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

