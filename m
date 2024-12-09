Return-Path: <linux-gpio+bounces-13646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6E9E93AA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1AC1885FD1
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2092621CA14;
	Mon,  9 Dec 2024 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9WYZd1X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382ED18A956
	for <linux-gpio@vger.kernel.org>; Mon,  9 Dec 2024 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746743; cv=none; b=DUd97ZEEJM2oTrVAJlAMIMom92ftc6JBa8bwoFcegvWQxVJEWpWs4rEYLq/Cnj4UyWgqzjTodpsHaldcT+KxaNamVFnu2FlTRIxLiyT7fHjyq0LD8mT46zvx8UI3G9jhT1YLy+9IJqZ+WCQDyZMHJ/dLLMlbek4YeYduw7+ZGXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746743; c=relaxed/simple;
	bh=odojSTiwIiM90SQSuHkepw4UyZ9vZEGWrG9AXGLu+hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ls1oIMptcWK9NEG6gPwQLXxrxS6o9p96KoM0+xRWBODfR1nFRnKMhWwUBH8XNj3V3Ow1Eh3Xp3ZPEWUoCccXmqmz1CpziBLC624lavdEromLfVRMyvNlk+qGs0XAiU4tclO6HW4lTyCwewWTl3G4gEKJMg7DT1evdfSTm0OSsb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9WYZd1X; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa689a37dd4so158635366b.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Dec 2024 04:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746740; x=1734351540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odojSTiwIiM90SQSuHkepw4UyZ9vZEGWrG9AXGLu+hY=;
        b=I9WYZd1XZhDZFS0U4NNdzrTHfBAwXP7/V7786EIbjlfQwvSirzIR+qAETJ1yNOjQdf
         fTnEnzwXK20jN+OojJ5KRstEo9EZA8+gMPaO11W3k9KQwyNCzijW7JgqrdAa5jx5RIH4
         USQ7FJC9wJN29wa0a1Cy0CUgee2TEWObndPVcofDyAoSkLp5rccDkgVoiZgLELfV48e+
         RGCI86qBz0HEUldRSCuOfc0n0xYmZqkmZsuukktArVVUG4Eq1OtadM/XKBra9k6sBn5X
         x/uMFcEZIREEATZDQmw/fCv4Y3t9ZcslWv0exfZy2FJ44a/bHbUjmXkHhXYtGVvYiWsd
         nssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746740; x=1734351540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odojSTiwIiM90SQSuHkepw4UyZ9vZEGWrG9AXGLu+hY=;
        b=sBn7AjmhoVR72ZyeINIUXpEweklbJEATE4oYlBo5RNClIMia1wXM3gHuu1T4DxqvTE
         2rpbeA9brkHDJxWS8x0vYqIHSAVVbtm59zNS3mpMLBV0/8z67t55Lfqvf2HyJBSZsEDG
         CBv1cEfTc4qbIPWw318sTT9KfcQy+eMJrj61ulLNoxoMvX11LfHtXhhMHmQRwHwro/O+
         mc4yYE9d+eBs8qi+WymBrC53p+AfkbRdVDT7CHGvsRaV7AMeajhgV5uaskhKPjwlSxof
         vrIAfYiHtYXe7UyUDo3kiNI8EJY5TTHLaRP6pYC0t2ObkIHhTntryegJt9bYyJevB3uN
         rvvw==
X-Forwarded-Encrypted: i=1; AJvYcCWyOf3LJmxAoW5qY5eaBPWicqB995ZQkR2jQypkKc2M9cX9UpFrzhypBGkPpbbfvsrlZwMnmUfvdEZH@vger.kernel.org
X-Gm-Message-State: AOJu0YxXhvius/25koTszN0mCjXsIn95onSHJsZmHXdFK7SsBDgtw2HS
	aXmiUXBw/jZwv9QqfkrEwMYEz7uHw8CcghoVB1COBUR5Us7Y9yQZGZw2us5fS6xdPZW7omRS59L
	JV7GyX0AGncpAKlRg4tFifHLuWpo=
X-Gm-Gg: ASbGncu6rqHT0Wn95f05TGGD+4STAntUgt9GfZxAlPoXieNbgY+kUh7b3qAfXWOvHKZ
	m4Sh0H3tqfEG8kKqRFj5Wjus3EfKnbfc=
X-Google-Smtp-Source: AGHT+IHoZzYUd3z/NSdZGkj57IDQsERqHiG/l9gnSYuf4+5q2LnlsRXHVepWEY1CCt1M9qZ/MaiJxZO+3t+0zMl9qbc=
X-Received: by 2002:a17:906:31cc:b0:aa6:7933:8b26 with SMTP id
 a640c23a62f3a-aa69cd0fc76mr11706066b.9.1733746740295; Mon, 09 Dec 2024
 04:19:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204070415.1034449-1-mika.westerberg@linux.intel.com> <CAMRc=MdadVG6B5cXeRubNqBXFAJYd4zFOg93DPpTFJetYH8XYw@mail.gmail.com>
In-Reply-To: <CAMRc=MdadVG6B5cXeRubNqBXFAJYd4zFOg93DPpTFJetYH8XYw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Dec 2024 14:18:24 +0200
Message-ID: <CAHp75VfeEauisvRJGDhfraxUx0+MNjGtg=rx5tt0M7hK1OJWRA@mail.gmail.com>
Subject: Re: [PATCH 0/7] gpio: Fixes for Granite Rapids vGPIO driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	Shankar Bandal <shankar.bandal@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 11:26=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Dec 4, 2024 at 8:04=E2=80=AFAM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:

> Andy: any comments on these? I'm willing to take it for the next rc this =
week.

I'm okay with that,
Acked-by: Andy Shevchenko <andy@kernel.org>


--=20
With Best Regards,
Andy Shevchenko

