Return-Path: <linux-gpio+bounces-30224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4149CFE4D7
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 15:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0601E304E176
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 14:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100CC33985E;
	Wed,  7 Jan 2026 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxpUqBSC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3048339856
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795212; cv=none; b=kQBUAKS6j0bdU9THU7SDH7Ms+lTpCeZJwP7UzCiPo7aUKDAeijDcxh9wwEAGL9ZB4Opn9Q177PSMTCpItBbElA6nejPDZJX/d3dHc2ls7c4APYL4ypvnckHRCVvT8plqfA5zl3YP7Uso6NoWJR4oUhEzGfbJE9zIquPr6jAUEJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795212; c=relaxed/simple;
	bh=vPUhQO/bJfTutZapkC7lSFc2q9gKbGxYafUo+Xs/Plc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzA5C2/q1jJrX3QLcFd3fz8QwHG2YQ53Fq2qryGQNOOUCUKV20ep4UliRsbY3CGBx/eeq1NA4FigChBWSreKHVLnbPt9uK+G2l8EOzWQdsaUMl0S3QF4AcQJRpxj4k2t/F08e9jwBb8ZjNemuoWNKOlSvHK7faxFf5QVW3rD2Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxpUqBSC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADC9C2BCAF
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795211;
	bh=vPUhQO/bJfTutZapkC7lSFc2q9gKbGxYafUo+Xs/Plc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LxpUqBSCaEAFNHV6ZR13Wn3sVba/mylY/cSyRWIVNUjJyQ/RoL2O7Frk4XVnmTaI6
	 vpd/fm7mnx9aKY8DUWFStsaVx96N3/iN7XssR5fP01+onZCKHcsqc59yZblqX9pgV4
	 Xex8vwgsTKZ3+SE9L71+KngoiVZDI22HXt12ahm2rPXifUB8KukHkK5H2stkGnlQQz
	 +FyfSWpuD9PRg78RPTSKUxL8KPaFOEICqu1pGmm7sYCQbyJ/EfmiLFvmft1A4YMDzM
	 nO4jM4arQQtOSNxk9ykJ3we4r3oSkwD95uoSJNoq8dXTHJb+akI9ZpTQyCGGtUdjrF
	 7D7vZG0+yHHTQ==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fd0cd23faso22240407b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 06:13:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVE2n50N9DEl0BM0yXTkdHToDKz34qCl0p++v1O+D5WF+AEcm5TbdO+sJ+gdlPDEjXGKg68PIYDHTHg@vger.kernel.org
X-Gm-Message-State: AOJu0YyBb2x1XSzZaDLde699bTcp4glnisg8p38bvQ2lgB+r0PdVNjOm
	7qyEgrc21CSHYNIImGSUpPbvfq1IA4RNd06hiDUMRkoK9wfgrgF5ScPU2IhOnhZAEoZ/OzRJ75+
	c8zMDaULEuOqy3dgCDXydiiLH/Msfq4M=
X-Google-Smtp-Source: AGHT+IFpGRYBSvGge8PYFsRHSqJMEhcXggZW3h16GPs6+Lt8GMfLw75OX8+1p8hq0kvPo80jSxwj1LTh08lAgBDlaLw=
X-Received: by 2002:a05:690e:1248:b0:645:581a:df8c with SMTP id
 956f58d0204a3-64716c4dfb6mr2253264d50.91.1767795210728; Wed, 07 Jan 2026
 06:13:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251225103616.3203473-1-wens@kernel.org> <20251225103616.3203473-3-wens@kernel.org>
In-Reply-To: <20251225103616.3203473-3-wens@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:13:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLku5_fyDXw+uJ8Gj_1nQxjq8egOh60X1ARGC5dmFAcV+g@mail.gmail.com>
X-Gm-Features: AQt7F2rAHH3lL_5LalTawPfcgjclmbR9cTZKvz98Rqt4039YJlca5QQ3lCXU-dQ
Message-ID: <CAD++jLku5_fyDXw+uJ8Gj_1nQxjq8egOh60X1ARGC5dmFAcV+g@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern
 with leading numbers
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 25, 2025 at 11:36=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:

> The pattern for pinmux node names is typically the peripheral name and
> instance number, followed by pingroup name if there are multiple options.
>
> Normally the instance number is directly appended to the peripheral
> name, like "mmc0" or "i2c2". But if the peripheral name ends with a
> number, then it becomes confusing.
>
> On the A20, the PS2 interface controller has two instances. This
> produces pinmux node names like "ps2-0-pins". Make the sub-pattern
> "[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
> name.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

This patch 2/4 applied to the pin control tree.

Yours,
Linus Walleij

