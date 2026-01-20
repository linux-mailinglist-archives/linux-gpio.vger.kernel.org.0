Return-Path: <linux-gpio+bounces-30752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51073D3BCA9
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 01:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB8AB30248B5
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 00:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EAC1DE4E1;
	Tue, 20 Jan 2026 00:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqMPx+nX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02052C9D;
	Tue, 20 Jan 2026 00:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768870551; cv=none; b=pOAjovv/ZMnGcKWtt+gjhSy1Ek3EstshXlQ8HwiC3oRuZVwg8bu+kTxGlDtn3mEmHxqsh5gGKTTSa+NDOobNGJ6Y7k6zM1K47juSYt/7tOi5TY5IVHFuKACEvY40sCuGoLNTz6pvYfheCY6fbEyB7GelStKRlXoxJuwEtJ7nti0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768870551; c=relaxed/simple;
	bh=3zyNL3/FIY+mZyPvQXq5vPT94NxfNQkS1PoIxTMZBA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YnTfqqKkD+V5d6RyBqpP8xlXE1BqVnHQdm5XXbHQ7NK1KgogG6R1oxwBmgWJpyx6EDhrattE+EsNxE2x00UUSdeQUH9go4a5n41ClP4/yhoO1eVSU6fokiO4/5KP4ppMzvf6rErRXLVQkuJmFej2WI7S7KU31Tc7jdu69hzlIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqMPx+nX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FA0C116C6;
	Tue, 20 Jan 2026 00:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768870551;
	bh=3zyNL3/FIY+mZyPvQXq5vPT94NxfNQkS1PoIxTMZBA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CqMPx+nXFdqzgkJ6/BmYEDZpcVNnAvO5jn7K1rupIlY5Cv/86ZB+SvUWtqrgpZsKA
	 VnW6qbamefjAhaxeAhnRQTza2p6u7LW6/6mEpzOPRQ9GQ4juOaUu3Slaz5Bl03BKNH
	 y+cnFZTmhBGHIAK9WbTrJI2tOZi3+39feFbduxJ1oTDGseU6pMOB7eNmn0BqikTRDS
	 xyVH0IVovSY2y+govtmxeFnffnyTJPC9w4EH525aG7KEnURHVKT3pXj8bC357NcoAX
	 VyQl05VvYwe/pKMaySXqnMKl3IVzovf9dBQfHB9rZqrZ1yyM5QVftexV16lFfLVPGf
	 WG+N2N3dNnigQ==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] pinctrl: spacemit: support I/O power domain configuration
Date: Tue, 20 Jan 2026 08:55:44 +0800
Message-ID: <176887046277.13634.6110722428776119722.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 Jan 2026 14:42:37 +0800, Troy Mitchell wrote:
> This series adds support for configuring IO power domain voltage for
> dual-voltage GPIO banks on the Spacemit K1 SoC.
> 
> On K1, IO domain power control registers determine whether a GPIO bank
> operates at 1.8V or 3.3V. These registers default to 3.3V operation,
> which may lead to functional failures when GPIO banks are externally
> supplied with 1.8V but internally remain configured for 3.3V.
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
      https://github.com/spacemit-com/linux/commit/cf54626b0ecce137379d1a8f1e6f0fa5b36d0395

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

