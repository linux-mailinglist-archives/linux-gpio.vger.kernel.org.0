Return-Path: <linux-gpio+bounces-21497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA0AD8534
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 10:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22F01890E87
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 08:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F82A26B744;
	Fri, 13 Jun 2025 08:02:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EC826B759;
	Fri, 13 Jun 2025 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749801749; cv=none; b=id4Xx0Wx89tndwUT0qwXEMaAAUeK1f4KVBCbSlK19o6zJX/TMc32xnaS4hPyNmXIiw6R91D9JO9LTcM6NYu+rc+sGaGjWSNPEB6SPmuBXLjLF5H95kC8tpnP/LplbUvf1y0K2V5w5piTqLKkuXWaHe2cy5bW64cG819ul+RQeQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749801749; c=relaxed/simple;
	bh=lgBm2HgvbLnlWMqEH6iVk5jwW921qaxzecXQG5eqrxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnnjEaEY7yNcILEHwL+UeMurJhybtRa+dqxuIdCkyDL7+3OWvpnScjKAW1C7XVpS4SgBSjRNqzVltdkJZ4XW7O8MhLsKHUIaKf5SpWzIghJm9wXHZIc0DtmbHsJOrCerBg071RQueWulDSKyOz5hE9dtXJV4O7lKxUEkWK3GJks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e7c7680591so1109738137.1;
        Fri, 13 Jun 2025 01:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749801745; x=1750406545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXilN1K6MrIzaL2KoxsI8w57QJn0FDqqP0EZncSgdhA=;
        b=N+hEU63jdyhdaOUJRfDNhYDnv5jvpSc2e2d6le+S0Hvy3RbX8pXbjdVXGOar2GsVXG
         LRatUsJKqdoplWvUeM4Z8nfMHXtORdpUFihcIBULD3E/sbBczQGRDSF5b8Pa8Gf5tWui
         81QkNa/XA9aqt4V3UEo8pP2YLkaub2OOxWsBZ5G8i7Yk7VWu3qeECHARu+Hz0UZw34cz
         Kd7CoeARZoNvnenagpeDwCt9P5/fxBRfUsxvryMp8XYCyzl91+Q6q9AfnGu0BiuL7fAr
         ljcnkcqP08TzgNnubex1nRxP3KEXmW5WoidbHMnkf0m+J9jOx42UwoFQghQEQB0rTpOr
         WbqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWceNWWYxNZx6QIxV/aIrtyG2J1ebt7G773fdBPs+uzbFjqGU6KKqv2m4jOGhYj+aIUnINt8nN0bMzs@vger.kernel.org, AJvYcCXxN4lnD74YVL96biuHeOFYIW7MsewXgF/muD3FD0LrNKQTJTe9xhfBjJbxQTwOLXJ5YyBN3yPR0R2DNiQs@vger.kernel.org
X-Gm-Message-State: AOJu0YxL2EIUVkcWaO1VPk78yiND7jzWPpfJ6TWZN96JfhFy5ac+in7q
	Wsy1IKysgfNyWonB/8BFOYSF+mJGMkWX29gYg96439we9EV+NLf9oJozlXWldaLr
X-Gm-Gg: ASbGncsX6lff4Qm2CGUDMA0mRi0uV3REgm4JF5yvnpecSNW7AYewHR6IfZCF8X3v/D2
	XXSTl61XUtgAjvlUvOTbjfwrLUy6jDxRapXKzYHEtexcscnDNcExMDrMwVgy2R1Mc45i7mozuh0
	A8RhoQEf4ch7MjTkDMw/R0mF2Bzn7WA8SYhIxb87i16NxkDDVebFMrAFRe1Wn97qMg+dPlfs88C
	UOjoK7+M1jebbb74WP9EZJR7yp+KZP/7tpynx6Yuik3TbwSC0thFf2j8t9by7S9peqLo4CD1tVa
	kG5nqHBEgVeOUyo0Pr7+ShCrnG8hZxP1wcHQ6wBmlk/k8/ZlJiDygW8qrTbGglCH4ZKwNh6fqG5
	44l1ZepUhXhPEl9+Q0goiSn66KaLL5Om3GJY=
X-Google-Smtp-Source: AGHT+IF7EwHq7ah/nkl7WvaG9K2jL1JwahraHDmWcjnpabOvqfdzt3mHP26PUiPp5KVNpXAmizqQXw==
X-Received: by 2002:a05:6102:3005:b0:4e7:af64:1e91 with SMTP id ada2fe7eead31-4e7e65a9933mr751086137.11.1749801744853;
        Fri, 13 Jun 2025 01:02:24 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e6e1d526sm151556137.10.2025.06.13.01.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:02:24 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87ee954ca95so1047847241.0;
        Fri, 13 Jun 2025 01:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCS2ojxBnUPb8k+Jl16+iuw7D8QGg7nGs01grYVHBpqMooNHhQv+QZzaJeWSOYTTW8sWPCLxiX1a6qQ7n1@vger.kernel.org, AJvYcCXOr3kQCRq0qZ3RFhs5Iaj0M2q9MbIjWbykpq/A7WiGREONLzwt31eU+3jcgeEKgx4qkdIX1GwJOAV7@vger.kernel.org
X-Received: by 2002:ac5:cb65:0:b0:531:3cde:6c74 with SMTP id
 71dfb90a1353d-5313d83ef8fmr749693e0c.0.1749801744017; Fri, 13 Jun 2025
 01:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jun 2025 10:02:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXca=EnNDE2doqUvu3dm7+aaWrG1nUYs3b08JCFqrKEvg@mail.gmail.com>
X-Gm-Features: AX0GCFtL-d2TpLaeEEFThajisMZBkRFYXMovtv4udXAumQPPptBhnhzZw60wM4M
Message-ID: <CAMuHMdXca=EnNDE2doqUvu3dm7+aaWrG1nUYs3b08JCFqrKEvg@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 00/15] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 10 Jun 2025 at 16:38, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> Following our discussion[1], here's a proposal for extending the sysfs
> interface with attributes not referring to GPIO lines by their global
> numbers in a backward compatible way.
>
> Long story short: there is now a new class device for each GPIO chip.
> It's called chipX where X is the ID of the device as per the driver
> model and it lives next to the old gpiochipABC where ABC is the GPIO
> base. Each new chip class device has a pair of export/unexport
> attributes which work similarly to the global ones under /sys/class/gpio
> but take hardware offsets within the chip as input, instead of the
> global numbers. Finally, each exported line appears at the same time as
> the global /sys/class/gpio/gpioABC as well as per-chip
> /sys/class/gpio/chipX/gpioY sysfs group.
>
> First, there are some documentation updates, followed by a set of
> updates to the sysfs code that's useful even without the new
> functionality. Then the actual implementation of a parallel GPIO chip
> entry not containing the base GPIO number in the name and the
> corresponding sysfs attribute group for each exported line that lives
> under the new chip class device. Finally: also allow to compile out the
> legacy parts leaving only the new elements of the sysfs ABI.
>
> This series passes the compatibility tests I wrote while working on the
> user-space compatibility layer for sysfs[2].
>
> [1] https://lore.kernel.org/all/CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com/
> [2] https://github.com/brgl/gpio-sysfs-compat-tests
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks for your series!

I gave it a quick try, and it seems to work as expected, great!

Given the /sys/class/gpio/chip* numbering is volatile, I expect
script writers should use topological path names instead, .e.g.
/sys/devices/platform/soc/e6052000.gpio/gpio/chip*/export and
sys/devices/platform/soc/e6052000.gpio/gpio/chip*/gpio19
(note the wildcards).

I hope to find time to do a review of the patches soon...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

