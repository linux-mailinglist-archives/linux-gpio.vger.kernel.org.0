Return-Path: <linux-gpio+bounces-35650-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFCrDS9r8GkITAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35650-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:09:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21147FA3A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20D20301A765
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6509833FE12;
	Tue, 28 Apr 2026 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMW2/vfP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875F33557D
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363635; cv=none; b=ELHl7WGnLqqbb4haX+ud7ahHvaqXifDw53FNuoRDaZjTdPsJy+Fha+DmWeHm2RG9qIymLkvyBAOTZzlLXgSWPTvZMqr1FHbxuFYMa54NUQQUFrVnCx7gx9mDdfhC3+W0oGdbEKQGhw48AtuNzBlksBp/BQhBcKYRlK6pYHHLmX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363635; c=relaxed/simple;
	bh=c9P/8jxujvm3C66tIWuYt0KLPICR50EgTHln6yDH+6A=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIefFxui5DsCo0xfkE9XH0Qeh1Oxy2OcM+8UAsd0iFFj+7OurM+IF5te5Ch463mK0kBnkici7m3JLIaXsmjIwbxad0iRq3BLKBbHv6bYZvRn5Li3IvJGw9heDY51B0KxwxBGebA1fVHIvW4YaPTPjb2U/JbnP+P1hMqX8PbnBoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMW2/vfP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6ECC2BCC6
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363634;
	bh=c9P/8jxujvm3C66tIWuYt0KLPICR50EgTHln6yDH+6A=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=YMW2/vfPtWrjs4tey8HDo8H/LxGc8Xtz1lTAx+xTIh2YulZktSYe3xrZemau46Mkv
	 N7AiMVsYKLCEm3wICBEOKs4dA88SC/m+qzA6NYepajc2kgqQQl3CSUl2G2fwjmGXKd
	 CIrrlA05s8fYipRvGsEqzjY7LVP/IQOaaM6o+YP8O5pHRyLHnxzaXFz3pDIbnF06KN
	 RmgIxpfR1u1B+xpYlJCl/QDqI+hYgLgNg3/HZ2CyuCBmfnQyiFt9EuWc3DDnnYY7Lc
	 OI0juRPwYajYYc/WyhQTvWEUqIiZO+UpJGvHPerjB/130lftiIZnyrlT32KjI5fKef
	 jM406g3PltXPg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a525aedb24so10848796e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 01:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+HErPtKoPy50IwsZ4fELJZDgCgzHV8OIB1aLYcLLKMuuuFjtI5wucJoHn9xvsg7/cXbw4XcskMV6Y3@vger.kernel.org
X-Gm-Message-State: AOJu0YwTwiFvYg+NXlMVAFEcenAL0AZku51UmMtc/xzdbKFn91bV6Dj7
	3DKj8gPtcGa+cENFDoeotgVN4POdrzNGF+aPESbDsR0x250kgTmIcLH+wGxAyLTeR25OMcseOsi
	n9lXIBTWcpj+3BveH7PF8q9eHtuW+TID0Dk/6XHZSXQ==
X-Received: by 2002:ac2:5083:0:b0:5a7:470c:daef with SMTP id
 2adb3069b0e04-5a7470cdb7amr367300e87.14.1777363633435; Tue, 28 Apr 2026
 01:07:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:07:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:07:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427144338.3436940-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427144338.3436940-1-arnd@kernel.org>
Date: Tue, 28 Apr 2026 01:07:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf5DRfDNht-pDpdU5mT3XzWtKuVhyfK6EXE+9bdy=h1HA@mail.gmail.com>
X-Gm-Features: AVHnY4IKg28r4rY_OTjHZiHO6OsvjVj2nMnj_y3oNdasfuWqri7U8txCSGLn2pQ
Message-ID: <CAMRc=Mf5DRfDNht-pDpdU5mT3XzWtKuVhyfK6EXE+9bdy=h1HA@mail.gmail.com>
Subject: Re: [PATCH] x86/olpc: select GPIOLIB_LEGACY
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CF21147FA3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35650-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,alien8.de:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arndb.de:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 27 Apr 2026 16:43:05 +0200, Arnd Bergmann <arnd@kernel.org> said:
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

