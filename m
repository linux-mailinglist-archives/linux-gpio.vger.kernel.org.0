Return-Path: <linux-gpio+bounces-37257-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLpbFcDNDmqdCQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37257-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:17:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B705A21BF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F5CB303ECE0
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 09:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CF73644C1;
	Thu, 21 May 2026 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeC/Lzn6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992735E949
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354761; cv=none; b=euL0texJwdrGaMf1HJSfKYFRalj/w2c4DiWNJ1/joSKdXlYtFIHKZbkYjkQw1bhV6tv5wkaBwg1KkIvkyfqY0APbsKrrxyD/L0g4qo2WZ1L1cIUGn0YndevyQIWxq6yhOW68U3zE3ewX5KG5ovGDoQehEC0BihzMvYk3x0i+RHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354761; c=relaxed/simple;
	bh=BQlRLT8ZMqrgKz+JmLxRp2gsszTTQp5dbEQS1CO4hpE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRl9708V7cxSsHOhwBeAJCMsXg2REdvGQ65XvEAGmv4sjQSZH16CrDW45c7Uw3pplnMwQeQ7u3fs5y9zZLqY1ouMV53r9G9OxmG6dPhnfgmHIT9GBiZdQtKfepgIjYn7ZboSf3Sk34OHuhaZLdm6b3c+JDuY5YJRoB+VNa/futw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeC/Lzn6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60EE1F00A3B
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354759;
	bh=BQlRLT8ZMqrgKz+JmLxRp2gsszTTQp5dbEQS1CO4hpE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aeC/Lzn6+7yr2bL1+5FEfk6aGmja/PeejXoIFS5E9tvX86cs0mBVUouOGv7geut3P
	 mjHmzfJ7a0cbErdnBf2pAHaS+xgZvkmO6x0hg7XcABqjp67e+Y77vtgNrmLJ3wupr3
	 MeXk0hYHVkZzCSKstP5M4CRsMpWwd9TfWnCs/3JtE8R5eHVrtqIe68UJDLxrvmfbV5
	 6xdXH61AS6WzF9100XufkMaLZUnW87i4eVJ6Q8mGLarEBqy3XZQVZo5EJHNyY8E56j
	 9fMUVXPeHIJ/8IQGK/I/1bRiwFJ2tDIHOzTr/UAxP2Bq+Lc9OSLAaXYG7ugUTSJMLE
	 AoRjsP98smojA==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13621cca8f5so1727331c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 02:12:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ88RnKUj6l11CdTHTLWPg4EDEQKdxbaks4h6/kTmWvtYicUgPAjOzowoycX9IMPogfNFJuKGXJ5P6WL@vger.kernel.org
X-Gm-Message-State: AOJu0YxlaFxDS5pdj0ezLwXln/OnQaYJJBxCJQkfTOlA2n9sBTODmVVH
	HVWI17VonbfGv4M+po2cnN97XqOZ+Zxlr3K5t8TDdvncHrerAh9UdNbLmRYDmo2n/F03Oddh8Qb
	s6FayxaUQsUn/WJWvx42+AbPyR1tzqRi77Jw9KfLF8w==
X-Received: by 2002:a05:7022:4a5:b0:12d:de3e:cbfc with SMTP id
 a92af1059eb24-13632e5811cmr991875c88.35.1779354759208; Thu, 21 May 2026
 02:12:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:12:36 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:12:36 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520-rsk7203-properties-v2-2-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com> <20260520-rsk7203-properties-v2-2-465f3308021b@gmail.com>
Date: Thu, 21 May 2026 02:12:36 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeJ4AYjiTVtBYGbSmRuLWRiDv9ZKhKVzzQaGr-5DADW_w@mail.gmail.com>
X-Gm-Features: AVHnY4LC8IRkWUlbd_hmxJd3JslHIzNCefYzwrusOMyrrToqYxTSp6tyfVJxRHc
Message-ID: <CAMRc=MeJ4AYjiTVtBYGbSmRuLWRiDv9ZKhKVzzQaGr-5DADW_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] sh: pfc: attach software node to the GPIO chip
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37257-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6B705A21BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 07:13:18 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> With commit e5d527be7e69 ("gpio: swnode: don't use the swnode's name as
> the key for GPIO lookup") gpiolib requires that firmware nodes from the
> GPIO references to match firmware node in gpiochip structure.
>
> Define a software node for the pfc gpiochip so that it can be referenced
> by boards using static device properties.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

