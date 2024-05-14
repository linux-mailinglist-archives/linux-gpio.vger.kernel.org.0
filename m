Return-Path: <linux-gpio+bounces-6369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11668C5747
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 15:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1263D2827B7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 13:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9563C144313;
	Tue, 14 May 2024 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lobHFjY6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E7F111AA
	for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715693890; cv=none; b=AJqVz8iNxTwDm8xZ8ZRaFKk/PA5n2/VulWCfqkiZKQIuBaczZOeGGXfA/G0oOF319a6GVT6nnVS27xTGB5c083TDn/nRkwwPlBxVER2ybtmA93955HGVNGHZp05CnCZf/+3gHoWovPXFaY3b8ruyMpv/4rj8zrUHP5o4mJQyk40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715693890; c=relaxed/simple;
	bh=/Xtor33fwKj/QJvQgF+PvJcNKtfwv26wBMvXQDP/ljM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tg6tqGCIEghWSFtGaxHDTCgCLoYHTkECnmKzYB8lgC/nnfPxx4eAviLm0gl5pZS1iqEP1mPtxfgQGhj9aJdWdcFVKjAfArNSRXw+HnMyXXsLdCez+zZ7P4SEzHkW+3eBlhxeIjdTlV5x8Xrzm7MZx5Z95b2fo65cHdFHZTUiXdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lobHFjY6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f4178aec15so4767377b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 06:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715693888; x=1716298688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xbKYOWDR4scbLX7SA9YwPW3YBRZA5xFsGW+d88nfiWM=;
        b=lobHFjY6IHbtWVi9hFsVbMwy02ms76xh9VbyJYo60yw7uLvhts/owa2HmEbQQNvBqx
         FXNTx9rY96JpzxUcifgQ6mnSG+nBsUfIjtjbSNIoY3v+6ZFxPLNvxgwfxuPOtZrwaOl/
         Ztz1/nWEZQ+jWWhBNzWODNKAtUqpXwNzligiUX04zmcwzD++U8xTtADODdMdd0+q644y
         6lEQr+FyywdEnn05Wu9icW8N/RpfUwR6/5VIHUfyxN5ZJBc+AaJJLPBTOu3toMOJcBKw
         jC394vhhUImR8ZcgbhrkM7B9H++SpVEmUnx9sjksjMB63tVcus3pGklB8yfY55MUIBTG
         l3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715693888; x=1716298688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbKYOWDR4scbLX7SA9YwPW3YBRZA5xFsGW+d88nfiWM=;
        b=AYKa2owrUYCrztxvgmpkYnEs2GoDHdgTAgPFdQDhUOYT8/m40UAsrXzce0S+dUc2xU
         VMlWuIisk5IcLRIQP6vTfKMFL6GMlZpq7nDLVAuMFU25PHafOKm4g6K9b9EYsXueCk7c
         rMQGpDBnwQ/jMUXvno9EcrymKLOZrgQ25AB6cqGGMltIef3SHeL4jtHrL4FxK/5V6s8l
         1mjvA422v+1/98VII1OuKamoppfMGs5KFn0w+ZJpISrPsKdEEB6FJHvyAg81ZZWr7fxr
         6s/l8muTIx1XaI16Q40lAwdEY8/QieRxawg/vl6RYSKIJD9qNNvTPfJuLiIQMNDZfPaJ
         H1vA==
X-Gm-Message-State: AOJu0YxeVFXRJwC+NecXToCq0qHYhmwLbM9jwQSVjdtqba+xPauAQl8U
	79Y3SDh53JTlzkEqYLXcfnelWZ9X3oOTR+ek5g8Kun6ZF3ggr/vn2z9X/Q==
X-Google-Smtp-Source: AGHT+IHGTonO/+V1QxXDWgacrbUyiZDn/mPZxeFBDdtDDeWQz2OFtt1KJqje1c1+pM4Az5Xt7yvlJA==
X-Received: by 2002:a05:6a20:7fa6:b0:1a9:6c18:7e96 with SMTP id adf61e73a8af0-1afde0e69demr12552613637.19.1715693888287;
        Tue, 14 May 2024 06:38:08 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ae0fe4sm9091999b3a.130.2024.05.14.06.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 06:38:07 -0700 (PDT)
Date: Tue, 14 May 2024 21:38:04 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240514133804.GA107324@rigel>
References: <20240507022106.GC26136@rigel>
 <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel>
 <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel>
 <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>

On Tue, May 14, 2024 at 06:31:39AM -0700, Bartosz Golaszewski wrote:
> On Mon, 13 May 2024 12:13:31 +0200, Kent Gibson <warthog618@gmail.com> said:
> >
> >> > /**
> >> >  * @brief Set the bias of requested input line.
> >> >  * @param olr The request to reconfigure.
> >> >  * @param bias The new bias to apply to requested input line.
> >> >  * @return 0 on success, -1 on failure.
> >> >  */
> >> > int gpiod_olr_set_bias(struct gpiod_line_request * olr,
> >> > 		       enum gpiod_line_bias bias);
> >>
> >> For this to work, you'd most likely need a new struct wrapping the request
> >> and also storing the line config. Otherwise - how'd you keep the state of all
> >> the other line settings?
> >>
> >
> > Yeah, I realised that when I went to implement it :(.
> >
> > What I implemented was to read the line info and build the config from that.
> > So no impact on core.
> > Not the most efficient, but for this use case I wan't fussed.
> >
>
> I think those simplified requests should wrap the config structures, otherwise
> we'd have to readback the config from the kernel which would become quite
> complex for anything including more than one line.
>

The whole point of the simplified requests is that they only deal with
a single line.  And the config mutators only deal with a single input.

Wouldn't wrapping break the ability to use all the other
gpiod_line_request_XXX functions, and so require adding more functions
to make use of the simplified requests?

Maybe I'm missing something.

Cheers,
Kent.

