Return-Path: <linux-gpio+bounces-39553-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s0HlI7aJTGrVlwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39553-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 07:08:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EDA7175B2
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 07:08:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MNa9a8qO;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39553-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39553-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DDF830221C5
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 05:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DB837F8C0;
	Tue,  7 Jul 2026 05:08:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12FB2EEE61
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 05:08:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400882; cv=none; b=b0AjGQS/5SYdXXo60yUAq4hEyX0u+813eHbPBKXck0Qk/C2sCfx1fJEatdvhG797g1ITLgesD8Ou0Q9uOJvHMGpfATB02BzQUO4VvPogmzI/YrxH8EFduvZYv2tw57Ld/1vNlskkLsIOBwx9ynGipoQUPNDRSUQOQZ0jZs0zDvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400882; c=relaxed/simple;
	bh=+3wzVO86JvHn/zy/QiAav3aAi02uo3iz7iLz2++JB6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIJ34D62ccOZwT+Vpnpo1Ym6kYBkXrn8ilVTw2chHjiOPGcA2Es4nuakBIkkkoL56+gXyrSZ06VeLn6fetSNYgUbcyTUgtT52Cwm+nli/GaHLi3RYB0p/NTiPGpqJVzboxHUqcXemDq+LKh3e1caFcYH9TPcOJkKZR/+SQPkn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNa9a8qO; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37d55e8d3e3so200879a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 22:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783400880; x=1784005680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWdFSvLr4RwKy66Rs67JQ/ht1Wwyc8ZXtBXqpIcmCH4=;
        b=MNa9a8qOj3ZiPnh2vJo5m59YVRbZBD/JKgYXh8+W2755TcvCqEibgsspq8dQda1bu0
         agUX2LXCJ/u+ZtxNMZiL/cE7c2iXRQsw3AT0YuWpQ363ZG7JTnwDPvI5zRwkMnNLDUiL
         gxE+KyCAGKyplyMgaDsQL+PO2O63IWcFwtHxPYcHP/arK9VmOgxSxMcNDs37suceoJWZ
         jglQNaaErSSAx+WOfs76gSbyTfspBXSU3JksY8FGxJ8JYjHcPWbn+BT3eQwK84GjLOZn
         SnsmzdJzHr8xgWnem87d0Zm6As8gtOcpyqwBDzQI1hRPjNFrd9CNRFGHHAirGxDYjgKa
         VycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400880; x=1784005680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWdFSvLr4RwKy66Rs67JQ/ht1Wwyc8ZXtBXqpIcmCH4=;
        b=oB4T5+dAXGygKKYe3huR5p6zdZV7B6QN4jb9AcQ5tdlwqCg/g1HPw0PnfIn9tNl59+
         iSGKyZrUq7d7fXPQ8O6IXJQL0GXOb8YVEggmfDWJfR76uBHkd+3Kwtf+O8aCqGdORtYq
         76i6XVVuJrk/lKPsSCyb8x5wCb5JOGfXaADqt//QqZ+8fwkY5dToChDDN5b+kjAfqBRy
         v6zI8UmW7Q8HqOWHTsMymJx3al0e7qV47eJ3rjWTMcBg1oGPS0KCP5JTNyCrpWpxi1rg
         onycD5C7dGdE4pygn9THXWw7mZjzetqvMFypZJ0TBRnyLd0gwNnO8sAX6v54JL9M8+LG
         cJqw==
X-Forwarded-Encrypted: i=1; AHgh+RqUirmeO/9q6GKUIaqs//nFKjhSGdsSscLPyzBr7/x5LmwIwdjEIXF6IdXX5QTPjnBzCUcZKMhdT96z@vger.kernel.org
X-Gm-Message-State: AOJu0YwczwcBD/LQFGeaLxzykgekDyM/bBKfXFq+bGeHnzftB1Bo4gaS
	wifxDWUDg6DmlAMashbtfhbz+yXBoaglMXcw21VH1lwjrJrsxFvCTeoY
X-Gm-Gg: AfdE7clLQwci4XVa35kaG+WEw72Vt7+YyWmRIvlrnxzJrr901M/ZA+TLUs/yZwN+Ca/
	eBhrELvwyv3rjpYj3haQo6DpnCq0U2tq4AQqHAh4D/No8S2WZhc6/5xU6r7es86NKwF9ww0KDXA
	wSh/EjLNu5B4hVMKbzXTNIkv3ZzkObkQasDnxcUJOk7SFrTVjO1jo0L5HaBjELBMhJn9ifRQgAb
	cRWRbMzFYYd/1rIObpumjXWCuLx3bdG4L0CkHTE3aWBh5fU05KXfPaV8tfJ1vkgQAjn1poMnBso
	21uhm+XGIVSB82cBIVD0P3CVR/NEUMH5tY8lAfzvmRUIWmmC8FLe9jrKtiwFIDP/dBVrbwA8rhU
	77NoWWSsI33heRcym+4FcNVqjNYsejqaS/3mDJ9Wr/wSGLEf7hm7aYFKDMWe8863maYpoBDZO5X
	tgMqmDRKnY1aKXi6e8iwCNdTPSv1PFx0lAx+2C7nj0S1znIYECbZxQrVYJumR7GszK
X-Received: by 2002:a17:90b:5628:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-387d880ae82mr1470644a91.9.1783400880337;
        Mon, 06 Jul 2026 22:08:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac0557sm4212818eec.26.2026.07.06.22.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:07:58 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:07:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/5] rsk7203: switch to using static device property,
 drop legacy gpio API
Message-ID: <akyJOW79W0xvI-P9@google.com>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-39553-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:ysato@users.sourceforge.jp,m:geert+renesas@glider.be,m:linusw@kernel.org,m:brgl@kernel.org,m:andriy.shevchenko@linux.intel.com,m:arnd@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02EDA7175B2

On Wed, May 20, 2026 at 10:13:16PM -0700, Dmitry Torokhov wrote:
> This series of patches converts rsk7203 to use static device properties
> for its devices, including gpio-keys and gpio-leds, and removing
> dependency on legacy gpio API (in favor of gpiod API).
> 
> To configure pin functions the board is switched to use gpio-hogs, as
> doing full conversion to pinmux is too challenging without access to
> hardware.
> 
> v2:
> - Added a patch to isolate the function gpiochip from the parent fwnode
>   to prevent ambiguous property lookups
> - Added a patch attaching a software node to the main PFC gpiochip device
> - Adjusted the board setup to use the PFC's software node for LEDs and
>   GPIO keys instead of creating a standalone node
> - Added support to sh-pfc for configuring the secondary "function"
>   gpiochip via a "functions" child software node.
> - Converted board pin configuration from legacy gpio_request() to GPIO
>   hogs, using postcore_initcall to ensure nodes are available during
>   driver probe.
> 
> v1:
> 
> http://lore.kernel.org/r/jwtdoptatzfo47mbpmmjwhhhjn4mbw6ekp4gtoopca7azbcelo@uvtz4w2ga5qn
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Gentle ping on this series... It still applies cleanly and we need this
to be able top drop legacy gpio interfaces from gpio-keys (and
eventually from the kernel).

> ---
> Dmitry Torokhov (5):
>       pinctrl: renesas: gpio: isolate function gpiochip from parent fwnode
>       sh: pfc: attach software node to the GPIO chip
>       sh: mach-rsk: rsk7203: use static device properties for LEDs and GPIO buttons
>       pinctrl: renesas: gpio: support software nodes for function GPIOs
>       sh: mach-rsk: rsk7203: convert pin configuration to using software nodes
> 
>  arch/sh/boards/mach-rsk/devices-rsk7203.c | 282 ++++++++++++++++++++++--------
>  arch/sh/include/cpu-common/cpu/pfc.h      |   3 +
>  arch/sh/kernel/cpu/pfc.c                  |  20 ++-
>  drivers/pinctrl/renesas/gpio.c            |  28 +++
>  4 files changed, 254 insertions(+), 79 deletions(-)
> ---
> base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
> change-id: 20260310-rsk7203-properties-82bf2c12b985
> 
> Thanks.
> 

-- 
Dmitry

