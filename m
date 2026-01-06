Return-Path: <linux-gpio+bounces-30202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA19BCFA08C
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 19:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBEA630299CE
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 18:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC09358D0A;
	Tue,  6 Jan 2026 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rbXdr+70"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6E5357A50;
	Tue,  6 Jan 2026 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767722227; cv=none; b=kAx4Rfu/qL3DnWdt0d95GwTBoT0YYfd2WFv/SfahkrwcT5ESbEX5vgufyBNZPm7ykYrJHjl7nRvpCMuVKMzdc6tHpcYRAqDLP359IqvEOl4yb3+BkLMVf9aJh0gUeAOpIGhTtxor4zOp4J07PYOQ05GHYQxrN2ehgcDZU4//V9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767722227; c=relaxed/simple;
	bh=hQcVkxR/o5ATUWcW4CuQXwOu/rw6WdzBdJ24sxfFynw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l3rzjLmHCsdKtzFCW5TBqOIlzNxDla10LrhI9BdBhi2R4L821uNA2+Cf0lYf2c34pyXAKK+PL8AvexWwamYsyRPtdbVG/t5VkjYKStTP3pfyjzSxQKA9D3ffQNeURp+Nhgww4RUnr4O5q5Q6JgZGz4UH18/5W4jABEK79VnXW7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rbXdr+70; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3422BC116C6;
	Tue,  6 Jan 2026 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767722227;
	bh=hQcVkxR/o5ATUWcW4CuQXwOu/rw6WdzBdJ24sxfFynw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rbXdr+70VG7WegNXGbgtvzz3Hdi4UhZ+S8QqG2bFZdG5khjaOy2vfDgKeya1MP3qp
	 yiwpkemEeOVn+qtMkZYlV4S6hvTb6s2PnWfhn52QU4/1u2TNskkzQ2oQaPaBb8xPif
	 XbVy2+JlbvLQFPWRp+T/rUjmkWp08r970AC3SARu/E6WrtdsecznTfnOxL58bx2Meg
	 lm57eJEV1/C5VnVNdDZTtVycThxkrPLJACd4iMpwZjQ8lxCKGf83NwUpuXD4mk3tsE
	 nKpYCo1HZOgH/6Tzr6nndDVsaEEBXDgeDV+HHI2o+/FnJog54h48nImOH91AEKARmj
	 xTd/k3ML+9JPg==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 758D15FC25;
	Wed, 07 Jan 2026 01:57:04 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Linus Walleij <linusw@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 0/4] ARM: dts: allwinner: Fix remaining DT
 validation errors
Message-Id: <176772222440.2799087.10450816532517235383.b4-ty@kernel.org>
Date: Wed, 07 Jan 2026 01:57:04 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Thu, 25 Dec 2025 18:36:11 +0800, Chen-Yu Tsai wrote:
> This series gets rid of the remaining DT validation errors for Allwinner
> (sunxi) ARM 32-bit device trees. The patches are self explaining.
> 
> I plan to take all four patches through the sunxi tree.
> 
> 
> ChenYu
> 
> [...]

Applied to sunxi/dt-for-6.20 in local tree, thanks!

[3/4] ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
      commit: 0b2761eb1287bd9f62367cccf6626eb3107cef6f
[4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
      (no commit info)

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


