Return-Path: <linux-gpio+bounces-36628-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDg+NAVOAmrIqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-36628-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 23:45:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C8A5167A0
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 23:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D835300EC74
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDDD2FFF8F;
	Mon, 11 May 2026 21:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHg8Nx+L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1292B303A1E
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 21:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535918; cv=none; b=paq1bpoBjI2u9IBDKLVEr/SSmxDtT3hoTLJU7KgLPI0PYHQTnNtyOBkYRbbG37CWmHTj2fYKUv4DKeyNvqJwiz02ph4sV+Pl5bUw0lMHjbkEUOK5A3VmfRr4hT8juBmvyBwpGdCu5ym3pVQ0ZqKAz/ddAErynw+Bj3KevJQVdL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535918; c=relaxed/simple;
	bh=4B/ZCp/biIe1DGzm9qgZtA7CMOgmX9FvV3krhd751GU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhsTY7bt7PDzRJjadLY1ldgo1epmvDY/AA00wVtVMvxG2L9TiCfZlE186DUNPp2YWHBkUnDO3cZaAJN3cJp5qOShDXwBhQ6Ol1dQtGRHq30C7UZdOdcI/HbrBM2oU0VuVm9xgG1ckdPVJnvKFHf/nhqNYHvEgAdtudgDfa85pnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHg8Nx+L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B5BC2BCB0
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 21:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778535917;
	bh=4B/ZCp/biIe1DGzm9qgZtA7CMOgmX9FvV3krhd751GU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LHg8Nx+LJE4KRmCRAz/d9AZIN2/QBfSHvRhxbQBoTWjMR5aqmDjbs/+oeGuCe5B3m
	 1ENTjfn6BbjZYCsH/J86CbiqGDrkyRM+qb7s9DQF7+x9wiwzXCZthH24hIfWwFsH92
	 1Ni2OGml5kOhxojJ4t9jYeSLZv8KC5fhu6uQ9oFlzwRibUOVkVKJi+DXI9gHv9Zo+R
	 GXThlv1drL/IWtYIOe1B1tBIpEN9wmKj4cbTLDvukcoTZ8ff+HzUxPCIeSQmUJhPYe
	 5DvoKf/kuz+B8n/UEbYFd1S1+JMTLMIrTHEL32922Y46s6FJQ8hzr9GEbhZvbzCydX
	 9i2cjdDkYAf5w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a865d1547aso5313562e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 14:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ssi1oFjrtYoQPapHmmP1N8sVTU/krlS4p1xa3nJX/aTnQOYwpH/O/Htc9kXG08ud8cP78hvNNfgN7@vger.kernel.org
X-Gm-Message-State: AOJu0YzHIKm3LSn3mSjkyzNt8iCLpT3QoPrC5T9TknZ1zHpHQkqphgKM
	9jZ5A76O9VfE0DhMKr+Ay9Bws+/dp7LCpCuGipgWW+UPtq4zp8bgNc2BXZAXShAwbwQSG2oK2qo
	jm0SS35QlviNDTMBcL4bHIBkIbLkz8Q8=
X-Received: by 2002:a05:6512:1081:b0:5a7:4912:1a50 with SMTP id
 2adb3069b0e04-5a8e0f2ec60mr439424e87.20.1778535916581; Mon, 11 May 2026
 14:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
 <20260511-regmap-gpio-sparse-fixed-dir-v3-2-1429ec453be7@kernel.org> <7907021b-2506-4c04-b379-0ca2d67e8503@riscstar.com>
In-Reply-To: <7907021b-2506-4c04-b379-0ca2d67e8503@riscstar.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 23:45:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLm78ofo3_4Jh=AqARfXjXxKKH=JxfYtkR_OUMW+=26z9Q@mail.gmail.com>
X-Gm-Features: AVHnY4I4rk_iRFa0JKC-N-pBMr-XpbktL_MD_CtANbt35fgRa-2e-WlwKMUGQ58
Message-ID: <CAD++jLm78ofo3_4Jh=AqARfXjXxKKH=JxfYtkR_OUMW+=26z9Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: regmap: Don't set a fixed direction line
To: Alex Elder <elder@riscstar.com>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D1C8A5167A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36628-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,riscstar.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:07=E2=80=AFPM Alex Elder <elder@riscstar.com> wr=
ote:
> On 5/11/26 2:43 PM, Linus Walleij wrote:

> > If a GPIO line has a fixed direction, report an error
> > is a consumer anyway tries to set the direction to
>
> s/is/if/

Ooops hopefully Bartosz can fix when applying if there
are no further issues.

Yours,
Linus Walleij

