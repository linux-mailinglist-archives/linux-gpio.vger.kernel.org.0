Return-Path: <linux-gpio+bounces-27573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 729CAC049DE
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 09:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BCA03ABDAC
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 07:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F253298CA5;
	Fri, 24 Oct 2025 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RC0q6565"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6A29617D
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761289611; cv=none; b=XdsW4cvuSmESqqeMYdfLfjOJkmmfcm7coG7aaKzDzfUxLT6HWG+tw0HAjvY2OLe6Zalem/7Ur7earefvxIM1ZnbBkej8ZxamRVtrUzdz8ghuMQq11FOS3ZmoBTzlkWTzJjuqeEoUzJ7AEXrTGLXhlc/dOqAXyYyKdOS9g4SUXz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761289611; c=relaxed/simple;
	bh=IcM7jxGgkgnkr2GajXFnM4xxv5QN0NsAPNfS2UyXxB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWIBaU/XSvnc7X57VZwYOOo/AyAfiQG+jSn+kS7Z37RIiI0HG9JU3mJtM/B1jgZgknkvnD8x6gm6Fiz2HFBqW95LkNrP51wS8cK66INNf7bqm/FGvakXqxHjOREW8gWA5TW9ULvQ/h7YpQNrKsJ8AtZFckYC5cGtyy8Edjf9Urc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RC0q6565; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6a225b7e9eso1263553a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 00:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761289607; x=1761894407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvt1U6Vf4SpxKpA/uYnaJ6zzA9HkhxpVO6OnBIuFdss=;
        b=RC0q6565CkKeyiYF/ID84m6gUgA68J44/y1LTnhimbwyXBxiEmce7CbDysSe6BYBfu
         740oOqNY25nolXYqNxHcvh0+njdHGvwyjZ5rulE5XRLThmou7nWXjJ+Tgrvo0JuHfYSG
         vaoXHcENK0RxCK1oYAxQ7MWikWAR/qtYjo2ZD0/yCacSW1/EUfuPtzvrtD1TH7HNHXTB
         kSg/BVx/Xbdpup88nb/zANog76fCfHoVnD5muh5qzbL4gM9Cmp/SwM9OFqJL3rXG+Xsg
         NKr+7VFXdg/56N4Alyc47nzRfdva15mJS6iLi9MYSIIECEjoTGRrTaGKZoOmcRebbKDa
         oogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761289607; x=1761894407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvt1U6Vf4SpxKpA/uYnaJ6zzA9HkhxpVO6OnBIuFdss=;
        b=shROxuh0pK48IF6REpuiAhsy41NBbzqtQZ34j5BhMTnu72I64xbsuo4RYbLJdt+s+P
         rHH+xOWpK+W/yOKhiedRAv5oFbkSLu94ZHtkX3dDTZnNtvLs4TxwinIrRcT1AccjjJO9
         x87/0Kv/L1b5CjbAXz8CuelFduSjryl0a6ZgAL8wzo2UQbckfwvvYQY9c0RjdmGiC2Pu
         C2q0Or6gLBZOPdmidzD+NMaw0TzqzPSx0a9bPyStnX+GmMHVHro6cVea7SMsiXjnZ5dV
         6CGBoNoIsmMTia0LTTeBnW/AWDm+64vB0kHkk2+1WGdwjrEeAOI3Tvca3Cc6ryIIzDaK
         ACDw==
X-Forwarded-Encrypted: i=1; AJvYcCVm2qcoUrIrB/jw2v2ZtTURQ51L+CWu7ffO1G7wsJLzfazqE/UH8aGahHoaIgE/+WSSyjSshL6xgD+5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8srxw1J9JSjlxAClx+gV30X5ZDwDfP7w6qxAOLNA8/aGSo61g
	OPJ4x/jl9lpxTglo+Ai7MMQWzPL+zYI8G1lkFpFxs4vXOMCRuLZpcYW+n2EeMF1lu+X8Ryq3J88
	3wwxReasEoN61aKP2zBuptIVvtl7ixQRkcYP7US/AdQ==
X-Gm-Gg: ASbGnctTgMRL6nvsap7DZMfi7S266sGQmkgsXe5vwvKWB/4XQvOzVjkG2w2+kRxBNJ8
	05xbXJ9Mz9GWbipAN4ZKc6q8wOKip6r+9uJaJjUG6W7k0KoJ9OFBeDyzenfcM7ynLVvz+YP0IJx
	4zpECJiN47fL1sFUBrdRFSp5kg8YQe9jBuF+Ol8bngZakbIJrU2IwX5e89NquDilzP2hnLrL7Qy
	/FXAwvIJNa8gr4gfCQa3yB6X2wmaqFd9Rsc0khSfYDQEFES0Mo7Q/oKlKc21zuGrwP0b4G04iYI
	tbgfO3peoOP8f9gZQzdvVFBqO0wrS+AisCDO
X-Google-Smtp-Source: AGHT+IHhbnW16J86TRnMQTLpcKVq3NDU4KkB/OVNswAwHypDeIy9G9wiXcHUgNtwTpQ7IO5jgRxcjdTopF5jQwIYcUk=
X-Received: by 2002:a17:903:11c3:b0:273:3f62:6eca with SMTP id
 d9443c01a7336-2948b976597mr16484025ad.18.1761289607173; Fri, 24 Oct 2025
 00:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
 <20251022-reset-gpios-swnodes-v2-3-69088530291b@linaro.org> <aPkppRTFKFxqAxKp@smile.fi.intel.com>
In-Reply-To: <aPkppRTFKFxqAxKp@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:06:31 +0200
X-Gm-Features: AS18NWAgU2ta-z_SUgKnYRR3SPu4JU1qFzcnLihBLKAoa5GuNunRx0TYFhb0X7M
Message-ID: <CAMRc=MfBefm_kjTjB5PA43h-3Sk39TEeP0JpzWGr3Jnf9hd7wQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] software node: allow referencing firmware nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 8:59=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:41:02PM +0200, Bartosz Golaszewski wrote:
> >
> > At the moment software nodes can only reference other software nodes.
> > This is a limitation for devices created, for instance, on the auxiliar=
y
> > bus with a dynamic software node attached which cannot reference device=
s
> > the firmware node of which is "real" (as an OF node or otherwise).
> >
> > Make it possible for a software node to reference all firmware nodes in
> > addition to static software nodes. To that end: use a union of differen=
t
>
> Still union?
>

Right.

> > pointers in struct software_node_ref_args and add an enum indicating
> > what kind of reference given instance of it is. Rework the helper macro=
s
> > and deprecate the existing ones whose names don't indicate the referenc=
e
> > type.
>
> > Software node graphs remain the same, as in: the remote endpoints still
> > have to be software nodes.
>
> ...
>
> > -     refnode =3D software_node_fwnode(ref->node);
>
> > -     if (!refnode)
> > -             return -ENOENT;
>
> Why is this being dropped?
>

I'll fix it.

> > +     if (ref->swnode)
> > +             refnode =3D software_node_fwnode(ref->swnode);
> > +     else if (ref->fwnode)
> > +             refnode =3D ref->fwnode;
> > +     else
> > +             return -EINVAL;
> >
>
> ...
>
> > -#define SOFTWARE_NODE_REFERENCE(_ref_, ...)                  \
> > +#define __SOFTWARE_NODE_REF(_ref, _type, _node, ...)         \
> >  (const struct software_node_ref_args) {                              \
> > -     .node =3D _ref_,                                          \
> > +     ._node =3D _ref,                                          \
> >       .nargs =3D COUNT_ARGS(__VA_ARGS__),                       \
> >       .args =3D { __VA_ARGS__ },                                \
> >  }
> >
> > +#define SOFTWARE_NODE_REF_SWNODE(_ref, ...)                  \
> > +     __SOFTWARE_NODE_REF(_ref, SOFTWARE_NODE_REF_SWNODE,     \
> > +                         swnode, __VA_ARGS__)
> > +
> > +#define SOFTWARE_NODE_REF_FWNODE(_ref, ...)                  \
> > +     __SOFTWARE_NODE_REF(_ref, SOFTWARE_NODE_REF_FWNODE,     \
> > +                         fwnode, __VA_ARGS__)
>
> I do not see a point of making these three instead of two direct ones.
> But I have no strong objection either.
>

Then I'll keep it for now.

Bart

