Return-Path: <linux-gpio+bounces-37256-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJi9H+DPDmq7CQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37256-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:26:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF295A24E8
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F9D030700B2
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 09:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE8635F610;
	Thu, 21 May 2026 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1aLfzxK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ABB2EBBA1
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354737; cv=none; b=F28p9bCa85z9lxxEKN1uqgTkYAAlhOvPyMi3+UURouBDQhG+yRR15i1ypkfjTOEZ1rQWzC87E+fOY1Lc0O2Bav/3Du09Z/JsaWOKhf9JDoQtGxuorfseCpLBJaY3mvd9D/WFz+jRrGImR1O0iV3A1s81owy3UYi6g2IGoOxXOzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354737; c=relaxed/simple;
	bh=pxAY+BPA6oodUM4WsMZlnzbfV5bQFDEnexT0dsbG5pU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIUn7xmB0oW3tF7u0LclbY9Kwe5O0sspahQysktjY25KOL2Og9aVPKjrmJUj1xeunaSDxQTbwyiaTTW4yrkqjQrsGChnqWBoqE/ddkmKC3l18nUrdz9Mu6Snd93ucA+KZ+fEEzge+3aEoIYzE4oOZQZJFhgQPJApA/XqRAr4Ol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1aLfzxK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E011F0155A
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 09:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354735;
	bh=pxAY+BPA6oodUM4WsMZlnzbfV5bQFDEnexT0dsbG5pU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=f1aLfzxKefymoYxBdmSLCuHx4bXJxu0m4gl+bbvA2I0Zsh7rmZjbhb+1QbJVIS7gp
	 DFkb/fYpdEFlDVKuz2sh4OUcYy1EkBpK6aUI5I/JDCbfI2ohR0lU30VbHgO6DVr040
	 bKfO5EhBgjDT6yHydQOUcVlMI+Lgg+Zf9NdoKQ0ubL4mDjN2W2CB50fW/yOBeNVvST
	 FEcrc77eQY3MNy9biywzXjXdthjOG+pKWhUaQ/IG003hBDlQntXntYilHDMiLQT+K9
	 aEvZXS5ywG1JGNTsla/ZTf3dpDH5UpzzC4PsgQtDjcqpa+lnwAu3A1HdF2sQk6br8K
	 VnZdrBpqbqk3w==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1353c2f35cfso17926163c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 02:12:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9U0Y+GDUS/uBI4gzEH98eEOz9sHnVLfQgYgqw0n79s7tUIu7xfCG9vpfhlcAAS3n2XNAoeg+M5/NHM@vger.kernel.org
X-Gm-Message-State: AOJu0YyHk4ACirg6lmVfctAxYMvjKCKUMcSWaV6XaS8b0PmQce0jpwEz
	PSLtqOjFfjE5UbhzXG4231kosO0XoZrPN0M5PIUwIjnXbZqS7wB6B5Rc99StsoBa7oCq7cNdC9c
	CBqSMJviSGjRQrqVyfOUY1bXMGhLn/p2q96g4At3cgA==
X-Received: by 2002:a05:7022:61a1:b0:11d:c86c:652e with SMTP id
 a92af1059eb24-136328fdf1dmr1131375c88.5.1779354734589; Thu, 21 May 2026
 02:12:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:12:10 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:12:10 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520-rsk7203-properties-v2-3-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com> <20260520-rsk7203-properties-v2-3-465f3308021b@gmail.com>
Date: Thu, 21 May 2026 02:12:10 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeCs57s5BSy7ypW0EKrii5sTC-Z1gZ_3J8arM4BnHMSwQ@mail.gmail.com>
X-Gm-Features: AVHnY4LI8SlT0gdHSpWadK_3qjqUEr2_Atb-tVShMUDmRPs-prXE65sV3aiL6I0
Message-ID: <CAMRc=MeCs57s5BSy7ypW0EKrii5sTC-Z1gZ_3J8arM4BnHMSwQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] sh: mach-rsk: rsk7203: use static device
 properties for LEDs and GPIO buttons
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37256-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CF295A24E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 07:13:19 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Convert the board to use static device properties instead of platform
> data to describe LEDs and GPIO-connected buttons on the board, so
> that support for platform data can be removed from gpio-keys and other
> drivers, unifying their behavior.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

