Return-Path: <linux-gpio+bounces-22909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD035AFC2B4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 08:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDD363B1925
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 06:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77F722154D;
	Tue,  8 Jul 2025 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sk4b5hHl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E1F2206BC
	for <linux-gpio@vger.kernel.org>; Tue,  8 Jul 2025 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956119; cv=none; b=DM/jRliaQ+St8vUgAaOU1eTeVN7UXFcvdsZTs8TkejOEaGrkPYEHVwVoWoE/0+JVDL7hNdwqQm39DAs3Qge/AuL80VZEiKYuJliBurG5GLvwk8ETkwboiRLBZG/YDGDdg0Gx7/lvBOeba2VZ+TKdBjoRb7i+RjAzTXlaoacqirg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956119; c=relaxed/simple;
	bh=I0rAk6mb7yKobFsz49sdDHTtScf9ylS26QbCpacwhZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/4MLnCVVKGTVfEsJxMukNNgIuMm3vAxfn02g46/Y/03Ef/U0hbjGpY4GiCAYvwNMt66cWaXryuG/QIAhsB2r1BY/OkQ+KWQ0tuiedmzbNZ1maNFClK1UFk8SlEnSSJoyVMeBHmOZKPD2K39mNptuQQruHwsXoJ6fftG9banRNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sk4b5hHl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5551a770828so3947011e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 23:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751956116; x=1752560916; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=epMO4JAtFgFxLvmQB+DGKVfgOj+pDHGWO9fLU9qAUo4=;
        b=Sk4b5hHlLbvMSea00iizq3aJzaFUear+n0VTqUiK4fV53N89kp8Gnvi+bvGIW02iOK
         b3wC+y3K0aSmiq9hWyqWD9C4s9ob4oqQO7Iawd0Bie4zS8xjVXYcW2tSj2rl7ZMfc/ss
         mwlzI5UjeA42ZsDp1rMJlRihYZOdjdB1vW4hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956116; x=1752560916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epMO4JAtFgFxLvmQB+DGKVfgOj+pDHGWO9fLU9qAUo4=;
        b=iK+8C/cwnyCil1eafIUMjjVdr7nXITDepXzfhv4ok5scbr9t5NZFbbG575ycpb96qe
         YoIARqZ0QXsm2iHTKI5OmmU09TEx5aPZupcfRqhB1/UXoAlvZCYT7UI5P5r6tq1cm7Vq
         B63xkzBQ6QA7H3Y6nrsXhC4bi7m+fdc+kVyLXDHVHi8tm82w8YZmiuNQsRs6k2dxqKin
         AtGkZ0l7DtAshUxfT8EJuKG/gUVMG5cHs5JE0sZG17B9Spz2opR7qO91ZZyIMDSZAWjQ
         b8153+EeuB0E7QMY6pvf5jsJo8oTA36CtjdHe2u/3NTbsnUCLtiIkaRitKOG/PWYMzqE
         jcQw==
X-Forwarded-Encrypted: i=1; AJvYcCUCCADcjBovoieqJBPlAEYSUZfcz8cop1uifZGp1R3FBGw7REx3Sp5ex8v+71sc84AEEqtFkC1pGyy+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6BadKHELiHNBPr31goXlP6d8iCm1zPj18CYEIaCR01e+jbiib
	rV1K4KI1jg6xQAbOSNWdoD2+GXks1b8oZFEBaXKE9axV2NADYgZZ13k0NCLFVhnBsykTq1ZVgDk
	heIw=
X-Gm-Gg: ASbGncsB+LoDmCHNtSbv1NZHKTES3r3alTebHtzK1yT+j5rrkeXvzQXghDC6B1u1dgF
	J8xUlSl3S3TS3MJpW3+9r1Fzv75kSPIwczIrrQEPDhNotrviIH36t+boelIn98MSn1jteuWD3qh
	FOs8KB35CfOJM/1AgRxqr6eghRsQlSDy14EdtuElNAnpU8iXDxZnTLRD0M6kBNIo9qBzTgmX+so
	kW0C5HGPAWnOgxhVvHqnz47zEhUlBXvWx5QU2obo5je1M8g7EpSRCbx5EYuaD2FW9y0cZEwwqtQ
	3pBge5BvdoemQMcDI9+wXoMdB0u/N75avST8Oa3Rt4wvyc+wjpJZ/BhEbru90fwEo8e9yW4cYVU
	GXMyQeyYWVvvN/qJm0CIMPT7PgxEf
X-Google-Smtp-Source: AGHT+IFLa3Ywz409RsvePflSyBD9VVrroMBCeT5xJnk2akksixwI3a8sjRf5bxmeQygRMYE02NhENA==
X-Received: by 2002:a05:6512:3f25:b0:553:5d3c:e444 with SMTP id 2adb3069b0e04-557f831b2a3mr456777e87.25.1751956115636;
        Mon, 07 Jul 2025 23:28:35 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638496985sm1577709e87.90.2025.07.07.23.28.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 23:28:34 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso46246971fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 23:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPNnM1tDaGLjUXfRMVNvjj9oxBKNfQjpvc6X/mQsUdSNH7JHl6eroaFsjVK1z8OopX6tgSDJv/sja/@vger.kernel.org
X-Received: by 2002:a05:651c:3254:20b0:32b:78ce:be8e with SMTP id
 38308e7fff4ca-32f39b48b77mr3774321fa.32.1751956114000; Mon, 07 Jul 2025
 23:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-12-5710f9d030aa@chromium.org>
 <20250629180534.GN24912@pendragon.ideasonboard.com> <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
In-Reply-To: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 08:28:21 +0200
X-Gmail-Original-Message-ID: <CANiDSCtq0cr1LgFCgvdBtWcE3z1MWZEjc0e1wTH_BYPETC+s4Q@mail.gmail.com>
X-Gm-Features: Ac12FXyYQKv3E7HlyxyFaWCzaarpcfNGMVTbadH4TCiFfkv-rgAm8ijV2sCYmI0
Message-ID: <CANiDSCtq0cr1LgFCgvdBtWcE3z1MWZEjc0e1wTH_BYPETC+s4Q@mail.gmail.com>
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

Hi Laurent

On Tue, 1 Jul 2025 at 13:20, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent and Hans
>
>
> On Sun, 29 Jun 2025 at 20:06, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > I would use "software entities" and not "virtual entities" in the
> > subject line and everywhere else, as those entities are not virtual.
> >
> > On Thu, Jun 05, 2025 at 05:53:05PM +0000, Ricardo Ribalda wrote:
> > > Neither the GPIO nor the SWENTITY entities form part of the device
> > > pipeline. We just create them to hold emulated uvc controls.
> > >
> > > When the device initializes, a warning is thrown by the v4l2 core:
> > > uvcvideo 1-1:1.0: Entity type for entity SWENTITY was not initialized!
> > >
> > > There are no entity function that matches what we are doing here, and
> > > it does not make to much sense to create a function for entities that
> > > do not really exist.
> >
> > I don't agree with this. The purpose of reporting entities to userspace
> > through the MC API is to let application enumerate what entities a
> > device contains. Being able to enumerate software entities seems as
> > useful as being able to enumerate hardware entities.
>
> What function shall we use in this case? Nothing here seems to match a
> software entity
> https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/media-types.html
>
> Any suggestion for name?
> Shall we just live with the warning in dmesg?

 I just realised that if/when we move to the control framework, the
software entity will be gone.... So to avoid introducing a uAPI change
that will be reverted later I think that we should keep this patch.

Regards
>
> >
> > > Do not create MC entities for them and pretend nothing happened here.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > > index d1a652ef35ec34801bd39a5124b834edf838a79e..2dbeb4ab0c4c8cc763ff2dcd2d836a50f3c6a040 100644
> > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > @@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> > >  {
> > >       int ret;
> > >
> > > +     /*
> > > +      * Do not initialize virtual entities, they do not really exist
> > > +      * and are not connected to any other entities.
> > > +      */
> > > +     switch (UVC_ENTITY_TYPE(entity)) {
> > > +     case UVC_EXT_GPIO_UNIT:
> > > +     case UVC_SWENTITY_UNIT:
> > > +             return 0;
> > > +     }
> > > +
> > >       if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
> > >               u32 function;
> > >
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

