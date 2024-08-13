Return-Path: <linux-gpio+bounces-8737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E35FE950BB9
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 19:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FE362861F9
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 17:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D2C1A38E8;
	Tue, 13 Aug 2024 17:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9sm/SZ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8D51A38C7;
	Tue, 13 Aug 2024 17:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723571564; cv=none; b=AKTtcKewun+Yl4gMZKsNT/PUryYlj24nyrRZBF8nqg4CfWniNSIM1ChpXm9jQFuBCJlLn+gFfsmKFPVt7a7wk5eeKPXU6mdJF8MaHCLVBqZ9MBrGLYVCNf38HKj9CxJpUGx6CfliE/HGu0c8iirsG5aEr13T/KucvG4LgSK9ya8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723571564; c=relaxed/simple;
	bh=jaYTKhnDz3cMLzKRvanDv4iTcOL4tRkIj20bw5Jjpqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApmQiMW94glkT0YBQtsJleHxrIA1z6Gx5PK34n0swcShKnCZpItjIQDKQaH+g1mWm2OZUk4bgHmyBzPEXYTavfhsoV5Z5OtG4JPsen+jVLcQSPOMKMXcKYiHZamy8Nittty+bk/3NqrIpWqAH/5PmbqqTTP96Pt6ccAVsQ+PHW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9sm/SZ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548B8C32782;
	Tue, 13 Aug 2024 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723571563;
	bh=jaYTKhnDz3cMLzKRvanDv4iTcOL4tRkIj20bw5Jjpqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9sm/SZ27CLm4wwI40WqKEWvAs5rxegOlUNAOon2mYDYBSjIR1wRQuZmArQt11AJq
	 BRbTBAzrGwsClPUTPFymdzhcwGG510Q8X3+uu12zDM8PghXDPZL6wqkbqym1DNb5A5
	 I7DUB9z0VbH1LnzwQPwTsqeHcG2lRgl8R5WVBdOk2Fr6a5+yizuPscbMtDSRiVZjDJ
	 rCuu3noVnzT3HObqOt/BRr1pKyonqlP0agZNRvO4GHFgSrzD/lB/Ht1v0XNDL4XHGh
	 D3Bn5LrDZgb6sYj2LcqKxHggY0juSjfUAH2Nl2savflaWyl48SPLuBZD38p/6zOP2v
	 hlLQIWusVrp1Q==
Date: Tue, 13 Aug 2024 11:52:41 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 09/10] dt-bindings: arm: samsung: Document dreamlte
 board binding
Message-ID: <172357156117.1415479.12001231226456740741.robh@kernel.org>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807090858.356366-10-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807090858.356366-10-ivo.ivanov.ivanov1@gmail.com>


On Wed, 07 Aug 2024 12:08:57 +0300, Ivaylo Ivanov wrote:
> Add binding for the Samsung Galaxy S8 (SM-G950F) board, which is
> based on the Samsung Exynos8895 SoC.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


