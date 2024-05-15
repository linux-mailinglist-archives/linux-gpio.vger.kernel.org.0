Return-Path: <linux-gpio+bounces-6379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AC38C62C8
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 10:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10FE31C20F5C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 08:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E59F4CB5B;
	Wed, 15 May 2024 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RMgYgJZc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3255482E9
	for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715761596; cv=none; b=l/YGXpPO1BjoMk0rBpDRVWlsd+rJJcT7+Wu2znx5IMFk6SHyRkEWkvotvpkpg2GDGYtjqO6ZpfO4olJFMP/Pm9VsXFdyhkvaHuOoP1kuGUPsn5Wy1J5vNiNM+zKbkRINw4wB8VtNVL0h871E5RLNVi4WjmgKXXg9eXFwC6OHwSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715761596; c=relaxed/simple;
	bh=qpAX27CPjbutx4wNHgMLAtuSjlQKIat+t/83BVHnAyg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMCqktI/EmQQ2ELTSowWdWvDkO0od4fNrJeKxUeCgVaqUbpldtVvPcfvDZoMQ8Vco+Q8HXKiO5c9bp6g/eYZEltPn/T2/LPsgMWTyi18lwJMcWgWo5ebRfCxETLWMcujHE6/49J+8A4EBTw2POLPWk2xZSyo0xrfGH2SeDAsAp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RMgYgJZc; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e3e18c240fso73088831fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 01:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715761593; x=1716366393; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ghSzCbxe3CIBH4wSN9MzNnaE7hnfesnG24feXUkl11k=;
        b=RMgYgJZccXLKyYoFC06Jug5uLulR+lx0FXCqRCdWVxD9ULuTmjYlaYgfCwc3AYDhvv
         68KX5Nq1VD0/I66RiJMxTxCmJeUxPP2ytqITneZn9IR3tNQ6N/XYEBJ6i43HrUFmuFuJ
         fCP4AucFSzi35sydcP3+GBWZrxVFw+9e8RUUTaJw5HcVXTsOUVdonviVPS9C55oZxDru
         HBpG7vd02Q13Cnm//McyuHot81eKYhHZ/7BUwAQwwngHaDBbYEUPjUYA5P2IyAr5hJkt
         mEm724lEje/X3DWgVxDDJDBnaeeH0qG3Af8du+2pFik9+a9qL2KLQLSyk5bjmRcWE7+x
         RrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715761593; x=1716366393;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghSzCbxe3CIBH4wSN9MzNnaE7hnfesnG24feXUkl11k=;
        b=EqSqP/MT8O+9yRu5V9uVAUwvM48sTTKdL1exmfD+wWxhn7XmwZLG0nMGYJ75kDyVGs
         h2Tz9Yyd0zRSNYewKy6iN4uf8lTNJoN6bU3CunxIMcVXoabvvXdIV/KnUsFGol9Lnp5o
         k0dxmGhnC5SOrunGo9OA1A6JrYGgVoGzMhbnqBVID3uM5Q2ihRwEtZyWYZPZxa6K4Q4p
         xrS/QkbAK7rD9Nl8APOzamqbzOKjfXssOrgJiajLdZLA5BF/iHbVsWw61VSAamXDZCmJ
         ibi4EcL1b+BLDGX2xu/Ez3b5wVj1+0932v9G9oOkZ25+4HEiiJrOE6RohL5DB4rtxSvL
         Ip5Q==
X-Gm-Message-State: AOJu0Yw2cQWdLnjipyNy0UCwxTdFNlCa3B9hlqFzpg1r4utRomG9wzuM
	KqUVIrebTTvTB9KguyRlsk3t5hlygAJIHEAtNdEBj42sqeqQkaeXilvAj+qC6ncIAj0y/JGq1U9
	hayJ210zEwoLutSK4edkbqgCFsZGeTp/CkCq5K9TgyvAmLzTtKR0=
X-Google-Smtp-Source: AGHT+IFYUQeXjH9l2dScMRfvhU/Zc2VDT56seC4AsIJDRw2Suer+NSL1OeyH4dhXrhOQSKvhxZbqLLFtY0MUVWxDzV8=
X-Received: by 2002:a05:6512:e81:b0:518:c69b:3a04 with SMTP id
 2adb3069b0e04-5220f770e6dmr15845307e87.0.1715761592772; Wed, 15 May 2024
 01:26:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 May 2024 01:26:32 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20240514133804.GA107324@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507022106.GC26136@rigel> <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel> <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel> <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel>
Date: Wed, 15 May 2024 01:26:32 -0700
Message-ID: <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 May 2024 15:38:04 +0200, Kent Gibson <warthog618@gmail.com> said:
> On Tue, May 14, 2024 at 06:31:39AM -0700, Bartosz Golaszewski wrote:
>> On Mon, 13 May 2024 12:13:31 +0200, Kent Gibson <warthog618@gmail.com> said:
>> >
>> >> > /**
>> >> >  * @brief Set the bias of requested input line.
>> >> >  * @param olr The request to reconfigure.
>> >> >  * @param bias The new bias to apply to requested input line.
>> >> >  * @return 0 on success, -1 on failure.
>> >> >  */
>> >> > int gpiod_olr_set_bias(struct gpiod_line_request * olr,
>> >> > 		       enum gpiod_line_bias bias);
>> >>
>> >> For this to work, you'd most likely need a new struct wrapping the request
>> >> and also storing the line config. Otherwise - how'd you keep the state of all
>> >> the other line settings?
>> >>
>> >
>> > Yeah, I realised that when I went to implement it :(.
>> >
>> > What I implemented was to read the line info and build the config from that.
>> > So no impact on core.
>> > Not the most efficient, but for this use case I wan't fussed.
>> >
>>
>> I think those simplified requests should wrap the config structures, otherwise
>> we'd have to readback the config from the kernel which would become quite
>> complex for anything including more than one line.
>>
>
> The whole point of the simplified requests is that they only deal with
> a single line.  And the config mutators only deal with a single input.
>

For now anyway. :)

> Wouldn't wrapping break the ability to use all the other
> gpiod_line_request_XXX functions, and so require adding more functions
> to make use of the simplified requests?
>

Not sure why? You need a request for a single line anyway and you need to store
the config for it somewhere as toggling a single property will require a full
gpiod_line_request_reconfigure() anyway.

I don't think it'll be enough to re-use struct gpiod_line_request here, you
need some new structure. Unless you know how to do it. In that case: show me
the code. :)

Bart

