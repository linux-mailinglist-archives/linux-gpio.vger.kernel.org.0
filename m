Return-Path: <linux-gpio+bounces-34500-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gImdA1sOzGnGNgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34500-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 20:11:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8C036FC4B
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 20:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9A0F30055D6
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 17:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDF0426EA0;
	Tue, 31 Mar 2026 17:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nea39aaH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D195D33B6E3
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979795; cv=none; b=p+t006xLHTTl7o5w+Lx8CB3PlBZQQJo38Zub+CJlUE3RkyVqTzNhrN80TJrw664/xflFyJ4ZFvKS9GVirmDn0bO18aZJExB2YH9VPKzNC1WQrgfYxt635gosBr9qh3oFI7wpd6NopmGFjRCYuviXNAWsJFzM3Daxgx411k14fJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979795; c=relaxed/simple;
	bh=ZeC2HlwelJcokZ0V5JNDOhWhGNfGePiPOX9Cu4azRas=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 MIME-Version:Date; b=qkp4sM3o+jrQoE6tpIX790bOuVRwmjkzD7vegfr2tSULit8EJbFgrCwtlM3bzDbfkvFvJ84QHNVhH7GhMzciNDyUl+YxQfBKFlX4KJ32ublVrXYwXcVRRYW8/Zfd5uQQQtxjgRBwNARYlPwgswz4+42mc3VfCMe8TjDPJm4Z/BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nea39aaH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774979791; x=1806515791;
  h=message-id:subject:from:to:cc:in-reply-to:references:
   content-transfer-encoding:mime-version:date;
  bh=ZeC2HlwelJcokZ0V5JNDOhWhGNfGePiPOX9Cu4azRas=;
  b=nea39aaHaZ742Gi0XfwzDS4fcfBice9YPz22bKUXpyFX3FDWCOII1Nk3
   P4GRUD8aml29CGwZXk5qpI671XFSZF0H1eQSXyTDtHstsMaKlpXG5ZmrX
   mFHhGy85tSpSOdXSnjyrvgIGjPz8uzCACkfynuHZsjh7BhpkPHuYVNcPq
   4st0iqtEpiF6ED6Dqgf13K08ExIID7Fn5QJQLsBW3Mq8TP7qHfbi9n45w
   Z1q2fLi3Iiog3LuaSVZOKIK3y+JuzYn7F+5ukGfvDkPKMXZuO5G6V4Pf1
   e9iU+S8lABVocfoik0+llY7zgi9oAvXU2ALIzW9cNghN9RUkYn/q9vZ2O
   Q==;
X-CSE-ConnectionGUID: RJ8GeEMtSsOhPWp9Ug4gjQ==
X-CSE-MsgGUID: wP6JCfMHQ4yDlIBRrSbzgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86701152"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="86701152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:56:30 -0700
X-CSE-ConnectionGUID: RGQlFkmAT46VOoXNtXjUSA==
X-CSE-MsgGUID: TKy1jjs/SN237u6QbUqbzQ==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com ([10.245.246.108])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:56:28 -0700
Message-ID: <9bfcb2462dec32be58573ad956e7a90c2093973c.camel@linux.intel.com>
Subject: Re: [PATCH] gpio: Add Intel Nova Lake ACPI GPIO events driver
From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, brgl@kernel.org, 
	mika.westerberg@linux.intel.com
In-Reply-To: <abq4i4Kt0azQcYtq@ashevche-desk.local>
References: <20260318142418.48574-1-alan.borzeszkowski@linux.intel.com>
	 <abq4i4Kt0azQcYtq@ashevche-desk.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 31 Mar 2026 19:53:00 +0200
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34500-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alan.borzeszkowski@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 1A8C036FC4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy,

On Wed, 2026-03-18 at 16:36 +0200, Andy Shevchenko wrote:
> On Wed, Mar 18, 2026 at 03:24:18PM +0100, Alan Borzeszkowski wrote:
> > This driver provides support for new way of handling platform
> > events,
> > through the use of GPIO-signaled ACPI events. This mechanism is
> > used on
> > Intel client platforms released in 2026 and later, starting with
> > Intel
> > Nova Lake.
>=20
> ...
>=20
> > +static void nvl_gpio_irq_mask_unmask(struct gpio_chip *gc,
> > unsigned long hwirq,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 bool mask)
>=20
> > +	addr =3D nvl_gpio_get_byte_addr(priv,
> > GPE_EN_REG_OFFSET(priv->blk_size),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 byte_idx);
>=20
> These are only two cases where we go a bit further than 80, so I
> would just
> make them a single line each.
>=20
>=20
> ...
>=20
> > +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +	raw_spin_lock_init(&priv->lock);
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_IO, 0);
> > +	if (!res)
> > +		return -ENXIO;
> > +	/*
> > +	 * GPE block length should be non-negative multiple of two
> > and allow up
> > +	 * to 128 pins. ACPI v6.6 section 5.2.9 and 5.6.4.
> > +	 */
> > +	ioresource_size =3D resource_size(res);
> > +	if (!ioresource_size || ioresource_size % 2 ||
> > ioresource_size > 0x20)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "invalid GPE block length,
> > resource: %pR\n",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 res);
>=20
> There is no point to even allocate memory if the resource is not
> available or
> invalid.
>=20
> 	..._get_resource()
> 	...validate...
> 	...map, as we still have local variable for that...
>=20
> 	priv =3D devm_kzalloc(...);
> 	...
> 	_init_lock(...);
>=20
>=20
> > +	regs =3D devm_ioport_map(dev, res->start, ioresource_size);
> > +	if (!regs)
> > +		return -ENOMEM;
> > +	priv->reg_base =3D regs;
> > +	priv->blk_size =3D ioresource_size;
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	ret =3D devm_request_irq(dev, irq, nvl_gpio_irq,
> > IRQF_SHARED,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(dev), priv);
>=20
> I would also go with a single line here:
>=20
> 	ret =3D devm_request_irq(dev, irq, nvl_gpio_irq, IRQF_SHARED,
> dev_name(dev), priv);
>=20
> One Q though, is it indeed shared? Or can it be shared?

It can be shared.

>=20
> > +	if (ret)
> > +		return ret;
>=20


