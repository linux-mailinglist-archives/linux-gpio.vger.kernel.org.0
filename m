Return-Path: <linux-gpio+bounces-17674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CBCA64862
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 10:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DE4618853B2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 09:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836DA22DF91;
	Mon, 17 Mar 2025 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nkfwHgNI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAD222C355;
	Mon, 17 Mar 2025 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205472; cv=none; b=FrZWCa8Cwch7FvcDfJfD91j+Bso3TiMpzzO2DfaeIIU9yMLACNcHpBcOy20dj9QJ6goVTVeYDvrIwa99jfWOu9oqbEuP8DLMZz0BpJLIo95AGYQhL+ND8L9hQyv62L7kkamSHrgptkYXNzm7gy+xQdW+aSEgbm2+XIqeGA0hkUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205472; c=relaxed/simple;
	bh=u4gGQHQyXKmcD/n4B9Coibe/2rVi6aB/7qBpOdGg5FU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=p+ZW75W3IcAYoJRGo5xf9XtG3h9Osvhg0cWTNh3BxbquXXvmnJWhdgaR1kiFx95sDgUC3jyv7k8NC8/9YOaKPjckRn7n/nJuPPqjeKHAViWzC5cV5px8lzQVTIbKZPlvYOObXlEpzwIXsv7/PLqVbqwiTzWOOjwALu3KFVuRaEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nkfwHgNI; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [127.0.0.1] (254C1C5A.nat.pool.telekom.hu [37.76.28.90])
	by mail.mainlining.org (Postfix) with ESMTPSA id B53F0BBAC4;
	Mon, 17 Mar 2025 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1742205468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FhlrRtgQ29uAkg57Izvory2SkjADGQMOEcn3oIaEafg=;
	b=nkfwHgNIkMw6drNJf+qwgVofGWU+RQr5cydxMVJUZvLcx3uT/yiIjF68d2I6B9d2H1DydP
	AmymPLAI6g2lw7kEDLY+0D3uDkoP9QAUPFh6TEeG/dpXpr6lEisnrxIYknRRnEID3jHCtQ
	N7MZ+vsQz5FHOYKqC1J89V2skPUC++82H33O3InzwoQO5ZmDaFg0uwmVqxqTsBqmeJG1AS
	lcvUWqbfk29XZM0NjItqztSvwYQH6wtwYVBMjOYLAuZB8fFOHSsD/BKYZpMHFwGxb8SSof
	8QBPprrFFrZjZ6wirsgCU+OShkqiFfLOD11BURS2ICwXmBXo27u7e81uiLmRvw==
Date: Mon, 17 Mar 2025 10:57:45 +0100
From: =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <barnabas.czeman@mainlining.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?ISO-8859-1?Q?Otto_Pfl=FCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_1/6=5D_dt-bindings=3A_clock=3A_q?=
 =?US-ASCII?Q?com=3A_Add_MSM8937_Global_Clock_Controller?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250317-hot-obedient-sturgeon-394cb8@krzk-bin>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org> <20250315-msm8937-v4-1-1f132e870a49@mainlining.org> <20250317-hot-obedient-sturgeon-394cb8@krzk-bin>
Message-ID: <11695D76-7CBE-41CE-A8DD-D6845D01670C@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On March 17, 2025 10:17:46 AM GMT+01:00, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
>On Sat, Mar 15, 2025 at 03:57:35PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n =
wrote:
>> Add device tree bindings for the global clock controller on Qualcomm
>> MSM8937 platform=2E
>>=20
>> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas=2Eczeman@mainli=
ning=2Eorg>
>> ---
>>  =2E=2E=2E/bindings/clock/qcom,gcc-msm8937=2Eyaml           | 75 ++++++=
++++++++++++++++
>>  include/dt-bindings/clock/qcom,gcc-msm8917=2Eh       | 17 +++++
>>  2 files changed, 92 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937=
=2Eyaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937=2Eyaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000=2E=2E3c3f6756048e195671f=
542b3a6cd09057558eafa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937=2Eyaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> +%YAML 1=2E2
>> +---
>> +$id: http://devicetree=2Eorg/schemas/clock/qcom,gcc-msm8937=2Eyaml#
>> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on MSM8937
>> +
>> +maintainers:
>> +  - Barnabas Czeman <barnabas=2Eczeman@mainlining=2Eorg>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks, resets and=
 power
>> +  domains on MSM8937=2E
>
>This is exactly like msm8953, so why it cannot be there?
>
Not exactly clock names are different, msm8953 have sleep msm8937 have sle=
ep_clk=2E
>> +
>> +  See also::
>> +    include/dt-bindings/clock/qcom,gcc-msm8917=2Eh
>
>typo, 8937
>
No
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,gcc-msm8937
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO source
>> +      - description: Sleep clock source
>> +      - description: DSI phy instance 0 dsi clock
>> +      - description: DSI phy instance 0 byte clock
>> +      - description: DSI phy instance 1 dsi clock
>> +      - description: DSI phy instance 1 byte clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +      - const: sleep_clk
>> +      - const: dsi0pll
>> +      - const: dsi0pllbyte
>> +      - const: dsi1pll
>> +      - const: dsi1pllbyte
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +  - '#power-domain-cells'
>> +
>> +allOf:
>> +  - $ref: qcom,gcc=2Eyaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmcc=2Eh>
>> +
>> +    clock-controller@1800000 {
>> +      compatible =3D "qcom,gcc-msm8937";
>> +      reg =3D <0x01800000 0x80000>;
>> +      #clock-cells =3D <1>;
>> +      #reset-cells =3D <1>;
>> +      #power-domain-cells =3D <1>;
>> +      clocks =3D <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +               <&sleep_clk>,
>> +               <&dsi0_phy 1>,
>> +               <&dsi0_phy 0>,
>> +               <&dsi1_phy 1>,
>> +               <&dsi1_phy 0>;
>> +      clock-names =3D "xo",
>> +                    "sleep_clk",
>> +                    "dsi0pll",
>> +                    "dsi0pllbyte",
>> +                    "dsi1pll",
>> +                    "dsi1pllbyte";
>> +    };
>> +=2E=2E=2E
>> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917=2Eh b/include/d=
t-bindings/clock/qcom,gcc-msm8917=2Eh
>> index 4b421e7414b50bef2e2400f868ae5b7212a427bb=2E=2Eec1f0b261dd5ccfe489=
6a00ffa9cf86de98b9cb3 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-msm8917=2Eh
>> +++ b/include/dt-bindings/clock/qcom,gcc-msm8917=2Eh
>> @@ -170,6 +170,22 @@
>>  #define VFE1_CLK_SRC				163
>>  #define VSYNC_CLK_SRC				164
>>  #define GPLL0_SLEEP_CLK_SRC			165
>> +#define BLSP1_QUP1_I2C_APPS_CLK_SRC		166
>> +#define BLSP1_QUP1_SPI_APPS_CLK_SRC		167
>> +#define BLSP2_QUP4_I2C_APPS_CLK_SRC		168
>> +#define BLSP2_QUP4_SPI_APPS_CLK_SRC		169
>
>Why are you adding bindings to 8917? Nothing in commit msg explains
>that=2E
Because msm8917 driver was expanded with 8937 bits, i will expand the comm=
it message=2E
>
>Best regards,
>Krzysztof
>

