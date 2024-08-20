Return-Path: <linux-gpio+bounces-8857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD95958582
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 13:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7630283637
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 11:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD41218E048;
	Tue, 20 Aug 2024 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="afWcm9yw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86418DF80
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724152468; cv=none; b=CpJz1J9zEqoaEzE/mHSfVovUlE4nTx9zjS6BMb5oIw25RWDXckEat4BKfL0saUmdR8kl8RuVEDU2CS8kG2hth3QZ0ri3sAZwBOKDP9b0IBapngh5O4oLLTKIpYYl8p0ZGLKt6L317Pxlnzsd31jGg4fmSJ5g7W6IiJgeRdr5j3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724152468; c=relaxed/simple;
	bh=rGM+Q7dIYBoJCsuGamvXSRRNj+I6b8oz5K4/Bniwl6c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P4hyI/M1Kh4q+yXmkuii482jkPNUAbRRa3IGkdL+WPp/M85mwXf1nZEn5WHYWSE4uLSaxjOEt/rhGWQdJO/XQ0818P5nqbelAUT+FtatFUrsNaDxMh03Qxx3Ol7vdVCwCCWM+tMOpad3LpiVGY0u1Ga5ct7Nv8jHpeC/pZQDBD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=afWcm9yw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724152465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1Q7acyOuQZwg2/89j6b8m+Ec7sRWq6gAjTgotRXIu4=;
	b=afWcm9ywV0wrmLJReG2xDjaRLOYh2B87cZHN8Evxj3I6SQDvo7C8z9mTQ+F6xkiE4Hhr46
	kONikQAUcJCSA9CCzzvHmI/OJ5JBHeyDwP86BRrrlGOF1LJb3H8JNUJlbl9hmrmutU1RZq
	hkm2reOvPp+Cz3/Jk82JpP4iQ2luKJ4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-VObrbAFaOjqKA6S3Gv7aVg-1; Tue, 20 Aug 2024 07:14:24 -0400
X-MC-Unique: VObrbAFaOjqKA6S3Gv7aVg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-532c1b6ea8dso564884e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 04:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724152463; x=1724757263;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y1Q7acyOuQZwg2/89j6b8m+Ec7sRWq6gAjTgotRXIu4=;
        b=tojWO2GSSpB8yPTI/UVLYGuJL5c9UcJ4A6B+/uHwbqSBg6gxif7sneQkEwTTOK2I1K
         SUhsYBn5tJbLqMLNpRTmQTJSvPYl2dMwll6qWa918eDj+kjxZxYGsvxBu/WjagtV3+fG
         IcqEMha8WM2NbfklSi0KYkdwZ9tC77ZK6Jp1LXsph5ivfBN+HC6ZMM0IkFlWwg53Qmdm
         sgPCvxJ/Rk6f69JaBNhDWIoW/oGojYfrxrrsDDXtLvv/lQsnp6+ZX+0mUodBfKPNK4PD
         8y8AsXfW2TGBF4opwdSObMrjMMpEgXJePWViTn+0tCR+RS1lJxy9buzrIvMrTzU8wZL9
         HdUA==
X-Forwarded-Encrypted: i=1; AJvYcCVPHR+6P+2/ZiedjC51gT1dX45DrMsUzLy3Ho0xVyp+dW4ym4YuKlHHfHgWzQQf9KKPPHG6hqHOHvSD/RxEzTAf7Y3VSUlnqoC/UA==
X-Gm-Message-State: AOJu0Yx+oiuKGHRE7haSRZCzQLCbAIwSL2jPPiRVZI8wdSRM8ltYqXLY
	9wHOaxSo0ZoJS30VDScwgb22SlCmI/9T7ZOGOF2SEOXuCxZSv1yHvcejgFrxTUk0b50NySr+AaE
	4zUj12nz8r2m7sA4OvJI5z4UmJxXTaKmxYqm727KMrrqIlk9kOidXmr4tGog=
X-Received: by 2002:a05:6512:3c84:b0:530:baec:3975 with SMTP id 2adb3069b0e04-5331c6904bamr5596053e87.1.1724152463002;
        Tue, 20 Aug 2024 04:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYdlvki0skRqSH7C03GeJxZqEQK+y/koEXnizdbc6P1v4DyVRhp4tYp6FmBEQj38Z0lN9WKg==
X-Received: by 2002:a05:6512:3c84:b0:530:baec:3975 with SMTP id 2adb3069b0e04-5331c6904bamr5596024e87.1.1724152462340;
        Tue, 20 Aug 2024 04:14:22 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383935657sm747366866b.138.2024.08.20.04.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 04:14:22 -0700 (PDT)
Message-ID: <01b1e7d505a2b3e670f1613ce3e6a60efd3449ab.camel@redhat.com>
Subject: Re: [PATCH 8/9] vdap: solidrun: Replace deprecated PCI functions
From: Philipp Stanner <pstanner@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alexandre.torgue@foss.st.com, alvaro.karsz@solid-run.com,
 andy@kernel.org,  axboe@kernel.dk, bhelgaas@google.com, brgl@bgdev.pl,
 broonie@kernel.org,  corbet@lwn.net, davem@davemloft.net,
 edumazet@google.com, eperezma@redhat.com,  hao.wu@intel.com,
 jasowang@redhat.com, joabreu@synopsys.com, kuba@kernel.org, 
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com, 
 mdf@kernel.org, mst@redhat.com, netdev@vger.kernel.org, pabeni@redhat.com, 
 richardcochran@gmail.com, trix@redhat.com, virtualization@lists.linux.dev, 
 xuanzhuo@linux.alibaba.com, yilun.xu@intel.com
Date: Tue, 20 Aug 2024 13:14:20 +0200
In-Reply-To: <d35a962d-dc95-4469-867e-95b704cca474@wanadoo.fr>
References: <20240819165148.58201-2-pstanner@redhat.com>
	 <20240819165148.58201-10-pstanner@redhat.com>
	 <74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr>
	 <3e4288bb7300f3fd0883ff07b75ae69d0532019b.camel@redhat.com>
	 <d35a962d-dc95-4469-867e-95b704cca474@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-08-20 at 12:50 +0200, Christophe JAILLET wrote:
> Le 20/08/2024 =C3=A0 10:09, Philipp Stanner a =C3=A9crit=C2=A0:
> > > > @@ -556,33 +556,24 @@ static const struct vdpa_config_ops
> > > > snet_config_ops =3D {
> > > > =C2=A0=C2=A0 static int psnet_open_pf_bar(struct pci_dev *pdev, str=
uct
> > > > psnet
> > > > *psnet)
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0	char name[50];
> > > > -	int ret, i, mask =3D 0;
> > > > +	int i;
> > > > +
> > > > +	snprintf(name, sizeof(name), "psnet[%s]-bars",
> > > > pci_name(pdev));
> > > > +
> > > > =C2=A0=C2=A0=C2=A0	/* We don't know which BAR will be used to
> > > > communicate..
> > > > =C2=A0=C2=A0=C2=A0	 * We will map every bar with len > 0.
> > > > =C2=A0=C2=A0=C2=A0	 *
> > > > =C2=A0=C2=A0=C2=A0	 * Later, we will discover the BAR and unmap all=
 other
> > > > BARs.
> > > > =C2=A0=C2=A0=C2=A0	 */
> > > > =C2=A0=C2=A0=C2=A0	for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> > > > -		if (pci_resource_len(pdev, i))
> > > > -			mask |=3D (1 << i);
> > > > -	}
> > > > -
> > > > -	/* No BAR can be used.. */
> > > > -	if (!mask) {
> > > > -		SNET_ERR(pdev, "Failed to find a PCI BAR\n");
> > > > -		return -ENODEV;
> > > > -	}
> > > > -
> > > > -	snprintf(name, sizeof(name), "psnet[%s]-bars",
> > > > pci_name(pdev));
> > > > -	ret =3D pcim_iomap_regions(pdev, mask, name);
> > > > -	if (ret) {
> > > > -		SNET_ERR(pdev, "Failed to request and map PCI
> > > > BARs\n");
> > > > -		return ret;
> > > > -	}
> > > > +		if (pci_resource_len(pdev, i)) {
> > > > +			psnet->bars[i] =3D
> > > > pcim_iomap_region(pdev,
> > > > i, name);
> > >=20
> > > Hi,
> > >=20
> > > Unrelated to the patch, but is is safe to have 'name' be on the
> > > stack?
> > >=20
> > > pcim_iomap_region()
> > > --> __pcim_request_region()
> > > --> __pcim_request_region_range()
> > > --> request_region() or __request_mem_region()
> > > --> __request_region()
> > > --> __request_region_locked()
> > > --> res->name =3D name;
> > >=20
> > > So an address on the stack ends in the 'name' field of a "struct
> > > resource".
> >=20
> > Oh oh...
> >=20
> > >=20
> > > According to a few grep, it looks really unusual.
> > >=20
> > > I don't know if it is used, but it looks strange to me.
> >=20
> >=20
> > I have seen it used in the kernel ringbuffer log when you try to
> > request something that's already owned. I think it's here, right in
> > __request_region_locked():
> >=20
> > /*
> > =C2=A0 * mm/hmm.c reserves physical addresses which then
> > =C2=A0 * become unavailable to other users.=C2=A0 Conflicts are
> > =C2=A0 * not expected.=C2=A0 Warn to aid debugging if encountered.
> > =C2=A0 */
> > if (conflict->desc =3D=3D IORES_DESC_DEVICE_PRIVATE_MEMORY) {
> > 	pr_warn("Unaddressable device %s %pR conflicts with %pR",
> > 		conflict->name, conflict, res);
> > }
> >=20
> >=20
> > Assuming I interpret the code correctly:
> > The conflicting resource is found when a new caller (e.g. another
> > driver) tries to get the same region. So conflict->name on the
> > original
> > requester's stack is by now gone and you do get UB.
> >=20
> > Very unlikely UB, since only rarely drivers race for the same
> > resource,
> > but still UB.
> >=20
> > But there's also a few other places. Grep for "conflict->name".
> >=20
> > >=20
> > >=20
> > > If it is an issue, it was apparently already there before this
> > > patch.
> >=20
> > I think this has to be fixed.
> >=20
> > Question would just be whether one wants to fix it locally in this
> > driver, or prevent it from happening globally by making the common
> > infrastructure copy the string.
> >=20
> >=20
> > P.
> >=20
>=20
> Not a perfect script, but the below coccinelle script only find this=20
> place, so I would +1 only fixing things here only.
>=20
> Agree?

Yup, sounds good. Copying the string would cause trouble (GFP flags)
anyways.

I'll provide a fix in v2.

Thanks,
P.

>=20
> CJ
>=20
>=20
>=20
> @@
> identifier name;
> expression x;
> constant N;
> @@
> 	char name[N];
> 	...
> (
> *	pcim_iomap_region(..., name, ...);
> >=20
> *	pcim_iomap_regions(..., name, ...);
> >=20
> *	request_region(..., name, ...);
> >=20
> *	x =3D pcim_iomap_region(..., name, ...);
> >=20
> *	x =3D pcim_iomap_regions(..., name, ...);
> >=20
> *	x =3D request_region(..., name, ...);
> )
>=20
>=20


