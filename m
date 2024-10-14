Return-Path: <linux-gpio+bounces-11278-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2C99C33B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97730284B7C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C4E155382;
	Mon, 14 Oct 2024 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KpIMzwIb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A71614D2BB
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894460; cv=none; b=XC2ZGjOpbRL5ItnamdKp9E/F8ahfcCjtG3UCmOOMY7CvOXjlpefQ28ErNEkdwCnqvKDQoJdrKbL1eVBmgt/HrPW6IogQn+YanPNZV8iW+giu1SmiNweRMp2CeCWkaVIhIq0Iw4iOzuWdd7/qtnpgIkQwqKkJW1LP6EQH55VMM3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894460; c=relaxed/simple;
	bh=TJzj3Ji7bLkY42Y0Qiq/OYG4j5c51i9ljEt10a3JImU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HxKM5EKIv85b/trgSLDmiMjIcPZUrHRO/OQ+Bi+56xUevIeHffArBWKlCRToPxl/YJsHVm3xT9dNSU3KUG+nyLiD98LOs02TPIzAQGFcBGpLmKz3IwDXhHdMf42Zw/i8kqBFaxVVi+m4CvWkRx38iBMyPgqdGxGcZFTVlP3F9V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KpIMzwIb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728894458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJzj3Ji7bLkY42Y0Qiq/OYG4j5c51i9ljEt10a3JImU=;
	b=KpIMzwIbnyc3OZEO0kR5m7oNlahGPLfmrSU7qp570hxygR81PVaVt0BgcKKaJzuPh23+gn
	lXm3pYLZsgg/LyY3Os4zz1Aj8687kfZsiUoqOND8JsdqCXrOWU51db9pExtY/cy+oX7qEF
	jyu7sAduOxWJeE3iCYg1nZPdCAx33do=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-N6ogaSX1NXq8iN0XigLpcw-1; Mon, 14 Oct 2024 04:27:36 -0400
X-MC-Unique: N6ogaSX1NXq8iN0XigLpcw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9a04210851so68740666b.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 01:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894455; x=1729499255;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJzj3Ji7bLkY42Y0Qiq/OYG4j5c51i9ljEt10a3JImU=;
        b=Y0AUkbNdPxwRIgLg5YvY2Nu2PNOzkH4xTFCvGXH0bWIjiT6rQKlKfSs3DaQS5S0bVe
         JbGAY0oSyj93ou8PGG/9qw18RbrdCijMRwTcgW2LOOXlEvvJf3PTABG1T+hzapHMmN/E
         l/J9xAGMiL8jpjIeGGyjZ0OG9bh2ecfa5anidMpAh0dFwmSLiCr1RR4F657v7DvSQECK
         WRNqagZr6kn56H4UxOi/96qpDOtgnSlFZL5sq4BCm69YiM1J826iyMmaDyc7q7HCFn3U
         h76nrPu70pt7y/rctqdyIeMKfyTtZCHjEyTJbHuR2JXuCQCEDN3y5mUf56yXNseAuH8U
         jYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWNJPnIKTM3wArLEHvDxqpNYaOqawFihvxzhwkq9TnOSGB1LgcpTCSfeiRkFLHCeDLfbXw6lis7QNT@vger.kernel.org
X-Gm-Message-State: AOJu0YynEmPWfVdzANSv0XayikgRP0Ng1Fdwm2pe+fWQF1mmv0ZPE8qi
	nddssads1XluZ3zsJYG5QMjpqbSIA004fK7/V837LkqpYRzqPGaVhOB/chrhkBelmWeQdIh01lt
	nbo0XXvoUQ4QCYCXMX4eRrj3joEDu4Hopu58jLcthsY746kNEJRaBWKRt2SM=
X-Received: by 2002:a17:907:d03:b0:a8d:3d36:3169 with SMTP id a640c23a62f3a-a99b95e99afmr1010125266b.63.1728894454861;
        Mon, 14 Oct 2024 01:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET06hligI0OlzzqWIT8Zxv8HD0sGUV38UYd28vMXZeTZMRv5ATRNZ8cQQeTW6fnRICTxBimQ==
X-Received: by 2002:a17:907:d03:b0:a8d:3d36:3169 with SMTP id a640c23a62f3a-a99b95e99afmr1010120866b.63.1728894454431;
        Mon, 14 Oct 2024 01:27:34 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2d37:9800:1d57:78cf:c1ae:b0b3? (200116b82d3798001d5778cfc1aeb0b3.dip.versatel-1u1.de. [2001:16b8:2d37:9800:1d57:78cf:c1ae:b0b3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a0edb1a00sm113812666b.128.2024.10.14.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:27:34 -0700 (PDT)
Message-ID: <e612ef6af75929fa874817e6e8b4b69473af8051.camel@redhat.com>
Subject: Re: [PATCH v7 4/5] gpio: Replace deprecated PCI functions
From: Philipp Stanner <pstanner@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jens Axboe <axboe@kernel.dk>, Wu Hao <hao.wu@intel.com>, Tom Rix
 <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>, Xu Yilun
 <yilun.xu@intel.com>,  Andy Shevchenko <andy@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Richard
 Cochran <richardcochran@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Al Viro <viro@zeniv.linux.org.uk>,  Keith
 Busch <kbusch@kernel.org>, Li Zetao <lizetao1@huawei.com>,
 linux-block@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-fpga@vger.kernel.org,  linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Date: Mon, 14 Oct 2024 10:27:32 +0200
In-Reply-To: <CAMRc=Me8U+7EwNDEh2RJJD8+FTPqO-CbwG_fiDmHLpjxh33o5w@mail.gmail.com>
References: <20241014075329.10400-1-pstanner@redhat.com>
	 <20241014075329.10400-5-pstanner@redhat.com>
	 <CAMRc=McAfEPM0b0m6oYUO9_RC=qTd1vsg4wMn1Hb4jYQbx4irA@mail.gmail.com>
	 <dc9d7bd817e5c8bc88b0b8dfffcf83b2676cc225.camel@redhat.com>
	 <CAMRc=Me8U+7EwNDEh2RJJD8+FTPqO-CbwG_fiDmHLpjxh33o5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-10-14 at 10:15 +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 14, 2024 at 10:08=E2=80=AFAM Philipp Stanner
> <pstanner@redhat.com> wrote:
> >=20
> > On Mon, 2024-10-14 at 09:59 +0200, Bartosz Golaszewski wrote:
> > > On Mon, Oct 14, 2024 at 9:53=E2=80=AFAM Philipp Stanner
> > > <pstanner@redhat.com>
> > > wrote:
> > > >=20
> > > > pcim_iomap_regions() and pcim_iomap_table() have been
> > > > deprecated by
> > > > the
> > > > PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
> > > > pcim_iomap_table(), pcim_iomap_regions_request_all()").
> > > >=20
> > > > Replace those functions with calls to pcim_iomap_region().
> > > >=20
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > Reviewed-by: Andy Shevchenko <andy@kernel.org>
> > > > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > >=20
> > > This is part of a larger series so I acked it previously but at
> > > second
> > > glance it doesn't look like it depends on anything that comes
> > > before?
> > > Should it have been sent separately to the GPIO tree? Should I
> > > pick
> > > it
> > > up independently?
> >=20
> > Thx for the offer, but it depends on pcim_iounmap_region(), which
> > only
> > becomes a public symbol through patch No.1 of this series :)
> >=20
>=20
> Then a hint: to make it more obvious to maintainers, I'd change the
> commit title for patch 1 to say explicitly it makes this function
> public. In fact: I'd split it and the deprecation into two separate
> patches.

Yeah, good idea. The maintainer could squash then if two atomic patches
are deemed undesirable.

Noted.
Thank you!
P.

>=20
> Bart
>=20


