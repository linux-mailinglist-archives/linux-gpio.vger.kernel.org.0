Return-Path: <linux-gpio+bounces-23231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9AFB04504
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 18:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 979507AC8D9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 16:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9310E234984;
	Mon, 14 Jul 2025 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GfLm4AqL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8507C25C83A
	for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752509108; cv=none; b=kg2SQ/mL4tYrgfDaoQRqg2cjOXgCejeG4GKfO5CnJYj4Zuia/WRgkqgQ/KO5b/1RfOSBqzss8hf/uBxCkXBBX3Py+wQBSmXrM+ez0Tnn5S17ICnqcJ6lEG9sfhdiRCc4+zUYNjMDUO4A3WSf9JByRmX4SJFqKqRBF1fiN5wyKas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752509108; c=relaxed/simple;
	bh=JxBVcWXOzrC+pQuiz7DoBffwFHlGca0wC939BUa4mlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YofmCkfB7+XjXjcftO+VzI4diwmVNhbrmGmCEN8NoEsxcC8KR+PiqcrflFjBrmTnNqmfQjdlTOEXdj6XvRYuPN0j4E02/16Y0hx5wp66kf2oIuzrSgImSi+1+Z8omWfLCl2AecR1lc51TPZ02gxxVWX7nIpA9DjGoazmziWJ7vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GfLm4AqL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55516abe02cso4389963e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 09:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752509104; x=1753113904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CDahj8/rNyyq5vqGI+SiuXe8oo3E19xokCP/r0ki8Vk=;
        b=GfLm4AqLdAYMmIdsZmkS3MDXEffjkrDEMVR6tZs3khBTyJrnQZFOnMFkHRU4TMgO8j
         icyFMoP5wWkmp3DwfyvHad2DsNtWv1uvOX44ruTe57bvqIbKE6zl4XhNXoZhJdUe+nzX
         ffCabjgfgaVrbomI80mnayTzEZrPsZnvhkAqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509104; x=1753113904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDahj8/rNyyq5vqGI+SiuXe8oo3E19xokCP/r0ki8Vk=;
        b=l73+g5EVAkeaBWFq27qvrs3AQ/Ka308682AC8vBp5iEK2rDe2bP3D2G5YZVK5zyDSO
         v3todbJmXmUBkmfkEQ6w16qdgZsi9nd+YUoNkJ+Ti82juuNz8HBs2yXNzXjCPmMvOsgk
         eTRqmpxus5+6g70Yfwb9W6oJh4dYRsFdy3esBmRWw7q3V0vqlKXQ6FwL74gHv2K43Ffk
         VjJQsmW2SlGpyhfcpbuVf9l+bNV6F2wTBelYFX0O0+rx6XhIRVPurDGCgIrAhcRZxLsi
         EZxkdqKlmy3GEZEJJHn8ZSx1++YnIq6QtjOGaTQzNIwu2swpLHGdyFZ29/QAqrvFgFhX
         GKVg==
X-Forwarded-Encrypted: i=1; AJvYcCUZffm1RRj6yaadhG9+xSItNj3obqOu+LkHijOgtam1w/tkouv+VGTAVbdrV5hP6y5xqc0C+jQY0Om+@vger.kernel.org
X-Gm-Message-State: AOJu0YzIyiBFT7oNGRnBWnXKoKTIcWTfXY0/pBVfe69YWqIRa7SUD0OR
	PX4K66OkDrX96ITALTjGWUwnCdNT5TAozrv501//vct91e3EzCziZC/LyLC8+A7KeM72ICeaVap
	QFgklSA==
X-Gm-Gg: ASbGncswaSCuPI228qstAGMWiZh44Q8Vv+OmyWkplNEDqSYihmybdxIoU4T3IjUcVpe
	bZnxqSP3TORankFI6KTp+eZOqcA0i2ty9ZTsMsSrbGRITJyHBdQtfi9K+VEYR/h/PJ/sX/9zbTb
	MN20lF1d+6kgp/KL1Ayfv5Jz54cwlSzfaK2sOW7Ecqzeq9U/aVQAbn4iPdGGvEJBlo5xWpVG/5K
	oZjWNZUcxjAu4yYBXnu6rjopJ9RQxWWC7SsJJ7Sbz9elocvUcA6YiNpEwbOcFsB16JHVR2w4ZRI
	KfyY28g5psv7SGg8CzjCDguFboYvkJGM5yZARzLcK57uRsUHJeumUkBeg1iTIlhhQ67Twtx47VK
	kOL52thOxG58rh+mr/SjLCin8mVdH+uaRD0vBRldiRCntZEA1a/Kz/7Kie+1M
X-Google-Smtp-Source: AGHT+IHKTQwfwybUAw83jGY5qPja+cirG8DZ5v4ewKZ850PwexIpAKIJq824HP3q/pfhk6/KWfQXVg==
X-Received: by 2002:ac2:43b0:0:b0:553:35bb:f7ba with SMTP id 2adb3069b0e04-55a1c456496mr57534e87.11.1752509104217;
        Mon, 14 Jul 2025 09:05:04 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b74335sm2005938e87.215.2025.07.14.09.05.03
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 09:05:03 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55516abe02cso4389928e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 09:05:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURlXx2XxyX9LxzV0HA7EbZ4vw/d8Fr8MwgtEUALgKqyxNmE/sUllYzJhA3t4ni9YeoKR5ziL1LEufP@vger.kernel.org
X-Received: by 2002:a05:6512:3b9e:b0:553:2884:5fb3 with SMTP id
 2adb3069b0e04-55a1c467663mr45477e87.12.1752509103021; Mon, 14 Jul 2025
 09:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-12-5710f9d030aa@chromium.org>
 <20250629180534.GN24912@pendragon.ideasonboard.com> <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
 <CANiDSCtq0cr1LgFCgvdBtWcE3z1MWZEjc0e1wTH_BYPETC+s4Q@mail.gmail.com> <20250714143617.GK8243@pendragon.ideasonboard.com>
In-Reply-To: <20250714143617.GK8243@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 18:04:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCud66tcaODuVA1TreEQ3k8u4k-6ghzRQedTPFcT3j+9VQ@mail.gmail.com>
X-Gm-Features: Ac12FXxJPvBJAM528bNZN02Nhk1iZCMcKXmyshIGKqYKQPEJihw9v-tpgzFvPcg
Message-ID: <CANiDSCud66tcaODuVA1TreEQ3k8u4k-6ghzRQedTPFcT3j+9VQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] media: uvcvideo: Do not create MC entities for
 virtual entities
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jul 2025 at 16:36, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jul 08, 2025 at 08:28:21AM +0200, Ricardo Ribalda wrote:
> > On Tue, 1 Jul 2025 at 13:20, Ricardo Ribalda wrote:
> > > On Sun, 29 Jun 2025 at 20:06, Laurent Pinchart wrote:
> > > > Hi Ricardo,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > I would use "software entities" and not "virtual entities" in the
> > > > subject line and everywhere else, as those entities are not virtual.
> > > >
> > > > On Thu, Jun 05, 2025 at 05:53:05PM +0000, Ricardo Ribalda wrote:
> > > > > Neither the GPIO nor the SWENTITY entities form part of the device
> > > > > pipeline. We just create them to hold emulated uvc controls.
> > > > >
> > > > > When the device initializes, a warning is thrown by the v4l2 core:
> > > > > uvcvideo 1-1:1.0: Entity type for entity SWENTITY was not initialized!
> > > > >
> > > > > There are no entity function that matches what we are doing here, and
> > > > > it does not make to much sense to create a function for entities that
> > > > > do not really exist.
> > > >
> > > > I don't agree with this. The purpose of reporting entities to userspace
> > > > through the MC API is to let application enumerate what entities a
> > > > device contains. Being able to enumerate software entities seems as
> > > > useful as being able to enumerate hardware entities.
> > >
> > > What function shall we use in this case? Nothing here seems to match a
> > > software entity
> > > https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/media-types.html
> > >
> > > Any suggestion for name?
> > > Shall we just live with the warning in dmesg?
> >
> >  I just realised that if/when we move to the control framework, the
> > software entity will be gone.... So to avoid introducing a uAPI change
> > that will be reverted later I think that we should keep this patch.
>
> You know my opinion about moving to the control framework, so that's not
> a very compelling argument :-)

Correct me if I am wrong, your opinion is that it will take too much
work, not that it can't be done or that it is a bad idea.

Will send a patch using MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER, but
when/if we use the control framework, please let me drop the swentity.

Thanks!


>
> We could use MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER, as that's the
> function already used by XUs, and the SWENTITY fulfills the same role as
> XUs in some devices.
>
> > > > > Do not create MC entities for them and pretend nothing happened here.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > > > > index d1a652ef35ec34801bd39a5124b834edf838a79e..2dbeb4ab0c4c8cc763ff2dcd2d836a50f3c6a040 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > > > @@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> > > > >  {
> > > > >       int ret;
> > > > >
> > > > > +     /*
> > > > > +      * Do not initialize virtual entities, they do not really exist
> > > > > +      * and are not connected to any other entities.
> > > > > +      */
> > > > > +     switch (UVC_ENTITY_TYPE(entity)) {
> > > > > +     case UVC_EXT_GPIO_UNIT:
> > > > > +     case UVC_SWENTITY_UNIT:
> > > > > +             return 0;
> > > > > +     }
> > > > > +
> > > > >       if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
> > > > >               u32 function;
> > > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

