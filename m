Return-Path: <linux-gpio+bounces-6134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EA08BCC36
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 12:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27F501F222F6
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 10:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7021B142E85;
	Mon,  6 May 2024 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKzenqEF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9B275815;
	Mon,  6 May 2024 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714992171; cv=none; b=Q0odef+qcKQ3oEP7oHpK8d56lsWGbLpJvOZZlKNMMpv3UzeK777gpjNT7a+NW7/lkfqOW5JUndbOGG7IsESWggtT2RVn5+2iOp3nsEYlHFR+5rIiRxou9lNMjkkIriGPrC+HzPnvaqfE1NqGp3+dpueCmabEZMNe0P+L7x/PtW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714992171; c=relaxed/simple;
	bh=UiZz9KC9jFIFcO10guUDoa2wRE35Np/R9y9L5ksGV/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccPnhuE3eaYGmfVaxUwjTEsUfjDUJJYc8+E86DDdpFkbx1VG/F0Qm97dTGEnbna81ViX7K21MR21cNzFwLeef2P9Ao95soQW0uZEqPMBjsFc6RLH0851v8XDDUzyQwggJBj5iPwnYoBDU/YPlrqrpXeDhr73izLCTUOXrNoYhSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKzenqEF; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f44a2d1e3dso1460892b3a.3;
        Mon, 06 May 2024 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714992169; x=1715596969; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UiZz9KC9jFIFcO10guUDoa2wRE35Np/R9y9L5ksGV/Q=;
        b=KKzenqEFEbYnVHjhP3Q53umISSc2Jp38rl9URqBHEq2o+f21u/NtKNeUP+HeC6JlhA
         NetUPr/KruLHJZXXyjWN/uRtNRK1r6REv0KNaSzLuWvR5Rvmg9JY0NGBuoCzIo1suigM
         rJRaq9UKQ/VS7P00rRIuPwS7WArRfnpWiaW4Rpdgxj0dd58WGg2afQtbDlQ3GBg6xAkO
         vU62fEGhJ9+yfr6dA2b4+3jtWJd4fXvvDBCCSE/VgXNeEXIaSlNVjhjeqCB5gR7Qy++B
         ihQ1oEstF2nYXlacn3devijuGvwadaYI57dI1nLnenpZn5adFI73//Ycw/F48Ny5Gewu
         dhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714992169; x=1715596969;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UiZz9KC9jFIFcO10guUDoa2wRE35Np/R9y9L5ksGV/Q=;
        b=nphuF/r0VjY3fZnKbpIyeM+5NfMlniG2vjTE2yUqVbp1gbkXdnXJmh6894oGC5ZipV
         7zAkekE/F9opzvYlAXb8ITSCunhDp84/4tZNsDadOO5eef/v+uTlY/tsUk2qzVe9lqW1
         lr0uLgc6irmQITlztHqKmrPenFDq0lbGmaj2d1X0k22hBDuqim7Pz9nHNFyFWi0sTCqP
         90hQU65HY6aw+Nw5VWjvQ8XsnvUF+19w2tgTgjT6vxBjhvWmc46ywfghTi6BHz55QNjq
         5zgWrwSBGlqgcmV80pthFQeoeZRMQI7KVTiA7m6ln5eTM8oW9OpsQv/mrzayN0kXTAoE
         E/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2XYZWmDUqhgwLas9Xlxo9ThF0w4qRm8lpwahp11Vu/2soqMN65sKyMrPZdh5nK+zjX+3tVNsL6z6zCUyU+EKbuYJaaQeqrEm2iVuvu3DuKIRXZLBp4gH+6DxE/91rX+GVauWUNdepdQ==
X-Gm-Message-State: AOJu0YwlSL6soIgV4ZWBA/PXvocU5R5vX9CuMC08ubbXTRS5zskVsU0x
	0P7rihFtVHqHWKPIOqmzUztlrAcTG5GGaILQC1NbvxXzyDPHhHjI
X-Google-Smtp-Source: AGHT+IG1B2j1G8++VLRdKCW19J1FTmH+RlbJED5pM1c2coS5AFZmM9sGuf0PKLAYvGJXT2aeVvVW9w==
X-Received: by 2002:a05:6a00:8cf:b0:6e5:43b5:953b with SMTP id s15-20020a056a0008cf00b006e543b5953bmr10617356pfu.14.1714992169137;
        Mon, 06 May 2024 03:42:49 -0700 (PDT)
Received: from rigel (14-200-166-65.static.tpgi.com.au. [14.200.166.65])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006f43eccf19esm7198783pfv.35.2024.05.06.03.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 03:42:48 -0700 (PDT)
Date: Mon, 6 May 2024 18:42:43 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Discourage to use formatting strings in
 line names
Message-ID: <20240506104243.GA47831@rigel>
References: <20240505141420.627398-1-andy.shevchenko@gmail.com>
 <CACRpkdap=KXuyoCjWt_v53ArRPynDQndAjjHfvapLUM7VWbbdA@mail.gmail.com>
 <CAHp75Vdn+F=MMAyguOFup5xyOCEVZowOordiEG1FQ9Y22kLdDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vdn+F=MMAyguOFup5xyOCEVZowOordiEG1FQ9Y22kLdDg@mail.gmail.com>

On Mon, May 06, 2024 at 01:39:05PM +0300, Andy Shevchenko wrote:
> On Mon, May 6, 2024 at 10:19 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Sun, May 5, 2024 at 4:14 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >
> > > Currently the documentation for line names allows to use %u inside
> > > the alternative name. This is broken in character device approach
> > > from day 1 and being in use solely in sysfs.
> > >
> > > Character device interface has a line number as a part of its address,
> > > so the users better rely on it. Hence remove the misleading documentation.
> > >
> > > On top of that, there are no in-kernel users (out of 6, if I'm correct)
> > > for such names and moreover if one exists it won't help in distinguishing
> > > lines with the same naming as '%u' will also be in them and we will get
> > > a warning in gpiochip_set_desc_names() for such cases.
> > >
> > > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thank you!
>
> Meanwhile, Cc'ing to Kent as well.
>

I saw it - makes total sense to me too.

Reviewed-by: Kent Gibson <warthog618@gmail.com>


