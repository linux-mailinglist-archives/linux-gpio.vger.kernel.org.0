Return-Path: <linux-gpio+bounces-37660-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B9NMes6GWpVtAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37660-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:06:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2726E5FE4EC
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF17F3013252
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 07:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422A83A1A3C;
	Fri, 29 May 2026 07:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRzaiENU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F936E498
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038113; cv=pass; b=fr3wCtv0x+44VEUZpj/nI8+INu3HVvyWGU4DFWaEaKARN6gn/6fvnF8eaRJy9wKrmv4piJXSXoZdtNUL3K3iV6ds2nV4nQWLqvkfyCqP8/zePktxF5uOou+rlUJTkZv7iT4211Fb1Oq2dwfmcad4nI6ln0nSB7+qaRhQlWWKtGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038113; c=relaxed/simple;
	bh=O8J6YLE6ZB4yUPcyGapdQ6dW1P5EIkNOGTx2PcWHKbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQSbpn/zcKE6QzZoKoNWbB8cnq5IwU9LPnmClroGP+KGmFZG8LrJjgrZmypdGqR3loILe6JpX1AEhiah73k3XPAtS8pB29RKy6uT6B+jYsJu/34ilnKgpew4xyu1M4SER708m4j98JSpMVwwwiVRGd8ljOoIyAr5KcGA6Qx3QRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRzaiENU; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68af2ac47afso2065946a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 00:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780038110; cv=none;
        d=google.com; s=arc-20240605;
        b=ZGQDKYxp0s+8jjq+rluy4YUbqBhshl/NE4DIAtzUQgGa70ic8ma+n2OLfvcpUb/OSC
         sguomgk+PpQ/B1VvYlrYg/iNGhWM/xP2fRlnFGmpqQZRAnml0d8PK3xBSVOTv0nn03Rz
         FiCJUedvsqlN0dQmc82e+XAmxRn675cRR/NZ2rCZ4nSQewTUUwJDyQKuDAblQRS0bXYn
         q/hMoiyg905wtkWqb5lg6q7ABsTCAzLkI1xp5zQHJcfR+M9ieutYashIkNIEcK9X308W
         zzZPw3Wjso5PJtf5aITuWLCObtWN2+z5SmjR8N+7UsKtkcQlU5r3eQsx9DSdzornfPjt
         2Acw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t89bnL9txs8rrnZk0wRkeIs3fRkSrv8Tzr4zb4FyARo=;
        fh=1GFsd5lOwuAC/HMY6ZYYpAkO5PekxBY8JYu6tc90S4c=;
        b=hNMSZqaSA8mK8Qs/Z4/n9OmFLc9EqdfqG+5YPeozm8bxe/q8VcuVdh6CSXPF6BWSiS
         CCyN5qVOj8h/Lb+sG074vMRBcBMeEgpjPL+hk+worQDIeZXkGz+V8pDvOHxI+YUC349r
         W0/QyXAPNdVOskWaXibdgwpilI7g/pMynTeUe9YC7qFeE/TfFUylH4MYW8CQ7YiKBqj8
         Gf+OUxLpbwKOWa24HwgeicdGlezTMvsL21Q8rfCGLuU5p+JiYbaXadNWcfZ/b8Kc5jn2
         JwbcGWmxFtFRroUGYTq/zMsaP8mJTMorHlKr95mExdsMsv1w5ghVPw57TwGEgW5T4yoK
         N+/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780038110; x=1780642910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t89bnL9txs8rrnZk0wRkeIs3fRkSrv8Tzr4zb4FyARo=;
        b=qRzaiENU47HY9EpaFs7tOqCo/C02uU8z+X1vEvJXUJdHe4vo8PMsF/wLsNF4c7NhPy
         Yz4vmxiK8HPemnjFhM5sK+oS2bvP+qTtu/soFu2BrYDVgXJN3F7KhT/IQ6ULzbHa3lwh
         sZEdhNHDMoMDgsbiggDRJWu4WAw/8OIKIar/gLOlkOrNSkfB2HWh2uRmS1FiowkAFivE
         pZzsQfWsbLmenlQaXjJseblIA17W3tMTsu3fJEN6khKr8+a1tabnQfeJKGXLjy1r2fhU
         ObNf1y1ixKdChQfYED69D2AJAnXxtLULCfLvaRxKoOBRm9fLR/gihQOVy1A8MjhbuvqB
         DD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780038110; x=1780642910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t89bnL9txs8rrnZk0wRkeIs3fRkSrv8Tzr4zb4FyARo=;
        b=dp+V8I+uR31UsETr0ZrOsby/ULWocpwKx8fooIVLqIDmVnSU2scX7aodu4tusQ5o1l
         /Q1Q5dKS2jh58t2vhlCv6NWh8Isw8T9qs78oSVt+fgIg6E9EdUfCinAvTVvjSiNLCGIf
         /3v64JW/cNhuba/bJKXE6rMu8OT3lJNukZSdSFxvflWmQyG/La0iyTaCA3WWOwjWX5a8
         0BePPy9PUvtUNoMtjRpo20Vu9y7bsHa6NOO+NL0orVFaFZoZrLvBwcOFBFHuJPZ68CP/
         C9zh821LK8s8iGcoYlEvWzoziVd7hzHuW2T7TXbeT4Z+hfwzGNwM5T3LP6ynFbDmomH8
         VgyA==
X-Forwarded-Encrypted: i=1; AFNElJ+pjUolIfn+TNBp7i6pOdlt6TdcZfQROaYNsIbhy9S2vkDrNk07uoWEFx6I+YCW0EBTXcvyyCwceNHB@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ3SLgzkveicOtSSRATJbTwy1zLcIlfWI+wRLZ55KPW9fUpiK2
	lSpL3ZzFycqVAlZ4pnjboOXDLzm64MLUw+UbNUTTKiRBirNtjWx82YxXF69xlj9lD6ot+NZCOO0
	WhAALxNJBnburayvbRupRCu+uj/XlHic=
X-Gm-Gg: Acq92OHID9YkI0RtVMMNxcFQRkxUgPCW+7Ws61QEWIudCfCAdpAx1L4+Bat5oOQ0AKu
	0fp0QGkBDahXGT8/pjvJnj3enZQPZo8kvrava4VRxojcKyjqQ7KdnMYoHEXvtrWB5Y1H77mKADe
	GOZg96+p8a1SKiTxC8ai7MpR1/Oij4tYL+yPRl/eykHyA9a35CyPAeLIqKc+GEep6iJE08nk7rP
	CLppVD2pPiXwPLlG2BmVAF9NudzEssotXXPjMdCm+05exEkL33jmalGed7YG9rsDndlQjCZZArF
	SYUAs8cngg03ZmAB+NH5ftILIM6Hoq+O0kG97m1KqdtIGlA6+7D5iIKbUeEVEGaylDFl6P4jojE
	JLjlgM38sTmcffToJOlqHWVy78cNtdK99ZewXQIDCGbz/4FHw+zzseqL4f2tu9Hk18vB/
X-Received: by 2002:a05:6402:5191:b0:68a:2641:312a with SMTP id
 4fb4d7f45d1cf-68c1290f390mr693755a12.17.1780038103100; Fri, 29 May 2026
 00:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528025610.713514-1-rosenp@gmail.com> <cc236562-3967-4361-ad92-05582db82282@kernel.org>
In-Reply-To: <cc236562-3967-4361-ad92-05582db82282@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 29 May 2026 00:01:30 -0700
X-Gm-Features: AVHnY4IKU0fSryaVj01s709ESdvA-IppFByGBTXOMEAy66ZniXN3g5z_mMQtTt8
Message-ID: <CAKxU2N_4i7qfayGnDUrNeAVidYq7_eCoXRNvGeF8bSWUV45uHQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37660-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,agents.md:url,disroot.org:email]
X-Rspamd-Queue-Id: 2726E5FE4EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 11:50=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 28/05/2026 =C3=A0 04:56, Rosen Penev a =C3=A9crit :
> > Move the ppc4xx gpio driver out of arch/powerpc/platforms/44x/ into
> > drivers/gpio/gpio-ppc4xx.c. The driver has no architecture-specific
> > dependencies and follows the same pattern as other PowerPC GPIO
> > drivers already in drivers/gpio/ (e.g. gpio-mpc8xxx, gpio-mpc5200).
> >
> > - Renamed Kconfig symbol from PPC4xx_GPIO to GPIO_PPC4XX
> > - Updated ppc44x_defconfig and warp_defconfig to use the new symbol
> > - Marked the new option as tristate (was bool) since the driver
> >    supports module build via module_platform_driver()
> > - Added COMPILE_TEST support. Needs PPC as clrbits32 is in use.
>
> Not only clrbits32() but also setbits32() and in_be32().
Right. I noted it as an example.
>
> On the long run we want to get rid of PPC specific IO helpers, at least
> outside arch/powerpc/ , so don't add new instances.
>
> Remove that dependency by switching to ioread32be() which has been
> equivalent to in_be32() since commit 894fa235eb4c ("powerpc: inline
> iomap accessors"), then implement a local equivalent of
> clrbits32()/setbits32()
>
> See for instance:
> - qe_setbits_be32() in include/soc/fsl/qe/qe.h
> - tsa_clrbits32() in drivers/soc/fsl/qe/tsa.c
>
> >
> > Assisted-by: OpenCode:BigPickle
> > Signed-off-by: mangix <mangix@disroot.org>
>
> Who is that ?
My computer username. I've since edited AGENTS.md so it always adds --signo=
ff.
>
> > ---
> >   arch/powerpc/configs/44x/warp_defconfig                    | 2 +-
> >   arch/powerpc/configs/ppc44x_defconfig                      | 2 +-
> >   arch/powerpc/platforms/44x/Kconfig                         | 7 ------=
-
> >   arch/powerpc/platforms/44x/Makefile                        | 1 -
> >   drivers/gpio/Kconfig                                       | 7 ++++++=
+
> >   drivers/gpio/Makefile                                      | 1 +
> >   .../platforms/44x/gpio.c =3D> drivers/gpio/gpio-ppc4xx.c     | 0
>
> Not gpio-ppc4xx.c but gpio-ppc44x.c
ACK
>
> >   7 files changed, 10 insertions(+), 10 deletions(-)
> >   rename arch/powerpc/platforms/44x/gpio.c =3D> drivers/gpio/gpio-ppc4x=
x.c (100%)
> >
> > diff --git a/arch/powerpc/configs/44x/warp_defconfig b/arch/powerpc/con=
figs/44x/warp_defconfig
> > index 5757625469c4..380fa15af68d 100644
> > --- a/arch/powerpc/configs/44x/warp_defconfig
> > +++ b/arch/powerpc/configs/44x/warp_defconfig
> > @@ -12,7 +12,7 @@ CONFIG_MODULE_UNLOAD=3Dy
> >   # CONFIG_BLK_DEV_BSG is not set
> >   # CONFIG_EBONY is not set
> >   CONFIG_WARP=3Dy
> > -CONFIG_PPC4xx_GPIO=3Dy
> > +CONFIG_GPIO_PPC4XX=3Dy
> >   CONFIG_HZ_1000=3Dy
> >   CONFIG_CMDLINE=3D"ip=3Don"
> >   # CONFIG_PCI is not set
> > diff --git a/arch/powerpc/configs/ppc44x_defconfig b/arch/powerpc/confi=
gs/ppc44x_defconfig
> > index 41c930f74ed4..57a7342232d7 100644
> > --- a/arch/powerpc/configs/ppc44x_defconfig
> > +++ b/arch/powerpc/configs/ppc44x_defconfig
> > @@ -22,7 +22,7 @@ CONFIG_GLACIER=3Dy
> >   CONFIG_REDWOOD=3Dy
> >   CONFIG_EIGER=3Dy
> >   CONFIG_YOSEMITE=3Dy
> > -CONFIG_PPC4xx_GPIO=3Dy
> > +CONFIG_GPIO_PPC4XX=3Dy
> >   CONFIG_MATH_EMULATION=3Dy
> >   CONFIG_NET=3Dy
> >   CONFIG_PACKET=3Dy
> > diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platform=
s/44x/Kconfig
> > index fc79f8466933..150813cea945 100644
> > --- a/arch/powerpc/platforms/44x/Kconfig
> > +++ b/arch/powerpc/platforms/44x/Kconfig
> > @@ -227,13 +227,6 @@ config PPC44x_SIMPLE
> >       help
> >         This option enables the simple PowerPC 44x platform support.
> >
> > -config PPC4xx_GPIO
> > -     bool "PPC4xx GPIO support"
> > -     depends on 44x
> > -     select GPIOLIB
> > -     help
> > -       Enable gpiolib support for ppc440 based boards
> > -
> >   # 44x specific CPU modules, selected based on the board above.
> >   config 440EP
> >       bool
> > diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platfor=
ms/44x/Makefile
> > index ca7b1bb442d9..179468a00f5e 100644
> > --- a/arch/powerpc/platforms/44x/Makefile
> > +++ b/arch/powerpc/platforms/44x/Makefile
> > @@ -15,4 +15,3 @@ obj-$(CONFIG_FSP2)  +=3D fsp2.o
> >   obj-$(CONFIG_PCI)           +=3D pci.o
> >   obj-$(CONFIG_PPC4xx_HSTA_MSI)       +=3D hsta_msi.o
> >   obj-$(CONFIG_PPC4xx_CPM)    +=3D cpm.o
> > -obj-$(CONFIG_PPC4xx_GPIO)    +=3D gpio.o
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 020e51e30317..b87d2329900b 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -584,6 +584,13 @@ config GPIO_POLARFIRE_SOC
> >       help
> >         Say yes here to support the GPIO controllers on Microchip FPGAs=
.
> >
> > +config GPIO_PPC4XX
>
> I'd prefer CONFIG_GPIO_PPC44X
>
> That was added by 878e7556bfe7 ("powerpc/4xx: Add PowerPC 4xx GPIO
> driver") but since then 40x is gone with commit 47d13a269bbd
> ("powerpc/40x: Remove 40x platforms.") so only 44x remains as depicted
> by commit 7bf5f0562b62 ("powerpc: Replace CONFIG_4xx with CONFIG_44x")
Agreed.
>
> > +     tristate "PPC4xx GPIO support"
> > +     depends on 44x || (PPC && COMPILE_TEST)
> > +     select GPIO_GENERIC
> > +     help
> > +       Enable gpiolib support for ppc440 based boards.
> > +
> >   config GPIO_PXA
> >       bool "PXA GPIO support"
> >       depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index b267598b517d..192242988ecb 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -145,6 +145,7 @@ obj-$(CONFIG_GPIO_PCIE_IDIO_24)           +=3D gpio=
-pcie-idio-24.o
> >   obj-$(CONFIG_GPIO_PCI_IDIO_16)              +=3D gpio-pci-idio-16.o
> >   obj-$(CONFIG_GPIO_PISOSR)           +=3D gpio-pisosr.o
> >   obj-$(CONFIG_GPIO_PL061)            +=3D gpio-pl061.o
> > +obj-$(CONFIG_GPIO_PPC4XX)            +=3D gpio-ppc4xx.o
> >   obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)    +=3D gpio-pmic-eic-sprd.o
> >   obj-$(CONFIG_GPIO_POLARFIRE_SOC)    +=3D gpio-mpfs.o
> >   obj-$(CONFIG_GPIO_PXA)                      +=3D gpio-pxa.o
> > diff --git a/arch/powerpc/platforms/44x/gpio.c b/drivers/gpio/gpio-ppc4=
xx.c
> > similarity index 100%
> > rename from arch/powerpc/platforms/44x/gpio.c
> > rename to drivers/gpio/gpio-ppc4xx.c
>

