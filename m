Return-Path: <linux-gpio+bounces-11176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AEC99A000
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 11:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01F97B245E8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 09:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C9520CCD0;
	Fri, 11 Oct 2024 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xfAv5RSB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C520C476
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728638351; cv=none; b=I+FQ9gSPG5Fn4EiSo8e9fbHLQN12z0yJDrXkwGy7OwgH7WFlNufNV5GCm6ScqLYa+IN0dtDJPSMfkeIP2Q7sv1E5CVEV7WvnykNVsqevDvx4xwNXPkN5caBXtvpqCsDoh6h7Mv5s6+Lye58f9Ao/KGAKMvCBYoJu9TkRkdviKIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728638351; c=relaxed/simple;
	bh=jtVhZWWNX3zX7CwdFolfALYhOUO1vsDRDytrh8+FfTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghq0DPTvb0XzfHQx6OMGK7hsqNrjkaTtZaZiuISnG990q3eCyV3DLive9eKv+ZbAwtBBBxWtJ1CYXbyeYuJPtSShl+aeFHXa5GVos9IOxaRRKPWjkBZQfsxzGEm8NHxmz9inYLP8hsd9i2X2KSg2Y48WRBDbKrf/TRRRTb6xQwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xfAv5RSB; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fac3f1287bso18665931fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728638348; x=1729243148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtVhZWWNX3zX7CwdFolfALYhOUO1vsDRDytrh8+FfTA=;
        b=xfAv5RSBq1dPqwx4O1H9geUKag4zuOOxK9dpbjgQWNumxT/TLl9G0khO3AvTnJs6Q/
         Fg/q2ldJhTI3V4oBy1BiF458q1ciawRODAKhCxIqx6s4A6emiEY4AqriTYWB6BbcLQcf
         XVPzrt9alzF4Ru1uCJv5QJE3yHPHl3dU2O5d3pWn/17Mqz78ycRZgP9vObcRpmeHJ/ET
         cSc4SIAC8L9IvBFtZKQF+6tFm7KrShhXyfcz8gsQNUg31foj/9bh7yWeW5l3Yio0Q7CR
         sAoNIZjxsXHr5frEI/BL7lOCnzbW+SY2bMarWYFc7uJ/vef1LNPbuU2vwmTmPbRv46f8
         1XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728638348; x=1729243148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtVhZWWNX3zX7CwdFolfALYhOUO1vsDRDytrh8+FfTA=;
        b=KGxgZmQHYcWfYW27n3BifhGDKXpIjsTtD5RWPmsZj95MXNo3nRSqKv/k8Y6rCFUxKP
         VrWzN9+s6yFWHGoWBf57lcbOHB4Nd9fpNUmx1FaygNGlgA9BxQVN6DTbgxbcTNPy6rRP
         OdqMB+4dfJgBNsPunz/YQnfH6hcfViVRhaEzZTFHPwh8DAHh/FuprOIohggXjfOSgQEg
         Yi+a0PJm1ITWBWmcSdLwqa2st9KM/xs9bS/sY7yBXQhLMGlbepG8i1MCYEZrm9jhbZHz
         GC4XANSDLeL8Ks5QR8QGDYjGAVarx68m5tSxlKIZqUlN+7jLrLOsmz8Apy4LiM4DMrVx
         CSig==
X-Forwarded-Encrypted: i=1; AJvYcCUOG8XJmcuqGA9/ZFEYjrjxw5yp3TTJyFNGikUtzuj3qL17ipmnPHrkT8CdP69gL9sft6/QbSj+cxcQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwBGexJ6qw5RxNND7UKgRSnBM9uKkIIpLdle54MlFZGGOD4lHpR
	+CVOj54KMu2oGjNBX5cCn5I3LzbDDqm2qnPBn4bIFSaloK/BvFJ5NCE0ld7M39iDVQ9KjVWcYAS
	/unBwliQIFiQFwOucTnil4vPjJgR+e/A4UnCxWg==
X-Google-Smtp-Source: AGHT+IGr3IbqNBTBBoJpOQ310qlh+g4Oi9eFyoyUCTdl+vSPgY4MeKHHQ6RiGRzDh2lAYpqZ3xVkrjWD4F2c48r6rk8=
X-Received: by 2002:a2e:4c02:0:b0:2fb:2ebf:3259 with SMTP id
 38308e7fff4ca-2fb32709c02mr6280871fa.13.1728638347593; Fri, 11 Oct 2024
 02:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006181310.181309-1-matsievskiysv@gmail.com> <20241006181310.181309-2-matsievskiysv@gmail.com>
In-Reply-To: <20241006181310.181309-2-matsievskiysv@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 11:18:55 +0200
Message-ID: <CACRpkdbJ7xh1qOYaZOh+s+Tj_GgE4LXMFuOgL1zpxBRqJQVx6w@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: ocelot: fix system hang on level based interrupts
To: Sergey Matsievskiy <matsievskiysv@gmail.com>
Cc: alexandre.belloni@bootlin.com, quentin.schulz@bootlin.com, 
	lars.povlsen@microchip.com, horatiu.vultur@microchip.com, 
	andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 6, 2024 at 8:13=E2=80=AFPM Sergey Matsievskiy
<matsievskiysv@gmail.com> wrote:

> Fix interrupt handle loops, produced by spurious and short level based
> interrupts by unconditionally clearing the parent interrupt, even when
> no GPIO interrupts are pending.
>
> Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>

This needs to describe how moving the chained irq calls achieves
this effect.

I'm a bit puzzled by the patch because I don't understand it.

Yours,
Linus Walleij

