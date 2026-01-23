Return-Path: <linux-gpio+bounces-31020-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jn/IJSYc2lgxQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31020-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 16:49:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D82A777F5E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 16:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90827303E2EB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 15:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71A52D3A89;
	Fri, 23 Jan 2026 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7/UO1X6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A822927A107;
	Fri, 23 Jan 2026 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769183286; cv=none; b=bkluQwhP4YC1rwOlnK663hw2D9VIMd/ZsNBUOlJial+4b9xAaYCDMLyyd12u8yrA9GuWV8pLrFyaDq4uYBaYZU1Dhq+z8h4hh4EdK5j4nwEHaiRUdD42VrwRUdiksegHQIcyvQ4GZOxN9+2oghEFmHv35gVFvs8CeKDnmTfhay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769183286; c=relaxed/simple;
	bh=/ceSAoAN9tejJ5cnyV+8sMNNEAT+xZ/MIu81y86YhpQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=urE8c0QD0Gye5Dk0UTKLy+WUqaqLPDFECxrBC7mFiFHLNzz+u5x3bV3O9OHxJxXKdLM+N/k6pGrJMJQluUYL8IQ0O5+7s2AfyOqFE5iDCEWxIdCJb/J6EickaksPct07tm/6O7HU2uu7JcKPKiAs+f1UycoQRH15MKjttwOVr/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7/UO1X6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8393C19421;
	Fri, 23 Jan 2026 15:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769183286;
	bh=/ceSAoAN9tejJ5cnyV+8sMNNEAT+xZ/MIu81y86YhpQ=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=S7/UO1X6Qox/shtxiLmynkO16IIPCDJ4iBqI7aOcqMzl9DM5KLro37EWDy4J5xsCd
	 tCItH5UhezT0i1UmsaHhfdELd5z4ToFpUTUTq/QO+CC3OB4LAfqa9rk98KIfudbBcj
	 atHnZt6+f8N5VAhKP9vQIIxKyQQ8bzKrKtqcixsIEVwybb+yMcuopYQpMHdmmLh15p
	 FaeadDIpOgKXnUMeMcl6wCqf8+gwDD43Cg1/YV+a0wtYi0gbiHxvVXe/ZH513xtC9C
	 t1jXW/H3W0qJbSsMOZrNOjTkyD+b6U/37oeatktqR+43j6X8qvAXZeDAnebuhAk4ev
	 RcfoGd/Ksk50w==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 16:48:01 +0100
Message-Id: <DFW34RKI0FBC.WRKWPAS6IBN7@kernel.org>
Cc: <rafael@kernel.org>, <broonie@kernel.org>, <will@kernel.org>,
 <grygorii.strashko@ti.com>, <ssantosh@kernel.org>, <khilman@kernel.org>,
 <linusw@kernel.org>, <brgl@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpio: omap: do not register driver in probe()
References: <20260123133614.72586-1-dakr@kernel.org>
 <DFW0SC4QG4W8.C7BRHX02W3IK@kernel.org>
 <2026012354-stinging-lapdog-2a54@gregkh>
 <DFW1DQTKRQS0.YXYIGV3FF6TK@kernel.org>
 <2026012302-nutmeg-grandly-1a09@gregkh>
In-Reply-To: <2026012302-nutmeg-grandly-1a09@gregkh>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31020-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D82A777F5E
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 4:23 PM CET, Greg KH wrote:
> On Fri, Jan 23, 2026 at 03:25:43PM +0100, Danilo Krummrich wrote:
>> On Fri Jan 23, 2026 at 3:19 PM CET, Greg KH wrote:
>> > But there are no platform resources for this at all, shouldn't this be=
 a
>> > faux device instead?
>>=20
>> Probably, but that's for another patch, since this one may potentially b=
e
>> backported beyond the existence of the faux bus.
>>=20
>> > That being said, ignoring the return value of platform_device_register=
()
>> > is probably not something we want to keep around.
>>=20
>> Yes, as mentioned below the commit message, there are a couple of things=
 that
>> need to be followed up on here.
>>=20
>> With this patch I only intend to fix the deadlock condition and otherwis=
e keep
>> all the existing semantics as it is.
>>=20
>> I.e. maybe it is intentional and this driver should not abort probing if=
 this
>> can't be registered for some reason.
>
> Ok, fair enough, fixing this immediate bug is good enough for me.
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Just for the record, the things that should still be addressed:

  (1) Potential UAF on module unload: The device is declared as global stat=
ic
      (should use a dynamic allocation instead); device is never unregister=
ed.

  (2) Handle return value of *_device_register().

  (3) Use faux bus; maybe not directly suitable as omap_mpuio_driver only u=
ses
      struct dev_pm_ops callbacks. Though, we could extend struct
      faux_device_ops accordingly.

- Danilo

