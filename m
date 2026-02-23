Return-Path: <linux-gpio+bounces-32048-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK9ZGRh4nGlfIAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32048-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 16:54:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A93179222
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 16:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43F4C30DB754
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 15:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9474730AAB8;
	Mon, 23 Feb 2026 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bez0+ejt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E32305E3B
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 15:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861900; cv=pass; b=c9rjNhAf5oDQCsUrAThxJlSRgf+bZwu5IgJpR67ODB/25vs7N91xyKoyJJ2t3AbBwkWD6djNgNn340z7noW5CgprEMBBtQUXSG3eJffuj8PGOW2HevkJRvAvZEdy5tz4NOYTqITdP8Idva3z9UANPBvhT3m8V4Wb4qNa9X+VAeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861900; c=relaxed/simple;
	bh=d5zCa3ysNLijKNaGOI7tuajauNFQ8GHfuuwERS7PUF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcyuoRyRmyvAiGpjUqg/PGylJeL40Ern/CKGuOgZFC9HvNm1c4guq4yk5Ym3aL9UwSod2lJpkkgx9UFSXptmUUMX0um/5RshN4HzPEXL7ck8ojRHpQAM2x83zkwdutITV/w49J31w1OBiA2rre4xKdj5a1+KRzuxWcBjGbdZgG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bez0+ejt; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8f96f6956aso617291466b.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 07:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771861896; cv=none;
        d=google.com; s=arc-20240605;
        b=CY9WFoo7jElNNFGOnWgXbjuVFEtGoX3h71qSeTVhtQSGYSLyv19ef12Vk9wfMHkLwk
         xT7qZz0244GyahLV5AOYqsQEmNEhIByLrSit47R7vYKFX0s9SbB/OIb4VeBHs+UYB9Sv
         Bne0Qt6HWJ/0D1UdLIwJhSvco9tgvOzQUWJE8w1PMZmb1GV8yX5NDxHZ+HYxSuYgcHKO
         ef7YrETxI/fChdKZ867nF/LKobqEu56i5ypYMDtNbOz6phB2/tnd9efFcnhvx9KI6z8a
         v03862DmBdynSREj+3ydNd0aeBNSJKbHoVNuekfKopMRafiVq7uQT1IOnVAlePugLwhB
         1wWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        fh=T+GoYqnoTqy2ojaKdld1VIfPPyPtynKXIJp0bKqASaI=;
        b=UeQ6KojHxluZoEeSwViS7rkUibmwcRJnegMl8jxa79cBCfzmSlu9+pLdkeFlNHmYpB
         8NMN+R5Xd8OUMDDAGqcmyVR3VNfKwbnDDXUH2vXHBRpwSYxTvD0mSM2qA6ygpDHkwmoW
         UmH1sUQQAPZYtda2luStHSUyjL77T14OKzIH5AsMURMgkqFIrdUk+dqo21gNYV4f2Sld
         k8g5EW8SP6bl3lBvc7FFfmDXfhoWdZUYBuqQUO0ipTOQNBiHSjfWeCDu6Fo4Dr9UB9mz
         Hn9ZEktKMC0WgqZCuKV+A57boCSW8TPcQZvKThHjdXgArpICTU17GiOsjKr/x7CSylbs
         +3Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771861896; x=1772466696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        b=Bez0+ejtvpYWPD6Kti1bkjLrHh/4ih0eYIM0CLxjHJVlyC5lHQHjEKF0CNkHaDuEqj
         cX2cnDEAf7qRrLs8/C3MibBqjq4NnO55kbXTfuH8/Nxx6jwnOMpahcd+BT6S/CdCi1JH
         KUJtx0cspJycQjPwSfacE7jXqTjOKa2T5ILFwWyAwyTfTP05EQrGoHDnILUdu9FWad3o
         qbEmW4NoUFk3SaZ6xWr4LES3oxs34gzL9jKWeuyFPeI3DkWSJDZv4Gpd6GKXlNwQMJpf
         nVxvrZuxvOrPFJhe7ZUNsnwKzjKRrU4q7YjLGxGI51cWL7miac2P1Y9+lB0iWh/Q5Nv6
         YUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861896; x=1772466696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        b=bmefgXz7/RBPJM0MM8X93wzxJ4WjiOOV5zB5yDz0aMZu0soioWVzDnY5ljok982Uk7
         Fp7l+OJkciMaCB4392IKsQT4f9Qyp85VjId92JOqklsCfKgKK9NCngi6+5cApNGAJuM1
         lW/oKo7bgK/4JyZQ7n5z2pyNTeIauuyTIG5c3GmXp9KWZTQAPlT3nw9uEYg2ib8UKWFF
         lllBf9WeboQ+0N6cmrXOql+NDnJ/0sSn5ZrDJiuXfSg55NcrM76iGE/b/k760u6OPKdO
         4nLUrVbncyFu6YKNPdeQhgM+dhy5tH9RjPWvvGcexFtRXMuLpuy2Lm1vTqkDjxvI8aV2
         39Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXC1tSsiw1ObJurkoHNXQ9jwVzVlM3yqjHcsT/3oA226pXrPMExrguvAkE4SRS91tbVHo4SeNr9RGOY@vger.kernel.org
X-Gm-Message-State: AOJu0YzPYKu9Gphxx6zw3y0YrtLFnoZZla+5tKdbDWAKHowFbsSsXMB2
	3jZoetByiowSMrPU8PFAZpWpJ1jkeW3C2XMViaDY+dI4k5RTzlHFAoZJ3KbWmvnBEuW0VKu7Mid
	6ipqIUqse7By213As3t0qtGp32cYrP3Q=
X-Gm-Gg: AZuq6aLPcXLAkEHlzkwksJlnbiqipKyCa8ciAgMZ5ZX67/tr5UBd48jVPzX3HN74UC9
	kgg8iLLqOfB8snT/DRXAwLLcdMqpnOxaHW2f2HsKTVJVzn33Rhkef8PrN7374VhTKwfcDH/gqKT
	OE5uzHjd2GVhEFBLPVrQGrN/7NDqBZd+DLYeUdb8hFgQjabsoKVJfgDUzqeAbvsKt/+T5obQ95L
	QxNK0K9L5gJe99Ow0vZpZMZ6HEw1E1LxO+5QjTYzEquqixE3FuZNppmLSDjNrARI3Lm8+Xlj2SJ
	Nqz8WWGLbPvaZ6ztBYiC8ENaPCDRXnR7hK9K2tRosfDmf4BcKt+Duv34YMSZhODVF4svR4oFlKB
	5sVgVDcY=
X-Received: by 2002:a17:906:5ad6:b0:b8f:e424:ae56 with SMTP id
 a640c23a62f3a-b9081badd6emr413937066b.44.1771861895691; Mon, 23 Feb 2026
 07:51:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 23 Feb 2026 17:50:59 +0200
X-Gm-Features: AaiRm51McMZohKyigNQFIbQDImiJ8vF_g2F0DjapyVKPe6Rkgx4x17MorqEdw1M
Message-ID: <CAHp75VeWD5A0r7-Uayyte1ZXXxdhLixd+z_y0xNeki0N+Ro=jQ@mail.gmail.com>
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>, 
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Even Xu <even.xu@intel.com>, 
	Xinpeng Sun <xinpeng.sun@intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
	Karol Wachowski <karol.wachowski@linux.intel.com>, Min Ma <mamin506@gmail.com>, 
	Lizhi Hou <lizhi.hou@amd.com>, Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Srujana Challa <schalla@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Antoine Tenart <atenart@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Raag Jadav <raag.jadav@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-i3c@lists.infradead.org, dmaengine@vger.kernel.org, 
	Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org, nic_swsd@realtek.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-usb@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org, linux-crypto@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, 
	mhi@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,microchip.com,intel.com,linux.intel.com,kernel.org,bootlin.com,hisilicon.com,huawei.com,marvell.com,lunn.ch,gmail.com,davemloft.net,oss.qualcomm.com,amd.com,rivosinc.com,linaro.org,stgolabs.net,gondor.apana.org.au,linuxfoundation.org,microsemi.com,deltatee.com,arndb.de,vger.kernel.org,lists.infradead.org,realtek.com,lists.freedesktop.org,lists.linux.dev,ffwll.ch,semihalf.com,zonque.org,linux.dev];
	TAGGED_FROM(0.00)[bounces-32048-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[87];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: C1A93179222
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 5:32=E2=80=AFPM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
> This patch series addresses a long-standing design issue in the PCI/MSI
> subsystem where the implicit, automatic management of IRQ vectors by
> the devres framework conflicts with explicit driver cleanup, creating
> ambiguity and potential resource management bugs.
>
> =3D=3D=3D=3D The Problem: Implicit vs. Explicit Management =3D=3D=3D=3D
> Historically, `pcim_enable_device()` not only manages standard PCI resour=
ces
> (BARs) via devres but also implicitly triggers automatic IRQ vector manag=
ement
> by setting a flag that registers `pcim_msi_release()` as a cleanup action=
.
>
> This creates an ambiguous ownership model. Many drivers follow a pattern =
of:
> 1. Calling `pci_alloc_irq_vectors()` to allocate interrupts.
> 2. Also calling `pci_free_irq_vectors()` in their error paths or remove r=
outines.
>
> When such a driver also uses `pcim_enable_device()`, the devres framework=
 may
> attempt to free the IRQ vectors a second time upon device release, leadin=
g to
> a double-free. Analysis of the tree shows this hazardous pattern exists w=
idely,
> while 35 other drivers correctly rely solely on the implicit cleanup.

Is this confirmed? What I read from the cover letter, this series was
only compile-tested, so how can you prove the problem exists in the
first place?

> =3D=3D=3D=3D The Solution: Making Management Explicit =3D=3D=3D=3D
> This series enforces a clear, predictable model:
> 1.  New Managed API (Patch 1/37): Introduces pcim_alloc_irq_vectors() and
>     pcim_alloc_irq_vectors_affinity(). Drivers that desire devres-managed=
 IRQ
>     vectors should use these functions, which set the is_msi_managed flag=
 and
>     ensure automatic cleanup.
> 2.  Patches 2 through 36 convert each driver that uses pcim_enable_device=
() alongside
>     pci_alloc_irq_vectors() and relies on devres for IRQ vector cleanup t=
o instead
>     make an explicit call to pcim_alloc_irq_vectors().
> 3.  Core Change (Patch 37/37): With the former cleanup, now modifies pcim=
_setup_msi_release()
>     to check only the is_msi_managed flag. This decouples automatic IRQ c=
leanup from
>     pcim_enable_device(). IRQ vectors allocated via pci_alloc_irq_vectors=
*()
>     are now solely the driver's responsibility to free with pci_free_irq_=
vectors().
>
> With these changes, we clear ownership model: Explicit resource managemen=
t eliminates
> ambiguity and follows the "principle of least surprise." New drivers choo=
se one model and
> be consistent.
> - Use `pci_alloc_irq_vectors()` + `pci_free_irq_vectors()` for explicit c=
ontrol.
> - Use `pcim_alloc_irq_vectors()` for devres-managed, automatic cleanup.

Have you checked previous attempts? Why is your series better than those?

> =3D=3D=3D=3D Testing And Review =3D=3D=3D=3D
> 1. This series is only compiled test with allmodconfig.
> 2. Given the substantial size of this patch series, I have structured the=
 mailing
>    to facilitate efficient review. The cover letter, the first patch and =
the last one will be sent
>    to all relevant mailing lists and key maintainers to ensure broad visi=
bility and
>    initial feedback on the overall approach. The remaining subsystem-spec=
ific patches
>    will be sent only to the respective subsystem maintainers and their as=
sociated
>    mailing lists, reducing noise.

--=20
With Best Regards,
Andy Shevchenko

