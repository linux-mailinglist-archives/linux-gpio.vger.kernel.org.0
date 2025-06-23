Return-Path: <linux-gpio+bounces-22013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4EAE3B47
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 11:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 433CA1894752
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D1F238C09;
	Mon, 23 Jun 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wBtheI1c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BFF2192E1
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672573; cv=none; b=GI5gkbHRnfdSMao6sd5nCCJ6LvDVBhdMAOPfQIwU/mD4lm5XTHMoMrAFp56cJ1wwIA6l8WOJCZpx7Y4es/M80KjtDC9hahsi3MXpS/edHTPMqY6SrScpcwIy8VhUSBISVgqU9ueeETgL6aeNd4vreFbZbkfxtEkyxD6oXLa2ro8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672573; c=relaxed/simple;
	bh=Eu/b4fK2/3MW1sJ83+1xGroVFUBKnjHqI3k8/Jb25XI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tX6L/24ilb9u3pw3QTKJzQ76OQlAZ+LTPmU5P4NI2JW6yQyICd+LQRIUTUz+5LSNM4/ZRCKbMKiZ8hyGWSh/NbNkLV3RO1noq2u+nHWFxZkxPNZ+VV3nmsdAIQgpkFB4gvD67ZtgLWG8sVC+d7Fo8FBQAy8kVA1mwyU2AX4R1fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wBtheI1c; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b6a349ccso3857836e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 02:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750672569; x=1751277369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPeDtzputbBG8BYmPS4Q6TNFFvEXgzemPhqRvBeZ31Y=;
        b=wBtheI1cI6ioICGB0ojvZVJdmdSRVum4y6XREwpYAXVx4TlwqkOepyFDwACFHzyJad
         463nJ5HyxYQtz7of3TaRM9YyNJh96zQ6vEXLXp1AXmGEL37funJKr33dqRwC3bZ8ShbW
         cnMbMwnwCacKdVnGU93iMSSu/yHzKg4Qm5bfI6FSmR+dtWQ3q0cHh6gihH84QwdAD9Bg
         nQIDccrqlOGGICaUvrvycfdRTdfGyg/ei/FG4hTtMUWjxV6mNYQF4nlhZ9aF22exlz6b
         zYa/Ei0QWZG5iCpQ5odvLKYBSVXCDGMB/XxSGI/fMwBpphIfwIkWTkLuGH6rIAU2t2sU
         7oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672569; x=1751277369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPeDtzputbBG8BYmPS4Q6TNFFvEXgzemPhqRvBeZ31Y=;
        b=S+hJmJUs+q60bzLCgBHg8fLuOar0Auegkh43D2HEN0Y50X9Hqh+F5PApU+/37RB/VI
         AD491HbxLJLmA8uUNC0jbMVlOJ3cRBzlOVAIS/+foA+r1pqrYsfXDk/bm7iwFSBbcvAp
         9PP8+f/UDTfK+zUsoGuFNJ9SNDtE4Hd2qyXYkVKqyTRNQXaRFifqMGJ34KeqSFzL79hE
         moOJrT0bEUZkPDLewcSJM+ArdLJn92k7UVyirhEzuzkLO6tRtKOqCpuwsnUts+QDyHfD
         OWNkODpQh2NkZCdbxl+0Haon3sSNyy3M6r/WhGKss2HuPIuBl+rVK0vMVU16o92hzXcT
         wA2g==
X-Forwarded-Encrypted: i=1; AJvYcCWbB2AWdVqUqbI5VnOjJ/g8WushozbyZlJx6rv4KJSLFF755/ViHEvL6Yjse5DSktWEMvRliCnzLryH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5V4ry28m8oMV3mCBiYh5UhdG/XAONyzdh/jtUY1w7jx3i8nfI
	mrTp9O3GtFWtTtrRJlcj6tRZzvNC2sg2Wjlktila57xxMedzINrasCxShgua3bDgT6y4d4vUWHn
	861sgXKJ7/ILaQD9gi4DBARy8pF7ABCJImLJBXrXHAQ==
X-Gm-Gg: ASbGncvR1/iKU7psnuR/FR68prK0Wryq8c2m5tPcGDtmjAbs4Y+nL6nSMmGmTt7X/n1
	4JFcTlYL36gvmt33nTfhJx4kN3CFTfrBEK1o3OJUe9QulcoIR1glgqSYy8H1QiFdxLApaEp0MFX
	ohdkNzGY5Nu2Q/CZPFdUgB5amo3jO1hu7AxaVi1WJY9ZqQh74GXxEdUfXpGftEa/gvynkNGHYr1
	g==
X-Google-Smtp-Source: AGHT+IGMaE9K7TjoPvRiPlXWOuU8YRsnFELOXhWXUfRnOBAE1HlGniGGtDxisVHNWEEQuzgyMBQMIN/+AwV3/43kfW8=
X-Received: by 2002:a05:6512:3c88:b0:553:cc61:1724 with SMTP id
 2adb3069b0e04-553e3bb51camr3441310e87.24.1750672569238; Mon, 23 Jun 2025
 02:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com> <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
In-Reply-To: <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 11:55:58 +0200
X-Gm-Features: AX0GCFuwq80YRRas_rerTXxamhsQCeIBZVM5a2xh0c93mD5kLuLbXD7aaKlDuiI
Message-ID: <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:54=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi,
>
>
> Le 23/06/2025 =C3=A0 09:33, Bartosz Golaszewski a =C3=A9crit :
> > On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >>
> >> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that retur=
n
> >> values") added new line setter callbacks to struct gpio_chip. They all=
ow
> >> to indicate failures to callers. We're in the process of converting al=
l
> >> GPIO controllers to using them before removing the old ones. This seri=
es
> >> converts all GPIO chips implemented under drivers/soc/.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >> ---
> >> Bartosz Golaszewski (2):
> >>        soc: fsl: qe: use new GPIO line value setter callbacks
> >>        soc: renesas: pwc-rzv2m: use new GPIO line value setter callbac=
ks
> >>
> >>   drivers/soc/fsl/qe/gpio.c       | 6 ++++--
> >>   drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
> >>   2 files changed, 9 insertions(+), 5 deletions(-)
> >> ---
> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
> >>
> >> Best regards,
> >> --
> >> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >
> > I see Geert queued patch 2/2, who would take patch 1/2?
>
>
> It is in my pipe for v6.17 but if someone else wants to take it I can
> Ack it instead.
>
> Christophe

No, that's alright, I just didn't get any notification nor is it in
linux-next yet.

Bart

