Return-Path: <linux-gpio+bounces-4131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDFA8718BA
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 09:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A8C4284103
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 08:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1BE4F1F8;
	Tue,  5 Mar 2024 08:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VtoEIMO+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1D38DD1
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709629101; cv=none; b=GVn2vbMHw4ZTWbBp3P22srupXhqunV0YUho2b9yvNnU/DTgxfcmFUlCjpk+94OhBwkQM59GQoCb5zLk7th2nTTT5rZ6kydUlNoxw5YVpVK27vtakkyavVZD/cKL/AqgDPCABQi03BF6jR8EBfv4f3+tlTKE3lI1WGK5wRAxomXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709629101; c=relaxed/simple;
	bh=HuwDDAWMV9bZP+9DIdSi5gyDUDZ8Gcoqy8rJpCsW9mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifd8W/azDorV4t5WnZyN6EL4Lb6PQ7wGB6s4Yb3acFFMsWGCZOir5QijUgJW5N54aVuKicGJZWzwl09UJeDaMXe37Aa8xXlxHKsnR1Z/tRZd2E1a+/QmOnJqjms5Ns7AcQ++Y+9SCSpRYQvZe1nik8JMN2xVl8YHrDe+Cg02tmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VtoEIMO+; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6089b64f4eeso47727397b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 00:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709629098; x=1710233898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuwDDAWMV9bZP+9DIdSi5gyDUDZ8Gcoqy8rJpCsW9mM=;
        b=VtoEIMO+7pGt93zZsxe76Gyk6SLGsTPM3NwD1v0jGGiKf2omXhjDD0VaUfwuJK5JZx
         LcJ//GHdJABRMarVz4W4i8N3oeIwfEn37i3ijBb/pUe5nMWvA2yxYNzAjNC/ViRxUgsu
         dKyFAjggpqYUS4YyLg4hvXMidQA6Vg8ks/CCGy0SiYzDOi6MPVd3qaSCAmJUb0Jc5jB6
         gLJHZHC7juqxZANzzLnOK8b0+HrKfG3E338n1BjWz1qG1F/sOMgEl2Sdgb5QZJYCVYYb
         peVOEJNtfZXn4em0iyY8GL4nWEn0wi98THd8u8t0j/vvif6tnbJ6Iisk4bePEcisnxm0
         uh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709629098; x=1710233898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuwDDAWMV9bZP+9DIdSi5gyDUDZ8Gcoqy8rJpCsW9mM=;
        b=FsbZ0dV+SwloX8uAbEBqW4F9DWW3en479FZAiTGTWurDQ7rVFAr3R67LgnRZK6RuDg
         +ufGD0srRFimzj8V2tPIdwHU8quiyxifMnl0j5zV6cqVKxqK8Qrofst1dNJnrjjF2ROg
         4jLrnx27VBXQTaLH/lDuewyE7umMriWqFPHAU3bYh3cAzt602XCyUudig3wP4JbIGAXm
         kumMAHakgRu8D9RiamPZTDNP08ZsFJgpc5TQL3VoFcrO9UxEtaFoJcBVmgzvCte9n12A
         yJ8xIM3s6JkFoNBvpG2dopzy8Sxkao5+iCXx2MbshG/0VSfHG633u4EnPViET+dN9mFo
         gfAg==
X-Forwarded-Encrypted: i=1; AJvYcCWsQTZLgftfOHs0G0iij5PhT0HXddw380L0LrYRgIK0McvgVB+j8yhYZxRGlEhG6Ij+GkDur096KPve/sqPz0qRUBcClsD5YujnMw==
X-Gm-Message-State: AOJu0Yw5cDZ3rQ8E17KHtrlUGhSEIp6MK3/VlN7X5tZ3oD4oyliRgWTb
	JSSylS8lCBP5s8tXw5jQeqcfT0pGFntyl17KGQW0j7xahp6E3TNh5qc58WNGWSpOprqWz9v22tP
	2CI+lncvB0CwCliLoum3kGHZu+4NSalKnqAl49Q==
X-Google-Smtp-Source: AGHT+IHDiMYNrnSxZP1Ky5LIhxgCMW+wJkwNjND8zOGLnolqKWQ9BvBVPa7JbmdoMqyRIJ2L+lHknttDUG9meN2659c=
X-Received: by 2002:a25:b195:0:b0:dcc:f6e2:44d0 with SMTP id
 h21-20020a25b195000000b00dccf6e244d0mr9524314ybj.37.1709629098555; Tue, 05
 Mar 2024 00:58:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301-awinic-aw9523-v8-1-7ec572f5dfb4@linaro.org> <CAMuHMdU3yUAxMgN-xo5BU2O8x0sn92myz6ZH68DB6JnMfgh7rg@mail.gmail.com>
In-Reply-To: <CAMuHMdU3yUAxMgN-xo5BU2O8x0sn92myz6ZH68DB6JnMfgh7rg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Mar 2024 09:58:07 +0100
Message-ID: <CACRpkdY+6__RoDrMT5tsxSAUBOxzjOFzH56Z=07SSG=2PXwcxA@mail.gmail.com>
Subject: Re: [PATCH v8] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Bauer <mail@david-bauer.net>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 9:00=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
> On Fri, Mar 1, 2024 at 2:30=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> > From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.=
org>
> >
> > The Awinic AW9523(B) is a multi-function I2C gpio expander in a
> > TQFN-24L package, featuring PWM (max 37mA per pin, or total max
> > power 3.2Watts) for LED driving capability.
> >
> > It has two ports with 8 pins per port (for a total of 16 pins),
> > configurable as either PWM with 1/256 stepping or GPIO input/output,
> > 1.8V logic input; each GPIO can be configured as input or output
> > independently from each other.
> >
> > This IC also has an internal interrupt controller, which is capable
> > of generating an interrupt for each GPIO, depending on the
> > configuration, and will raise an interrupt on the INTN pin to
> > advertise this to an external interrupt controller.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@so=
mainline.org>
> > Signed-off-by: David Bauer <mail@david-bauer.net>
> > Reported-by: kernel test robot <lkp@intel.com>
>
> This "Reported-by" should not be here, especially since the issue
> reported[1] was not fixed, and is now in next[2].

Oops I dropped the tag.

> [1] https://lore.kernel.org/all/202106251415.3UY7htNp-lkp@intel.com/
> [2] http://kisskb.ellerman.id.au/kisskb/buildresult/15135594/

I wonder what the problem is though since the driver
depends on OF && I2C...

Yours,
Linus Walleij

