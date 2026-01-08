Return-Path: <linux-gpio+bounces-30242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE18D0133D
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 07:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39AAF302C8FD
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 06:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00617318EFB;
	Thu,  8 Jan 2026 06:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="vKxWQBP0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFA72641D8;
	Thu,  8 Jan 2026 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.67.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852422; cv=none; b=BfqzfQxCR3gzIouNJmAzJAr9RyrrgeJVjzUutAJz9Y8ml114BazrwIWUJDpY3y9MinaaO1/o+991KZCwCKxMwBRgFFgrADQfvS33eKbG4mJ4GjAE/k6IwFmp8qp4NVt+Xy86S/AMuWK1vEC4+9gPkG2SR3MlcBtpttLUTufHvUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852422; c=relaxed/simple;
	bh=fsrnb+Y4r81Veda1qwY1ytq+j3LmXnLMJwOLdwU1sWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgJsQIZo/E/8hCb0mcl/DgtP5k/Yoh2eOa784EzmKgC51JK++RbyliO5YzhjO0lueFp3Uoh7ydCrzE+DyFwgcsKz4z7IT4ku+x6sNVIvObFDTXqDIouV8H0vXRGbaOTq78e0jhv+xk+VA6VHrRUGiYgpGkf3D7el15iBG8N8vZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=vKxWQBP0; arc=none smtp.client-ip=114.132.67.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767852370;
	bh=j0RQPNNJah66+rfz5mRIL/zR77AlQ7tUXDwKwV5J7t8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=vKxWQBP0nZhb82Z1SoTqY3j0ocfBnhZndtL2O+hfjv75fAwIaqcdBQ9Y5GC8pxw3w
	 LHkWTP/vh09WDOLbYVq+VuaeVumFbi9Sln5GRf03IHnfJrNfa953oVg3WvK3eB0vjq
	 mW9n6/oSjsIztl3nnQSNFlpuFYb4sGHV+jYdEOas=
X-QQ-mid: zesmtpgz4t1767852369tcd8001f2
X-QQ-Originating-IP: beWczbJwO/mTqfpOHrU+Qy/PUKSpkmuOz7CV2yJE0rM=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:06:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9103380488815538489
EX-QQ-RecipientCnt: 16
Date: Thu, 8 Jan 2026 14:06:07 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <2D1901252926D8F1+aV9JT8p0rON5RNc_@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <20251227-pastel-certain-orca-4b53cf@quoll>
 <20260108042753-GYA2796@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108042753-GYA2796@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NgbPj60qx8q1bjuxTEeAERR7k3tRz1wd46JBJAsBulCSVPZedRL7WOHm
	5eoPazxdnZNaDn9d6aoeWb3LfE/K2ZuhPzMYAFRVRl3BdABLvx5wO50Dz20jg7YBXz68ENn
	iRGVl5Ob7xU5nDWLzia9TupN8PNnQeC7wc5Dvx97qmyOe3YtlIIcGza/te//ehmswJHGx4x
	J+rrlO6bB1QOnzC94iEnbLBzqs3UuC1nMDpyIS+5+m8y9xCqS/bxme3HoQu4IU4nsDy697f
	Lbsa4aZkotxjZNcdBpUFr2eqKs6BQOztGEGyyBtiRWHBs5xQY5Nj8J4Rc0BFZnk81GGYnwJ
	PdSITqEuv4cqqdfwgZK4a39KsvHSlIh72+psTdAsGBYQl/ovch/l1wwyMMYMgkTIcsyFyDg
	GS+AO+A8/nxzSdR1q0aBuJ9hBYUVzejkBgtXSE4Mw4luDbzgZjdEROb0JQlihBCnBPESspR
	kN7e2Yk3h/5DhRx9PN7dbJx862ntTUnByq7RcQsJ0B8m2K02uOdGlnUekYfchy7UwyW55d/
	ukVmJ6PkuVStVfuUBjktRVUJ5xh7LBjl/VX/ECrdE/smLRc/DUDqr4JeWn29/8bc9O0JLVN
	mlV42jnr8cPMA0pJdQ3oUEZtvzXRV1gHh59+LLhuo3QFGImnL84/YWxfv3O97SEATDaHuRC
	w0P7X77zwzj8BZaT6dVjuFHrMZlKMcEBXp61Y0+b4iWYUpt0Fl88v96jzsbILVfURAAzKuB
	7lgnxfTTciKtg3CEcXzoE1jprAscV4m6mlSM55HQnM/eqO0oWrwdFsbPT3pNiMi/xrx9XY0
	Xuz1dOD0/FgymaAevIDfin2esZVQh+72LWNJgIkpKDK/eQ3IbLwpWeKer2fmgL9B5MwzPjC
	C56lGIRndAco5ugdvS5j76pZCANmpDGPRCK7iUGqIIagxLLnVb4DEVm2qzDDU5AhhaPvQMq
	G8ODgKBrgQHqY4EsPdj3aFaHQWiGG6PCdeedmVXLH84hFGWjGQK2ceELfrLfE2eZ7HBB6ec
	kSzh/DgBJRMrb0Gfx2/U5wE85CTlNMcLXKLd2Kg50yaTFt1IJujNzsw3G2xTSJcyddgOP3F
	tXH1drmq5i/jcOpSoCnk4+m9zDwALF7V6DQsn50fA4cMXvbPdDp8+3JFWoV5npRL4wAuOpz
	hqeHO955dnG8hePPW/4jrS20OA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On Thu, Jan 08, 2026 at 12:27:53PM +0800, Yixun Lan wrote:
> Hi Troy, Krzysztof, 
> 
> On 14:00 Sat 27 Dec     , Krzysztof Kozlowski wrote:
> > On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> > > IO domain power control registers are used to configure the operating
> > > voltage of dual-voltage GPIO banks. By default, these registers are
> > > configured for 3.3V operation. As a result, even when a GPIO bank is
> > > externally supplied with 1.8V, the internal logic continues to
> > > operate in the 3.3V domain, which may lead to functional failures.
> > > 
> ..
> > > +	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
> > > +	if (IS_ERR(pctrl->io_pd_reg))
> > > +		return PTR_ERR(pctrl->io_pd_reg);
> > > +
> > > +	pctrl->regmap_apbc =
> > > +		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
> > > +						     &pctrl->regmap_apbc_offset);
> > > +
> > > +	if (IS_ERR(pctrl->regmap_apbc))
> > > +		return dev_err_probe(dev, PTR_ERR(pctrl->regmap_apbc),
> > > +				     "failed to get syscon\n");
> > 
> > Actual ABI break.
> > 
> Indeed, there will be a ABI break.
> 
> so, how about not abort in probe() if no "spacemit,apbc" phandle found?
> and then do it in a compatible way as old behevior
will in the next version.
> 
> We may still need to drop this property from "required" section in DT
Yes. Thanks!

                          - Troy
> 
> > Best regards,
> > Krzysztof
> > 
> > 
> 
> -- 
> Yixun Lan (dlan)
> 

