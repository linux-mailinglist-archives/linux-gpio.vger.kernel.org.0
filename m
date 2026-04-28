Return-Path: <linux-gpio+bounces-35641-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Om+HahR8GlNRgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35641-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:20:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA4947E011
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F319A3032CE7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 06:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87ABC345CBF;
	Tue, 28 Apr 2026 06:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ej6wnQ+e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hSv5i7ZM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ej6wnQ+e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hSv5i7ZM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA24E3396F4
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357189; cv=none; b=RulULiKxMWdrDEcEFQRAFm9nmXuNpGVRVZxagL9YyBBnGtD/kog+V1I3uJ2jYE9sofpXntj13qxeqSMfEC16MFSvIBmNg0Pq2HygRRavSwrzOBOKh9Y2wa9J+mvOKyz5D0vBNkctZWxojG1rmXTga3AnEgSjUoWDhxF1dX6ezMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357189; c=relaxed/simple;
	bh=aBEaJNgIofjO7cEcOODl1BmXBomk1cMT92Ssjw5evfc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qNGE33g+CkCXWie+2XQUi1o2B3lMqomNINlTEI9wBHq5pe/blAE/pK31qccIgszhAhDoV/4RG4CbQ+bu7enlbHUGUpH6KhJ5Qfv1/gt7sm6EMQp5DzVEP3Z12ppysSqZffIpqIOCpOgFfU3rMvB217BHk0qDPQTEwQ0T8fOvYxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ej6wnQ+e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hSv5i7ZM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ej6wnQ+e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hSv5i7ZM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B25C5BD33;
	Tue, 28 Apr 2026 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777357185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpCFgolyZEt8PPtiDFYURWs4bwF8eaRQRN05WRQxlJs=;
	b=Ej6wnQ+ej2iwOdtFK4EuC4OHBzzKq+ebYGOokHJSvSOmFKY9W6nJroq/sjgqUYb4PIOMpr
	25N/+f/d6IIEABNLa/Bw/XK3NyVprr9TYCToYtlupG9ZKS9piBKv7zia34L4ndwqFs0qXs
	4VoSFGtB6aia6M3MI110rCm1XYO68zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777357185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpCFgolyZEt8PPtiDFYURWs4bwF8eaRQRN05WRQxlJs=;
	b=hSv5i7ZMsu1LrzJPK8SQv7iELPE8YrWE2m3un88HsQeFUC35M2xSU2+/yOF9oeb9+8Ir1h
	87mv5kVnnKsyNNBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777357185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpCFgolyZEt8PPtiDFYURWs4bwF8eaRQRN05WRQxlJs=;
	b=Ej6wnQ+ej2iwOdtFK4EuC4OHBzzKq+ebYGOokHJSvSOmFKY9W6nJroq/sjgqUYb4PIOMpr
	25N/+f/d6IIEABNLa/Bw/XK3NyVprr9TYCToYtlupG9ZKS9piBKv7zia34L4ndwqFs0qXs
	4VoSFGtB6aia6M3MI110rCm1XYO68zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777357185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpCFgolyZEt8PPtiDFYURWs4bwF8eaRQRN05WRQxlJs=;
	b=hSv5i7ZMsu1LrzJPK8SQv7iELPE8YrWE2m3un88HsQeFUC35M2xSU2+/yOF9oeb9+8Ir1h
	87mv5kVnnKsyNNBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BAD9593B0;
	Tue, 28 Apr 2026 06:19:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ymDrHoBR8GktNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Apr 2026 06:19:44 +0000
Date: Tue, 28 Apr 2026 08:19:44 +0200
Message-ID: <87y0i7ehdr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] x86/olpc: select GPIOLIB_LEGACY
In-Reply-To: <20260427144338.3436940-1-arnd@kernel.org>
References: <20260427144338.3436940-1-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1FA4947E011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35641-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:email,arndb.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]

On Mon, 27 Apr 2026 16:43:05 +0200,
Arnd Bergmann wrote:
> 
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
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/x86/Kconfig  | 1 +
>  sound/pci/Kconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index f3f7cb01d69d..5ada2c108f4a 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -3022,6 +3022,7 @@ config OLPC
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

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

