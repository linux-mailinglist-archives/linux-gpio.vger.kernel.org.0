Return-Path: <linux-gpio+bounces-3127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A442F84E902
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 20:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41AFE1F26369
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 19:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65675383AE;
	Thu,  8 Feb 2024 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TmrFHOol"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0085938393
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707420910; cv=none; b=hx2zrd7jaSleirx9iXv4NYbdqK6eFv3yHvcpEgjtpkmX+pIoIKQyzM7C1axFw7PnSC92D2ga0GNzbntZqY71nDqqhA8Nx7/a1RZq9K/L2d6lq4kKBPQ9hS1bZZEM8DqG0Z8nFoqYVv/8cBfc1Ukx3jgDwn+Ix7S1sML+BkipYz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707420910; c=relaxed/simple;
	bh=49ZmMXs52sNHDqMkM1lTtLl7A2faEk+okVH4w0xg/Rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vrbl3UdhALGtccCoW2GHK6MkRIOReZE2vJ0Y8VyIHWQA/QrtDl5qa1+m8Ajv4atadm66yvodSFvl5lMcS+QCoIuY+yJ8Fq3KL+DKTLGHqMi4c65OHdygh475D1JfJVd3DvkSI8gPgyb7xLyA6C+o0BUtMpDgfZrT2x57+/ZkGpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TmrFHOol; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4c02dfa01a8so18768e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 11:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707420907; x=1708025707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmA2415mqll/My0qNi8647dwajjmJqUb2r+iKelLxdQ=;
        b=TmrFHOolcKpOuTjNn9YG7SOckAcl/yyMU4MZcmbrM0628/LK1h/oYb7SCWd+Vd+YT/
         Wiot9hv7XOXX6FMuyjxB2da4cmDXey6fuIwrehTLbp87629kF4jHx9U5bN9y8xf8Gl3v
         aKdfJ/Aygfz5y1N9YSyYOolSnqlrgFtxCd/Hj80zdFRe1kXJYbaHVaRXtI+QRL9k/eY5
         DM86Xihb6ur/VG0l4q2oikPxLMp85o3do50SiqFTrwlX/eEIAO2dNLMgB+dQJQCr1tmQ
         v4UYPbbXAUVYTLY7nN1XeuLcEcZqJ30tvQnP21wGKeS4RqBjf9fMTY8diKXzI06Alaoh
         mMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707420907; x=1708025707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmA2415mqll/My0qNi8647dwajjmJqUb2r+iKelLxdQ=;
        b=b9wEZosd1/Z1NE5XdXgxvKWlIuB+QCc2GuwqfaX6vKLaaPfLvi7I+5KY2Xu5mhHtO7
         mCYQBZin/mDs/rXHy12vnVw4Upx02Jt7aGv2VYTNefRkKWjjau6P1Yfjo0cKQrlZJGrY
         7K0FVobdo0yecQAjMO5/adpbCia5/BXYAB/qIloYru5SSCSYlGtzhTJiyMglt/+6WM6P
         ToGUsmwf3vg2sVNLBaabhjdRD61h4jReWdlp89e3kevHenRNoavge0roFyBgie4kzLQx
         cHDI/FpC2ljMaaQ2tEEsHfkJsc943T1txgaEZNegS6Dp+IN7CRlKZoL3MJLmtnjMIoSu
         EWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsts8m8LQmK1pLaH2sTdZ3X6fR5/zQZpatHikljRm29B3LaSOWqxWMINt97C+NqBB2mloQyC2UnpvjVxGW+McL7jmj+3VFMr92Jw==
X-Gm-Message-State: AOJu0Yygj8Apm32xBQ7ly39MPAb4K5PQouh3Xdxt/nZh/Y2cZ4RWkiLe
	ek21UffpHzesRzaCrHiOPUrDDHH+v/pq5Kavz8KQyS5MrGOP6zZjzl0MdR+oIrcAWdDXr8mELH+
	36tDVciZXYDJSBTSIsKcwtdynd0eZkRnusbZtwg==
X-Google-Smtp-Source: AGHT+IGMJWFdJBtDJw2nuq+Tc10l8gxwOAqqBaCaLXfg49jg7duuQITeryaa1iMz1zlg9PJAshT/cXnHy6978emBRSI=
X-Received: by 2002:a1f:da44:0:b0:4bd:3606:c7aa with SMTP id
 r65-20020a1fda44000000b004bd3606c7aamr597594vkg.5.1707420906766; Thu, 08 Feb
 2024 11:35:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208095920.8035-1-brgl@bgdev.pl> <20240208095920.8035-20-brgl@bgdev.pl>
 <ZcURtLZoEftBDpsy@smile.fi.intel.com> <CAMRc=MdaxrjKVoBe92ci+4U-VbxyuxMVu30-m2E3My0k7KN65A@mail.gmail.com>
 <ZcUqWy34Z_QGutNn@smile.fi.intel.com>
In-Reply-To: <ZcUqWy34Z_QGutNn@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 8 Feb 2024 20:34:56 +0100
Message-ID: <CAMRc=Me75F3KmTJbiNZKXNpwU0a_fSd3UffWORwXzDLKAMcXag@mail.gmail.com>
Subject: Re: [PATCH v3 19/24] gpio: remove unnecessary checks from gpiod_to_chip()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 8:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 08, 2024 at 08:17:14PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 8, 2024 at 6:39=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Feb 08, 2024 at 10:59:15AM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > > -     if (!desc || IS_ERR(desc) || !desc->gdev || !desc->gdev->chip=
)
> > > > +     if (!desc || IS_ERR(desc))
> > >
> > > IS_ERR_OR_NULL()
> >
> > Ah, good point. It's a small nit though so I'll fix it when applying
> > barring some major objections for the rest.
> >
> > > >               return -EINVAL;
>
> thinking more about it, shouldn't we return an actual error to the caller=
 which
> is in desc?
>
>      if (!desc)
>                return -EINVAL;
>      if (IS_ERR(desc))
>         return PTR_ERR(desc);
>
> ?

Hmm... maybe but that's out of the scope of this series.

Bart

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

