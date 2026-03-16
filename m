Return-Path: <linux-gpio+bounces-33476-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFN4GZrMt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33476-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:25:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDBF296F09
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 518CA305B952
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DFF386578;
	Mon, 16 Mar 2026 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SleYnbi/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8288257423
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652985; cv=none; b=sSJnGPJL5bpSUfI2jP6xZvtmU0kX/+ltgIRQ+SaPzfvu9yxAE6ghrd5IOHXry+gpS7TCCW3puw84/vyGt5wNdK2Oy9IPqq5mZ9LOXtoISauqxBX/FATWt8Vl4HUAy2tsU9R6sAMMQSTQ7TfX5BaQprGYpdD74fnRrWiYH7q5GcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652985; c=relaxed/simple;
	bh=CXwq61eCW8OQANPCe0R/0xUepW7dY/FJ69RCGzSfjPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPp+yTQhZBXiQXVi26nQnqoK6nan6CykSsv6k3vKgw9QqjU9Qajk3O2M+7hoKHAgaDg9NIq83KFCcTB0fK4/f7cKTk+Z33Rzn9i5q4ABYl33vvbVNA78yN5hPHiKcXpRXSkt0hv60CwigyZRMzPUa4rpB3fBM2FXX+DpNUmJwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SleYnbi/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F375C2BCB4
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773652985;
	bh=CXwq61eCW8OQANPCe0R/0xUepW7dY/FJ69RCGzSfjPQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SleYnbi/ecxqTTgn5KrQayVfTbG8Dch/P6xF99MU2d27Wp+D8iKIpiGTswJwe3fjb
	 FcQceNY1Q0I8THExNLtRmrNED+pJcRguBh2HXzplUyWf10Ru+nS7fkOxfTB1qvhKFa
	 364DewCMLU3JpStfBRPz4L9Pi3Pxt0oB+fmvseuy+8bg7vVGlXupAY0WY9xcfFYgT4
	 Z4CEtpkikmgZSc9O7eVfqzfupgFldSaGRYVMbz8h+RJTfq32/xDUW3wVRADf/iflhg
	 8UcS5yv0Q+SKIWWb9ZG1yYnmwxl5/16eOviY1lbtOohzE0p3iDLFVFGmQOp1Xni8T+
	 x5VRApFFjdVjw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79881805788so43416467b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:23:05 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxtg/MM79h4uVBl8GGYnxiCso83gJQVo0gkEYOE6NYo6UEQOOKx
	Cncy0/ua0+Oee3A0IEuOwsI9u8u23gORL4EMlrPJMYk0rcwOnBRG3TS9gygaFHxTld/yQJ5vy6+
	RvW7gkxukYGYHXuRsJsrhMcO+A7C+gYY=
X-Received: by 2002:a05:690c:60c7:b0:79a:56bc:2460 with SMTP id
 00721157ae682-79a56bc2946mr8149877b3.47.1773652984799; Mon, 16 Mar 2026
 02:23:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-mandolin-sprang-9b9bee9f5a04@spud>
In-Reply-To: <20260311-mandolin-sprang-9b9bee9f5a04@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:22:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLmAs_ecxHr-a7859_W7mf47RrQX_=rODc-AGE9y5o5irg@mail.gmail.com>
X-Gm-Features: AaiRm51N3JjKcics2-A_MeXZH9ngXp4_MtFwMOi7Ck6Nc1P9cY9ClvFsLjivCoY
Message-ID: <CAD++jLmAs_ecxHr-a7859_W7mf47RrQX_=rODc-AGE9y5o5irg@mail.gmail.com>
Subject: Re: [PATCH v12 1/4] gpio: mpfs: Add interrupt support
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33476-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFDBF296F09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 4:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add support for interrupts to the PolarFire SoC GPIO driver. Each GPIO
> has an independent interrupt that is wired to an interrupt mux that sits
> between the controllers and the PLIC. The SoC has more GPIO lines than
> connections from the mux to the PLIC, so some GPIOs must share PLIC
> interrupts. The configuration is not static and is set at runtime,
> conventionally by the platform's firmware. CoreGPIO, the version
> intended for use in the FPGA fabric has two interrupt output ports, one
> is IO_NUM bits wide, as is used in the hardened cores, and the other is
> a single bit with all lines ORed together.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

It's a beauty.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

