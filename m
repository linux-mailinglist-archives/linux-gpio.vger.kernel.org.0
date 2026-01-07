Return-Path: <linux-gpio+bounces-30223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA9BCFE333
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 15:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D72F9300AB1F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 14:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD9B32D7CC;
	Wed,  7 Jan 2026 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSajJKcO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B2532B996
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794972; cv=none; b=tKrWtzQum5Dt2qr1zSsl2v179a03XLJoaRQ8P4m0GlCCYCTQsGu6GbRpHGB3ZX68Sj1hHmxwArI8bvmhAGz236eudcmSLfDgtnTUk4fk44sWZZsb9wJnpQ4ZXDic8QlikYD55HUV5Yz4n5viFx2J/NQgsi4RQVZLDQqN++hpaH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794972; c=relaxed/simple;
	bh=o+CRaV666z5N98g0zrWQ+oTRAL2ghObwdkDLLmds+mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ag5MMFz/cW7cg142XwmEQOpRokGTlWKetrD6VN8/tLcs/4Po6MBF44i1VQxFi3ZC6XjM4dLDdR5qVwEVP9lV6qbEDAWeXkNEFRIR0tQ7EwjETE95BjBfahhiO9pIiB6prr9YqpG7gJhh1bGUeK1rQhqGEm8+m8hzmT4AymR1KJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSajJKcO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC30EC19425
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767794971;
	bh=o+CRaV666z5N98g0zrWQ+oTRAL2ghObwdkDLLmds+mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hSajJKcOHxA8J5Y0wAn05skwFxXmnX4EYWVGWxLetipW/3So/QjOUsrVfCobcyfwB
	 MsUA2uZES7hihVEBI/gpQxUHjC1ZawOY20DzGGNujd3hTZyFMW1CWIkNzdETQxa2qN
	 OtKMEHq/giDxmSqitcttA+62toeQxlHSXWbaaw9GBIsdDYi8hhJHCt3FdauvGNGifi
	 jJc3nNM59kg5vX7WsDlYCyARecgNC6uNscYHz4Xl8kfwwH5mdGFy8imG/Pt6uIJywb
	 n4LwAtIeFgQfo9GuR1JXitvV94AUQ5e2M4CFGZJ1XsAITf29zo5o+W7UjDlUJ3+AHM
	 U75/l7g7EbQsQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79088484065so23858247b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 06:09:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhJt2mjgdN6zkh0zXIZpInOItlPf1sf4oP2BO/dvdZU0kr906SDfhK6Fb1ueurE1ZqmycBDlsUB1Kp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+F5XRRD8gbm9kJLng0Nq2jzlaQh2ZvlIK0lI600LNFRvpNPi
	Fp5koLhOgYvoQxB3Xw3Cf48/9GXRu365QY3zWlQiQxa9eVtpv4B4PpfIm2bX9swAWn6zuW86+vM
	JaQkMsqhcbSyCB+Cq0gDOhUBSqSFU+oM=
X-Google-Smtp-Source: AGHT+IGVJM9u88lYk0P1zu24w+D9Abmp3Tgpsp7039pR3VGD21RawjWoaVZAeFtTaqSswOj71vp7ze28kyoqG0dQd7Y=
X-Received: by 2002:a05:690c:4910:b0:78f:bede:57c0 with SMTP id
 00721157ae682-790b5758118mr54075567b3.23.1767794970275; Wed, 07 Jan 2026
 06:09:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
In-Reply-To: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:09:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=9n98C-awde_ZQ_OmfDUsbmcNsgJcTfcwsYghgMZHqmw@mail.gmail.com>
X-Gm-Features: AQt7F2prYO2wsLFjbT7JVZq2qxObPCjIw8OX61DKF7WP4Vo2QsoGwU2QDnedbJ0
Message-ID: <CAD++jL=9n98C-awde_ZQ_OmfDUsbmcNsgJcTfcwsYghgMZHqmw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: spacemit: add support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 8:01=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> This series attempt to add pinctrl support for SpacemiT K3 SoC,
>
> I've removed the RFC tag as the driver is tested on K3 SoC.

Patches applied for Linux v7.0!

Thanks for your nice work.

Yours,
Linus Walleij

