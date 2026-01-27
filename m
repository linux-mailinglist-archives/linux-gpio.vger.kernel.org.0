Return-Path: <linux-gpio+bounces-31186-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMZOLFY5eWkZwAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31186-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 23:16:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E779AF44
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 23:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 813513013A94
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 22:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC289356A3A;
	Tue, 27 Jan 2026 22:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RR2aHX7p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF84D276028
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 22:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552210; cv=none; b=SckJa3oJauzsUc1do4xNKkHj5+wJ2HT8fL+ttOX7OPQYDLH+mXNNQIZSV5XPdvgB0YPo0JjBQboSQCJ8a8hNmEBwuY02j96OL/MOb+uaPs+GkXtpZbA78pTLZcOdt8Xz9f696XYdtmjKAkm3i1WspaDNp1iWx63OViUaMdRX3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552210; c=relaxed/simple;
	bh=STl2Nd+8C8kVbSoxZDbbBr4CfdlYXAHmLXHpMVDXU2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGbG3WXCJRsZmjIcJKxjPAGL2bPldkdiCaF1+ddha2DKEiHBv4fnXCV3Yhz0AMr7wj4sYY094OVF+wX+FBkUnex6saWYdRqoUyTWA5T1PQKMMoXPAdLyRlhM93Vpxq3fwbTi++KKp8mwalx1/Eqgzrcl6ZhP10oV6ck25HlEiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RR2aHX7p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59771C4AF0C
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 22:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769552210;
	bh=STl2Nd+8C8kVbSoxZDbbBr4CfdlYXAHmLXHpMVDXU2A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RR2aHX7paHubKnV6HtXKbhKp+T/UGREZ5/MfYOmf3/8P7Ty0DoLwWcZiICLAEWxxg
	 qZuojRBOkV/S8RZDU2SQ0+vifFnSOVDJVx24L9GyE+Vyc893J/fFHI76LZDP8ePbxZ
	 ZkNIcHpZ+2yxbRwam9XStiuYF1CtKJVShO1H65LQmWfEr/Aq/tSTQYX+tmWNpqZG8f
	 8ml5/7ucLM1isP4nKNsM8+cCDB5fCTDpjvDsJPqTSiDDHSNTlW99UzInq/cab80nSL
	 5X/2QD6IpTkpN3S0nYZ/JfKdLXzIBf+SviQQBAiOuZQlyUVLD5xAvfZKnTjaut3k6k
	 8q3CL6DDDvKkA==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6496804204cso3367934d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 14:16:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5OEuuM4uQ7+eu2CbwSyRj8Cnn3unfHtbAl+SoDghFapZ7OOV+lzlOtc/rLUt2T8xCkec3LfH1jHF3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/q6DIsWKkZYDNAHZdf4iS3b4l4pdnngCL59WpzAX9yc5E6HC2
	4kKogdg1O4JHC5C0a3vBWXdEBlvzZvsaemAU41ZBq/SJb39V20qFD1h3+E9PseXo0/XN+M+hOYM
	3LFOajXGYhZYQutPIFtkVTxvRdMYxw5k=
X-Received: by 2002:a05:690e:e85:b0:645:556b:62a4 with SMTP id
 956f58d0204a3-6498fbd9503mr2445332d50.7.1769552209753; Tue, 27 Jan 2026
 14:16:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127214656.447333-1-florian.fainelli@broadcom.com> <20260127214656.447333-3-florian.fainelli@broadcom.com>
In-Reply-To: <20260127214656.447333-3-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 23:16:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkCnWkuq8Sg6Jf_t1euYLN0PXtdmtQTFib6Cu--PAhPqw@mail.gmail.com>
X-Gm-Features: AZwV_QjcX6Fq1BTf-DABgaLxE6ntCk6R2jLgUlhkHKHsGn9r4S8GfIZgM1YdP_A
Message-ID: <CAD++jLkCnWkuq8Sg6Jf_t1euYLN0PXtdmtQTFib6Cu--PAhPqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: brcmstb: implement irq_mask_ack
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31186-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E3E779AF44
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:47=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> From: Doug Berger <opendmb@gmail.com>
>
> The irq_mask_ack operation is slightly more efficient than doing
> irq_mask and irq_ack separately.
>
> More importantly for this driver it bypasses the check of
> irqd_irq_masked ensuring a previously masked but still active
> interrupt gets remasked if unmasked at the hardware level. This
> allows the driver to more efficiently unmask the wake capable
> interrupts when quiescing without needing to enable the irqs
> individually to clear the irqd_irq_masked state.
>
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> Co-developed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

