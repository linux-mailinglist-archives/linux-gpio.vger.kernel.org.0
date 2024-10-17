Return-Path: <linux-gpio+bounces-11551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AFB9A24BA
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 16:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B74161F22869
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E311DDA09;
	Thu, 17 Oct 2024 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JECFjrh3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7714F98;
	Thu, 17 Oct 2024 14:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174575; cv=none; b=Awj1CR5d6syu9nw0gwQNFx9v2fqL3+t8xiLcRQrW/Vw1022pQ6Gtw9cA3EZxEn6a1TFiwY7KRp5PwI+JtGV5npK9OdIuEHqiT8Cks96XIw8zvAAgbboDaN9me26hhOeo5GtwyzI2TBwxgEiWCXhvU42F0l1nNJRXA7p8fibbTWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174575; c=relaxed/simple;
	bh=Clp9nXVxXgvxe3CHRg4I/MeIOrXxfjTTjQhiT/thtcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOKWpnySD8wjI1+8TnZMJ58eRqhbgERitX+1IKnJhBpKldCSz81lb60q7FYHtUYYLfxkXE9Nlx3WRQPar3OFb+nkpmHSQ+YcMlwzWf7lmYPlkb30PeIeQbmNCpSTgovs+NfPX0zIc3a3mbNkY2uNAR6XMkGoUmGIc03Bi/NA7IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JECFjrh3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c767a9c50so9339085ad.1;
        Thu, 17 Oct 2024 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729174570; x=1729779370; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7cj9apun95vyGQFdoF51K2b6n6YoqeEyD1r4HxHLfpQ=;
        b=JECFjrh3g5W/N48z78FOyF0d2Rc6uYdD+iP/TkaqQ0jQd9MWoS17kVRMsQNLdPfAeG
         kyPaia+Nf8UxS7+CvrH0bwGnobd9b/U1Ks6cB9xrJFNawBA+Ru5fisXzv+HtnRx/jhYM
         efsutrSuyxuFe4yPRsJ4odFelL7Ko8M7kDX3FA7kn3pf8/Cw1TOBmbaVygbVGJfL0iPl
         Mhp/Zlw9tAMfr5gu9VLam93r3nc9ZfHnO0tHIiIA8ivxQbJSQ5yewS96T2QFGOWaA6t6
         xXPZ/aoXN9cHDfo7q01xioBbJY0/MrPtGgBFevfWag+iRAAfM+lsyVfS3+X+EtP99OWm
         +6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174570; x=1729779370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cj9apun95vyGQFdoF51K2b6n6YoqeEyD1r4HxHLfpQ=;
        b=evpGkOH0mZ7mhGgE8e81spktc3y7nKaTboVMBkSHopFGniHFIoFW+DgBhtGi4YsuVE
         F+0xAXAWOzVQU316pmI1dYeNripMQc3MzeN3GwW+Zom5NMP8V/36tKkT1sNVRY1j97ny
         dwAD5e4wnhQeZgJ+LMlQ09u45aSbrDD7ZdwPTakIpfsJ0/IIMMKSKWE+1mDlZdc5JEse
         oHk++Fe3+fsnKvnxPe1JNb70kPTvNZztLQq8fTeyoq0Ejzd6MM0L+gU2WETQAeR626oX
         Jnom0QHgXY378wHy2bHtGu/e/s+DrpR34O22GY3mcbuK8f4JA7V/bHJrm+SBVRHho+u7
         BcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbQPjhJKdHaoxtaAEgn37/KRY2Q/aDIcJOCIBYdUO92R9HRva2OH3tt3+PMg/EAs4I1JPbKFD1VI9wNG20@vger.kernel.org, AJvYcCVs4pG8PZC66pB6yMOo/Ce1aOTffxYgH/0GJk3ZL14pdl6WWd4mlX5EW5ni3SfIWmEEL4+XSyXxqSf0@vger.kernel.org
X-Gm-Message-State: AOJu0YzhdXCL3neL/Q0pVAFgzaqT5fCN0uv+gpZ1oD/dffkt41vLer8D
	H6lSrBVGMObboo02PvPHTHxfVXTBYt0dyLT0+Jj8+/PKpMJhH4QR
X-Google-Smtp-Source: AGHT+IGjZ4AsmUt3ncqVh2SGn/Ao4yp8DcX0B1W7iNS/8hn6CW8cinswfJVEh0zNSpctWfkoOkrRZg==
X-Received: by 2002:a17:902:d48b:b0:20b:7210:5859 with SMTP id d9443c01a7336-20cbb240b1bmr265668935ad.38.1729174570274;
        Thu, 17 Oct 2024 07:16:10 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08ebee7sm1976184a91.27.2024.10.17.07.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 07:16:09 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:16:05 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 3/8] gpio: cdev: go back to storing debounce period in
 the GPIO descriptor
Message-ID: <20241017141605.GA242458@rigel>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
 <20241017-gpio-notify-in-kernel-events-v4-3-64bc05f3be0c@linaro.org>
 <20241017124418.GA221864@rigel>
 <CAMRc=Md=6WkwJRt7-7K0fTqOUMz3EzzOGLPbiq2SEw1+1Acc4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md=6WkwJRt7-7K0fTqOUMz3EzzOGLPbiq2SEw1+1Acc4A@mail.gmail.com>

On Thu, Oct 17, 2024 at 04:13:14PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 17, 2024 at 2:44 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Oct 17, 2024 at 10:14:11AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > @@ -1047,7 +925,7 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
> > >       /* try hardware */
> > >       ret = gpiod_set_debounce(line->desc, debounce_period_us);
> > >       if (!ret) {
> > > -             line_set_debounce_period(line, debounce_period_us);
> > > +             WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
> > >               return ret;
> > >       }
> >
> > Not related to this change, but this check looks redundant to me - the same
> > is performed where debounce_setup() is called.
> >
> > Want a patch to remove it?
> >
> > Cheers,
> > Kent.
>
> Sure! Can you rebase it on top of my series?
>

Will do - once patch 8 is sorted - so v5?

Cheers,
Kent.


