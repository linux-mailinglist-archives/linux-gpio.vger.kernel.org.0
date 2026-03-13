Return-Path: <linux-gpio+bounces-33362-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO4+EXYftGnahgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33362-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:30:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D210C28501C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABBD731B2991
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F013399340;
	Fri, 13 Mar 2026 13:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="Z6kJoduV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A12D7D2E;
	Fri, 13 Mar 2026 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409087; cv=pass; b=i3BSH0Rez0fvRlYPdXTbkbgiN+2cyLIgNbm8CeFd7K7iVjLwnqGuiGoHqa7BeJC/a+3Vp6be+WonWjZJ1KJnCIIkSZ3QeVmPzCtX5MRR1BqstdH3YGPvm80nn2taBLm10eH+QJX5zA1YeC/mnqFXeBj1DxLu1n4qkJUiJF7Z7pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409087; c=relaxed/simple;
	bh=1EMaOoOWPOC7Nwsl+BdHwxbIv8eBJD7gu8iTli3mgVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnprxRjQm71VIy1RSgFTDhHAwTu+BZxiQLl9uWU9PM2fmY3iHucmH5WY/hwcnfmPznDyyhRz2cDdH+pnXruFdoNfLqPVRfokqPrbjw+N1lW62Y3byLuS79bDN9WY93QEjDSSJKHeeInr+Y3FaE7MjpEqbVNtamXlGy0PwxfNI18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=Z6kJoduV; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
ARC-Seal: i=1; a=rsa-sha256; t=1773409074; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cg2Za8ytuaIQiCfO0rTWkIE+v+HBEroNtByDdsDSBreHBfeMZeNo7+Ej3k6Wk2gwtqwjITjDl2dzQ9saaytyAqk0mBXtxHHZ8xmc43MsRsitiGj4L1oTYoKZnXCB3d8oq8owfARqSAzrFjlInNTX9Ux6HyoAKS2uQobybyjrNss=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773409074; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1EMaOoOWPOC7Nwsl+BdHwxbIv8eBJD7gu8iTli3mgVQ=; 
	b=YH5WLgV9Hc8ZZ3IsOSxf4f/ktVGEbcLLk8I/nnkBh82WGfJZl0FZYWBYH5G6qnlKJ5zGVVl7vl8LvoGvK0+dSztQsfooJwgHv5SOFVL22x4mBu7gpWVCrnQWTPxM68pYXS1jMSV5P0f/+rBEZh3c12L7OgEgfUomzplj7ArW6SM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773409074;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=1EMaOoOWPOC7Nwsl+BdHwxbIv8eBJD7gu8iTli3mgVQ=;
	b=Z6kJoduVHRDoY8n9ISMguJSD8DYG8cvzoN3J3a+e1bZP5wXFDVIMFhv0PJEo7QHU
	GuhT1sp7rlMqU8rxhGr5AhJbQBdGJENPmIedV9USaHnutxfyKEzCoMLv1AuZyO3xKPR
	0VFeroTutnQf1Gq9bmD9D1MHTA+uSyO2W4k59eeY=
Received: by mx.zohomail.com with SMTPS id 1773409071410361.89946816641975;
	Fri, 13 Mar 2026 06:37:51 -0700 (PDT)
Date: Fri, 13 Mar 2026 13:37:34 +0000
From: Yao Zi <me@ziyao.cc>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: spacemit: return -ENOTSUPP for unsupported
 pin configurations
Message-ID: <abQTHmE_8_N3F-Hj@pie>
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
 <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
X-ZohoMailClient: External
X-Spamd-Result: default: False [7.84 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:dkim];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33362-lists,linux-gpio=lfdr.de];
	R_DKIM_ALLOW(0.00)[ziyao.cc:s=zmail];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ziyao.cc,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.870];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@ziyao.cc,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[ziyao.cc:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D210C28501C
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Thu, Mar 12, 2026 at 04:42:42PM +0800, Junhui Liu wrote:
> Return -ENOTSUPP instead of -EINVAL when encountering unsupported pin
> configuration parameters. This is more logical and allows the GPIO
> subsystem to gracefully handle unsupported parameters via functions like
> gpio_set_config_with_argument_optional(), which specifically ignores
> -ENOTSUPP but treats others as failure.

This sounds like a fix and deserves Fixes tag, though I'm not sure
whether backporting is appropriate since no existing system should be
affected...

Regards,
Yao Zi

