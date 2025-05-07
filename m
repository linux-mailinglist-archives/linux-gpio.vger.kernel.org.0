Return-Path: <linux-gpio+bounces-19747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C90BAAE48E
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 17:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 731B616E090
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 15:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA2728A40B;
	Wed,  7 May 2025 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hka4gDmQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9517B28A700;
	Wed,  7 May 2025 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631428; cv=none; b=QaaqHjfVhiDlC9pmTMT4jmBZr/jX+gQ3IJtuGhf4QQ249yxt3jp3WJEbbt8CX+KJ1cVJYL2yvUkhjWLqvNG434AIHdp5/ikuYQYQ27OCs1Tg3bYkGBgB2M8gShM3a3Mhamnst0xNjIYFCoG+t6PHFNDG+D3P+tRrHOPbYJP1Aqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631428; c=relaxed/simple;
	bh=4JhFUdWeA4J9a5MBHxrL57pVxhMVH0IT0vvA5hJ6Qso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVdcceMbGDvh2v5vPy0Jn9Zq+ViHhfBsDLKOkB87XCpV4bZOQkCNuAbLT8iQQhqkeFg93cgHDeakdZKyIzKzFl4nZBLnE9oXomAaL5mhxz36pT5SyYP6hani00H48joGNsqooCdqy0LQhD5Qo5k8fHJntFjl/42jtZxZ0hgQjck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hka4gDmQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1212868666b.3;
        Wed, 07 May 2025 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746631425; x=1747236225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JhFUdWeA4J9a5MBHxrL57pVxhMVH0IT0vvA5hJ6Qso=;
        b=Hka4gDmQcpuxOyEnxJBOhzRT+SROmiXVKRQsX8aFWrNZwKzNqfER/f0t0PF0n50SeK
         +iNIrmpj1WoFBTILCySlOmut4WMhaa5Qu3oNTOqiRZp6s6PfNehyrcABNZ0nrVy0Ftyl
         jw+VKx95BposN3I8opnAUUXiCtmb8nen26DKyiBvKgF5FAxDgaRiaQJ0SABKM3srOQY1
         bpTtzxOCFzQ/MFnZW5+9DQ7XkXvewrunBxKfPdgS9oDMFeiAs48o5rrvKdrR12i1lKOV
         5KD4Z1YDcrgXlwRyGquDWIH9jAcExf7A48nKJDyIWMp9nnYqnv0tAfAv8+hWOor/dYpV
         CTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746631425; x=1747236225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JhFUdWeA4J9a5MBHxrL57pVxhMVH0IT0vvA5hJ6Qso=;
        b=U1Vhr0HnrL3tGSep8KqvbjN5qZP7F6Eu6c62eJnMLllA0xEV2SXiMuNdh8+fvIzelH
         VkiU2Yiw4hyJUdiV2O4FSolYTk6GuES1u7bmcFgz7LQ4rLwOOcVKJMk8H1rTtkLG/CjH
         N9tI9nZE2N1FTLFX8D2rMudt9aGc1DCV47MgqfSLOwHwgVJJYwnaZVBZjaJksXQ9P/zt
         ZUOtQrRxShjBwVLZNSL5KNCUJo+kGyGuy6KmAH0YqWI0dB6TC38BMe5HFIGSw8ndtDCb
         kVp3Xz/+W4BZIngqWOKIAUBzgO5RfCgNbVZulSLKGnwpuEss0egHzGAIblYidjDISnY2
         8CdA==
X-Forwarded-Encrypted: i=1; AJvYcCU8IzJd6JTwki1zhccPPL3fk34nAvEMybXRbk1EXf1ErkmsL/5OnDTKWPXWzYUnDhvQdiv7KlbSgMFhUrbFfZ3T@vger.kernel.org, AJvYcCW1U2XF3fln/Ei5LWkw5z0cy3Vu3R/vZK0ZA7v8OUTvqmjRTShhXr7P/NNsecg4yZPPt9gkf/zb/OCa@vger.kernel.org, AJvYcCXLfa+H2rvuVnwM1BoZkdGvujdn7LFt33Xv/stjfZrbaOeVKlonI680hMlQ2vuAUZm9RD2YpbDveGhXWSp6@vger.kernel.org
X-Gm-Message-State: AOJu0YwkbpISxHQEYx41JsrAH82cIiCtgx26e03AfkpQqHjkRQf4dYvD
	gENwXX+aJN8zCkdhaFNw3FLLH7MT0ETw9zBru4THT5e7fNXRgwfEVoF2/c3ni5vPoKVx5AZ0Vcq
	fHTxTBxJgQfkWwgWrNl9P7SG27cQ=
X-Gm-Gg: ASbGncveLFlK03/bTU9szVJRhhlh36+LuHtMd8n3a/2fADDYsBUbXOCiaDDOYrZSoZV
	6w1o1RsjF+K0Sgid4U8IrTft1d3LDMloZA1oxpVi/vTl0Xs97Umm1ADNzDQrpL7EwX7tjIbb7vj
	jA1h80GBAZfzevEIq+51NLcGt6
X-Google-Smtp-Source: AGHT+IFbdf5NlJKHSMRjkUqhjK5Hp3fu/rfDZyBbBA1k1Y3I/Rugcd5bWUGfx5ou2T57TdusJm3wlK9y6dy3A43nM3o=
X-Received: by 2002:a17:907:7f24:b0:ace:c3a9:81bb with SMTP id
 a640c23a62f3a-ad1e8b960f8mr385660466b.5.1746631424646; Wed, 07 May 2025
 08:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAHp75VdRp7RG-YCAL2Jx4uXsT2RVQNeu-MxPB5pWRq8TqtsSXw@mail.gmail.com>
 <cb98bec7-748c-4e00-aa9f-b5075bebb5b2@bootlin.com> <CAHp75Ve_oM6NyvLGsBK4CddEEv=cafw_VfONKwEBX2CBdNxJmA@mail.gmail.com>
In-Reply-To: <CAHp75Ve_oM6NyvLGsBK4CddEEv=cafw_VfONKwEBX2CBdNxJmA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 18:23:08 +0300
X-Gm-Features: ATxdqUEodlc_GKaXI_ss2MYyNjFrfS9sWnfWKX_MFgQ0Vuxsmu4_lJ_hOUZBsec
Message-ID: <CAHp75VeBBG-2OZ6fDDJMdZ=SGZRWyaL71nTXaHx7Pyr1PLME2w@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 6:21=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, May 7, 2025 at 5:53=E2=80=AFPM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
> > On 5/7/25 08:29, Andy Shevchenko wrote:

...

> > >> + * gpio_fwd_gpio_add - Add a GPIO in the forwarder
> > >
> > > forwarder
> >
> > Sorry I do not see the typo :)
>
> Your original piece of the code. Please look better.

Ah, it was probably me mistakenly fixing the original text :-) It has
a typo there.

--=20
With Best Regards,
Andy Shevchenko

