Return-Path: <linux-gpio+bounces-25206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64759B3C004
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 17:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4EBC3A2CFB
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 15:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7458322DC4;
	Fri, 29 Aug 2025 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="U81Leg/y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E15E32277B
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756482706; cv=none; b=GqlTorz9RLZYpuEMeqEN/vJ/fuHW+mhMfwqT7ePeP1xoHdRh594OEV2QVfmxSE3Jj1uk2gXl5QRrqWRA8LI4E2CPZhgSsbgNpVotBsXXB/oNxCdnydgnxxBw3eFsFIHeAT/QFv9QQ2ej2iyEFjxByqhpNTdgt6aaUBuSSvkBbN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756482706; c=relaxed/simple;
	bh=UEkfwqonx1pWOt0dvt0yRnzDZQX9ep4y++uyIGco0os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRb1n/wirXaF2oedS2OjSLOCUsA8Fc25ExwEpJktjoF0Rw7Ff5Kc9O9OZltYAaVW3lfS9I7b6kjQ3XB0xidACde/alcEKhD0GKQgOMtdZT90rc8TwNB2uK1+PovKQZi+8CdeiYrPb/nKbJdrSZf99EI4wWQZDxNPWaaReThsRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=U81Leg/y; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb73394b4so331452866b.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1756482703; x=1757087503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mC6W2FnI5tgxxAJ9GYOEuso/uKPjkyU8qkxMQI052G8=;
        b=U81Leg/ys07/EHNKcBBP+RJRNyyrVQirBhEqtQMiJMGhEjMxDmiueop8ip+MQqX5r9
         nb7KjooihXqXMhAMnlw9MyFT+KmKLBlnobfR5x/DA5lNJ3iNlwXjMLCB5Pvr6g9K2XiG
         sA/hqFmLy8zPm4XPidf3cg90MtipBAgs1IF8UZ0HreYkjbKNjcMjTbGqCdh+a7Rga1ho
         QsGJyJm3X57xEJyQmym9p/g4+XFjnMZiVDKEjfWCUNYiFgaA9peXtD0Ub1GtVata9e3G
         zXQVgGPp3CoNaXTMIEHeWr6BfD89LH8zElH1nPmUUshpQQD7rwFksyl+wAX3Abje7Yp7
         OIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756482703; x=1757087503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mC6W2FnI5tgxxAJ9GYOEuso/uKPjkyU8qkxMQI052G8=;
        b=nua4nrU3TAxZF1JFarJ/gpcRTBtSTL0wpsuwzGQYsGxoSXQhgIEXPKVQAYveZULnxT
         bi/ZJcB1lrmVWQF/+aRQSwKr4RVzbrC/lCq1tAfHliH1a3hzZGvM1WpOoQwJBI0QllYt
         N1jGv0mJh0mRI8HKa2c0XtZ0bH1JmoizGs+BJX9mprGrpya8s1KIKm7tHgLPnqYu53AZ
         YpSO9YdArLyRjvg3EHJEGP0nZbn3yN0FOFIQyQTHLvDV2gzfnM2SvB3sdfF1h74qZvPh
         1ftOHB3an5dWbrZ6QjaqCIBa+l8Gfo0T3KLGdP6Q2MDazboxMA9NCRKQFZjIDkDgsxzk
         ev6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYCKcvG+kBAT86tVEDM1Rw8Gss+xLfHZ1ibAFSp39ykTXm9EorAnz1qmfHKf/7NeWg1p7oNuFW9IwQ@vger.kernel.org
X-Gm-Message-State: AOJu0YygRb0Tw6Md43AELjn44FWXsLWByRlcvHXvOZ/dPQEHgfmFkRlj
	UWyrvUZAiN8YBwKpISeukrJt92SNY7+yAAz9rPBIp0bdTKYVdYFI0IWp9k+hV2ilIBLlZVn2mxl
	30gSJKj2vSK6/LTXD324Yp+hb7sOi/A+C/Yw0zafXMBXAPEV1emj0wkk=
X-Gm-Gg: ASbGnctE3GPtJdp1Fh9kTktlHpPlzi3W7PkQFlnwR5uE2KHo8+JNuAJFH3UdL6wsqHU
	1oplEDeKso08zSsdtfXQrgmtyeuAbo5g4iukBmoleCDnCp+YmwyAbLP/3yDv1kCs2cmrB3Bk3B7
	s+2fPmqfy0yoh0VpYNu/RsCj8imdLAf/R/PPIWeFyxlYrtRV+ehGFIAX2QwZ412T7dbzKYr8jvh
	uQ/9+In6qiHXRJNKlCbc4E09O/UX4k+Z/XoKROXi3hN86zpww==
X-Google-Smtp-Source: AGHT+IGM3OJDyTdlMeSWWA1SjB5VcWWr3dJX1sP1UR82A8RzXtTtKSnloPE03jvC2fjFcQSE6cB9nqgilvRt4jHX1js=
X-Received: by 2002:a17:907:2d07:b0:af9:4075:4ea5 with SMTP id
 a640c23a62f3a-afe28f5ba80mr2806312566b.25.1756482702762; Fri, 29 Aug 2025
 08:51:42 -0700 (PDT)
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
 <CAMEGJJ2601iPngUtfhi1X5R2em=y0or+y216qVojzsunb6v++A@mail.gmail.com> <CAL_JsqKdX6+f8DBRn=L7_EFeGcv30mcQdfXWQtnW1m31aDoGGw@mail.gmail.com>
In-Reply-To: <CAL_JsqKdX6+f8DBRn=L7_EFeGcv30mcQdfXWQtnW1m31aDoGGw@mail.gmail.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Fri, 29 Aug 2025 16:51:30 +0100
X-Gm-Features: Ac12FXztdknOExxR2I0drjP-VEcloXdOAG1Ieh64k4ui-8WRAiQYBv5ATXCwiGQ
Message-ID: <CAMEGJJ2EF_rdD7fOpkpO7EvmOjMt4FF41ut=Vjy-e3x3+oYSBg@mail.gmail.com>
Subject: Re: pinctrl, probe order, and CONFIG_MODULES
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Aug 2025 at 16:01, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Aug 29, 2025 at 9:52=E2=80=AFAM Phil Elwell <phil@raspberrypi.com=
> wrote:
> >
> > On Fri, 29 Aug 2025 at 15:44, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Aug 29, 2025 at 8:35=E2=80=AFAM Phil Elwell <phil@raspberrypi=
.com> wrote:
> > > >
> > > > Hi Rob,
> > > >
> > > > On Fri, 29 Aug 2025 at 14:25, Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Fri, Aug 29, 2025 at 5:37=E2=80=AFAM Phil Elwell <phil@raspber=
rypi.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > A Raspberry Pi user recently asked us why I2C wasn't working in=
 their
> > > > > > custom kernel build. The primary change they had made was to tr=
im the
> > > > > > number of enabled drivers, make them all built-in, and to remov=
e
> > > > > > CONFIG_MODULES=3Dy. The end result of this is that the pin muxi=
ng
> > > > > > required for I2C to work was not being applied, leaving the int=
erface
> > > > > > talking to thin air.
> > > > > >
> > > > > > I eventually traced the failure back to this change:
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/drivers/pinctrl/devicetree.c?h=3Dnext-20250829&id=3Dd19c5e79d46=
efdf89306be99f3c8824cf58e35f6
> > > > > > It introduces a requirement for CONFIG_MODULES to be enabled in=
 order
> > > > > > to get an EPROBE_DEFER in the event that the pinctrl driver has=
 not
> > > > > > yet been probed. Without CONFIG_MODULES, the pinctrl requiremen=
ts are
> > > > > > waived. Removing the IS_ENABLED(CONFIG_MODULES) clause allows t=
he
> > > > > > probing of the I2C driver to be deferred, fixing the user's pro=
blem.
> > > > > >
> > > > > > Is this requirement for supporting modules reasonable?
> > > > >
> > > > > That's not the requirement. If CONFIG_MODULES=3Dn, then we only d=
efer
> > > > > probes until late_initcall because after that point no more drive=
rs
> > > > > are going to load. If CONFIG_MODULES=3Dy, then deferring probe is=
 based
> > > > > on a timeout which can be disabled.
> > > >
> > > > Thanks for replying. I'm probably missing something here, but if th=
e
> > > > pinctrl and I2C drivers are both regular platform drivers, what is =
to
> > > > stop the I2C driver being probed first?
> > >
> > > Nothing, but it should defer unless you've reached late initcall or
> > > you've set "pinctrl-use-default".
> >
> > From the "next" tree:
> >
> > if (!np_pctldev || of_node_is_root(np_pctldev)) {
> >         of_node_put(np_pctldev);
> >         ret =3D -ENODEV;
> >         /* keep deferring if modules are enabled */
> >         if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret < 0)
> >                 ret =3D -EPROBE_DEFER;
> >         return ret;
> > }
> >
> > Unless CONFIG_MODULES=3Dy you get ENODEV.
>
> Indeed, as 'ret =3D driver_deferred_probe_check_state(p->dev);' is gone d=
ue to:
>
> commit 24a026f85241a01bbcfe1b263caeeaa9a79bab40
> Author: Saravana Kannan <saravanak@google.com>
> Date:   Wed Jun 1 00:06:58 2022 -0700
>
>     pinctrl: devicetree: Delete usage of driver_deferred_probe_check_stat=
e()
>
>     Now that fw_devlink=3Don by default and fw_devlink supports
>     "pinctrl-[0-8]" property, the execution will never get to the point
>     where driver_deferred_probe_check_state() is called before the suppli=
er
>     has probed successfully or before deferred probe timeout has expired.
>
>     So, delete the call and replace it with -ENODEV.
>
>     Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>     Signed-off-by: Saravana Kannan <saravanak@google.com>
>     Link: https://lore.kernel.org/r/20220601070707.3946847-3-saravanak@go=
ogle.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
>
> So fw_devlink will ensure that pinctrl probes first. Is that turned
> off by chance (kernel cmdline is the only way to disable).

No, I don't think it's turned off. After a bit more digging I'm
starting to think that of_fwnode_add_links doesn't work in the pinctrl
case because the pinctrl-n properties are links to children of the
pinctrl controller, not the controller itself. Perhaps they're not
simple enough to be declared with DEFINE_SIMPLE_PROP and need a custom
parser that returns the parent instead?

Phil

