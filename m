Return-Path: <linux-gpio+bounces-21336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45169AD4E58
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD4BD1BC1629
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A2223C8CD;
	Wed, 11 Jun 2025 08:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCYgA5Oh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799B5231825;
	Wed, 11 Jun 2025 08:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630474; cv=none; b=pXkEKumk6xF2CSOtYLLOfG0WWdXotXvAgsQMzZLJ0y6eesNbbbjUgTnKhxPDPSeH0Hvf/C2xPLtCO23aqw/Qj2n4olkhCqvXNRw5CGG74//UyqC4RUxOuoMB5UNwS7WPMmUtfDFY35BSGwoTk1UqzAzuGURKY0ytTsvnFndXmfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630474; c=relaxed/simple;
	bh=jVJDP6VW2c8elIa1D16cOy8gn1EBmQkj2x9PgzSs7p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seAiHM8hoOhcwRFw4/Cq+dBmV6ELDsAdIG/CajrOXTL8DCSOSNlpe073QpPeiqLwQYAIVfOTN30dwi57ODROYUKyyOYcnBEF41Rq4MzxpjyQAOBd239c242HQMp5wq3ZY0bBqm95+TSljG5F9s4jZ8FGOWWQxPKRJMlItl6yz1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCYgA5Oh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAAEC4CEEF;
	Wed, 11 Jun 2025 08:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749630474;
	bh=jVJDP6VW2c8elIa1D16cOy8gn1EBmQkj2x9PgzSs7p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCYgA5OhHA2wQU2VsOhqOj4L86jotUxPIBLlMqBdvs7v2ZTOaWk4sRm1mI1umJGRq
	 zZLRN4I74yu5o9BiuWDaw+rnjtBgIMvdD0UQV5oFuQj5Fr1Uegz2rCOqoCjNtco///
	 eGz5xPzMdeYHEoyyd3fk9fRKop2VhZ0zowt4hEO9po/tX8jctg8CQfd1m3fjMzNx4t
	 tn1gEKvYWYBPNcKoWOZnfi7/ILFzZjq48BSdB1XQlXRgDUmbXXwIRN21IK9fXLV55s
	 B4LBExtZSsWsFzY6UYR7QXBwRq1PAari20VmIeX8ASd3CmqkEYguWzitzE1iXVN/Sr
	 6axg/cFccqiMg==
Date: Wed, 11 Jun 2025 10:27:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE document
Message-ID: <20250611-private-magnificent-asp-63ef5d@kuoka>
References: <20250610092852.21986-1-darren.ye@mediatek.com>
 <20250610092852.21986-9-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610092852.21986-9-darren.ye@mediatek.com>

On Tue, Jun 10, 2025 at 05:27:25PM GMT, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add mt8196 audio AFE document.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---


I gave you detailed instruction last time. Did you read it or you
decided to just ignore my review?

Best regards,
Krzysztof


