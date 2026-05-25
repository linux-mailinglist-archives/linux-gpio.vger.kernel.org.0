Return-Path: <linux-gpio+bounces-37442-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5f20EhkVFGpOJgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37442-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 11:23:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0625C87C9
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 11:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1F4330094E0
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 09:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850B73E51F6;
	Mon, 25 May 2026 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bY5RO9ze"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5994B3D6477
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701012; cv=none; b=gdXMYWWxV9YGBNOaqAIgYRCYdoiXpq6t3hoxRNukqHzwCqW0Rp1sDxeIgI8xF3hafeuY/m4lgQfKrJ2aeGzHpP7w26AtTmpmCIFjmMmbtMYzXBXRArKoDDUIdKHETI1LAkWA7g3d9/MiuFoVY63wImUPVzxZrAJmlMdiN1uy2Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701012; c=relaxed/simple;
	bh=HSqMR1BUhZmAPoEEsJ7CSGo/YWAmtsvZVxjNmWMnpv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kS23HhqQ67nFGgk0OD2N3+HGPlf0TA1M/QZDT/jUSHwYs62YFofSbFi83HnmCI0uJgOISOkudYnYboCmbz4yWJOpyDLr2K7rqff3g+qjA3cqvDD6OPMYtVqfVm/Sunn1KaTMPEjY/6WShYDtA1iS2j8iC0yHjoiwTq916dymVY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bY5RO9ze; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2CE1F01561
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779701011;
	bh=HSqMR1BUhZmAPoEEsJ7CSGo/YWAmtsvZVxjNmWMnpv8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bY5RO9zeN2x3Sx/sqgo2aknq4O6QBadaN73qg/yfFYfFj1VFzTuYX5o/YDTtIhE+q
	 7hwNQawZXELa/v/bcY6sAvMO325Vy2GJlc6YqVhrDmKUvK+ZmgeeM0lCDSeWqxoLQb
	 f8ujT09CuayXKFW5Hyn8wj1rStcaKQVPaflf4SQcVG126wstv1ufwwz+4u2gsLIiXE
	 pR1oxgNT6N6o3yltF1VFTK1j9+F1Bm39BZAhUiJbcuE3/5LErESwI8KrtcZ6Msp90G
	 fg3pRmNg2jbV91FjV4Jf+sICABFNtU/EFI6OTLAeaHXycKuCOQDKKnkza89bylr8jw
	 zxFHO5pXuTVlw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a887ebb416so11329102e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 02:23:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//J8e2vXHgs6UhXtXrkVM8HqBppViOz1AWyOCc6BCwrMwFv7BMfEF3v+LFU4pR2AGrew+rrRXaH+Z2@vger.kernel.org
X-Gm-Message-State: AOJu0YwupOCvmnOEvyAdDkqACEYzk5xdMcA/3sRJ/2hsCfHrJ2gZ52dG
	GFoY+KmtEDTwBkp0+KHPT2D7IlcX0yBNW3+jLqTtiLlRvXqL5U4TGCVOKcxOQ2m7nNTsOfhz4ib
	wCiRTKgsEOcmfKLw2/Y1pFUdX5AnPQyY=
X-Received: by 2002:a19:f614:0:b0:5a8:d1f3:501 with SMTP id
 2adb3069b0e04-5aa323d4911mr3163269e87.22.1779701009859; Mon, 25 May 2026
 02:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com> <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 11:23:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLmjm=Zgs+jNGTVdasy+9O1GvqM6EP=rVRR5mP=L9V13Mw@mail.gmail.com>
X-Gm-Features: AVHnY4KZDPHsMnDjXhSnKvV5S7ZKJ_9tMzfEYPdLup3zNAoK-EI-0JPPNTFt604
Message-ID: <CAD++jLmjm=Zgs+jNGTVdasy+9O1GvqM6EP=rVRR5mP=L9V13Mw@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl bindings
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37442-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AA0625C87C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 3:18=E2=80=AFAM Jia Wang via B4 Relay
<devnull+wangjia.ultrarisc.com@kernel.org> wrote:

> +++ b/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h

Move this to something like arch/*/dts/vendor/dp1000-pinctrl.dtsi

Yours,
Linus Walleij

