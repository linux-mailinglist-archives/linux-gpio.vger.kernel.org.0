Return-Path: <linux-gpio+bounces-34928-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKqNEhpn12myNggAu9opvQ
	(envelope-from <linux-gpio+bounces-34928-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:45:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7773C7E0D
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F6EF302F3BC
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E9D3A6408;
	Thu,  9 Apr 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YU4LpRfW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA5379EFC
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724237; cv=none; b=GFQB0Fa5Q48LBKiCwShnFt89iPdGaYCOp2obdUQgYojPWI0iGnXQqsj2xmxXO0anEzuQTLlSaVH8O7Suw2jyzrpMyfXFz6vPVVsaNA7DFE69apm2G379462mKP5K3p6DBWieTugPfrjc8hGZTjvTsGuT08324rWKfKOiRmIXBaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724237; c=relaxed/simple;
	bh=NcyBxEdC83CwSQVeqd/+ifnZKhBgjInw+UKqA5lU87o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/c3WFPVm2c/CkL/eoJVBSkQ+FOwaMAj8iTA1RAHcm0NyzZ8Lhs7EptAe7pCmUaoqgzFCl+UmTS1I9w+S0U+6UDNoHFiGSAZzxFu9H661c3EByQVDx/2iLbu/XmudiZ+hHkqQLlqIVWcYEsCakxGUQa/zvpUqJ/5KIFRhULjtYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YU4LpRfW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39070C2BCB3
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724237;
	bh=NcyBxEdC83CwSQVeqd/+ifnZKhBgjInw+UKqA5lU87o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YU4LpRfW8wM1HKoklft4RZo7//H5bYshqeN+VLfxQe1XinC9HQc2AWsbwGcIHCUDs
	 quPgrBjlSciM/uAzKHsVfiVGeImXpFnt3YsQ4HgdZIEXBCicGS+j8nuXtCRnJlBX8U
	 mM/vylpuUtEspWgAalnOfegWCz+VWTZ8UUoYFKntTw8Tr9OE/m2fri4MlQ44uSiOPP
	 2lCbaH1kdnjTm44cWrXrAt0k2oS4t7XH5h2xBdm8LaDWJaCQdgg7o8nhWv3D8kBce7
	 FaweX4FatQYKLA+CwgIXN4KIsF7D8GugYPHHFDu8Z0wVUWM6KqLUU33DkV9L5AdrF1
	 Gdlx1mgjwuuZA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6501d32b04bso681000d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:43:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1ZqWCQZd0ZQ/VO7jDJBsHbIYNSPEEuaO1g6fdhvrGFTa7yI7VrNsC1Bng5qBskbsIYpojHRNXdI1l@vger.kernel.org
X-Gm-Message-State: AOJu0YxZG9erFwKtVeFWiBLoH4yV+skE9+Ge5V/Sd0GT5Mj5i7k388+b
	l6tCIvBsKGLIPzywww8oefpKxzCqk9nUjCJj7GCs1YidBF72++Ash+tS/zRaqPfbyS2juzXydN8
	aI27LhpOzUX+kpIIVD9RVPauz5mwPoec=
X-Received: by 2002:a05:690c:6d81:b0:7a0:4146:6ebd with SMTP id
 00721157ae682-7adf1885749mr30709357b3.24.1775724236613; Thu, 09 Apr 2026
 01:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407235611.550515-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260407235611.550515-1-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:43:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLkDViw++2z0zU_kJ34MSn6vbBODjGFvdPU9mtRZKF=iqQ@mail.gmail.com>
X-Gm-Features: AQROBzCTxnAq_MMXyVcVYXsPtjsQhejsVfqwYdrCEdCdgzSYiyyw7RR-hhoaEGI
Message-ID: <CAD++jLkDViw++2z0zU_kJ34MSn6vbBODjGFvdPU9mtRZKF=iqQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Utilize pinctrl-single for bcm7038-style chips
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:PIN CONTROLLER - SINGLE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROLLER - SINGLE" <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34928-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B7773C7E0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 8, 2026 at 1:56=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> This patch set allows Broadcom STB chips with the BCM7038-style
> pinmux/configuration blocks to use pinctrl-single. This does not
> preclude us from making use of a more sophisticated driver in the
> future, should we need to.

OK that's one way to do it. I wonder if this approach also works for
BCMBCA given Haojian's comments on my previous patch attempts.

drivers/pinctrl/bcm/pinctrl-bcm4908.c would then be phased over
to pinctrl-single, or does the MSB/LSB register layout create a
problem? If we always write 0 into MSB I guess we could just add
some quirk...

Yours,
Linus Walleij

