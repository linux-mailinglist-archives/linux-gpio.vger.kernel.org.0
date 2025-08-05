Return-Path: <linux-gpio+bounces-24012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 39296B1AEA8
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 08:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 246D74E1852
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 06:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F0E21D00A;
	Tue,  5 Aug 2025 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UroSbvYT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C3C21B9FD;
	Tue,  5 Aug 2025 06:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376381; cv=none; b=DeOXI56SbN6CJqpnKHnJlApfiSDJbTDagasBV0rPGMrTcuPbDkiq+YDxuFluqzqinYRSnixJnO2Rj5GBabh4b5HYjPSOlaL+OoIWX3wJiH6FflLWBY0EIJ5RtoTdBWk6GBunqVPqMf09v/qVaxr6vkDsRdPukQnON23nJRMNpbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376381; c=relaxed/simple;
	bh=l6GPwJAJ4HCjFxuK3xKj2503ynzwBDT+99QWWWSdiyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKBTAxfJ/6mP0fOKIoIKOx/tTEchMq/6AdeMduuG6CwdB0OQrb3S3kjslmgSqsZg9g0CZODWlptz7ZF0OIgpk3geJoN9Qd/SpTWrCti2AQyd/u1gsVZr0iA2gmHcYSyuxJOg7kqTIMHHeqWKVABC2O4PAKDO1N0vIzSKzZA3tf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UroSbvYT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D354DC4CEF4;
	Tue,  5 Aug 2025 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754376378;
	bh=l6GPwJAJ4HCjFxuK3xKj2503ynzwBDT+99QWWWSdiyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UroSbvYT9PkUKOA692LHG26z2EAFUc+nMEtl45dMnhkWU8t7eNhzeEzIw8MLigrj/
	 TEqa+sRUoB04N0R76DaJJDMRfNUOVWqFDcKvF2+TqFkhTb5x3FwLOW6ytT+0FGPxP/
	 JNn5cY+sw5wgeR6GSvQXzN5rxkIIXw2C82BgVfA+jngB2WekJpdtQT0XlGfm7ILomV
	 DAozf5gBHNZvwYczxcPMahojXGJ88dF+gK6afIHF3fyrPGN2IJfOFXiCu1/PMPSgf3
	 EDl6PY5xC8eK3xIaoTe1wZ7TIr1vjKpYYZ373WgtqkQMsb8z309EkxupnwLNPrgIK1
	 bJnvgMx7glZ9w==
Date: Tue, 5 Aug 2025 08:46:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra256 support
Message-ID: <20250805-unyielding-independent-tarantula-d4d323@kuoka>
References: <20250804041657.27688-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804041657.27688-1-pshete@nvidia.com>

On Mon, Aug 04, 2025 at 09:46:56AM +0530, Prathamesh Shete wrote:
> diff --git a/include/dt-bindings/gpio/tegra256-gpio.h b/include/dt-bindings/gpio/tegra256-gpio.h
> new file mode 100644
> index 000000000000..36485b4bf47d
> --- /dev/null
> +++ b/include/dt-bindings/gpio/tegra256-gpio.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


