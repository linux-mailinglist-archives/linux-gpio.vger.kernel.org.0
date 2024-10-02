Return-Path: <linux-gpio+bounces-10719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2769C98DC03
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB30B1C23E2A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5391D27BE;
	Wed,  2 Oct 2024 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ftLKU5+I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C344F1D1E81
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879483; cv=none; b=ODUSiHFTIzmYY/X3T1QJR7KqsCcOD0xFR9Ek/CJq0jMs4TjU4iljBBzmyxx52dZgJjY1zoWbnkTqbhRF3p/TjcLwMo0KQDcyomuK/0GXgANRXNSXeGjlydetxjtQygyAV5FTKbhQplPZb2qZZucbk+zOJnsZGg9KQsGykyGqmeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879483; c=relaxed/simple;
	bh=KCplPbQ9YtntQwYxbaErQ9DGkEA6PvlTzAFSC6yTqe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHsAmQBR8RWZ97lExnR95ByZea7m7iaxV8Ep/Di1N/NI7xfT0zsXmw/2PrsoM6OeLBk7+oevV7foqGEw8doyLJ8u80YirvG4+60ootuNYLF6sk3Zat/T4Oc+kGasZM9R4RMvQ8MaC9e/mwpPhRhdaJbpS85buxAl1OSU4DCwJt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ftLKU5+I; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fac9eaeafcso37965461fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727879480; x=1728484280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCplPbQ9YtntQwYxbaErQ9DGkEA6PvlTzAFSC6yTqe8=;
        b=ftLKU5+Iw1ywFp8Dx/UsNA0xCiAQiURm//kjCbdZYjwtiTJwYDUCmWXiK3AXVm4J31
         oPkhu/Sx/CYDGUvGXs7GVA6Hc/VNPzn8jAhQ8Rgf4TGWhcHqsDqJ1AJU2ZzMfBUdYSxe
         qOKaSWFFeX08XFeGztcaBWuhix7RBhvjZIfgFHtD1iUqwy8Bqay8kGDPyp5CJBhrc+fT
         55+vinJ9lu5/+e8rQkyNCUxXMHpcUFkeYxerV7ltv+OR5RhgGw7F01AF9yh1CohmvvQE
         78vTNSpG+sJqUMnJE9CGnt6t0im59Fy40vW8Ukyv8id/z85EoxEn6k+1nUclDgQaoP5R
         x2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879480; x=1728484280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCplPbQ9YtntQwYxbaErQ9DGkEA6PvlTzAFSC6yTqe8=;
        b=sTV+dwqON9XQNk41oEAkwYEiMET2S+NEQ5AOvclNjtcLMGs8UdEtZxwxV1qTwrNAhr
         PdHfVrqLqza42tjiQcUIwyh3IjxSi3bg/BoODvcAx+kxk0ufIOL8BlmFPYj87lufH94g
         uDZ+aBp22RLeKpLdXi9TKoEnK7EDabBR92CRduvAeWNksGfBhGIR7MJ+lIs6jh25uSW5
         mYvQFzH3cXVmJw3gS3Jbtu2Le6XGyM4Gv1ge8oAG9f542aPbPflwiI/A3vBNN9W5QcIo
         UpcEs8wxEBl301qWg3i1QfDrg1RCKi4ZvRv6m9PsimVY7kgVsP7DSaPXQMP6uBHC1ryq
         nQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfxMk3A9V8x5I1IYDRIBfqD6aHVaToVlVYvtt9Bg59eb5SKTcs3OgTl5uMoqAij24sqCXB/AnBB5bx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0IzAvvSJ8dl2yblai4SyyWoprUPz5rhpk35grQ+xMh54tkEgm
	Z6IJEJ9t4Q+o+ZHU4OeZF93ts1szwQ5g++8XNp4orOEfgPH26I56DavxjyOCt8zDX4YXkLmjmIv
	6tz6lwet5gDPGSbZ/zoZLe0f1C54TBNmuVxmGrg==
X-Google-Smtp-Source: AGHT+IF0VGVcIscjWdIkcQ7OdCvvfD4kfboX2NBFzefh7Wob7IOW5GpAgb2GlIiXbvzCdrcw7O8wXLo5/ikHCmnOth4=
X-Received: by 2002:a2e:131a:0:b0:2f3:b582:a914 with SMTP id
 38308e7fff4ca-2fae1099897mr16703651fa.41.1727879479875; Wed, 02 Oct 2024
 07:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927074221.9985-1-brgl@bgdev.pl> <CACRpkdb_1LrtbUssBEgYqOLgUY9XAbVBr+tezt5FCM3tdB9RYw@mail.gmail.com>
In-Reply-To: <CACRpkdb_1LrtbUssBEgYqOLgUY9XAbVBr+tezt5FCM3tdB9RYw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Oct 2024 16:31:08 +0200
Message-ID: <CAMRc=McaakkZZ0BWeneG6PrNKPto+Wc4T4-GGiUUnEqrQrxnWA@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: sysfs: make the sysfs export behavior consistent
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 3:12=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Fri, Sep 27, 2024 at 9:42=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > For drivers or board files that set gpio_chip->names, the links to the
> > GPIO attribute group created on sysfs export will be named after the
> > line's name set in that array. For lines that are named using device
> > properties, the names pointer of the gpio_chip struct is never assigned
> > so they are exported as if they're not named.
> >
> > The ABI documentation does not mention the former behavior and given
> > that the majority of modern systems use device-tree, ACPI or other way
> > of passing GPIO names using device properties - bypassing gc->names -
> > it's better to make the behavior consistent by always exporting lines a=
s
> > "gpioXYZ".
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I'm in favor of this.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>

I take it this also applies to v2 and am picking it up instead of this one.

Bart

> > Story time:
>
> That's a good story :) Fun to see how you arrived at this.
>
> Yours,
> Linus Walleij

