Return-Path: <linux-gpio+bounces-24318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 426B2B22E80
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 19:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E00BC188A51E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 17:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC352FAC11;
	Tue, 12 Aug 2025 17:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="V4Ztrk78"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AE92F28F1;
	Tue, 12 Aug 2025 17:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755018147; cv=none; b=oGcxxkedWuWkhhF1lk+FDDjl7+uGuq35TuaCI4pEGEbiwyk9l7nub62SOC+Waew48B6co6bnWcOp8Pw1YRko/qBevTnB7fdRTgDWIQS7F1ck2PtKvHW69LboLjLNHlyyEENc+cD56LI1bOMK6G59f6XuVStY6ZHP39PIGkDe12Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755018147; c=relaxed/simple;
	bh=ORKtKIjOObFOnyi6C0JkWlQVdNqqRyj7TK7gyYhelaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhQESv9PH47Z8jWVgQlShW2ZAQdKCuztu0GWLQD3F6AzDuAF1ter7BeXOulNcBhnXuHcbg8RFH6cNMnYo1XaiADBHL+HN567zVJF9TD1wLp9HACTvLuRMBTudJxcX0fyR8z1CyltxBGv9Tbb+bIAZYaNygsQoOAwRwbj2TFhXyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=V4Ztrk78; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DF11C40E0289;
	Tue, 12 Aug 2025 17:02:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id P7u1MG-buWMw; Tue, 12 Aug 2025 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1755018137; bh=OWNkdg7JeQ94GyRKo+H1ESi2roT5ujbMOOMUZMYSPNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4Ztrk78ZD9ZO1cN+IU8PlhFnSufi2ol4yIMkFmKmAi2Ff6EsUTgRCJP8bpFNx+du
	 oYxZUcld7KVS4iNtwFiXgX5aFJb3wVc5yxigMpoiyDP96xkFMK/PpJfCuky9Eq0HQB
	 6sGbIHgMtI5H4B6YYjVu/suxDs+BJQoUgechdcyta4Pqtt74lWfUx2Bt2Ar5CS3oOJ
	 lyGQCb5uxqeVZsHS7BXWPP09ZgBgb0Pl2U1zolc5KckeMOjicCAAWNNDXAC+VkovGY
	 sRbokEAEob9MEgQs8AoVJNqaCPawoEfwNRqFAYruFZxlq3VYJ8ohFHx0+Yz7lmEB2h
	 eVTX8F0v1Gq77qplp7oNJV4bct48vimUphQVRMH09c194pGsvaEWC/7/L1NVgYaj6B
	 lw3z2w8yFqHfqnCJe7cxkHooAmXnHobias4KT7ey//TgnvxwZVs3l4kkNWYco2IJ9i
	 vRD0T5jtoXE+vfrEvL58ccka+GVoAC9kXVfGowJ3tuIp29+ZEQxLw1bdDp9FaIWuuH
	 zFPNfidoEwYRIv6NmYM6GOxNZe/K/6TgwgdCK79rMPrIGH80/Ck1JyLIW+qsCHDjc2
	 mFquqUVIA4IRlf1dnGa6WngNdMajuVIV1MLEh4tn7cZ7JzafuuhGzUYp9HuDrEi7Ky
	 SpqFTdOmaP+uRX/2LOWmj6vo=
Received: from zn.tnic (pd953092e.dip0.t-ipconnect.de [217.83.9.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EACF540E00DD;
	Tue, 12 Aug 2025 17:02:00 +0000 (UTC)
Date: Tue, 12 Aug 2025 19:01:55 +0200
From: Borislav Petkov <bp@alien8.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/21] x86/olpc: select GPIOLIB_LEGACY
Message-ID: <20250812170155.GEaJtzg6ud45lDHwEf@fat_crate.local>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-7-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250808151822.536879-7-arnd@kernel.org>

On Fri, Aug 08, 2025 at 05:17:50PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The OLPC GPIO controller sets up a fixed number space that is used
> by at least two drivers:
> 
> arch/x86/platform/olpc/olpc-xo1-sci.c: In function 'setup_ec_sci':
> arch/x86/platform/olpc/olpc-xo1-sci.c:358:13: error: implicit declaration of function 'gpio_request' [-Wimplicit-function-declaration]
>   358 |         r = gpio_request(OLPC_GPIO_ECSCI, "OLPC-ECSCI");
>       |             ^~~~~~~~~~~~
> sound/pci/cs5535audio/cs5535audio_olpc.c: In function 'olpc_analog_input':
> sound/pci/cs5535audio/cs5535audio_olpc.c:41:9: error: implicit declaration of function 'gpio_set_value'; did you mean 'gpiod_set_value'? [-Wimplicit-function-declaration]
>    41 |         gpio_set_value(OLPC_GPIO_MIC_AC, on);
> 
> Select CONFIG_GPIOLIB_LEGACY for this platform and make sure the
> sound driver portion cannot be compiled without this.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/x86/Kconfig  | 1 +
>  sound/pci/Kconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 58d890fe2100..3fd5e378a9f1 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -3006,6 +3006,7 @@ config OLPC
>  	bool "One Laptop Per Child support"
>  	depends on !X86_PAE
>  	select GPIOLIB
> +	select GPIOLIB_LEGACY
>  	select OF
>  	select OF_PROMTREE
>  	select IRQ_DOMAIN
> diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
> index e0996a9d90b0..6366f72b3667 100644
> --- a/sound/pci/Kconfig
> +++ b/sound/pci/Kconfig
> @@ -300,6 +300,7 @@ config SND_CS5535AUDIO
>  	tristate "CS5535/CS5536 Audio"
>  	depends on X86_32 || MIPS || COMPILE_TEST
>  	depends on HAS_IOPORT
> +	depends on GPIOLIB_LEGACY || !OLPC
>  	select SND_PCM
>  	select SND_AC97_CODEC
>  	help
> -- 

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

