Return-Path: <linux-gpio+bounces-2474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F98B839B70
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jan 2024 22:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA3521F226AA
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jan 2024 21:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0633FB0F;
	Tue, 23 Jan 2024 21:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gGZ4b20x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33E4E1CB
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2024 21:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706046665; cv=none; b=Yro2Iir6kIC7gTpdzyu/AmugZ1u26STuE1ssxc2tGta4zwXmFopsDDBjqrRZzvAiME48su/hjAiv9xbZkCCH8M/fBEoNkMCPmsnijSEB+lz1qYvjl8oh9iyoijA8s1u+IxZKlMan6YpLHjwBd8LCUc9mulFJnhUHB3fpCP4CbkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706046665; c=relaxed/simple;
	bh=YrH0Mk72e0Geo0pjj83tbehqhSDH4BMYk+a62Q7MQhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAmq6A0AP7l6381mZhlt3M7VqrjaW5gkzIlTZyG2NoMOrcfC5TPgITEPDnMW0YlESDO368/WsieD4ZVq58hw8PoZKKYRzsV9FzxMq4LNL/KhXhsNvDBWzFG4bvBjziafvjvXQsPx0Gq/Oq2h1AaGwP0DI7EITyYhqjq/puWYVGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gGZ4b20x; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5ff7a8b5e61so42162347b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2024 13:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706046663; x=1706651463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrH0Mk72e0Geo0pjj83tbehqhSDH4BMYk+a62Q7MQhA=;
        b=gGZ4b20x2KsL6YqGrYbzNuqtbRXedQJ/EIfYLe8umOPGLlqm+ItAygcSwPCXxyGaHT
         iKSranz1YnxydmwXF5Wq6zF9cNEpjQcVZT5l8b4ym9Mx40Xo2ekqz3c8c4U5cOtw8AUt
         rbP6VEJLePDNQCqwVSjZFJDUMFQ/o36XMv5oWBqPs5Y/c8RKuS/lfqxV0rYHi8n+kRJK
         SZ3HWSqT5GZD6CLEsy3neC6zOFahYlE/0xi7nu/8GJCpHh/Tv1ejucKYu5nkBLvYA8tZ
         SkrEXnWwWm7dKNcCEBNsFzPcMiGf/BJsoAqPGeQOUUi4lVprfA+9uZdQ4d7JFYsdZAPh
         yAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706046663; x=1706651463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrH0Mk72e0Geo0pjj83tbehqhSDH4BMYk+a62Q7MQhA=;
        b=f9dfXvRLoqhziTHD0tbt8W/ZbF+wsSQk5NShcfUYxxUtTKRaWv3dGHC7lWT5FnS5s7
         BHG3vh88GOk4DTQlU6nZB+o1I/3h/4PBa31ymRZRrUwOAcmTsla3zETI129m0uTBQ+67
         XeIYknVvBWa1FsBbbgnJeGOJl0FIflCbEjjTX7Kb6pxPFPenEOF/5O7BcCJhd7Y/Z5/I
         qggD3KCBv7xUJKKqPZZHSe+/0Ycx02nWfgB5QKhep6ZFzH0gSNIT4VyLNK4cdUx2syKd
         5ehZEqHQKLk4eepC42YAgOXls03g3PTDl7zK+KQa+GdgoUrD4moyTvVHgUW8nMJQne+y
         lFnA==
X-Gm-Message-State: AOJu0Yz80SWtSKilcGvWy+VE0F/U+Bw0i2lB6XallgZpjnV69z8cvGBv
	HsambTnNUjqAJ5VVxy9Rq+r0ZQwmnRCJyeDI20AEf/KbbOJP2F9kVVAebdE0gwt7B4/na4XGqsg
	9Yo3dm4VUYV//s+TnlTuzhgK/uZLt4ouQMFF53A==
X-Google-Smtp-Source: AGHT+IH2FMDyN6ueLjCPaNNWCV3PAu2KG9eyC8NO3af4YSd+wriNlJ4CtEruIB9dItADoNu4VsAUQ6vmhPFfv7oQ1QY=
X-Received: by 2002:a81:a24d:0:b0:5ff:483d:d156 with SMTP id
 z13-20020a81a24d000000b005ff483dd156mr5784703ywg.23.1706046663155; Tue, 23
 Jan 2024 13:51:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240121103505.26475-1-kimseer.paller@analog.com>
 <20240121103505.26475-3-kimseer.paller@analog.com> <CAMRc=MeGVAO8Fr4U5ai-OgEmX5gXeddLDKyRC+FQia1TH64m+Q@mail.gmail.com>
 <PH0PR03MB7141E0C8822D4887E04A3F06F9742@PH0PR03MB7141.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB7141E0C8822D4887E04A3F06F9742@PH0PR03MB7141.namprd03.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Jan 2024 22:50:52 +0100
Message-ID: <CACRpkdYePmAmrZN=GS58muzhxPUPKkenbgPQZmcct-0G5Ohc_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: gpio-adg1414: New driver
To: "Paller, Kim Seer" <KimSeer.Paller@analog.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kim,

On Tue, Jan 23, 2024 at 11:31=E2=80=AFAM Paller, Kim Seer
<KimSeer.Paller@analog.com> wrote:

> > Locking here is simple enough that you could use the SPI regmap and
> > get it to do the serialization for you. And then you could possibly
> > reuse the gpio-regmap abstraction and get an even smaller footprint.
>
> I could not seem to figure out how to use the SPI regmap in this case.
> Since the number of daisy-chained devices depends on the length of
> data transferred with continuous transaction, I could not determine
> how to implement that using the SPI regmap. Or maybe I misunderstood
> the statement. However, is it still acceptable to use the current approac=
h?

You just override or wrap with your own read/write callbacks if necessary
by defining a custom static struct regmap_bus.

For example in drivers/gpu/drm/panel/panel-ilitek-ili9322.c
I do this.

It may not save a lot of code in this case but it's still worth it because
we understand what regmap_read/write/update_bits do and reading
and understanding adg1414_set/get cognitively require more from us
as maintainers.

Yours,
Linus Walleij

