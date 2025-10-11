Return-Path: <linux-gpio+bounces-26990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00941BCF3AD
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 12:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A16519A0E97
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 10:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322D622A7E9;
	Sat, 11 Oct 2025 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bues.ch header.i=@bues.ch header.b="RZ90BDWb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.bues.ch (bues.ch [116.203.120.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD248223DFD;
	Sat, 11 Oct 2025 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.120.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178882; cv=none; b=WdELVdUjafVpGzcqB3nl9m/thbrBP4Bc4v3545MNhf4FEmrCBnyXxEcmio7zBNeR2Gr0z1cmdaWIFXJ9ENpQQdkUhjuEc1gQs61F1+GjapWlYo9c0JXdAwBVLK5hxOE/OT61ErMhPUBhC5ge8HgpbKCaQsXpI3Lb+eEi+RlYC6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178882; c=relaxed/simple;
	bh=RPnxsHKvQAtjgFLhYvAOwaYQxrxhvwWAjuZJGLDkTM0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SQNzRIfiop/4/UYOLyc8c0SCQzYLGVuu7t57lKMDldUjpibRqLAfenXCcfQGAXSMdznM24bSgDQD+s1lGC0fjnvVGh5CkrV4mhHb6SGRXdL/f88R70TtAoM3dvovyKevbr4bOWmGElp5x/hGtnERM2M+21KHL9Tp2c/23Aycjjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bues.ch; spf=pass smtp.mailfrom=bues.ch; dkim=pass (2048-bit key) header.d=bues.ch header.i=@bues.ch header.b=RZ90BDWb; arc=none smtp.client-ip=116.203.120.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bues.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bues.ch
Date: Sat, 11 Oct 2025 12:26:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bues.ch; s=main;
	t=1760178391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C/XdIUJLYmP6HyfrudNxF/spDaQ+SzEBz9wATTY6ztM=;
	b=RZ90BDWbsXHLyrPt4p/3rtqcIvShidyYoMNceBNSfJUL42RrPbanLyXClHtIWoSah+2amJ
	Us4mU8lygq3UInk7pbq8Mj8u2ZbW4Ib6jprGNP6N6YaT1p7Q+gHFoLJrfg6b/SPQcZfDKO
	S1Bpz1X8G9n5zRxXWXDfwrQbd01cvN3cxmW7xubm8lLe6u54Zv3ChcLpp/6w+YF15pSEf4
	gwHS+TuCmqLk0JthLVD5YIETE7JoceV6Z4lxUZzTm+AAgSOgYZrEjrpkcLGVE/LBTBH4fs
	vqE107mnkZVbcQqz011ZVukMpo7LWdy3vjs2eazes28MY0Px0h4sa3VzlT7rHw==
From: Michael =?UTF-8?B?QsO8c2No?= <mb@bues.ch>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Bjorn
 Helgaas <helgaas@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <20251011122612.4fa7c97a@barney>
In-Reply-To: <202510110924.dUQeeRV6-lkp@intel.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RYgJ2couQgfD.xDFQzq5=_5";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/RYgJ2couQgfD.xDFQzq5=_5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Oct 2025 09:43:54 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Vaibhav,
>=20
> kernel test robot noticed the following build errors:

>    drivers/gpio/gpio-bt8xx.c: In function 'bt8xxgpio_suspend':
> >> drivers/gpio/gpio-bt8xx.c:233:19: error: 'struct bt8xxgpio' has no mem=
ber named 'saved_outen' =20
>      233 |                 bg->saved_outen =3D bgread(BT848_GPIO_OUT_EN);
>          |                   ^~


It looks like the
#ifdef CONFIG_PM
must be removed from struct bt8xxgpio definition.

--=20
Michael B=C3=BCsch
https://bues.ch/

--Sig_/RYgJ2couQgfD.xDFQzq5=_5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEihRzkKVZOnT2ipsS9TK+HZCNiw4FAmjqMMQACgkQ9TK+HZCN
iw7djQ/9EodJ8lRDysNygYULpj/p3PSFnA9gciZ2Sgy6HtR/CBBUoAwLVSW2Xto/
/Az8Pzn94GvcDrQqgkXpqdJqn7CbGPfltw3qokIRXbQbaUfoIAxvedfSgRjI/gAN
XgNyd6X1r+ZUB+RkZ40umnbzElXjNZ/qDc9LORmT14BD8niOayMW5J2J8aGs/+qR
ohy7imPNmolbEz9t+1B47dTijb3vRm/r3Jl1Q9sbWgK4v8Szdu5MNxy/dAsv0LjZ
zrjZufHqbd39GpKz7OiPMAEvKehtO1p1WRkPuQMvk95aGL05asNTtZNC7xQtU9yw
pCb/GLidd6vp+PT2I/oH/ujzF4Ms0VACzWnSbESIJb7TRY+JYmnKbh0OcXLQtMPP
bCuZ9ogfQryJ/JvBYNtap1e9tJYmMp2uqw5f5NjuXubLv7DeNb5NGAKBR3U1HiKp
dJRbt+ewWJTP1Bk9L10/NTBSC8KDlL0klDOPmNSWV/XuB12OgvlqvVWK0UeF3ON0
byiR/4Jcg1Xr5P/hNVuhYwyYOgSiOFef3HbdfCLcOqInvAYOjmlR8OEuuhVMH9pd
IHFbCxAc7smr8vDHJDJhb40p6WoX8omXfLBfKLwRhQcVBIT/X6hso06c7t8qNvXN
gyrq3AE9QnyRclfjYLadnumrHSjs3keKwyWcFAjVPzSwFktAI6k=
=EuQW
-----END PGP SIGNATURE-----

--Sig_/RYgJ2couQgfD.xDFQzq5=_5--

