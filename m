Return-Path: <linux-gpio+bounces-14845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C89A1245D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 14:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16C0B1691FD
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 13:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928DA1E98F2;
	Wed, 15 Jan 2025 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSAkJFG/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA12D2459B0;
	Wed, 15 Jan 2025 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946284; cv=none; b=QRVHV0IwvYFEOvXMKH9e5AlViV7ZaImXrcAl8Bj5Tb6OcuIaF1AJiS4auMGueAeQJWg81xiVA40pRjixIXOfnrIyYGsmfV99pyl1FldxGCWOtAcSh/2vJh5vhasA7eewu2hzeAMW3kk0TIc63MrETplTWvWI6S1Oxz8Gy8Aem6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946284; c=relaxed/simple;
	bh=e1ivajvioQtb+yXA5SvDQN7tPZvYwGoki2gbx3ncK4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+BCYdARvNll5pihPqmXplQteeJRhxvJPn8LO0WTB9AocfTEiAiCt3wLlp7pFS0pKSeeMOEsHZ+gikn4FTPE/7uPpRm9irRhbZLW9JW1KA5cJ3yAZJgGryY5KVoBX4FN1XkkA/EiPYGCO04cDMmB5KRUN6xrq3l472O1ciNG6Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSAkJFG/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2167141dfa1so15136185ad.1;
        Wed, 15 Jan 2025 05:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736946282; x=1737551082; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iZlRWczKMuYSQpBwQS3/Wp/dw4gagy0ZZEnfpiDku94=;
        b=NSAkJFG/FKZf7Cb9E163RHhmgjw2AUKnkZi0uU3wZ2GqRcWd8mkEXCh3tDwrR2pjM5
         nY7d/TTB3sqTVVid9ifA0hvMT+swXWDResNN/GuLc8UqaQ7kqJsuwf9MBdWlRQ1iKx5C
         Q7issZDHLdxfoUYI9sh2mcaALAp/20F2UHsTVYhdcat9MZeXDKwC5pMz7fyKkcc3HNEh
         E3rLEljaUDTQOIRqzfGzIT/TnbnIXo0/vNRpcmi2G7e5G/pfDBykCGrfcIO2/1J+eDb7
         VFOzdLxIBUb1ii1mP4lOI7bAyzHVP9w2A5t1YABAbgmsmVo16wzfJqMhv9QNXRDkdeEg
         OIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946282; x=1737551082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZlRWczKMuYSQpBwQS3/Wp/dw4gagy0ZZEnfpiDku94=;
        b=GRIBhTAaeX/yPbUSpNk8jcPXOnToL+sTosoXKwzYVV693tUcP97rD5kVvJYD9FNanJ
         B0T73X3FNzD6Mh/LdVs5D00juaqGY61g5nVQc8svNg8j3WPZVYURjK2FBrxFc3x0/T/p
         wkOMPoBwcMGllTGBI8VuDoaVlHaMLE6loGz/CpdPtau4ClWgSKfXFWDFD6riGJEVURRT
         v6mfxdsER3vjNYeBQsF39CcrhYykFuU5oP+wztsd7wBc7wOpdd8OivU86HA1xaDpLlvS
         tRsnttA2hfzPLs8wG8gT/WQdVAmdJnkZnlC85Dfw2fvKF5lm8hl/+uTSKDzg52saXlrt
         4SUw==
X-Forwarded-Encrypted: i=1; AJvYcCVrTM8RoN5jcWY+OK7lg2mydbQiGIbYpuPBYzbiKLuFijOKi1MzcH5c9GJdKIws30vFFYO0X9wx6vM/o4NB@vger.kernel.org, AJvYcCXkQ71euqPtPZghw8ETT7KMsl8so/7DZimCTsM2VPbC1srn1tY47vuRpsm9vQLEOTNpb43xMEluy1TV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1CP0glFxTYKOQBNZZpJg0YmWmzbTe7kZjiNlYTh3kwxP7b64Z
	QyZpFJeov8bg0PBc+7aorIO/AJlyU7PPrA8Bd4vx0C0qK/t2veeA
X-Gm-Gg: ASbGncv23Evna1NX5nq55wnXnJqgjMvNlRX61FU/mbbzyHcnt7UYFTdr3dqtPRLsh44
	CYuDV79A7hLSvXMbmlgsF/KJ8KhNu3BriSuhYHvBgmsfitRYX7GgG3WrgYO0Z37EueJaWi4q2Mv
	mImwrGtq1sMvNsJeXKo49BGV+iiu43VW4/W1YCI4/2f0RTejpYhD8MjnAyM8c2ILXvj5jXY8Z0J
	r0KazyUF6Ubei4opziMG87OKWyKTtBsFcJpUDiQ6edCeEKr7olReqHCfZC0dOG3Eal5gFP8ylgR
X-Google-Smtp-Source: AGHT+IGP1MoK+TswjCTX6n6RwzyNOH2KSgOcYC27N3Q9DsQ1b+VWnKsHu/ZOWjDg/b36Z9NPcODScg==
X-Received: by 2002:a17:902:f605:b0:215:98e7:9b1 with SMTP id d9443c01a7336-21bf0b76a43mr47212525ad.5.1736946282107;
        Wed, 15 Jan 2025 05:04:42 -0800 (PST)
Received: from rigel (60-240-216-120.tpgi.com.au. [60.240.216.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f1386efsm81502525ad.75.2025.01.15.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:04:41 -0800 (PST)
Date: Wed, 15 Jan 2025 21:04:32 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with
 static GPIO base
Message-ID: <20250115130432.GA159787@rigel>
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com>
 <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
 <CAHp75VfAmqzKxgXTc9TqeFOeGSr_D3NmCa0M7+4Zf37CofrHeg@mail.gmail.com>
 <40531a5e-993f-4532-b071-6f233d6923f8@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40531a5e-993f-4532-b071-6f233d6923f8@pengutronix.de>

On Wed, Jan 15, 2025 at 08:07:38AM +0100, Ahmad Fatoum wrote:
> On 14.01.25 20:38, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:06 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >> On 14.01.25 10:49, Andy Shevchenko wrote:
> >>> On Tue, Jan 14, 2025 at 12:20 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>>>
> >>>> Some drivers have had deterministic GPIO numbering for most of
> >>>> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
> >>>> ("gpio/mxc: specify gpio base for device tree probe"), more than
> >>>> 12 years ago.
> >>>>
> >>>> Reverting this to dynamically numbered will break existing setups in
> >>>> the worst manner possible: The build will succeed, the kernel will not
> >>>> print warnings, but users will find their devices essentially toggling
> >>>> GPIOs at random with the potential of permanent damage.
> >>>>
> >>>> As these concerns won't go away until the sysfs interface is removed,
> >>>> let's add a new struct gpio_chip::legacy_static_base member that can be
> >>>> used by existing drivers that have been grandfathered in to suppress
> >>>> the warning currently being printed:
> >>>>
> >>>>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
> >>>>   use dynamic allocation.
> >>>
> >>> Warning is harmless and still a good reminder for the stuff that needs
> >>> more love.
> >>> NAK.
> >>
> >> A warning is a call-to-action and it's counterproductive to keep tricking
> >> people into removing the static base and breaking other users' scripts.
> >
> > Are you prepared to say the same when the entire GPIO SYSFS will be
> > removed? Because that's exactly what I referred to in the reply to the
> > cover letter as an impediment to move forward.
>
> No. But this gives me an idea: We could make the warning dependent
> on CONFIG_GPIO_SYSFS and add a comment to the i.MX code suggesting
> users do that instead. What do you think?
>

AIUI, the purpose of the warning is to remind driver authors, not end users,
to update their drivers, as the old behaviour is deprecated. That is
independent of GPIO SYSFS - that just happens to be something that makes the
change visible to userspace.

Rather than making the warning conditional, how about making the fix for the
warning in your driver, so switching to dynamic allocation, conditional on
CONFIG_GPIO_SYSFS not being set?
That would provide a path forward for users that want to dispense with
the warning - as long as they dispense with GPIO SYSFS.

Cheers,
Kent.

