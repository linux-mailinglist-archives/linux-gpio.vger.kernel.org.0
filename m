Return-Path: <linux-gpio+bounces-10248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3F197BF07
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 18:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE874283925
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 16:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A911C985B;
	Wed, 18 Sep 2024 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIejEd4n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E6F1C9850;
	Wed, 18 Sep 2024 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726676055; cv=none; b=ld78WwQAzTyjAz3ywgKmUI81MvKX9lPdLZtXnVOjKNhidEL3X4XiZMxGd6N79xPzIwk39SdVMaqBoSPe+gj2C51dLjKL8UnFWm7WodWxTjKTEWaa8oRVSOI09fhP35ALl6LJxunyNuofuXZ6syDXNluNlK6EXTMCiF1b3a+RCG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726676055; c=relaxed/simple;
	bh=3rznRPdygQNZ3lygq9QAApBHw9Wr9Jz6m6ljd6J0fpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfkpDqDfJJHMmwE+24ZG9p/aGjKgoR4T+M3oJ6QT4qUdOCUxQOE+IExlOL55XwhcToUmq6/DxmtEsCHhReBxQYVuYoyOTQmmYeBZA58+EWiIJ1j3Z50VXsWqmqjJmDeDpujMbdp7n8VwqesoobHHYjmNSXkEXEZbGOkIlQFVIRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIejEd4n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE68C4CEC2;
	Wed, 18 Sep 2024 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726676055;
	bh=3rznRPdygQNZ3lygq9QAApBHw9Wr9Jz6m6ljd6J0fpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIejEd4n3jKs72DbigX6AovTlZzCspSJj2JtC2g+edq7i3EgSgZBuyPwnYGLMjFik
	 BanmUmNP3k1eew7YZIazc/0EPDShFdjtvoxUfYBDYXsUCDXPLHIrZdgY8VJ5+Dg1zX
	 NpSY+1QIVKOWL6Ty5DXSYo6haOjcfkthxSfDtYint7s7X3qpnfqDA9ce1kP4Zulicl
	 gkhqrh30IgP+WbyycL/Y9CfsCKPSKbx8YrywS7Kj+zfIqfv1v9I4yhq6Mm6nTbg6x/
	 b9+NQEkUhX5yvNTwP+tO7912htXd9E7sAO32216HVS14IV0YhCtroaSycKpo1nQdOd
	 JLz5gJkVdNWoQ==
Date: Wed, 18 Sep 2024 11:14:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@pdp7.com>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl
 bindings
Message-ID: <172667605295.1715920.4448907447516770093.robh@kernel.org>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
 <20240914-th1520-pinctrl-v2-1-3ba67dde882c@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240914-th1520-pinctrl-v2-1-3ba67dde882c@tenstorrent.com>


On Sat, 14 Sep 2024 19:40:49 -0700, Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> 
> Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [dfustini: add thead,pad-group to select the pin controller instance]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  .../bindings/pinctrl/thead,th1520-pinctrl.yaml     | 176 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 177 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


