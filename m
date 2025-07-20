Return-Path: <linux-gpio+bounces-23519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2254B0B37A
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 06:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45F2B1899B01
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 04:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C8519FA8D;
	Sun, 20 Jul 2025 04:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFkS4XaE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3CB8F5E;
	Sun, 20 Jul 2025 04:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752984565; cv=none; b=apReV3H+pdNjJPcJA5nSFv3JkZ7ku20JvIQ788I0ki5418aGqR2Kbbm6y6aAkWvM9fF+2TVYYqr/LKx+s+RPdYiHWCBBgH3024VXvWBMmGt7cmiRVHgjjhBx2N7bdBDpa74ugBhaEnSvpAGN0duS7znP7YuV2zhjQ9lcrAtMerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752984565; c=relaxed/simple;
	bh=+G/jVoJo7S56hE67sdPmo5sXcwpEF9FfdDWyBdcRxq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovzvXgJfmsnbpOOYyqGTK/nLLTAj3ecBRhqK0tHnFY7PHtZJ6+rc9n6oqLJPqe1ER+YaqNE3IHyJBXJnMJYchWQAncbeEShKf2FDpM24tJYI6KtHxE7HMg5iBqQGNViNuh6bp4t/9bYYi2eA9KiCW6QfzsK+/RLb2MiWNpmQvo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFkS4XaE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01E8C4CEEB;
	Sun, 20 Jul 2025 04:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752984564;
	bh=+G/jVoJo7S56hE67sdPmo5sXcwpEF9FfdDWyBdcRxq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFkS4XaEUhLeDtcBpTCLMgG64lRekxG87+3SpeAxiwoKH1nR0LN6Lbpkzi9FX1pt2
	 h3LBUx2C3Uhphtdeh7tVrg03SwHQnvmrmbUar2zK9GQQMS2w2Ui7MnOuwfHmT4Miv+
	 wwqvXn6TE4b6/fleDTeKqQ+BJoLQLjWIqKjuBcEd4xcUgaj53mX2+957EnfqF0pHBp
	 xcAlOpCWRgBqFlOC7aiPLghe5mF9GcZikOMyW4hIJtP05nwcooaP7SX2zOr+7VqoQ7
	 v1/+bU+d1QJIabe4TefyG2Nrh35/k/MDqsLoHwUEG+FIGXthBhmDbTjzRBotArFM+6
	 Z1fmLw21FNpjA==
Date: Sat, 19 Jul 2025 23:09:22 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_rjendra@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add glymur pinctrl driver
Message-ID: <jvh5743te7yjfgtp2fbsiksneubcqgdawafisaoefwbswxinzk@4luwzkadt2oo>
References: <20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com>
 <20250716150822.4039250-3-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716150822.4039250-3-pankaj.patil@oss.qualcomm.com>

On Wed, Jul 16, 2025 at 08:38:22PM +0530, Pankaj Patil wrote:
[..]
> diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
> +
> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */

As Abel commented on the format of this comment I actually read it and
realized that it has changed since last time I read it...

This now describes how dummy entries needs to be used in order to fill
out the array if there are gaps. So far this comment only applies to
SDM670. I see no dummy entries in your table, so what is it
documenting?!

Please remove it.

> +static const struct msm_pingroup glymur_groups[] = {

Regards,
Bjorn

