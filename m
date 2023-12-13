Return-Path: <linux-gpio+bounces-1387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7410C8118E8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9592E1C20F7C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC0033076;
	Wed, 13 Dec 2023 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCrUun2p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9708128;
	Wed, 13 Dec 2023 08:15:15 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ceb93fb381so5228846b3a.0;
        Wed, 13 Dec 2023 08:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702484115; x=1703088915; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yOUUHWkNOhCahFmCbRTrRuCSJdVjqTTZ7BE6QBv4gRw=;
        b=bCrUun2pXb4KlbJLJpLphGoCnowzdXkbMiK1/B2CbzJLA5YyIqykxhAnWL5uypDyll
         mRwjvmPTQFZq2/2Pr2SL6tKRhfkcIZEIEPP+MdkuuzCnZB0nhqEYHGuRC+tRG75iy20g
         3P22X1brI7SvZL4UxXXI7xZaJDeknEe1x+dxnupy8V6CRXPOtd+iFWqydin7gZloiB11
         +N2JZL/m5n96FdrxwbA9Vc9ukfh9fqCZ6T3SEoX3p9QUDEzBib2fPjPvXMsJHhrx5S7L
         CvKRiiT8m6NqLOwOIgOCIbKXMr3Q04bTH1+HnLIcRralnEnRHY6S2tFME4XOblLtULfi
         IJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484115; x=1703088915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOUUHWkNOhCahFmCbRTrRuCSJdVjqTTZ7BE6QBv4gRw=;
        b=Fbz3WAy/0YVGfAVXyOtedPE0SpAogdm+GeGPEx3b/fNMiRiNv53ycZ5WBLN0lUQRDU
         SRqpY3+9G/p2snnWxR1YFeGXHDvGJBJnPOvv3L/xmNOXY0+wUDUTGUS9xwbNTIs8pmzK
         6wVW21dQdiPFGWCi/KiWgzXZcwaABVTNjXD5yH0yRhHMjdGNg9BJKZ4PJQLMN39qE6Hp
         Ac6QZI+XRFCVx5zd5nTemUblAgZrn+iNaetU4vuvUnfv20sBIH01F9ta9bac42roICdr
         jsEBb6JrGvcfTsxZ5qHlqL0UyRV7kxnLCTCFLs3fQD1+0zn5rZLVI3KHpQOVTxyUDlT1
         Mvwg==
X-Gm-Message-State: AOJu0YyPaOGVCFMllqu/6AGpkMv3xSfQgp6vGlt5viHHt6izQASP3YDK
	j5JCJqu47WPd7qQtUywW8bUoQlO3OBQ=
X-Google-Smtp-Source: AGHT+IHYv019+2GvnGU208A3I2ElJ3H2k/IeYI1PrhyI1RgzmWhySZaaWhpbhpG1z2uKTNbm3nmaYg==
X-Received: by 2002:a05:6a00:189d:b0:6ce:2731:47b8 with SMTP id x29-20020a056a00189d00b006ce273147b8mr11025494pfh.24.1702484114891;
        Wed, 13 Dec 2023 08:15:14 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id x11-20020a056a00270b00b006ce7e65159bsm10127487pfv.28.2023.12.13.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:15:14 -0800 (PST)
Date: Thu, 14 Dec 2023 00:15:10 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH 1/4] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXnYjoXHGiar-hvJ@rigel>
References: <20231212054253.50094-1-warthog618@gmail.com>
 <20231212054253.50094-2-warthog618@gmail.com>
 <ZXm3rayrcvfO1t1Z@smile.fi.intel.com>
 <ZXm_WsIpgIyOUNHt@rigel>
 <CAMRc=Mfri8K4ZqcHb_eQY6gi+q_-uBZc2wiMrrb-+a7Tric3FA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfri8K4ZqcHb_eQY6gi+q_-uBZc2wiMrrb-+a7Tric3FA@mail.gmail.com>

On Wed, Dec 13, 2023 at 04:40:12PM +0100, Bartosz Golaszewski wrote:
> On Wed, Dec 13, 2023 at 3:27 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
>
> > >
> > > > +out_unlock:
> > > > +   spin_unlock(&supinfo.lock);
> > >
> > > No use of cleanup.h?
> > >
> >
> > Again, that is new to me, so no not yet.
> >
>
> Yep, please use a guard, they're awesome. :)
>

Before I go nuts and switch everything over, is it ok to put a return
within the scoped_guard - it will automatically unlock on the way out?

Cheers,
Kent.

