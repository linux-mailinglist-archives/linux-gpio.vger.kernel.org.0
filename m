Return-Path: <linux-gpio+bounces-16145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC31A3868B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9153188B3A0
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33602223300;
	Mon, 17 Feb 2025 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Whd1gznZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF75221DBE
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802858; cv=none; b=q1UhyVp7v8DUUscqNwUfT5+Xy1CzqSdDJ62V++9TINQc1znYaWS23h9hbprJOL1+GmKE3e7IalM/NojgeRvPKA5DNM9jSfMAJE3A6Tb1xno0apk+XDPPoy5bj1gC3xRojGWfOECOs5lgbRlIW7/kVN2jaIXE2eF9Dgi8wmmfin4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802858; c=relaxed/simple;
	bh=+dQh08J2Wrw7tq8kkvKhIgSeuAw3wVHIEItqCvMFpSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuyDXyKZHBio5waz+yFzPkNcv9m0rCGOGqWTwtXMFPbvoaElZLyS4/jQdPMldLwtxQdUlI311X++Jy0Mi0XSg+3DRGX3CtQgOSAGz3iY7sTnp83ebe3aqSArl6ZgVToPpupgn4Tn47vZkbYz8nR+z3SzSA/S/xGvjn0ATeYU2o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Whd1gznZ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 052ED3F2F0
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802855;
	bh=fFzE+iQ7/6Nth8qy0xHPs/Cj4g/jlkWpDyJC+gk/5Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Whd1gznZS7qjCZPmEOH+BNQXqEuduvatVPqITjO/P2eeXAHjtWPa6E8unkIOR+KW6
	 eN/CCGITrJfpzylyDPgrwjvfCrNbAdvulHnoa8RGvDKyPXIJk0jLNesmYSnp+4GlWA
	 IOC0I9M7NIPHBOQuZldKwgs8iPJa3BdZ4UNxYp4JlmdLKs5lmCjV6/T+zN9j6F8UEA
	 F3XVDlgX4QZ7MTNzFh1zOkHoHW2EZ+xebnx7pXwFw6HzXKE5rZAvRdvsjN9eVkA7OV
	 KBjjsFWeE/csgWZXrO3wDfKd3Lhm/Pq4VNolYwzro5W5Co3Fz6h53v/QkMZl3HcVnU
	 ueNpHmashDuYA==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc43be27f8so6492724a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802853; x=1740407653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFzE+iQ7/6Nth8qy0xHPs/Cj4g/jlkWpDyJC+gk/5Yg=;
        b=h0vjwwZ0+xmzmgqEhPmEjBELAoe57n8fVU5UjS8jjc6nKa4vwGB1glPTOu2sSFLTnt
         Wfai+PH+RlasB1lK+wMQPx+DpGz4A39n5KIN5oSasChP2dwzVCmybfD12WSDoTqYefDa
         nrML6W/bkDJIEWzZ9H+bH5QjKNDlxwF6LFNnEgUEljk4g7JdxhTZTVs2rfqvCcsDnk6K
         lF+o+CLWqQpiDlbjsoojh2RrkiorVRGqE0Mub5A5RMu6umSNN/g2Ple+BRoVfBn9W3LC
         OdW3OiwAHyv3yRIBAVIjDPCNJy1KGVPS9f8r87RtMkc6y3NOQHpmpEzaMr/MZFluZx9r
         8c7w==
X-Gm-Message-State: AOJu0YwFqXcUQzuCA0MQoXpmlsZq5uHAWzXPCo/iBPYXYTfdxDpYSFVg
	xgglXgTbESw72dJuow6g7zOyVrK+HKzjAomYBCBo7Vi+8ra14mQ8LsSHOP2SPsydeedLZXFxiPo
	9nQCXM0X13tSma7VGt2sdr1XvdXahDZ7+yJZbQca3jt7rEX85FGqA341H05Ktlw33CPTwBC0kQl
	A=
X-Gm-Gg: ASbGncvzv6208xLeSjK+rb9QVOKDEN+0hp737F2G6iIVqU56xg1+AhIVC9CnuNxUTc1
	jIATtHdHbIa8Fu0a2F7d/q3U1UDZrNqlGCSGRDitDw0WlPRqqvjgoocLBwaDgJsjO6FFQwjCYJ+
	LbbvFRvI56WEhzv3kwtLSS8n3RlrRtYVZigfrHd9vsqK5COVA3CSB4n7RcEn4vZO9Hc7lllKZRK
	qkutv6jhyrQbjOPbGwMevGAWOWtHr4nq7zxUcIzwtjNJcyIZyOBAfS6u4ZMDnWQ9OrBz9RRtEA+
	CaSjGbA=
X-Received: by 2002:a05:6a00:1a89:b0:730:9946:5972 with SMTP id d2e1a72fcca58-7326177f450mr15128559b3a.1.1739802853702;
        Mon, 17 Feb 2025 06:34:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzREazoIMmolG1CVLrZY207BcM9g0sp5SvtvoFagvZGNZkcgfkEhbB+UfODQIu0yZpQ0fDBg==
X-Received: by 2002:a05:6a00:1a89:b0:730:9946:5972 with SMTP id d2e1a72fcca58-7326177f450mr15128543b3a.1.1739802853432;
        Mon, 17 Feb 2025 06:34:13 -0800 (PST)
Received: from localhost ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732642d908esm4592726b3a.159.2025.02.17.06.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:34:13 -0800 (PST)
Date: Mon, 17 Feb 2025 23:34:10 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/13] gpio: aggregator: reorder functions to prepare
 for configfs introduction
Message-ID: <4ce6vzqsmjk4l7m4riraurpgmdhhvdq7e3spkgo5nvnt5uvgav@6aloxueo7ypw>
References: <20250216125816.14430-1-koichiro.den@canonical.com>
 <20250216125816.14430-2-koichiro.den@canonical.com>
 <CAMuHMdWZy22ckxoLOWH4x40VE4pRsBCfMDXJZ5ZYcu-ABFKRWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWZy22ckxoLOWH4x40VE4pRsBCfMDXJZ5ZYcu-ABFKRWg@mail.gmail.com>

On Mon, Feb 17, 2025 at 02:07:53PM GMT, Geert Uytterhoeven wrote:
> On Sun, 16 Feb 2025 at 13:58, Koichiro Den <koichiro.den@canonical.com> wrote:
> > Reorder functions in drivers/gpio/gpio-aggregator.c to prepare for the
> > configfs-based interface additions in subsequent commits. Arrange the
> > code so that the configfs implementations will appear above the existing
> > sysfs-specific code, since the latter will partly depend on the configfs
> > interface implementations when it starts to expose the settings to
> > configfs.
> >
> > The order in drivers/gpio/gpio-aggregator.c will be as follows:
> >
> > * Basic gpio_aggregator/gpio_aggregator_line representations
> > * Common utility functions
> > * GPIO Forwarder implementations
> > * Configfs interface implementations
> > * Sysfs interface implementations
> > * Platform device implementations
> > * Module init/exit implementations
> >
> > This separate commit ensures a clean diff for the subsequent commits.
> >
> > No functional change.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> 
> My
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> is still valid.

Thank you, let me add the tag to the two commits in v4 since they remain
unchanged.

Koichiro

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

