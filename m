Return-Path: <linux-gpio+bounces-5495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097CE8A4ADE
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Apr 2024 10:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57C8FB276AB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Apr 2024 08:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EFD3B297;
	Mon, 15 Apr 2024 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="SeFsdH17"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5DD3A1C4
	for <linux-gpio@vger.kernel.org>; Mon, 15 Apr 2024 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713171189; cv=none; b=fBEZkd7up1bRAiLGyC24YH6WmW52JMA7A81VyXcI0MPY/baLPvi5Il4kwf9xzkafc3yNHS2JoGfsXZ0gVDyUzwVHQBSscoav4mXsc9rf0vCOuIa+oVnOJySJqgVIZLkMDpgigXrHK02nZHofC72jTfyI54FbQkbcofBGCk2NwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713171189; c=relaxed/simple;
	bh=bnWlog0y4bN4WZfNS47LmbCRbE8trcNL1TvxiAUYcAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2hTutJuaPtR4C0BSx3+R5EAOONcX/yUAq+tETYh7S17is+I7iAa/I5Izk/5Nda9b0XPSN610ZnX5ukFuxN6a/Y+YXgvN8HPR9qwHaGK6XnxJHCmWisfgUd3egHtqt7l/lJ0kuQAcrKzAwv+Tpl5ikriVjilzYnsS7d+6+lymgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=SeFsdH17; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso3125292276.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Apr 2024 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1713171185; x=1713775985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ1xbbcbi2PHmTU6OF8vjn6o1DKOJxbx1zIcDvksvVQ=;
        b=SeFsdH17e1W9yTjRQTRTAiBgLmlZGxcMEUE3eZGSaWG212MDmRuYMxZAig42hmklPx
         nfV7VcHB+oti6nSi/aEAsiZxKNBnrmIn46SayLGW2oOAQdr37k5NxigNWyEmqNCTbkML
         zSTvFLpoXeUy2L0hsz/fqUGVrKzd2Mp7vXjI4IJAe+wcU5es4D1lq2ZJZ0Sx6m8PJ7Av
         +oBPGy8zNiQizNStq9LRuCzg1t4ENNrw8BSxhMXqfunZo2Lc/7w12/KaLVMItOyDS0/Z
         5vDLJM5YOTMI26fuua+LXC/YXiQXy3XbFtyNico3mm6idmJByjNmJzrrYwRLc7nvHSA/
         gYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713171185; x=1713775985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZ1xbbcbi2PHmTU6OF8vjn6o1DKOJxbx1zIcDvksvVQ=;
        b=X77UiRf8HbT87jTScUdIE9GSF/lO8pnwYA2wzUiG5fCuuj/YI3IAlbVcFGGVUXRMju
         S6ESHKfsMp/bSF8rmLWRfaCTdAsr4kEhugdl1uZgtVQQZ+cVzIIvT1b/gQpAOb+g4pqk
         HskCvfApCqS/DF+WJvx1XnRDa1gy9Tb7A9WB7msupuPS8GYF5+zvV9ozu959UQ81NZ+V
         ugUo8CS+jgD//ccqrwB17TskrQ3o1808gtvZDdZ8ErsL5fJ+KVoBTmFkgaW2PrVflkv4
         w9KL1SlEi0DufmCCSjAQ816lW7zve9XLEL+YXoBUcgLGkIdVyAD/RlT6+TKJ/4mPI66P
         6yUg==
X-Forwarded-Encrypted: i=1; AJvYcCWE21PUcu/ZEmsNSx5mZLMYtZoUk+Tk7NVAVveuxA1KVo02OSV7D9HgYS6czS/TqBwqS6aR9lRuTQrW4pzLRcQ+73JJj0Oq3Dfe7w==
X-Gm-Message-State: AOJu0Yzr6WWQ/fN3gBgvhIiLnuW+FMnkTeKi5JjLCQ1oh8qLZDSupF6g
	EU3LaNc9dGasCDGIPFNJuDXfm/to6A+b6VPz0J/M0qw6cwnPnyXFIuOk+Sz6LgeppsNzDljb/Xr
	CZ81fqnOih2gwxTCC3zaB0jK3gD3RfYjtY/CGdA==
X-Google-Smtp-Source: AGHT+IFJbL090k1ujMdhoHBuRAuqn8RndPzBOrxsylJHE/9nowfFnHodh0UXrHCjiHc2lZ6BeIyZaM4TTcpqN8OFnWc=
X-Received: by 2002:a25:9e05:0:b0:dcc:99b6:830b with SMTP id
 m5-20020a259e05000000b00dcc99b6830bmr8838308ybq.19.1713171185683; Mon, 15 Apr
 2024 01:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1713036964.git.andrea.porta@suse.com> <0ab5a768d686cb634f7144da266c9246e9e90cb4.1713036964.git.andrea.porta@suse.com>
 <d7b884dd-9b70-41c3-ac2a-66b54c26d08a@gmx.net>
In-Reply-To: <d7b884dd-9b70-41c3-ac2a-66b54c26d08a@gmx.net>
From: Phil Elwell <phil@raspberrypi.com>
Date: Mon, 15 Apr 2024 09:52:54 +0100
Message-ID: <CAMEGJJ2R-WEqs+LgqMwDQJ_QHF840RYAqVGkbWxBs70anv6M4w@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: broadcom: Add support for BCM2712
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Jonathan Bell <jonathan@raspberrypi.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org, 
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org, 
	Kamal Dasu <kamal.dasu@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Stefan,


On Mon, 15 Apr 2024 at 09:20, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Phil,
>
> Am 14.04.24 um 00:14 schrieb Andrea della Porta:
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >   arch/arm64/boot/dts/broadcom/Makefile         |   1 +
> >   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 313 +++++++
> >   arch/arm64/boot/dts/broadcom/bcm2712-rpi.dtsi |  81 ++
> >   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 841 ++++++++++++++++++
> >   4 files changed, 1236 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> >   create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi.dtsi
> >   create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
> > index 8b4591ddd27c..92565e9781ad 100644
> > --- a/arch/arm64/boot/dts/broadcom/Makefile
> > +++ b/arch/arm64/boot/dts/broadcom/Makefile
> > @@ -6,6 +6,7 @@ DTC_FLAGS := -@
> >   dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
> >                             bcm2711-rpi-4-b.dtb \
> >                             bcm2711-rpi-cm4-io.dtb \
> > +                           bcm2712-rpi-5-b.dtb \
> >                             bcm2837-rpi-3-a-plus.dtb \
> >                             bcm2837-rpi-3-b.dtb \
> >                             bcm2837-rpi-3-b-plus.dtb \
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > new file mode 100644
> > index 000000000000..2ce180a54e5b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > @@ -0,0 +1,313 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include <dt-bindings/reset/raspberrypi,firmware-reset.h>
> > +
> > +#define spi0 _spi0
> > +#define uart0 _uart0
> > +
> > +#include "bcm2712.dtsi"
> > +
> > +#undef spi0
> > +#undef uart0
> > +
> > +/ {
> > +     compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
> > +     model = "Raspberry Pi 5";
> > +
> >
> according to this downstream commit [1] it's just called "Raspberry Pi
> 5" without Model B, but the filename and the compatible says something
> different. Is there still a chance to get this consistent or is it too
> late because the firmware expect the compatible?
>
> [1] -
> https://github.com/raspberrypi/linux/commit/99e359d2f2da2c820fd2a30b1ad08b32c9549adb

Nothing cares about the compatible string, but the product name was
changed too late for the firmware, which expects the current DTB file
name. I'm happy with the naming as it stands, since we use Pi 4 to
refer to all the BCM2711-based devices, and Pi 5 can include CM5.

Phil

