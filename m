Return-Path: <linux-gpio+bounces-17470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B005A5D3E3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 02:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D56D17A26A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 01:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FA012D758;
	Wed, 12 Mar 2025 01:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXbu7UEJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439A68635E;
	Wed, 12 Mar 2025 01:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741741982; cv=none; b=laK41jl8lXImD3myl2jeoOCVdrxDx+quF+hsOLd9obI/hJhz/OtZub/JvYWnjJjWif7soCiWag8Aocoo1VIrQOWTCaU8/nZIbAoApafpOK7beQYJN4gsQZh6+AXfi/uUFVVEreC4UhEfxM0cYecNhG48d48Qk3UBGyQCZdju9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741741982; c=relaxed/simple;
	bh=7as6cEWnontO8REkyRl+G5+QXXQ/DkzlBTqVXHL1rFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9rWDiHl367WDr3zJczGmPotlUm8ZUdr58SsCqkh4y80riXlzH05WL0/RlopcctWU9oLs3xJsdHe9VhgpMjBcoxaPEysHVSenMNFTvSq4fJu9LoIeq6EtRPf3/XDEruA4Ah3dW3Dxi5WJgJ5HEB9BPmT6OlsaFb523gi2rdz2QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXbu7UEJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2232aead377so23539755ad.0;
        Tue, 11 Mar 2025 18:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741741979; x=1742346779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7as6cEWnontO8REkyRl+G5+QXXQ/DkzlBTqVXHL1rFk=;
        b=bXbu7UEJPIa/eNdoQiniBPe9h0CZcrDZqRYm+RvAOTmaUA1OPiBr3kezOZBGzPAB0k
         NmaTXtQyUtpisnFDX51S3MsWafSFnR3EtCdB1zg0Aqe8jopU1mmDrRyvcyGW1lAPJKFL
         JNor29cctE7/y8jeSlz9+MrxMndyBqQmIkGhYFd7Q9V4IlE53bkSu+6Z5qDbAmjW7Ubp
         67vK7zaTxGT6WiMxJuyVBhUOzr3FAndqFK8Zpw7zK7V3IrH1QshIu0SEketEuuivc3LC
         KSgfP5DW6rkgNz4+fK5CFsYY6jlrlPFC8LZT0jzKQDZ8PsR9/uzvNfbEokaToG7zG5UI
         y+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741741979; x=1742346779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7as6cEWnontO8REkyRl+G5+QXXQ/DkzlBTqVXHL1rFk=;
        b=nNUxeaDGpC0o08aXdSU+iV7HwRJjs0RJbLMlz1qt+bWqqvTKPBvPDKq7OFwQJeRglk
         5qWLmtSsh4lmauir5BoKGLErTrlbzRtOhZXEku1QZluQQ4wrZTx/1aGtEYIZXW8sNNJU
         zaGEwsXFmZjO0hHci45CGvbIxyzfanOv5pifXTOcsFC9vL4GbcRaASykqmFnVP2fPyM8
         iOsrVKuhIKeSdLOpTAlm9wYMBaWfsCgZFRZfzhUqj64fQ9IQG7rsP9MvIibC43VyT1vk
         S63b02UgY+tz1fuoFEFboESvwnw/3CXSiIwvqOO3cTe/41U9lEjsccMuxQhbAIxwM9CQ
         6ELg==
X-Forwarded-Encrypted: i=1; AJvYcCVSZY9Mc8ND659ZS/z+3/POIVXSWVYnp1qc82sfB2ewT8lGFDLtgmyTSZKiOs3+xonk+1CgBu2MzbQ23+pL@vger.kernel.org, AJvYcCW9/s7kcUQLtjrKdhH4oBxlOFa2lPUTnAJe5lhVm2LMayeyGB8SO1B0Ln9y9WIAv2VboIvBlSyBHgfx@vger.kernel.org
X-Gm-Message-State: AOJu0YzcPdRjVYGLah6y4a05MbNiwoKeXt4RB0bDTC+7K4Qc3FVjvepX
	yrRN2oGbPwnqH0bvyjcBauYz7zPndmBZSNO7f0RQqXbcVGlatGvkQt3FTLqw
X-Gm-Gg: ASbGncu72e9WpgNpMbEs01Z37dca9P6ApuiuDnfJZW52pcmaN08gIpvq/e6nDn14yTA
	eQco+ujBhg327x2S5u8Xc7b/xIHLKHBo2WEY+x8MOPTuL4/gDMTxQmw8v5nt8ZBvJ/fu9hrkWew
	vVoMMIO3jgXQni56zcItnXsPKkGlqHEZ+T2JdvEotmk4uifSYjrxTavr6peaeVUYyxYG4kNrUtD
	eCoFbAjUj+YRfvHQcKAUiafDZZuSiZKlOy15ZI0thKL8ZNRFaWo1c1BEzyS5Lv2wqcKSkdexZ2W
	BOLYDRyTIYJ3GgSdW0E9AjB9bBmDutTmOuMzDaLTzcZ5ehBVnX7T+1f0Dqduwm7piqZl
X-Google-Smtp-Source: AGHT+IFMxQ7CQkHp22Vze5uVk25KSZJX0xrmW5/1b7N5MElPuoMz/IAxU1uK0PuiClkEDqH0A1EyjA==
X-Received: by 2002:a17:902:f648:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-22428bdec84mr302680055ad.37.1741741979493;
        Tue, 11 Mar 2025 18:12:59 -0700 (PDT)
Received: from rigel (27-32-83-166.static.tpgi.com.au. [27.32.83.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e944csm104781515ad.74.2025.03.11.18.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 18:12:58 -0700 (PDT)
Date: Wed, 12 Mar 2025 09:12:54 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	David Jander <david@protonic.nl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFT v2] gpio: cdev: use raw notifier for line state events
Message-ID: <20250312011254.GA27058@rigel>
References: <20250311-gpiolib-line-state-raw-notifier-v2-1-138374581e1e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-gpiolib-line-state-raw-notifier-v2-1-138374581e1e@linaro.org>

On Tue, Mar 11, 2025 at 03:31:43PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We use a notifier to implement the mechanism of informing the user-space
> about changes in GPIO line status. We register with the notifier when
> the GPIO character device file is opened and unregister when the last
> reference to the associated file descriptor is dropped.
>
> Since commit fcc8b637c542 ("gpiolib: switch the line state notifier to
> atomic") we use the atomic notifier variant. Atomic notifiers call
> rcu_synchronize in atomic_notifier_chain_unregister() which caused a
> significant performance regression in some circumstances, observed by
> user-space when calling close() on the GPIO device file descriptor.
>
> Replace the atomic notifier with the raw variant and provide
> synchronization with a read-write spinlock.
>
> Fixes: fcc8b637c542 ("gpiolib: switch the line state notifier to atomic")
> Reported-by: David Jander <david@protonic.nl>
> Closes: https://lore.kernel.org/all/20250311110034.53959031@erd003.prtnl/
> Tested-by: David Jander <david@protonic.nl>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Works for me.

Tested-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.

