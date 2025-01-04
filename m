Return-Path: <linux-gpio+bounces-14502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FF3A013A1
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 10:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C874016269D
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 09:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0B716E863;
	Sat,  4 Jan 2025 09:32:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542744409;
	Sat,  4 Jan 2025 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735983144; cv=none; b=fHwBrPF1MNMPCxNNLndynGmSTyuw86CVHJ7I7ctIAIqZXaeTAWdtoJKKZEsQsgMunRE41xaS4tiuIu0F4jgrfWT4zT83gXuMMQGaDcYkjcXP4Tf5O/NQq+cW1CNL6xpYyXDb1qBkTGZUqb+6fCHznZ+xh2wTdkaA/l93NHx8mXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735983144; c=relaxed/simple;
	bh=lkMEzTb3QAyyJOfLXO8RYoM6ExRz4HW7ecLWE+AsrP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k189tbq2NCmwSB4xh7Hv+fwxudE/EeqIlvYlIUZmTp0BAKXB/Hu36qIvQPIdJoSFCQlWuwwMZ9TemN/uG7CPwfgMKGQtHjUvWmBPwk7YBxmqagMZ0h87OdeEvhoBEof70cm7rb2irq1Tz2oTul6E1C3OAj/BS9UlbZsGCJO0YyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FDCC4CED1;
	Sat,  4 Jan 2025 09:32:22 +0000 (UTC)
Date: Sat, 4 Jan 2025 10:32:20 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: sunxi: Add NetCube Systems
 Kumquat board
Message-ID: <46tuwtamwmlbfjzq7pjasgqa7ctgmwnljd6rvyljjsqgcw6kjm@7px3q6symrns>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
 <20250103204523.3779-3-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103204523.3779-3-lukas.schmid@netcube.li>

On Fri, Jan 03, 2025 at 08:45:18PM +0000, Lukas Schmid wrote:
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No, patch changed. You removed now commit msg entirely, so don't keep my
ack... My previous guideline described this case: if you change patch
significantly, then drop the tag. Removing entire commit msg, for
whatever reason, is a significant change.... unless that's a mistake,
but checkpatch, which I asked you to run, would prevent it. :/

Best regards,
Krzysztof


