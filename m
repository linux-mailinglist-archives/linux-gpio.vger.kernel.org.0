Return-Path: <linux-gpio+bounces-1181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00480BB12
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 14:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEB86280D6D
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 13:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8A3C2D3;
	Sun, 10 Dec 2023 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/5cjnfb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52251DF
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 05:28:14 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28a1625b503so2983588a91.2
        for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702214894; x=1702819694; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RovuG/wIdB1GkjccbSOk8GXMwrwvRfMQuvPok1Uj5dk=;
        b=W/5cjnfbACeSPLI4Y4d/U3+HofwgLCntVjkzVfk4TMQZrMtzJQmJEr7MnbaUfW3fhk
         XhH7ypUt5LSP+qQDzT+YCAC2HoYz4b4HpKd9z+5MQ6Hp9f9oQxpK+2ujF71tg3pLbDuk
         OpJZBC4gjcTvYCiSflQ0STfvkjv3hFQgsumz5aOF4XW4B7tiaVMG/n6lSYE+LHPq8iKO
         Nb4T4KCKMYv/fVkNAHgsj08rqq7HNR6j2h0zyTJhtf8PuemshnVZva+p4gxB7AHbPBv6
         Qb/pz+k7Z4E7Bbi/4/dStSBWeBJA+KF0EHelzuuEPw3ml9/8muR1pi5sY3jAl+3ZnQFM
         fENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702214894; x=1702819694;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RovuG/wIdB1GkjccbSOk8GXMwrwvRfMQuvPok1Uj5dk=;
        b=duhKf8U91G0WcB7ZrusXBQurf/kd+o2zspaINBdoaE8PyT/Dt7xiPUGxJdyaeVeyhy
         Mo85XiJTgavFwj2t02qnRu45xH5gurBmfDF8hkrecIR2z/36p3MmZydKegRbPbrSiKVn
         m79racPtKGk7cQxYPOQw1fseFVIISzsf+l79YYHh4essCrJOf0zNAnl6fbt93ztUCXJm
         mXcIs7efx8LSQSVo44jpUG1vCW+yRz0z7IHWkQRyK+QpD+hRaqfgE0kgmVEMEsQlzJgM
         7NsfN1w53wRitR+4CiycKccUTntVA4KHmjE8OMZyVO3m9GJWLE16PSUYXnTbQVtnt/5u
         YDqQ==
X-Gm-Message-State: AOJu0YzQopyQqIG648lJ7hc2Ml3+gTw1t7YEE4EPKpfS4M/+uc56Gkmx
	EKocRmQqbQLAsnDyMwu5+xQ=
X-Google-Smtp-Source: AGHT+IF4o6j/+LaBdKl4q82Ez4IIxQVcgCYBqKa+xDPiiUGOTPw8gXuMOdojBH0msW9uPfiUopGoAg==
X-Received: by 2002:a17:90b:1914:b0:286:6cc1:7817 with SMTP id mp20-20020a17090b191400b002866cc17817mr2212304pjb.90.1702214893598;
        Sun, 10 Dec 2023 05:28:13 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id nv12-20020a17090b1b4c00b00286f63da50asm6490503pjb.53.2023.12.10.05.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 05:28:13 -0800 (PST)
Date: Sun, 10 Dec 2023 21:28:08 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXW86Ad4MOq4IFsn@rigel>
References: <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <ZXJq2zGjBT0yQAXv@rigel>
 <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
 <ZXLWHTjv9W-IH_OP@rigel>
 <CAMRc=MfXQb=A=4f0kFEW4ENuNk0ZmL_qAkWihEvFcYaizCf8LA@mail.gmail.com>
 <ZXLvfBWTAGZt0f0L@rigel>
 <CAMRc=MdhcYToMixdFh6Kf+GZ_MhDeHxd5_2U00neLGoH2M_P9Q@mail.gmail.com>
 <ZXPJXTm3pzBKFX08@rigel>
 <CAMRc=MdDg8pcu=iTCUDjdpgYMuBubjeL5po8Fmhz6z3ri0fOZw@mail.gmail.com>
 <ZXUjx5UTgC9tvkp9@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXUjx5UTgC9tvkp9@rigel>

On Sun, Dec 10, 2023 at 10:34:47AM +0800, Kent Gibson wrote:
> > >
> >
> > We still need to connect linereq with its "parent" gpio_chardev_data
> > somehow and make this link weak so that it can survive one or the
> > other being destroyed. Maybe a notifier in linereq to which
> > gpio_chardev_data would subscribe? It would send out notifications on
> > changes to debounce_period which gpio_chardev_data could store. When
> > linereq goes out of scope it sends a corresponding notification
> > allowing gpio_chardev_data to unsubscribe before linereq is freed,
> > while when gpio_chardev_data goes out of scope first, it unsubscribes
> > when being released.
> >
>
> No, there has to be a link between both and the supplemental info.
> For gpio_chardev_data that is to create lineinfo, and for the linereq it
> is to keep the value reported in lineinfo mirroring the current value.
> Below I suggested making the supplemental info a reference counted
> object, with chip scope, referenced by both gpio_chardev_data and the
> linereq. So last one out turns off the lights.
>
> Having the shadow copy allows most usage to avoid the tree lookup and any
> associated locking (assuming the tree isn't inherently thread safe and
> requires a spinlock to prevent modification during a lookup).
> It is only populating the lineinfo or updating the value that would
> require the lookup, and neither are a hot path (if there is such a thing
> in cdev).
>
> Hmmm, the radix_tree allocates a page of entries at a time, which might
> be a bit of overkill per-chip, so maybe a global is the way to go?
> Or something other than a radix_tree, say a rbtree?
>
> All this is getting rather complicated just to relocate one field, so I'm
> starting to reconsider whether the desc was the right place for it after
> all. ¯\_(ツ)_/¯
>
> OTOH, I've partially coded my suggestion, to the point of skeletons for
> the supplemental info, so if you like I'm happy to finish that off and
> provide patches.  Though what remains is probably 90% of the work...
>

Bah, just ignore me wrt the supplemental info per chip.
That solution only works for the chip fd used to request the lines.
If you close the chip and re-open it there will be no connection between
the new gpio_chardev_data and the existing line requests or the
supplemental info.

So it would have to be a global indexed by desc as you suggested.
Well that sucks.

Cheers,
Kent.


