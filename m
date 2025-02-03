Return-Path: <linux-gpio+bounces-15285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD62A25C36
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 15:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D26A7A1A69
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A822080F0;
	Mon,  3 Feb 2025 14:23:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17B32080E2
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592599; cv=none; b=KRs84iuW6gKYjKHoxIZyjq+l6klhH7jBtoFlN5NjuSn8kA7Y9lryzhRIWWby29DrFETnABAc2Pa96HYv3iz0D1AexE+dg72fSJOhBPPh64UwercY0wKVDlaJztlZDozENnRfQeiZVy6PswbeCCxp/EOBlyW3jUD9GxrtyqsFMjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592599; c=relaxed/simple;
	bh=0s6kpD6ZLC8qmAL7uYtdcciC0Y4fGs5gvaeGVP2BeY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Axt+REBW6Uzvi1k3lIjlZYsDRbBejsCwWDXRyHFe1/C1Vxlj+NowWodpw1PmrVl5bSrrFL/oRe6xqvvAYbqPLiY8y6Ala5nfEw5T3AVt+rvSwElPThwmXyzc6OpPRjDVEE7mJZP+Y/cge9SMLxAKZsz67xMkFuleArn/HUXDtI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso1485443e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 06:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592595; x=1739197395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SHhYddDjUc3gm5S2lf1SZhmF8JH1m5o0Ji052eWxfk=;
        b=TjD2DdqyFkXiOcEPURNDbg4jS88OeZmcdpSYsdjxRJn6JiBL1kwvRE98JU+sgohiCV
         rJXGOB1rnEhV3XdsL6p+s8pxBFV0CpkZJe1D/6hHGSu3Tw5+D4N6LMIimafrPGFLrcjf
         NSfA+nEBdxSj4MF+XsPwJQDVxralde6aSMyiXlB8kIeX2YpzqIHqNqSub7tr6wjnP7VA
         BiTwzeNiNeIVB8HTebVVVDVy+MT6xcR0qSO/X35N6ZhuJlMwLCsKwotWsbHhAo3vASQ7
         f/JCOw3qQ0BbuQAiZRt940e0HHdg1JBg6VfC5gT8SG1fxalOxdrAZyt4OaKCfxa0KuBT
         zN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLaiY25KsnneYW7hXZTQLsTUhiUJeCw5gsWNK41o5S3oqorPHimtRInpn+yDR8j6rgF+1ATnQrXTtK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2iMlxK9D1j+yhMNrkcl7X0J4/lIPugH0rLBN05/jGCDPJc3nA
	lFPmMSSOK7yiFzsX3NhS9WtuDd3kskaW/dH41egZmgWHtz6ur4CyFWDMNM0V
X-Gm-Gg: ASbGncssHHcStWQubBsH1iOKMs2U4SFTdvR/pjxXooN4basS911of3aF7i9mPswA7Ei
	+1SvkXoeDjdPD1ji6RxXd8R2lQOxYuamPtaiEJZjX6v2/t4iVhkhvDGUZ0LvDfT3Rs+cNpDMJ4L
	kv3bD3ngeXMvYoMLM/fjg/trTBU1vYw0Hhkh3ijkYI70/zld74ia6tH+kJbLoHhrLMcWaBZMhgg
	mvnrGNxFdm8tk+OLxQdpwPGS0Pexu6Mm9HGtsaa3r5KDGhH3nD8/vJzbyXRqgv++a+g6n0ZQh2v
	w21P6JVcpiwmlg9gGavcetTPE9EKDdWwI5kQPEdGJVXYHdQhEQnv2Q==
X-Google-Smtp-Source: AGHT+IGYgQJtwzJFx4XWp/LCRJM91RAnoHXr3ZreP5AoYZ67Jr197wszoN6Ml//o7HMqG6tINXjqjQ==
X-Received: by 2002:a05:6122:2498:b0:515:4b68:c37f with SMTP id 71dfb90a1353d-51e9e4e7b86mr16326448e0c.6.1738592594676;
        Mon, 03 Feb 2025 06:23:14 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d66046sm1233381e0c.38.2025.02.03.06.23.14
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:23:14 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afd68271b6so1208824137.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 06:23:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVT28OPNkFcIwmBd7KX7ubMzQVji3t/+VR3aPOcgK8jRH1zSeyTqF0AKP3hY5b/7NirTICXNyDeDwHQ@vger.kernel.org
X-Received: by 2002:a05:6102:4a82:b0:4b2:ad50:a99c with SMTP id
 ada2fe7eead31-4b9a4ec91demr16134095137.2.1738592594278; Mon, 03 Feb 2025
 06:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
In-Reply-To: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Feb 2025 15:23:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgQPcUw-UuGC886RRBpeCz34OAz-Nx4FUxeAq0w2qBkA@mail.gmail.com>
X-Gm-Features: AWEUYZlQmbfjprLo0kR0KU0Kbonj8Z38AOpc1ofLHWp-KBHWYNpaee3X9DVMrdk
Message-ID: <CAMuHMdXgQPcUw-UuGC886RRBpeCz34OAz-Nx4FUxeAq0w2qBkA@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz et al,

On Sun, 2 Feb 2025 at 13:46, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> I floated an idea of introducing a backward compatible change to sysfs
> that would allow users to identify GPIOs by the label of their parent
> chip and the hardware offset of the line within that chip (like what
> we do for the character device) in the form of the export/unexport
> pair of attributes inside the gpiochipXYZ directory associated with
> given controller. These attributes, unlike the "global"
> export/unexport would take the hardware offset and create the line
> directory within the chip directory of which the layout would be the
> same as that of its global counterpart (in fact: it could point to the
> same directory in sysfs as a single line can only be requested once).
>
> We could then encourage users to switch to using the chip-local
> exports and eventually at least remove the global export/unexport pair
> if we cannot make the entire sysfs class go away.
>
> Please let me know what you think about it?

I like it. Note that there are other caveats of the old API to
take into account...

The other thing to consider is why people are playing with GPIOs
directly: do they lack hardware descriptions? Or do they lack proper
Linux drivers for their use cases? Something else (people brought up
testing random pins, or plugging random things into a Pi)?

Personally, I still use the GPIO sysfs interface to control my board
farm (opto-couplers for reset, wake-up, and key-presses; MOSFETs
for power).  If appropriate drivers would be available, incl. their
own sysfs APIs, I could use that instead (technically I can already
describe opto-couplers using gpio-leds, and be done with it ;-)

Do we need (simple) driver(s) for relays, solenoids, motors?
E.g. gpio-actuator?
A more advanced example would be an H-bridge motor driver, combining
GPIO and (optionally) PWM.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

