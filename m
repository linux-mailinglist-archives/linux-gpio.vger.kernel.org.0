Return-Path: <linux-gpio+bounces-29425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3594CB44C8
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Dec 2025 00:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FBA2302D5C6
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 23:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFEC2FFF88;
	Wed, 10 Dec 2025 23:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezM1XI72"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB331DF72C
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 23:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765410343; cv=none; b=FbrTCDLdLkOhMIPDFVc55q7/KqzOAHyUO7qov79jAt3onbj7wAkk+YZUw6kIMpcDiqr7znZ5BVPdJd6E6uFwRxOqnakcL8ilm1BuUxRVevEy+FvBfUsRQhH8zEZEGTDYV+QMqkHCNib6DlZD6FO0wbNqVE2MuRRIFy41yCldOFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765410343; c=relaxed/simple;
	bh=HF42HWiCI324GsDSWGrNrq+cMfLqL2KF13nwFnUL2Vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3O46Fuy6GQ7orK256vVWXmtKuAtiq9cz5WPPetWC0loYDlGCBWa9TlfMMCbPvXDBTZXYSr0LnCejCDDHiBY4ByLJKOTelNmj1Nsip7Q/F4aKDHb5RJ6QOgb9Na6LxlGeIaz6NoC8nRdA8qsp+Nl/glFWrYoN3SLH25yHWrE/2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezM1XI72; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908D3C4AF0B
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 23:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765410343;
	bh=HF42HWiCI324GsDSWGrNrq+cMfLqL2KF13nwFnUL2Vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ezM1XI72XFaFJ1c6/EyFn30UIUaFd6K2HKxti8lVFhOUpWOM8PXIWf2FNe7TDYyOz
	 hSVHrsq/zNh47Uv74nsVnarb/sj+LBcVHxbHU1GMG15nbU8pNEiMDiuYqEf/T/8SSx
	 V8MnhQ29zbSUApNYGwApjpfA6wp70lDGSp3FTTggqGn6ulteFu0pq8T3kXTUs9STZi
	 KAXRgm8Voe+AMz/RTUygR+wtS/mJJWLh/RauswIBcBWFFmQxZdUt8zmWsx0Ly1viBg
	 OqeuZ8NOZUDYO/Wo81I9WbnRMgqnE3sfCOpxHsySOCxcVM9tx36r+w2Uhi9yAdk9v4
	 IaLhNmWM5CaMg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78c686aa4f9so3566007b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 15:45:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTnkwY9eBpPrYb3geS6/RMyHhyRUx0dCPFJKDmfZZ79kWGvmytTXP5B49o7EicZ1EktQhjWCEz9Rh/@vger.kernel.org
X-Gm-Message-State: AOJu0YzR0cwQsJiN9uxkzaaNCegmEtQXneRviwhFa37q5yBLqsapNUAV
	HHBupU319PenRcJ20RMeRNK3DYbLPe71sL3IbovAfUVguFJy+EcfelDYiC5j+PN/2qbukIMYpJ1
	YGi3xJqaIll+io7QIXHuW8wymAHBaHJc=
X-Google-Smtp-Source: AGHT+IHu6mB/moS2krcEaW8l5HpAQusE8zC+ia9FhxigsEkptctsTlXdWxt92NBjJgrpbtNpUfMMfrsXr83s8/ptEVE=
X-Received: by 2002:a05:690c:9a0e:b0:786:68da:26d6 with SMTP id
 00721157ae682-78c95a30284mr35149207b3.2.1765410342908; Wed, 10 Dec 2025
 15:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Dec 2025 00:45:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKs8b9X808jwJDmBLvWr0bKoBw8Ku6Xf7XrUB8eUXrmA@mail.gmail.com>
X-Gm-Features: AQt7F2orPEAyNX9tS0S-VYCOLiiLQfh-OmMwhQoomLnhwzgJukPY3XEauYlkSU0
Message-ID: <CAD++jLnKs8b9X808jwJDmBLvWr0bKoBw8Ku6Xf7XrUB8eUXrmA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 4:03=E2=80=AFPM Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:

> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
>
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
>
> Add a GPIO IRQ chip to the pin controller that can be used to configure
> these pins as IRQ lines.
>
> The pin controller places the requested pins into IRQ function,
> disabling GPIO mode. A hierarchical IRQ domain is used to forward other
> functionality to the parent IRQ domain, the ICU. The ICU does level
> translation and then forwards other functionality to the GIC.
>
> Wakeup capability is implemented by placing the entire pin controller on
> the wakeup path if any pins are requested to be wakeup-capable.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

