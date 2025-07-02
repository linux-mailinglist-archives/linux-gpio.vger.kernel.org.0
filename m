Return-Path: <linux-gpio+bounces-22553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4994AAF0973
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 05:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E8723B6304
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 03:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F761D7E41;
	Wed,  2 Jul 2025 03:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pjh0jrCz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E8715A858;
	Wed,  2 Jul 2025 03:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428497; cv=none; b=m3LMd25YBCRLpJKhHAyD7yWyfvOVoupsOKd/J1oxu99N00zTG2t8y+qPHbDz5R3xEMk6d7HX8HzEkobLhqsySCiqGFVSZmGJ9eO9UnI4/DDmumPVUwI+TI/JSLy+spEZmS5p4yuz+o6htSF1ZeWTP4NP/viLE+bwOF/Q/dXIBik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428497; c=relaxed/simple;
	bh=7H4BV7ZIVTytOwiwWbSrEbGoMGiTPL28bTiVllN5tZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lz+DYL/0C2LECuvV14ghVJcr7uXh6scDSbzu+WhiOSVY3H21MxR77AqVPZC2r2C2jsIj61QV0pZEBPD/TrqwTzDas221RyNgnJzVCsDzAE5Q5H8/nuFniOj2xqU5D6+ndPnONp9v1S6jv6PNg1+w4SlP1jFq6Y6jTIppWajRQh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pjh0jrCz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22c33677183so54543845ad.2;
        Tue, 01 Jul 2025 20:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751428493; x=1752033293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SeVVML8rF/Yg7PwP3kkWgdCem6ZWbPVvKczMSjjevlc=;
        b=Pjh0jrCzPUwJLOR2CnzBBHO0cfFouuF3gUg9veURMEFOgu53ym64jDBfriGU+FxGhs
         Y8uX+LUv2u/9J9/iP6Fn0e/1Aw3OOlyKskJY3Aemud6/ejLw5lEzyeF1wKcwz5b8ZPuX
         Kr8YMDJQKgjydDgeNRdFGfE8o6StOw0olz6VtJ+txVCkRdaeWw3Mv2vAtB6+P5CFZEIx
         1quIKXdifsVdP9cEA/r9I5LqxludGo0zxTCuMMZur1PZoYwGBYPqOZuHBVsMv2ytuV12
         ssav6rFY2Plscv0wEVSiw7xa1VDgq8s43PkNFni2cJql4RFQknwD4Lu1eaEG3Xay0E7W
         fPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751428493; x=1752033293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeVVML8rF/Yg7PwP3kkWgdCem6ZWbPVvKczMSjjevlc=;
        b=MrVQk3A6YV75aBmaFvjm7GpT4cfN6ZAlmKJ+P4B8w2ddfZcnjDh5Wqr7j4tUfyDWk7
         DzY4wPtdfegxnhZTCKNXdbVlucEi5c+l10Z0uRHaJe8E0wuoMyjf+yR5oHS9JkxckRBL
         RefqRBNRrkoNaK+hSn1AZ+fqb40x+wmEY1Q/qO72ZtaZgSeQPnVju13VsDBJkJtOkWKp
         wO8m8GVApvRQJeb8T7rGtWWdC2meXgvDuKorm6iEGwXYpK274VeMwdlbr3pT6UfVU5Hd
         iqNgVWdaETigpKKDjWcH+zA8MeQfenMb0RwrQqx0fCFzueeispuWMYSmOeCsq9n9ZEgU
         vT/w==
X-Forwarded-Encrypted: i=1; AJvYcCV7w8FA7tkf9vJJNWIcnV2/7z6KAa2tUEcV7Zu/P9HscVaS77mNN/wsxDK3S9OOdTmpreywctlSIYDK@vger.kernel.org, AJvYcCVMC1gxk+DvYipQAjYMxqU+eoptQbv08XB2leUtmhqWj1vaKhaz7YSXyHKBGMLGpWjep3STTSd9RyQgIyj4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9EB2VU1X1qa2RX09gfF2iQqqOGPM6scYI6aFDMVwc26pvnKud
	UhYDrgD4Nw7DHLwlU561L2dtPrtKuUalQKdDtIq/IUB1p345y7Lv+QnPK2GpEw==
X-Gm-Gg: ASbGncsRPbJavvLq59bpZ9NerkxODuRb4sElmJvuAOFxgFjJS0bNwBVRpio/vknzdFt
	I4C4Gll1UIaTPqX2asswy0fEV3fHvDKDeDdwpZ11w2ZQ65DAd83du7aN9+SYD6ygrF4kmJvMf1g
	qFUZRCBeApUnzDnBbLPA8o1/7q20zhBV8SzxzvcaClyu4ZrWwr9KCUayVCJoV8ApVcbB83N+abp
	J/wxPyDH1i1fGyS9iM8go4YMGNlVzIZL/7pErkgPhFmQvi68prxFvHk5B+Pa0Ez4OScR1yAYvJu
	I+We053Uyv3tapFxgRIE6v6cw4ccLWY5RVIoicQGhnMevGVCUkjRba8oQDQo7CE4W42iMwz+ILr
	I3Xk=
X-Google-Smtp-Source: AGHT+IE4TblemtH1kKq4GH3b2FhyKV7tenYanLvI77N+gxp0fw1TUBg/JQQBduObx5PhTYrPi8Vt3A==
X-Received: by 2002:a17:902:ce12:b0:234:8ec1:4af1 with SMTP id d9443c01a7336-23c6e403e4amr20093145ad.0.1751428492835;
        Tue, 01 Jul 2025 20:54:52 -0700 (PDT)
Received: from rigel (61-68-193-107.tpgi.com.au. [61.68.193.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f17f5sm124260415ad.62.2025.07.01.20.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:54:52 -0700 (PDT)
Date: Wed, 2 Jul 2025 11:54:39 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Message-ID: <20250702035439.GA20273@rigel>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGPrFnDxG4W7S9Ym@smile.fi.intel.com>

On Tue, Jul 01, 2025 at 05:05:10PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 30, 2025 at 02:37:07PM +0200, Bartosz Golaszewski wrote:
> > Following our discussion[1], here's a proposal for extending the sysfs
> > interface with attributes not referring to GPIO lines by their global
> > numbers in a backward compatible way.
> >
> > Long story short: there is now a new class device for each GPIO chip.
> > It's called chipX where X is the ID of the device as per the driver
> > model and it lives next to the old gpiochipABC where ABC is the GPIO
> > base. Each new chip class device has a pair of export/unexport
> > attributes which work similarly to the global ones under /sys/class/gpio
> > but take hardware offsets within the chip as input, instead of the
> > global numbers. Finally, each exported line appears at the same time as
> > the global /sys/class/gpio/gpioABC as well as per-chip
> > /sys/class/gpio/chipX/gpioY sysfs group.
> >
> > The series contains the implementation of a parallel GPIO chip entry not
> > containing the base GPIO number in the name and the corresponding sysfs
> > attribute group for each exported line that lives under the new chip
> > class device as well as a way to allow to compile out the legacy parts
> > leaving only the new elements of the sysfs ABI.
> >
> > This series passes the compatibility tests I wrote while working on the
> > user-space compatibility layer for sysfs[2].
>
> It seems I never expressed my overall opinion about this. I think the poking
> sysfs and making it working with a new schema won't solve the issues that
> character device was developed to target. If so, doing this just brings yet
> another broken interface. I would be happy to be mistaken!
>
> If I am mistaken, I would like to see a summary here that explains that clearly
> that the new sysfs approach does not inherit design flaws of the original
> implementation.
>

Indeed.  I've already expressed my reservations about supporting the whole
of the existing sysfs capabilties, but I've otherwise tried to remain out
of the discussion.

To reiterate my position:
While I am all for maintaining sysfs in some form to cater for those
rare cases where cdev is too heavyweight, IMHO it is a mistake to
support the existing sysfs capabilities in toto.  Take the opportunity to
remove the parts of the sysfs interface that don't work well.
The new sysfs should only provide the features required by those rare use
cases, which IIUC would be basic sets and gets, and exclude those features
not required, particularly warts like edges.

If you need more advanced features then use cdev.
If all you need is basic sets and gets then sysfs is probably fine.

If that isn't the case then there should be some explanation as to why those
sysfs features are being maintained.  Treat this as a new interface.

Cheers,
Kent.



