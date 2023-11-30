Return-Path: <linux-gpio+bounces-795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8510D7FF874
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 18:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B56EE1C20E3A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 17:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A5758105;
	Thu, 30 Nov 2023 17:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="L5/BopSs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A0F197
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 09:39:16 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7c47142d595so662985241.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 09:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701365956; x=1701970756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNguKtwIvnyO2Gj9lJbmb0T+V4gmh2R9drIGOrDbnbI=;
        b=L5/BopSsLhX7lwIzm1g8i14mn3tSN6qeGnNVAVX8VV6dzxAwJ6M0gqWDDBZIj0w+l9
         cLWUaAYUqF/Yi33yahVsLvvvRPpdERVSOrMotkPOWb6znmoUEMWHbY+IzdfekDiH4MJh
         TXdpGdwDXyJoBkw2ytexZcqHbsKCC4DCxhyPdL84lZ4GaKB5ZR12GfgFTGK2WKZCfemv
         s+aOPor5BZpxlYHbbnwtWqLsO5seARIAXpZ94axgqch2bOzdQ36RVfOk7Kz2pwdVUJpt
         PJfKdOtlGE1XZcsRbrGcNzV5EhgWOf905mNMiqyocuDwgqylv0LaODY2Qz1qr6AkoL/8
         Tohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701365956; x=1701970756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNguKtwIvnyO2Gj9lJbmb0T+V4gmh2R9drIGOrDbnbI=;
        b=KdDobHw8cOfuOvnI/fQmGZxpv+c+nqkhGeX/dzNxjhQ+81wTlGyVIWzeXleK4FjtHU
         gNx2cgCULRmBN2sC1EBZ7dmfDvUU3QiuJgcRd6pPyxBFqIk6x/wGsfVuu2SbMz9lGP79
         nx7qVINz99t6adpBhI8rBVWtACd471wK3FTrmC9ISD+RC/qeFs4wIyHwsfqRGm/n2/jv
         P11RNEm4jnQyThWcwhcSfi+Oa8Ns+AjYrHhsJoaY4Cdr7sn5tl9+utSY/lHbvhZxxZfv
         0M8jjigvwV1o+mu/r5boShIrOhBfKB0CFeEk1uQhW2c5FaYLqfXzbV2vpgSVCi2PNRf6
         CRPw==
X-Gm-Message-State: AOJu0Yz4fDgeNOHFFAwlpv8NYenwpMwpOiXVP7FDQKQ/mdg1TmRcbgxF
	GlRVOE4VcaZP8sZ4F2BRPuPhswUaw9Jm30L217++JQ==
X-Google-Smtp-Source: AGHT+IHlEzVbLFXtUVKvNXK5OPlaLnHH9WMmD+cMOElsPuiPjPJbokxrcbzXeAaCqBx4JFdaaGRtna1fzpG7H//KYvA=
X-Received: by 2002:a05:6102:1627:b0:462:7e73:c11f with SMTP id
 cu39-20020a056102162700b004627e73c11fmr27567494vsb.6.1701365955833; Thu, 30
 Nov 2023 09:39:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130134630.18198-1-brgl@bgdev.pl> <20231130134630.18198-8-brgl@bgdev.pl>
 <ZWi5_VHlUSmgpLiB@smile.fi.intel.com>
In-Reply-To: <ZWi5_VHlUSmgpLiB@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Nov 2023 18:39:04 +0100
Message-ID: <CAMRc=Mfuuri-67KBNWXeHApd-qHYQ0wJeU-6A5eb=B9NeQT8hg@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] pinctrl: baytrail: use gpiochip_dup_line_label()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 5:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 30, 2023 at 02:46:27PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the new gpiochip_dup_line_label() helper to safely retrieve the
> > descriptor label.
>
> ...
>
> >               seq_printf(s,
> >                          " gpio-%-3d (%-20.20s) %s %s %s pad-%-3d offse=
t:0x%03x mux:%d %s%s%s",
> >                          pin,
> > -                        label,
> > +                        label ?: "Unrequested",
>
> This already fourth (?) duplication among drivers.
> Perhaps you want a helper:
> gpiochip_dup_line_label_fallback() // naming is up to you
> which will return the same for everybody and we don't need to hunt for
> the different meaning of "Unrequested".
>

IMO the overhead here is very small in return for better readability
(IOW: `label ?: "Unrequested"` is more readable than some function
named `gpiochip_dup_line_label_fallback()`). Given the string is in
.rodata anyway, I wouldn't be surprised if adding a helper resulted in
bigger code.

> Also the word "Unrequested" is a bit doubtful as it can be a label, right=
?
> Something with special characters / spaces / etc would suit better?
> In any case it might require to add a warning (?) to the GPIO lib core
> when label gets assigned if it clashes with the "reserved" word.
>

Agreed but this is a functional change in debugfs output. I know
debugfs is not considered stable but I didn't write it, I don't know
who's using it and I prefer to leave it be.

Bart

> >                          val & BYT_INPUT_EN ? "  " : "in",
> >                          val & BYT_OUTPUT_EN ? "   " : "out",
> >                          str_hi_lo(val & BYT_LEVEL),
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

