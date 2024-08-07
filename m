Return-Path: <linux-gpio+bounces-8660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FFE94AE7A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 18:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 004EDB20C9F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 16:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D7D13AD3F;
	Wed,  7 Aug 2024 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ngG8zCyR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474AD136E30
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723049774; cv=none; b=CzRMI7TFvmkjn3ZmluI3LvefMaxtrLwxUfpOvOLLsXQegidFqtlHKJRknFOyh4cCQLZpWpjLuGw1BYXQUcpD5NavHDMPY2VmU3DYX4Sb5bAWbuCzb7EzIbwNoqpopWs+TPcI6s+B4NXfUnK8E1H/SF5PwcG9fOdqEQqnotMaCJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723049774; c=relaxed/simple;
	bh=QZymBs+eKZ3wGkqZLs62iD/WC+luTl2cLwV7VzziwP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REnmlnHt0+zC27mkXhSj83N2IlgwzoGTCLdvID/osdB+YhGnWduW8VWcAMp0jbtuGZWZPEnHIAhk8oTfUETEncFhGKREZcLIFSjE/CTMUJ3Qxo44JPxsz27e7PhWnnYgTDIuIXQwySFZKgFExCbLQaPUA/l3xOwVWY72FNUF8lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ngG8zCyR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so13502e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723049770; x=1723654570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZymBs+eKZ3wGkqZLs62iD/WC+luTl2cLwV7VzziwP8=;
        b=ngG8zCyROV5X2cXsvYhDdWn/Q+z4U8V4ogdScI348PYskAw7UYP26mTHOuoU0/nUAg
         Quyba+e4SeFSoN4woDGtiYRIQMIGOgVADFkIk3F6SxBr2mGGjguQJu1xOa8VfngouCeG
         mdDP3Ym+2UsnrRct0tkDgRhXEeiYSl1Ng01bzQYi2Q4eVGGw//Zjh6Nzkc4DBtIn8g20
         /XeHg99p42Jnmpwmofj3ws6QqGn9LTNXcCohM4tGhBM8o90MCny6XjpqBRNFVYKKJ5nK
         xLHmKY0O5D+Ob64vZUL3edyVULbpivy1jO5FOhRURhJFuBeMwjtwVnM/58Qi1n4kfnIj
         07yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723049770; x=1723654570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZymBs+eKZ3wGkqZLs62iD/WC+luTl2cLwV7VzziwP8=;
        b=l9RpkKEfyjDm0ah/kUbyF5cZsSX/HLbEeq18nUnlSM/m9nHPgCdWHGVTrmCQ6hSJrA
         aPdMNAlQ7dPNO2/NpaXXOprzW55b6/xt+Ok8SFzBL+SEo/XfZjEG9LGOH9Lf3mHWNKin
         OEz2ZtnGnXFfCmgjxLsKc13h4pv4x8G5G0otFJPbUmleUEz0gI3vYjvixCQsq4QINhtc
         VMfL53iRWpOI/dU35QLdllnn4Fh0NDHnFdAjuEXKzAQZ4p0mxxpBpQoXYa//MKYtAB1t
         ngd99p+AQuA0qVrMVBdqr0LMa/ZZxdIE+Af5ANLppajUfv6jbuLL2EdjTG3cHgOoXrqm
         a2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUzos9I+Al0QIH1tW/2bnqzshLXVE/GjtZuHl9F/myHvDOB99h+BqGqjiNhgDBwSjjfP4BDDAzvGyKm71HUDuCThyXGAJ2WCnDJBA==
X-Gm-Message-State: AOJu0YzLoTiD2OE0lv4VCPLW0Gsh0ffPc8pFRmoJWKRyKZjfCXydZK+0
	YTTxhSv+TaTS6aNsQcKfiNK/+D7JlujA2u3Z7m927o70KKWc7QOVl6IyZNFGeRmc6SRRhwxoH2u
	Xj/5Zg4KdBrLSh2+O6ydVjet0QdkHAj25aWwbkw==
X-Google-Smtp-Source: AGHT+IF9pFh79hDfWpFT5gb/WrtkGcdEBNFXxPxoVpwAm5XZb1BzyG10CU2vBHyWrPgMN/JUxH+J7VLto5fpWiF3CS4=
X-Received: by 2002:a05:6512:1045:b0:52f:cc06:c483 with SMTP id
 2adb3069b0e04-530bb396ca8mr13337439e87.24.1723049770240; Wed, 07 Aug 2024
 09:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com> <20240806-breeze-crazily-84d4e4af8f4e@spud>
In-Reply-To: <20240806-breeze-crazily-84d4e4af8f4e@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Aug 2024 18:55:58 +0200
Message-ID: <CACRpkdbMxuhe2HQZ-Av1R7JW94rS0FosPO-utYNsFO8avR3TbQ@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 7:18=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
> On Mon, Aug 05, 2024 at 10:04:53AM +0200, Linus Walleij wrote:

> > Is it possible to use augmented generic MMIO, i.e just override these
> > two functions that
> > need special handling?
>
> I'll look into it - as I mentioned under the --- line, I really didn't
> touch most of the driver and there's comments from Lewis' submission
> that still apply.

Thanks Conor, thanks for taking this over, too many patch sets fall
on the floor. I'm mostly fine merging it like this and then improving
it in-tree as well, I'm not as insistent on things being perfect before
merging as long as they are maintained.

Yours,
Linus Walleij

