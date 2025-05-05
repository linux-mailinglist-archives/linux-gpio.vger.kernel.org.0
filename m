Return-Path: <linux-gpio+bounces-19612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD9AA9D65
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 22:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F12527A20B3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 20:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03C825C6F4;
	Mon,  5 May 2025 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cNMFeFzJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5F21C861D
	for <linux-gpio@vger.kernel.org>; Mon,  5 May 2025 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477657; cv=none; b=Ql+p2GoBU1+InxAS8ogRINm2Etx5xkA46CmvndKCmYWazTK0RFn9tPAn+5xVbMA7dgDsBFPYCnpToXU+kkQrwNpprJUizvdL91C/NTYJIwypop1VzcDnSL+6+UYoeK3pPBDU+JxrbmrFheQHYjQQbHUnc5TZ44arE5kQLKVJwPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477657; c=relaxed/simple;
	bh=eXsbeYaStEdVkB/9iiuPPvCcb0GJ33j+Y7Lm4GpCn+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVOvVKT2oDEJxM4ttNTjDjsy1NNyqumkyESFU03eY8bsknbYOnkQ8kbP5BEcbLNFV982okPCDjbHK8GtXcQOVaqnKPZnfdChktfU6FFWAKUW6AIzLA9xFhZTyUacKYPd/19FMxQ2ySmM9rbKO4Kr2xKQnBeJ1RbA9TKTcWkMujI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cNMFeFzJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ace98258d4dso700272066b.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2025 13:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746477654; x=1747082454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aad+O7LlnePo9Jud5k6L+0x2zxiP/d5GA/t21nuBedc=;
        b=cNMFeFzJtxQgzXi3qDHel0FtK8JZ9Dt7+Wk6xvxBOS3Wa/SQEGZA+veun1YIHYBnLs
         EzieRZtz+3B0KPEFLjaLIsJxUUuvTA/UjGpP4wkEJx6w8CKxEBp4v2iHuIb6LoTRrlXJ
         /e+Hk3XVvXnpNEXTe5obHiIogQVu94/ytDL84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746477654; x=1747082454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aad+O7LlnePo9Jud5k6L+0x2zxiP/d5GA/t21nuBedc=;
        b=f2kqVx68iE0bj7FTnKYhweT+ks+UZKl3MISVZRsJaOQvF2TvddeV7vNY80qO3XJK7W
         hL9BB2bH4/xphQWRI43gWpOVaNYKPtJlpanUUKpnMhHejQxmgSl4jqLAn3OfBKwG7lut
         cTOrhv9pmoKf5xhFWntScxIitWCYuPVG3JnF78hnZ0RJiUIAaLWYS9jP2LQ+1VUAJwin
         kgW5f9pqEarOOaljDyMOMNsbKD+VR0oIT+X/qpDQzoIBwrIaABdd8PrAZKiQ9pa3l8PR
         pra+em3byA6FSlRJ8jUk5ja8ZnvNBlS0MDt9APR0FnRNKk5z6o2+yZ5BZjuQpGawANtJ
         aDnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUX9AdvUk5CR1zNH+lKruVnS3xOLOzHvlCDxde1fqxMFSpwQolq4rvHuVrK1q48rBiKHBK2QNQHFhj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc1ZijmeDL+RcH7myd8kB3sHZ78RHpi1GR42jPXQC1XNKDDjor
	PzFukifBNSfozXBsM7rrJiA6LpfYtyE3dyr2AFHaYeLRkYRyWTGCbX5SlaaXhrH+1Nut0Db0/xW
	3/Q==
X-Gm-Gg: ASbGnctilmC+z+eoWakt3D/9LIw+MV3w8TA+s7H5kX3xhGVvOIrl2KmoqLAKqxbkANG
	9xUtF1z07pMYEBQiJ6FCXtFchF+Wtm5C1SJ6yKPLj/efvUo4cL3CpwIkjLnQyjUhXc9OHUo2QGR
	246kcoA0/euM+g3HEPrIVJ9O60pO07fnqBxUnE3WGY9GHKojc9r3XLxhl6f0Am7B1Tsq4uK0jsr
	M88ok25b+b0tdt1oGRTMywePKeIiFSSL/L+MVcGOWazlmCb31MGpB3gnx5toG5n2+1xUc6dGPq2
	fvmvFJs+FGrMyfSR17x+lR65kULaxx1EtvJgXZ53/2r+uvdabV4BHMEMsQKbX06wxJjJQy3Tv4K
	J4h4=
X-Google-Smtp-Source: AGHT+IGGRC1++6+NeWMy1URALtnURbl57OomNg0mK9aQkCa6TwkOv3R90ssagk0F1EwPjwG4NOrIvA==
X-Received: by 2002:a17:906:99d5:b0:ac6:e327:8de7 with SMTP id a640c23a62f3a-ad1d467afedmr35010466b.42.1746477653683;
        Mon, 05 May 2025 13:40:53 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914d067sm550083266b.3.2025.05.05.13.40.53
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 13:40:53 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso8871630a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2025 13:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNBtTOq0Bjs72sa1lXt2kR8/iA9XXqk3PY/gAqZwRcbSWG4tG2LXShG2Wtzk3funAnKTr0Cs+QpfnO@vger.kernel.org
X-Received: by 2002:a05:651c:b2a:b0:319:d856:c2f3 with SMTP id
 38308e7fff4ca-3266b59789emr751721fa.10.1746477268328; Mon, 05 May 2025
 13:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org> <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
 <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
 <dd471b51-333b-4537-ac58-29ad2a10f1e2@redhat.com> <aAdkU65ruBfyRjss@valkosipuli.retiisi.eu>
In-Reply-To: <aAdkU65ruBfyRjss@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 May 2025 22:34:16 +0200
X-Gmail-Original-Message-ID: <CANiDSCt5_HwfwXDWNGWvzkSAW2ZB4PJwS00=i0EizY_3A-OSgw@mail.gmail.com>
X-Gm-Features: ATxdqUEg2rUAsN7TYo98ElSvRXDzyBQACXaWg80nr6xGofF6c5WfqBKJm9vPYRM
Message-ID: <CANiDSCt5_HwfwXDWNGWvzkSAW2ZB4PJwS00=i0EizY_3A-OSgw@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for v4l2_fwnode_device_parse
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari

On Tue, 22 Apr 2025 at 11:41, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Hans, Ricardo,
>
> On Tue, Apr 22, 2025 at 10:44:41AM +0200, Hans de Goede wrote:
> > Hi Ricardo,
> >
> > On 22-Apr-25 2:23 AM, Ricardo Ribalda wrote:
> > > Hi Sakari
> > >
> > > On Sun, 13 Apr 2025 at 17:50, Sakari Ailus <sakari.ailus@iki.fi> wrot=
e:
> > >>
> > >> Hi Ricardo,
> > >>
> > >> Thanks for the patch.
> > >>
> > >> On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
> > >>> This patch modifies v4l2_fwnode_device_parse() to support ACPI devi=
ces.
> > >>>
> > >>> We initially add support only for orientation via the ACPI _PLD met=
hod.
> > >>>
> > >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >>> ---
> > >>>  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++=
++++++++----
> > >>>  1 file changed, 52 insertions(+), 6 deletions(-)
> > >>>
> > >>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/=
v4l2-core/v4l2-fwnode.c
> > >>> index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1=
c96f2a5ede3fa9d64dab3 100644
> > >>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > >>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > >>> @@ -15,6 +15,7 @@
> > >>>   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > >>>   */
> > >>>  #include <linux/acpi.h>
> > >>> +#include <acpi/acpi_bus.h>
> > >>>  #include <linux/kernel.h>
> > >>>  #include <linux/mm.h>
> > >>>  #include <linux/module.h>
> > >>> @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwn=
ode_handle *fwnode,
> > >>>  }
> > >>>  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> > >>>
> > >>> -int v4l2_fwnode_device_parse(struct device *dev,
> > >>> -                          struct v4l2_fwnode_device_properties *pr=
ops)
> > >>> +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> > >>> +                                      struct v4l2_fwnode_device_pr=
operties *props)
> > >>> +{
> > >>> +     struct acpi_pld_info *pld;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld=
)) {
> > >>> +             dev_dbg(dev, "acpi _PLD call failed\n");
> > >>> +             return 0;
> > >>> +     }
> > >>
> > >> You could have software nodes in an ACPI system as well as DT-aligne=
d
> > >> properties. They're not the primary means to convey this information=
 still.
> > >>
> > >> How about returning e.g. -ENODATA here if _PLD doesn't exist for the=
 device
> > >> and then proceeding to parse properties as in DT?
> > >
> > > Do you mean that there can be devices with ACPI handles that can also
> > > have DT properties?
> >
> > Yes it is possible to embed DT properties in ACPI, but I don't
> > think that is really applicable here.
>
> This is determined by
> Documentation/firmware-guide/acpi/DSD-properties-rules.rst . So rotation
> and orientation shouldn't come from _DSD properties on ACPI systems.

Doesn't this contradict what DisCo does?


if (!fwnode_property_present(adev_fwnode, "rotation")) {
struct acpi_pld_info *pld;

if (acpi_get_physical_device_location(handle, &pld)) {
swnodes->dev_props[NEXT_PROPERTY(prop_index, DEV_ROTATION)] =3D
PROPERTY_ENTRY_U32("rotation",
   pld->rotation * 45U);
kfree(pld);
}
}

It seems to first check for the rotation property, and then check _DSD.

If I send a v2, shall I also replace DisCo even if that means
reverting its logic?


>
> >
> > But we also have secondary software-fwnodes which are used
> > extensively on x86 to set device-properties on devices by
> > platform code to deal with ACPI tables sometimes having
> > incomplete information.
> >
> > For example atm _PLD is already being parsed in:
> >
> > drivers/media/pci/intel/ipu-bridge.c and that is then used to add
> > a standard "orientation" device-property on the sensor device.
> >
> > This is actually something which I guess we can drop once your
> > patches are in, since those should then do the same in a more
> > generic manner.
>
> DisCo for Imaging support currently also digs this information from _PDL
> (see init_crs_csi2_swnodes() in drivers/acpi/mipi-disco-img.c), but this
> is only done if a _CRS CSI-2 descriptor is present. It could also be done
> for devices with the IPU Windows specific ACPI objects and it would be a
> natural location for handing quirks -- there are some
> unrelated Dell DSDT quirks already.
>
> >
> > > What shall we do if _PLD contradicts the DT property? What takes prec=
edence?
> >
> > As for priorities, at east for rotation it seems that we are going
> > to need some quirks, I already have a few Dell laptops where it seems
> > that the sensor is upside down and parsing the rotation field in
> > the IPU6 specific SSDB ACPI package does not yield a 180=C2=B0 rotation=
,
> > so we are going to need some quirks.
> >
> > I expect these quirks to live in the bridge code, while your helper
> > will be called from sensor drivers, so in order to allow quirks to
> > override things, I think that first the "orientation" device-property
> > should be checked (which the ACPI glue code we have can set before
> > the sensor driver binds) and only then should _PLD be checked.
> >
> > IOW _PLD should be seen as the fallback, because ACPI tables are
> > often a copy and paste job so it can very well contain wrong info
> > copy-pasted from some example ACPI code or from another hw model.
>
> Unfortunately that does happen. :-(
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda

