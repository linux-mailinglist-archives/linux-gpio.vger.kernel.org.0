Return-Path: <linux-gpio+bounces-22933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF955AFCA1B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 14:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A52456082F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 12:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FB12DAFD5;
	Tue,  8 Jul 2025 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DtFuk9wt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED692D9EF6
	for <linux-gpio@vger.kernel.org>; Tue,  8 Jul 2025 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751976588; cv=none; b=sipNMxrA2vaNOLdJmUhhDJp14VgPVPJRoT+jlixzq2iWC1GEnfUy9iikX+C3Pn0AEqMX+ilHg4mF3NUUnGoSDrX7ECmXbQ6wllFs2s476hkz207YuLJvB70xQOt3odKwKhHeH/sI9HnRtSK/ZV6tdDJBm/6bhNBx2ihIhvbi1BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751976588; c=relaxed/simple;
	bh=dyXUujHTnYYHwk8qxqITJQ9BmoorGjnNWrcKqYxBG+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdHLq4TVs1haxsLsiAD/0NoGwDF77KLrWug+n79I6afUoIOuIyaDU8SI3gaj47cUKdpQR7GHs3lPGPc2haFeFgBbCkBeIXkds4G6+t+LQRmjBlcLN7Z0RkcMHDSAtWIN8d41WFWsmoMMWjfeWSzKpspkS5lkW6RXpj6Eyl0Moag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DtFuk9wt; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso4530121e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751976584; x=1752581384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMrJyzq+XGe4XZwQoy4OMfTD6mqi6tUL9Fg2sLgmdig=;
        b=DtFuk9wtD856txsVywjuC3unHKhnHWQrVH5CeLaFCPD2amvhImsCdhk/ZPmfDqbXjC
         2GampX6lrWgIUVCnwPT2ONNz4FtzSZq7a5Vn4JIsWXEDR4YO8yl+plQa2Ibz1T5yAAe7
         Oj6SE3F1+nPKFWgogTGxc6PIGLJWB7+cOGmvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751976584; x=1752581384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMrJyzq+XGe4XZwQoy4OMfTD6mqi6tUL9Fg2sLgmdig=;
        b=dIZXDa8MH9IPxvl56pX/S5Tetx6eswCNOAO4HngOKG02HIpORksACJdk2AJK9tci5T
         ShYY4h7TBMLsMJErAeLZXAfyg5yb0J+5+ulVy286CynTnybu25i4hRypy7/0e/QDv156
         /Ud9ZMjJg5HfH1qjsRy1FQpRQvLzvyf7E9CF7y7CgCR9vxoTDxyFhu2p8oIjqG61Jdpg
         tufvq3MMU8kaTNnJ2bm74rxd4tptxS3RPZC6mWQ8Jg3MnjOsULqX/Ndm25s7SNBv2yLh
         gTV8tlWhVOL44AgKUMtIdBohDGyjDD1EFu0H71mhrDx5BLyXg55YO9hq5iQi0R+IpnIQ
         9PPw==
X-Forwarded-Encrypted: i=1; AJvYcCW/pM2Zhj+aZO+FIiQ6EW/iuEoBEv/Hjhsq9YJJOAqC4lIWf03jlxfCyEVfJOxzweUNWepmKvIe/29V@vger.kernel.org
X-Gm-Message-State: AOJu0YweT6j5B667KU4HrSSvmQClF1kGzE0AjGH+laNt4sOGHfDJkuGF
	LQsdTlUSsq6WFOj6czN+WkjsEXozJmzAChOB4PAIEEH78Ne1HUjxdfVgDmgBp974Dc3YsCez/Nb
	0vHnKXAhv
X-Gm-Gg: ASbGncvf5QpGzxnTzSaylKPr+cP5RtO9GcKLfQTsYzcThfK2Mc6AB2DgmtrBHH7BIOI
	GHnXkti9tPN8D61GH1DgQYlkdYUacSs27O7zlnCe4Z+QQWxx3l/PzrTF2q800ZnqU5kCXbGhVEO
	a/oB7BN2IM+SbqwVjH+Ln88CYUpMEZXzxqRDyNPJ3SwdMVgPqB3I5KelBoKnKyLLKlHB7rooz9l
	PjNrm4QYwvmvIxHdySwHfKOOSHwpTOBf4Eb2sL55gsbLFhnwaS0sq+Z2DzEHGYOOOtdXRfH0LAT
	IlyhBYo/Xd5F/2yGApIpatoGUCpM9JDwlEbfAlOVgLsaWBd80Zg5QAIKmbxoTK9+8sjmAsO7uUk
	/9sS3RGccIQjGvmQd3RFX5r//MfhaNQJtzdArA/A=
X-Google-Smtp-Source: AGHT+IH72i/2YZrz3Sk6jQa0vYJ9khwyAyoBUkl1IGPTRj/pAPh7SrM/GgX1/xl6JME9MD28iNipNg==
X-Received: by 2002:a05:6512:3d0b:b0:553:241a:b93a with SMTP id 2adb3069b0e04-557f835bb50mr963191e87.31.1751976584108;
        Tue, 08 Jul 2025 05:09:44 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c485esm1645968e87.232.2025.07.08.05.09.41
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 05:09:42 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32f1df5b089so27666551fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 05:09:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBGflCzexrmKl+2W7ffYiiF1rLwQKr9MuADZtV3pr7lUfeeUPhdUfZcg/PLttNlCl4sA8bijkaTffG@vger.kernel.org
X-Received: by 2002:a2e:8e3c:0:b0:32f:1c0f:fb74 with SMTP id
 38308e7fff4ca-32f39b2409amr8468421fa.22.1751976580861; Tue, 08 Jul 2025
 05:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-5-5710f9d030aa@chromium.org> <aGw_1T_Edm8--gXW@kekkonen.localdomain>
 <CANiDSCup2iRx+0RcaijSmbn04nBY4Ui9=esCPFsQzOKe=up9Gg@mail.gmail.com> <aGzjTRSco39mKJcf@kekkonen.localdomain>
In-Reply-To: <aGzjTRSco39mKJcf@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 14:09:28 +0200
X-Gmail-Original-Message-ID: <CANiDSCsqEHTnbvzLMoe_yxi8JRzp+2PQe3ksXhD=Y3+AqC_9hw@mail.gmail.com>
X-Gm-Features: Ac12FXyPY8jp6OO5y2rUkBGCgm071L0BZh3437cx12a8IP9Dnshn9sW-VSnuQ7c
Message-ID: <CANiDSCsqEHTnbvzLMoe_yxi8JRzp+2PQe3ksXhD=Y3+AqC_9hw@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] media: ipu-bridge: Use v4l2_fwnode for unknown rotations
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Jul 2025 at 11:22, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> Hi Ricardo,
>
> On Tue, Jul 08, 2025 at 11:16:25AM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > Thanks for your review
> >
> > On Mon, 7 Jul 2025 at 23:45, Sakari Ailus <sakari.ailus@linux.intel.com=
> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Thu, Jun 05, 2025 at 05:52:58PM +0000, Ricardo Ribalda wrote:
> > > > The v4l2_fwnode_device_properties contains information about the
> > > > rotation. Use it if the ssdb data is inconclusive.
> > >
> > > As SSDB and _PLD provide the same information, are they always aligne=
d? Do
> > > you have any experience on how is this actually in firmware?
> >
> > Not really, in ChromeOS we are pretty lucky to control the firmware.
> >
> > @HdG Do you have some experience/opinion here?
> >
> > >
> > > _PLD is standardised so it would seem reasonable to stick to that -- =
if it
> > > exists. Another approach could be to pick the one that doesn't transl=
ate to
> > > a sane default (0=C2=B0).
> >
> > I'd rather stick to the current prioritization unless there is a
> > strong argument against it. Otherwise there is a chance that we will
> > have regressions (outside CrOS)
>
> My point was rather there are no such rules currently for rotation: only
> SSDB was being used by the IPU bridge to obtain the rotation value,
> similarly only _PLD is consulted when it comes to orientation.

So something like this:?

static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
                                     struct ipu_sensor_ssdb *ssdb,
                                     struct
v4l2_fwnode_device_properties *props)
{
        if (props->rotation !=3D V4L2_FWNODE_PROPERTY_UNSET)
                return props->rotation;

        switch (ssdb->degree) {
        case IPU_SENSOR_ROTATION_NORMAL:
                return 0;
        case IPU_SENSOR_ROTATION_INVERTED:
                return 180;
        }

        dev_warn(ADEV_DEV(adev),
                 "Unknown rotation %d. Assume 0 degree rotation\n",
                 ssdb->degree);
        return 0;
}




>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda

