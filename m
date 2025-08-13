Return-Path: <linux-gpio+bounces-24328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A55B23F01
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 05:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88FC12A5E96
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 03:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7968829C35A;
	Wed, 13 Aug 2025 03:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9pLRTEB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA11C860B
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 03:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755055674; cv=none; b=AHP5jOY0eZ66l+zuuL/aFpqXUbdIHXyLXR4ITDwX77gO/OPBGmJwtn6u4cU7ZEuqIe+PYfnDXWjyBDqMzP1j+vJWBBnzeHMjC5woe566dM0KUhnlxHblsomGRV4xkaL5UDetbjLQ+8QfvE7ZQnT9Hzufl7e2R4lvGK0F5SKcBQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755055674; c=relaxed/simple;
	bh=YQrPHf0pqZfJxjOIjHTr5Y2iz0C7zHTyHXit5unD/RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVFe4nC+GzJElcsc7BQXOJ8SHXac/++L4X0MZSK0XWCWD60uKBm8+jbHrOrfa30KdmqC6xrgstlleGoyYN4gN6KBYVbet2PNkiGriHVf6K9IJ7hNeTNlhijk8STgYaX6RyJ9XzzqjEryOdvIAvHnCKgZaJHvqB61mbpR47Q5iX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t9pLRTEB; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76c3607d960so6618344b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 20:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755055672; x=1755660472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fpBnIgK+Ibfr71qXD4KWmFUMd9WTirr3XKU3UkWudls=;
        b=t9pLRTEBr7pNeVhG1lU3+oVF9B6uF7+sk+t0bgMrtFRw7pQMqdR9a9huScvfU743UL
         k86GSMoS3VfSjRRJxFb5G590BJ0KE6+DdZgZV/w7g1WNNi+yZLzUU54AUQXmoIUgzV7s
         tMkw2HA/s/Oalh4O9E89VrV0zO6iRn0dPZC4LpD/vGmiLu9zZ66ZlVveJhWH1VdqcJKx
         mRejsDBJfthn/8uSiWKKqm8oeLQ8jqzPSlmFOW2V/CzThpKCmCr9mvvewFKShY1lJxBM
         9vgMUUp0FyR3adHiPBQPb4b1Iy7skEWQXLZkFc7jl5Ym7j5pcOY3SnhRBb64W2a5JTJm
         5xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755055672; x=1755660472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpBnIgK+Ibfr71qXD4KWmFUMd9WTirr3XKU3UkWudls=;
        b=YkXVKtWZCQW1Q2jF/S826m5SaHoSj7CVOopAOAOQ8qdn/KuhjeMb77JPRqtlxPwZVA
         1Sy66LHGP4/qe+IOZUHCeVLBMDLPbIw+V7ST3qVk5dWWcLnIIOgoafy/DlHyIkpfNmIH
         P/2VUNpZcIrQZKVjppp9zxh7wI1QcjO0jskRqG1bTq7ip+TZZfyMl1RxJL2bU+YFqmW8
         x9cNebMFH8urVLabe+YyLrAhdRr1iR/t+GDXzhncaztyCGT4H/N654zsxVcT1FRGjFZR
         wWKUcc5jpA6amYIXX6LKQRJhXh8VTTcKV2oQQjiUs7lyjXNTSvDLWTbqUisH2/3xlJtU
         XcNA==
X-Forwarded-Encrypted: i=1; AJvYcCW+eGmPINtAW5c74hJP9o4lAyZbkuzcin65d0w7NZ+UIVXgsbxwJSRWd023p1Qpc3kNWpeTEmBkK/ct@vger.kernel.org
X-Gm-Message-State: AOJu0YzcvxiVBk58plum6qpIGcLYPpfXQcmvIg2j9EefrXmH7y9NSgzp
	uRZpVNrY3DIjYVCkddx2qFnAwCChEGDP1yCniSp1eJttCp13xCXFzlVX3QVHIdM+6UQ=
X-Gm-Gg: ASbGncu4MT9NQ4KRYZXO+I99TjyzTJ8GyCrdEkLWo2/E/ryTke+2HPsNhr572Hr0qR7
	1Ip9WMl6+X6hj+X4omkQAX7G4SrxHna5leF8s6fyAoNhUGhuc2igk2S0nQ+C0zDYZ/0dttK2fka
	zr1IhNzTYxRkfYt6HkzgeZNyQVGylChfb9VrE5FeOg/rVEqiauHCg3gWdSZxJDOIXLFgcCbKNte
	P6da6CMgk3/urKiSLIFjTf9H9fRokMc5AS20oT+XuuuDhSdOAKD7DVNXkeQCUaXsl65R3zJkTrl
	QOasiab+k9+It5fztcQ8sjRdNEr1F1w5Yb4SfW5tQAwJM3+oxhI1QJrFTbGdCiQHBLeW7caQnXV
	lYCSmCbbrSDTs/23kIAvrADhsoQVu/c4V+mo=
X-Google-Smtp-Source: AGHT+IH2xXRKsl7dWFXns/YTsaeeCYnrB2CbW6dH/zobk3GjJDEQV+fMaXTdK1d9xhDH245ICpVT/Q==
X-Received: by 2002:a05:6a20:94cb:b0:23f:52dd:2d1a with SMTP id adf61e73a8af0-240a8b9ef29mr3032123637.46.1755055671874;
        Tue, 12 Aug 2025 20:27:51 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c613cb7adsm9774642b3a.38.2025.08.12.20.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 20:27:50 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:57:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Erik Wierich <erik@riscstar.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod 00/10] bindings: rust: prepare v1.0.0 release
Message-ID: <20250813032747.vkdqpa3ttq3gwa3j@vireshk-i7>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>

On 12-08-25, 14:10, Bartosz Golaszewski wrote:
> The libgpiod rust bindings interface has stayed quite stable over the
> last months so it's time for it to stop being a v0.x release and become
> officially carved in stone. Bump dependencies and rust version to the
> most recent versions available, fix some issues and then bump versions
> of the crates ahead of the official release.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (10):
>       bindings: rust: make Buffer::read_edge_events() lifetimes more explicit
>       bindings: rust: add missing unsafe block ahead of rust version bump
>       bindings: rust: update bindgen dependency
>       bindings: rust: update errno dependency
>       bindings: rust: update cc dependency
>       bindings: rust: update system-deps dependency
>       bindings: rust: update thiserror dependency
>       bindings: rust: update intmap dependency
>       bindings: rust: update rust version
>       bindings: rust: update crate versions to v1.0.0

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

