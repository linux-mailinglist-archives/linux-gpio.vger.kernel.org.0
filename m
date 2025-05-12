Return-Path: <linux-gpio+bounces-19970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F80EAB3BBD
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 17:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9C38460F31
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 15:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FBF239E61;
	Mon, 12 May 2025 15:15:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206442309BD;
	Mon, 12 May 2025 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747062901; cv=none; b=t02bFxNlrBCCaP9QlDBDVXFuq1o/XOSKXe33ADwH2NagpiGHPP2u/wzZCBAUDSs8rMoXIQ23ILNo7iMGseRAGMMupSA4UwuFjspftFRFvCJ3UzzFhGnFJSGNDp353a0MkDypoSFHThoIHDpvQmso1/J4boTPORjb418NhiX6t4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747062901; c=relaxed/simple;
	bh=BnEc1zNtUsHgqwROYJ/rnVLTNeyl7VmQjdeEg1woeC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B02X/sqoyTuy+si4KfY0o3A8s4yK6Kx+EVX7ryrjp81X/JWWBJO/qn7j/jz0FDms7DcWkElqHrOC49yb1S9GHiSZYxsesddTdududqTmKEQkpEWly6ZxFeZ6XUdDi3l7dDPFY5iVjPjVVlLUEu6ekfxrYZDeKMbU3ewUAR72KL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c9376c4dbaso516502985a.0;
        Mon, 12 May 2025 08:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747062897; x=1747667697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9At40kYnMv5OjbgLYZpSfMdVbkMIhmz1eV+sv254Vc=;
        b=JDU7eTwNSh8Qx+RzKWNGdWaEobK2QkHRL7pQNgMYsLBDaDYDENPvERpZl1jyr4PoSk
         lwEGkbCSmn4aG0hyiP6jdLV+Hh7nrjvEylpQo8vBF4UgII08G6+Ce8SMQRH82KffVCea
         QrSAKDVL2VcndDlC2t0EX/5bUiHQk5ifn+1Brm07KUCiJDCrBw1r+0hvfw7mWkxibRh1
         CeTCa5ckqQ5huX03XW/4O/5q27KmxFFQRhLrLeuChFLU5NDbZPuZgHL1d3CRJfmr2EED
         Ija9ZwCg++2HRdVLFifCdgqES65hPEC/vnFyo5YjZruV1NRnkzonxyqE6hFtl/iHLDW2
         aPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOGcnJcetiolx7ZxQ9qYgD6NE+mS8JK3MHlrWPULj2gqJegkG8jSVyy2GyvzCaTUxS8nB1k7YwUEXXqiv/w2bM@vger.kernel.org, AJvYcCW5zgXzpuI3HwyngQkNaZk84CFMksf6U2EgS+E8qoG9eQpXQtOqNNCGuIa2Nd6kLFr6WfqTLd+NovhPj7+R@vger.kernel.org, AJvYcCXPlxMpiNIv6sgex9rSboo+7YgRf5kyLoxt0Ob2AERi5Spbpw5AGLhfWXXdJAS2j/Tk4dOHC/hXKtJr@vger.kernel.org
X-Gm-Message-State: AOJu0YxRohmuvfYjAQFyTbbuVs/6Nhb0CGwCrwvd6gMsaamQNfp2gbhC
	UWJTSX/TIR3XhcwlRzifFdScXSHWrHfx37LA1intncPmqSsAfdyzBnXsWxR0
X-Gm-Gg: ASbGncv6EARP0FooTmcQC/8hqKjB3wOBRoGrp2KIJNbmDcWIzj4tyR+Q/G2kZH8N6Sz
	U0X+i0onZeZXrz0z0sX7Ciwp3/F6VFpGoms0Ljs76iDCytcptUCv9NfnZyJeF46dvTw27o+hnc4
	MIJif5nZH57B8oetF/kvfB0kK0Xo+fjhfEEn3pKjUymAoAbjsGELwygEh6NX+uL6qBr8duDNe93
	j3Fo9bilJUNgogdN8gJcn7llNWwxhxcPlMlffM0y7Ti2oA3BJKoQdbsyngPVVG3Q6fY/Jm4cUfO
	Q/DhwsWW6UuHb9Ri06sbXj9Fh9no+t5570JOpgViGGHCTfdEc8zgflVY1t7Sbj+XYX9fOvHEkOA
	rjnNVNZOxDOGZNTOApQ==
X-Google-Smtp-Source: AGHT+IGCU4TazPyGlYHXntDGp9gvp/tn5w40VOcKF15rr+FKZz+xcaZhnVhY/nygsxmNA61MuTuzRw==
X-Received: by 2002:a05:620a:c55:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7cd0177177bmr1808380285a.8.1747062896533;
        Mon, 12 May 2025 08:14:56 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f6384asm561007885a.39.2025.05.12.08.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 08:14:55 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4775ccf3e56so68163721cf.0;
        Mon, 12 May 2025 08:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZ0bGo3ct9bwNB7UV13LcvM+YQQU0sd9u8h62t7XQABUw8vJxTe/2k0JOLS2jFtgnbFISm2vjkrM9lSDZUCBk5@vger.kernel.org, AJvYcCX2iJ6b6fZ0kz0FXiaQw0KZC5k/SpYxPMErm+WsMJvq4ibG2sfzlyOIanbIctFwcBWx8ju60KK/BJWJ@vger.kernel.org, AJvYcCXjeabKn5SCT6PZGL8HE08qJ8AmZrqAE0RWmIM3azPqXDQA3ddkXiu/kK2gOqHHi5n04gxrmIzS6UE/22gB@vger.kernel.org
X-Received: by 2002:a05:622a:148:b0:494:7133:45b0 with SMTP id
 d75a77b69052e-49471334901mr76495421cf.26.1747062894577; Mon, 12 May 2025
 08:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAMuHMdXzU1k_JZ0UhUh33XCq_zpq6MBJgAjo9F9Cw4gckA12EQ@mail.gmail.com>
 <c10b7752-cec5-483c-90a9-ada16aa0904a@bootlin.com> <CAMuHMdUtEtZH0MuS7TA6RTa1-LB=K47sEGzo9BJM_RvfCRmRAw@mail.gmail.com>
 <93425f2f-9496-4d18-ad7d-7e631a80e6cf@bootlin.com>
In-Reply-To: <93425f2f-9496-4d18-ad7d-7e631a80e6cf@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 17:14:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMVFk+-3akj6nj+XCya9zj_FqkbnpOT1Wc4wSsgttiww@mail.gmail.com>
X-Gm-Features: AX0GCFtPIYjaOgyBr7xzcZXg1KRRKApD3x2hik_4QOSEBr8W4afKgooAaU6rvBQ
Message-ID: <CAMuHMdUMVFk+-3akj6nj+XCya9zj_FqkbnpOT1Wc4wSsgttiww@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Mon, 12 May 2025 at 17:01, Thomas Richard <thomas.richard@bootlin.com> wrote:
> On 5/12/25 16:39, Geert Uytterhoeven wrote:
> > On Mon, 12 May 2025 at 16:08, Thomas Richard <thomas.richard@bootlin.com> wrote:
> >> On 5/9/25 11:07, Geert Uytterhoeven wrote:
> >>> On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> >>>> Export all symbols and create header file for the GPIO forwarder library.
> >>>> It will be used in the next changes.
> >>>>
> >>>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> >>
> >> ...
> >>
> >>>> +
> >>>> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
> >>>> +                       unsigned long config);
> >>>> +
> >>>> +int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
> >>>
> >>> I would expect all of these to take gpiochip_fwd pointers instead of
> >>> gpio_chip pointers.  What prevents you from passing a gpio_chip pointer
> >>> that does not correspond to a gpiochip_fwd object, causing a crash?
> >>
> >> Indeed nothing prevents from passing gpio_chip pointer which does not
> >> correspond to a gpiochip_fwd object.
> >> And it is also a bit weird to pass a gpiochip_fwd pointer in some cases
> >> (for example gpio_fwd_gpio_add()) and a gpio_chip in other cases.
> >>
> >> I can keep GPIO operations as is, and create exported wrappers which
> >> take a gpiochip_fwd pointer as parameter, for example:
> >>
> >> int gpiochip_fwd_get_multiple(struct gpiochip_fwd *fwd,
> >>                               unsigned long *mask,
> >>                               unsigned long *bits)
> >> {
> >>         struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
> >>
> >>         return gpio_fwd_get_multiple_locked(chip, mask, bits);
> >> }
> >> EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_multiple, "GPIO_FORWARDER");
> >>
> >> So exported functions are gpiochip_fwd_*().
> >
> > That sounds fine to me.
> >
> > BTW, do you need to use these functions as gpio_chip callbacks?
> > If that is the case, they do no need to take struct gpio_chip pointers.
> >
> I'm not sure to understand the question, or the idea behind the question.

Do users of the forwarder library want to use these functions directly
as callbacks in their own gpiochip?
E.g. do they want to use:

    chip->get_multiple_rv = gpiochip_fwd_get_multiple;

I hope my question is more clear now.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

