Return-Path: <linux-gpio+bounces-36910-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGCRERv4BmogqAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36910-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:40:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 613B554D84F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5DD733053CA3
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833DF44102C;
	Fri, 15 May 2026 10:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0MQpcXCd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC2C43C066;
	Fri, 15 May 2026 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839640; cv=none; b=AVzy+23QQLUso5uT2CXvCQzyqmIUwHJ6JkVOfYuUTLlx/Ic3juGEbwXjBeOOKJwIkN6mtbxZmpOnVOVLYJP6lxCburz6JO0PM1+ckJsZhYT0wY8px3glKokT7TewffVnAPA+Suq/U6uet5Mh43JGH7VQxRgDhYa4eVui0vxxAuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839640; c=relaxed/simple;
	bh=p16Samuzcb7UeG8Qdbq/J3WL7f5r6uCXgJkREuEk3FE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za6m33WcIBms8zeaTR5yG7/X+tBrZIaOMBEVUeRSEtrSdSvFTvukmEuKBKUlPLBONPi4HmMi6LuAo79V2VPZJsesyAlO40STMr/9xTqx5BmqRbkyYq2BwXmCq0wHcjsQnnkFqoCpvEGKWk/84IMSxHiP8M4ObHy7PK5aZgXXhtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0MQpcXCd; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778839640; x=1810375640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p16Samuzcb7UeG8Qdbq/J3WL7f5r6uCXgJkREuEk3FE=;
  b=0MQpcXCdPYEcfEZJYgUopfbWfuuJ2A6t2bhi3xuBmHe4VXLhU7gnE4BV
   RLUBVg5C6AhIz4WsXjhSBd8y+6Bp4/RQLhcQM1HVLl+zdLhrWHjSGmw3c
   qqHL+i72/cnZHdkZpgFpJcyNJZen0PqjgUqTbNMf6MdRc/zIP6PJ5F1O+
   P2oY8LKtOsSESzTvZl++xIMII2bp7ARBpmNXfsSfnQJTl6WJwCJ/NgQN5
   +6lsL5TUBUywE5YDT/HaGeAamYxk3LUJJb9Ur7/K1G7+l4ck1gW55WEK8
   7pbyu3yrXkP0056F0CFXSc2NTfi965Dve5TqvEUO2C4gnJuhEcRlyqxC1
   Q==;
X-CSE-ConnectionGUID: 3YPa1uukQxehnbSvoJmU4A==
X-CSE-MsgGUID: LTVlmf/nT4aZ2CNGcybFHQ==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="56789185"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 03:07:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 03:07:17 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 03:07:14 -0700
Date: Fri, 15 May 2026 11:06:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jia Wang <wangjia@ultrarisc.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Conor Dooley
	<conor@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
Message-ID: <20260515-possibly-showgirl-a38423881f96@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-2-bf559589ea8a@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qa3Omcx9s0HAw1jP"
Content-Disposition: inline
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-2-bf559589ea8a@ultrarisc.com>
X-Rspamd-Queue-Id: 613B554D84F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36910-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

--Qa3Omcx9s0HAw1jP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Qa3Omcx9s0HAw1jP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbwLAAKCRB4tDGHoIJi
0r/OAQDRlYqfkdPpp90m6Qrq0ztSJvu2u34C9qGWQNkz4kamQQD+Pj1GthASpIRQ
hFGwBclBGjHAlwcUVTh78KCnFIt2PAk=
=VDHT
-----END PGP SIGNATURE-----

--Qa3Omcx9s0HAw1jP--

