Return-Path: <linux-gpio+bounces-9238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D2196179E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 21:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC0531C23745
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 19:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DB51D3192;
	Tue, 27 Aug 2024 19:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SN+IH5xO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC901D27B1
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 19:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724785320; cv=none; b=lv2BeaTQ9KrP5Gpdy9drPjTub0dr/vp8gXjsbtup678qcFAHltQ5QWnnNLVnmCWIaWiPM24M3SHK8vvu/PnYHSi1DaIdfWhFxLXzQ33z354E4N5zY9XY/2xPHW0h7z+oCASuHg9WU7rFO/CHZw3O12YYJf4Yh0D74Qs5nNaRgBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724785320; c=relaxed/simple;
	bh=MG+1JwSVWzI4JEBvm3KwyK2QGGWa4BG6fPSkkFcFZ9c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MeV4M52MKDCY0Ckk37MqueG1PBlQgegaN59T9O+uBLinr7pEX3wtLU5SWR+CeiEyKBKHb8NLeV8/cXYppAfJWe+zQtyj5OV4AiXjetjVvxelXQDHZjahEqmMCvBCG43ApxRR/GGcuvsB8yunR2zRqTk8mafTHqsBEkNE94VxZpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SN+IH5xO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724785318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MG+1JwSVWzI4JEBvm3KwyK2QGGWa4BG6fPSkkFcFZ9c=;
	b=SN+IH5xOfPBWISB5HQ7XqSh6TpHl0ySt/ElKDKYNAhSY+DLzQu+3zirVpQ8I4ISI6V3tIf
	1rcbh2r9CMC9j59+XMnpjwm/Ou4q+WRV4kZCs6wVIA6MYGaX8AIKS123BYdRtxXkow9bch
	CBs/FBv3erfcKDyernljJqYfqvp2XUI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-irJ0yMQeNQqaWIN7BToaSA-1; Tue, 27 Aug 2024 15:01:56 -0400
X-MC-Unique: irJ0yMQeNQqaWIN7BToaSA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8698664af8so766633366b.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 12:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724785315; x=1725390115;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MG+1JwSVWzI4JEBvm3KwyK2QGGWa4BG6fPSkkFcFZ9c=;
        b=WjfWm9H3ljg/aFYUxhJMdpTWYgbfVF7Tpe/RHEhOrWMDIpFk7pQFSd3G3HUTfzZmEM
         Gt6U7tiXLOjsoghGUAbBAkcARSd4AaBP+RatYLav/EzUJ84AWEusEPqW2kjko3Eg6fWw
         lE0TnWjKmLtyEmT4VZgZlebgBuZf+ncFeQpWl20g52Ojf5KhFtiLEEExsfIXW2vZxGXK
         9MhEYjVnY3c2AvJI85RycIiERuVbn4rqbmlnHGFoVmSN501MH2hShvyyxshxdfT6hcMK
         lK+SlKEaZIszVWYAk+pn5JZpLbDx6090r0CY2PxslApbK9GT9LYPhyEvIYbAf7+cGDoB
         jZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZJ7C+34lBB+QQ2ObP2qxHCl9wOJkg2oOhe9EZYpvhQ4Mte8vONLfCEuLqUr6QDNFWHB0IX6pLzD5X@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFTXE4sKs8Ip/SfV2kSOk8spNM/3NfFNm1bSeZ1vcRI2CK3TT
	exi5zMgK/fbLR11xXUUtw7NVJQvPMa0vIEASrCcGtetcP3aVuQkWCFiVtmOfNcXf8I2g0oDR678
	3MXm1a54sJRUuiVnf5FlcuCq6b4N4+8zd4Iw2EoC4HBaiXAKGcOxhRP6Vz+g=
X-Received: by 2002:a17:906:c141:b0:a72:66d5:892c with SMTP id a640c23a62f3a-a87070ec53fmr13248666b.18.1724785314753;
        Tue, 27 Aug 2024 12:01:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu6wGbiomauwZEYTCN/vBiJQQuMuuwKpc/s7DQcNYQx3NMc5fWjOy1EYaWCWHMYlMXPLBPhA==
X-Received: by 2002:a17:906:c141:b0:a72:66d5:892c with SMTP id a640c23a62f3a-a87070ec53fmr13243566b.18.1724785314196;
        Tue, 27 Aug 2024 12:01:54 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3dbc:3c00:460c:db7e:8195:ddb5? ([2001:16b8:3dbc:3c00:460c:db7e:8195:ddb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e594eb1csm142585366b.212.2024.08.27.12.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 12:01:53 -0700 (PDT)
Message-ID: <a00ede68e809a5bd2fea5b7174536b3d4d44b949.camel@redhat.com>
Subject: Re: [PATCH v4 0/7] PCI: Remove pcim_iounmap_regions()
From: Philipp Stanner <pstanner@redhat.com>
To: ens Axboe <axboe@kernel.dk>, Wu Hao <hao.wu@intel.com>, Moritz Fischer
 <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Andy Shevchenko
 <andy@kernel.org>,  Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Alvaro
 Karsz <alvaro.karsz@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>, Richard Cochran
 <richardcochran@gmail.com>, Damien Le Moal <dlemoal@kernel.org>, Hannes
 Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org,  linux-pci@vger.kernel.org,
 virtualization@lists.linux.dev
Date: Tue, 27 Aug 2024 21:01:52 +0200
In-Reply-To: <20240827185616.45094-1-pstanner@redhat.com>
References: <20240827185616.45094-1-pstanner@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PS:
This series's title should now obviously be "*Mostly* Remove
pcim_iounmap_regions()".

On Tue, 2024-08-27 at 20:56 +0200, Philipp Stanner wrote:
> OK, so unfortunately it seems very challenging to reconcile the merge
> conflict pointed up by Serge between net-next and pci-devres
> regarding
> "ethernet: stmicro": A patch that applies to the net-next tree does
> not
> apply anymore to pci-devres (and vice versa).
>=20
> So I actually think that it would be best if we just drop the
> portation
> of "ethernet: stmicro" for now and port it as the last user in v6.13.
>=20
> That should then be trivial.
>=20
> Changes in v4:
> =C2=A0 - Drop the "ethernet: stmicro: [...] patch since it doesn't apply
> to
> =C2=A0=C2=A0=C2=A0 net-next, and making it apply to that prevents it from=
 being
> =C2=A0=C2=A0=C2=A0 applyable to PCI ._. (Serge, me)
> =C2=A0 - Instead, deprecate pcim_iounmap_regions() and keep "ethernet:
> =C2=A0=C2=A0=C2=A0 stimicro" as the last user for now. Perform the deprec=
ation in
> the
> =C2=A0=C2=A0=C2=A0 series' first patch. Remove the Reviewed-by's givin so=
 far to
> that
> =C2=A0=C2=A0=C2=A0 patch.
> =C2=A0 - ethernet: cavium: Use PTR_ERR_OR_ZERO(). (Andy)
> =C2=A0 - vdpa: solidrun (Bugfix) Correct wrong printf string (was "psnet"
> instead of
> =C2=A0=C2=A0=C2=A0 "snet"). (Christophe)
> =C2=A0 - vdpa: solidrun (Bugfix): Add missing blank line. (Andy)
> =C2=A0 - vdpa: solidrun (Portation): Use PTR_ERR_OR_ZERO(). (Andy)
> =C2=A0 - Apply Reviewed-by's from Andy and Xu Yilun.
>=20
> Changes in v3:
> =C2=A0 - fpga/dfl-pci.c: remove now surplus wrapper around
> =C2=A0=C2=A0=C2=A0 pcim_iomap_region(). (Andy)
> =C2=A0 - block: mtip32xx: remove now surplus label. (Andy)
> =C2=A0 - vdpa: solidrun: Bugfix: Include forgotten place where stack UB
> =C2=A0=C2=A0=C2=A0 occurs. (Andy, Christophe)
> =C2=A0 - Some minor wording improvements in commit messages. (Me)
>=20
> Changes in v2:
> =C2=A0 - Add a fix for the UB stack usage bug in vdap/solidrun. Separate
> =C2=A0=C2=A0=C2=A0 patch, put stable kernel on CC. (Christophe, Andy).
> =C2=A0 - Drop unnecessary pcim_release_region() in mtip32xx (Andy)
> =C2=A0 - Consequently, drop patch "PCI: Make pcim_release_region() a
> public
> =C2=A0=C2=A0=C2=A0 function", since there's no user anymore. (obsoletes t=
he squash
> =C2=A0=C2=A0=C2=A0 requested by Damien).
> =C2=A0 - vdap/solidrun:
> =C2=A0=C2=A0=C2=A0 =E2=80=A2 make 'i' an 'unsigned short' (Andy, me)
> =C2=A0=C2=A0=C2=A0 =E2=80=A2 Use 'continue' to simplify loop (Andy)
> =C2=A0=C2=A0=C2=A0 =E2=80=A2 Remove leftover blank line
> =C2=A0 - Apply given Reviewed- / acked-bys (Andy, Damien, Bartosz)
>=20
>=20
> Important things first:
> This series is based on [1] and [2] which Bjorn Helgaas has currently
> queued for v6.12 in the PCI tree.
>=20
> This series shall remove pcim_iounmap_regions() in order to make way
> to
> remove its brother, pcim_iomap_regions().
>=20
> @Bjorn: Feel free to squash the PCI commits.
>=20
> Regards,
> P.
>=20
> [1]
> https://lore.kernel.org/all/20240729093625.17561-4-pstanner@redhat.com/
> [2]
> https://lore.kernel.org/all/20240807083018.8734-2-pstanner@redhat.com/
>=20
> Philipp Stanner (7):
> =C2=A0 PCI: Deprecate pcim_iounmap_regions()
> =C2=A0 fpga/dfl-pci.c: Replace deprecated PCI functions
> =C2=A0 block: mtip32xx: Replace deprecated PCI functions
> =C2=A0 gpio: Replace deprecated PCI functions
> =C2=A0 ethernet: cavium: Replace deprecated PCI functions
> =C2=A0 vdpa: solidrun: Fix UB bug with devres
> =C2=A0 vdap: solidrun: Replace deprecated PCI functions
>=20
> =C2=A0drivers/block/mtip32xx/mtip32xx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++--
> =C2=A0drivers/fpga/dfl-pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 16 ++---
> =C2=A0drivers/gpio/gpio-merrifield.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++---
> =C2=A0.../net/ethernet/cavium/common/cavium_ptp.c=C2=A0=C2=A0 |=C2=A0 6 +=
-
> =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++-
> =C2=A0drivers/vdpa/solidrun/snet_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 59 ++++++++---------
> --
> =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A07 files changed, 51 insertions(+), 69 deletions(-)
>=20


