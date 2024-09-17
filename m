Return-Path: <linux-gpio+bounces-10206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F5297ABFD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 09:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDF211C2125D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 07:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1BD84E1C;
	Tue, 17 Sep 2024 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WUJqdh9w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C2130A73
	for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726557938; cv=none; b=a1AvWGMZD9AUk/mMiMAD104qZ5og0UHBxn4Vq/nbi1hNOkspw1axLWfwyZwi5kfYU//prU4uWSb+pHTOdTv0qNud9eChbjIO08F1kyxU5DSwzLFw1gjsctdQxVOVyA9AdRlkgZi/EoRPNFARhmzyFseGmU8gRLfrzjc9zIA6pdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726557938; c=relaxed/simple;
	bh=HyoSAr6BPjEYTVZ4vMJY8wWkvVzIse2sP4JsFpS79wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIMqdO6PW1QeBs2Zk8rEik6+0wWbTyw1Tp1GNrdkcTQ4cv3hYRrlYlyUaHcGj+4KgKnQKgwI2m5pgq63SqIn+w5H0mB0IqOJFfab+99fKmlgRiI6KIRvJFVeMeSLq8E3zovs9fbxbVzBjKnAdQlbV99nDllReLb7WxBCUYLKTyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WUJqdh9w; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5365cf5de24so6734054e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 00:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726557934; x=1727162734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65taDXGYJvoQR7ZX9bcjdcEeKfQ/XK8T31XZzveD3cs=;
        b=WUJqdh9wlvw1ffBWMeOdE2jBE9ANJCatJA5BbmLcbuZCZhHlw3leRVVElPdg4rZIPL
         10Z9XVrOliI6un+BbIP7gspZhGnGuRY0kcGsd07lJPYGyX6WMLLccnthk7jULUjLfLkK
         gq/Bz1FHBEwpW0vIKsQktzhsCw71t+m9MNGJ0ycz8Y1eXFdoWV/YmBu2Eb8B2Pv3KSJX
         BIgvEE6X00hwZ8ZW5ire2X3qSckCBt9ac8uRpB283BjF4NBhAula8uGNGq3wdRBiFKI3
         scKH8Bmsz61VfJy5nuE+BEfYGyJvdnSYM3iIOv0QWWC02BwUhKC+G60YS2W6ndUvn5/r
         mmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726557934; x=1727162734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65taDXGYJvoQR7ZX9bcjdcEeKfQ/XK8T31XZzveD3cs=;
        b=XhSGm0F2s5esY0+zCwTPMN9W9YcYd9JErOHwOCBaivWlznmQhoW5dCWxoWFCNKbDkC
         8D1ygCn2JufRRNsa6Z8NLf6GHOswQUGcf/xQgBvva5O66OjhzXDmiQ0ERp3U1H7J47SI
         1K5DxWqJWWi06wVKlxugBecmoSg4YifFsVMtGNhS9/glYxSOvw9KE5DhiHQsJt5lwHF/
         ATFnTiCEtxfYXU6mmKEGEaVvG03ASyP1wmRb7x9KlNxF4RHfYTH1QIsZVguF7onz7fb/
         QwYt1RVA905nIHttXv2pZwo0WFOLYncsHZp4Pjz+EaGBkWs5dKJPw5hZ1//jPOWgszAp
         j0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOkImJZDzsYF9ke5axbsDBunlqBRxeUxgVzuiEHrQkfnp67S/V9nO/K7v3uuGBjw3/7oK9Pn2gv7HE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywttm5AJApvj3sHBh+t3sjcwneaQrTfADfG1oBhxqWJ9eqLzOlb
	P/vlbwM88LvhgtE1BFTYxaRHzbKsdOfRR5caujKKjuDHS0KlycFOEo6MjDFAyX0=
X-Google-Smtp-Source: AGHT+IHQpFCTUkCw36WEI0kVSJP18ShUuagXXkc4qen2q05uioc7kdKMuRA3BV4gAjP6XAzriGdlpw==
X-Received: by 2002:ac2:5685:0:b0:534:543e:1895 with SMTP id 2adb3069b0e04-53678fe64ebmr9788486e87.39.1726557933816;
        Tue, 17 Sep 2024 00:25:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704db0bsm1116026e87.114.2024.09.17.00.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 00:25:33 -0700 (PDT)
Date: Tue, 17 Sep 2024 10:25:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, neil.armstrong@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH 7/8] arm64: dts: qcom: add IPQ5424 SoC and rdp466 board
 support
Message-ID: <g5fcdu4gyolk5g3qcgvitrzrmabw2uv5vumlhxlgmrk2bd2rl5@bn7htykazo2x>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-8-quic_srichara@quicinc.com>
 <fyoh72in62sfmsw3syqswr2p3pcv26zoce2tvlx53mu4lpoakx@ixyvy4oylms3>
 <ed57cffb-147f-4f5b-a9a3-6b9048b4756b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed57cffb-147f-4f5b-a9a3-6b9048b4756b@quicinc.com>

On Tue, Sep 17, 2024 at 11:58:29AM GMT, Sricharan Ramabadhran wrote:
> 
> 
> On 9/13/2024 6:22 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 13, 2024 at 05:42:49PM GMT, Sricharan R wrote:
> > > From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > > 
> > > Add initial device tree support for the Qualcomm IPQ5424 SoC and
> > > rdp466 board.
> > > 
> > > Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile           |   1 +
> > >   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  63 +++++
> > >   arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 294 ++++++++++++++++++++
> > >   3 files changed, 358 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > >   create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > index 197ab325c0b9..46c4eb758799 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp474.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= ipq5424-rdp466.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > > new file mode 100644
> > > index 000000000000..c8597a9ba175
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts

> > > +		intc: interrupt-controller@f200000 {
> > > +			compatible = "arm,gic-v3";
> > > +			reg = <0 0xf200000 0 0x10000>, /* GICD */
> > > +			      <0 0xf240000 0 0x80000>; /* GICR * 4 regions */
> > > +			#interrupt-cells = <0x3>;
> > > +			interrupt-controller;
> > > +			#redistributor-regions = <1>;
> > > +			redistributor-stride = <0x0 0x20000>;
> > > +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > > +			mbi-ranges = <672 128>;
> > > +			msi-controller;
> > 
> > No ITS?
>  ITS/LPI is not supported.

Ack

-- 
With best wishes
Dmitry

