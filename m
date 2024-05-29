Return-Path: <linux-gpio+bounces-6838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6588D36A3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A5C11F22BA7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C3418132E;
	Wed, 29 May 2024 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="UFNDaUIB";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="s+2PZqt9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F4C17DE23;
	Wed, 29 May 2024 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716986689; cv=none; b=e8HLu94r8np5XsmSCcTVr/2a1TbgxvfhRXwt3/r9CZnfz3eA6hHLf54Gyu1+LLtCs2x0oys+xTK8tfZT2/ske5dLqtGsXptSqtTsdy4491/FW75EJgNNUIg1PDaMaULTvjHPFk8usBwhrnwnovpxI5ULWYBf0d0UdFGH94OR3Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716986689; c=relaxed/simple;
	bh=VulbFFluIY4V+Dq0KwN290O9m54yLfSK+Ucnvv0/x0g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sJChVvGiQhN57VpEp1ngvRsSD60aWfeL1xCj9fM82t2QSJHyufCXqEp3oD3AtF0WQ0uRvcukGe32TwEDvfMn8vzCES+eJD8sK8+4RhzaqsqLT/uZpcVnkBzHejt9paEnMLGzYtdpepna1WL4xXUaiL/R/J9ImEIP38PmkLce4Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=UFNDaUIB; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=s+2PZqt9 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716986686; x=1748522686;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VulbFFluIY4V+Dq0KwN290O9m54yLfSK+Ucnvv0/x0g=;
  b=UFNDaUIBbsWPvapwS0gpfpdkiUPwBs6Joy2jG+QDLwwQwxt5gnkVHshk
   8xDC3CQivDNWPNB3+bfa5ahDP+6ROnDWfe37vLqkL8Ao3O6PE24DKh2Pz
   NUCuFRL5yFmpglITOcObvCVbm0DI8jfXfcBqLGq2tCQ5o5YDJA2G8phji
   28bsncjgWyiXJPD16Rlf7F6VJ6V1XZ8LkD4U0g/hMQf0mRzaMXNN0Ic/f
   /s8kmJNAMl1nDc8jlla/yyjC7R6Ski0pLtUloZ0oo6cCuio13iAQNLUYk
   tShKbq7Vj+mjj/Fds5huuEWUIpT1yl720Zu8Ps3n127GRvKm6m/6hlcYs
   g==;
X-CSE-ConnectionGUID: CdrFQlHLQlqYJTWEJW+02g==
X-CSE-MsgGUID: T6nuZhbMQUi7EaBzqO2Srw==
X-IronPort-AV: E=Sophos;i="6.08,198,1712613600"; 
   d="scan'208";a="37128982"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 14:44:43 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76DB0165652;
	Wed, 29 May 2024 14:44:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716986679;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VulbFFluIY4V+Dq0KwN290O9m54yLfSK+Ucnvv0/x0g=;
	b=s+2PZqt9EQdYDhMMsaSjzPFT3eobtAweRRgds2WvhjijA+3jopJgMfhP2kCMdNJxUrNnD1
	Mxg51A02Pi6Pee+YWVIaD93NGRCScWf7Rz56swXL9m2WMGp2OsbZc0GpPby4AHII+x3sH7
	MBgdS4FDnO547sz6oKZLfv9B/YAF5L7XXA68wanbo8wxMZbEqhDHeuJBXDj63fIxKurWEA
	A3T/jDQpmlrSyCKht4VFhn033VeeaWVpsp41CG3WMlktx5T46zgNJtJruT7re7GT4YNLWo
	W2zMUR3UnIFNaOTTaUyovPONZkVPZ3RUAwOVO2nkIFN10JKXkHPzQtP8wSuXaw==
Message-ID: <954848a9ee2967908bc40069c94cea4407e7de7f.camel@ew.tq-group.com>
Subject: Re: [PATCH 8/8] gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH
 interrupt type
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@tq-group.com>, linux@ew.tq-group.com
Date: Wed, 29 May 2024 14:44:30 +0200
In-Reply-To: <9f8107e1-4a80-4f20-8862-f85aed578cc6@lunn.ch>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <2c265b6bcfcde7d2327b94c4f6e3ad6d4f1e2de7.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <9f8107e1-4a80-4f20-8862-f85aed578cc6@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 2024-05-29 at 14:37 +0200, Andrew Lunn wrote:
> On Wed, May 29, 2024 at 09:45:20AM +0200, Matthias Schiffer wrote:
> > The TQMx86 GPIO controller only supports falling and rising edge
> > triggers, but not both. Fix this by implementing a software both-edge
> > mode that toggles the edge type after every interrupt.
>=20
> Do you have a real use case for this, one that will handle lost
> interrupts because it cannot swap edge quick enough?
>=20
> I personally would not do this, because it is dangerous, it gives the
> impression the device can do both, when in fact it cannot reliably.
>=20
> For me, the correct fix is to return EOPNOTSUPP or EINVAL for BOTH.
>=20

This was the first thing I tried as well, but it seems that supporting IRQ_=
TYPE_EDGE_BOTH is
mandatory for all GPIO drivers (not doing so results in various error messa=
ges when attemting to use
*any* type of interrupt for the GPIO; I don't remember the exact errors). F=
or this reason, several
drivers implement a similar software solution when the hardware doesn't sup=
port it.

Many drivers implement this in a fragile way that will easily break when an=
 edge is missed. On the
TQMx86 we are lucky, and this software implementation is actually robust an=
d will not stop reporting
edges when one is missed. The reason is explained in detail in the long com=
ment added by this patch.

Matthias



