Return-Path: <linux-gpio+bounces-34754-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FejLIOex1GkkwgcAu9opvQ
	(envelope-from <linux-gpio+bounces-34754-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:27:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA93AAC25
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CC4D3006130
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 07:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90C839479D;
	Tue,  7 Apr 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oS6QxhYN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D9F393DDF
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775546852; cv=none; b=J4WEgCaoc9OuqnabCte/vtPEqykyuPmqk8UgKXOM5QmrSQI970LxCZiO4eaQ2KSq7tdrWotX1+VyEMVXTxAvSJBu7DEg1+zZtsEl8JSsK6MUbRwV8tBJUqifghgW4DVA6Lh5mS46EPRvztaY8Xo2bHrQgwR8LngKvVDJs7ePyaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775546852; c=relaxed/simple;
	bh=xXRf7ZlIE67Mq9vvA+FZdAN/BVyuhN+/8xAIWrMcwSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghc8ZDIvX+ZXb/rOSpzWYIkEoJUZ0lkknz/8r7t1PjcPp74LixZspuet4dJ+Xw1gjlZbRwCTTwugELmiGG1jtY90lGfurUdCR+FNX+oiIWzjHTwPkH7l4Pp1S+JwCEKNL95I56FNyosPBq4cpdIMocVJRGs0PID/WpXoNwERpxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oS6QxhYN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747CDC2BCB8
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775546852;
	bh=xXRf7ZlIE67Mq9vvA+FZdAN/BVyuhN+/8xAIWrMcwSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oS6QxhYNQ21JeuqakAB3IUKPuahJDqes1AYLqkOWKWsMAymK10UDgdMDXUNnQuLu+
	 cLCugYDaSK9DrHdBi2oIeLNZzx5h9nSNS4Ed9gFhmfxyb/l/0YZVJWiNVPL2L6XAZe
	 CK70WsMN8Xv47/72t47sIAswB4HSwMGU5AOe3oiWp33s2i6V+YAt0ATAdl0DzSNy+r
	 DdfD7M8IGk8/AkMfA5StV1/yWgw+FsEtpzYpIlQs4YKr2alagUJKo0dcHH3J1t61Jz
	 g6hbYF3fkzVvaNhz+h1/XCEf4qsQ7YTff+SZzZ0b+coEhygQZK4madQmKHidDAFHQN
	 ydMbgIPn2tgrA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79a535e7c00so47761147b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 00:27:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUN+31WMztR8tIo2/Jts1WoIG1h39pRpW/o4RECai+AkLCVhVO19D4DL8PjuuTSHxM7qqfmf2ELNfyr@vger.kernel.org
X-Gm-Message-State: AOJu0YxLXpncdL3ggxPXCVyqi8XWZX52GXDWGWOq0OQWVcWwq+ixmge+
	9M8t4tg5YVHetml3K4Iwtitq88mG9/PyVG3M/fGbIy2XDOdgyb7nbBYjcuaANolNFth7rKPLi3n
	QC+mTyT8NSGZEw/4TYwQUCOSPmBS5i9s=
X-Received: by 2002:a05:690c:6891:b0:79b:82a1:645d with SMTP id
 00721157ae682-7a4d84c2b0cmr153542237b3.29.1775546851789; Tue, 07 Apr 2026
 00:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331113835.3510341-1-eleanor.lin@realtek.com> <20260331113835.3510341-4-eleanor.lin@realtek.com>
In-Reply-To: <20260331113835.3510341-4-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 09:27:20 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Gr5szR9bNeLHGJh_Hku6FrW7f=sBtWi9nzui=VS3Y-Q@mail.gmail.com>
X-Gm-Features: AQROBzBwC96A2d44hZWfYRwmq8cn7_WR5JY1hKsgDt4xM1OBYyZOdqZz2qQC398
Message-ID: <CAD++jL=Gr5szR9bNeLHGJh_Hku6FrW7f=sBtWi9nzui=VS3Y-Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, tychang@realtek.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
	cy.huang@realtek.com, stanley_chang@realtek.com, james.tai@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34754-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,realtek.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40FA93AAC25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 1:38=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.co=
m> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.
>
> Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
> which manages pins via shared bank registers, the RTD1625 introduces
> a per-pin register architecture. Each GPIO line now has its own
> dedicated 32-bit control register to manage configuration independently,
> including direction, output value, input value, interrupt enable, and
> debounce. Therefore, this distinct hardware design requires a separate
> driver.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

With Bartosz comment addressed:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

