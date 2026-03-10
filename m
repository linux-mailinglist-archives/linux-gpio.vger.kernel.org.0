Return-Path: <linux-gpio+bounces-33033-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBH6EFZIsGnFhgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33033-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 17:35:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1F254E60
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 17:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BD3530A754C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32F23C8719;
	Tue, 10 Mar 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="LACfQ8k6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21FE30AD00;
	Tue, 10 Mar 2026 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773160528; cv=none; b=OKqeOTOT5zddl8byj+Ghk9OMVpzgmAbUujs4yIE6fq1s8wXtBnjk8p6CCKL3pGev+7AFqEv0iFr/kOhNBTym2CdAdrAHmR8MIEjLzAYy2dB/b8Pdm9BpqQuA6pqAKiQr7y9NvcSVvIfMZsVPDTCUQmcc+JIQYjMk8qf7F3GtOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773160528; c=relaxed/simple;
	bh=NyY1GquT7Kh0BgWa3VarHvccTq0L4QkWhlLAy2muwXY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0qxUMLYbTKq6y73k1gbViE+PxxIcLbke+e+D5jboxE1XrnCq6ZOMixLZ0gW7DRZnf0oi5D79G3WkFgOmhPd+CTFG6+egi0nqgZNdq+W6BUXXp5/NWKovs6nBjiw78X/Mdyc+4H0YjImyRF7spU0bRoDFJsG3cL7b18RIE7ZxQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=LACfQ8k6; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1773160527; x=1804696527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oM8nxu9JpUKslzaEdemYho0xSJ2TMFTESfkq0DvUVVw=;
  b=LACfQ8k6S8/O2xVzsbEPiQGoE2cjCYpHcUwZmJnYp855fOryJnYNa4yF
   tKGzpufH7M0rmP9Fbb/dyq3rsqd879jWs/9dXaqlzjt8abl8TUWf8vEMJ
   txfWl4knjXBicrSCEEXIe6rtdEEa3/9pLmNkKwqNYTdMsfkbjLtZni39Y
   JQzg8Wg5Y/ycFTpkdo93h8ImMoI2KeUlv3+UimZcXEBw/RgQROTl2ff2c
   TcKosIND/4C10pcczqscyDg18QaukDDlmOs46S6hjLTDn0ZChZw60ZieE
   CTcCc6wtfLl81r49PQZLbzgXGNi5vOERR+t27gnoPOlhVWEAB/+q5WmQY
   w==;
X-CSE-ConnectionGUID: /KcLQhXqSqGICCrCuebe2A==
X-CSE-MsgGUID: pfKiBkG4QxWKbkbMhftZtg==
X-IronPort-AV: E=Sophos;i="6.23,112,1770595200"; 
   d="scan'208";a="14737380"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 16:35:27 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:11308]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.3:2525] with esmtp (Farcaster)
 id afcbc70f-3c48-4a86-bb17-30a9a863f00e; Tue, 10 Mar 2026 16:35:27 +0000 (UTC)
X-Farcaster-Flow-ID: afcbc70f-3c48-4a86-bb17-30a9a863f00e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 10 Mar 2026 16:35:26 +0000
Received: from localhost (10.187.170.21) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Tue, 10 Mar 2026
 16:35:26 +0000
Date: Tue, 10 Mar 2026 09:35:25 -0700
From: Cory Keitz <ckeitz@amazon.com>
To: <dumitru.ceclan@analog.com>
CC: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Julien Massot
	<julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, Niklas
 =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<mitrutzceclan@gmail.com>, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH RESEND v8 14/21] media: i2c: add Maxim GMSL2/3
 deserializer framework
Message-ID: <abBITdEEs4tJCQWa@bcd074ae11bb>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
 <20251208-gmsl2-3_serdes-v8-14-7b8d457e2e04@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251208-gmsl2-3_serdes-v8-14-7b8d457e2e04@analog.com>
X-ClientProxiedBy: EX19D046UWA003.ant.amazon.com (10.13.139.18) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Queue-Id: 9AC1F254E60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33033-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linux.intel.com,collabora.com,ragnatech.se,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeitz@amazon.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Dec 08, 2025 at 04:13:06PM +0200, Dumitru Ceclan via B4 Relay wrote:
> +#define MAX_DES_LINK_FREQUENCY_MIN		100000000ull
> +#define MAX_DES_LINK_FREQUENCY_DEFAULT		750000000ull
> +#define MAX_DES_LINK_FREQUENCY_MAX		1250000000ull

Related to my comments on patch 16 [1], I believe this should be set
differently between DPHY and CPHY. As I test more cameras I've patched
this to allow CPHY link frequencies up to 2500MHz. I'm also wondering
whether these should be driver-specific rather than defined at the
framework level to allow for higher capacities in future silicon.

[1] https://lore.kernel.org/linux-media/aaxWATynXaVFglvS@bcd074ae11bb/

--
R,
Cory

