Return-Path: <linux-gpio+bounces-36707-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGsYA2wpBGrfEwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36707-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:34:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD99952EB42
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 742FA30556DA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 07:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8303D4104;
	Wed, 13 May 2026 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5bkXS9+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612573D1A8A
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657630; cv=none; b=jHH1CLRXVIca/EZh9lTsRmm9zvZieKVhGSLaO9xReqedfQWOCIVKKzaM9FhYGCNK0vKQgGqtUOMhcDpmvDfICcNfsEgY2LsHr58Ox6yHin0XtPy0CAPDLWi907cdKOE8bh/7uZHdwr3NJJ9sujKelFjJxeMc0Vt7/++znvX4xWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657630; c=relaxed/simple;
	bh=Ijd/gSE0b2T0jw3EuQM4uYtgoWg2GppWrAZF8jwUcvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3iyOlETDJ/3zGglFIPHT8TFwMvxfsCeWzIZM/JDclIc06ZOqkImvkox8JVQJnPeP2AG1K5KP+8WQp0Uu6icTDAZX186nypGoD5EiG0zSff2PnsWnzEflFJBZeeW8FCfgKuyqJpkiR7+vXu5W++BPkfUrgWoBW1KXrBtvfUjAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5bkXS9+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A91C4AF09
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778657630;
	bh=Ijd/gSE0b2T0jw3EuQM4uYtgoWg2GppWrAZF8jwUcvM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q5bkXS9+KMDF3rxNQeqLI0lcn9kK6zvj8bruGREtL9tK3VYPzLrxdJu6JUf0X+KCL
	 34oh0OIn37B/nacf0h/KapZbC7oFokvO5eZUUWC+wKHq/FkYie9Eqt/r4LFbjxT76D
	 y/QeHPJEZsCbl4OEOnIUVcj3A6Heb97gxr5p0sYz5bYHG62KBBJXRtryOfwqn0oSkC
	 HwnBQrXi/rJFiIte3Gr96Vj4+uR4ABQKW7zNmx8I0cfLjJkBOtxgY1chP7aBIciQ9i
	 e0PhQqd/yiu9Jv70vtdbJ63x2ybEEtUAtqq0MLFWJpGe50BppE9qxWrZdNd6roHJE3
	 yLqvOoghTLySA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso8286829e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 00:33:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YwN3qP6fYXO6Ql1UWX5XQH0Cq2ExsGUOH+F/nmhe98yC09gA/dR
	478LxiUfHTTZ5BsH2Xee7aI5jLLmy47s1MRMMdTFor6bYBZT5v9cn3eAWhoQtpe6eBaE4urN+yi
	eAJOMvTx73R51gD19bL1mBPvvTw59QOU=
X-Received: by 2002:a05:6512:1381:b0:5a4:1914:bae3 with SMTP id
 2adb3069b0e04-5a8f39c57f6mr505818e87.27.1778657628631; Wed, 13 May 2026
 00:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512073139.16343-1-hardikprakash.official@gmail.com> <20260512073139.16343-2-hardikprakash.official@gmail.com>
In-Reply-To: <20260512073139.16343-2-hardikprakash.official@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 13 May 2026 09:33:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=WHSkEEQ7Re-cUd1DyxiTcY5nWcgCZNoLXzCNR3a6__w@mail.gmail.com>
X-Gm-Features: AVHnY4I7enQ-ebICTz1gL9CcjQuVuy3DErs9Xji14SuYzx5B-COKVxCI9xul0vE
Message-ID: <CAD++jL=WHSkEEQ7Re-cUd1DyxiTcY5nWcgCZNoLXzCNR3a6__w@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl-amd: enable IRQ for WACF2200 touchscreen on
 Lenovo Yoga 7 14AGP11
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linus.walleij@linaro.org, wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AD99952EB42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36707-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 9:32=E2=80=AFAM Hardik Prakash
<hardikprakash.official@gmail.com> wrote:

> On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen controller
> is wired via I2C2 (AMDI0010:02) with its interrupt on GPIO pin 157
> (confirmed via ACPI _CRS GpioInt decode). After amd_gpio_irq_init()
> clears all GPIO interrupts at boot, pin 157 is never re-enabled,
> preventing the touchscreen from signalling the driver.
>
> Windows keeps GPIO 157 INTERRUPT_ENABLE (bit 11) and INTERRUPT_MASK
> (bit 12) set after initialisation. Add a DMI quirk to restore these
> bits after amd_gpio_irq_init() on this hardware.
>
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>

This patch 1/2 applied to the pinctrl fixes for v7.1.

Thanks Hardik & Andy!

Yours,
Linus Walleij

