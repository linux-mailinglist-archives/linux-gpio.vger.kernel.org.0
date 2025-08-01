Return-Path: <linux-gpio+bounces-23965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 088F7B1869D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 19:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E4E61C225DB
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 17:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8754827A931;
	Fri,  1 Aug 2025 17:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPCBVQAm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3209013A3ED;
	Fri,  1 Aug 2025 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754069162; cv=none; b=uyFoTl5YyLddkUcNvvgAAzf5S9gfSlxNhObCZTaJqElk9rjW8qrlEURWsbYQKW6wCjoiFghatZ7/J2hH2i+RxFEuUQ3wuTAl7ZZjkVFq+N50NZeHu+eJAG8mj4t3FU/DiigvLB1Ae7MI3Ztbhl1Emf92W1tBW7vMjKUcc2Y1dX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754069162; c=relaxed/simple;
	bh=LAZESKJ9vhRa/bc31RvUlPJh1epXwsBYl7jFSiRgvlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsW1o7kYzHryrigtuezorlHNtUnihhlhjiYPs+AJZyYR/s3ZUqHH2aqQMuYEHDZjrGIxvYiTpw/l1HNu7uk4/Mqzo9r6cRLnYf6bCktmhaF+EAUZHmvp1Ez2BOXYGNiXWcm0TFebrMND6KFVwOBU1mvbc9JqMCO7HfM+46ii2Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPCBVQAm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839CAC4CEE7;
	Fri,  1 Aug 2025 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754069161;
	bh=LAZESKJ9vhRa/bc31RvUlPJh1epXwsBYl7jFSiRgvlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPCBVQAmia+vZiDmAx2NhLMVzrZAd7zpvfeYEiS6WzsM7Xv5PHFnskzDNhmVy017R
	 fJOtLQESMGVGWGDoHuuQqP62qowOX/FJLnXFqLvT5ADCKB6OD5tP8riLjL10Jr3idx
	 XhBhxSre+7LteAoLSTpSBRs/ab5jO56RCFFN9rlS3DsP9PeT9RdJ6UcKhgS95ZJ+Ln
	 kANQkEq1BWn1kYtqIK7m4TD1amZ8i6vafmb3STYHAo937BVwXUks79e49iBPLRc308
	 6D5vPPHJz/VTHAhKgwVOPCqNGscXckHrBhWJ3aAmIxx0vWvnVpawGNEDkJ8rlGeq08
	 HdPB562ELicbw==
Date: Fri, 1 Aug 2025 12:26:00 -0500
From: Rob Herring <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <jmassot@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/9] ASoc: dt-binding: Convert mt8183-afe-pcm binding to
 YAML
Message-ID: <20250801172600.GA3107067-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-4-6ba4e432427b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-4-6ba4e432427b@collabora.com>

On Fri, Aug 01, 2025 at 01:18:06PM +0200, Julien Massot wrote:
> Convert the MediaTek MT8183 AFE PCM Device Tree binding from the old
> .txt format to YAML schema format to improve validation.
> 
> While converting, also document all clock inputs used by the AFE block.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |  42 ----
>  .../devicetree/bindings/sound/mt8183-afe-pcm.yaml  | 225 +++++++++++++++++++++
>  2 files changed, 225 insertions(+), 42 deletions(-)

This should come before patch 2 since it is referenced there.

Use the compatible string for the filename.

Otherwise, looks good to me.

