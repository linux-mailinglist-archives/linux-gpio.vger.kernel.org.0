Return-Path: <linux-gpio+bounces-34917-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOQ3JStb12lqMwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34917-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:54:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1D23C7516
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78CC73022F43
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 07:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1907538736A;
	Thu,  9 Apr 2026 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cI32OPlg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7E386551
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721246; cv=none; b=Z76EV2jOepmwbatW8QIFuQF5oP6oJc2uMPlPNAZw4+t3DIHBT5R1bqRDLqfz2xapMhDhS9xQRBPNiQ6/vSQ9VCHQt0GhP+FnIvfP2Y+IIXhn9DxacIHO/SD0yorrFtXjaN6xJ2GVgRAcePew8b6QeCUUwdYU8fzu/BX00jvfwtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721246; c=relaxed/simple;
	bh=LDxskAvYrLlYziQ4oEdOKyB1Dc3CMk6QXtnDVYQnjhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mtaYOxR7YPVx7eAxI3s7PXy03tGRC80epv8lgFUG7Vev//C9uZY0wsAximI1EZMan5zaqOZEikXimhHfu73cwjgRfAsaIRyTJm4E55bqVGyFenump3FacQWRS5pH2QNGPgX5t2ZfWpM1fLACXiQZfRE8AzpKELfDGf0hKD+7oBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cI32OPlg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F49CC4CEF7
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775721246;
	bh=LDxskAvYrLlYziQ4oEdOKyB1Dc3CMk6QXtnDVYQnjhc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cI32OPlgsfSr+M0gTmcA4n4yh8lcNLgtrKlIY1qvG8vL6ntbJrpxELZQbvijDQRgu
	 ybQGMEow4G+KcDn4VO+ZLOBB7spEzGO16L438nc837E7RKuMQjYNAwziXw8L2RIYAE
	 n9jaBLAFJSvi76gfEewiNAbJWvVqembfhU6NFFzuwdi1GRF3GL2kmoybm89coD8KZ5
	 Hp8HYxBPfZPbFZ1IxthbuRxuCm/XqPvlT9NshmbAPFt7o+FmNk2TcmXfRST5UEfTNc
	 1Wbw0IOmnawNK6gihNlP2Bo4moALR6JJ8AZqDERt9vRlpVAdZm3Ko6FeyxDNaWd4nS
	 cNi/afteNq9+Q==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-794719afcd4so6505437b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 00:54:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGVtZ+frTZY8GGHe/qa/SrI4i1cGaQUrNt5QgngH2bdmMymuiv9nqIG5nw0yYbA9H/bto+KRU3kG4T@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv6ymIybvR4bCh8tg/mt4sd9CIIdg4rdtiIDDstwu4WFGd+dI7
	FzOhVpBJbXtyILMsBCGLXlLOgACe9EzOUVipYfE+b5mflrSYEkDfz4zw5eDXw82Qg/nWtNAYd7u
	XB6ycvk1ujYiFtvdq3CYZWbAPa7cCoOE=
X-Received: by 2002:a05:690c:83:b0:79e:9cc1:edf7 with SMTP id
 00721157ae682-7a4d35d7d6fmr226490547b3.13.1775721245929; Thu, 09 Apr 2026
 00:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com> <20260407184805.807328-2-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260407184805.807328-2-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 09:53:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLnzitRAczNRiqiBBbytqVjccSVUAXre9YfQgqC=dzE-Yw@mail.gmail.com>
X-Gm-Features: AQROBzBRjTq-qScoacgRL1SZl9sFJult8v_deA_uRg6K4Fdrkxvg3spSEcpI2v8
Message-ID: <CAD++jLnzitRAczNRiqiBBbytqVjccSVUAXre9YfQgqC=dzE-Yw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] gpio: generic: add a generic register wrapper for
 MMIO and PMIO
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34917-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3E1D23C7516
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jose,

thanks for your patch!

On Tue, Apr 7, 2026 at 8:49=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> For adding support to port-mapped devices within gpio_generic_chip, a new
> data type is required for passing to read_reg() and write_reg()
> callbacks as I/O port-mapped and memory-mapped registers use different
> data types.
>
> Introduce a new struct gpio_chip_reg to encapsulate mmio addresses and
> I/O port numbers.
>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>

Overall this is just fine, but I have one idea:

> +struct gpio_chip_reg {
> +       void __iomem *mmio;
> +       unsigned long port;
> +};

Since you're always using one or the other, can we use a union?

union gpio_chip_reg {
    void __iomem *mmio;
    unsigned long port;
};

This way it will use the same amount of memory no matter which version is
used.

OK it's a micro-optimization but also elegant because it reflects the fact =
that
we just use one or the other.

Yours,
Linus Walleij

