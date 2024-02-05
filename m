Return-Path: <linux-gpio+bounces-3009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516984A6E3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 22:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10DB1291797
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 21:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A705A0E7;
	Mon,  5 Feb 2024 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y/BuByBu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E7C59179
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707160957; cv=none; b=E+oPfzCCLIaJuAYy+JqHLQ7QjXKsFNfbBNtTjHvNTg4SvG5UuMZA8XZLi1LB//e1oepbzU20u6/5ETYi5tgU+Is4h/Q6RLMGvtXrpPC+42oTdxD4MeZZYbS7NfNKhdLQAxzmqWgt49+meAVVRTGijfJI+cp3QVFpFjqgYjqd1XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707160957; c=relaxed/simple;
	bh=NwBlikZijPaOxVrOlduCDZWMNDt4ZvQHlENdA4RHTFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMoqMCgBd/e6kMhxxnzr454Fe8A/qkMpXiSv8vToaLKfvGA0YGgrwl+R8uM95YxmAGeuBff8ClMtqxjpmLKP3RWFVzbMXUvCe9TiYmbm0AlhrLRkN9VMoKg5BEI3bwpTCPq9+/Z8j9jc0AIrTSK+feWLKYX9XoHhtBiap4/06IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y/BuByBu; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-46d1ff63d2fso478139137.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 11:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707160954; x=1707765754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggfb0KYupuME39WhX88C24P8RaPJxHV95I1dCnInQMA=;
        b=Y/BuByBuyI2Tq03VlSoy49UG2U8FwWs1fN84YXJuosPT+ZRc56M8FrJRGb4LKNuPaG
         q/PAszUkgTXQyvdPawTChQEkENGTyoqlxO1eL3pmJ6iHoEbzoXn82PPAJ9jV4ooBAWLE
         Sr/5Iw0qzmfxDnVb9ajw6sJmFpjndBlhhaC87SWL4TY92/lWCXi46vMt++/eOPjKLIab
         iGuOlAfEfXXV6txEpWk47M2C2oL6oEPZ7A8E4XUF182hF6YikcwPbtvE8Q8q6EXbtrrk
         Lqjpqc/2aJEQ+XzhIvq+UDSpFLMoCRATdEdsqva9Eozh0fQTWI0lezz8WH02MPVw8Nff
         s/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707160954; x=1707765754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggfb0KYupuME39WhX88C24P8RaPJxHV95I1dCnInQMA=;
        b=kE9YE1w0fOH5RFkEDJmJASvwP6wzxUCBnfs/oaB+Y7G9cqoXfNLP++Dzu7t/DAgX8q
         9ydwBAHZZh+b9o6Klynd//XhP3XVpWojI4vgRHmwMfmENMpjgMEdcTmh6iPmgsqUloar
         hAR0QSQ7ikRnox5mTR3vWgu7ngqN24J06FCfJ1M3oMYeTNGKMBzpE8ZgmBh329gIGRn6
         Hys5jRqX+k3c5Vg+oiGq8Qll/V5H+EROshVUPbIKtRskGJVPNbJwo7iqYs5Ip0A5HtxO
         z3jpKVx9mvwhgFMJKc8CNpwyy/Qh4cNEGWCoJC8oDFCWblsPkBrjJ2Sapwa2Dpmc0Wk1
         fQ1g==
X-Gm-Message-State: AOJu0YymjSy0JkRwY7fRhxnlnGeNlTFHaUhnWZp8EfIL6tiFj+/myAAg
	rOhDrGsLPAERYSbuwsQ0gD3oUdtb1T+h2XAusTjiSnWosfhDmGXjwH11E74c6MJnnRByf9Z3zOE
	QizrooUEonFDPn6YXSf47r58eESEJCDV7j4AO2Q==
X-Google-Smtp-Source: AGHT+IGinN5jGIXyMjYWCHv7zGef7C+W3Cca5ToqMKJR8rYfg4GLYCIiNrDzuvavfG4J/wZUrrpovhDMcV4YKfU9XF4=
X-Received: by 2002:a05:6102:2749:b0:46d:282b:9e8c with SMTP id
 p9-20020a056102274900b0046d282b9e8cmr958024vsu.25.1707160954437; Mon, 05 Feb
 2024 11:22:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205093418.39755-1-brgl@bgdev.pl> <20240205093418.39755-18-brgl@bgdev.pl>
 <ZcDS60dB39y-B6WR@smile.fi.intel.com>
In-Reply-To: <ZcDS60dB39y-B6WR@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 Feb 2024 20:22:23 +0100
Message-ID: <CAMRc=Mf+nTw1iwbDvmF2=93KxEimxBndVEhdp9V7kAzvGqizTQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] gpio: reduce the functionality of validate_desc()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 2:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 05, 2024 at 10:34:12AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Checking desc->gdev->chip for NULL without holding it in place with som=
e
> > serializing mechanism is pointless. Remove this check. Also don't check
> > desc->gdev for NULL as it can never happen. We'll be protecting
> > gdev->chip with SRCU soon but we will provide a dedicated, automatic
> > class for that.
>
> ...
>
> >  void gpiod_free(struct gpio_desc *desc)
> >  {
> > -     /*
> > -      * We must not use VALIDATE_DESC_VOID() as the underlying gdev->c=
hip
> > -      * may already be NULL but we still want to put the references.
> > -      */
> > -     if (!desc)
> > -             return;
> > +     VALIDATE_DESC_VOID(desc);
>
> IIRC we (used to) have two cases like this (you added one in some code li=
ke
> last year).
>

None of the consumer-facing functions does it anymore. Not sure about
this, maybe it was removed earlier.

Bart

