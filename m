Return-Path: <linux-gpio+bounces-10190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE6C97A3E3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 16:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD6161F29E27
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 14:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6514156F3B;
	Mon, 16 Sep 2024 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNiD4FMD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7386014E2DA;
	Mon, 16 Sep 2024 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726495817; cv=none; b=nMTSdAfOyJWS8RhuAYWyA8tkFRU5Z99ykAtNFDaMAxltK4YlkQGKBxtwHpKkecKfifW0siQyhtshvcd7NK/u2ZqW1JJTKafyhZovcme9dPZ4/RnNk4D7QCRYZH95f/wiPAeWUiE5e0DNG4AkH7pOb2EQqGA6yopmBP4/BHcq1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726495817; c=relaxed/simple;
	bh=0MX4zE8OOlc5XD9iJ/9v/xZRSxZKMoW66SLc9BziLMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nac50+tsbe+WFHC4SntoVy7IuudacjEwB+YW4gscixAgQBSAj/Wvz16Lh6GZmpSyg+sZldPPC8KcsTZ0s8BoSO7SogrSwYIwQV4oo8JAofdlL86W6ZIyOZKEp9JxBvbEC3NktvJQQYyK8GhzDD/o0kvGTDJomg38kZ9ZopEFLAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNiD4FMD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E618AC4CEC4;
	Mon, 16 Sep 2024 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726495817;
	bh=0MX4zE8OOlc5XD9iJ/9v/xZRSxZKMoW66SLc9BziLMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNiD4FMDjMdMQkTw2VnZKzet5h9BYGRBTEsVkFjl48e0lIpt2+Kio3pA2r2TSkRBe
	 F10LMD4oNBuUfInboKP3QmG8Wo7OV5BGm6oWJ09AlNGE53gl7TQMZZOtsx9Z0Bp9fy
	 U27bqcbpR39mjGpc2jR3CATwmpddBcIVuTHMhCmmyaThfXUMxKRCwykIxQy4lf7dfu
	 oPlZMp1CA9gzahfTcXV9Kq3adHucm2015Gw+H8TBq/hClmU2t71x7flQJXrvtWlHqj
	 bVQOcvo/y0xlrplnYXS4PdFNHV1yTcrLzlwqJrjgx6yCkJolf9W2YhLs+rN+AxBpIH
	 meKz9rcvtBPyQ==
Date: Mon, 16 Sep 2024 16:10:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/10] soc: samsung: exynos-chipid: add exynos8895 SoC
 support
Message-ID: <v4gmlyogwkqld5ysq3nzmnq666yflinsqz7yq2sxhgwm4gifvd@7ovcn4hobxdm>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
 <20240909110017.419960-4-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909110017.419960-4-ivo.ivanov.ivanov1@gmail.com>

On Mon, Sep 09, 2024 at 02:00:10PM +0300, Ivaylo Ivanov wrote:
> Add EXYNOS8895 information to soc_ids tables. This SoC product id
> is "0xE8895000".
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

I don't think this happened, so please send new version after merge
window without the tag. If you think otherwise, please provide
link to the ack.

Best regards,
Krzysztof


