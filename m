Return-Path: <linux-gpio+bounces-34429-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMiTBNhxymnG8gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34429-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 14:51:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BD135B4E5
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 14:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 716623054644
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 12:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8532A3D170C;
	Mon, 30 Mar 2026 12:46:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9330E0F8
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774874790; cv=none; b=hH6Jyim+XE1iJw6BmkeEa8sc/c3XJ6oBJSU+MDmctBeGsD/vGozUumj4tV6At6+QXkrjorjf963bEby0NbZ4fyYvSF4Tt8iMCZ6YWDno14keJGJ3VYMxxVyR6G9hUhFhZDsg/hx6ez9Fhir51zlWtWm15HQS4aI+777T/LtHvWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774874790; c=relaxed/simple;
	bh=lB45oT0qV//PSIO+hRlzy/2aerfApy+l9oM54qr18pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCay131nPoGmcLIW3i+eMwQ4yU299R5R8ENcmoTyRVxF2I9h32hWLTBis3oI0Qdd268/GK9xInXa+XRaUjfK6Rk+wsrMpO5WbUjgcQCg8ha0QxyIpTk7cXv3gz3/OyNxQqZcO7FE3QO2rWIJaf69WvWFttX9HHYfJaGZ/JfCvBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-60291b2cd89so1256515137.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 05:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774874788; x=1775479588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xolGyxIn+SlEtRcicBj1Rn7AYiS+fEJHpWSE38M1Otk=;
        b=A6774PHdYZ80Rva7fVeTTXmaif/4sqHqIZMFjp+dMGeq/4Ga/WbI3nfvkwZfbqM+rG
         zrUHnl8scpt3snD/jSWhghziKbnf4I+tTi30nftR/n1J4jFOtQOcvLmpjFZ0i97Xrnhn
         wTz6pdzcblK5PzZpBIHuU7zYBAuMJQJMhOMYBgFdzMfz4pngNIjjNLbQFKppyweYTwBh
         XvbPM/AkJoXGmk7Xv8w/LtBg+vc/s35UlJgdar+Uw3XvzrpzB0gO6fd5aSYAVVUkxQtg
         Be1eJ2kE1BW6dRxRsRPEhQB3fhlXKz3JZ2zlN7DJdSbcjAXmYc2g2KB3laOTH3xJwB6C
         D0rg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ4HEOdvsJouz7sdfEul2hisRu1SdZ8ud+2ZfIk55voneLaxJ90xAvzX44ngESTEwifARubX2ohFRy@vger.kernel.org
X-Gm-Message-State: AOJu0YyC7IKP7aZmul2CICCYbdhgqa3PQaeFDec3Xy5Ii8Ha92b5Xbk8
	rBt0vjwldobDlcHmhdCFwTEeQ1DMmbmQtPmGIvK+NZ7Se3MNIRCXfy8/IjRjUj/s
X-Gm-Gg: ATEYQzykqeuXjju2oi6HU8i7uvKNsaZlSvFiCn0ywSuFcJEcINut9mwUpm4f6WQ0iUs
	5h5T6CdRWuvkeEZTfSbQFvynyt4WKnNTCmfwdWGQKX7C5OOYCKODvA0Vu80nYNXhIP+cLQYnVwS
	UjmgDQM/8aEP9NzsMKYjmFUpW4xQjbFYQTJrEaX9WkCd3O7pzGh1i6ni43yl9ix8FeOqtubEXLq
	BVXA/+A27Xp1zi/JauCu7T4FLSYZYCp/hN8id5sCZugKsq4eMK6GcVeiJ/xsvEw8vz1BIwFgnbp
	vYsCfv48ghirht8sTtaeMs0LULl4flbEg/QZ2AX1aM/l8C8FqvkJoJJTTApiQa++nW+OzdPkQbb
	KpRqBoJO7paoSavJF6H3FThyq1VOlsofILj/SqM1UEziAklgt9Vh2UY4lTAjvqAyEKSmhoJERfP
	ejg/oOPfpwccbA7ZUzd1rBhyVJMOQUdV6baxAQ/nDvYDLEvXG3TqAtMCs+qZrcYu7r
X-Received: by 2002:a05:6102:41a4:b0:5ff:1e61:b303 with SMTP id ada2fe7eead31-604f928b23fmr4097228137.17.1774874788074;
        Mon, 30 Mar 2026 05:46:28 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e2604e4sm6864849241.1.2026.03.30.05.46.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:46:27 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d3fa1ea69so1248506e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 05:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBkI4STCscp5jo9KqaYrTlInnEXOOA2lgI4/CgHSV6ExPud/tHJvzEo25Fh+vI7YrabUs8Z0QKPF4p@vger.kernel.org
X-Received: by 2002:a05:6122:1d03:b0:56a:9841:efd4 with SMTP id
 71dfb90a1353d-56d4a4cabbfmr4118253e0c.1.1774874786593; Mon, 30 Mar 2026
 05:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-gpio-hogs-multiple-v3-1-175c3839ad9f@oss.qualcomm.com>
In-Reply-To: <20260330-gpio-hogs-multiple-v3-1-175c3839ad9f@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 14:46:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPpfbUo3c0GCkC_gocTDX2TDscW6jKatSGqQy2DYByQA@mail.gmail.com>
X-Gm-Features: AQROBzAQzmlOCiRISJKC69C3IZwq6Jo_UUKOpm2939SVsRewA3hUQoFHjDhN62g
Message-ID: <CAMuHMdVPpfbUo3c0GCkC_gocTDX2TDscW6jKatSGqQy2DYByQA@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: fix hogs with multiple lines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34429-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linux-m68k.org:email,msgid.link:url,glider.be:email]
X-Rspamd-Queue-Id: 85BD135B4E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 at 10:36, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> After moving GPIO hog handling into GPIOLIB core, we accidentally stopped
> supporting devicetree hog definitions with multiple lines like so:
>
>         hog {
>                 gpio-hog;
>                 gpios = <3 0>, <4 GPIO_ACTIVE_LOW>;
>                 output-high;
>                 line-name = "foo";
>         };
>
> Restore this functionality to fix reported regressions.
>
> Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKczSk12MedWvoejw@mail.gmail.com/
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v3:
> - Fix types for some variables
> - Make the return value check for "#gpio-cells" property stricter
> - Link to v2: https://patch.msgid.link/20260326-gpio-hogs-multiple-v2-1-7c3813460e4f@oss.qualcomm.com

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

