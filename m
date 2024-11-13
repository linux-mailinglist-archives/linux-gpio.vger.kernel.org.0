Return-Path: <linux-gpio+bounces-12916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6E79C6B3E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C4CAB22AE6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 09:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA181BE871;
	Wed, 13 Nov 2024 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DTQFPpRA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD61BDA97
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731489046; cv=none; b=or2W2bu0l5VG2SZA98N/nQxLykt914zEaz0UoMpVsUj09qCsmXrwencdh2DAashzU23OOXIkUrSpds79LCGWFwg1k7fNwD1fZcPcQ5cEqa55sSuHnbDjUdR27sUJ4Qqh5ZYeGBCC1Kz8JzLDxv1SNgN4fkEQU7A4hDqGJb5NUOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731489046; c=relaxed/simple;
	bh=41ETKmIi3rZzSC+/rwGhQWVrmi2LCfX+MHv4EyZ+MWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFWYJUabLoy6tsLstKrpKl1qGZBOpIeT6dAGNoj6CZbVMFuqtwKL04SU9wT0HPlSRG57Cz63BiorcOB1ZDvQY/hWBpCUR++j3w4j5Qgbz1V0p8AHdYtHsSPqBjw876Qio0msjpTAwIDd360XL7/JhwBgPvuaEn22YNOf3QY+CIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DTQFPpRA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37f52925fc8so4348390f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 01:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731489042; x=1732093842; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LwD4oymmVslGH4NrMAKmK7EULNIhFHBAlUKHIqQhDQk=;
        b=DTQFPpRAm0DaOnJvlTRGvwR1nEM6Up1gf0+/kf6V9Ij4ZUhJBPcYL6+WMqxX8uXvdL
         fz5Y+P7tV0gsSraKeVMbk4N09iUsDSK828cutFKvsjHvKS055xKI+QYTRngq7Cdx8CFE
         bk5syWu4fZYykyTs0V8rSnev9lo5dkBEgo0kWMGfaKWBTlCO+cwcyBdNFCJuHUhhwMR9
         dZ4dtVmyJLadnAcaGibEr511uuNVzEPN88HdqfmSCSrdOZf3Ix3j+Mif+jcIZDHVjEQy
         3dC6ruashYgf4WO47hbJIdM4eBbrmwwhQHeKKX1uUWDYwBzBF2lYAabksu5FsqZ8kdCr
         A/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731489042; x=1732093842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LwD4oymmVslGH4NrMAKmK7EULNIhFHBAlUKHIqQhDQk=;
        b=fTF5JiY9Ghdvx9C6JzhVx+HR4tZtAiX1pO1N0raDBEdSZb4RTx3wV0tso3OuPwWDio
         hLniICG5YhWTz3y62tMyGRBeX8ntVn+Hu74A2zE/72+33DF0mGr4ByRtWzUddp3VVe2w
         sa2O6guUTYDgmMh3J19vAydyPVM6/k+Fnnc0bGZHLoOgtcWZbAf/jjqGHcKlKQxCWQCe
         vZblFiWwGiEEDuoaJnWTV4O/5ocjto+VBId3opVFsX8SzpGZNwt9erspKVoq7nZhjjac
         W274ZzFijLUu6LGDA46q4G1gh2cV8vTsLVp7K6HSsqWTn3OwHMg7do5NJ87Efv9e4mPA
         ra0A==
X-Forwarded-Encrypted: i=1; AJvYcCX6MUfN3LzRPNRpcMv4K/Ywd4uw61EPGImJWg8JUdnHa2y31Msp9hSX6ysqPuaBuKr+P5ssbGAbNGdZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzMmHgP1NUw1PfDqBnpMI21h4yFI9ropRlOq3GMf8OnEesd+F9u
	JV/rvwiu1/epAFLDg8/AZeCUbg3rUmn2Tx0AHejForIZEH2xjnOJfn7HP8X3nno=
X-Google-Smtp-Source: AGHT+IH09IsTVfhj1/VaTY74Lw93grA6LiugP7EfB7Jnoz9jG2gTVU3pLPEe79lc7dnOhtIBMB/wiw==
X-Received: by 2002:a5d:648f:0:b0:37d:46fa:d1d3 with SMTP id ffacd0b85a97d-381f186d11amr17375012f8f.34.1731489042505;
        Wed, 13 Nov 2024 01:10:42 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:fca:835c:70ab:eebc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97e206sm17553313f8f.25.2024.11.13.01.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 01:10:42 -0800 (PST)
Date: Wed, 13 Nov 2024 10:10:40 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: barnabas.czeman@mainlining.org, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Subject: Re: [PATCH v5 08/10] arm64: dts: qcom: Add initial support for
 MSM8917
Message-ID: <ZzRtEHsC4MROxN3v@linaro.org>
References: <20241112-msm8917-v5-0-3ca34d33191b@mainlining.org>
 <20241112-msm8917-v5-8-3ca34d33191b@mainlining.org>
 <ZzOQEgLLhkH-IymV@linaro.org>
 <0dae1cea420bd335be591e4b1be3d07c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0dae1cea420bd335be591e4b1be3d07c@mainlining.org>

On Tue, Nov 12, 2024 at 07:49:18PM +0100, barnabas.czeman@mainlining.org wrote:
> On 2024-11-12 18:27, Stephan Gerhold wrote:
> > On Tue, Nov 12, 2024 at 04:49:38PM +0100, Barnabás Czémán wrote:
> > > From: Otto Pflüger <otto.pflueger@abscue.de>
> > > 
> > > Add initial support for MSM8917 SoC.
> > > 
> > > Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> > > [reword commit, rebase, fix schema errors]
> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8917.dtsi | 1974
> > > +++++++++++++++++++++++++++++++++
> > >  1 file changed, 1974 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi
> > > b/arch/arm64/boot/dts/qcom/msm8917.dtsi
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..cf0a0eec1141e11faca0ee9705d6348ab32a0f50
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
> > > @@ -0,0 +1,1974 @@
> > > [...]
> > > +		domain-idle-states {
> > > +			cluster_sleep_0: cluster-sleep-0 {
> > > +				compatible = "domain-idle-state";
> > > +				arm,psci-suspend-param = <0x41000023>;
> > > +				entry-latency-us = <700>;
> > > +				exit-latency-us = <650>;
> > > +				min-residency-us = <1972>;
> > > +			};
> > > +
> > > +			cluster_sleep_1: cluster-sleep-1 {
> > > +				compatible = "domain-idle-state";
> > > +				arm,psci-suspend-param = <0x41000043>;
> > > +				entry-latency-us = <240>;
> > > +				exit-latency-us = <280>;
> > > +				min-residency-us = <806>;
> > > +			};
> > 
> > I think my comment here is still open:
> > 
> > This is strange, the deeper sleep state has lower timings than the
> > previous one?
> I was reordering based on Konrad comments when i have renamed the nodes
> maybe it is not correct then.
> I am searching for how to validate these levels, i have find these
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8917-pm.dtsi#L45-91

I think you translated them correctly. It feels like downstream is weird
or even wrong here. Usually a higher psci-mode (retention = 2, gdhs = 4)
also implies a deeper idle state. But at some point the
perf-l2-retention and perf-l2-gdhs state were swapped downstream:

https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/dea262a17a9e80dacb86b7c2f269bcc7b4df3a13

I don't know if this is intended or just an oversight. If no one can
clarify why this change was done I guess we can just choose between the
following two options:

 1. Describe it exactly like it was done downstream. In that case I
    would suggest swapping the node order back to what you had in v1.
    Even if that means that a lower idle state has the higher psci-mode
    (arm,psci-suspend-param). That should match what downstream did.

OR

 2. Omit cluster-sleep-0 and cluster-sleep-1. I doubt anyone will notice
    the minor difference in power consumption. The most important idle
    state is the deepest "power collapse" (PC) state.

@Konrad: Do you have any opinion here?

> Do you know where can i find psci-suspend-param-s?

You need to translate it like in this code here:
https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/drivers/cpuidle/lpm-levels.c#L1337-1340

Roughly described:
 - Set BIT(30) if the CPU state has qcom,is-reset
 - Affinity level is the hierarchy level that goes idle.
   In your case: CPU = 0, L2 cache/cluster = 1.
   Shift that to bit 24 (1 << 24 for cache/cluster)
 - For the state itself you need to combine the qcom,psci-cpu-mode and
   qcom,psci-mode according to the qcom,psci-mode-shift.

E.g. for the "perf-l2-pc" state, combined with the deepest CPU state
("pc"):

 - BIT(30) is set because of qcom,is-reset
 - (1 << 24) because it's a L2 cache/cluster idle state
 - (qcom,psci-cpu-mode = <3>) << (qcom,psci-mode-shift = <0>) = (3 << 0)
 - (qcom,psci-mode = <5>) << (qcom,psci-mode-shift = <4>) = (5 << 4)

All that combined: BIT(30) | (1 << 24) | (3 << 0) | (5 << 4)
  = 0x41000053

Which is what you have for cluster-sleep-2. The ones you have look
correct to me. :-)

> Should I also add wfi level?

I think we usually omit those for the CPU at least. Not sure about the
cache/cluster one. As I mentioned, at the end the most important idle
state to have is the deepest ones. Those will get used during suspend
and when you don't use the device. The others are more minor
optimization for light usage, which will be less noticeable.

Thanks,
Stephan

