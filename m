Return-Path: <linux-gpio+bounces-797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF237FF89F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 18:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98CBB2817C8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 17:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E93258133;
	Thu, 30 Nov 2023 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v2k173ym"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA6D10E5
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 09:43:25 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4b2aab419afso120527e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 09:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701366204; x=1701971004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14uxlrCdKAjLbCLx+8PJH1+a+HObuZd4biY2ZHTShlo=;
        b=v2k173ymT1jpTBuz4BsWPyS9ScnMK2ol3X3fCGIJrD1nIaY6QtkAeTJna9xMEltF2g
         heVP1q5Nk2Kwbjk4aK1sII/6JFwqPZtmbR/BtYEClMC7+qt3A9xHJxivuDRiZrEQM0uy
         yiwNlHUqo4BfeVw1W665keCVkpf6xrJxxqQY9QQXik59YvF6cPYpw66bkCG58R60U7ig
         T4MWMTCrEr1Q/r8QMUOrW4P4sQqYirPj1WpFIyJerEwaDwvMMicHRIxCJOpQh0MEAbmW
         /sh2+pdE68mbh7bvIHHbR33acgnEWXhwqcbEKbLSD0A6fEwHgy8X0ooDNP5h5MiUBuyI
         +2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701366204; x=1701971004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14uxlrCdKAjLbCLx+8PJH1+a+HObuZd4biY2ZHTShlo=;
        b=pX4YQwByHPIqT4cA8QYic+PTBmpI1GQRp0VU2Esv+vM/nGQolna+6HBr33/s1aQGvo
         fIO4wLbBMLqEknptU0Yo85maNm54fRTsm0kvX3n04mt18LIsaycSsl8F1Ol2aVo7/quA
         aJwmBEVzbyJnhL9U7qDjZy617kvwc0Wt7fL06JOB4vftR6AYrT9cQdq5jkJQ0BVVegBF
         Or3gv5I2KZOP4K9F8J8VC89FhBhqe3no4C0791ajvZKnZDb78JNfyMaL8AUgtJxCyvMs
         3/Z65zBkLTGiY3UHDLNXrAjDruw4ByFgDTMOtnutuXUjJ/xgzNDpphDS+B5EVKs7KM5A
         Vccw==
X-Gm-Message-State: AOJu0YwP2Rkvw2gjc7sSyOpU5/4OeUM1I4wTk4m/Jur/ll27rPnI+bZ4
	DpSle1zsBgt+51iWPz8kfFvpchY4IxdZZuwYxL5/sw==
X-Google-Smtp-Source: AGHT+IHdm5ZfSSccjAd5rIBBdPjUn6kaUJLSr4mGe5naXMKUwGwxR5dee6WeMqL0zbSPV61Ps9+prBL6ttnCB6SOZEk=
X-Received: by 2002:a1f:4a45:0:b0:495:e688:72b7 with SMTP id
 x66-20020a1f4a45000000b00495e68872b7mr16727914vka.4.1701366204615; Thu, 30
 Nov 2023 09:43:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130134630.18198-1-brgl@bgdev.pl> <20231130134630.18198-9-brgl@bgdev.pl>
 <ZWi6V8tG4YoNRkpn@smile.fi.intel.com>
In-Reply-To: <ZWi6V8tG4YoNRkpn@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Nov 2023 18:43:13 +0100
Message-ID: <CAMRc=MfoJ+NFNFand8K7DVZP3Qdz=kp5+XBG_aAJ7-Twq8wvZA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] pinctrl: sppctl: use gpiochip_dup_line_label()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 5:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 30, 2023 at 02:46:28PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the new gpiochip_dup_line_label() helper to safely retrieve the
> > descriptor label.
>
> ...
>
> >       for (i =3D 0; i < chip->ngpio; i++) {
> > -             label =3D gpiochip_is_requested(chip, i);
> > -             if (!label)
> > -                     label =3D "";
> > +             char *label __free(kfree) =3D gpiochip_dup_line_label(chi=
p, i);
> > +             if (IS_ERR(label))
> > +                     continue;
> >
> >               seq_printf(s, " gpio-%03d (%-16.16s | %-16.16s)", i + chi=
p->base,
> > -                        chip->names[i], label);
> > +                        chip->names[i], label ?: "");
>
> So, as it's non-ABI change, we still can use "reserved" word here as well
> ("Unrequested" or whatever.)
>

See my other comment regarding the changes in output.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

