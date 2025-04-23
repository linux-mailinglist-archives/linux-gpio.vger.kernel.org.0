Return-Path: <linux-gpio+bounces-19199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203BA9851C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 11:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E94863AD862
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F16022F773;
	Wed, 23 Apr 2025 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n16VRcCE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BEE21FF26
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399559; cv=none; b=YgGdzQoR5fV7NR5nHYhQSRZymsIQAcTcZ2qNWiGPUkRzlVGOWff0i6q8xjHUaPtY8/yzzuRzp9QeudFtGrHz3NvWsfLpz5cFtSBghvWpXRBdcImHQBNuy5nTQ0gT7S/7IeYvBVBuiJT9Lw94f+UuWJ5IVBMJXPNbJwxn8HpdbdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399559; c=relaxed/simple;
	bh=QJeCOUQziwmIdB/2LLzhfScLQ2aSa3e2mHo767LOC+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQ8hptr59NAGluJHNnZvq7ahnmHiI9LtOTpJBFnhX0B3zRzhC3qEhCA1/U3x+pVtyNGEEeoJTEAtjbDHsOBwt4iHGd10lPZQ42dTkdqzXnstNtg5aHsL0Qrs7uo9TFOpnT+n77S6rM5TwY5tAc/3cE7tC6OMSTu6ZZe6His9QDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n16VRcCE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso7304700e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745399555; x=1746004355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJeCOUQziwmIdB/2LLzhfScLQ2aSa3e2mHo767LOC+o=;
        b=n16VRcCEVZTTWYW6xd3KQ4jpfM/N/vB7WJAt6Ly4Vflj5vXbuJbg4FcBJRoLnyQI12
         0ysdp6iuZ7rMhV8QzmlKQD+nftCRWUJ4JsfXXwkmCl21qgZCIZK22ygJAtMQvuYFVvtQ
         M99Xa27BHMyOSLhKUNW2QKyMV0u2i4vkcX6RnKnBSEkpKq1zMVJEjhjSRgfMuY/sktfR
         0sAnxCPEJ++JgzzmI6Mt4XZUCALNExcBbRnsT6vhvL+dEwdZYry0W8dCX6OK81ARYGqx
         1PtssvHgL+R1dMKxmmdvQn96vnbj/0b20lIroqn4/BSAo4gKfkNvtCZ13Vmr4PdJOyeK
         0Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399555; x=1746004355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJeCOUQziwmIdB/2LLzhfScLQ2aSa3e2mHo767LOC+o=;
        b=RPawUulwm9sIedxDW4IYRSZXclAXtCOT2HhtVCKsIHBJaG4MdBsP1GWIPzOugmcNSN
         piGUjmX9oYgC7TaSREkh5RjjO38AxkxVQ/6C0VfVtfh/SI15s0a9966azRDPHSWfm1ja
         anSc27xuBRRhKe+xCjrB239/0DLqEqUp75DxFfkT32jwGpV10tybIzVKNy6GnwIHSL32
         0Elk6T7yqJ2JnHofSRMvwymTsKZ9EmsoKfYHIkF3burBvhJRaXhAzKSoqmqtDOK1Eilw
         i2mRBlJF9EbaNJajwHtrCTzAWyVWDh+ANLFPyrIHlY0tHQEyHam6TG0uQuem87dq31id
         9jaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwy6ztBlbKWAsjDVuh2RZDIREAvPEjLd1GtKD7D7M0ZTKvAQsIViwR1Ehp2kAaP1fimlfzVR/Sb8W9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw01NTR5b6XcYnXwFxwZRS7Kjk1aIxbi6QWtgj52q5tMXW3pTtU
	X3EWxS/INmzxoCHYZ/BOzLF6T8aUE/3d8OlbdKY+ZW9SjeWuKCA308S4A8QP3arvfomJ2aX1eyU
	OJCp0fVw9hDnCADMN9zrNPymU4NnEe3umd1sT4g==
X-Gm-Gg: ASbGncsIkbhgbWk3Y9i/v0PByv43X9lF2jEESsnP9cu6Yi7YDKDrdQBreS9sF/wKtNA
	tJdM4aLHGliN9rRFYNQdFrhD2kzojO+MORBwKNnX1uG0hEGTIKygZX1KKNsHn9Vvw4CLVpvEPFX
	Yzh5qnS04WjP764QpR+i/LUA==
X-Google-Smtp-Source: AGHT+IFF/xbTjLRtlqEGbjqNcxexgFOsx5O9KwDgL/LSiumuEdEwznWo16XbSoEfrNMe+sSZFz40FiylyZH+ARCcP7I=
X-Received: by 2002:a05:6512:4027:b0:54d:67d7:c52e with SMTP id
 2adb3069b0e04-54d6e629c18mr5591182e87.18.1745399554909; Wed, 23 Apr 2025
 02:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 11:12:23 +0200
X-Gm-Features: ATxdqUEmXWqr5ybXE-1jp9J-42SDUfB2VtIVs5Nq-RfO1-UEQKemrbEsyN5V6HY
Message-ID: <CACRpkdb1YRd4QmBnRpedMrmCb4AiY+KjCxfAmm9zRQkeTUsrBQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] leds: use new GPIO setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Riku Voipio <riku.voipio@iki.fi>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 9:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO drivers under drivers/leds/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

