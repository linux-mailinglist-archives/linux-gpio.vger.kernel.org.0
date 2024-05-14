Return-Path: <linux-gpio+bounces-6346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 787AA8C4B89
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 05:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E41741F21A02
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 03:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C10FBA45;
	Tue, 14 May 2024 03:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGJcYTOj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE62AD53;
	Tue, 14 May 2024 03:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715657823; cv=none; b=bMVygC4S3AtsUjqeH52lB7ZLJazIgeUMN2cfKl3kuUTHaPW43tUb/d6BgUfxXb8DHJx5jtJlU3uDg17oARGV8kMR/ebHIZ6y0JioytVw1TucYvpXZooBAIReVDhzdikUsCNZuv4pL3+E/5MLD/uKVghmlu4USnDkVw+9XrHcQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715657823; c=relaxed/simple;
	bh=wNxgEplY1U+bfVyV+K/LzSYBF/hHNlSg+9Si5gIrj/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlP4kOsinycV0HkBTgwhz+g12jaxmQAjz/hmSLOrtOkDZWZN9wzb7mAcB1T2BBBxU0FEHX039Gb1zmUrHN5rGR0wnhjk6gicAOwA72nn/h9AWX/Eu/ZKB5Q9oQJBMHFKkEMz7ZGugueGSyj7yJJbuhpkEWTKUH+O01ML8kt7ePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGJcYTOj; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c99aec9598so2027575b6e.0;
        Mon, 13 May 2024 20:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715657821; x=1716262621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D4diyAXoylKwq6hu+E7WuTzqNCNKPoRg+9c0MpBL6jk=;
        b=lGJcYTOjH19Q7TKRIwxXgEcGQkH3Sl5/NPj5Uvz/NKPDT5o36mAr1py/VvG4bE26Li
         DKR8IfJB1UULKhpxD7GA/fxJPucVM8tNaDA+EePojEY3LPvT0wdVP5Y0WrJf7s+vYTCM
         YdBNpD7kBwyi3Vd8XmMBm8BcMrZHnRkmNrk58wcCMQu/r2VkeuUiAGKPycAtfAmetfal
         IPtfJHJLYusqydQ68Eh5Izbrv6BP0IlOh6vfzCWyEblkc6hQ9b5twfDn2l46st8+vCgP
         37Vx8ykDVJdDsDmR7EX3dZ46JKMrX51KZ6AmqE0aO/GouA4cEZhG3/aFILbAj2X1HuzP
         4Inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715657821; x=1716262621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4diyAXoylKwq6hu+E7WuTzqNCNKPoRg+9c0MpBL6jk=;
        b=WbncQDMPRzDwSDNQvZvW8kO9jUDJz1c5IaBL/4+RKv0YW4ar0m2XzKZfAR9kgoDoqb
         61DM4uQca+DETKFxJaTZdBrkjWKq/he0oR7IwNVGyy99TS1nO/ltaCTXkiCroCdEe4a2
         Z3rQObzKBrdky2PIPY7VAQpf8w9yPbE0/8CSuOieXhnB93nOpQLY2TftfaAVGAyLcC8d
         ipadKMASDBjBxkI08Fd8pqJAvF+ZAfOEGNPREj/ZzFun0q/U0d4PSGVuEFbTBIL1Bzes
         nD9hx22uUIhGAotfq2KpPUsqgQwLuCrHQLm8vggv7AZBQv4dMSxY5shSNp0WzepiLDb3
         63MQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+cd69aRSulraqVhX7IWI8k+Bdyva/tTd8qcupGQHzFO6nHHsILW54+8vlLBT7fb3X16n4Q/jgrEeEYNnTLyMEXzXJO8BW6YraDA==
X-Gm-Message-State: AOJu0YzBynkKA+T12VTblbWXmwy8WBmfMcajkCMF2/PIrh7Iq6tHdBh7
	DkO2/9osUwal2Sflqv4zDoukN7lG9rMjMPauocDal/LuCO3xUvr1
X-Google-Smtp-Source: AGHT+IHqPcEJ9eSsk2AiHKcN+HkBAVAEx/aYvE02nXN4bMR8AR8tZFBYDbXcMng1DJakt/OhYOmzuA==
X-Received: by 2002:aca:2b18:0:b0:3c6:f339:7f4c with SMTP id 5614622812f47-3c9971db182mr11999860b6e.49.1715657821410;
        Mon, 13 May 2024 20:37:01 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a85f3fsm8092909b3a.82.2024.05.13.20.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 20:37:00 -0700 (PDT)
Date: Tue, 14 May 2024 11:36:56 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: cdev: fix uninitialised kfifo
Message-ID: <20240514033656.GA24922@rigel>
References: <20240510065342.36191-1-warthog618@gmail.com>
 <171534996897.34114.8159265536879918834.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171534996897.34114.8159265536879918834.b4-ty@linaro.org>

On Fri, May 10, 2024 at 04:06:16PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
>
> On Fri, 10 May 2024 14:53:42 +0800, Kent Gibson wrote:
> > If a line is requested with debounce, and that results in debouncing
> > in software, and the line is subsequently reconfigured to enable edge
> > detection then the allocation of the kfifo to contain edge events is
> > overlooked.  This results in events being written to and read from an
> > unitialised kfifo.  Read events are returned to userspace.
> >
> > Initialise the kfifo in the case where the software debounce is
> > already active.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] gpiolib: cdev: fix uninitialised kfifo
>       commit: 3c1625fe5a2e0d68cd7b68156f02c1b5de09a161
>

I've got a patch series to tidy this up and catch any similar errors
earlier going forward.
It is of course based on this patch, but that isn't in gpio/for-next yet.
How should I proceed?

Cheers,
Kent.

