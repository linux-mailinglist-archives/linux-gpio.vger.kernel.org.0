Return-Path: <linux-gpio+bounces-25204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B36B3BEC6
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 17:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED48B7B9B71
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 14:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE070320CD5;
	Fri, 29 Aug 2025 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q94crDi4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3C81E25F9
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479674; cv=none; b=NDqTi2cdfIIdZxngMWHneBdzmplOlEaN//IAZUXSZylKg1w6jpqwVqTiPbAHIW/Q7Iio9r3zG5IN7FP7bntJDHo9GKV3lY7CxZXjBoK658Cx9eSexjyoTJUa95lDJn/+86LsLLUEIXGdhETyDD9T4hzZIZpBURTxYc1WSIPUyqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479674; c=relaxed/simple;
	bh=eVcDWAKsG2pqTnHynGtVH0rXfHfKA2B1ft7n+ADWqTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxW1e9H3XrEfaFUocOtcBAe2/kZZzWinuCI6aq4mQfspUkgrJBtTEGZy8CVmGXVop4bSJT6LUCVWBei4TmynlFpDT4WyQIU/3y3wPkInnua5mBSi3f724V/AtUCIjy/gIm0muA8OFkS5LRq8L6N+a8mwjU3qAT85QiTRHux+YwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q94crDi4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258F7C4CEF7
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756479673;
	bh=eVcDWAKsG2pqTnHynGtVH0rXfHfKA2B1ft7n+ADWqTY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q94crDi4vbmo9H/LHysmFCgm5F4YFtdYePoFkFOAAU0VuM9vDyRSfAIucrynyd37j
	 HiCRDr1J1jfHq6ryLE2/WDgQcFBEvQBtBu7cbl4cxPkgBOuDSVW+4pU7lad74FHyFR
	 eiUwDNymRruiqyECWAJEpWPEiGuaYTtgPMf614q+wlHAAJQGvCjlrL5v6K0dhd0Rc1
	 XNi+2uBFqh3l1RecIeHL4TVD1fyp/K5wD0yBGQUl5qKlhIeU1BnCpuOTDjtWmlZWVt
	 kHQlWsUbFdUSlJlDd6WRawEcZk4BKHdtYfw0wsa2ZWwoTmuDyNXX4mY6tu5U3MXovo
	 frWJJpw8mQbtg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61d106ce455so875764a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 08:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDRJVn0wesxD+s/mSMgrbea7fr0qK0aVs2IEd72Fc1LqZlDfO4I5cDUwmI7MFL+igxB1+BNDh4a07y@vger.kernel.org
X-Gm-Message-State: AOJu0YycRZv9R9YGWWadmnb6+rj3kSvYy8vD9ymU2febpFSDwHVNiwBP
	6j2Pxn4TH9i/toFLgwcA5ARnm7t+sbBBSTEenPxPNYMhm0RV9kMjVzbcRJrxDfw1H/u6nfxKQa0
	rP00IPHzNfQJ+WslNLbIG0EiRAcbg6A==
X-Google-Smtp-Source: AGHT+IGN8zM5unY+/uYVSVQY2Eg+eLwoAiDTenVoTa4Ls54KI1qyzf8j8qkgdEx5xryTn7Wt9r8y+W+t867uVoOuYls=
X-Received: by 2002:a05:6402:13d5:b0:61c:6e16:4d73 with SMTP id
 4fb4d7f45d1cf-61c983b7fadmr10740680a12.2.1756479671619; Fri, 29 Aug 2025
 08:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ06_3bgiWfPjQy3JRgtzq5vcr4FgR9JrzTFrGKOxTe52A@mail.gmail.com>
 <CAL_Jsq+_aYAM8V7UmhCP-74BRpwv_vfzHeFrWvxmc=TLT+7oQw@mail.gmail.com>
 <CAMEGJJ1gOMhe3-+6UD=gzPOqCpbuXmA9aSpytJ66JbpJ9w3fvA@mail.gmail.com>
 <CAL_JsqL1wrN32WXa6qP+hVvxtnkaxqbbf-EP=pKCOkzTzmbgMw@mail.gmail.com> <CAMEGJJ2601iPngUtfhi1X5R2em=y0or+y216qVojzsunb6v++A@mail.gmail.com>
In-Reply-To: <CAMEGJJ2601iPngUtfhi1X5R2em=y0or+y216qVojzsunb6v++A@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 29 Aug 2025 10:00:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKdX6+f8DBRn=L7_EFeGcv30mcQdfXWQtnW1m31aDoGGw@mail.gmail.com>
X-Gm-Features: Ac12FXygdeKEc8JlhQBer9_QJMoSuQJvlWWImD4GvVw4cGWgakSau_Pk1U_uv2w
Message-ID: <CAL_JsqKdX6+f8DBRn=L7_EFeGcv30mcQdfXWQtnW1m31aDoGGw@mail.gmail.com>
Subject: Re: pinctrl, probe order, and CONFIG_MODULES
To: Phil Elwell <phil@raspberrypi.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 9:52=E2=80=AFAM Phil Elwell <phil@raspberrypi.com> =
wrote:
>
> On Fri, 29 Aug 2025 at 15:44, Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Aug 29, 2025 at 8:35=E2=80=AFAM Phil Elwell <phil@raspberrypi.c=
om> wrote:
> > >
> > > Hi Rob,
> > >
> > > On Fri, 29 Aug 2025 at 14:25, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Fri, Aug 29, 2025 at 5:37=E2=80=AFAM Phil Elwell <phil@raspberry=
pi.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > A Raspberry Pi user recently asked us why I2C wasn't working in t=
heir
> > > > > custom kernel build. The primary change they had made was to trim=
 the
> > > > > number of enabled drivers, make them all built-in, and to remove
> > > > > CONFIG_MODULES=3Dy. The end result of this is that the pin muxing
> > > > > required for I2C to work was not being applied, leaving the inter=
face
> > > > > talking to thin air.
> > > > >
> > > > > I eventually traced the failure back to this change:
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/drivers/pinctrl/devicetree.c?h=3Dnext-20250829&id=3Dd19c5e79d46ef=
df89306be99f3c8824cf58e35f6
> > > > > It introduces a requirement for CONFIG_MODULES to be enabled in o=
rder
> > > > > to get an EPROBE_DEFER in the event that the pinctrl driver has n=
ot
> > > > > yet been probed. Without CONFIG_MODULES, the pinctrl requirements=
 are
> > > > > waived. Removing the IS_ENABLED(CONFIG_MODULES) clause allows the
> > > > > probing of the I2C driver to be deferred, fixing the user's probl=
em.
> > > > >
> > > > > Is this requirement for supporting modules reasonable?
> > > >
> > > > That's not the requirement. If CONFIG_MODULES=3Dn, then we only def=
er
> > > > probes until late_initcall because after that point no more drivers
> > > > are going to load. If CONFIG_MODULES=3Dy, then deferring probe is b=
ased
> > > > on a timeout which can be disabled.
> > >
> > > Thanks for replying. I'm probably missing something here, but if the
> > > pinctrl and I2C drivers are both regular platform drivers, what is to
> > > stop the I2C driver being probed first?
> >
> > Nothing, but it should defer unless you've reached late initcall or
> > you've set "pinctrl-use-default".
>
> From the "next" tree:
>
> if (!np_pctldev || of_node_is_root(np_pctldev)) {
>         of_node_put(np_pctldev);
>         ret =3D -ENODEV;
>         /* keep deferring if modules are enabled */
>         if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret < 0)
>                 ret =3D -EPROBE_DEFER;
>         return ret;
> }
>
> Unless CONFIG_MODULES=3Dy you get ENODEV.

Indeed, as 'ret =3D driver_deferred_probe_check_state(p->dev);' is gone due=
 to:

commit 24a026f85241a01bbcfe1b263caeeaa9a79bab40
Author: Saravana Kannan <saravanak@google.com>
Date:   Wed Jun 1 00:06:58 2022 -0700

    pinctrl: devicetree: Delete usage of driver_deferred_probe_check_state(=
)

    Now that fw_devlink=3Don by default and fw_devlink supports
    "pinctrl-[0-8]" property, the execution will never get to the point
    where driver_deferred_probe_check_state() is called before the supplier
    has probed successfully or before deferred probe timeout has expired.

    So, delete the call and replace it with -ENODEV.

    Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Signed-off-by: Saravana Kannan <saravanak@google.com>
    Link: https://lore.kernel.org/r/20220601070707.3946847-3-saravanak@goog=
le.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


So fw_devlink will ensure that pinctrl probes first. Is that turned
off by chance (kernel cmdline is the only way to disable).

Rob

