Return-Path: <linux-gpio+bounces-30749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A38D3BC12
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 00:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8545D302A797
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 23:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B845C29DB64;
	Mon, 19 Jan 2026 23:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1fRNObD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A019287511
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 23:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768866736; cv=none; b=ZRr43pgLsSXcQ7FRaBJf304UdrRr8gfptBAVt6mWS0lmZ27sIxZf/vNjhw0qKvHx45KzlUIdixQXg7fKk355Rv0OEQA0XjOdjst8YJZNsNN1ghHn3QnvfQRs7J2bGQBLpdoL99n6SXVrM9c4xsknwbKYelZjJ5irvfYQMkzq2ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768866736; c=relaxed/simple;
	bh=oEUu9/PDf523PRaQvLKq/iXwr4E9yKFjaIG8HW8PyjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYDadjMCwLLd0NRD4B3uPZlnjwhEd9bJ9FV47pW7Xd++dTSKTc+MMqvbWkRbfqukUQarOFObAlG5LAMweNzJegZrZ7lQF4aJV4rC1jCfGH3mbt0gGDX9lNdu3f33IFMVC/MB4x9gNFfkKUI8tNMyoppy01IACneId4CRC1ysOxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1fRNObD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA52C116C6
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 23:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768866736;
	bh=oEUu9/PDf523PRaQvLKq/iXwr4E9yKFjaIG8HW8PyjA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p1fRNObD1fayH8hVIj8ARBKin7GncYXFtALKlfE99kRfDWhzb498K1nNL5Dfwj1kQ
	 NC/3A0TQnWp9yzRURdIbLil3TnHKexA5uocZYaxRDjPQzUPSNqxnTpi7hQ226mRI4v
	 TqCxUjz46PIi9IW9Wzj1xZ725hPrDY36RfJuidS3i9Xp88PentbwSaJshAdYkZiYp5
	 cC1EyjzmIqdVIcANdtvrfhfeGuebPY5qn5doAJ5Dw0cFikX2oJtr6GxEaKvHCUMQfj
	 NEkxZVnOs8epjbE7lsc3hfEIwHflA1mpUZUxS1h8VFhjldioE1n/wWypMRo7od0qOq
	 94g+cnCfEBMgA==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6447743ce90so4160045d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 15:52:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUS6fAfI78tAH1hcCd5Lgvxnv5X4KXpBw7BIcAOIih5b0yodb9p7GHOjfsMl2vSeOrqtQA+IiwS3cXW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+78itcXv4qDp6wupyIkQVYoR9mW0zd0VEW56nrbczsoBWdz3J
	Du8//RcfsPEG1Uqwz8LwNoZ0jfqvEwdd0N+tUhrfYgnFByqRzZnfKwhLF7Q7GLL5gMZG78q4UHS
	mUGDtcVS9tNPK/Y/cSmMQ7NElhYFD6bs=
X-Received: by 2002:a05:690e:190b:b0:640:cc09:b7c8 with SMTP id
 956f58d0204a3-6493c7f3a3fmr116732d50.23.1768866735546; Mon, 19 Jan 2026
 15:52:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Jan 2026 00:52:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLnM=1iyb0-=Jzqq+jPKtSvR+dbb1w8BNNcr+evdQFg4Eg@mail.gmail.com>
X-Gm-Features: AZwV_QgGDEeGRtBiw30NZCmvNLT-lDgyzgro6X2hF8bkv_0hnJ5tDvF5IEFLosE
Message-ID: <CAD++jLnM=1iyb0-=Jzqq+jPKtSvR+dbb1w8BNNcr+evdQFg4Eg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: spacemit: support I/O power domain configuration
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 7:43=E2=80=AFAM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:

> This series adds support for configuring IO power domain voltage for
> dual-voltage GPIO banks on the Spacemit K1 SoC.
>
> On K1, IO domain power control registers determine whether a GPIO bank
> operates at 1.8V or 3.3V. These registers default to 3.3V operation,
> which may lead to functional failures when GPIO banks are externally
> supplied with 1.8V but internally remain configured for 3.3V.
>
> The IO power domain registers are implemented as secure registers and
> require an explicit unlock sequence via the AIB Secure Access Register
> (ASAR), located in the APBC register space.
>
> This series ensures that pin voltage configuration correctly reflects
> hardware requirements.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Excellent work in this patch series Troy!

> Troy Mitchell (3):
>       dt-bindings: pinctrl: spacemit: add syscon property
>       pinctrl: spacemit: support I/O power domain configuration

These two patches applied to the pin control tree.

>       riscv: dts: spacemit: modify pinctrl node in dtsi

Please funnel this one through the SoC tree.

Yours,
Linus Walleij

