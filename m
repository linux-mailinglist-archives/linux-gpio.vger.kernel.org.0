Return-Path: <linux-gpio+bounces-17673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57407A647FD
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 10:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DC811890C3A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 09:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E238822689C;
	Mon, 17 Mar 2025 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HjKaTdPy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4611AAA32;
	Mon, 17 Mar 2025 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204938; cv=none; b=Iqj7l9jLQZWcDrkjch6huJIPQNyt/JXVjB/bi8uTp6a5n7kr/o02ele6DIQ0dTXkdRd2BwUhlbRnGvYrsMLvtMbChdL/QpNHVIvCBqKQIGwmg+Ryxq151VxAldfaegpoRN1B+e4YdOCGvuqDne6oHuwdZRS6RnEVm2/PxeuuHA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204938; c=relaxed/simple;
	bh=h7GyFVQU2oi/Oh20M0uqm+bW9goiwku7FOLQNxE2IvQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=rw1+TI+Fc8k0omuF1oa0M8LeWRfwuFOH8QJwfHeq9KzvJ4ts1SfGscb391LZllTZkE5NEj3HNNtHGk4X/upva1SrXmY7pUZTtRPQcIP1qF4QE/qguLYhRv2PsREuvZ6l5Oobk6hRuv1vRUG+Yqg/l31oFcPssY4t3K/s7ebeyZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HjKaTdPy; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [127.0.0.1] (254C1C5A.nat.pool.telekom.hu [37.76.28.90])
	by mail.mainlining.org (Postfix) with ESMTPSA id C8F94BBAC4;
	Mon, 17 Mar 2025 09:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1742204929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KQUc1TIqImv/gjsL1SsdE5mqG9ewHx8AMbVf5J90/JE=;
	b=HjKaTdPyYIaSu2gQhXv0c2GnzmfZhGAMCKxZ8Uzv2knIpTsW44IwlfaN142YjxS6Iv4BkT
	BOI+LRkkwuL9s7HKOfzGxRyBrhgO1jGgBMhSRvmqRMQOwuG1mp1bfy31tASnmODSUpT1FJ
	hxrEu0LsLpBqMONxp69RU4XxSj68pQFGpLhacpQni5tiRINKPHc0ihgpJ029CyxqbtaLfu
	JkyQQRm+MwhZK5/wSUDyBxA0sfU3IJXwu/yqtSwxPosBKCl1HhRBNOhVYFBCX9zihrgjmv
	FJEHe2Qj3fyJPNV4drbURK+9avdc7rgSkmwvyENBwh5cPImGI/kwMBJ5ERHPJw==
Date: Mon, 17 Mar 2025 10:48:47 +0100
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
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Adam Skladowski <a39.skl@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_3/6=5D_dt-bindings=3A_drm/msm/g?=
 =?US-ASCII?Q?pu=3A_Document_AON_clock_for_A505/A506/A510?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250317-hypnotic-weightless-mosquito-f489ad@krzk-bin>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org> <20250315-msm8937-v4-3-1f132e870a49@mainlining.org> <20250317-hypnotic-weightless-mosquito-f489ad@krzk-bin>
Message-ID: <73631B5F-0916-4F81-AAB4-C8E2F4B999EC@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On March 17, 2025 10:21:50 AM GMT+01:00, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
>On Sat, Mar 15, 2025 at 03:57:37PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n =
wrote:
>> From: Adam Skladowski <a39=2Eskl@gmail=2Ecom>
>>=20
>> Adreno 505 (MSM8937), Adreno 506(MSM8953) and Adreno 510(MSM8976)
>> require Always-on branch clock to be enabled, describe it=2E
>>=20
>> Signed-off-by: Adam Skladowski <a39=2Eskl@gmail=2Ecom>
>> [reword commit, move alwayson on the first place]
>> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas=2Eczeman@mainli=
ning=2Eorg>
>> ---
>>  Documentation/devicetree/bindings/display/msm/gpu=2Eyaml | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu=2Eyaml b=
/Documentation/devicetree/bindings/display/msm/gpu=2Eyaml
>> index 6ddc72fd85b04537ea270754a897b4e7eb269641=2E=2E5028398cc3b517e404a=
92a2c30688f72eab4c1b3 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu=2Eyaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu=2Eyaml
>> @@ -152,11 +152,13 @@ allOf:
>>        properties:
>>          clocks:
>>            minItems: 2
>> -          maxItems: 7
>> +          maxItems: 8
>> =20
>>          clock-names:
>>            items:
>>              anyOf:
>> +              - const: alwayson
>> +                description: GPU Always-On clock
>
>Are you adding bindings for devices which were not described previously?
>Then don't grow this pattern, but create if:then: with a strictly
>ordered list for them (and keeping order of other variants)=2E
>
8956, 8976, 8953 schemas are failing because of missing always-on clock=2E
>Best regards,
>Krzysztof
>

