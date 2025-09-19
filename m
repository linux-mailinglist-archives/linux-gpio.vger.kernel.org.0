Return-Path: <linux-gpio+bounces-26366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6322B889E1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 11:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D3D516CFC5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 09:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883A62F746C;
	Fri, 19 Sep 2025 09:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ichDk/R6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFDE2D0274
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274904; cv=none; b=fKepsRWC8Y3ZB3etghjFZaGjEsCaBt+dIFIAobQ0o4WBKsllmbrcnSbygTEOMGC+nDyJCzX5ztra2RQX/jePnhryMEeh7w3fGGy9lxp3ZRb+0GQ8yodOlww3fkE9mULwTGN6HR04/UpoBWnzf73s2lSXADJyEzPpGd8WJdkAHb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274904; c=relaxed/simple;
	bh=0bPvuzitzyiTscSi5P7Y9W8jGQf2+I4dm6kZHg49IV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkzZAyePuu7aWxnlIoc+iJKSgwnWLAMlVe0g19qRerv/rAhrdYOq7UVgZPifvsBat4Z6SJEtn6QkfqgPU8ETI1wWssSI3aq8AB17XuMeLeiMneH1BRZ5uKs+2wr8ww4pqRDKMiNxLUKnJgaHlgXx4yNT0o6AlOwvJ9wsfaPzVd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ichDk/R6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HmKy
	wT+0oLACFox0+DX6qQcmQkOKx7tGHsVxWJnODwU=; b=ichDk/R6+aeAn9tyInWx
	r/hqUAgRu7mC6t9e4LFCNVf9V3/iHReBfHHnLC3jht31k5xN0+9TxWkOsoumY/DY
	CyYQTsH+uM7At1R7KObUQ9TZyrHWgwbzMo7ehdbYgVsy4E7W7wSqdRry34UEC6Ba
	+TlUmzzY34c2midmIirbg9FFAzVxxnjlDcTvX8x2Ijvhz3bECsinfG8o7YGDfIrf
	/ws/XIlr7mOVLv+W7PFyN5vHysOIG4YmphAxzTIvez9ldrAWhyGcfDr3UKEhidSI
	2rFkAfv+aKWrGZwNAZsRYpSV5H/bk+32oLlTQwqrWEjqy78+tuwiiNfmc3MsBMT2
	1g==
Received: (qmail 3865078 invoked from network); 19 Sep 2025 11:41:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 11:41:39 +0200
X-UD-Smtp-Session: l3s3148p1@IuTPRiQ/EJgujns7
Date: Fri, 19 Sep 2025 11:41:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <aM0lU01x1w2wB3LG@ninjato>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-8-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vTZBuV/2VLZPNxkP"
Content-Disposition: inline
In-Reply-To: <20250918104009.94754-8-herve.codina@bootlin.com>


--vTZBuV/2VLZPNxkP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Herve,

> +#define IRQMUX_MAX_IRQS 8
> +
> +static int irqmux_setup(struct device *dev, struct device_node *np, u32 __iomem *regs)

The whole driver would benefit from a 'rzn1_irqmux' instead of 'irqmux'
prefix, I'd say.

> +	for_each_of_imap_item(&imap_parser, &imap_item) {
> +		/*
> +		 * The child #address-cells is 0 (already checked). The first
> +		 * value in imap item is the src hwirq.
> +		 *
> +		 * imap items matches 1:1 the interrupt lines that could
> +		 * be configured by registers (same order, same number).
> +		 * Configure the related register with the src hwirq retrieved
> +		 * from the interrupt-map.
> +		 */

I haven't looked into the above for_each_of_imap_item-helper. But
wouldn't it be possibleto retrieve the GIC_SPI number as well and use
the correct register based on that? That would remove the need of an
already sorted interrupt-map.

> +		if (index > IRQMUX_MAX_IRQS) {
> +			of_node_put(imap_item.parent_args.np);
> +			dev_err(dev, "too much items in interrupt-map\n");
> +			return -EINVAL;

-E2BIG? With such a unique errno, we could even drop the dev_err.

> +		}
> +
> +		writel(imap_item.child_imap[0], regs + index);
> +		index++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int irqmux_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	u32 __iomem *regs;
> +	int nr_irqs;
> +	int ret;
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	nr_irqs = of_irq_count(np);
> +	if (nr_irqs < 0)
> +		return nr_irqs;
> +
> +	if (nr_irqs > IRQMUX_MAX_IRQS) {
> +		dev_err(dev, "too many output interrupts\n");
> +		return -ENOENT;

-E2BIG? Wait, isn't this the same check twice?

Thanks for this work,

   Wolfram


--vTZBuV/2VLZPNxkP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjNJVMACgkQFA3kzBSg
KbYNbxAApm081D7CgT8raavwb9/q2h+RL2zfI55DFFq1PDoRNvKb7m2OLzc4+iI+
N39meDXwA3EfWm6MkY1uxdhf38oH07RULjwbRnzjBKVjtb7zlbGsk0jQyUk/qEjE
fbqkhl47EvWiqegz/n64WGzDfaWaanO6JbyzQqQtUxxD4T4HnfYSUc/nWMATZkG5
A/M5ZkCE5C5yr2iYGSLy2svvitBfgFeY1+bed4wotijdTyYOxzV38gthMmXSQhEp
+XCt+TRkZcqmnA8rLgI2DNVSt15Rdb2AEbTf8pQShDrx9Za4LH2KEfLzLh5Ii3MQ
fZscQN4dLclDkmvCF1eQFbVpiz4U9LKEa0pkCVyxd9+eD22FhZj6nB3nGgqIksGP
AOKG1tdztTtLuxnah6y9TztJshEmgnqd7ojUUs+cpnjG6TyTjlH+27kDYEeKZpmD
t9F1yKkU897taYcPXDHPjoJ5CDhywdy8OUEtwDe9/PtLLioyYvtQ95tHe7+fVKEL
XTZjTTWFdBwg9kBl5NTc1Z0Pta6tSXfM5jwEyA8Uxl74VHmzyWLDvElSQx4zzzB6
9h5gBqjPQL5qpi40HiKwFhvs250iIsv85UrN01XrQsOGJ0jIXQ5/BFYzFo8gVeEU
k/oT6kz3gdRAhgguNHCUinduOxwvxpLka46yozY8ZhqyuI+1Eho=
=qdB/
-----END PGP SIGNATURE-----

--vTZBuV/2VLZPNxkP--

