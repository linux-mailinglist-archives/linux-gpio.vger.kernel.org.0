Return-Path: <linux-gpio+bounces-30552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4140D1F48C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 055693059913
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 14:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A1029D27A;
	Wed, 14 Jan 2026 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZWfpto9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85430231A3B;
	Wed, 14 Jan 2026 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399234; cv=none; b=V+kRZMu4R4kKnuAhtLRAZMR7aHPTYCRhOLFwCbFFg93dPCb+pJ8+VT2xFkJ8p3Sc2STwf98xVma3YJ95TPkKsgZ6WJl25tW8efYELRLqea1UTprvhUe0parW1rXnOJOYeZK+BcsAE+xDar6Yizpgq0yU4cnVxZdbf019uQ6dNVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399234; c=relaxed/simple;
	bh=2HymxH9qqUs8MT5fLN7/dIyVqcs6A7wLAkkU08CvOF0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bqEy1Ap0+wkzb2D6qawAmY6OdwED5qTdz71xZJiyMZc1mhK8Sof+GSlCZTCcsV9uUZguqKKJKRhzKY1WhgNmUSp97huCya1VkuOyn3BL7afrcWETtdNDC9KC2jJVtth7PHL4+tAuxV0DAkkkKfP8Ve0z7TNo5s78fwJyY9ozBHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZWfpto9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA27C4CEF7;
	Wed, 14 Jan 2026 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399234;
	bh=2HymxH9qqUs8MT5fLN7/dIyVqcs6A7wLAkkU08CvOF0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FZWfpto93vCLBPKHjtYMQqVR88gm55Y0G+wmGC7etSKwgxmVSQ9Fw2N0P8spMAstD
	 e3yptJmNuXfU+wOKqoyKucv/asDpqU0IAE8OfRhRUS10/Sc/I1EOTuSfhzuL9v7jFi
	 BWY3g8+92v2hA09hvQazDEwlGp0BfJqIG9qCISwF9NIg6kvmDTWbdUqwOwW0WnV+4E
	 t/sN5cPD/nKbfAhScWS/mEnQ6CnW586rw6LU5LIR/GZQJ0Gmh6syWAbDBxYD1fuWYF
	 iokDJp3/HP+7X0tRgtoVBs2PZkdVDJP7hCvuNnlbE+I1+vzNbVbO88iWfq9nRCjF73
	 DpWHyLavJZj0A==
From: Thomas Gleixner <tglx@kernel.org>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Saravana
 Kannan <saravanak@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 3/8] irqchip/ls-extirq: Use for_each_of_imap_item
 iterator
In-Reply-To: <20260114093938.1089936-4-herve.codina@bootlin.com>
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
 <20260114093938.1089936-4-herve.codina@bootlin.com>
Date: Wed, 14 Jan 2026 15:00:30 +0100
Message-ID: <87cy3ci9a9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 14 2026 at 10:39, Herve Codina wrote:
> The ls-extirq driver parses the interrupt-map property. It does it using
> open code.
>
> Recently for_each_of_imap_item iterator has been introduce to help
> drivers in this parsing.
>
> Convert the ls-extirq driver to use the for_each_of_imap_item
> iterator instead of open code.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Thomas Gleixner <tglx@kernel.org>

