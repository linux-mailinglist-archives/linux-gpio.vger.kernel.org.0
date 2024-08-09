Return-Path: <linux-gpio+bounces-8694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D330294D5A4
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 19:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 947BF2819D5
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 17:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B4613775E;
	Fri,  9 Aug 2024 17:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="J202LTRA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E9B17557;
	Fri,  9 Aug 2024 17:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723225935; cv=pass; b=Laqsn1o9jNGIRBBzUFYIHmIJiJ/+N14TQECfOL5T4gWYz3pPGomxj6HivFknpXIvSwpLnsXdX3g1TpnR6uUg7+o5rFqelQngkrHIXicTT4fRV439RYt94utQQPWbsMiyTY4XiLPuYKPCIcH6GMBW8AFfD6cHreOmwCIdAGps90k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723225935; c=relaxed/simple;
	bh=XLk8QV2h25tpkRf7tqF0QdkUpiBTzGtozwcq58yZFg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dSKZmm01DvjF9dkwALl9UUy71C1He3qfci47EdS6fXZSwy/rQ13dngt2ef/ECAik3h/UCuxsxEDuqbSiz6GydPXfLZMrLfRu/CHH2DUD8FsqTfy2Zonbxemx2zTA352jlAyNzSuOXoFqJyLrs5Yx95qkq4AGUuVjRa658RrfjO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=J202LTRA; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723225918; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S+A9AILRdKvrlCGFSy00odNQG9O2FFEPDfwA4EBO4Iolg6H++cqpyDiDT4ZqftB3s4fNU0ZCdTf8jE8wKIpEOmHdieEqTVGrjq8GJpXQVkPuvXlX5/TruuLKW9zbst4QmvIPoCVKrGV3J1oe6mDIgHKNpplOjQpdGFPr1mxPpu4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723225918; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1ql2EfSTUecIUIaUErNOW0M2LCtEFtewoUZd3lUg5SE=; 
	b=JkDNR4/Cq/ztLtHH/aHRuodAtw5XtbKrUvLmkZndhAEzvmSnK5NoDlcfLixq3RdP65WtShzm1u1VBIEDvK2sAuZmA47W4Bi5XI4eS/52ccYSVrTgjtrWjQprFID/cqE9Ury2IJkR4WleOtymck5VubsLgaBsni3Lenv6VslU+vk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723225918;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=1ql2EfSTUecIUIaUErNOW0M2LCtEFtewoUZd3lUg5SE=;
	b=J202LTRAanUypzJNuBchc173ecIXUZaNwBMvzG7CAEIPJFFCPdosOgURloAmgIdx
	NbXE+CEf0Shy7ced7eK9xAqgxhbhRJV/H8dt7Ay4rOnRrkBuXRXw54oXS1USyqUR9mw
	2Ib47arDAZI4JgtkF0kPtxA0sYDO4a7RrcHR2C2I=
Received: by mx.zohomail.com with SMTPS id 1723225916646903.4101544239923;
	Fri, 9 Aug 2024 10:51:56 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add rk3576 pinctrl bindings
Date: Fri, 09 Aug 2024 13:53:16 -0400
Message-ID: <22382840.EfDdHjke4D@trenzalore>
In-Reply-To: <20240809-dexterity-attention-8376b3b16d59@spud>
References:
 <20240808164132.81306-1-detlev.casanova@collabora.com>
 <20240808164132.81306-2-detlev.casanova@collabora.com>
 <20240809-dexterity-attention-8376b3b16d59@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

On Friday, 9 August 2024 10:58:38 EDT Conor Dooley wrote:
> On Thu, Aug 08, 2024 at 12:39:55PM -0400, Detlev Casanova wrote:
> > Add the compatible string as well as the optional rockchip,sys-grf field.
> 
> Optional for all rockchip devices supported by this binding, or just the
> one you're adding?

It is only optionally used by rk3576. I can add it in an 'if:', or update the 
description with somthing like "It is used on rk3576 for i3c software 
controlled weak pull-up"

> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > 
> >  .../devicetree/bindings/pinctrl/rockchip,pinctrl.yaml      | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> > b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml index
> > 20e806dce1ecb..cd527ccc9e6bf 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> > 
> > @@ -45,6 +45,7 @@ properties:
> >        - rockchip,rk3368-pinctrl
> >        - rockchip,rk3399-pinctrl
> >        - rockchip,rk3568-pinctrl
> > 
> > +      - rockchip,rk3576-pinctrl
> > 
> >        - rockchip,rk3588-pinctrl
> >        - rockchip,rv1108-pinctrl
> >        - rockchip,rv1126-pinctrl
> > 
> > @@ -54,6 +55,12 @@ properties:
> >      description:
> >        The phandle of the syscon node for the GRF registers.
> > 
> > +  rockchip,sys-grf:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      The phandle of the syscon node for the SYS GRF registers.
> > +      It is used for i3c software controlled weak pull-up.
> > +
> > 
> >    rockchip,pmu:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description:





