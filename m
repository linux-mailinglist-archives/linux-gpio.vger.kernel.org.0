Return-Path: <linux-gpio+bounces-22478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E487AEF65E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 13:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14D851BC3C7F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 11:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC51272E41;
	Tue,  1 Jul 2025 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XLZ1GENW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D99726E71F
	for <linux-gpio@vger.kernel.org>; Tue,  1 Jul 2025 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368832; cv=none; b=HscYdhMqarVn7b0MFYHFlGU8hf0cAxPSbKEC835rbEUZqWOqg+W4LEKBkAsTUTvHoyUpseg+Is67Sh9kkWZB/SP/f5lo96ne1ZoUaI4NfBSud2U+88o7kSfgSyzlqEKeJCwitcU/exMc8iKGs6H0R1WfVaGzid6IbplinIQNGVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368832; c=relaxed/simple;
	bh=9ksikN0iTD/GCWHlwVzlhstVFQF+DnzhexLRXUKHtb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nS5bUZLiMS26wNDZjlMsHY1ym/jzDex+MSIRO8sHRahRfWXpE4CsCaCHOy6lAIPeLiJWV6IGyybsRVwZ8kHRZdoSDlQfnBmB55YY+jxcid6e60kxB8Q2qH8cbcxSQqcxnR8yY48lP82WZt9hAc4dibPw/42stMdqDeijuYgqqYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XLZ1GENW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55516abe02cso2722805e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jul 2025 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751368829; x=1751973629; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZwGCtkc+w6FZ7pTS+qyfMjlhro6+usoRehWf2lDots=;
        b=XLZ1GENWaTZHJsvjR1C6IgtMzwQPcaEStMHg7AXXcUAA1lg2uzHFy5/UOk2MjEvKLJ
         xmLydFIIBYjVCiSegySJRt75IqIrAQ3753zbhwX6bCzSiQluTjmiB5GdKaQDOujiIFko
         etJiBK2E/YvdXL8OgfSOVZefKi/lrtEAuM+wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368829; x=1751973629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZwGCtkc+w6FZ7pTS+qyfMjlhro6+usoRehWf2lDots=;
        b=j6qNo+rZ+Kzv5ONOdOUOpCytgaHOge6p69SvjcuQonsqXoG+m0R4PZcKqSXtc9xxaP
         H5TKgAYjZtQuccfZYxA6uHA+wLrdvbp6ZLrsGKUTbePBKxYQpWDPUx/CYL0NQjp7CP48
         NJonUAzJsjitsfYXN5mLOWABZOILg4vsdTkASUfRrmSI+/np2J5NfNxZQ4WVJb9+uFeY
         J/SMwdi2O6wRNJi6dpdwnlcGiyh9glJ8tD4nf+cFwvSX0qrKkEemuVFxcdOLeATcXa4U
         xIedzVIi0hxYhXwdYjvwPokzP6tAyYacve2dnepIG6wdu6gmFKnaFY6gSYjT247L+VHs
         nuxg==
X-Forwarded-Encrypted: i=1; AJvYcCUiDFeOtPC3vXVMlJnlLhzpAT54RZgqgNv+/9XaT6aG9qDqExvV9eqkXrXtrCD7k9z1wxhyd/n5MGFZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0pwJbh8QhmwaVfLgNcVc9PA9WNbyuxnu5z8je9H4g7lsAc3O
	bkrP5ATPSXWCmybzEWO6UZQWARvjtvBn80Wufj9eL/0cqn4rFuE8MbYia+Y2e3jg0jg4IfUhKmI
	DdFx0sQ==
X-Gm-Gg: ASbGncsvUNBmka3tYKyzn+loutswnV32r7wylA2+NbYS4UA26MMqLCexvDpzesIgEWk
	2ui67JoXVZ3nUNwsuMIUWQDeyT1gs0bucblBpjTMlKKgkzWkKyn5fCIygXStgtibVXH3l9JVq8B
	EbNqhk4m64e5le4KTZHf00Duw+RRwcu36QheDC1CnaCb8G1aEKbkKC8sAwGbkH7+SjoBD1hZzHy
	kzoLZCQL3Yh0lMb/eJeHsJ7QP8wdJWUPcStJA9qkUZbr+cEnAl+oy1tWDJtcOAWAa2sA4ioUKtt
	eL92E7eoR2ZacMoCMMCTGBvrLss62TPKeO63/wg7aEvBT+0rGcfCL788u3cU3OxeQRDKXMm2wmE
	BogvVptq9r3pbvLGBn/N2wERu
X-Google-Smtp-Source: AGHT+IGT7dWidSH52SXdoCyk0vFP8CCCNI3hVe1TcgfKsW0IoVGq5ZE2H0twsBMIbouRdWr8/S5g5g==
X-Received: by 2002:a05:6512:e96:b0:555:130:1fa8 with SMTP id 2adb3069b0e04-5561f8d30dbmr999262e87.22.1751368828510;
        Tue, 01 Jul 2025 04:20:28 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a73f6sm1789229e87.138.2025.07.01.04.20.27
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:20:27 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so7201798e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jul 2025 04:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMAis8X9YhrTtYG/X4GTJf3dRzmrz7SfmHmlWkDH8gBHt6Tv4P0GxEOi64aT4kP5kSe7zCCpy4dv40@vger.kernel.org
X-Received: by 2002:a05:6512:3f24:b0:553:2159:8716 with SMTP id
 2adb3069b0e04-556235309fdmr606439e87.26.1751368826374; Tue, 01 Jul 2025
 04:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-12-5710f9d030aa@chromium.org> <20250629180534.GN24912@pendragon.ideasonboard.com>
In-Reply-To: <20250629180534.GN24912@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 13:20:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
X-Gm-Features: Ac12FXzZWFSV19mV0XJRYxH4cTBUxCR__A0Z2BgypZ23AIk9o_remHKEgYijnOg
Message-ID: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] media: uvcvideo: Do not create MC entities for
 virtual entities
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent and Hans


On Sun, 29 Jun 2025 at 20:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> I would use "software entities" and not "virtual entities" in the
> subject line and everywhere else, as those entities are not virtual.
>
> On Thu, Jun 05, 2025 at 05:53:05PM +0000, Ricardo Ribalda wrote:
> > Neither the GPIO nor the SWENTITY entities form part of the device
> > pipeline. We just create them to hold emulated uvc controls.
> >
> > When the device initializes, a warning is thrown by the v4l2 core:
> > uvcvideo 1-1:1.0: Entity type for entity SWENTITY was not initialized!
> >
> > There are no entity function that matches what we are doing here, and
> > it does not make to much sense to create a function for entities that
> > do not really exist.
>
> I don't agree with this. The purpose of reporting entities to userspace
> through the MC API is to let application enumerate what entities a
> device contains. Being able to enumerate software entities seems as
> useful as being able to enumerate hardware entities.

What function shall we use in this case? Nothing here seems to match a
software entity
https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/media-types.html

Any suggestion for name?
Shall we just live with the warning in dmesg?

>
> > Do not create MC entities for them and pretend nothing happened here.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > index d1a652ef35ec34801bd39a5124b834edf838a79e..2dbeb4ab0c4c8cc763ff2dcd2d836a50f3c6a040 100644
> > --- a/drivers/media/usb/uvc/uvc_entity.c
> > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > @@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> >  {
> >       int ret;
> >
> > +     /*
> > +      * Do not initialize virtual entities, they do not really exist
> > +      * and are not connected to any other entities.
> > +      */
> > +     switch (UVC_ENTITY_TYPE(entity)) {
> > +     case UVC_EXT_GPIO_UNIT:
> > +     case UVC_SWENTITY_UNIT:
> > +             return 0;
> > +     }
> > +
> >       if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
> >               u32 function;
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

