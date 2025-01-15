Return-Path: <linux-gpio+bounces-14833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D0CA11E5A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 10:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30D157A25B8
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 09:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BD51EEA52;
	Wed, 15 Jan 2025 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="C6gJ6kMX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68833248163;
	Wed, 15 Jan 2025 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736934225; cv=none; b=DHlec9uzZl8gFhrCH//kGYXgjomFfdEAaOUsBy91JLFJGbxhyx8EzGVqGhvbsohZmWe4G1vi7he2FbM8solxMwTxukzWryKiSmWzwav8Vtc2vkvaHk/0HdPadMI0z6TVoL32EFluRuI2yXM0Q7sM5k4j9JRzYqnLffuQYfIP8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736934225; c=relaxed/simple;
	bh=ROpiUW4nfnLvf/oMZJYn+0lH6XwPLhFaln2Q/2PDHgY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I4rFCINm6MxxZgXsj8I94HnZ62crbdxPDKrHBlxfsM3zDi5QuU2hDrMMlIhhez7rUwkmpScJlCiXThlIWAMjeHybSUX2N2FF52XTviPFnVqDcVqv5nCSlZwicWtzAoZRZilRoJLNuSOXK1y179bL/cL57m4T+WsKhYpk4EkIMas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=C6gJ6kMX; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F4KQfu027304;
	Wed, 15 Jan 2025 10:43:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ROpiUW4nfnLvf/oMZJYn+0lH6XwPLhFaln2Q/2PDHgY=; b=C6gJ6kMX9GRMYrRv
	J+drCTKmogjD+SS+6zgBHoc8JZY8k6MgXz1lUo7GJj+gm1IZlIkKMEMu0FYue3/F
	one8F5Sfvh2rFNhZQrRM8tEB4nDdFU9RbFqXk2GoociJMPQOJPyFPVKU2c5LenO2
	BPSgqEXUd2yERQD34otXyuBXOYxpz24xSj39ByPImUiIDZOGDx3eqxUCkHQTDjqc
	EKkEgwjRpVCKQjGGTPcVebvrMYv7VUcGssIBHT0Y5kMo8o2DTbX466jp2GFRY6ua
	BiVVxkcUxTncCo+ZS+27FdTYZsYGTqydWHXSnO4N4ngiusIqzchMQ5gR5BkBXaIQ
	6l4FUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4465weh74g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 10:43:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 353C040045;
	Wed, 15 Jan 2025 10:41:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0E0C2481B7;
	Wed, 15 Jan 2025 10:39:44 +0100 (CET)
Received: from [192.168.8.15] (10.252.20.5) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 15 Jan
 2025 10:39:41 +0100
Message-ID: <e60d2c600133df2202bf3187eeeb9c31bc6c8f32.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: Use str_enable_disable-like
 helpers
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
        "Linus
 Walleij" <linus.walleij@linaro.org>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans Ulli Kroll
	<ulli.kroll@googlemail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
Date: Wed, 15 Jan 2025 10:39:33 +0100
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01

On Tue, 2025-01-14 at 21:36 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.=C2=A0 Ternar=
y
> =C2=A0=C2=A0 operator has three arguments and with wrapping might lead to=
 quite
> =C2=A0=C2=A0 long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
> =C2=A0=C2=A0 file.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0drivers/pinctrl/bcm/pinctrl-nsp-gpio.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 ++-
> =C2=A0drivers/pinctrl/cirrus/pinctrl-lochnagar.c |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/nomadik/pinctrl-abx500.c=C2=A0=C2=A0 |=C2=A0 5 +++-=
-
> =C2=A0drivers/pinctrl/nomadik/pinctrl-nomadik.c=C2=A0 |=C2=A0 7 ++++---
> =C2=A0drivers/pinctrl/pinctrl-amd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/pinctrl-gemini.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++-----
> =C2=A0drivers/pinctrl/pinctrl-stmfx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/pinctrl/qcom/pinctrl-msm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/qcom/pinctrl-spmi-gpio.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/qcom/pinctrl-spmi-mpp.c=C2=A0=C2=A0=C2=A0 |=C2=A0 3=
 ++-
> =C2=A0drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c=C2=A0=C2=A0=C2=A0 | 10 ++++=
------
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/stm32/pinctrl-stm32.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 5 +++--

For pinctrl-stmfx and for pinctrl-stm32:

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
Antonio

