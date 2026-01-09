Return-Path: <linux-gpio+bounces-30374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A26D8D0C826
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 00:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E3733038942
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 23:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C9F3382E5;
	Fri,  9 Jan 2026 23:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZB3IzsmX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C05B330B00
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 23:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768000223; cv=none; b=lRnAKdSRTecLHpOA7vREZgsuYhXgch35e4p926EkXffH86+OaKtIuu/mJ2GIhHvZdAqoReg8M0QPPueFXlzwiHSaWo7sZNqrYfWMovY+tRkBCbBik5hFEhdq16Zqk8Mjg8dqH7XKk7NXWDQq8OxaZgJo97LR8uDyuZXAoTNtDgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768000223; c=relaxed/simple;
	bh=pvh5+c9d1qbVeHgj6hfcSp+Pmonb0UmxmVQR5Zl7mpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HL1UKoDLdR/d4KAf6lofeMGTTBMtGDtNJ/RxPwEVzv/nmjzOgZ/f6+E1XaJUJ6uDJ/+HAzyM3zSwRsuJyRq4/CmLWAWEEPIq1oV7mcGSiTFAJgrULLp5nbeNG//CrhfaCAYZJeEYnPeFF9J/RfrDpviVQwMyqM8Vjz/+fGR8Ijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZB3IzsmX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C33C16AAE
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 23:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768000222;
	bh=pvh5+c9d1qbVeHgj6hfcSp+Pmonb0UmxmVQR5Zl7mpw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZB3IzsmXvGdUT+9tN+xTzvMiHwdNmA24gS2pwyftRLpXe52CWVQNCPbLJUejjvBaq
	 3mi0WY1yhAhBAzU/LkUE9n5+K2ugjlI4KZDQGWo/49EplymLEHpmZowcvIVLRuzw0S
	 UXd7KyxKcCJebdFiYJrBoaeC8GU3ID9jl0Q2kSNMevX7fqxxJH8SjEyhBGyx+6cqhN
	 vCdfPQi/fEf4bzOlPVrD/mPosxQE9BTk37wWIqGAl7bVt6cU6fVB6EUNujxzhVkHsJ
	 7glSbYzNeK14il6+/Z7hfdjwZFu9m4YUP3C0IieAdfxboIwI4SBnrWvCAts7+XDon1
	 ULZNjX2NYD6CA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-790b7b3e581so53653087b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 15:10:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7KYrj7bCWgfpZNUxmG2DCKgJHJeHGV+Sy27TMy6a+SYlQE68aNHaI5o8SFEOvpu9DcS/eV0Tv9UlM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2KXNYsFBSwNFJSCyl357gE6wG2jMzQ4j0c54ZPASUydMQKL80
	rlek3FI/oHDlFyzD/uPYdOsstcHQua9accOLHQl59/uJE9yIk21sRbBKo6en/sirL+p3HQBc0jW
	s8/8QUMrHCKBIGbq91Pxxg9kfHOZvkGY=
X-Google-Smtp-Source: AGHT+IFEQO71e4cYNJObSCgFIiqeKEccxRrR8aY+yYr4ri3WGCll3aL6B5arU8gnOcBLuhvTFy39ew8yzQuWGlAloxk=
X-Received: by 2002:a05:690e:1188:b0:641:f5bc:692b with SMTP id
 956f58d0204a3-6470d2f46b7mr12056434d50.36.1768000222173; Fri, 09 Jan 2026
 15:10:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 10 Jan 2026 00:10:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmk3RCf19yPvE0E9X3b+gy0XghQTbmMPfioBkSKkAaLpQ@mail.gmail.com>
X-Gm-Features: AZwV_QjvOySI13iVNOTYfIXgnODwhGbGn87uLlGk8QzCNwneRQXoKJ0Qs0Jx1Ps
Message-ID: <CAD++jLmk3RCf19yPvE0E9X3b+gy0XghQTbmMPfioBkSKkAaLpQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] bus: add stm32 debug bus and coresight support for
 stm32mp1x platforms
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Antonio Borneo <antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gatien,

thanks for your patch series!

On Fri, Jan 9, 2026 at 11:56=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
> can monitor the activity of the cores. Because of that, they can be
> used only if some features in the debug configuration are enabled.
> Else, errors or firewall exceptions can be observed. Similarly to
> the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
> debug-related peripherals access can be assessed at bus level to
> prevent these issues from happening.
>
> The debug configuration can only be accessed by the secure world.
> That means that a service must be implemented in the secure world for
> the kernel to check the firewall configuration. On OpenSTLinux, it is
> done through a Debug access PTA in OP-TEE [1].
> To represent the debug peripherals present on a dedicated debug bus,
> create a debug bus node in the device tree and the associated driver
> that will interact with this PTA.
>
> [1]: https://github.com/OP-TEE/optee_os/pull/7673
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

I think Jens Wiklander wants to have a look at this partch
series, so added him to the To:.

Yours,
Linus Walleij

