Return-Path: <linux-gpio+bounces-5912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD28B4652
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Apr 2024 14:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 554C81F247A6
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Apr 2024 12:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23E04D5AC;
	Sat, 27 Apr 2024 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRWdNeeh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B730446AD
	for <linux-gpio@vger.kernel.org>; Sat, 27 Apr 2024 12:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714219748; cv=none; b=cfaZ0HjgDn0hnsVLsvHvXFg3RvawkTA5FxfhGYC4dWcDPIOdb08qxDOSVQiIhcsV1j5dhu7wMNVgh5q/ktL+YwJK5PXBu6Qd83xAKpEPNC2b6tuSwCL7Jqr27z+XLTW8kDpX+qUTQRoB4TiAJwyqUq1jNHcUaRa78UvoAGv0YiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714219748; c=relaxed/simple;
	bh=u8QGEotXiwAafjK9Vw2YjXHjgyS7EVLh2jq93JsPzdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4CSStxhsMTdkk7uaHGrsUtdheGe/UTB9gVuRXBBuNyyIyvVyfXkq7EU1dBAlORA56GwdTXvMPcmn3F3ZYrxWJ1tQfc4jYmniIiWFzd7uKc5l6J5XaIQVLNI8RlHiU1+x8ku1RFh4CVI8kgRyBNVo71RSjmqI4jepcpCiH+jfs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRWdNeeh; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso2016084a12.3
        for <linux-gpio@vger.kernel.org>; Sat, 27 Apr 2024 05:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714219747; x=1714824547; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EPaxrRc/bDyASZ4kEZT4tqy6dF0aAUBGhjbeaI4ONWc=;
        b=VRWdNeehsDQpvK4P/km+2ga+CZ8yY1TiM/7fLi0NN4DWvs8suJJkaNAJ2Cecj6zoba
         SIyjYim89jVAGq2iESCO9cSou8SBy2nhOQRGAnxqxZ0Wj0ee3mPVb4lxAt5atkLIsuS4
         dahDZcd8FO6hg3Lu1nvFxq1wrgabeofnE19mrRfpb6KrkppCXE8q54C4P+BddWZADd/6
         iZ7VmhrrEUTY6qTB+I3SuEmGjlnEc/p70y+IqeD+5X4n8+FPeLRu7KGphJvodiSmV927
         tRy/kfDr+Jag9IUI0WScuc0TotaSol05rNqilE/Qs/r9syo8VFCbGoFh//PCYEr1sgMq
         llsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714219747; x=1714824547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPaxrRc/bDyASZ4kEZT4tqy6dF0aAUBGhjbeaI4ONWc=;
        b=YUcjbSfFAT0XZL9UmOf6q2gFe921qTOreXuu2TxnkhRFRT/wSz/7/KxTW0cl/5IEbf
         MIVLD4HMRgUGk4/BkbnXw6TvKPxrod+0c1zxY6TXHjH9ONiF+w/Bw6dCQkyCf7k9gLXe
         V5Z9VobxHtEJEoCUbkmXNEzHYmtzAPaAJ8zjqd6UqhDHZ2CLS27kt/jwKIXQ/dHfcPaz
         XsGooAHs7MHPXIBnLybgLwVCBBtF1IT7K9RC+2k+lQmlmOg1g2KWhULpp8AJ8+GiLa2t
         9yT4x0O9LR6BEOJYnAnl1B40GcvQZDxXbVv/+D1V+JLaEg+P5EujDM2VTeK5YtkBYwom
         LUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxEe5t8puxiwTgmGiHE1hsalZ2gHUYf3GAS6xf6ONPOY7yjoXchLQNQuKufxAAgiACQTbG3T9zi06Zcd9c9H4h5avou//bHzNQgg==
X-Gm-Message-State: AOJu0YwhA3jp5nAfxcwr7PwDXGbcfNmieSfnXQoIrBNkPDok7OABtVKZ
	J20ouJrBVnC+n8fG3Vi2FViS6OcGOSiq+B7U1CpAVNsGA3/y44JS
X-Google-Smtp-Source: AGHT+IENewNgy5z3lm8S4C5y+SNaqgNKu9Tcq85O6/b92aVh23LJh55D5KkDKBYaCdy3v3uiBQdQWg==
X-Received: by 2002:a17:902:ce09:b0:1e5:28cd:4ef9 with SMTP id k9-20020a170902ce0900b001e528cd4ef9mr6254223plg.30.1714219746607;
        Sat, 27 Apr 2024 05:09:06 -0700 (PDT)
Received: from rigel (14-200-166-65.static.tpgi.com.au. [14.200.166.65])
        by smtp.gmail.com with ESMTPSA id m6-20020a1709026bc600b001e99ffdbe56sm11094306plt.215.2024.04.27.05.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 05:09:06 -0700 (PDT)
Date: Sat, 27 Apr 2024 20:09:02 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Gilles BULOZ <gilles.buloz@kontron.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [questions] : gpiolib and gpioset behaviour
Message-ID: <20240427120902.GA367260@rigel>
References: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
 <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com>
 <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>
 <20240426020720.GA9777@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240426020720.GA9777@rigel>

On Fri, Apr 26, 2024 at 10:07:20AM +0800, Kent Gibson wrote:
> On Mon, Apr 22, 2024 at 06:49:05PM +0200, Gilles BULOZ wrote:
> > On Mon, Apr 22, 2024 at 3:55 PM Bartosz Golaszewski wrote :
> > > On Mon, Apr 22, 2024 at 2:44 PM Gilles BULOZ <gilles.buloz@kontron.com> wrote:
> > >>
>
> Note that the mask in gc->get_multiple() is unsigned long*, so it is a
> pointer to an array of unsigned long.  Its width is not limited by
> unsigned long, but by the bits parameter.  In your case the mask you pass
> should contain multiple unsigned longs to achieve 112 bits.
> Refer to gpiod_get_array_value_complex() for an example of building bitmap
> masks to pass to gc->get_multiple(), in that case via
> gpio_chip_get_multiple().
>

Bah, what was I saying here - both the mask AND bits parameters of
get_multiple()/set_multiple() are bitmaps of width gc->ngpio, where the
mask identifies the pins to get/set and bits contains the values.

My bad - must've been before the coffee soaked in.

Cheers,
Kent.


