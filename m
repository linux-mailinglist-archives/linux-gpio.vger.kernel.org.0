Return-Path: <linux-gpio+bounces-16363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF25FA3F4B4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 13:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A95D0179DC8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 12:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BC01EB1B9;
	Fri, 21 Feb 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="KJTalR0E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ECBF4FA
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740142172; cv=none; b=EtWcfwXaaBSwkcBNlm4uWXh6fHRbOtlAeGf06Kzaa8k9AMiqSLk3UZQEQQFTxtrnLato4JQxwbgNZr8X2Q6HJMnC/uQradkfDDLTEkAQrIYHAbpyYp4p4pswFN+gHhwt+5yx0+kxS7M5cKpv+/RSOWsyNIUC14yWMkY39vSAorc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740142172; c=relaxed/simple;
	bh=XZC6YO9cfD3PYKWQaHvmx9J7OqQe50DqvuwqbV/O7Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOXZHw1dej3gFnHwwR7Tbrq9SWJhPtotJTEEJ2O4AOK1RO/OW0EwNHyesASSgcrKXXp7LM5pksh8Vg9tmzRFht+mhh36IU2ApsaRSabuwkt7QDwQU2nO/wWyGpdbWAZiIzCx4tnLUJWEecUqMZTtQWlLV4tpcabTCN4VXRxwnSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=KJTalR0E; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B7F0C404A2
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 12:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740142162;
	bh=Cbhc1gItpcV9XrUirN5RFenJxQvMr3Yj1sfpWoFEODI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=KJTalR0EwYNDhj77OKMsBP+PBp2DV3suT93b/pcrgNMqm8AAskIQope6yzCUdnPno
	 bxz3a2faH9lZ5eSrjHAXFAgtqc+WVDIZRCMCvPf7h6phaNVejewapfcpZoExZffBsr
	 FR9H9VouYaPC4MX6WRJJmcd2W/Z8RysRFLkehy8LAz633vaJyTrPnIwCTc6tPDLOew
	 KBc6PjXMQYzqiLD2Yu4IdivyWbo2oINx2LI/q4uGjSnYMRTnpGZyuVoENSGNoieenB
	 c0NrzZOSl8jSaWkV2COB40H6WQqgVoNRQlUT91AsNlumPXTswnX1smgxSg7/3kmqSo
	 +9Yci5i35fdiA==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fbfa786a1aso6918364a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 04:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740142161; x=1740746961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cbhc1gItpcV9XrUirN5RFenJxQvMr3Yj1sfpWoFEODI=;
        b=oEv8/UHj+T6rkNcpgYcn9DGR0OY4RMuPcf1jVbwVvbcHSUtMQDB7mMZBdfU3sYGsdJ
         +6sB/6bImDeyGFSTkRmmTzoAl6VeZj5+0rDnKU+9O6r1jxRs2zeyeHT2S4eqHu6Zk+z6
         P8lQdfjHyDr3G6XU9tKsA5mLSGeuztUTMi6M6LBzdG/auPeOZFsij2okoGyXz8tOn7gh
         e8ZJBFdgPhzwY6s+7n2Kw1CV3RIcskn0W5Kek7Ml03l/ku2ul8aLf0ScDKEKNqTt/R1I
         OBIQjFniMcaARjxlCgz2To/KC9wRGDYQ4Yamxt4zLpaLv9vqhLkL9itjufRpVXHObyAp
         51JA==
X-Forwarded-Encrypted: i=1; AJvYcCVa7bpbf/gEH3pD/rRNbddi09lvQZK56vvQWaJGVwWVynUf+N8Qd3TFJTbO8IsyV1YzZNae6HphzANq@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTFr8LjIJgjx+tq51T4jIwNOuzI6RxYArdd6vMyFP0m9Uf1g5
	wG2d46A7hOOaTTBfDlPxgrCI3G1/FF6F0qhL0YFtpbDIg6B+JI/oVJfGv6d+y5DOxeNGSIPUEGS
	FYRq7sSXwwx8i6ddi/hglqJ1sakrGZ6PK2i2tMD4RCX70se3Ozij6U0g8xBKUOf2cZ6XfRUs60n
	Q=
X-Gm-Gg: ASbGncsnC5PcoLP7Gx0DW/oUVRKqkhS+OChghmQyww3jGLItQ5gehTxtNSPG0zOzdoj
	oiA8lmqnmZLBOjYA4lSb+GbK0EhT654MgkOXd8bgNDKLX7MIWSnkqgcxc9LVR6G9ktUZdnLQPRk
	OAgY3mVYUcKbh3EqbrKuhrpDrei4N1YsvaPIPoop2iXGuNPbTeK3yfCfODDT2qTuFuZ219rMrhy
	evlOpunLFycue4vI8dusjNra5ba7BWrRClxdqpX+VlieUfbjVK5PqJV/FoSHUeH6cpu23lRexIg
	yftXOyge2H+V9z379Q==
X-Received: by 2002:a05:6a00:3cca:b0:730:9a55:d921 with SMTP id d2e1a72fcca58-73426ce9816mr4726267b3a.14.1740142161302;
        Fri, 21 Feb 2025 04:49:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+WrUmQ1IDllm96EpcU+4i2VZHzQKp2I4mpHe6LQtUBeMbNazqwM3Swjy1TvDaB7O4OM+ewg==
X-Received: by 2002:a05:6a00:3cca:b0:730:9a55:d921 with SMTP id d2e1a72fcca58-73426ce9816mr4726233b3a.14.1740142160899;
        Fri, 21 Feb 2025 04:49:20 -0800 (PST)
Received: from localhost ([240f:74:7be:1:2777:7867:71cd:dd56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73270a9c8dcsm10685337b3a.74.2025.02.21.04.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 04:49:20 -0800 (PST)
Date: Fri, 21 Feb 2025 21:49:17 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] gpio: introduce utilities for synchronous fake
 device creation
Message-ID: <uucxoejbornqxgm2h4qjxhv77aispccwxl55qelk5rynwfs6nd@vxjscvztfzlf>
References: <20250218160333.605829-1-koichiro.den@canonical.com>
 <20250218160333.605829-2-koichiro.den@canonical.com>
 <CAMRc=MfmG0okVjV1nH78Aw18dFcoOAZ-UwU-iFc1VKb-BVcTxQ@mail.gmail.com>
 <CAMuHMdULzDfdg-7HBk1f-Z+AZ5L2WGUEiPMqtvk+bNSkLb38BQ@mail.gmail.com>
 <CAMRc=Mecp9se3dTLkS6AokP3N=GHJ6CRNCuYipMfjd3crYkNWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mecp9se3dTLkS6AokP3N=GHJ6CRNCuYipMfjd3crYkNWQ@mail.gmail.com>

On Thu, Feb 20, 2025 at 02:27:41PM GMT, Bartosz Golaszewski wrote:
> On Thu, Feb 20, 2025 at 2:24 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Bartosz,
> >
> > On Thu, 20 Feb 2025 at 12:06, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > On Tue, Feb 18, 2025 at 5:04 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> > > > Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> > > > platform device, wait for probe completion, and retrieve the probe
> > > > success or error status synchronously. With gpio-aggregator planned to
> > > > adopt this approach for its configfs interface, it's time to factor
> > > > out the common code.
> > > >
> > > > Add dev-sync-probe.[ch] to house helper functions used by all such
> > > > implementations.
> > > >
> > > > No functional change.
> > > >
> > > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> >
> > > > --- a/drivers/gpio/Kconfig
> > > > +++ b/drivers/gpio/Kconfig
> > > > @@ -1863,6 +1863,13 @@ config GPIO_MPSSE
> > > >
> > > >  endmenu
> > > >
> > > > +# This symbol is selected by drivers that need synchronous fake device creation
> > >
> > > This comment is unnecessary, please drop it.
> > >
> > > > +config DEV_SYNC_PROBE
> > > > +       tristate "Utilities for synchronous fake device creation"
> > >
> > > Please don't make this available for users to select, this should be a
> > > hidden symbol only to be selected by its users.
> >
> > It is still useful to make it visible for compile-testing, i.e.
> >
> >     tristate "Utilities for synchronous fake device creation" if COMPILE_TEST
> >
> 
> I disagree, this will get plenty of coverage being used by three
> virtual drivers.
> 
> > As it does not depend on GPIO at all, I think it should be moved
> > to the end of the file, outside the big "if GPIOLIB ... endif" block.
> >
> 
> Indeed. And eventually I'd like it moved to lib/ but that's for another time.

I'll move it outside the big "if GPIOLIB ... endif" block. Thanks for
pointing that out.

Koichiro

> 
> Bart
> 
> > > > +       help
> > > > +         Common helper functions for drivers that need synchronous fake
> > > > +         device creation.
> > > > +
> > > >  menu "Virtual GPIO drivers"
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds

