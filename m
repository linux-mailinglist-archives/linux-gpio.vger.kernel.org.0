Return-Path: <linux-gpio+bounces-24371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76321B255D6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 23:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 684CB3B31E5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 21:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADA92D23AD;
	Wed, 13 Aug 2025 21:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvCjV1Ea"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B559D271A71
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121569; cv=none; b=iSePsq8yZoF1u0kY8MFYRB70AGhzXtZbyY0DNQeDKwZ0/GC2unRnGWjPFm0jtaqvmlCcgwo8CKJnYn6t2sBj+exta8HhTSLbVkaArcoHOYSRoDZNpKaq59TJvK+zmfn41gSvARRvDIjEISZSPUZB8b0edZUAYyUY7vqi8TDlB00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121569; c=relaxed/simple;
	bh=jIwjqOg+sbjIc/EUA4O97i+3hThQAkP3k3muI8lHGFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuqBSCfnhwYtoNUeCLkWAVgvlMuFSVNtMuFFB5B/hlXYGDBztneIMdNfeGWYHFSXNeDx6BayLZV8nv1UX3hKKg0ZbnMLvBs7rW59O5vc15xrGIG96df1fstL4E5LAhYrkmfUygDHJI77fWJZUBq1AZ85GAThGHRRtpBJCGyoOdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvCjV1Ea; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55ce5284d63so207755e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755121566; x=1755726366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIwjqOg+sbjIc/EUA4O97i+3hThQAkP3k3muI8lHGFs=;
        b=gvCjV1Eaf9kHCwIQio0EcRp6nPFL4Y+M2vK0KkUW27s+SDeMAzQzR1992y4TiXQP2J
         Ta4O84hBOkGYm9DhRznkiP5/LfzXCjnlpL6/xbKKAFPzGTVLkj99JdQIxnafJv4BL6FV
         BNLjn09Z6sMTC15TRnsbYh8WzVauswaiv7iYc9BDjPLPEv51f8iLoKZ402yBzwH+T2jJ
         NEGxl7XOuy8MWCQ+qRwHRYU5zHFOFfeZHxJbCAcqU/Sbh19R6EzUumBMCAJKcYS9smu5
         KWmNs1VkY5hyY2UDH1+0DNSiFRdF+dPGacYQ20T00TD2e8BPLr3ZXnro5TNUy5ircRJH
         i0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121566; x=1755726366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIwjqOg+sbjIc/EUA4O97i+3hThQAkP3k3muI8lHGFs=;
        b=ioWmu80AFwfIq5YU3OFPRzTHFQFw4od/XBALSXY1PC/C0ZixdpWAMx9qtHK6VgX2Ne
         pI7ofVrrOBIdLhTXvJJGUqfJf6OeU67tqFSOjUlUKndJNmQ5w65Tibugl+yC4UAwBgpp
         zpErJ/VCM7t2WnrlZsxF2Q3LnTLLTTq/kEsVlzhqKLzyApKuUwT/uF/Ynjo5fTmNXeSF
         Yizxerdx6hw9eN4w1gfk2oJEKQwfzxPq3JxpsB0ZrzL8o3VwbYDIiLkr7/ADHYqFx0FG
         +dbTDCwVzihmmFJS07QoLW6fsfM8Xp6k2q8an0jztdYYYMLuE3jNBplbk0dO/FfXpjkg
         DVAA==
X-Forwarded-Encrypted: i=1; AJvYcCVHa9q0/Ok2HpTYrErcDAqLTQsFI5rPvqQ3FRy+hO2wWQwquip0IJPxTCk1ewWOKn2/kQ+x6atv21M+@vger.kernel.org
X-Gm-Message-State: AOJu0YzvbrJ5NR6caie+AQKHelXy7HO85OqhRROLriiDB3tM/Z0hqc+a
	na162R/9p/oRd8JZqzXnHXLQAjby0KQMfFMm5AXiKhZbCtH2bzKJQ7PvoGu1obOfUfemq2PIbG2
	7l2bg/GF0ZHG0hIDvK00/8nyti3p9tvkgHIwmWIJ40wHjWZwFaVeE
X-Gm-Gg: ASbGncvuSUf1nNZWSpFbuXa00LLzgEfkWW6jU48+4HGgULEDv0KGS1JwiUcd4gwIJCz
	p8Uqbc0N00PNaFYgb9ywzJQqfhEuO3kgg+zlS++UUj7Hq9lDYS9DSZdOfThFLpiz1qux0wtkT5J
	k3Gs211ovJQjP7a5dwBdxitL7nhJhVQaqYLStcQCnv/v0Ya5KqVx0MmZHL65e4LI9gF8XRCub1d
	LltBoEKoMAc
X-Google-Smtp-Source: AGHT+IHPpLfNI72JEnkJ72QqK+MH5mMI6L6pUf7fP52T1h64l8fKj2i3STMxyB1QGPLj5fBohjsdNLTKE30239bPghM=
X-Received: by 2002:a05:6512:401a:b0:55b:886a:6a77 with SMTP id
 2adb3069b0e04-55ce626221amr118620e87.6.1755121565870; Wed, 13 Aug 2025
 14:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811135114.70119-1-brgl@bgdev.pl>
In-Reply-To: <20250811135114.70119-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Aug 2025 23:45:54 +0200
X-Gm-Features: Ac12FXzRt9FsRkefIOG46I1xe1PWl2a-MXzEb8BiCd34oriZUEGjbeWDN64AFtg
Message-ID: <CACRpkdZC-_bsM-M=g6SPKd0wFE2Uf=g1hhQMXb-exE74hXdOiQ@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between the GPIO and pinctrl trees
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Richard <thomas.richard@bootlin.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 3:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Please pull the following set of gpio-aggregator updates into your tree.
> This will allow you to apply the final patch in this series containing
> the pinctrl driver for AAEON UP boards.

Done! Thanks for dealing with this!

Yours,
Linus Walleij

