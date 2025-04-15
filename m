Return-Path: <linux-gpio+bounces-18896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E45CA8AA7B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 23:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B03D83BD0C4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 21:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E4D255228;
	Tue, 15 Apr 2025 21:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUhbFJ0E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C884221F2D
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753886; cv=none; b=I1vVDCuA+TgfiYupeJD8pa1oPHknhd5rl82xBdI9/UVzNetYU7HoKgqjjasLFX3J7qlpsEgfXtfRtSOxv8kVLFFlrLDzs5k8ytMk8kzCcIpMlmMFOcP4ujBvqBYwWv+7harpOx84q+4LqOWT4kN2Pz7Oh5fSlzI5IORopbjt1yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753886; c=relaxed/simple;
	bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7SYLj7PJE29VxGBSIx/ovFD7otnpLNLDK4x+7LiowlrtiRdoxqeWlhwnOWY5krWqa/zXPZmF5gxxsMTJkGFtYw3OaPUE9XWw4pfaU7JtC6a6UYkrfgsHyMuMX+kImYjJdZFGheE8tQ1+X7FmmyfVr0PkwudPDwM253K/uZXvMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUhbFJ0E; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso30679221fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 14:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753883; x=1745358683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
        b=HUhbFJ0EVgzw1JsV9pm9Cc1a7Qy1xFsoE8Gnuh/wFUrKa2+UXZ9YQzps6EZOlUOx4R
         s/g51R5dpSXXqKBtTOcKzKux2bOUJWU2LQxR/89OPQ/ZHcbuVR3Oa0NmdrtFF35EzyVm
         +XUrITtmXkRhgcP6+SL9x8Yb3n2BPOLqB0treIDbWPla/1z5VIhS3g29/LE+tpRDXLL3
         zBNNO+IbDfqRPb/W1f4fXqg4wuBIwg3ED9z/Cji5hnCx/ZZog22jqIQu7plazGZZwHiR
         NxQDxCAMfIFZ45jxGAob1NIF6zy5d19sAi4en9KQFXtU7afVFZpum4IkJm33OHzURx3t
         HWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753883; x=1745358683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
        b=wTABrhjvaVoyhxBiz1kdil4zluei1pZOT+rWJP6UrbWj+GK9a7wxnoXMu1XtL5Howk
         GMEMqwNRlZw2vs2p8Sp81DPxLIViim1ezip2va8Acd0uVj+YvbN5jxxzsH5yWYU28XJ6
         4PEBE+jbDYu/Zy+9k1GxDlaQ1NsPuDWrSj0pzWlP/oRpG/07LaYbeDS0R8BnNBMB06zh
         77fIglNJvfzoqAiTLUREINc5lo+j5+j0OWvhGB7BbWG0/2oXfyK0GDErxeR/w36scBpq
         zYvd6SmJG+x/lTr0ombeXR+LnuAnasJnfm8zxOxbGsabzUFgBvcKXINGlxlW378D8GUX
         3DQg==
X-Forwarded-Encrypted: i=1; AJvYcCVnbxZclYTcMh9VQeYEYBbsQnRT1MYMvmxJwqXPVFeMOXkAxeTzbGAglNtNxS9CBRYctzaNyHob7gSY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7BAFuhLitldH+BK0L6r7lB/J5hZL3ObSKHXgJOXOYA7ryBrD9
	0W0oqzhs7mReY+2N0DvmpmLpqi5KU4X0abHKpFYFfAKSECb5ICiTHymAkjyoko0Hgo6d3k8fl/4
	mlq6KUpIT4vkuRqK1XGMsnh1AWg+7DnktrrZcgA==
X-Gm-Gg: ASbGnctjyqc6SJ1K2eEsQ8gCxJMGSsFuJ8a9a0tTmXcdlxOW4ZjqMEb8oCx5ZYg98Bc
	IOsw77Ev4b037E5bMqKsGCnhUEklvqled4vGj5BYNdGSRRCrfN7Eg+/ZIF5xi1eeZ2Gt83nwvTX
	lA6zpsnocfzBvFEyHSoW/Qqg==
X-Google-Smtp-Source: AGHT+IE+SjMha/CZz83kfgX1i08yjyxNG7eptNKiSQYYkbVSYeq+ymUtDU3Y1AnfUH+BRzKuxxYHdlUfXnhngPqHcSw=
X-Received: by 2002:a05:651c:312c:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-3107c317096mr2201201fa.32.1744753882880; Tue, 15 Apr 2025
 14:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:51:11 +0200
X-Gm-Features: ATxdqUEmiDJHa2dZ5KaNyPxwhMUIOlqcAcBjWah7Z2DVmgltPvawf3gtS-j978M
Message-ID: <CACRpkdZ9Qiw0f=BVpCjOj_28=eHcMEO+UXcXaqb_o_2-YSYMrQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: convert board-file GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all ARM board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

