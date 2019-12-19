Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEBD12630F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 14:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfLSNNB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 08:13:01 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32772 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfLSNNB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 08:13:01 -0500
Received: by mail-pf1-f196.google.com with SMTP id z16so3246930pfk.0;
        Thu, 19 Dec 2019 05:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1gRwWTLS967Ubmo9QBFf6oeS3GYO3y9qdE++OzuCjo8=;
        b=WKhevbX3LE/LkS46gPKn0pKaWJ1UCYgcM/cOiNU2eJNXWeJsUyqiRs/NsDzOWFuXaG
         DHUhnDLQgUmbEA7kPJjVcaXltfn1NdN4M5HO0EF1R37j0qMHWpWutAqHDPSrEckIZdYD
         bJiT+XP8zeKlbNGUYT6XKe/IIPVN9OoNEHrEjv3xJLP10qsRU5EOLSIanlGodcna33c+
         b07r47q5KK9YkOWTO5zhje/FAhCTL/rZ36ZN4WGxuN6s0jF+aGPOPE5zOzRYSAyDxaAa
         FkviBuNB2o9n7tKLzHqojXxgwyfh4ASBE1HJmXL54iw4KBxUtqgGiiaqtBwCGB+V8eBx
         3v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1gRwWTLS967Ubmo9QBFf6oeS3GYO3y9qdE++OzuCjo8=;
        b=EBROHK4wnHw+Xx8L8+GP5zsHclvU2APBLAi3WxPXuakTKIn271yE43x/4vzp5NCIwf
         S5RCnBXeZxuAQcbZfaJuESJiUsE6ArM5a89N4RjkuNUUBCLcE3BsAk0f4yhfHBGGQ+cX
         BKNZPj7GOawCDDTxgrpNOQ06O4sPpeM5PbmCrvQnwFhMfFszGNqO31Ejon3DIkEAKPl7
         Dnyntq2Ou1iXbi3SC+VH3VEl+aF2jq1GZ9ga4Burf5bGfeZDWGVnlUaxqZJdm2uIgG8B
         UGqFdC6JIiVLtZ+HcLaZGoQaJ14VTEy+zo1TDiDfonVcZYI0qnwcfpsuVW/hx1vUNO+I
         JoKg==
X-Gm-Message-State: APjAAAW/bxxSNdEvjya+/keCF5j5sir8OnLshSZ0Lrrp6HK9LtAtlz0S
        PPiR2Mcbp1UTmspQSfDqhw0=
X-Google-Smtp-Source: APXvYqy0izi6mgWThqnu1MUAe9tocw6rn0MpkH29qND2aoM9yGkQdgIqZuH/xgG3IqQ6u4j/XtcGEQ==
X-Received: by 2002:aa7:8007:: with SMTP id j7mr9721396pfi.73.1576761180732;
        Thu, 19 Dec 2019 05:13:00 -0800 (PST)
Received: from firefly (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id w66sm8631924pfw.102.2019.12.19.05.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 05:13:00 -0800 (PST)
Date:   Thu, 19 Dec 2019 13:12:49 +0000
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
Message-ID: <20191219131249.GA12008@firefly>
References: <20191204155941.17814-1-brgl@bgdev.pl>
 <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
 <CAMpxmJVXVVVMPA_hRbs3mUsFs=s_VtQK9SvvYK3Xc5X27NPTKw@mail.gmail.com>
 <CAHp75VfXc88Fa6=zs=9iToz27QdXHqRCDPQwBPs2P-rsBF8nHw@mail.gmail.com>
 <CAMRc=Me4xWsQggmr=BvJrA9-FnPkxFkOYsRTsSXCtyNwFnsHNw@mail.gmail.com>
 <CAHp75VfzP8-0wKmPTTKYe+fc6=r_4sVcJPyOsM8YTuH=i4rxmA@mail.gmail.com>
 <CAMRc=MfxteQDmeZn_Et0uFs2cPvLGpJ5BTeBOn37o=2Oo_eU=Q@mail.gmail.com>
 <CAHp75VfeEB5RudwMaoiMTMMY3zW-kz-h=rJ3Cu5_tyRL6ZuF1w@mail.gmail.com>
 <CAMRc=Mcy=Q+9Eb6mb5JEq+CCbxgBY1CfTDsYj1Rt9bcLXgeY=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcy=Q+9Eb6mb5JEq+CCbxgBY1CfTDsYj1Rt9bcLXgeY=g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2019 at 02:05:19PM +0100, Bartosz Golaszewski wrote:
> wt., 10 gru 2019 o 18:00 Andy Shevchenko <andy.shevchenko@gmail.com> napisał(a):
> >
> > > On a different note: why would endianness be an issue here? 32-bit
> > > variables with 64-bit alignment should still be in the same place in
> > > memory, right?
> >
> > With explicit padding, yes.
> >
> > > Any reason not to use __packed for this structure and not deal with
> > > this whole compat mess?
> >
> > Have been suggested that explicit padding is better approach.
> > (See my answer to Kent)
> >
> > > I also noticed that my change will only allow user-space to read one
> > > event at a time which seems to be a regression with regard to the
> > > current implementation. I probably need to address this too.
> >
> > Yes, but we have to have ABI v2 in place.
> 
> Hi Andy,
> 
> I was playing with some ideas for the new ABI and noticed that on
> 64-bit architecture the size of struct gpiochip_info is reported to be
> 68 bytes, not 72 as I would expect. Is implicit alignment padding not
> applied to a struct if there's a non-64bit-aligned 32-bit field at the
> end of it? Is there something I'm missing here?
> 

Struct alignment is based on the size of the largest element.
The largest element of struct gpiopchip_info is a __u32, so the struct
gets 32-bit alignment, even on 64-bit.

The structs with the problems all contain a __u64, and so get padded out
to a 64-bit boundary.

Cheers,
Kent.

