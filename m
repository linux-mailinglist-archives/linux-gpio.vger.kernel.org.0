Return-Path: <linux-gpio+bounces-30721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E611DD39E1D
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 06:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6BD31300289F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 05:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178AA265CA8;
	Mon, 19 Jan 2026 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRmvEyVv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84AE262D0B;
	Mon, 19 Jan 2026 05:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768802270; cv=none; b=gllu74Wr5e/SpesKbTbSrOBMrHLxG79ZEFqauFutjZR7Na/NjTdOnRv/9SRtWPb+CEWepz7fUP5t3F8mH91yE4LzqrM8hGEqU+rgkob3WZBydRFSEmjYvKv7bCpJFkMLl596u7TGBFXmBHznSvWh13uEySuwcqz/wLXrlJfMqdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768802270; c=relaxed/simple;
	bh=jVBPHEfVtiYGVPijhkgf1PAt71FDsL0qQxTsv/v3amU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iBjz8UfT41+yasrGc0rHOecVvvAs+1Q5JWtxHU0vPQ19sx6kqmXVDDu58T+megdkm6+jMPRzkz98kODHEx8fvNQbyF4JrMZJFMeirwZMVV7CSwaVAnDrSJpq8nNRDz4hx/pDHhcNeFcjO3lSQrvT5IjiFp/KvD2lERwdg/mF4EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRmvEyVv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362D0C116C6;
	Mon, 19 Jan 2026 05:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768802270;
	bh=jVBPHEfVtiYGVPijhkgf1PAt71FDsL0qQxTsv/v3amU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QRmvEyVvlb3QjbD+KPP23fPL7E47MSqRmLwW3/BtqbqlpQ54u/3aHqidz84NnRYOg
	 p6ANvLr43yxf5TftcCF8bS528AmB6aySEsF+DXT54LyGHAeiXcROiO8pqW/NloW6vJ
	 q6lJqzbvfgMTbW8KxM/2YePu2BtBbiMe/yQNs7dzm9Uz6cKjFFdF6+H9Tp2SkYyZwO
	 jQJpkPM3m8Lv4Rax3Oli1JR1vMVG89+XGbE2FC6I8c23Blc7rMGEyTpFLJPgsuKEHO
	 vrRft+LGCALbtXsXzVmOQKlQxxUuDhA1B5nY0I/5Cr+4Yw/xEmDwuyweQRj2Xl79JX
	 dOVhNIbHzdpuw==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id B9BDA5FA46;
	Mon, 19 Jan 2026 13:57:47 +0800 (CST)
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
Message-Id: <176880226773.2263817.6938241387406748242.b4-ty@kernel.org>
Date: Mon, 19 Jan 2026 13:57:47 +0800
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

[4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
      commit: db5e9260be8d3437222df74b5074359b22f1f029

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


