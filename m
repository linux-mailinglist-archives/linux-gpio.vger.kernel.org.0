Return-Path: <linux-gpio+bounces-7559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C790DC08
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 20:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CD18B21C02
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 18:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC7A15ECEC;
	Tue, 18 Jun 2024 18:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UztlCJuZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B0A14BF92;
	Tue, 18 Jun 2024 18:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718737041; cv=none; b=bUpUKAUVAACuK5Q0v7NOIUMmQSzOvcQZEDFrLPKO+LLwnCmCfqGaWNPwLei3kZEksG59v18DRSjrnCNPWC4a+X4jMQKVQNEzGOnWCEpdlQa//MFozPBFMgthVrQ6QJNRl0cXZF0CVscllb3Gazi7ON0cBj9mbMz3R7x+5VtYp14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718737041; c=relaxed/simple;
	bh=c+/c9FLDJnL3Ta+QVzbWgUNS2/GAvTls4vNC6buevl0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOrCN6jrtVpEhrwswLAVBP+uBP7iuz7QoJz8oQAkOkfVDvs+kz2ZQSJuiOzV9d9ISeoiAkPTawk3Ii4NWoevqcURyvHjmqhw5GUjLMLFdhgibNQVRxzBuh2DyfBicJpjrQUPm7JuPXBRniLZOF8CEZ7/rG8IMOVYf2Df40MlzdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UztlCJuZ; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45IIv5gn023119;
	Tue, 18 Jun 2024 13:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718737025;
	bh=JhzGH4hdp0MF05nChSMa0dk6h+PwXRQQ1wDR6XavthA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UztlCJuZiFG54Ui/IsUuWw85U0mxDBXLCXb4eAdHCzxDTefu9dQvkcl6vXDAz29kQ
	 Gb+6F3Abj+oaofQBcADQ0hPF7hl6MKHNCWS7aXbwDN88ddDMn1C0tWOIXxs5t8Tm5u
	 yCjpEihHAUaUh11+iC4L5faZo0YBY5ir4ek5Sj/8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45IIv5lJ096388
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 13:57:05 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 13:57:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 13:57:04 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45IIv5L4083546;
	Tue, 18 Jun 2024 13:57:05 -0500
Date: Tue, 18 Jun 2024 13:57:05 -0500
From: Nishanth Menon <nm@ti.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: pinctrl-single: Define a max count
 for "pinctrl-single,gpio-range"
Message-ID: <20240618185705.5fwevm7drphgvwl2@dilation>
References: <20240618165102.2380159-1-nm@ti.com>
 <171873566448.3500109.16734660300499772836.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171873566448.3500109.16734660300499772836.robh@kernel.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 12:34-20240618, Rob Herring wrote:
> 
> On Tue, 18 Jun 2024 11:51:02 -0500, Nishanth Menon wrote:
> > "pinctrl-single,gpio-range" allows us to define a dis-contiguous
> > range of pinctrl registers that can have different mux settings for
> > GPIO mode of operation. However, the maxItems seem to be set to 1 in
> > processed schema for some reason. This is incorrect. For example:
> > arch/arm64/boot/dts/hisilicon/hi6220.dtsi and others have more than
> > one dis-contiguous range.
> > 
> > Arbitrarily define a max 100 count to override the defaults.
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> > I am not sure if I should call this RFC or not.. and if this is even the
> > right solution.. I am on 2024.05 dt-schema for this check.
> > 
> > I noticed this when adding gpio-ranges for am62p platform:
> > https://gist.github.com/nmenon/7019cd2f24be47997640df5db60a7544
> > 
> > It is possible that this is a bug in dt-schema, but I have'nt been able
> > to track it down either.
> > 
> > behavior seen is the following:
> > pinctrl-single,gpio-range = <&mcu_pmx_range 0 21 7>;
> > generates no warning
> > However,
> > pinctrl-single,gpio-range = <&mcu_pmx_range 0 21 7>, <&mcu_pmx_range 32 2 7>;
> > 
> > generates "is too long" warning.
> > 
> > 
> >  Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml: properties:pinctrl-single,gpio-range: {'description': 'Optional list of pin base, nr pins & gpio function', '$ref': '/schemas/types.yaml#/definitions/phandle-array', 'maxItems': 100, 'items': [{'items': [{'description': 'phandle of a gpio-range node'}, {'description': 'pin base'}, {'description': 'number of pins'}, {'description': 'gpio function'}]}]} should not be valid under {'required': ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

yes, I had expected the same, but processed schema indicates a maxItems
of 1 for reasons I am unable to make sense of.. will be great to have
some additional eyes:

https://gist.github.com/nmenon/7019cd2f24be47997640df5db60a7544#file-processed-schema-pinctrl

next-20240617 baseline
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

