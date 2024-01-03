Return-Path: <linux-gpio+bounces-2004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B7D82394F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 00:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F19811C249EF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 23:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1E71F92C;
	Wed,  3 Jan 2024 23:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+RTksN2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3201F609
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 23:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ccbf8cbf3aso105564301fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 15:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704325641; x=1704930441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5i3vNz1GWYj8zmDwnsMw7M3QiHzXDaBa/Jxc4SAtJI=;
        b=Z+RTksN2gWBapz0a/QJaSQk0QZeqNEIkL8OVoY4QE5EqkRzl6++o1p7At2+E+quGfL
         gMGFzZy/UoOrcE+uaE6bX0phOz2lYKtwFqQ/PSSBzceOylCgIAR/Ukm6l8QnNX1gsPAR
         2KiQaNhGF9DqMXeiuBTbtBQvsaM+zaoDjJ/STZn3HYBH4+liP1HJfhUrjnmmC6C2nokI
         NijmbYU54w70bMAtxl9HpQyZG1ODgIwJ+6W0T1vF7E9EH1x8F0tfAoMENvpza6q6UjNK
         /RhaW8FQlxd3usSa4s2Msm1C/851trGJILjst/IF0CruRcHtPEtO8p+Y+1O2amzDJw2r
         cBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704325641; x=1704930441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5i3vNz1GWYj8zmDwnsMw7M3QiHzXDaBa/Jxc4SAtJI=;
        b=acJQT53nill7hp+nf1G9OQxwx4MHbO2xJZ83PNuKPyGyHmZRkD6k9/4GAdjWFD0Zq/
         LnhR7hTAypd1Y0T+/nw/9a7/JrDUk8AwNCYFBU+ujvOOPR2BfLy8tpxIevRsQ72rGmnP
         /5q2rpF72/XOyQLz3OT2CrmHxhJ3xmuz38yoPMAy626p13jyMZ3ld5kI0A60mDqM68KG
         SIzkJm+fDSncDsUV5AeV1fyC4yCzZpq+C5Oce7ZDqIzz9P0Y7daKYAhAl0Ns8JXcS4Cj
         zZBGEOC2KhRAxvdWBfd0l/t39hnSyGtyrP95PZQrciYCx2WUggWnLN277lhMcSe2FUOe
         rt8g==
X-Gm-Message-State: AOJu0YwnDVcxTByr0fdXah+nv8jQiq4By3hRwafjaCxrG3vYEFxb/bdp
	wugsSZ6yJUesBP1CH3cRc+sHRoTb8Rd3seF5jg8=
X-Google-Smtp-Source: AGHT+IH/d/7E9foI7+Wg+GT1HYrIB3CzXn7FY1ZnvyS6cGmG2z8SWA2vGmhXktyuXN/1+zmjETdujPwrUpDudlOvO00=
X-Received: by 2002:a2e:2d09:0:b0:2cc:9389:ca1 with SMTP id
 t9-20020a2e2d09000000b002cc93890ca1mr9158096ljt.73.1704325641097; Wed, 03 Jan
 2024 15:47:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <20231228092915.GA67274@rigel> <CAJ8C1XOP+h9iptC2gB0-6+Loaxr3Ow2MXYUjAxqr_t2EgBmDew@mail.gmail.com>
 <20240103094931.GA117646@rigel> <CAJ8C1XPe5nG30O89AVboZa=iqRu=-4=jNtuWj3v6KY921kfq8w@mail.gmail.com>
 <20240103232514.GA3339@rigel>
In-Reply-To: <20240103232514.GA3339@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Wed, 3 Jan 2024 17:46:44 -0600
Message-ID: <CAJ8C1XMMUJgOHOMPayom_8itNpt7kNcSyz-1R4hPJ-LGzQTd_Q@mail.gmail.com>
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver 2.1
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 3, 2024 at 5:25=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Wed, Jan 03, 2024 at 01:47:54PM -0600, Seamus de Mora wrote:
> > On Wed, Jan 3, 2024 at 3:49=E2=80=AFAM Kent Gibson <warthog618@gmail.co=
m> wrote:
   [ snip ]
> >     gpioset does *not exit* because people complained about lack of
> >     persistence. When the persistence issue was fixed in the driver,
> >     we also fixed it in gpioset by not allowing it to exit.
> >
> > Have I got that right??
> >
> > If so, why not stick by your initial assertion that persistence is a
> > driver issue - not a libgpiod issue?
> >
> > I won't make a recommendation - or tell you what I *think/feel* -
> > because I know "you don't care", but if this is the case...
> >
>
> The behaviour was changed in A driver, and as noted by Stefan even that
> is in the vendor tree, not the mainline tree.
>
> Your perspective is too narrow - we need to deal with the general case.

Probably my perspective is rather narrow; as I said at the top of this
thread, "I have zero Linux kernel experience."

But I know that we need persistence, and it should be possible to get
that in a rational fashion. But not to worry, I'll try to find an
explanation for all of this  that makes sense to one with a narrow
perspective.

Best Rgds,
~S

