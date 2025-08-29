Return-Path: <linux-gpio+bounces-25215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D120B3C54C
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 00:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 220775A5BEA
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 22:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D5E2D24A2;
	Fri, 29 Aug 2025 22:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CRx1dRNm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDA82D8790
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 22:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756507399; cv=none; b=Taqpp3pDNBcLpPEHF9usAojDNQU82UoZ/BG7nUENSMn4jSP0cJEasj9Q4IiVPO899APh1R1IXWKjYEAdkXKwWaUMm/lo/hHdOZmFj3QS3QmZqxNziDZ5fAPAl9TdHzbYzL34OdN+ZJUEWNtf9ecu9zzijASr0Rj3t+sqciBT5/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756507399; c=relaxed/simple;
	bh=jGr02VkK9p2fsaHl4krBGi3Gcv0K/Dq3jYXoqTUhlHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUwi2H9nxDDrGmwJ1h7llpUifzN7Qiq0S6Dn95fiExGx4CeWd1UsGkK3gHHTq80m5sxoNAj/2DiHUNg6XaHoKHdN2f3pQFEljIj3Y0oj7+tThNOMZrjfuwb4A4ZBp6ip4O0Lxtb7MpwhEl25zw1IKJ7kW0Kj2x+TL3s8oDUeI8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CRx1dRNm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f53efe803so3081299e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 15:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756507395; x=1757112195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3HMSFTYkwkaFde3FTv512A9vMIdGPtLwJDKHl1bOSw=;
        b=CRx1dRNmVhsswN+R6LJEiWnzk4vqbMhpwiKk+zu6XPrBO3yq1sD8TBtJm6kHGBTLlz
         9fsjCQbNpjnnoPOrFbSoZ5eao1u9XFmi8nlYz0MqETmu97/GLVn/aGiqxbFhqnqSVbE5
         znY7UTGup191qC5HzM65PG3yZ2NsnEwfdaLH4SWQQ+W/E/isBZJLLpD1/RWQbU/PddyJ
         EJcMVgdbAybIvaKQG/taMcs3zuJd5qWxBft2RxwjYgUi9Sku6oVn1SrvStNxGlFqLmZI
         C2bVqNXG9DtV7sQlfqYMFophOmuIovAqz39KKmrJ2mvGWIsUzjXUua1NnUgvun41G6ko
         FK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756507395; x=1757112195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3HMSFTYkwkaFde3FTv512A9vMIdGPtLwJDKHl1bOSw=;
        b=OJVo6SjZxnFUx5fkPxPcQ2BDQ5PchY0JQzZ2whbquhnepjsgAmrYEuMX2jqSlcvW2t
         gfH+Y3GZa6FQTe6Njw43m80zTWpQ548PJe9VSnJeyLLR2oxFoexfY28ZCevWqF03E3Hx
         NNTXSyEfN7Psyb6VoectDXPwwbuPqJfFFVSOH7+MU033vHdY1YopkmygO+iPfABeFB+t
         WSk+Z6esWNgYT5DjdQDGVwcApvKKXZo/JwXmHPWcL0nreM4LulIIbhUQjHyfewBCzn3v
         srHVoGxnfr0bzMvrw5+D7TrOdNVEW0uD9UMNPTkod4Z3wO52qCWvEcdagUbRCPaCpM2r
         Vq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUmGSPQjuRbrUCRnc9Dfpwj49vx5xYUdbz10LSIWOD+5DeNbowF6TwaV+dGDY7DFVyW0RWt2zWkO3K@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNH5GV2uyvNSrKkprvxnBACnaefm75+tneFlPFRCVF6CPRgie
	Meq2eapx6NnQVNZ130hzdQYPWZPbu7QL1wxO3D2M+bxnQrW+tk50txh4MiFiYN2Cd3HwllDlGTv
	JKm62jU23uxYTNmT5ltdZGf9gfH63X7Sj1mkl5NFayQ==
X-Gm-Gg: ASbGncvTdZAINgrUPrPZJnk2L9zDaocHXW0NTI/QTORnCiKUT+MGQbuCyMfJZ5iw9vq
	uVmJuGZAw7utlv18+iw8plbwAZ2krHhp9cRH+AADi8wYIFnoRcgGmBEh/qM/OqItsxKbnMdyRrF
	PGmDHKmKhyAph0/GgW54FCmnm53lDqJKwjKPMcFqUe1VANdoTnqXQHQ7r0everuj4DFReddzR7W
	K1ZIcZQq4E/4iNhQA==
X-Google-Smtp-Source: AGHT+IHm71DsC7m+N7D2hyLfPV6zYPJLUSld7AOt4nduUGpWEdvQRHRqSETZ6anSZ2x4+lTEOdRrZSfKltu51MRqcwI=
X-Received: by 2002:a05:6512:1353:b0:55f:65a3:b2f1 with SMTP id
 2adb3069b0e04-55f7093e9b3mr49355e87.29.1756507395432; Fri, 29 Aug 2025
 15:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ06_3bgiWfPjQy3JRgtzq5vcr4FgR9JrzTFrGKOxTe52A@mail.gmail.com>
 <CAL_Jsq+_aYAM8V7UmhCP-74BRpwv_vfzHeFrWvxmc=TLT+7oQw@mail.gmail.com>
 <CAMEGJJ1gOMhe3-+6UD=gzPOqCpbuXmA9aSpytJ66JbpJ9w3fvA@mail.gmail.com>
 <CAL_JsqL1wrN32WXa6qP+hVvxtnkaxqbbf-EP=pKCOkzTzmbgMw@mail.gmail.com>
 <CAMEGJJ2601iPngUtfhi1X5R2em=y0or+y216qVojzsunb6v++A@mail.gmail.com>
 <CAL_JsqKdX6+f8DBRn=L7_EFeGcv30mcQdfXWQtnW1m31aDoGGw@mail.gmail.com> <CAMEGJJ2EF_rdD7fOpkpO7EvmOjMt4FF41ut=Vjy-e3x3+oYSBg@mail.gmail.com>
In-Reply-To: <CAMEGJJ2EF_rdD7fOpkpO7EvmOjMt4FF41ut=Vjy-e3x3+oYSBg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Aug 2025 00:43:04 +0200
X-Gm-Features: Ac12FXw66H8Ptk3W8FRkrnp-PrvI51pETDyUthl7XDug-56UJqigXns2UqQyfyE
Message-ID: <CACRpkdZ3hZBK4AMfVHgFVpNdRL3FSLxeVPN+kWEkf6pMV0oQhw@mail.gmail.com>
Subject: Re: pinctrl, probe order, and CONFIG_MODULES
To: Phil Elwell <phil@raspberrypi.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 5:51=E2=80=AFPM Phil Elwell <phil@raspberrypi.com> =
wrote:
> On Fri, 29 Aug 2025 at 16:01, Rob Herring <robh@kernel.org> wrote:
> > On Fri, Aug 29, 2025 at 9:52=E2=80=AFAM Phil Elwell <phil@raspberrypi.c=
om> wrote:
> > > On Fri, 29 Aug 2025 at 15:44, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Fri, Aug 29, 2025 at 8:35=E2=80=AFAM Phil Elwell <phil@raspberry=
pi.com> wrote:
> > > > >
> > > > > Hi Rob,
> > > > >
> > > > > On Fri, 29 Aug 2025 at 14:25, Rob Herring <robh@kernel.org> wrote=
:
> > > > > >
> > > > > > On Fri, Aug 29, 2025 at 5:37=E2=80=AFAM Phil Elwell <phil@raspb=
errypi.com> wrote:
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > A Raspberry Pi user recently asked us why I2C wasn't working =
in their
> > > > > > > custom kernel build. The primary change they had made was to =
trim the
> > > > > > > number of enabled drivers, make them all built-in, and to rem=
ove
> > > > > > > CONFIG_MODULES=3Dy. The end result of this is that the pin mu=
xing
> > > > > > > required for I2C to work was not being applied, leaving the i=
nterface
> > > > > > > talking to thin air.
> > > > > > >
> > > > > > > I eventually traced the failure back to this change:
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/drivers/pinctrl/devicetree.c?h=3Dnext-20250829&id=3Dd19c5e79d=
46efdf89306be99f3c8824cf58e35f6
> > > > > > > It introduces a requirement for CONFIG_MODULES to be enabled =
in order
> > > > > > > to get an EPROBE_DEFER in the event that the pinctrl driver h=
as not
> > > > > > > yet been probed. Without CONFIG_MODULES, the pinctrl requirem=
ents are
> > > > > > > waived. Removing the IS_ENABLED(CONFIG_MODULES) clause allows=
 the
> > > > > > > probing of the I2C driver to be deferred, fixing the user's p=
roblem.
> > > > > > >
> > > > > > > Is this requirement for supporting modules reasonable?
> > > > > >
> > > > > > That's not the requirement. If CONFIG_MODULES=3Dn, then we only=
 defer
> > > > > > probes until late_initcall because after that point no more dri=
vers
> > > > > > are going to load. If CONFIG_MODULES=3Dy, then deferring probe =
is based
> > > > > > on a timeout which can be disabled.
> > > > >
> > > > > Thanks for replying. I'm probably missing something here, but if =
the
> > > > > pinctrl and I2C drivers are both regular platform drivers, what i=
s to
> > > > > stop the I2C driver being probed first?
> > > >
> > > > Nothing, but it should defer unless you've reached late initcall or
> > > > you've set "pinctrl-use-default".
> > >
> > > From the "next" tree:
> > >
> > > if (!np_pctldev || of_node_is_root(np_pctldev)) {
> > >         of_node_put(np_pctldev);
> > >         ret =3D -ENODEV;
> > >         /* keep deferring if modules are enabled */
> > >         if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret < 0)
> > >                 ret =3D -EPROBE_DEFER;
> > >         return ret;
> > > }
> > >
> > > Unless CONFIG_MODULES=3Dy you get ENODEV.
> >
> > Indeed, as 'ret =3D driver_deferred_probe_check_state(p->dev);' is gone=
 due to:
> >
> > commit 24a026f85241a01bbcfe1b263caeeaa9a79bab40
> > Author: Saravana Kannan <saravanak@google.com>
> > Date:   Wed Jun 1 00:06:58 2022 -0700
> >
> >     pinctrl: devicetree: Delete usage of driver_deferred_probe_check_st=
ate()
> >
> >     Now that fw_devlink=3Don by default and fw_devlink supports
> >     "pinctrl-[0-8]" property, the execution will never get to the point
> >     where driver_deferred_probe_check_state() is called before the supp=
lier
> >     has probed successfully or before deferred probe timeout has expire=
d.
> >
> >     So, delete the call and replace it with -ENODEV.
> >
> >     Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >     Signed-off-by: Saravana Kannan <saravanak@google.com>
> >     Link: https://lore.kernel.org/r/20220601070707.3946847-3-saravanak@=
google.com
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> >
> > So fw_devlink will ensure that pinctrl probes first. Is that turned
> > off by chance (kernel cmdline is the only way to disable).
>
> No, I don't think it's turned off. After a bit more digging I'm
> starting to think that of_fwnode_add_links doesn't work in the pinctrl
> case because the pinctrl-n properties are links to children of the
> pinctrl controller, not the controller itself. Perhaps they're not
> simple enough to be declared with DEFINE_SIMPLE_PROP and need a custom
> parser that returns the parent instead?

Have you tried setting this property in the pin controller?

$ git grep link_consumers drivers/pinctrl/
drivers/pinctrl/core.c: if (pctldev->desc->link_consumers)
drivers/pinctrl/pinctrl-stmfx.c:        pctl->pctl_desc.link_consumers =3D =
true;
drivers/pinctrl/stm32/pinctrl-stm32.c:  pctl->pctl_desc.link_consumers =3D =
true;

Maybe it should be the default.

5+ years ago I patched something like this but thought it was
too invasive:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/co=
mmit/?h=3Dconsumer-link-enforce&id=3D73441cf773ed91bff0e7f66614d391b2514188=
bf

I don't know if it has something to do with it?

Yours,
Linus Walleij

