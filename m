Return-Path: <linux-gpio+bounces-9140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51595E950
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C6F91F21730
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 06:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E74684047;
	Mon, 26 Aug 2024 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UpbVYSvP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82862839F4
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 06:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724655332; cv=none; b=ZTYquIkCrOkuoAz0QB8Lo5oweT/nPOpIqrp9nrs2jdA9G00PO77v/cMTS/zOb6wqOd+SFM3SqKVA3UqGwxpFEVmNqrtLo4VPNaI5GrSQ8rDaHVkLn1Ex6l8WeYIJNMRTqHRm1l/K1gfx2mmJrEcv5vQkBKOfBdrmpTAcP90O6qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724655332; c=relaxed/simple;
	bh=QYLmQ33xF9IhHkHlckYjtaDgAb8yn61cdSbD9bi4KjQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HRp7+vE5K58irSIHmIoC4uWUS+l6JJBG4Xa1NyORksdH1RDW6wjfmG7O/p4PMbTc+dP9Add9D0FvQWzXr3qk2UZopkuH/LNJlHiiNIUwokxF4/jC0uHv131pbuhAz0PJlg0kxCpmomk+mPADy1hwsUEE1AOeTeWFp+FevDxdhiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UpbVYSvP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724655329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2z2TGSU/AHVRPl6zHGllpDM2MIUry+mfdVEnD5XzqM=;
	b=UpbVYSvPyT0tafBdOoMnqr4sM0eXYD7K/y9wZkpRfVBQzyBexwxZ6zzZ06Oez+8RnKHOWJ
	aNbVgZ4VhUW5z7J3HCXXddd1oLDUCPsydy/fo8U46NwFIi5GupFjwei1fYgS5ou7CgIbCX
	EMFGoW6LXeFeTLri6Lh2khRPZf3Lfu8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-6eFeba78M0WNshJ45IT_WQ-1; Mon, 26 Aug 2024 02:55:27 -0400
X-MC-Unique: 6eFeba78M0WNshJ45IT_WQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42817980766so37737135e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 25 Aug 2024 23:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724655326; x=1725260126;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O2z2TGSU/AHVRPl6zHGllpDM2MIUry+mfdVEnD5XzqM=;
        b=auvvFTcIfwQoMw4F15IQ2KYMs2e53gbu8K4dAfrPYBkjTXTPCP1zoDorXfA9PKnWGi
         v4PfxDS+hRGEDeH5X6BzwO00tgrZGdh3EOlJPF0iZhB5CKfLJoMi7OR98f9W5c2bqMCv
         cc9FuD6ft1YXS9QpB8aSZkyMy4hsJH9hzpN5qBukY0RwlT2xGne4vFvt+gOau5PJ2xBA
         2eY1osg1b/wwetr4zovpmTUFPw9hyRBh2njP1jt9d8lnmeTNVHCzt5oLYWJy8sevGC+8
         LHsBkl62zh91X7zH3bxZe2VV29ZAS+U4YfaDFLNrfJk9vF1W237zPlu/MtwrqvdzzReB
         PDTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGLNrr/pQOhhCQDhB4Hv9XdVPKbKtCaT6HWnu+wOSvHJy/JbI4S+Y7iCc6FbC2RMWo5J9qM35ibs+K@vger.kernel.org
X-Gm-Message-State: AOJu0YxBWUwMkpjn6Z5CvAATQ+OBE9wXeBy6Q9vgmQkXFiXGq4t4QUDG
	MKy+YkioeYIk4lBLZQkIuWOstzRCBHA/QlShTptO1XXADeJesjyKKrM3+EkCH6tLoL2vAwG+TMD
	uFeeGdzTSxG+gLvD0B/e5hYMcVFC4iv/6+TwjlxHizmQAwWw/jfMAUXkUGlg=
X-Received: by 2002:a05:600c:3b05:b0:428:1d27:f3db with SMTP id 5b1f17b1804b1-42b8925903bmr48419305e9.35.1724655326193;
        Sun, 25 Aug 2024 23:55:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDbFRllMEQMy18KUHdwX+H4HgEvRwxNEXxmAF22JEUYmhjpbjXAt/FXNy3VJHqD5ffhjLW9Q==
X-Received: by 2002:a05:600c:3b05:b0:428:1d27:f3db with SMTP id 5b1f17b1804b1-42b8925903bmr48419155e9.35.1724655325664;
        Sun, 25 Aug 2024 23:55:25 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef81777sm178404725e9.27.2024.08.25.23.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 23:55:25 -0700 (PDT)
Message-ID: <23f1b79be57f1a4d6ce0806fa149d687c2c6d275.camel@redhat.com>
Subject: Re: [PATCH v3 7/9] vdpa: solidrun: Fix UB bug with devres
From: Philipp Stanner <pstanner@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alexandre.torgue@foss.st.com, alvaro.karsz@solid-run.com,
 andy@kernel.org,  axboe@kernel.dk, bhelgaas@google.com, brgl@bgdev.pl,
 broonie@kernel.org,  corbet@lwn.net, davem@davemloft.net,
 dlechner@baylibre.com, dlemoal@kernel.org,  edumazet@google.com,
 eperezma@redhat.com, hao.wu@intel.com, hare@suse.de,  jasowang@redhat.com,
 joabreu@synopsys.com, kch@nvidia.com, kuba@kernel.org, 
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com, 
 mdf@kernel.org, mst@redhat.com, netdev@vger.kernel.org, pabeni@redhat.com, 
 richardcochran@gmail.com, stable@vger.kernel.org, trix@redhat.com, 
 u.kleine-koenig@pengutronix.de, virtualization@lists.linux.dev, 
 xuanzhuo@linux.alibaba.com, yilun.xu@intel.com
Date: Mon, 26 Aug 2024 08:55:22 +0200
In-Reply-To: <81de3898-9af7-4ad1-80ef-68d1f60d4c28@wanadoo.fr>
References: <20240822134744.44919-1-pstanner@redhat.com>
	 <20240822134744.44919-8-pstanner@redhat.com>
	 <81de3898-9af7-4ad1-80ef-68d1f60d4c28@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-08-22 at 16:34 +0200, Christophe JAILLET wrote:
> Le 22/08/2024 =C3=A0 15:47, Philipp Stanner a =C3=A9crit=C2=A0:
> > In psnet_open_pf_bar() and snet_open_vf_bar() a string later passed
> > to
> > pcim_iomap_regions() is placed on the stack. Neither
> > pcim_iomap_regions() nor the functions it calls copy that string.
> >=20
> > Should the string later ever be used, this, consequently, causes
> > undefined behavior since the stack frame will by then have
> > disappeared.
> >=20
> > Fix the bug by allocating the strings on the heap through
> > devm_kasprintf().
> >=20
> > Cc: stable@vger.kernel.org	# v6.3
> > Fixes: 51a8f9d7f587 ("virtio: vdpa: new SolidNET DPU driver.")
> > Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Closes:
> > https://lore.kernel.org/all/74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanado=
o.fr/
> > Suggested-by: Andy Shevchenko <andy@kernel.org>
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0 drivers/vdpa/solidrun/snet_main.c | 13 +++++++++----
> > =C2=A0 1 file changed, 9 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/vdpa/solidrun/snet_main.c
> > b/drivers/vdpa/solidrun/snet_main.c
> > index 99428a04068d..67235f6190ef 100644
> > --- a/drivers/vdpa/solidrun/snet_main.c
> > +++ b/drivers/vdpa/solidrun/snet_main.c
> > @@ -555,7 +555,7 @@ static const struct vdpa_config_ops
> > snet_config_ops =3D {
> > =C2=A0=20
> > =C2=A0 static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet
> > *psnet)
> > =C2=A0 {
> > -	char name[50];
> > +	char *name;
> > =C2=A0=C2=A0	int ret, i, mask =3D 0;
> > =C2=A0=C2=A0	/* We don't know which BAR will be used to communicate..
> > =C2=A0=C2=A0	 * We will map every bar with len > 0.
> > @@ -573,7 +573,10 @@ static int psnet_open_pf_bar(struct pci_dev
> > *pdev, struct psnet *psnet)
> > =C2=A0=C2=A0		return -ENODEV;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	snprintf(name, sizeof(name), "psnet[%s]-bars",
> > pci_name(pdev));
> > +	name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "psnet[%s]-
> > bars", pci_name(pdev));
> > +	if (!name)
> > +		return -ENOMEM;
> > +
> > =C2=A0=C2=A0	ret =3D pcim_iomap_regions(pdev, mask, name);
> > =C2=A0=C2=A0	if (ret) {
> > =C2=A0=C2=A0		SNET_ERR(pdev, "Failed to request and map PCI
> > BARs\n");
> > @@ -590,10 +593,12 @@ static int psnet_open_pf_bar(struct pci_dev
> > *pdev, struct psnet *psnet)
> > =C2=A0=20
> > =C2=A0 static int snet_open_vf_bar(struct pci_dev *pdev, struct snet
> > *snet)
> > =C2=A0 {
> > -	char name[50];
> > +	char *name;
> > =C2=A0=C2=A0	int ret;
> > =C2=A0=20
> > -	snprintf(name, sizeof(name), "snet[%s]-bar",
> > pci_name(pdev));
> > +	name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "psnet[%s]-
> > bars", pci_name(pdev));
>=20
> s/psnet/snet/

sharp eyes ;)

Thx,
P.

>=20
> > +	if (!name)
> > +		return -ENOMEM;
> > =C2=A0=C2=A0	/* Request and map BAR */
> > =C2=A0=C2=A0	ret =3D pcim_iomap_regions(pdev, BIT(snet->psnet-
> > >cfg.vf_bar), name);
> > =C2=A0=C2=A0	if (ret) {
>=20


