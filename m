Return-Path: <linux-gpio+bounces-32116-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO5NMiZpnWnBPwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32116-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:02:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5521842D9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BAB28304396F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E83136998A;
	Tue, 24 Feb 2026 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPyJblg8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D472034D915
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923744; cv=none; b=dtmmG0Dy628cxYCwSIOcXvGP4tWTPNL8b9F1eOYv4tvNDtJA/1VNi8i/8xy8vA0F6aMZOF3wswvJMnlbhKm8nhoUkmmA38NYiElLVhkNTPaM7F+Wy2W5yIJ/P1u3R07a5CyJC8quh/TdIv2D6205ONShCOxgajwxV0XRUfygmNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923744; c=relaxed/simple;
	bh=cZvD/6XFqfPCPXyr2nRCWetVJUUTym67DrxVL+hwiSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXmfKwf8O3lxToHEBixd51aN25ck7Kugf+1MLR90Ha31ZmPVOr2bQidHoQy60XQATRtSMwVVzi+gbILOxlUuvOdjfPqG/R+6uvqei63PuiYzG2GeJyLSIDGzKNY3tJ3ZaTH2SKpOo/5i5tzv+KxHjsW6x0K/vBp99MfcNlR0RNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPyJblg8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8618EC19423
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923744;
	bh=cZvD/6XFqfPCPXyr2nRCWetVJUUTym67DrxVL+hwiSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dPyJblg8XNBIFwgJpnAlSHMQbMmtUYguxmNAU/HeFketfG3kwyCTDuG+0UMKDiRpz
	 aS5EVmby2GzxMFeRj7A6mNbBGj8JL3RySqiJ2Ecq9vnO/N7mrxtDKFvTr6CEmRKlwI
	 xyPu7vPrYyF+F3jMp2KuTAR7LrgKOakDAChpwXzjIfHqCoYRjPbKlPyAdFlLihkobq
	 l0/ZIyUqxEX4VAdNRY17pTxAkGiqlnQpM7uq94XKM8Jukn0N6rHINsrCedIzrRz560
	 bvvnCjUV11WRlyGm/q/GOSIjrgVMToLq0R8gFVAfZnth+kRb0cO6ltXgFGyOwmgHV+
	 HB+5H+ML5/6ew==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7982c3b7dfcso31434107b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 01:02:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5TjOcGbE5yTrbb0DZzNxHnABg2lgcgQK7V1vr8O0O2KPx9NaPX1UTmmeT4CU2q+u7ts6a9jQddUgY@vger.kernel.org
X-Gm-Message-State: AOJu0YxNF4YcPM7AkmJh4fmhQiVfLS/ueI7T/Rn70gSXA+wT7hUWctVC
	KgFm667JMhvmfGJSC7NHtA+S/xz4rQF3x+m87JxaGVjw6rgszDh1q7C+rA8I51K3Ijjww5ajRLy
	mlKNtZIXztq+LrVn/rQ706u+wuWSXbHQ=
X-Received: by 2002:a53:b5cc:0:b0:649:ca5c:59a1 with SMTP id
 956f58d0204a3-64c788d108fmr7682076d50.27.1771923743916; Tue, 24 Feb 2026
 01:02:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com> <20260211-imx2_iomux_warning-v1-1-1c5233771b32@nxp.com>
In-Reply-To: <20260211-imx2_iomux_warning-v1-1-1c5233771b32@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:02:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6e-gRMMXBUV0OqdDu0BAsiXmch1mROZJ8VxnSCsf2oQ@mail.gmail.com>
X-Gm-Features: AaiRm510za3zndD0inGMLCEH7QG-m8mCRLz97beAHEtvRk_6T0tZrIsQM9QjFTA
Message-ID: <CAD++jL=6e-gRMMXBUV0OqdDu0BAsiXmch1mROZJ8VxnSCsf2oQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: convert fsl,imx27-pinctrl.txt
 to YAML
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32116-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC5521842D9
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:00=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert fsl,imx27-pinctrl.txt to YAML format.
>
> Additional changes:
> - Add the compatible string "fsl,imx1-iomuxc".
> - Add gpio@... child nodes.
> - Add ranges property.
> - Remove the redundant intermediate node between pinmux and group nodes.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This patch (1/4) applied to the pinctrl tree.

Yours,
Linus Walleij

