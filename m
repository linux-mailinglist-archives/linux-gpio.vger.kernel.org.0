Return-Path: <linux-gpio+bounces-26002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D3B543DE
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06B504E0202
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 07:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECE42C21D6;
	Fri, 12 Sep 2025 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UpbeDIsY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ACA26AA93
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662168; cv=none; b=TvXcM9+FyYfygvIPHS5/546s+2iUagA6Kg9VamKG/DYItQ2QG80DrP2YkoCHURAveL6gDGUFz6p20IrgPkg2tdDEmaweLuXiO4BON/1+9MBlfAG465b0lxTS6IzQWTEFMd6IpCPg+nFRKP0NQcJAu1YUAYpGJdXogo/42gBKj6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662168; c=relaxed/simple;
	bh=HUbm7teAAiCNO5ZplPzoTsRh/PirBkwd7FwusaGR5ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mICo2Ag6gSfgXuc7XH6FlVy8OMyYeLtlGnMqXHrtADMfs7r59OESHMbznVkTqJM20zVZr4yHmHyXI7DhMKFkX59ME3bREe8BpXmJx6y3uVeExXsRederMoc7irMUAMNDccEgQuh9pKJYRU6maDI2xAEgSznS01sB4JL/RkJtqbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UpbeDIsY; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso1747829e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 00:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662165; x=1758266965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkCjzP4vhD32bSP1mBlLDiHz0GdzVd/VyBKFM+8O2pc=;
        b=UpbeDIsY4UHjElWjfR4NMBkvmIGnZSiqYWZ1d0KXkc75LhRmFajwN5rE0GON7YUAoY
         tcNZJblubXIFr2Ibwgj87c1E1DmT3IqLdbMmeXQfsIhxFJdvdW0QThqhU9pPG69ro7nV
         TRJCmxy5j0FQImfw9jFUd1P2BPl+DXyCU0sLRpQrI3yUrKtpDnZ42onIf0sDz834tjjj
         f3J2yGLWAOB+VX+gD6d72NKWqvecEhsnxJIibQzvmxGKNkcyQ2Tw+US6ucjW4GolBtbz
         FURs3M8/0PoyJLsZz0tkj7Xwgr2h2M6cO6ZjAZ9vcQ+UTcX9HgVlIZBBDAa7iWy9v9yO
         JfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662165; x=1758266965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkCjzP4vhD32bSP1mBlLDiHz0GdzVd/VyBKFM+8O2pc=;
        b=KH+MZezTJ8qScMNRGPTeoo6lrdtGgGMspHkWSledsqowR5d+E3ND+r0KMBhWH47Dwk
         yeXe9MiH8UFGnoZYfk0AiWNfNAyxh93KMYpRlk7wdgPr8qF4eYs34yzWDd2sKNUND/y9
         DbdM4zIMNbEdjsKbZAYgpQwKYTCIk72rXEy7HLdWyyW9/hBAEsymy4jXJFpeX9l7t4vY
         qQIBBVWPf30lIEKIM5qxMekSPAM5XatHhlCy6i2hQKh7m7D9v9UhNMYQxS4KyMIyBh15
         SFAMqCkLc5xnC+W1nQWU64TR3CDStYwSKbogdMkoe4tjgNZxdNeuj95XKqooARFL1dTC
         JTbA==
X-Forwarded-Encrypted: i=1; AJvYcCVk66hTtyTK2e2hasGprpZTkYwN5xSq12gcJ2/moql3jnOGzwNrkTXrR//iab1nB2aIKONwcUc5/AQZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwlE/OjDqOC767ph19zVDA8+sO7TiobKePvTev/d33dLbMoxUvh
	JWRVflAsxs/vUgtsys6iOBh3uZ8Sshnl0CHfCXhpCCicrBMbS2/gp+b2Q6AybDimmMWusfNWwPk
	NBHQExdvnqeKcJYHtTWz9QlmO90ij8NI+1orQgdj8hA==
X-Gm-Gg: ASbGncvPn8pV35rXFzq7/AnrhJQD+hyU9DVWsZbd/yDbk7b3GuYsE73R03uZzxdJWlP
	3FoFYvKSBiGGSVlEudhqFje7L3m0fQ+Bp10sX+QSd2mOTIxGyf35bvOzW8Q8B+dA+J0LPWFankK
	JRH/XmxilPmqn84adl+H75flJl3wWeeqXXelPAF1W+elsxrvMi2cDoth7kPWZETCdAxLfflvLuN
	frVIyXo2R7rlwHSc01uERk81Uw9U8eZ3yWDbw==
X-Google-Smtp-Source: AGHT+IFvPcTXQ6WIkQFzLqofqGaeCWwE5V3dpGC1EHzT5ohZgdbDh85iVg7RukP92bY0eYj/+7Dm5YzYYq8NvDagHtk=
X-Received: by 2002:a05:6512:3d25:b0:55f:4746:61d6 with SMTP id
 2adb3069b0e04-5704bec62f4mr779028e87.16.1757662164848; Fri, 12 Sep 2025
 00:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
 <175764920912.610338.13254301742963097094.b4-ty@linux.ibm.com>
In-Reply-To: <175764920912.610338.13254301742963097094.b4-ty@linux.ibm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Sep 2025 09:29:12 +0200
X-Gm-Features: Ac12FXzlO0BlEMfk4QQsvjbiy-zbMbEg9ajjT3EbChQkXyCvmLeQtRGDcFX-Szw
Message-ID: <CAMRc=MchCnTusmP=1rKco908f7CxHcb6REXx7far=1Pp_dq9Aw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 5:55=E2=80=AFAM Madhavan Srinivasan <maddy@linux.ib=
m.com> wrote:
>
> On Mon, 18 Aug 2025 14:42:24 +0200, Christophe Leroy wrote:
> > Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> > file provides an OF API that's deprecated. There is no agnostic
> > alternatives to it and we have to open code the logic which was
> > hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> > drivers are using their own labeling schemas and resource retrieval
> > that only a few may gain of the code deduplication, so whenever
> > alternative is appear we can move drivers again to use that one.
> >
> > [...]
>
> Applied to powerpc/next.
>
> [1/1] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
>       https://git.kernel.org/powerpc/c/e7a6475cc0c32213e87ec190d90b8f1440=
ff05ae
>
> Thanks

Hi!

Looks like it flew under my radar but this should go through the GPIO
tree, can you please drop it from yours and I'll take it?

Bartosz

