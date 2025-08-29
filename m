Return-Path: <linux-gpio+bounces-25203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45238B3BE90
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 16:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0BB188C90D
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 14:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FEB31B10A;
	Fri, 29 Aug 2025 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="f5UcwrHN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAB41C84DE
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479174; cv=none; b=JAlaYBhdimdHbeEdX94Y8AHf8VkhCjx4E5VPkXNlpqMX+8/MTunujlfeDVe5V6KXf86TqttCHIZMLcMsDHL8uRWwDbkGFRvm+2pvPtxc2g/iyM0HX+EjlufEnKTRDOhVIP8QfuQfsTBqyh2D6/BxNQFboYHcOeaJ6DKW4+XGslU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479174; c=relaxed/simple;
	bh=mg1JXbMpj8xY//UpfhV9zOluThqy9iaBkL0Che9KLs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tuna7oNd9kw/Ak0x3j0ndpduPB1ubGNp+hiRJkBoYAab9qH7Q+jCya9UfJj+ScfJaW2ngGxw+Jt7PSLuBkpJteO+hVVwAjt7qsbc3vhDN+P/p0hAkub6vRBKwe0iujT3n2lORFVCIQCzmmxO3pc1yOkjJzCx4vOXRVWyJ2TQ3gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=f5UcwrHN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7a16441so320102566b.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1756479170; x=1757083970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRxh2tvVbmnFpf84Y3R8p45BTUpaYE3N2s0vQRjCQrM=;
        b=f5UcwrHNjxB72f7xWKFKalU92x2bZY2mzd0XdU9K+MXEWeMXo5hQxkZvAaTRFVnY9W
         W3W2J6Al336kgG5afPakUnOc/gKhRwtHhNSk+iifgsnlwuFriI82A3rsz3OqrjVS66Sw
         IRlV1tP2UhgvD8/g7g6qDjbjyYEzU0q6TZeUNnoYNyVgOr8MKJIB7ee12jRHL5VqUktF
         tSFBkCyxESQQenpPkKK14aWzZMYDXt9Gsx12dOlmH4ooHjI0/3zhGxTrbwmtConYj0A+
         nAFQE6Q5VZLtnkrBHAU0ofx42ssGVYVNsHNmaFAu8MqqC5L58Gr2FVNWsgCI31zkZCmB
         3bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756479170; x=1757083970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRxh2tvVbmnFpf84Y3R8p45BTUpaYE3N2s0vQRjCQrM=;
        b=HCJyekvbKRyeEjYglxF1rtvLh7/65hIWYLltUj6HBfcsP/C/tnlHdYZ0twNv86Zjyb
         C0IRX9NyDrOaAALi9f7IjXWduNrcM0RDSNpLCV3dxpfzNuEaicyJrcULBjSkQ32/uVTY
         jpgvIt/qigkwXXgN0oW2f4eFhv10xXD46wdIjV3HY2iUNv3/iDW9r5LmKS8+VCIU11rB
         RINHzFrASRvi46+eqyTGIfOZLXTKVIKUNlIinbLfP+TifduAq7uB82/pxrsjwTZr7AkY
         GCuL6mUOmZLI0P5FIau++zc5CoB/m5MsCkBwQafJAZugb0F/yJe/199/b5yWXfauugVU
         zkfw==
X-Forwarded-Encrypted: i=1; AJvYcCVxoJ+vSDP+krg3Fo+bVwBQaq98QaTUPX8niWWurxg5+EoqT7T5sopHc4KfFOnAAI/49WGtCd+E4OXw@vger.kernel.org
X-Gm-Message-State: AOJu0YwYRbmCxjQx3sLySMcYgojDdn+GBzos7gfzjbHRpAmXuR+SYNo6
	IyeeRWN/FtOb1woqsNyyVsi8Q5iec45L+nnw2oc/vWcQrn8Fkrxg6nLQAU41ELMYBSQ/59UUKJB
	Zxp7HrJ4XzsELaD3VcroDekJ9YWXZ0KGBaf3xTiRvpw==
X-Gm-Gg: ASbGnctw/EwNnqZgMH1p+OjUSsLOX6vpRMmhF71FjGLwdE3ESIc5tlIaL71Hlsnps2Q
	oTlHsUCYI5sB6OYlGf9EX8OBbZqHrcFuIMno/jhNxX190Bx4U4drmQxPqeRmVEw5APMhniGmIHo
	KTE6Wbj1KVCg2Y2sZtZ8kge0wyochWru6JgTSw/Etc90lvOE6JXtQVA6/JEjhrvEMw3gN5kKRu8
	uCLxzXjCdi2Bpn0OSrsdxi+B5aP8Vb6GxD0wTJceoanUIXazg==
X-Google-Smtp-Source: AGHT+IHbl1KfwByqjmaLzbK8Lr9WGlfqxciNKA04EEl1o2fKV1kb0zHBrXbQKECpvi/LGUDOiAU8jvr7R4grefBUI+o=
X-Received: by 2002:a17:907:7ea9:b0:afe:11:2141 with SMTP id
 a640c23a62f3a-afe2953815amr2910298166b.31.1756479169897; Fri, 29 Aug 2025
 07:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ06_3bgiWfPjQy3JRgtzq5vcr4FgR9JrzTFrGKOxTe52A@mail.gmail.com>
 <CAL_Jsq+_aYAM8V7UmhCP-74BRpwv_vfzHeFrWvxmc=TLT+7oQw@mail.gmail.com>
 <CAMEGJJ1gOMhe3-+6UD=gzPOqCpbuXmA9aSpytJ66JbpJ9w3fvA@mail.gmail.com> <CAL_JsqL1wrN32WXa6qP+hVvxtnkaxqbbf-EP=pKCOkzTzmbgMw@mail.gmail.com>
In-Reply-To: <CAL_JsqL1wrN32WXa6qP+hVvxtnkaxqbbf-EP=pKCOkzTzmbgMw@mail.gmail.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Fri, 29 Aug 2025 15:52:37 +0100
X-Gm-Features: Ac12FXzijrGAYdi4AQLvjeA8HQHPuyl6mnrxhigyYtsr81ZWJSjMyn4xAbD8tvc
Message-ID: <CAMEGJJ2601iPngUtfhi1X5R2em=y0or+y216qVojzsunb6v++A@mail.gmail.com>
Subject: Re: pinctrl, probe order, and CONFIG_MODULES
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Aug 2025 at 15:44, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Aug 29, 2025 at 8:35=E2=80=AFAM Phil Elwell <phil@raspberrypi.com=
> wrote:
> >
> > Hi Rob,
> >
> > On Fri, 29 Aug 2025 at 14:25, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Aug 29, 2025 at 5:37=E2=80=AFAM Phil Elwell <phil@raspberrypi=
.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > A Raspberry Pi user recently asked us why I2C wasn't working in the=
ir
> > > > custom kernel build. The primary change they had made was to trim t=
he
> > > > number of enabled drivers, make them all built-in, and to remove
> > > > CONFIG_MODULES=3Dy. The end result of this is that the pin muxing
> > > > required for I2C to work was not being applied, leaving the interfa=
ce
> > > > talking to thin air.
> > > >
> > > > I eventually traced the failure back to this change:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
/commit/drivers/pinctrl/devicetree.c?h=3Dnext-20250829&id=3Dd19c5e79d46efdf=
89306be99f3c8824cf58e35f6
> > > > It introduces a requirement for CONFIG_MODULES to be enabled in ord=
er
> > > > to get an EPROBE_DEFER in the event that the pinctrl driver has not
> > > > yet been probed. Without CONFIG_MODULES, the pinctrl requirements a=
re
> > > > waived. Removing the IS_ENABLED(CONFIG_MODULES) clause allows the
> > > > probing of the I2C driver to be deferred, fixing the user's problem=
.
> > > >
> > > > Is this requirement for supporting modules reasonable?
> > >
> > > That's not the requirement. If CONFIG_MODULES=3Dn, then we only defer
> > > probes until late_initcall because after that point no more drivers
> > > are going to load. If CONFIG_MODULES=3Dy, then deferring probe is bas=
ed
> > > on a timeout which can be disabled.
> >
> > Thanks for replying. I'm probably missing something here, but if the
> > pinctrl and I2C drivers are both regular platform drivers, what is to
> > stop the I2C driver being probed first?
>
> Nothing, but it should defer unless you've reached late initcall or
> you've set "pinctrl-use-default".

From the "next" tree:

if (!np_pctldev || of_node_is_root(np_pctldev)) {
        of_node_put(np_pctldev);
        ret =3D -ENODEV;
        /* keep deferring if modules are enabled */
        if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret < 0)
                ret =3D -EPROBE_DEFER;
        return ret;
}

Unless CONFIG_MODULES=3Dy you get ENODEV.

Phil

