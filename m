Return-Path: <linux-gpio+bounces-17439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BCEA5C8AB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 16:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7EF16901D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 15:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B1625E83A;
	Tue, 11 Mar 2025 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSVnzgjr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7436AF5;
	Tue, 11 Mar 2025 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707955; cv=none; b=KxLsZnDpboquxoX2HWgrjtyHaPm2NHRyuwJnR+/A1S2sq4hvUarjuPfy47ohXvDgNQis03f4ZCymxLtGnO/Nj2cA997pW1nrFSvS/fCj/1frkB0N/JQiWzJtH3uyAWcDFLdPASP8XSLsoHC2TU1n8TwxhYHfjy2rg3MowdxHRDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707955; c=relaxed/simple;
	bh=a3vvOiEuAyhHegDcARBT8fuM+ixjoiva6N1h4uM8ADE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltkHvKHvVrXx7+tZ4Wb8ygl8lT8FmTdd4YuOfYsvi8ZLH5bKcJ6DFk/2tjOrBqVgnkIloj0YtFM9mCTxyWbVrQZtYIGQTPylIkk+mykh1Oh9ak6H6KWDZPI3tQlggn4FZQLJW5KtHr5pujXEMhfgHKNcGjOkZIsBjKmOrOjjfqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSVnzgjr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11322C4CEE9;
	Tue, 11 Mar 2025 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741707954;
	bh=a3vvOiEuAyhHegDcARBT8fuM+ixjoiva6N1h4uM8ADE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSVnzgjr8jJ6hLsKm88gHA568QDpB36kT/nX/7yA+vBqYEYvlLsCxVKiaGFLvOo0l
	 uj0XbVM/aC3D4O8yxgCVT4o3qpDGgeRboMTTavJKbnLdC3byKaJTg7X6SLZSduy/kN
	 UHVyb4TtcioyJBOEYwFF9v+ST19C0VwL99DMGyHWvj/gQ4u6ZhtM0aWUspP1JnaFNd
	 t4lp69PjciFQGJygSew5KnARKZq0np0pUk2pJprjkoT+3jzktjFsVQUumMoOTFiKVL
	 P/6OX/v/ya/ApsGXvcHVPZKJcsckwWdpXViRmJWn3jq8+QrVGMHE7UavRhvj7AwPGt
	 z5OrQTR1WEtnQ==
Date: Tue, 11 Mar 2025 17:45:50 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH] pinctrl: qcom: sa8775p: Enable egpio function
Message-ID: <zle2qky36rd5s5nc76wofard6hlh5xogimkkokkjdjy364kla5@l5cwfcx6flsa>
References: <20250311095151.1581239-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311095151.1581239-1-quic_wasimn@quicinc.com>

On Tue, Mar 11, 2025 at 03:21:51PM +0530, Wasim Nazir wrote:
> Egpio feature allows Island Domain IOs to be reused as TLMM GPIOs.
> sa8775p supports egpio feature for GPIOs ranging from 126 to 148.

NAK, this needs bindings update too.

> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sa8775p.c | 56 +++++++++++++++-----------
>  1 file changed, 33 insertions(+), 23 deletions(-)
> 

-- 
With best wishes
Dmitry

