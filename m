Return-Path: <linux-gpio+bounces-16516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA35AA42A0E
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 18:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F38B1889BA8
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 17:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A55263F41;
	Mon, 24 Feb 2025 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sze/6fdQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80982155342;
	Mon, 24 Feb 2025 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740418658; cv=none; b=UDGyINPT7KfH4CaYvkf6UBMB5xMCqwchw1YAngeyGH5lVqla6tY19JNJ/33M0Vf4ShtC1z3qnUTHH7BHwX2rEcWsfsFTIeDGJw/Iuqx3nl/uZoSUfF++2N8lemo0NLqtSemgn/gPP+LOp4o9DhIdafvF8ZUUQX7cgEpsLCSBi6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740418658; c=relaxed/simple;
	bh=pVP6oSh37lwNecWx7K2k2tpwE4ZYLxObmjX1W2oGxWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ck+m/s8WccS0U8mLmJejtKj5uPHCAaeWLrmHLQYVMPfJjjRToswIv/n6Rsm9+sqbtjixYRDpV0DNFkYGSZa8mm98pjjJTrIYrty7gBEziI1r9w9rP1fvJ0dBFHm0ZYrIsLPWLyLiADNbXa+H0sPcitohwzqCPDXiUmtVrJOwvE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sze/6fdQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8986C4CED6;
	Mon, 24 Feb 2025 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740418657;
	bh=pVP6oSh37lwNecWx7K2k2tpwE4ZYLxObmjX1W2oGxWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sze/6fdQaK0PlMPWzvgHJPIrUCQ495IMk+EWPQ3KlErm4UcrdtM1WmS8PRIUHnRKD
	 bs5xju+htMMxr3IYtafwD1Do7fnECEObHlfFC6p/xgcvMiVxXcpbS9UM+FWDrCNzN5
	 A9Uiu9rqYF7XfgsjjdEYxA+UwLLGit8IJtzLzZBLhSL7p7yjiVZDHQDAt9JT7W6NJl
	 rYHqVmw8U/l0stw1Cf98pf0KJTlUMLM5JRjlFWzp73rYFY4j6HPwu5SxmHl6O8XUBU
	 /vS2yh13PpJ5laUJlSj4ElJlJM44kF7zQjE+orV60J+e/oJZIpmDNckX8Yq0xErqMt
	 uIpAS+mw2OIeg==
Date: Mon, 24 Feb 2025 11:37:36 -0600
From: Rob Herring <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: Add bindings for BCM21664
 pin controller
Message-ID: <20250224173736.GA3566877-robh@kernel.org>
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
 <20250221-bcm21664-pinctrl-v2-1-7d1f0279fe16@gmail.com>
 <2b3059be-2a82-44c9-9bf3-d1c98f66b0e8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b3059be-2a82-44c9-9bf3-d1c98f66b0e8@gmail.com>

On Fri, Feb 21, 2025 at 09:37:48PM +0100, Artur Weber wrote:
> On 21.02.2025 21:32, Artur Weber wrote:
> > Add device tree bindings for the pin controller included in the
> > BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
> > both chips use the same driver, but have different pins, and the
> > BCM21664 has 6 alt modes instead of 4.
> > 
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> > ---
> > (...)
> > +examples:
> > +  - |
> > +    pinctrl@35004800 {
> > +      compatible = "brcm,bcm21664-pinctrl";
> > +      reg = <0x35004800 0x7f0>;
> > +
> > +      dev-a-active-pins {
> > +        /* group node defining 1 standard pin */
> > +        std-grp0 {
> > +          pins = "gpio00";
> > +          function = "alt1";
> > +          input-schmitt-enable;
> > +          bias-disable;
> > +          slew-rate = <1>;
> > +          drive-strength = <4>;
> > +        };
> > +
> > +        /* group node defining 2 I2C pins */
> > +        i2c-grp0 {
> > +          pins = "bsc1clk", "bsc1dat";
> > +          function = "alt2";
> > +          bias-pull-up = <720>;
> > +          input-enable;
> 
> bias-pull-up should not have a value (pull up strength is not
> supported). Will fix this in the next version.

Please make the schema enforce that, not just fix the example.

Rob

