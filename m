Return-Path: <linux-gpio+bounces-25348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F1AB3F854
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 10:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4AD33B02A9
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 08:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E911A2E7F2C;
	Tue,  2 Sep 2025 08:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TioBgoTP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7C62E2DDD
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756801742; cv=none; b=NXUs7FNg68w4Z5B1gDdqAa7lfcRRCmfhCFAC5KfIQFcWyaFhqufO1tR02cPkgI7DJgCYYiN27W/X5SpKq6yiDqa1xV+fArW2WrlZpddO30a1WCHAd36BcncKQ3Z4CmlvOczx0Yrkyy+hhz5ol7rmWfGYaM7RePeH7qkiqObsjp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756801742; c=relaxed/simple;
	bh=eiOfLQtxKi6UhFrCzTD8qAyHPdiQ7y2+cF6R0iIS+rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UC4pyCeSO+ZWKuHeWFv0J5aL4Fl1xrrT/Axpa6smUQ7OmgLmzQrWOUyQsyMyMyuUqMIUEeFlN94BlGpWHL1lcm03H1w5oSp1EkD5JAp1OiG9MInMGZj0TJtvpT8YGQhfRyVRv7JoDz/DPnZrxIvhMWUNQM0Cq7iQzUgWb+FvDh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=TioBgoTP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afede1b3d05so848358966b.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 01:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1756801738; x=1757406538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA9ptwcwYfk4OsiGd6RqQUrseDRHURx3AjlwUjkyR7w=;
        b=TioBgoTPbLOoorTXFcQ3lRomXryZ0awasIJlm3DlFucNx6+uo+NLNW1Tm/rqPAOSTx
         ZzLOdDbcQcXHkTps6CVEb+fRXx2VcQkX9BEFaWLWQfXkuJEG8prx19TcsR9w8pJ4FpYb
         rIUW5giI4CBbPsQzLybUGCtcl5Lc25yrMydjZJWLIQxIFoSYa6b1NGh7YgsROa7G2/I1
         O3cU1nHPvAO6ZxqPIHdFs/36PnNUkWpp20J9xBUNnYSjdEkQanDcMPOpnHqdK+6EnujX
         dk9PxwRJrHxNtc+mszrg3YuGeLmXGOaAzYBXvNc3gO70wdefOovMMVg5MvIKtIN1Q3OU
         fIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756801738; x=1757406538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nA9ptwcwYfk4OsiGd6RqQUrseDRHURx3AjlwUjkyR7w=;
        b=UzQhPQspZOucr+5YjnKWJ6rTxto+YPvMtpBJunpJVcXOZg5JfMS2RGf7evnrU7hK6l
         hcjTgotEq32NGueoFzsKvglx3fet0LHHiVdKFz1Biwljl5/yZhFMB2+34v9rHUyCMYdW
         HWjt8FvvybVt0aFFAN683P5JJpmBxpt/8Hsb+v4KmibOCe2ISwilLKv0a8OzBHTGoZto
         MOZNBpazRAu/bO9m82FDXKKzEninhT9l1Z896mP3Yj70FSRkQbIcKvPsJ6+eOyF4EOM+
         6PbP7CQzxjEHSRWk67Gd5bd7f0B8LeVui2+sgcdZKPmduMyML74t2ddla1hnviABIdTr
         mmnw==
X-Forwarded-Encrypted: i=1; AJvYcCWYpG6mPHTLIuG7QKBvyRt5fwtKbykfXGKFWO4+/QGfr7WcyQi+UsmalPsoX2OOq35LgQUR9/N0nS3P@vger.kernel.org
X-Gm-Message-State: AOJu0YwZPd7w9VWezLGOv0e/4wqFK0PXYvOMbNA5a358gejPJeWauL4s
	RB7CLawLeeWru4odusn0k9lXB77JJonZkgLOyCCzl5Iw7S0kYth9cMKKnklZIwLKy7Hc1V6djtq
	QHPAiNP1glbAHx/Qs+yH9atOZUaD29k03OUp+wfmoMA==
X-Gm-Gg: ASbGnctpAg95RsjVKVgsrIkQFsbSsQ5NNTpNYyGsiQ/xuJ5hWN39WtZFpCb7PdOFnVA
	egs+Iz+9kSq/iX6ypvI0tGy8dVew5wewi25i+59+rutF5kEETI+1Ry9gmvxM5utNj1RV2jQNOi1
	e5DuGBg10oI2TpaRBn/wdNnNW9rMBuKwaqURO/n3AUHH0i0RDDWAG8gH71Jzdfqn2GCeIlng9Zf
	z0Hq3dAhAiF668VgC5ZJdKnunzxvAA1LUxiPy4=
X-Google-Smtp-Source: AGHT+IH51MttngI0bj6BhQ7J5Zvxo7UaWC3YMUGSue7CqtWSlS2+ajsTLTU0WpILbHSG2c2/XdtYQSgaQQkoxqflzL0=
X-Received: by 2002:a17:907:9623:b0:b04:388f:224 with SMTP id
 a640c23a62f3a-b04388f4a0amr499862766b.1.1756801738282; Tue, 02 Sep 2025
 01:28:58 -0700 (PDT)
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
 <CAL_JsqKdX6+f8DBRn=L7_EFeGcv30mcQdfXWQtnW1m31aDoGGw@mail.gmail.com>
 <CAMEGJJ2EF_rdD7fOpkpO7EvmOjMt4FF41ut=Vjy-e3x3+oYSBg@mail.gmail.com> <CACRpkdZ3hZBK4AMfVHgFVpNdRL3FSLxeVPN+kWEkf6pMV0oQhw@mail.gmail.com>
In-Reply-To: <CACRpkdZ3hZBK4AMfVHgFVpNdRL3FSLxeVPN+kWEkf6pMV0oQhw@mail.gmail.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Tue, 2 Sep 2025 09:28:46 +0100
X-Gm-Features: Ac12FXwExA0MMsfpFbHC-2QxBiJxKfDcMLQSyQNk1z08S6FYZD_wLSKEu_oPMqc
Message-ID: <CAMEGJJ0Lbm3gZS8+a3ghUwMkBEr8TFgiPL0WGCLX7pAKuaSxBQ@mail.gmail.com>
Subject: Re: pinctrl, probe order, and CONFIG_MODULES
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus, Rob,

On Fri, 29 Aug 2025 at 23:43, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Fri, Aug 29, 2025 at 5:51=E2=80=AFPM Phil Elwell <phil@raspberrypi.com=
> wrote:
> > On Fri, 29 Aug 2025 at 16:01, Rob Herring <robh@kernel.org> wrote:
> > > On Fri, Aug 29, 2025 at 9:52=E2=80=AFAM Phil Elwell <phil@raspberrypi=
.com> wrote:
> > > > On Fri, 29 Aug 2025 at 15:44, Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Fri, Aug 29, 2025 at 8:35=E2=80=AFAM Phil Elwell <phil@raspber=
rypi.com> wrote:
> > > > > >
> > > > > > Hi Rob,
> > > > > >
> > > > > > On Fri, 29 Aug 2025 at 14:25, Rob Herring <robh@kernel.org> wro=
te:
> > > > > > >
> > > > > > > On Fri, Aug 29, 2025 at 5:37=E2=80=AFAM Phil Elwell <phil@ras=
pberrypi.com> wrote:
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > A Raspberry Pi user recently asked us why I2C wasn't workin=
g in their
> > > > > > > > custom kernel build. The primary change they had made was t=
o trim the
> > > > > > > > number of enabled drivers, make them all built-in, and to r=
emove
> > > > > > > > CONFIG_MODULES=3Dy. The end result of this is that the pin =
muxing
> > > > > > > > required for I2C to work was not being applied, leaving the=
 interface
> > > > > > > > talking to thin air.
> > > > > > > >
> > > > > > > > I eventually traced the failure back to this change:
> > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git/commit/drivers/pinctrl/devicetree.c?h=3Dnext-20250829&id=3Dd19c5e7=
9d46efdf89306be99f3c8824cf58e35f6
> > > > > > > > It introduces a requirement for CONFIG_MODULES to be enable=
d in order
> > > > > > > > to get an EPROBE_DEFER in the event that the pinctrl driver=
 has not
> > > > > > > > yet been probed. Without CONFIG_MODULES, the pinctrl requir=
ements are
> > > > > > > > waived. Removing the IS_ENABLED(CONFIG_MODULES) clause allo=
ws the
> > > > > > > > probing of the I2C driver to be deferred, fixing the user's=
 problem.
> > > > > > > >
> > > > > > > > Is this requirement for supporting modules reasonable?
> > > > > > >
> > > > > > > That's not the requirement. If CONFIG_MODULES=3Dn, then we on=
ly defer
> > > > > > > probes until late_initcall because after that point no more d=
rivers
> > > > > > > are going to load. If CONFIG_MODULES=3Dy, then deferring prob=
e is based
> > > > > > > on a timeout which can be disabled.
> > > > > >
> > > > > > Thanks for replying. I'm probably missing something here, but i=
f the
> > > > > > pinctrl and I2C drivers are both regular platform drivers, what=
 is to
> > > > > > stop the I2C driver being probed first?
> > > > >
> > > > > Nothing, but it should defer unless you've reached late initcall =
or
> > > > > you've set "pinctrl-use-default".
> > > >
> > > > From the "next" tree:
> > > >
> > > > if (!np_pctldev || of_node_is_root(np_pctldev)) {
> > > >         of_node_put(np_pctldev);
> > > >         ret =3D -ENODEV;
> > > >         /* keep deferring if modules are enabled */
> > > >         if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret < 0=
)
> > > >                 ret =3D -EPROBE_DEFER;
> > > >         return ret;
> > > > }
> > > >
> > > > Unless CONFIG_MODULES=3Dy you get ENODEV.
> > >
> > > Indeed, as 'ret =3D driver_deferred_probe_check_state(p->dev);' is go=
ne due to:
> > >
> > > commit 24a026f85241a01bbcfe1b263caeeaa9a79bab40
> > > Author: Saravana Kannan <saravanak@google.com>
> > > Date:   Wed Jun 1 00:06:58 2022 -0700
> > >
> > >     pinctrl: devicetree: Delete usage of driver_deferred_probe_check_=
state()
> > >
> > >     Now that fw_devlink=3Don by default and fw_devlink supports
> > >     "pinctrl-[0-8]" property, the execution will never get to the poi=
nt
> > >     where driver_deferred_probe_check_state() is called before the su=
pplier
> > >     has probed successfully or before deferred probe timeout has expi=
red.
> > >
> > >     So, delete the call and replace it with -ENODEV.
> > >
> > >     Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >     Signed-off-by: Saravana Kannan <saravanak@google.com>
> > >     Link: https://lore.kernel.org/r/20220601070707.3946847-3-saravana=
k@google.com
> > >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >
> > >
> > > So fw_devlink will ensure that pinctrl probes first. Is that turned
> > > off by chance (kernel cmdline is the only way to disable).
> >
> > No, I don't think it's turned off. After a bit more digging I'm
> > starting to think that of_fwnode_add_links doesn't work in the pinctrl
> > case because the pinctrl-n properties are links to children of the
> > pinctrl controller, not the controller itself. Perhaps they're not
> > simple enough to be declared with DEFINE_SIMPLE_PROP and need a custom
> > parser that returns the parent instead?
>
> Have you tried setting this property in the pin controller?
>
> $ git grep link_consumers drivers/pinctrl/
> drivers/pinctrl/core.c: if (pctldev->desc->link_consumers)
> drivers/pinctrl/pinctrl-stmfx.c:        pctl->pctl_desc.link_consumers =
=3D true;
> drivers/pinctrl/stm32/pinctrl-stm32.c:  pctl->pctl_desc.link_consumers =
=3D true;
>
> Maybe it should be the default.
>
> 5+ years ago I patched something like this but thought it was
> too invasive:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/=
commit/?h=3Dconsumer-link-enforce&id=3D73441cf773ed91bff0e7f66614d391b25141=
88bf
>
> I don't know if it has something to do with it?

Using the information you've provided, further investigation uncovered
that the conversion of the supplier/consumer relationships from fwlink
to device link was rejecting many of the dependencies because an
ancestor was marked as initialised but with no device pointer. The
ancestor in this case is the RP1 I/O chip used on Raspberry Pi 5 - a
PCIe device whose content is described in Device Tree. Ensuring that
the device pointer is initialised allows the device link feature to
work as expected. It remains to be seen if the upstream RP1 driver
will need a similar patch for the no-modules corner case.

Thanks for your help,

Phil

