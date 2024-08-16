Return-Path: <linux-gpio+bounces-8776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1009A955387
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Aug 2024 00:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B90571F21FB9
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 22:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA032145A1B;
	Fri, 16 Aug 2024 22:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGbZuz/Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557813C80F;
	Fri, 16 Aug 2024 22:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723848778; cv=none; b=YgcyVtaUU+BSvqPlNncggYPYXWBV6g8leoRLf3V2OtbAkF1zs/AHzfiHzwVk3Skcnc21kieQ4HKGSATu8AEws4rIshbbnl+zU7BXpzFCAh9P8Oajm6/u7o9w6fOQFgQHvltkrXwwRf4gHjHIUHnZ67HN9ahPWHMDn53GOhEGJ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723848778; c=relaxed/simple;
	bh=8DDeC1Xe7fCa3QZwCHDRLsEPNaCzKydJaYmyPNmvTCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSh7LA9UVEVOGPp3xGfyXWZ/edzen9iLV/Ci+WgDwmJL+DwiRPxx7z2MiSM9oLWgu2cEIs6hcgthaqKWfRvJHNgfrK+UutozyHMLUy53EyrgAflAXmxIh4+UuB0Ud4+kxALoJe8w3fvJ8WWLlfmX+FfliYpqAHzV9bL+PM8wlJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGbZuz/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7BCC32782;
	Fri, 16 Aug 2024 22:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723848777;
	bh=8DDeC1Xe7fCa3QZwCHDRLsEPNaCzKydJaYmyPNmvTCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGbZuz/YjNrLSltqIoaEoV1mBiKn9M1Dw8zMz1Xvme5i6npcryIJQVZw6CtogXpm9
	 jOMy77y6DWB9SKRozIpKqWWAICb5e7QR2cQQmyv8MOBiNrKj+Ka1yhLMa8+kVXnRsf
	 A/c+i+84JCeDGMuX8CWvJSanoWCsEQISjZ9v0rTE4lnagXMD04qFNmlRYDXq2f0Lw8
	 7RlxKGwZ/Y4u2Do5f55+fd+9xCyzEtUDmzyu5DjB4A6xnKVBVGQWSXMJop2eHJHneY
	 EXcjlogrCnGedNqSrwpC7oAEy8h778MSkQjx7rBjFl2+jQ7qn7+Em5Uc6TjY2u+oTd
	 EGuynJmfAQRdQ==
Date: Fri, 16 Aug 2024 16:52:57 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <20240816225257.GA2411475-robh@kernel.org>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>

On Tue, Aug 13, 2024 at 10:06:41AM +0200, Benjamin Larsson wrote:
> On 2024-08-12 08:48, Krzysztof Kozlowski wrote:
> > > +      pio: pinctrl@1fa20214 {
> > > +        compatible = "airoha,en7581-pinctrl";
> > > +        reg = <0x0 0x1fa20214 0x0 0x30>,
> > > +              <0x0 0x1fa2027c 0x0 0x8>,
> > > +              <0x0 0x1fbf0234 0x0 0x4>,
> > > +              <0x0 0x1fbf0268 0x0 0x4>,
> > > +              <0x0 0x1fa2001c 0x0 0x50>,
> > > +              <0x0 0x1fa2018c 0x0 0x4>,
> > > +              <0x0 0x1fbf0204 0x0 0x4>,
> > > +              <0x0 0x1fbf0270 0x0 0x4>,
> > > +              <0x0 0x1fbf0200 0x0 0x4>,
> > > +              <0x0 0x1fbf0220 0x0 0x4>,
> > > +              <0x0 0x1fbf0260 0x0 0x4>,
> > > +              <0x0 0x1fbf0264 0x0 0x4>,
> > > +              <0x0 0x1fbf0214 0x0 0x4>,
> > > +              <0x0 0x1fbf0278 0x0 0x4>,
> > > +              <0x0 0x1fbf0208 0x0 0x4>,
> > > +              <0x0 0x1fbf027c 0x0 0x4>,
> > > +              <0x0 0x1fbf0210 0x0 0x4>,
> > > +              <0x0 0x1fbf028c 0x0 0x4>,
> > > +              <0x0 0x1fbf0290 0x0 0x4>,
> > > +              <0x0 0x1fbf0294 0x0 0x4>,
> > > +              <0x0 0x1fbf020c 0x0 0x4>,
> > > +              <0x0 0x1fbf0280 0x0 0x4>,
> > > +              <0x0 0x1fbf0284 0x0 0x4>,
> > > +              <0x0 0x1fbf0288 0x0 0x4>;
> > Why are you mapping individual registers? At least half of these are
> > continuous.
> 
> Hi, this is by design because of the register placement in the gpio block
> and the fact that the pwm functionality is intermixed in there also. As
> example the following registers are all GPIOCTRL:
> 
> <0x0 0x1fbf0200 0x0 0x4>,
> <0x0 0x1fbf0220 0x0 0x4>,
> <0x0 0x1fbf0260 0x0 0x4>,
> <0x0 0x1fbf0264 0x0 0x4>,
> 
> To simplify the driver code logic the complexity is moved to the dts because
> of that.

DT to OS is an ABI. Don't put the complexity there. The driver is easy 
to change.

Lot's of h/w blocks are just bit soup. This is not special. If a few 
regions is helpful, then that would be fine.

Rob

