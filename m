Return-Path: <linux-gpio+bounces-9530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A87968332
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 11:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01CCE1C2032B
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 09:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277841C32F1;
	Mon,  2 Sep 2024 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRaOIxj1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4A187355;
	Mon,  2 Sep 2024 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725269307; cv=none; b=UXcfkAqCGFk5ZpIt8O0h+YdHNy8HHigqvGYR+piI7srNyKj4t9xsrGFBtOed57vJdPvgyCoPda6axMSRiac3PQZ/7hpMg/c7Pnv/dZF+KTH6kwMYn5EviHO99mQL9v6cFDZ7tf/vbWGChgmb8iRHN5RJNmP8veubGfNgBTqIn38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725269307; c=relaxed/simple;
	bh=wz0nbLzlS8nCRQNYzJhVNp33aZ9ev7UqcyhxjtZTSEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQSlrc5jpj7TprK0F1Nm5OuFW0tWQn4741L7hbAD8ljkKO08Bj2twfoNuchZ0eE9SFDgG8Lu61f22xiHSLTcqyx4DJPsQ9AgfFJUVm97q7fUjAnbpFZfOtYZfnYeWUq9C6pgF4i+vufvYn9IAxF0QA5558SrWP55zYQO65RLOI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRaOIxj1; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3f68dd44bso41277491fa.3;
        Mon, 02 Sep 2024 02:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725269304; x=1725874104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2I6KRglLDhMBBHQDhZYriJGFB36l6M5um5WgZKc0bU=;
        b=LRaOIxj1l0Z8kERniynpTQN+3Xvc4U3Q4Ur6oDPZpVL8ZCERXrxHr/iQTeY0IQN9nA
         P8QqDOJLuDM5wVVw3CdJc+oLtZhWTFK92gBOdlmWUlTubtQbcu34RYg2v5Fx8X9uBtMf
         VSPHAQtew24L0n0rkGshrywErxvEtJr3Kg86jbJ9AhiLX9OYEww40kcfkch2n4TrHweh
         Zo60lqgyE6Ptte5kRtlqsURHJhA5ySUfc8JBaqtaApMMksrtM3qMncEPgNhnRjN1n5UI
         k7EiTUJkHSfKh5BVbkUpsP7/QE9DoIK9OnI+Ocf2aJIcZjDUGXxVQ2/AF0ODQfRU9Rwz
         J6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725269304; x=1725874104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2I6KRglLDhMBBHQDhZYriJGFB36l6M5um5WgZKc0bU=;
        b=SbUTNacvCJBGZawnNl0AUWVkLEGR/tC7tNK7PoSOmb9c1IRq56EtafCgoBQuCbLd89
         NFdS9IEOwfNQE8qFXm+/OUDRCcUAGG0VQ2mDllVxDr4+xIqGhl4GGLthbZJOHVWXq/bR
         CQpipauiuUEp++Zk8P0/5Ez/s/Hyf8xDOKkC2tiR85jeyqSKDU0IcF219pRI2DYJrjdL
         nYczjdGu2XqsOQ2hr1eTYRsny7h20CeDepxXngE7/bzm6IxgEmQVoxPu2CX1l1d5Z0fq
         bcXZbtuSyiM2mmxoI93qRMmyD3njswWXjBYEfPQbX3lVZckRb0d6sYOEI2jSoaDkzHUp
         m81g==
X-Forwarded-Encrypted: i=1; AJvYcCU5g/E8Z7fYDn4q4ghojOsJuDpgqq8cppryWVrmmOuqByDJ0L1Y8HIXBF5zJVdtW60N2CwyszYqDEnB@vger.kernel.org, AJvYcCVE+8LUd5RTBcEgF28kNUQvRLBXdXJTAm2vjV7o6s7GVslBNGmkey3WbTBHZmRFTe+Mg69vl4m4TnW3vKb4@vger.kernel.org
X-Gm-Message-State: AOJu0YwstlOCoDnzxBE5ldE/tcNmWDeezcuP2VVT9SGVmMjVJ9Y18Ajf
	swkEZF7BxTFglvqsv2c+h1i7EECO3d4C8X4aJMLOnm9BV0Rjj/IFeB5Vi7ipPkw2kHQfWkLuBLq
	Vl6W+jG9pMRXRxOCsE4xA5KMx35xG/uzN
X-Google-Smtp-Source: AGHT+IFhk4AbmFcLW3KVfd8VGDWeIlXhyDUx0aCY8LXKoX8coHpxbkyA8VYLyCZ2du/pvNixMNJ51iy5dx7ZjRZxEN0=
X-Received: by 2002:a05:6512:3984:b0:533:efaf:ab26 with SMTP id
 2adb3069b0e04-53546b44d77mr5542334e87.36.1725269303920; Mon, 02 Sep 2024
 02:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902072859.583490-1-patrick.rudolph@9elements.com>
In-Reply-To: <20240902072859.583490-1-patrick.rudolph@9elements.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Sep 2024 12:27:47 +0300
Message-ID: <CAHp75VeHc23XXjSGkmgajmbJ4ZH1OrSL0FGRQNrDfvWdW6cRQQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-cy8c95x0: Fix regcache
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	naresh.solanki@9elements.com, broonie@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 10:30=E2=80=AFAM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
>
> The size of the mux stride was of by one, which could result in

off

> invalid pin configuration on the device side or invalid state
> readings on the software side.
>
> While on it also update the code and:
> - Increase the mux stride size to 16
> - Align the virtual muxed regmap range to 16
> - Start the regmap window at the selector
> - Mark reserved registers as not-readable

Reported-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

> -       if (reg >=3D CY8C95X0_VIRTUAL)
> +       if (reg >=3D CY8C95X0_VIRTUAL && (reg % MUXED_STRIDE) < 12)

Probably good to have 12 defined, but also a comment suffice, like:

/* Only 12 registers are present per port (see Table 6 in the datasheet). *=
/

>                 return true;


--=20
With Best Regards,
Andy Shevchenko

