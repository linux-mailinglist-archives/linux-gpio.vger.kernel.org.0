Return-Path: <linux-gpio+bounces-12039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3451C9AF556
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 00:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8B0E28252D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 22:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45094218582;
	Thu, 24 Oct 2024 22:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtBio/n9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91379218328
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 22:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729808673; cv=none; b=ggLLv7NHsO+zUQs/yZOojddyKADUwf0l4w/83gHFm0bvX9TGZFzhOZ5nPVADCKFHwlAT7pqCWUzVOZjF1CzBqKt0d1KiQb2Dd3ec4HJGzUv52eM+g3Q240UvmQ4wgtyN76hUu2b+cGOwgj+/1M7Kyn2LCIhPXlsDEAH6GmKhBuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729808673; c=relaxed/simple;
	bh=b3Oqdz9XIKXZD2gr94AL8g1IimMVqiVBRgfe0bV1erk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ag8gXfVXcGungy6iM5vKBw149CxD8tAaDVR1QB9yNm097IlwP6ZHcDhaeGKO2cgvmR9toPgW2QFbpjNyI+/JwvZXYgpwmrUe8W85n8swdjn7vJQG4toJQhLuYEvH5dqZtZCcMTis59RpBF0ICH8uX1VPpgmivLYhDibtG4BVl8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtBio/n9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e7e73740so1306554e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 15:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729808668; x=1730413468; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNMGjw++sMHfaJpTwkpeeb5+CZwbF2kDV2e17WrmTm0=;
        b=mtBio/n9Iy30NY/Vx+xkT+laZSzQFD52QUrDpLiZCNtoIGrAx/eqyIViKrwSVaIie8
         WCMWQghjE5gXWrhFoWApfpQRNbHMTM3AWj31HKZyDYBTYHFtW6uBDFXEx9vrVLfc8JVH
         +ZDsxQxbP1UWwBigUGi7QrXPbaBb13dHZJBLYTvPJR9g3fwoiAL29hkONX2uvTH5EV0S
         UnjoxtlN3XgSI8fq8FSTofI3ddPC07vOpD82y2p/Ww+XEWJYxzKJNOk+pc4EnIcBuKGJ
         U6lU/OxAvkHJXM9clTrA4axWjsHrCRJJMHuFWsoFFoiK2BkUkIsfuPenlOsryNUweGTd
         2PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729808668; x=1730413468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNMGjw++sMHfaJpTwkpeeb5+CZwbF2kDV2e17WrmTm0=;
        b=tN/KF31L7AANJSIIXDkyjyR5BmfMoJkp+8/81tyIstKFAOIxIOgNRVq33pPrPdAiqw
         ro6hXiwnAAm5Dh6k4gm7VSivA40xZmdmVuwGzA4PL472s/i03MVXxv/eJ16WwgVkBuoH
         VULVYJq1JzyzQiDiFg45ba8OXMspsQML6EroKSlwmR5ZBNbkyybTEcMAlXudNi74tM6g
         evkD4bajIs8+i81Au1/JNlApyn2hASlpQQeQi5EHe3syGNLjBuRpR5fOgEJugMXirhri
         1KqiqhtZ6pyZ4RosNJim/r+N/YglH/f5+dYXP3PY+Ld78RIvRFCi1gIDS3NSZlCKG1nc
         2LZg==
X-Forwarded-Encrypted: i=1; AJvYcCUOA5DR+E6DQ9h6dW4I2l6J2tsaqtevMqI1Rw4cfu4yJlkxWASClR55aXMdK2UpmExOLRBd+ACi5Ft2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+xEminq7e7jlCSNE59Vo/HnQ1a1EdVTgdmJmmxuKlmFUn/rL/
	1PdU6dIafBwuzySh+/l0Wt2D2Qe5FmPj1XZzAqn7aPzchjggPO8UnBHD7rqJNqk=
X-Google-Smtp-Source: AGHT+IGMGFhwLsswBUxiX+Gh6Mwmw4Gpv/RT0zNWikzUs+v1WjRd6mzd0pMZGj9Em8bkTL+w/Phbng==
X-Received: by 2002:a05:6512:6511:b0:539:faef:35ec with SMTP id 2adb3069b0e04-53b1a375c09mr3432667e87.49.1729808668438;
        Thu, 24 Oct 2024 15:24:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223e5ab6sm1481972e87.13.2024.10.24.15.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 15:24:27 -0700 (PDT)
Date: Fri, 25 Oct 2024 01:24:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: Re: [PATCH RFC 12/14] arm64: dts: qcom: Add initial support for
 MSM8917
Message-ID: <h4dy2fesraalsri4gclenp4luwqjoh7iv2xysqnf6uwy3qp5de@x6iqc6pa365i>
References: <20241019-msm8917-v1-0-f1f3ca1d88e5@mainlining.org>
 <20241019-msm8917-v1-12-f1f3ca1d88e5@mainlining.org>
 <2iayllvk5ohrmbhnn7up5gvys2ijzxuyf44c53uwcbsunre6np@ncrimgac2idz>
 <19884457f1133a20a6ad014a75906e55@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19884457f1133a20a6ad014a75906e55@mainlining.org>

On Mon, Oct 21, 2024 at 11:14:55PM +0200, barnabas.czeman@mainlining.org wrote:
> On 2024-10-19 15:43, Dmitry Baryshkov wrote:
> > On Sat, Oct 19, 2024 at 01:50:49PM +0200, Barnabás Czémán wrote:
> > > From: Otto Pflüger <otto.pflueger@abscue.de>
> > > 
> > > Add initial support for MSM8917 SoC.
> > > 
> > > Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> > > [reword commit, rebase, fix schema errors]
> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8917-pins.dtsi |  344 ++++++
> > >  arch/arm64/boot/dts/qcom/msm8917.dtsi      | 1557
> > > ++++++++++++++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/pm8916.dtsi       |    9 +-
> > >  3 files changed, 1909 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8917-pins.dtsi
> > > b/arch/arm64/boot/dts/qcom/msm8917-pins.dtsi
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..f283ffd59b8aca8e510ef95d5526af9592a1c036
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/msm8917-pins.dtsi
> > 
> > Please merge into msm8917.dtsi (for generic parts) and
> > msm8917-boatd.dtsi (for board-specific parts).
> > 
> > > @@ -0,0 +1,344 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > 
> > If possible, GPL-2.0 OR MIT, or GPL-2.0 OR BSD-2/3-Clause
> Unfortunatelly i cannot change the license i do not own the original code.

Ack

> > 
> > > +			tsens_caldata: caldata@d0 {
> > > +				reg = <0x01d8 0x14>;
> > > +			};
> > 
> > No, individual bit definitions for each of tsens fuse values.
> > 
> > > +		};
> > > +
> > > +		rpm_msg_ram: sram@60000 {
> > > +			compatible = "qcom,rpm-msg-ram";
> > > +			reg = <0x00060000 0x8000>;
> > > +		};
> > > +
> > > +		tsens: thermal-sensor@4a9000 {
> > > +			compatible = "qcom,msm8917-tsens", "qcom,tsens-v1";
> > > +			reg = <0x004a9000 0x1000>,
> > > +			      <0x004a8000 0x1000>;
> > > +			nvmem-cells = <&tsens_caldata>;
> > > +			nvmem-cell-names = "calib";
> > 
> > And here too, individual bits instead of a single blob.
> I do not know how to do that i have only find some parts at downstream
> driver to be able to separate
> the cells but i do not have every information for it.

Well, you don't have to describe every information. I'm simply asking
you to replace single tsens_caldata entry with per-sensor and per-point
data, see e.g. msm8976.dtsi and data_8976 / ops_8976.

> > 
> > > +			#qcom,sensors = <10>;
> > > +			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "uplow";
> > > +			#thermal-sensor-cells = <1>;
> > > +		};
> > > +
> > > +

[...]

> > > +		gpu: gpu@1c00000 {
> > > +			compatible = "qcom,adreno-306.32", "qcom,adreno";
> > 
> > Is it really .32 ?
> Yes it is A306A (Adreno 308)

Ack

-- 
With best wishes
Dmitry

