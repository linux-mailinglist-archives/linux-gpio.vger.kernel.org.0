Return-Path: <linux-gpio+bounces-29814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B101CD89F3
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 10:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE53C302A3B0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 09:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409E5329C75;
	Tue, 23 Dec 2025 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyrWW33j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0DC3271E8
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483020; cv=none; b=m5GFHyOrxl7CLOsZbaH62TOwhm/wrSFfvnpZNES98kpgqB6+tvktuX2dY6+ICQ97rnZZOJwUjmQC/HDlKUfBG5fydqLfmBXPbN92SoBZCwb7ndZXT54xpyfV/WB9mdd4jKykqZL3EDxbxbZqA3Rojx2DtpBydWrWYz5G1MUxKaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483020; c=relaxed/simple;
	bh=l/xGg3lZcqpSBWluJfeIDeMimjyGoXBIIVY9RShRyGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnZfySFwQleZxF828Wz3o9dWq4y5iirsOAbDsHNlEeY7xmPmt1OoqbEpqM1hoUg43WLJDi7bzjlmq8iEa4t8uFxc6MZJ1nse3AV1Zt55gezasYKDguwAH1XPeedRvkk/DnMTE3H1Qj137SebdlXMElRML6QTabGTfKwNy0gz0o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyrWW33j; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-11b6bc976d6so8432306c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483017; x=1767087817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SxJbYsS9Flodz6V0WJwrBiZXTghxJcKYTBqtlgaql2c=;
        b=fyrWW33jdFVCvBDNrCL4oWlp9NRWeQr1WW6BpG2bX4PxaJyPLzZhjQJtRGu4ywU0lc
         ElzOLtHwJSFvPrce6A5MidqY/f9V9qch/hdEtdSgN685/GveRi2krjW/wvFdTTwuz/iv
         KP7mKZ23NaYDkS1F13GOGKSiEnJtjsXVsoynDTKnfga9rnAmAjFe55DRd9X9xmBSWuYx
         kZposqeRRNBRK5rWbql94+vQK8VqEvU2VPLHKmKISYBDUnKC4NwVYjwmYhYvcFXUrCN9
         ufbiKkigjSfzaIdNtKNCDcQkhIpkQp6eC6rFY9YV+Kzeft8fcKaYS0m2ypEHTZ4DbYI8
         fq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483017; x=1767087817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxJbYsS9Flodz6V0WJwrBiZXTghxJcKYTBqtlgaql2c=;
        b=KQQsXJUpD4dXEOXHepF0rZ+LVeCSkSGj04yYeARoH8LQ9zi0oTBO2V+x4QluELZk0x
         711kxQNxh1V1eEMXcejdpEIOgzpH6aB/OypkwkcKWFZgaAm5lNxcr9lNjlTaSbP85mmz
         wmXsGtcy1GoqZ5xKnQhYM8k+7S9wZlHxVE9MKpN651UxDKjZBtDkwBCBSAzTBkhwDJus
         zjyg0I4QjA8osSNVXJFI4+Z8MTExCnLNK/PWOEl/mLMQ4j0mxJN14E8XYFZoCcXHhhRz
         E1ZxS2HMof7nglEpddGaXCJgSpgeL8ahU8n0ENUf35AkB7fkn88X+Hvw/CHrV72zC/nC
         bfQw==
X-Forwarded-Encrypted: i=1; AJvYcCX5DuYWYcnQOoxvP+y3r2zzAzHI7hm/9xkxkOIn0iAk1QCGyCVaHN5LJHS4Yy3Z4TUQTdNEZJYEt08S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6DdHsDAQVCZAxzLlwZiuL518mgYn97JcTlRfq7qBsSMUyEYMJ
	/U2mIJK6ZFq8qK1sANrS7++ymiiP8AHRMsvTxauIAEPfhrwYk4oU5PZD
X-Gm-Gg: AY/fxX79RSFZPYDjsErprO54Ztknumn1IpNo6lujVhBfCi77Wl9Nv6qsBzB0v5cxDfM
	KN5V5dp7DZkodjt6ROSBs464g9mDBoqb93gOSJ0ltFlzPENiloD/Lzh4oXGjmcj03tiPzPW2MV/
	1m46Xk2QW1Omso4SNM+phOqMXo2C8WoJ1d3RViGHOnTN0hhQzSv+atMyD9pkO2h/SyD/YokwqZi
	yhZP8uhro4F/T+aU5Xx1/bgB943hsRAL50FEHGyJK2r4qXhROXjrYcTSSpX2SXYX8g50Bz2SN4+
	EXjUYs63UPxrIYMaE/5/fHHLXsktj2jQ+wMLcz9Ryvzf2Un3QkVfYEMJ9DwQX+Nf9Y4R7w8J3Qe
	UHm1uRZp35sODWo/GOnWJB8U4847uXvavRc80WyLGWQCGRmcSfNcFNtaQFGtVafNqDCDwqGuJhM
	O98irO4j2Z8g==
X-Google-Smtp-Source: AGHT+IEp+OSd9R0lrP291Dk7W1AafeaeXYagMJNjBu0iohEINVzAIJUCtwgGHA2QHs2m9CJoX6vTug==
X-Received: by 2002:a05:7022:608a:b0:11b:a8e3:847b with SMTP id a92af1059eb24-12171a685cbmr13887306c88.5.1766483017187;
        Tue, 23 Dec 2025 01:43:37 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfc0esm56367570c88.2.2025.12.23.01.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:43:36 -0800 (PST)
Date: Tue, 23 Dec 2025 17:42:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <aUpirQFWf3w-5PQ2@inochi.infowork>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>

On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> IO domain power control registers are used to configure the operating
> voltage of dual-voltage GPIO banks. By default, these registers are
> configured for 3.3V operation. As a result, even when a GPIO bank is
> externally supplied with 1.8V, the internal logic continues to
> operate in the 3.3V domain, which may lead to functional failures.
> 
> This patch adds support for programming the IO domain power control
> registers, allowing dual-voltage GPIO banks to be explicitly configured
> for 1.8V operation when required.
> 
> Care must be taken when configuring these registers. If a GPIO bank is
> externally supplied with 3.3V while the corresponding IO power domain
> is configured for 1.8V, external current injection (back-powering)
> may occur, potentially causing damage to the GPIO pin.
> 
> Due to these hardware constraints and safety considerations, the IO
> domain power control registers are implemented as secure registers.
> Access to these registers requires unlocking via the AIB Secure Access
> Register (ASAR) in the APBC block before a single read or write
> operation can be performed.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
>  2 files changed, 131 insertions(+), 4 deletions(-)
> 

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
>  
>  		pinctrl: pinctrl@d401e000 {
>  			compatible = "spacemit,k1-pinctrl";
> -			reg = <0x0 0xd401e000 0x0 0x400>;
> +			reg = <0x0 0xd401e000 0x0 0x400>,
> +			      <0x0 0xd401e800 0x0 0x34>;
>  			clocks = <&syscon_apbc CLK_AIB>,
>  				 <&syscon_apbc CLK_AIB_BUS>;
>  			clock-names = "func", "bus";
> +			spacemit,apbc = <&syscon_apbc 0x50>;
>  		};

This change breaks binding, can we use something like <0x0 0xd401e000 0x0 0x1000>?
If you insist on a new reg field, you should change the binding as well.

Regards,
Inochi

