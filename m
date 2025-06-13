Return-Path: <linux-gpio+bounces-21535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5FAD8B88
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 14:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 203093A6BC7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FF02D8761;
	Fri, 13 Jun 2025 12:02:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471F9275AEE;
	Fri, 13 Jun 2025 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816167; cv=none; b=WgQ3/bb8Pi7DxRvvFSiyy23HFjjZsDpBa4VodZKf+Cq52sy7YB12g++KG9i5GsGqdyjv4iQNsv23JVm5d11k9stQj9xRMcEmKeja40XPrcXcWJjYFc8yUGKFDX/fxNa6VDLteItAkAbFIibwUIlBLG/8oi/5yfI2liadYIAM49Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816167; c=relaxed/simple;
	bh=BXxvrZ+5xsHq2NeiRiiQ2KjK0y7qm7L6PD4h6zJvwHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7NqxjlKgsiYrFehbcz3rejdJXlLQq5nbdWS0Kd1EDELY8QDgWSGLZjA3UVi6TvYiMO3Wj+z/26/+YSKAu0WCaVcuy7iZULA03Q+dwrpyYzVUS5n5B15uGN17AxdrGenUuWsxdeQo/YFHHPTMltMzMqV0H5Aw7EfJSp4IVXsQAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60efc773b5fso1075924eaf.3;
        Fri, 13 Jun 2025 05:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749816164; x=1750420964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXVAH0tAYPfakdJ/nQeD/nViGdAsyC24HiZoQySgtPw=;
        b=ncWyT30p8wjpAATJLkgIfZQDrCueYSW6WciAS6rw6mLP/egd1cmV3koulIaV96qsU3
         IHdz28A6wRHc6dKWu9yy0X+WgAxpLcodKstTa9UR3xx6QSPsCgeRBpMXSPRokLp3UfeB
         XbkUZ/UbFYcOHUjtpBfdS/CHsrbEkvOSsh+9pOJPx+hL0wVG5dAZjYdRMwAxj3zBKbyq
         6dBcme5qSCKNJaOTcfRYDsCI6pHwLoSlr+aoNglwOlsFfGTezNZ8FqxyEKJvATL7nwZM
         Mp/d51GyfTPWUvC/bLhXouw5/X/pVoFdM32sMtJbJdECw25GGtQzg2b6Wh3bCkvgl+SJ
         L2Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVsLSXY42vsa5g/YV6TkLeCpelheKnbETOFjuJ4V2Hr/1vTqtvZ5ahUKIi+djrrw6oqjQNdiVcvc6j7@vger.kernel.org, AJvYcCWn5aihlflVX+1vbpnAUwnYU3yxXc2gzSUn3b9G8SpUQlyNfBOgBvhJUNxSIXw3+hGSl5age2Et4oUT4bzRIWE4QPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3p5AvHNsvImElBhlfjPEyJMhePAcncinjcL+J2ng3jgY4Uk0j
	ji7trTDd2h1bgS3d50IG21RZGi36cHX3ODZuuDpLNiK6/AP4WMXRvIf9msUrBMZS
X-Gm-Gg: ASbGnctdzsaJCBDdNY7e1C5q4UOTeUlHgtQz70Ci+PcQVxnrdzX6e5w1Zxhx4GrTOAz
	9C4XDNVHVajsTW+p8Q1fXw1cYZEekyPr+1SVX9YuzJJ5U3dcG7qPaBWfjKM1Kg4S7Tnbe++4/4l
	cstjano7cknosrzLfZalx2FcZGANcmBmoUhAmfQ3mlu3b2Uc7JXvApfJZ+n2D1BviuTCTyYttbZ
	LiOiqr7MaNlFBb3Q8EK06WptqAXmR5JZtrTq0IyrUgEictb440Ky9+1yO1J+GJ4IelXncFy0N5e
	swMBy2oMcJjMmYh8Vg6BGJMrlWvbhfjw6MUxmWrkkJINu0rgjjAlw8Kq257JTCAi2FEa9tPZNud
	Gk7g7pVWU5PCi06a2S1MPovsPW8zBHvBuE0sS3Gg=
X-Google-Smtp-Source: AGHT+IHqHgeeOHvonXYN52bMiqYZ3t43tlWwmuoFIhB+LtPaKmQHbFh1wgI29TQh134EJJnDaMPrCQ==
X-Received: by 2002:a05:6820:270c:b0:60f:847:8354 with SMTP id 006d021491bc7-61107ac28a7mr1950453eaf.7.1749816163818;
        Fri, 13 Jun 2025 05:02:43 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28403dc8sm187688a34.27.2025.06.13.05.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 05:02:43 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-400fa6eafa9so1411831b6e.1;
        Fri, 13 Jun 2025 05:02:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzo95b5agG4XWjsetwp01a4RSUXabNN4eLi+OEHoL5jldyFzpKSdcvHAkNlcwRxaD0hXjeo6dJslX5@vger.kernel.org, AJvYcCXkXOdkSAPqDp/bRfq5s6m82dVyQSgGacVYMG4kaHf3egAkQyyczsf6w1ZNsJ9ztj82akoo+yFliv9SzG8Fudf+bRo=@vger.kernel.org
X-Received: by 2002:a05:6808:e86:b0:406:697f:a62f with SMTP id
 5614622812f47-40a71e405d1mr2078209b6e.10.1749816163183; Fri, 13 Jun 2025
 05:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b648ffcfe6268d3886b134a98908b2f91dbece56.1749801865.git.geert+renesas@glider.be>
 <aEvotoVqitiHxgYA@shikoro>
In-Reply-To: <aEvotoVqitiHxgYA@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jun 2025 14:02:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+2AQbuzLhx5rdtuiVdN85oHJpdUvTKPkVdEn5krp6Fg@mail.gmail.com>
X-Gm-Features: AX0GCFs0XCivYHgPfkZvcBUi1-JB1zalcmdnQAEUcfu7KkSvI30sq2yFCnu86_k
Message-ID: <CAMuHMdV+2AQbuzLhx5rdtuiVdN85oHJpdUvTKPkVdEn5krp6Fg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Use new line value setter callbacks
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 13 Jun 2025 at 13:42, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> >       bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
> >       if (!bankmask)
> > -             return;
> > +             return 0;
>
> Doesn't that mean that the mask is invalid and we could return an error
> here? Or is '!bankmask' an expected use-case?

That is a good question!

I _think_ this really can't happen anymore, as the GPIO core is supposed
to check this against the valid mask? Or isn't it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

