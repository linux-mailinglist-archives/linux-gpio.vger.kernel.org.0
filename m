Return-Path: <linux-gpio+bounces-1928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6358203BC
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 06:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23FBA28365C
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 05:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7787A15BF;
	Sat, 30 Dec 2023 05:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrPjtsVs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4331FA2
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cce6bb9b48so20311051fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 21:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703915196; x=1704519996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmbC7ssgr9vrLVtdR9WS/TRP1cnXL3m07/l8xt8bFMo=;
        b=CrPjtsVsDpzh+AvAingALEvVR+q2ZBixYZziE1r0Pty0R2jIE2/BYGaXaJZ9lQppTR
         qG4VZJhJUmQNx0cj1Hl3iPljMqvGidc4iXSmYx8nzjQGzb2VeYk1P8XGPmAFG3Orr1h2
         2vX04uGgmycQ5Ioq1Carm64UZ/kVRg7o4H5giwMW42TUfHMxcoDAwA6POKt+KC0EOs3o
         pZBvVV05UFen4tZ36qclEzXhhQC/w5vYruLXI2/MItcXF0mt04N6hJzM9RP1o9k0LKeU
         YaZ9ScEXzagZzjlG0l0xpd0Q3U8CiBMpd1QSyPds2yuIje7k0L/+fj4DzLGIyz+TD3/V
         0wuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703915196; x=1704519996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmbC7ssgr9vrLVtdR9WS/TRP1cnXL3m07/l8xt8bFMo=;
        b=AfYF8ueTrncO+xe+C/ZhpuFEIzVfl//4dMks6g1Hy1kGXKKHwvlpZregC4ORVS5gmr
         adO6rU8Mi+4MiBooSK+pOHolZsemKRI4jd6LRv9j8jEsu0a1fFHRoClk48o2OOfOswJW
         2exkN1UFBmqBKUb24cjrhmf8Jc3fdXzN62soQXZp1oimuCCOrDRlFTXcPmuOKjnG7ukx
         0SuYOgtwifpXYxRlujzKNG5m99v7sEOfhkO5EC5UGALvBsow+Q+7UNnXEFExnFOWQrQI
         u6/Iv8K7GWi7neDToho0RZV4koCeZzfSOPF6dDFZaqoM3RBI/HfPEb6kguw+v+XJkxrz
         xqjA==
X-Gm-Message-State: AOJu0Yz8IV6VNEEIikoT7iE9ipcTj+cCRgPBhwYnFhUBMokBsfPBdpKh
	5kx0GW+0zQWX98ysRUOblffOfRfiBg9tuLx0Q6Pd8+PK
X-Google-Smtp-Source: AGHT+IGnkUsBcpcBFAInfceeucIgsVVGvzQyVS+w7OglnUriOsomrUlfvHrqz0iks5lwwdCZa+atHMdjZBsFRhZLH5M=
X-Received: by 2002:a05:651c:544:b0:2cc:c677:4f8e with SMTP id
 q4-20020a05651c054400b002ccc6774f8emr2201513ljp.47.1703915195485; Fri, 29 Dec
 2023 21:46:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>
 <20231229155837.GA103278@rigel> <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>
 <20231230022136.GA19799@rigel> <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>
 <20231230050325.GA40096@rigel>
In-Reply-To: <20231230050325.GA40096@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Fri, 29 Dec 2023 23:45:59 -0600
Message-ID: <CAJ8C1XPNV0Wn0UEFZas43-9LzWkg2=m0RE+cRXVsvPfgANMC4A@mail.gmail.com>
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 11:03=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:

> > > And thank you for the SE un-upvote and downvote!
> >
> > Since you brought that up again: I did do an "un-upvote" - but not a
> > downvote (don't even know if that's possible).
>
> It is, and happened at exactly the same time as your un-upvote.
> Weird that.

How did you determine this was at exactly the same time??

> In what universe does "can't be bothered" imply anything BUT laziness
> or complete indifference?
> AIUI you are from the UK so you know that damn well.

I can't explain it really - I just did not know.

> Burying the hatchet sounds like a splendid idea, but actions count more
> than words.

Agreed!

