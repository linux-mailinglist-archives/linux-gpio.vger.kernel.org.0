Return-Path: <linux-gpio+bounces-33480-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB7lJy/Nt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33480-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:28:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4525296FAB
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 490B3300B8C1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5123876D6;
	Mon, 16 Mar 2026 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="um21Ly8S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF9D38756E
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653280; cv=none; b=EKhORC28tXYYdmi7DPT4Hp31vkQ5czVRTAR9+A2/hsMQeIviDRBpglLWs3K1S9/GJh/f9EgyQZ492fEX4bt4rQ58xt8l6pPAXr/tF49M/sRhQhig+4ey0Ky6M/hoTJAgCmiKTYKDuC7Rf5j3dL3IVzwjaitD3dqhsR5r+XZLteE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653280; c=relaxed/simple;
	bh=O/YgTgaQRwnEXirxmU+ykEQ0yOSJ8I1KRJZXk4GajnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fzx4wpYb6rp8WyP9EAvjIjxmyi3wWj1E1QCyZkyJvhVQup7nx+x57CLogw54TJK+y2D3TPq0n7rDhE/tpa6Zg1kxMxB+G9yix3f+XSxb2BYpo4nzbYZ72fnweYVY35ULa0XqJJlTaTuBTiAfdgpmXfIByXcxaVw65Yr+HQQgEGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=um21Ly8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553E9C19421
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653279;
	bh=O/YgTgaQRwnEXirxmU+ykEQ0yOSJ8I1KRJZXk4GajnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=um21Ly8SseFTJHB6APb8c1vvjnw4Qo3PPBAIuDnbeBrrANm5pl8YoBi7+1xda+Yr+
	 g/SGslQ+inPIVImOKjxIk2VVXTggEuQJPM2ClVZBMiPWSjctuKkXZ8fPHvmZeVgWza
	 jpmtLCvv9bb0CP9lOUVRJWLyr6M8CgYCpeWxI9DfslyABaOd/EkUPnCqngTSPCWfBf
	 r2QG4fFdj8HHPulDlP+wr8sNcQsC8aXhxTeNrKM0p7j3u+qhWLqYpr9hFXWQ5gmd1C
	 G2UtcWVHohy5sFB+9BSFwsOxXKqKAeL8creJrKi3+vPQuCMFfjadxqYEAXLklLOQb7
	 Yae+EasyHNBmA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79801df3e42so54155677b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:27:59 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz52Affnk+4fkRwvkogDiUP6b1QoNOFKwpoDNYnVQXE0iu3NR67
	yQ8krWUT7e+kELs13XCADwzRSwwAdOSmXDrMDaqh8SO6Y6yn8czWhr7FAsDoovC69y6rNDWD1MS
	HoJmP6S3bD3xyn0hBoq9Dq9dXrcse08M=
X-Received: by 2002:a05:690c:c4fa:b0:79a:3be7:81a8 with SMTP id
 00721157ae682-79a3be7b453mr52979097b3.6.1773653278643; Mon, 16 Mar 2026
 02:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-skimming-pummel-6a3e2fc66a9f@spud>
In-Reply-To: <20260311-skimming-pummel-6a3e2fc66a9f@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:27:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLnsToZN7hBYWnxn8NrmhmgWpgmKDvDn=0TKig36TzcOrA@mail.gmail.com>
X-Gm-Features: AaiRm50WpMGGktuAFovbckLRYxycl65oWNTRA0oVNDR_39hckQmaUFp3WcObLzM
Message-ID: <CAD++jLnsToZN7hBYWnxn8NrmhmgWpgmKDvDn=0TKig36TzcOrA@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] riscv: dts: microchip: update mpfs gpio
 interrupts to better match the SoC
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33480-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B4525296FAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 4:18=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> There are 3 GPIO controllers on this SoC, of which:
> - GPIO controller 0 has 14 GPIOs
> - GPIO controller 1 has 24 GPIOs
> - GPIO controller 2 has 32 GPIOs
>
> All GPIOs are capable of generating interrupts, for a total of 70.
> There are only 41 IRQs available however, so a configurable mux is used
> to ensure all GPIOs can be used for interrupt generation.
> 38 of the 41 interrupts are in what the documentation calls "direct
> mode", as they provide an exclusive connection from a GPIO to the PLIC.
> The 3 remaining interrupts are used to mux the interrupts which do not
> have a exclusive connection, one for each GPIO controller.
>
> The mux was overlooked when the bindings and driver were originally
> written for the GPIO controllers on Polarfire SoC, and the interrupts
> property in the GPIO nodes used to try and convey what the mapping was.
> Instead, the mux should be a device in its own right, and the GPIO
> controllers should be connected to it, rather than to the PLIC.
> Now that a binding exists for that mux, fix the inaccurate description
> of the interrupt controller hierarchy.
>
> GPIO controllers 0 and 1 do not have all 32 possible GPIO lines, so
> ngpios needs to be set to match the number of lines/interrupts.
>
> The m100pfsevp has conflicting interrupt mappings for controllers 0 and
> 2, as they cannot both be using an interrupt in "direct mode" at the
> same time, so the default replaces this impossible configuration.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

