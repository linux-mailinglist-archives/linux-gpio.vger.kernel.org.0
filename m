Return-Path: <linux-gpio+bounces-26878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469BBC2054
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 18:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B8423A7082
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 16:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881892E7180;
	Tue,  7 Oct 2025 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvqNWKl3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96D2E6CD3
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759852977; cv=none; b=rT9AYT0QU44j/NNHlIVRboaNgjO1BGa1L44GPf8EMmdGTnaai2jSCCc5ByHApCEBLO8aaD0mxD8iF5z6PoMdOwhxOF/x0vDy3EmqjlUqpMpSGNkB211U5h25WouvwTWJHot6eg/S+8NYmO+qq+Caz6M70hOWB4pDBradNeUTuWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759852977; c=relaxed/simple;
	bh=SCnV/SabJq2ovGK98h5wOYxzXudBJL5PJVppHhdQK9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcQnymHW6jfQ2kKluIhJNyhoBfaDxuRGg0HcXKQhEcqwjs+cIN/4rqnHbTZ+I9vm3zEGbIDmQYOb3c4Jqq4dLauP9gxs3B0PXbaAuS1MevW3CrjCV5cl1MYswn4kYOoaX9dETJWaSVL/0jA6S42iDnVHC33DJRmuTamq7uNR8vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvqNWKl3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-421851bca51so4231858f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759852974; x=1760457774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4PmXw+t4eyfqIclsgOdvNmiteqEthYNwo+QzRmYvOU=;
        b=XvqNWKl3Qd6AhrxjqBbVjHogEY1LbkMFx7+yZX3bIxK4pFxEFuTQQ0qRotDTVAva+a
         PbH4R+Vb1JHL6JRJC9iq+oKX+NvX2bnK9B9mXFOPwRR3OK+88Mzk+3PwvaPvkVJa+m6r
         AvjU8HJNH2H88cZnKBVClEpSd+oIQ0A0mr+KILGrWgypA0UbgUW3A8D3fihLl9myKU6j
         1oVMUuh3dwn93wtlQyRZlZxClt3xqu19ft5ojq861jLdVjBfStHga7kuVwVKbGgfkbWE
         gICCj6Qo2hpo614zCss25u8uAY71RPqNf8TPJ7VYXynVNCOR2STESj0aiyPT/oQYWqT0
         uhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852974; x=1760457774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4PmXw+t4eyfqIclsgOdvNmiteqEthYNwo+QzRmYvOU=;
        b=TSrU9ZarnU1a+bTB+1SHk+YvKN0qhPFkkKsve/RhG9bbpKdVtjs/KbwFt7PjHfZOAa
         EOL6r5xEvAjntwYhPHl/PSCqIhUohKlw4divgGSzOJC1x92qrVcIz9fwBPriLfY8iDHH
         MbMsd3GF42j/HEZRg+HFFMJpAOF7uN3EsoKaz4Q4gjHkfYSpyvRjpeb7FVU9Ep6Au4I2
         Q8tU5znEb6HgfaovdHIUnlagZqqmyVhkD7JG/Oa5dpPcQTG38+ZwoVnyc/qRKv4J6DeA
         4OFAVCP/oOCiO5Sr6IMZ79PrIixmph4R9ff4nJAwkJU+pHav9CHkYt/lTKwvYq3lbJtg
         MVQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBqE0psp2Aj827hlIQHccJSJQiazB0Syku+ISXLn7yuKqEtJTLsH3wrK+5Nf4kd8BbaWTx58zWVDQ2@vger.kernel.org
X-Gm-Message-State: AOJu0YyL7xEOvN3WLwN0YHpjuJbdOxHkmX8rOLYg9HaaAFi9/UyCHv8c
	Zx/KDA45DMhbVX7oWlbDTAreP2Yc5dWQU+UvBQZe94Fb+A2QMJmelYZi69tDQZPQK3xiBqU34qU
	6KX7buOWMoVit2pf2GapXSUU0Q6Orhdw=
X-Gm-Gg: ASbGnctR6hYZujMK6jCYZgBmLR1NI90SPVfI27UpDJGjQ4ZLYA2bBszqibOFO2GUP6W
	V0Ch1+6c0CkDTkSMRgXo+4wdCcVRHt22rGRwALG/eLMKN9Bk1mTbzm+ZixGDSRXd1YmjKD4sI0H
	kWWLuO0inIQAj5ryJVZ/VHn4K9eaJhckVflelE4pEbsD+iWXJNH4Fe9L5vWF3M6zTEZXsQpmRnN
	9dAgfgtmONkjZsCnZ8SQveEOLYj5hr9
X-Google-Smtp-Source: AGHT+IHPiGma+g9SGHGjEWg4n/9lGyovmyEGrAEuRu7FYqeClC1xj+DQW9WgaUsZaZ919iLvptfJi5Wpw0gBngpF0QA=
X-Received: by 2002:a05:6000:26cc:b0:3ec:d740:a72b with SMTP id
 ffacd0b85a97d-425671bf3e0mr10964826f8f.42.1759852973374; Tue, 07 Oct 2025
 09:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com> <3665995.U7HbjWM52l@senjougahara>
 <CAPVz0n3CrVufs8vbw8XnYuwoZoQ2Xsi3V4HimgT0=4RQySzvaw@mail.gmail.com>
 <3862885.G96rZvMJ2N@senjougahara> <CAPVz0n2shn41h4z4PoMdtCXzj+96ak69TCqt7Ag5qpqdWi6UWA@mail.gmail.com>
 <DDBGU9ELXIAW.1RLHSNOPVR9B3@bootlin.com>
In-Reply-To: <DDBGU9ELXIAW.1RLHSNOPVR9B3@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 7 Oct 2025 19:02:41 +0300
X-Gm-Features: AS18NWB8Gbllc1ZtoSEL2LuStkUA7Ll89S2q913cljwsgWixJe1BcsNEJhM9egs
Message-ID: <CAPVz0n3EB-tw0af+O4acmbvXNHkH62t5v3r3O0nedLs_XJ39PA@mail.gmail.com>
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 21:55=
 Luca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Thu Oct 2, 2025 at 8:20 AM CEST, Svyatoslav Ryhel wrote:
> >> > > > 12 represents amount of bits used per pixel, 8 for Y plane, 2 fo=
r U
> >> > > > plane and 2 for V plane, total is 12. "but explainable with a co=
mment
> >> > > > and improve-able later" why then we cannot use 12 with a comment=
? this
> >> > > > is all arbitrary. Downstream is not wrong from this perspective,=
 you
> >> > > > don't take into account that YUV420 is planar and it uses 3 plan=
es a
> >> > > > whole Y plane and 1/4 of U and V which in total results in wigth=
 + 2 *
> >> > > > 1/4 width which is width * 3/2
> >> > >
> >> > > Yes -- but AIUI, the only thing the bpp value is used for the byte=
sperline calculation. When we add the special case for planar formats, whic=
h doesn't use the bpp value, then the value 12 is never used anywhere. We s=
hould at least have a comment saying it is unused. (At that point, we could=
 just hardcode the bpp values in the fmt_align function -- but I don't mind=
 either way.)
> >> > >
> >> > https://ffmpeg.org/pipermail/ffmpeg-user/2023-June/056488.html
> >>
> >> I understand very well that for YUV420, each pixel has 12 bits of colo=
r information. But how many bits of color information each pixel has is not=
 useful in the context of this driver. The number of bytes per line is not =
related to how many bits of color information each pixel has for planar for=
mats.
> >
> > No, it has direct impact. This is how buffer size / image size is
> > calculated since we place each plane consecutive. And bytes per line
> > is used specifically in image size calculation. This is common part
> > with non-planar formats. Then since Tegra provides a dedicated
> > channels/buffers for each plane, configuration of planar format
> > includes an additional step with calculation for each plane.
>
> Sorry, I haven't followed the discussion in detail, but I tested you seri=
es
> on Tegra20 VIP and capture does not work, with a SIGSEGV in
> gstreamer. Bisecting pointed to this as the first commit where the issue
> happens.
>
> I compared the input and output values of tegra20_fmt_align() at this
> commit and at the previous one, and this is the result:
>
>                        before this patch     with this patch
>   At function entry:
>   bpp                        1                     12
>   pix->width                 640                   640
>   pix->height                480                   480
>
>   On return:
>   pix->bytesperline          640                   960
>   pix->sizeimage             460800                460800
>
> I hope these info will help.

Which command did you use? I have tested with ffmpeg and
yuv422/yuv420p and it worked perfectly fine.

> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

