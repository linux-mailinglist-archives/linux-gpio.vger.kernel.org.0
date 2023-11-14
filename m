Return-Path: <linux-gpio+bounces-96-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 067EB7EB06E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 14:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6A851C20A4B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 13:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABCD3FB3A;
	Tue, 14 Nov 2023 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwiI1fSi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713D3FE24
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 13:02:02 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF3B196
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:02:00 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5b31c5143a0so64522217b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699966920; x=1700571720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iUh9bh4g34uEd8ne3mi/ZU8ueseqaQ4Cq4ajTU9LBk=;
        b=VwiI1fSiwC3wFoKPDg/O1vnRDWP5cgtGbrfie43ouTLfdw5gF+wWwKk0PxHV4W9yCr
         tzXwlgacJJG6WRIM/O/JCf1TB5W+HNBcKcJoYlv26A2ltCKrSmxFUoGCPcPGMwmLqKnM
         0x6XPbol7rH0gQrXPMN3yYfzj1n8u9rS42CwpTw12wCd/6llPlSeQooRrBnuDj7cLZ+n
         sG4Gi6movCw3F8RnfoVvzZOCnchB6WMWLu2TxMs3cJ4+FaSF3pP/UDklZfGe9a50yhlO
         PPP/r+puT33krN456TkX3AfCoDqK6GZnTXhaWWjjE1x/laOq91Z7+OG960hFPiBjNpxK
         Eaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699966920; x=1700571720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iUh9bh4g34uEd8ne3mi/ZU8ueseqaQ4Cq4ajTU9LBk=;
        b=Juwr16ZMNTrCFMm5TwdtQc5x6WSWEAJVH2RFKJv195lsJXOY1/PoVy8yfIGBLmbNgm
         qPeSNibB2tXp7w/Nb16cDpHos5tNCVKN+ekSeB2NWuK012aALdcIqQGBGPAJxo9i8Ln6
         +RKZYlX34UXyCx/Wp5NaP/dluQylGWRladaeatmHxUH7v3HfH2hAxN8w/e2XF2F+nFYr
         2Q2R31AWQsp9uND328fctja4YpzmvubHvJA3UQUotSYwcAt3V5j/ZP/N0rndnoOjYUKq
         XYKcgxhHjzki+Fmp3Api+XfOdfaWUxas5qSlN4MlIqads4z/VwUpsu6/lPFXweLRpeDJ
         SeKA==
X-Gm-Message-State: AOJu0YxVlUD0fMMRZAbt90qcy2oNHPJEdsRjAWCZKuQEVH7CoUUo4W8R
	fC+57t1ZBw7EIh5wOBTSA+H/CSxTRwUadMg+x0kcQw==
X-Google-Smtp-Source: AGHT+IEwiv+yUa6bXQUbd2NNRU+2d9nlZK9YjvigWUECwxlTDLOqpL3zemAMdzElEyhWah6jsD5lOqad+swtthrcxwc=
X-Received: by 2002:a81:5fc1:0:b0:589:fad6:c17c with SMTP id
 t184-20020a815fc1000000b00589fad6c17cmr11738976ywb.45.1699966919909; Tue, 14
 Nov 2023 05:01:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231110102054.1393570-1-joychakr@google.com>
In-Reply-To: <20231110102054.1393570-1-joychakr@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:01:48 +0100
Message-ID: <CACRpkdZ9RHcHh4o5g62ywK0eQHpLZuGUF0Ud6jogk9Sfqe4krA@mail.gmail.com>
Subject: Re: [RFC PATCH] PM: runtime: Apply pinctrl settings if defined
To: Joy Chakraborty <joychakr@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	manugautam@google.com, aniketmaurya@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 11:21=E2=80=AFAM Joy Chakraborty <joychakr@google.c=
om> wrote:

> Apply pinctrl state from  runtime framework device state transtion.
>
> Pinctrl states if defined in DT are bookmarked in device structures
> but they need to be explicitly applied from device driver callbacks
> which is boiler plate code and also not present in many drivers.
>
> If there is a specific order of setting pinctrl state with other driver
> actions then the device driver can choose to do it from its pm callbacks,
> in such a case this call will be a no-op from the pinctrl core framework
> since the desired pinctrl state would already be set.
>
> We could also add a Kconfig knob to enable/disable this, but I do not
> see a need to.
>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>

It has a certain beauty to it does it not!

The reason it wasn't done like this from the start was, if I recall correct=
ly,
that in some cases a device needs to do the pin control state switching
in a special sequence with other operations, that can not be reordered,
i.e.:

1. The pin control state change is not context-free.

2. The order of events, i.e. context, does not necessarily match the
     order that Linux subsystems happen to do things.

When looking through the kernel tree I don't see that people use
the sleep state and idle state much, so we could very well go
with this, and then expect people that need special-casing to name
their states differently.

What do people thing about that?

Yours,
Linus Walleij

