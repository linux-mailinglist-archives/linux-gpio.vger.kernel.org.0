Return-Path: <linux-gpio+bounces-9178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7821795F598
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 17:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FB291C218F4
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 15:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59427194A4F;
	Mon, 26 Aug 2024 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RBz80yny"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724915B69E
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724687530; cv=none; b=FRWh0v9ycA/UPsUfJkj/QQdY43Sm8dZWlkhKEQ8sAGnMs5+SjCyWx/2aPVvHdGGFN8eJFXy9ap4GKRe+8mvyV1U+IKDX9P4XDZ3NbF57uag9EaMnli8+N5Wvj4RrgNPeerT3H2hA3Wy/ERzR7xVGt81gdxhO/jtUe3MMLcvDGRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724687530; c=relaxed/simple;
	bh=Dwazc+e0kXeS2xTQ712+0BIKFANt7k7hBlcLvCAFWPU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ESapu+R4dGGBUknq9F/Mg2hamJfkS5ILiuiGgzxuDRtLlFm5gCCVKRH1gsYnVAUtthLgjrgIVTHVnza7iIxJ7wL7O2DWsEbbY+5uxZe1f1vQf3CUf38FAGik0ANr7j1NGk+v7BqQoM+bpdggLhK5UUdvPjDVv4f1ISNlgwZk3JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RBz80yny; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724687527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dwazc+e0kXeS2xTQ712+0BIKFANt7k7hBlcLvCAFWPU=;
	b=RBz80ynyED2PrGlQP9fKNdk2BsY4HTkWCsZUDfjZSm4MqweOCc/QdXfH5GkUwiRYWkohpN
	NJrSJnUu4QnMNz5+tOp/+Gq1LdZoPmUH8kzX3qPtQCluFqDRg7gnqixS5yMcnbVDi1xY+/
	Z2m1kVwoJ7MjxHL6GvpyZofVOe83KcI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-iDtDH555OoymRmkIfUPPhQ-1; Mon, 26 Aug 2024 11:52:05 -0400
X-MC-Unique: iDtDH555OoymRmkIfUPPhQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-429c224d9edso42888235e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 08:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724687524; x=1725292324;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dwazc+e0kXeS2xTQ712+0BIKFANt7k7hBlcLvCAFWPU=;
        b=NLpj1Zl/hmhC5vh/8so2L86IjagIKY9/E1gJ/PjM2m/nUblgkq20cfNmZOv1pLFZQS
         BCM/KF4EzVL87bZJpyNrKTUc1dYIHjjq/8ciVmjJJOvo4PZxs5Bj2nWxZQBwXQ1YQnGD
         fRaFlC7RXGw+eowNun+Qig6l3gCToMOqoIYZMlk2VHw34EX1T7eZacJJlQS1oxH4DdmT
         hq1hTuCZgH5H6qa+hKlqiYOR1R92924BtogtqGPks/60bFLSkIhW2ZtRMRHS5wx5WElB
         HnL2T8jwqsrx+wi4p348SwynwkhthGPcEfk9yGZsdkjNN+mWx9IG+BMmfDgxQ5xAp3QA
         wEbw==
X-Forwarded-Encrypted: i=1; AJvYcCUOUyVtj6I3GUTUXHK6xf9Z4Zq4vc6sxzchazcgdJ28vnCGGUyLC2X1lC/TMLYey4fxKLKxmUKMJ92f@vger.kernel.org
X-Gm-Message-State: AOJu0YxtYZ8FXx2ZpV2wnwdJWWSk5UXSVyhcvSdybDMJIh7WOibuRoWB
	GjV8zNTJeKxMIf/Ij5h5QzNoSEbqo6M7SgRfqjj8vlAQ7fhvZO8bqqmykPbwInkCt9xEBkRm/yY
	16jfACg5mF1i++ZDysiO9NyQ73cLeNvQotUdOqKD6WIq5lfR997chDIngAdY=
X-Received: by 2002:adf:e44b:0:b0:360:7c4b:58c3 with SMTP id ffacd0b85a97d-3748c835e08mr49219f8f.54.1724687524282;
        Mon, 26 Aug 2024 08:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxAzHOXHhnfnYaxqHhgL/uz7vF7Nw5k64KjkexckDk+9QWCj+MHZcvnBNc7cGqudRMU7r7fA==
X-Received: by 2002:adf:e44b:0:b0:360:7c4b:58c3 with SMTP id ffacd0b85a97d-3748c835e08mr49174f8f.54.1724687523730;
        Mon, 26 Aug 2024 08:52:03 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730814602asm11021638f8f.44.2024.08.26.08.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 08:52:02 -0700 (PDT)
Message-ID: <f2d6345a8a684f62035108d74938ec0b2e162019.camel@redhat.com>
Subject: Re: [PATCH v3 5/9] ethernet: cavium: Replace deprecated PCI
 functions
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Jens Axboe <axboe@kernel.dk>, Wu Hao <hao.wu@intel.com>, Tom Rix
 <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>, Xu Yilun
 <yilun.xu@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
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
Date: Mon, 26 Aug 2024 17:52:00 +0200
In-Reply-To: <CAHp75VfKS_PWer2hEH8x0qgBUEPx05p8BA=c0UirAWjg0SaLeA@mail.gmail.com>
References: <20240822134744.44919-1-pstanner@redhat.com>
	 <20240822134744.44919-6-pstanner@redhat.com>
	 <ZsdO2q8uD829hP-X@smile.fi.intel.com>
	 <ad6af1c4194873e803df65dc4d595f8e4b26cb33.camel@redhat.com>
	 <CAHp75VfKS_PWer2hEH8x0qgBUEPx05p8BA=c0UirAWjg0SaLeA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-08-26 at 18:41 +0300, Andy Shevchenko wrote:
> On Mon, Aug 26, 2024 at 5:51=E2=80=AFPM Philipp Stanner <pstanner@redhat.=
com>
> wrote:
> > On Thu, 2024-08-22 at 17:44 +0300, Andy Shevchenko wrote:
> > > On Thu, Aug 22, 2024 at 03:47:37PM +0200, Philipp Stanner wrote:
>=20
> ...
>=20
> > > > -=C2=A0=C2=A0 err =3D pcim_iomap_regions(pdev, 1 << PCI_PTP_BAR_NO,
> > > > pci_name(pdev));
> > > > -=C2=A0=C2=A0 if (err)
> > > > +=C2=A0=C2=A0 clock->reg_base =3D pcim_iomap_region(pdev, PCI_PTP_B=
AR_NO,
> > > > pci_name(pdev));
> > > > +=C2=A0=C2=A0 if (IS_ERR(clock->reg_base)) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =
=3D PTR_ERR(clock->reg_base);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
goto error_free;
> > > > -
> > > > -=C2=A0=C2=A0 clock->reg_base =3D pcim_iomap_table(pdev)[PCI_PTP_BA=
R_NO];
> > > > +=C2=A0=C2=A0 }
> > >=20
> > > Perhaps
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock->reg_base =3D pcim_iomap_region(=
pdev, PCI_PTP_BAR_NO,
> > > pci_name(pdev));
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D PTR_ERR_OR_ZERO(clock->reg_bas=
e);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 goto error_free;
> > >=20
> > > This will make your patch smaller and neater.
> > >=20
> > > P.S. Do you use --histogram diff algo when preparing patches?
> >=20
> > So far not.
> > Should one do that?
>=20
> Id doesn't alter your code, it's in addition to what I suggested, but
> as Linus shared that there is no reason to avoid using --histogram
> not
> only in Linux kernel, but in general as it produces more
> human-readable diff:s.

If the Boss says so, one can surely do that \o/

Though if it has 0 disadvantages I'd propose proposing to the git-devs
to make it the default.


P.

>=20


