Return-Path: <linux-gpio+bounces-9139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A267895E8F6
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 292C61F22B01
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 06:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E2C13D29A;
	Mon, 26 Aug 2024 06:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h6nEhi2V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C28126F0A
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 06:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724653856; cv=none; b=B4et5v+yJnVwhS8ejok6oI/WIwjl6JgwkS1Pz0A1pvks8OU7e+WGY/KTkLgQRl7nZxnFUQC5IpRcd4e7jM18f2yVJntvsIgTdTyLJPrfsL4pPmDCuJy/BUg3LFT3Oi6JV1PPlFHSl5QIWrwms8bbkMH0Uq6C/K4Xn5qrI8jzIWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724653856; c=relaxed/simple;
	bh=h5ZFt0JePyZg+K4l+Qy3R/qbSbgG77yDQBvoSy7r1Rk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FKR6eVqkUMjpMjrlboUbC/D671HR0bx9EPszZXCgsCgDAsFX2Hy8VxM8CQQ9croRb/okOe+Q5iieYsz/iq8hDBuTjIqP8nEjzFiByPIpF6r7h2tcDHImZlUdCBqy9wSgbCcTHZrrFWQrCasr6j0W13KOoj2G0G1/vTs9eQqGXCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h6nEhi2V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJFTNQ6Wct6NFpa/rz2wXYP7UMNXrnzBHL4pGlquRbc=;
	b=h6nEhi2V8XtR3k301i9W9zhaYCClTSA+B+i1idXbwAm7CZ2bn+uF0zdHV/BSGMtewN+4XQ
	+bQa+ia9phd9EJZH5kkESO7hlSeHE569U+3aR0aLx6iGDYhUziXAZ+4EUxRzDagWMfQRNP
	BZWOVZkBNmjrBd5wwvKutV5ZAeZkksw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-Aw7PsO19NQGBPuCW7wWaxQ-1; Mon, 26 Aug 2024 02:30:31 -0400
X-MC-Unique: Aw7PsO19NQGBPuCW7wWaxQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6bf7bb58632so49211196d6.2
        for <linux-gpio@vger.kernel.org>; Sun, 25 Aug 2024 23:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653831; x=1725258631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJFTNQ6Wct6NFpa/rz2wXYP7UMNXrnzBHL4pGlquRbc=;
        b=vJhKyBj9nKBX8S4gVr+x2s/K8GhQO8cN9ZhXZXYmMYgx25GGzfIjz2fwSdEtThZvk7
         kxhQxmHyEM0AqVpNQzZ/DokMVVrrSKQI4aOpGdcjaPsbyMOmLOUZZCR1+SUt1JhDMEYo
         zW/sBtRbuWiqOSn5gUhX9aX0qwJISKG5tgZWC7TPYUUV3PT+ucHKkitbTaLImnYEdGuV
         iQ8PqmfKQrtE9GPMx1T/HgOaYf59nU7JtLjp7Y7r3BSouVgnwNZXEU6R+ue0u0qw8Fzh
         m8+WWnQZXjtFaNrj+hRJn7k+mcHvPk4jJorDEF6gPxXhGcJEYn+OTIrbAdLf9ySPbnhK
         K7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVr1PXumaIVPN6K7T/5flCo8qCz0TyeKnXbT1pjgSyLeZ2YX6iL8MyKkYQSj2CQN3QCsxjJAaYrTm3E@vger.kernel.org
X-Gm-Message-State: AOJu0YxJnjACzUHgqqTPpU9jxZ3wpQ9M6M0FDGg26OkN6sPnksLlQ+tU
	e0t/HsXKJ9oOi3OknEYPumJUAJjL/K1+i0WQEqaIQEYXsAL3R+Ilyz0OXLFwa/zb/BdRa+HHyyl
	iDdIhynwE3l54bGyQ5RWfZ3y9tTp8lXfGmhVhecaLCh1lQXfi/wDndWIwYU0=
X-Received: by 2002:a05:6214:3a87:b0:6c1:6b38:2fa4 with SMTP id 6a1803df08f44-6c16dc7ae95mr108606196d6.24.1724653831051;
        Sun, 25 Aug 2024 23:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjcrM+de6Fn6cHOIaSi480as1GF3hlSLum1vFYi4hcws7Awk5SxCY7Nx45ugpgCSJ72TftWg==
X-Received: by 2002:a05:6214:3a87:b0:6c1:6b38:2fa4 with SMTP id 6a1803df08f44-6c16dc7ae95mr108605926d6.24.1724653830595;
        Sun, 25 Aug 2024 23:30:30 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162db0685sm43302446d6.101.2024.08.25.23.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 23:30:30 -0700 (PDT)
Message-ID: <6e93c43e6e513559f0306085211245578c2c9d3f.camel@redhat.com>
Subject: Re: [PATCH v3 6/9] ethernet: stmicro: Simplify PCI devres usage
From: Philipp Stanner <pstanner@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, Wu Hao
 <hao.wu@intel.com>, Tom Rix <trix@redhat.com>, Moritz Fischer
 <mdf@kernel.org>,  Xu Yilun <yilun.xu@intel.com>, Andy Shevchenko
 <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Alvaro
 Karsz <alvaro.karsz@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>, Richard Cochran
 <richardcochran@gmail.com>, Mark Brown <broonie@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Damien Le Moal <dlemoal@kernel.org>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>,
 linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org,  linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-pci@vger.kernel.org,
 virtualization@lists.linux.dev
Date: Mon, 26 Aug 2024 08:30:23 +0200
In-Reply-To: <6q4pcpyqqt6mhj422pfkgggvwu7jhweu5446y6prcjgjql6xeq@jztt7z4fr6rg>
References: <20240822134744.44919-1-pstanner@redhat.com>
	 <20240822134744.44919-7-pstanner@redhat.com>
	 <6q4pcpyqqt6mhj422pfkgggvwu7jhweu5446y6prcjgjql6xeq@jztt7z4fr6rg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-08-23 at 12:29 +0300, Serge Semin wrote:
> Hi Philipp
>=20
> On Thu, Aug 22, 2024 at 03:47:38PM +0200, Philipp Stanner wrote:
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
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>=20
> Thanks for the series. But please note the network subsystem
> dev-process requires to submit the cleanup/feature changes on top of
> the net-next tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/

That seems a policy I haven't seen so far; usually the assumption is
that you branch out from Linus's master.

Anyways, I of course am going to help with setting up something
mergeable

>=20
> Just recently a Yanteng' (+cc) series
> https://lore.kernel.org/netdev/cover.1723014611.git.siyanteng@loongson.cn=
/
> was merged in which significantly refactored the Loongson MAC driver.
> Seeing your patch isn't based on these changes, there is a high
> probability that the patch won't get cleanly applied onto the
> net-next tree. So please either rebase your patch onto the net-next
> tree, or at least merge in the Yanteng' series in your tree and
> rebase the patch onto it and let's hope there have been no other
> conflicting patches merged in into the net-next tree.

I'll take a look into that, thx


P.

>=20
> -Serge(y)
>=20
>=20
> > ---
> > =C2=A0.../ethernet/stmicro/stmmac/dwmac-loongson.c=C2=A0 | 25 +++++----=
------
> > ----
> > =C2=A0.../net/ethernet/stmicro/stmmac/stmmac_pci.c=C2=A0 | 18 +++++----=
----
> > =C2=A02 files changed, 12 insertions(+), 31 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > index 9e40c28d453a..5d42a9fad672 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > @@ -50,7 +50,7 @@ static int loongson_dwmac_probe(struct pci_dev
> > *pdev, const struct pci_device_id
> > =C2=A0	struct plat_stmmacenet_data *plat;
> > =C2=A0	struct stmmac_resources res;
> > =C2=A0	struct device_node *np;
> > -	int ret, i, phy_mode;
> > +	int ret, phy_mode;
> > =C2=A0
> > =C2=A0	np =3D dev_of_node(&pdev->dev);
> > =C2=A0
> > @@ -88,14 +88,11 @@ static int loongson_dwmac_probe(struct pci_dev
> > *pdev, const struct pci_device_id
> > =C2=A0		goto err_put_node;
> > =C2=A0	}
> > =C2=A0
> > -	/* Get the base address of device */
> > -	for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> > -		if (pci_resource_len(pdev, i) =3D=3D 0)
> > -			continue;
> > -		ret =3D pcim_iomap_regions(pdev, BIT(0),
> > pci_name(pdev));
> > -		if (ret)
> > -			goto err_disable_device;
> > -		break;
> > +	memset(&res, 0, sizeof(res));
> > +	res.addr =3D pcim_iomap_region(pdev, 0, pci_name(pdev));
> > +	if (IS_ERR(res.addr)) {
> > +		ret =3D PTR_ERR(res.addr);
> > +		goto err_disable_device;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	plat->bus_id =3D of_alias_get_id(np, "ethernet");
> > @@ -116,8 +113,6 @@ static int loongson_dwmac_probe(struct pci_dev
> > *pdev, const struct pci_device_id
> > =C2=A0
> > =C2=A0	loongson_default_data(plat);
> > =C2=A0	pci_enable_msi(pdev);
> > -	memset(&res, 0, sizeof(res));
> > -	res.addr =3D pcim_iomap_table(pdev)[0];
> > =C2=A0
> > =C2=A0	res.irq =3D of_irq_get_byname(np, "macirq");
> > =C2=A0	if (res.irq < 0) {
> > @@ -158,18 +153,10 @@ static void loongson_dwmac_remove(struct
> > pci_dev *pdev)
> > =C2=A0{
> > =C2=A0	struct net_device *ndev =3D dev_get_drvdata(&pdev->dev);
> > =C2=A0	struct stmmac_priv *priv =3D netdev_priv(ndev);
> > -	int i;
> > =C2=A0
> > =C2=A0	of_node_put(priv->plat->mdio_node);
> > =C2=A0	stmmac_dvr_remove(&pdev->dev);
> > =C2=A0
> > -	for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> > -		if (pci_resource_len(pdev, i) =3D=3D 0)
> > -			continue;
> > -		pcim_iounmap_regions(pdev, BIT(i));
> > -		break;
> > -	}
> > -
> > =C2=A0	pci_disable_msi(pdev);
> > =C2=A0	pci_disable_device(pdev);
> > =C2=A0}
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> > index 352b01678c22..f89a8a54c4e8 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> > @@ -188,11 +188,11 @@ static int stmmac_pci_probe(struct pci_dev
> > *pdev,
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > -	/* Get the base address of device */
> > +	/* Request the base address BAR of device */
> > =C2=A0	for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> > =C2=A0		if (pci_resource_len(pdev, i) =3D=3D 0)
> > =C2=A0			continue;
> > -		ret =3D pcim_iomap_regions(pdev, BIT(i),
> > pci_name(pdev));
> > +		ret =3D pcim_request_region(pdev, i,
> > pci_name(pdev));
> > =C2=A0		if (ret)
> > =C2=A0			return ret;
> > =C2=A0		break;
> > @@ -205,7 +205,10 @@ static int stmmac_pci_probe(struct pci_dev
> > *pdev,
> > =C2=A0		return ret;
> > =C2=A0
> > =C2=A0	memset(&res, 0, sizeof(res));
> > -	res.addr =3D pcim_iomap_table(pdev)[i];
> > +	/* Get the base address of device */
> > +	res.addr =3D pcim_iomap(pdev, i, 0);
> > +	if (!res.addr)
> > +		return -ENOMEM;
> > =C2=A0	res.wol_irq =3D pdev->irq;
> > =C2=A0	res.irq =3D pdev->irq;
> > =C2=A0
> > @@ -231,16 +234,7 @@ static int stmmac_pci_probe(struct pci_dev
> > *pdev,
> > =C2=A0 */
> > =C2=A0static void stmmac_pci_remove(struct pci_dev *pdev)
> > =C2=A0{
> > -	int i;
> > -
> > =C2=A0	stmmac_dvr_remove(&pdev->dev);
> > -
> > -	for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> > -		if (pci_resource_len(pdev, i) =3D=3D 0)
> > -			continue;
> > -		pcim_iounmap_regions(pdev, BIT(i));
> > -		break;
> > -	}
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int __maybe_unused stmmac_pci_suspend(struct device *dev)
> > --=20
> > 2.46.0
> >=20
> >=20
>=20


