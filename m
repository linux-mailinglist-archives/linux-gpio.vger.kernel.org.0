Return-Path: <linux-gpio+bounces-25483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559BCB41C78
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 12:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE3F37B3FD6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5CA2FC031;
	Wed,  3 Sep 2025 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="leJrN4iK";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="8Jg0DZ41"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70E02F746C;
	Wed,  3 Sep 2025 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896809; cv=none; b=Z+EOlInwKfi96Jr6mEhmp1cg91V8IJJW3ObegeaZdBa3j52aTdL064DjBy3sPv3Exf2UCkJ4vnoSq1FmQbyziIfPiT/aDXxrVxvuRJZ7jqx+fBiEmcUaHlNKHv5Ti9VgsdHzvw5xzHNZf8l/VxYO7ckW+5kWKLek3sZUjimbLrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896809; c=relaxed/simple;
	bh=zNqGWM1epEkBKdiCB0GgxYoHjpR2xkf2JKZQG6wXm2Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=A5yAV8XhjBr7iTXsdPKt0RGdhki+JAah2lNX3mACmrZVQabl3+pr731HVAvfKaXccLQuQTaYqydIPwLoK/YvarvXbF1majz4h71BE3W8K9wsiDBDQcnPIZVAN+6sXqHsZQihWElsGjaR02pH7OYZjunR3DzNsQLHDU7dDAsUsJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=leJrN4iK; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=8Jg0DZ41; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1756896472; bh=w5KE+aRxRTKqGhguAvxb/9U
	dpO2fWn4q/HDyXbO050U=; b=leJrN4iKxY1skjcpew5WDFcPURxrUO2iv6irLXq+ZWhsELmyF6
	ea9lN4SatzsE5EtjsQvbArOr5XlmJGClyXXDLauyCflWrvd688xgkmHHBN/f3QCzBnKp/doZlUl
	VPClNOgwa7bw4dZUDejRkDYmg6AneJQbGI5i399W1D96QAI75TPbaa/Q58QBXqU03pByByOB57F
	XdVUeBQ1/gJ7eNjtbWIKtl9F9ZTVJoJaeTi4WZSyeGrjVtSz8Y4onGCUgX67/DgdQ+hu7JRQn+S
	RB+ABIs2qGb5Uzir0TKJuo93Wd+SwGIY1nMV2Z3lyPyRKHdKxJsprqAwXcBRSJAHmRA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1756896472; bh=w5KE+aRxRTKqGhguAvxb/9U
	dpO2fWn4q/HDyXbO050U=; b=8Jg0DZ41+t1Q83eXmdy96hFfUMz2eEqjtljsqYLosRy4ea5SmV
	QgfMK3yeI2tpwozUqLu8JeY7YK99Y/mwTHDg==;
Date: Wed, 03 Sep 2025 12:47:51 +0200
From: =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <barnabas.czeman@mainlining.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?ISO-8859-1?Q?Otto_Pfl=FCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 Srinivas Kandagatla <srini@kernel.org>
CC: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Dang Huynh <danct12@riseup.net>
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
User-Agent: Thunderbird for Android
In-Reply-To: <67aa2a1a-3adf-4c97-a7b8-865b5ca3b17e@oss.qualcomm.com>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org> <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org> <67aa2a1a-3adf-4c97-a7b8-865b5ca3b17e@oss.qualcomm.com>
Message-ID: <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 3 September 2025 12:42:38 CEST, Konrad Dybcio <konrad=2Edybcio@oss=2Equ=
alcomm=2Ecom> wrote:
>On 8/31/25 2:29 PM, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
>> From: Dang Huynh <danct12@riseup=2Enet>
>>=20
>> Add initial support for MSM8937 SoC=2E
>>=20
>> Signed-off-by: Dang Huynh <danct12@riseup=2Enet>
>> Co-developed-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas=2Eczeman@main=
lining=2Eorg>
>> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas=2Eczeman@mainli=
ning=2Eorg>
>> ---
>
>[=2E=2E=2E]
>
>> +		qfprom: qfprom@a4000 {
>> +			compatible =3D "qcom,msm8937-qfprom", "qcom,qfprom";
>> +			reg =3D <0x000a4000 0x1000>;
>
>here you reserve 0x1000 for the qfprom
>
>[=2E=2E=2E]
>
>> +			gpu_speed_bin: gpu-speed-bin@601b {
>> +				reg =3D <0x601b 0x1>;
>
>and here you make way for OOB accesses
Ack
>
>Make qfprom length 0x3000 with the current base and the gpu
>speed bin should be at base+0x201b, I *think* (the docs aren't
>super clear on that)
>
>[=2E=2E=2E]
>
>> +		mdss: display-subsystem@1a00000 {
>> +			compatible =3D "qcom,mdss";
>> +			reg =3D <0x01a00000 0x1000>,
>> +			      <0x01ab0000 0x1040>;
>
>In v5, I pointed out the size of vbif should be 0x3000=2E=2E and the rand=
om
Where 0x3000 is come from downstream is using 0x1040 for vbif=2E
>newline below wcss-wlan2-pins {} is still there too
>
>Konrad

