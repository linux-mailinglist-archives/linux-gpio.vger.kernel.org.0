Return-Path: <linux-gpio+bounces-32410-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIZCHUePpmnxRAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32410-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 08:35:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A701EA37E
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 08:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A10CB3047BC3
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 07:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F226375ADC;
	Tue,  3 Mar 2026 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txxjX/mp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B237104C
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772523271; cv=none; b=P4BEZ7A5BGOwUgCTuvhNjqsHLl0XKH1MNhSPyFzqD+4k5W5i6tKspfT3L5K9vwMLD5bAquKXSEtcnoI/w+FX7gk8RgSOKmL+YxXr5HBOfvzDPVK036tXPpVgt4AY82dhgHSrnBH/zEfYnVnmFcxQfNQcHGdFIGaM8ttV4rsJbus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772523271; c=relaxed/simple;
	bh=zVV0NCaniVIFi7GE1AKPE0lpZi3TXQKHW5/CTeMIYLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdVm67Q4Kywm4aN0iPGvnKTq5MTmrCWtpQOr07NUrAa4WNjBk3Pc9k94uktDNyxaDCDI4gX63YJ6uF2x//EVBtyBc/oZpLU8q/SomdvX7KiX7ksWyjno6WF+FPjoJGVYgfSsyRUsIkeXpZVRRrJdKcv8jb+kCnUYzAZzQwpS0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txxjX/mp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA66CC2BCB0
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772523270;
	bh=zVV0NCaniVIFi7GE1AKPE0lpZi3TXQKHW5/CTeMIYLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=txxjX/mp2KJZaqiL9ZJqjgbPH04h1XJX/EGcDCJg/SfMYbHi+LtORX6EwLf/wOWPd
	 w61EpO1clEB7Mx+qQa2v9mMq/h9HkrZea1tXqR0j2HM6d4cRNB/QX8iMLfmq+bd8+9
	 nmMviCRwe4qA9dsb7ZCG01trsrtpYsuCxlcA6O3GRJwN4NB7cD8Vj+2e4/ZyS8krJs
	 4DtUWHHgeB/kp6vpgMy9M3SA7LzT3wz+MiNd4i0FXxDOBpu5xlNBYkWjlpFwcZ4cJW
	 NSbl4X5iGvQ2ABv/ajj7DCUUxNULTql2rkN3R1qaZgzVbYHODvA6CcPbWQoDzzZ1jb
	 AGQP0b6NtY1bQ==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso6492506d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 23:34:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJ00qdnz/qtD0IW9/cWBMaWcPKl8+HkISNgOnaOzlrcd5QXc4f1OYLYmbnKFXaC3j3GwgiP6X2XYQM@vger.kernel.org
X-Gm-Message-State: AOJu0YyNhg0DsJ9N6m3qJU5eDIDfofd3/TYVLmUw0pD4cQyMxrtUWpLM
	V8ivb18Paf4XxjcQtGwY+eoHT+PbhD8nhuaeYBfhiH24LjbbX+FAem/LPZBF4PcnyWNqMaZNG8r
	cCsapbZOE/FMOp5MKTNk6z5CjXTphNxQ=
X-Received: by 2002:a05:690e:4185:b0:64c:cfae:a9ce with SMTP id
 956f58d0204a3-64cedb514ccmr622513d50.7.1772523270130; Mon, 02 Mar 2026
 23:34:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
In-Reply-To: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Mar 2026 08:34:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLmDphb1OP1y+YJeBpwZZ-H-f_oZ836Uv6BtE-iG75-HXg@mail.gmail.com>
X-Gm-Features: AaiRm517uAgxnadmG7vOG2GxR2Wmqlb_Rsg7MADyIUOMfZW6UpQeGpdorSLrOr0
Message-ID: <CAD++jLmDphb1OP1y+YJeBpwZZ-H-f_oZ836Uv6BtE-iG75-HXg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: microchip-mssio: Fix missing return in probe
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E0A701EA37E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32410-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 7:13=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> In mpfs_pinctrl_probe(), when pctrl->regmap fails, it just print out an
> error message without return, which could lead serious errors.
>
> Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij

