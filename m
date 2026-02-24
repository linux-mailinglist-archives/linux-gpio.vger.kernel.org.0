Return-Path: <linux-gpio+bounces-32117-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPCxOktqnWnhPwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32117-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:07:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA3E1843F0
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA2F630902CD
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F48369988;
	Tue, 24 Feb 2026 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHv0N+EL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781682571B0
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923760; cv=none; b=fly5oKZCR+BBaPJ30KL06LoyEd5TvKenkgbNMMQyiWtzLH9O5OETgQGsJaS12ZrgQ4rxRKbkn/QAzWEURcu1LI1PpTW91COef6Bhyof2LFOJ3urcbBiX7a6IhWiF0dqb8KLqBnlGs+eVzDsPj9f40LZmmTyKYBBzo3q0nvDxL0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923760; c=relaxed/simple;
	bh=dd/gT6QA+Dp8Thp1escmNkBWo8V0/a+d5yMpDmFY/co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1AMTgXu8BCbh8vryInvQzQwvJFpMdBCtBfxut5L2jnYny8/H/ICoI80UuX0vE+KCw08r7ro19M7eD8Dii5V2efl0VoaFAkapQKQhOUID/y+du4nfLeBfDrgoSqjklu+7YO9cRxKGpQQc/oWoGDF8omlKSdiS1yCRhW1w/gG0VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHv0N+EL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D3FC116D0
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923760;
	bh=dd/gT6QA+Dp8Thp1escmNkBWo8V0/a+d5yMpDmFY/co=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tHv0N+ELI40VPhWnDz2DTayTADymk3xbwJk82BEoyiBSs9ka2/Ld6scqeD04wXYMX
	 PMxSaTUbAO62zO+UdhI85awhDzle9Qjt1CamZtisgsvl31tkIXc/Lj1CelJX+Gm0yu
	 9XmrmmtWqcOnZQyKuw/You2XfX/PW4XCqpEdK/oCY8g5++VEc3CRLEFWRNhoyL4PoH
	 czUgpbK1GRC/jazU151rOCPnetFGNbYfL+KAL1rJIe9cn5VOteOw9UzeRH7x+y62Zs
	 I+Tsp7q3mfVmp0wiq8YWjGtDFQu/zbAGYqXLodx3d/TVcotG6m6ym4PLXdiJy7zskm
	 zsQmjfXitXQNA==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79427f739b0so48179937b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 01:02:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJQo+NkFlUp/4jVePKSVxb96zWUaO2ndoZ+qj0ZZ+OOlBF/Kjh1/KbYPymhQ/pH15viNJqi1WYJdXl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8G6yCaHbYUUtSkIwJoXF/z7FkOvVxsGJoSJ7qylKQq1LjjS7P
	RpywgLvX0wfaAX+asCqfngD8SyBtQXVuUcSPIyuf9pit4ZpssU+aD7Ie0cVCrHUSQgTiamATxBG
	zHVMT0VYkgDT0KpQKZyepnS9gF6yEwqY=
X-Received: by 2002:a05:690c:64ca:b0:794:d639:366 with SMTP id
 00721157ae682-79828f18d18mr102093417b3.26.1771923759669; Tue, 24 Feb 2026
 01:02:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com> <20260211-imx2_iomux_warning-v1-2-1c5233771b32@nxp.com>
In-Reply-To: <20260211-imx2_iomux_warning-v1-2-1c5233771b32@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:02:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLmPRLy1iJWRtfpS-7OS2533AY42OU87U6hUT59efz-B8A@mail.gmail.com>
X-Gm-Features: AaiRm52oa2BbbnnLKw9EN11_kQbctbk-A3FEXDfTH-WIg6jXcZh2TKpyJ74DM6w
Message-ID: <CAD++jLmPRLy1iJWRtfpS-7OS2533AY42OU87U6hUT59efz-B8A@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: imx35: add compatible string fsl,imx25-iomuxc
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32117-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 8FA3E1843F0
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:00=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Add compatible string fsl,imx25-iomuxc.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This patch (2/4) applied to the pinctrl tree.

Yours,
Linus Walleij

