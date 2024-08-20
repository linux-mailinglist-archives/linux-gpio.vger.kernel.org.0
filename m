Return-Path: <linux-gpio+bounces-8843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C553958052
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 09:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 287FE1F23EEA
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 07:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8085189F5C;
	Tue, 20 Aug 2024 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PzbLZo15"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4080B189B97
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 07:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724140369; cv=none; b=d97aCILLaNeoTf2rvNtZ87tj9vNsOUWB+ca94jq7+uTuki5FaP+zoqzzNCVdmMUUblLoT2qXkwUKxkz+gbiw95DYT83igPcszs4ABScEuynilSLSA5BJnRwuFCApD3H3CKaW2IVkWQpiMoWPwaRTlehMItGdhRtYpijwxEzb75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724140369; c=relaxed/simple;
	bh=1hrfqpooKpeya5+PZlvnCHYzRtetrL992iOV3Yf87NM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mh3il0pHOYhi+AojWpTdmP+BggTq/vtWoPWox1QCLy3Bm/QFWFsGBjNobYSbj6qZ9oBbaWaut4+GoCN0NMLrnfzIKWzs2eMGiSlv85LCZrFCqqpeNnQ2LzBNf/ftT0HrO6Oi+ZPMCBwCf2kpTVpDokWlWsxu06AFYNqwcw7Pisg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PzbLZo15; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724140367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YeiSyPiPKmNnwOfGWuoS296+qVzydzMPMNriUvsyur4=;
	b=PzbLZo15EyxHtYol4DLLbXEZPXkSk4QBQK/9vdFUp3tPwBwRF1zghirx6wH07slovGi5nC
	mdt5TtDWnTOIs1BROTdT8x6BIiZAtBlPIkoErnsN+FtOYFo0uxBFKif0dlR/m98tr8sn2O
	fHlcxM5yIdmJdneswZR2gy3jKDya9Ko=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-RxN7Q8oBONOgcvflaxAkbQ-1; Tue, 20 Aug 2024 03:52:44 -0400
X-MC-Unique: RxN7Q8oBONOgcvflaxAkbQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5bece15bd49so552078a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 00:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724140363; x=1724745163;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YeiSyPiPKmNnwOfGWuoS296+qVzydzMPMNriUvsyur4=;
        b=FgdLIlXrqMq0OZ7zJ1ngJYF2chWfEwkPYWK8dq0FTEhAFd/7z6oelK8ZflIjBXnEVi
         LxSXyWnVSjLpVMcpBrUKeDBGA3XvVZ6aRZDqjCJ1y3/9FV8fnFC+pUB2KpMHu6VI4Nso
         iDmpXreKLRgVYopDmbCfIbSZoneBkAy7GtyX7AI1USIBDqRhiOCdJYilcgVMdNxIFz1c
         9zonQR7yStkLiofgJ5JGYeH4ecWV0TRZ3AHh+W0NpJBvFox95W4i14Y1GBm6F0AXGuCJ
         cVjVkQy1wEnoqyQxaUD8TPGS1lDwWibZCEU5buQUfg9Zw0GMUS8zuh9Cu0HSxOmqYNTq
         n2QA==
X-Forwarded-Encrypted: i=1; AJvYcCXMk4eFA1FaPS9UMTyoeKCFGN/i7mb79YEHkbmwUbToX2jTMSDSfX+Wn+FHcZKoivHO13nNGyKcyuSTWYHtzRXkpwVcPbvPC8UtAg==
X-Gm-Message-State: AOJu0YxOpAfIyXrtZs9Sfp3bosXdvzaSe7hSPY/W65U5fOh8IklqkJjJ
	WStNEE2jdz9JO+5aAy2e8r9LdQ/FZxQbv4lFBL3tq/+50lNmF7sn2g+7iiHdgTLgf+h9wcAjh5T
	icV6nAn3IEgTQLNhOKqCCeErvi7n91GpkxXlOqE243cTrftxmcN/wjQ+zKrg=
X-Received: by 2002:a17:907:7da8:b0:a7a:a33e:47cd with SMTP id a640c23a62f3a-a8392f0f09amr559788966b.8.1724140363117;
        Tue, 20 Aug 2024 00:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCcSzDTDTcLcwJLqj7qP91xXOb0HQ7Ix0WDiy6h5hU0b8EQrJaBGayIlt+2svr7xzZZtOaow==
X-Received: by 2002:a17:907:7da8:b0:a7a:a33e:47cd with SMTP id a640c23a62f3a-a8392f0f09amr559788066b.8.1724140362524;
        Tue, 20 Aug 2024 00:52:42 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383946973sm722531566b.160.2024.08.20.00.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 00:52:42 -0700 (PDT)
Message-ID: <ef48369d230ef1912da157e7b437040bece6b5f4.camel@redhat.com>
Subject: Re: [PATCH 7/9] ethernet: stmicro: Simplify PCI devres usage
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: onathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, Wu Hao
 <hao.wu@intel.com>, Tom Rix <trix@redhat.com>, Moritz Fischer
 <mdf@kernel.org>,  Xu Yilun <yilun.xu@intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alvaro Karsz <alvaro.karsz@solid-run.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>,  Eugenio =?ISO-8859-1?Q?P=E9rez?=
 <eperezma@redhat.com>, Richard Cochran <richardcochran@gmail.com>, Mark
 Brown <broonie@kernel.org>, David Lechner <dlechner@baylibre.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>,  Hannes Reinecke <hare@suse.de>,
 Damien Le Moal <dlemoal@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-fpga@vger.kernel.org, 
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-pci@vger.kernel.org,
 virtualization@lists.linux.dev
Date: Tue, 20 Aug 2024 09:52:40 +0200
In-Reply-To: <ZsOO2uuGmD97Mocj@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
	 <20240819165148.58201-9-pstanner@redhat.com>
	 <ZsOO2uuGmD97Mocj@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-08-19 at 21:28 +0300, Andy Shevchenko wrote:
> On Mon, Aug 19, 2024 at 06:51:47PM +0200, Philipp Stanner wrote:
> > stmicro uses PCI devres in the wrong way. Resources requested
> > through pcim_* functions don't need to be cleaned up manually in
> > the
> > remove() callback or in the error unwind path of a probe()
> > function.
> >=20
> > Moreover, there is an unnecessary loop which only requests and
> > ioremaps
> > BAR 0, but iterates over all BARs nevertheless.
> >=20
> > Furthermore, pcim_iomap_regions() and pcim_iomap_table() have been
> > deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI:
> > Deprecate
> > pcim_iomap_table(), pcim_iomap_regions_request_all()").
> >=20
> > Replace these functions with pcim_iomap_region().
> >=20
> > Remove the unnecessary manual pcim_* cleanup calls.
> >=20
> > Remove the unnecessary loop over all BARs.
>=20
> ...
>=20
> loongson_dwmac_probe()
>=20
> > +	memset(&res, 0, sizeof(res));
> > +	res.addr =3D pcim_iomap_region(pdev, 0, pci_name(pdev));
> > +	if (IS_ERR(res.addr)) {
> > +		ret =3D PTR_ERR(res.addr);
> > +		goto err_disable_device;
>=20
> It seems your series reveals issues in the error paths of .probe():s
> in many drivers...
>=20
> If we use pcim variant to enable device, why do we need to explicitly
> disable it?

No.

>=20
> > =C2=A0	}
>=20
> ...
>=20
> loongson_dwmac_remove()
>=20
> > =C2=A0	pci_disable_msi(pdev);
> > =C2=A0	pci_disable_device(pdev);
>=20
> Not sure why we need these either...

It's complicated.

The code uses pciM_enable_device(), but here in remove
pci_disable_device().

pcim_enable_device() sets up a disable callback which only calls
pci_disable_device() if pcim_pin_device() has not been called.

This code doesn't seem to call pcim_pin_device(), so I think
pci_disable_device() could be removed.


I definitely would not feel confident touching pci_disable_msi(),
though. The AFAIK biggest problem remaining in PCI devres is that the
MSI code base implicitly calls into devres, see here [1]


P.


[1] https://lore.kernel.org/all/ee44ea7ac760e73edad3f20b30b4d2fff66c1a85.ca=
mel@redhat.com/


