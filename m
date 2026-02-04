Return-Path: <linux-gpio+bounces-31425-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD4PJewdg2nWhwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31425-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 11:22:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36276E46F3
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 11:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98CBF301700D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 10:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B893D648C;
	Wed,  4 Feb 2026 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnG4lkqE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC338A9D0
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200547; cv=none; b=NCvP0qnadT5zyzCOm7tYOdyP/uMAl5mfwBeowdyPRdd67H4cWW8oUwozLiMZazj5FS2fDTpC181iaw/hR+w+nwqLxlhHPX1ul2GjXKpg/RSiZ5zHTi8/3CK60rpOheFvVOHcMJgypf5lZhJjDrZPh6dSGT4eEfeSbqFNwcQDkBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200547; c=relaxed/simple;
	bh=0XATEAMeBs1Zx9E6NM3rF6bKiyOXGWYkJI4E2lACtlM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSleS+sq0j8jiYXuNLJYUUFxgpXNrhfvWuTKPBjO9eqaxE8ys4Y8HgiVdMADMydK/UX4Lfo2jg5LCuVleZUwUyHh0FbdnIfKmdwSZ/QNYvdKGcjtLeOGU5KN4SVd4Eu6bcS41N+gSySIMziUhy/7FxHH1xXik1YMo9l0RviUmCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnG4lkqE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318C0C4AF0F
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 10:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770200547;
	bh=0XATEAMeBs1Zx9E6NM3rF6bKiyOXGWYkJI4E2lACtlM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=BnG4lkqEu9ed95d/Iqb3Nrs2IS6pjVNwtvK3qgeFjCTSmrcs5EZgnuRF9r1qhiLUC
	 OczPvUWzUlPHiy2qRX4Z0nJqrLstH/rlFHjjd8PEHgrDE3Ymu4xQsDn4ic+Zc9gi4n
	 4uZ3nkyJXVNvozNQXz1nDpgDB7tn45GHVzjx1AeT1hwfiCX+MwC7+jV3+lloAgwXiV
	 Qs/BgKG/Vmeh6Vi/DNBVfX4MJZhSjHIb/kt3ou1lyTY51OrHPGysYHw6QWMESh6Wub
	 KyrAnWjb2M8I1XcOdOr+AHPO59ROoTMLVtqkC4SpscCLEOcKNaCOY81SQtzVo918rL
	 vecauk9B2LD9A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e17afd2d5so6370198e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 02:22:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHAuaDZeCloQyRyzKO2lTAzoXwcOTg/Plrv75MQrseF0fN6JHZThN4cwKh5RoyzpWDEjk7rp4/gdmb@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxvqNKim/G/IKxdb5wgTRBkgMKbktiunfsV4KGXI69qZyUmX9
	8N0x6S+6U2tfriHbQrM0n8kFWaff8yWVrXtmDWkFhDEI77ASpvK71b8peAFg8p0qimCBbuflS0X
	2rZurcjGnDuNCDBtxK9DEg0FXLA/K3OFA7wmUegSeUw==
X-Received: by 2002:a05:6512:3991:b0:59d:fe49:7f6d with SMTP id
 2adb3069b0e04-59e38c023cbmr1138987e87.5.1770200545799; Wed, 04 Feb 2026
 02:22:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 05:22:24 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 05:22:24 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com> <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
Date: Wed, 4 Feb 2026 05:22:24 -0500
X-Gmail-Original-Message-ID: <CAMRc=Me5WfdQPhW8MSMTRZ=6wm+hKAKEOr_aPLyf=PAKA6_0Qw@mail.gmail.com>
X-Gm-Features: AZwV_QjA-Mb0Chvn876wYAP45YJOzVMz5MdgG_VnrHm1s9EwIRwKYyInNCPAbPM
Message-ID: <CAMRc=Me5WfdQPhW8MSMTRZ=6wm+hKAKEOr_aPLyf=PAKA6_0Qw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31425-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,bootlin.com,kernel.org,pengutronix.de,gmail.com,linux-watchdog.org,roeck-us.net];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,bootlin.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36276E46F3
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 17:21:13 +0100, "Thomas Perrot (Schneider
Electric)" <thomas.perrot@bootlin.com> said:
> Add GPIO driver for the Aaeon SRG-IMX8P embedded controller. This
> driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
> that can be configured as inputs or outputs.
>
> The driver implements proper state management for GPO pins (which are
> output-only) and full direction control for GPIO pins. During probe,
> all pins are reset to a known state (GPOs low, GPIOs as inputs) to
> prevent undefined behavior across system reboots, as the MCU does not
> reset GPIO states on soft reboot.
>
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

