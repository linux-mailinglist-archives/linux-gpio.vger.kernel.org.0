Return-Path: <linux-gpio+bounces-6998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8838D5E0D
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 11:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 824A21F26F2F
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 09:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A1A74267;
	Fri, 31 May 2024 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VWzxCqTa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD5274297
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147107; cv=none; b=m/OHUtlzzP9WdynI1UwdDrE3NCnK9j2cCqjS9tly1IL/OftxRhNP0+rxkffQDeuVgfGTyZkG0uS2igbQD5B+SyKFZsToq5l8G0eft1iUm8/z/6MnlcUvRJ1oz8vzPwhTQ6F8Z+QvX3RLoWXAV/XkhlbjIvgbXZMYd0PCCcrYTsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147107; c=relaxed/simple;
	bh=jIZfphCAsyTAqNu0vX3jRBUKL67U/qnpp5CloQNFRiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtgCrTHwplDjPBLe/jL7lKKlaM34O10mGQigg09CstVOc/a5apOXBAH07UhdeDqmlV3BrQj9TkSJ81wHfnyrPkVZVGKIJjkvTUCODOyHs/EgQBiRSm/cV9/a1CRgulMIHN/0NMQeXUDK0J6Ns6RHqIiO9bqAYSE/67g8f7hTTpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VWzxCqTa; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e6f51f9de4so24873461fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717147104; x=1717751904; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D5DiiR6+DH+U9esFrt9TCmtBdhw3xQjsB6xXf016t/0=;
        b=VWzxCqTalDQDx1tmSX4RD6P+4oL7pPf/vAtB8EKE+5irnxJZugzrCm/kU6KQ1AL73M
         ygoFcnTHuB8ZVgjhWXh3lVqDRt7zxacz2EhgTScMzgdN68GldkWqoEabuVrQQSniE1DA
         +9w3nXkWfhfe0/Fw7sPtzFf903nkhlrK4G3GVBMQtcABtL/Adusks8dl7fhELzGHl/LD
         DZW39v9wtcq0BRHAvWq8v904ZdwvXHUT0riGHPJh9FfpcaYzYvBjK2/GnGJfO4pNqCo+
         VMuyRjOE0eRbe1BVVqbId8uznJKExz9cdcsBwfsjnLIuWOxNVtrmpH48A2z7A+aUJ958
         UjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717147104; x=1717751904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5DiiR6+DH+U9esFrt9TCmtBdhw3xQjsB6xXf016t/0=;
        b=mc9Ty+N0nvFlVb3lk0iUWltcAKNhxBZmRPNPSc24W/X0TpvCMrf0g/bxVBs0XFGNvZ
         VL1zC+sYVjW9eogpsfaErCqxOESj0/iijg7KW6MzE5/WUF4V6iDlEJmodqUIoDN1gYpb
         7cDMmxjGN4AopcHIMZlbbg1dq4lU4WrLbaV7l9OOr5upYbz8Hb/LxYRGklYxTeCycfle
         GcnQLH9YRMmMRJspinCkPDKv2HhUaOjPxxybjaxgsMsj5cvmgeGu2HYW5oPTee+a6frO
         KRF3PSJGKkwIX+U3QlYQgiNMu4q9z+iPdMHy1ZH6urcFRT+StfWbysmkaQORLgFDpbWd
         nnPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5wY/EjKpY2ZUo4o56zacToWWazXzKAoIAOX0trODFl+ZeN5vfoDDLzHzMz++cv6SrczOCVHPAfNxmIqY5zGXawIGbVyJnrZzxtw==
X-Gm-Message-State: AOJu0Yx3/Cq0ZSVt08+b5Y7Estb9deC3Qh3rayErQWoZObf/+9BtiDcm
	7QFJm+oYX3ZSiGBUzoCMFwmEAx/gGGwlWzMiBNkU6DSJtBWkG5aMl4lSWD3WZOofsTuSYD3rwr0
	1jNHgkw==
X-Google-Smtp-Source: AGHT+IH/6xb8fT8pxhw/8VJ1aQ7dzfk9Hp+S7IMI55bpOafltFpR4yoWowvQbqOBrS6PRcklCfPGJA==
X-Received: by 2002:a2e:b2c7:0:b0:2e0:5d7:a3a6 with SMTP id 38308e7fff4ca-2ea950e79fdmr12225521fa.9.1717147103529;
        Fri, 31 May 2024 02:18:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e6f0371dsm66244166b.42.2024.05.31.02.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 02:18:23 -0700 (PDT)
Date: Fri, 31 May 2024 12:18:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use
 for_each_child_of_node_scoped()
Message-ID: <731a2a4e-936c-4aa6-8c2c-e0605c7380fa@moroto.mountain>
References: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>
 <ZlhGYFM6iVlGjZk-@surfacebook.localdomain>
 <CAMuHMdU6V4Ooit7P5pqUFXOZawiZj7TjXY7t=KVk84xPZ0PR+A@mail.gmail.com>
 <CAHp75Vd3ke3_bxwsxzSVzjnNW-6aYDTYHvZ-+B9nJtAJR1fX=g@mail.gmail.com>
 <7f4ef893-5ab6-4a9e-ad54-4b3587516bcf@moroto.mountain>
 <CAHp75VdZXs-XCOZaG48dsLEVNsUKiL0rhtf56dnqJKycDMByuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdZXs-XCOZaG48dsLEVNsUKiL0rhtf56dnqJKycDMByuQ@mail.gmail.com>

On Fri, May 31, 2024 at 11:19:26AM +0300, Andy Shevchenko wrote:
> On Fri, May 31, 2024 at 11:01 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > On Thu, May 30, 2024 at 04:36:59PM +0300, Andy Shevchenko wrote:
> > > On Thu, May 30, 2024 at 2:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Thu, May 30, 2024 at 11:26 AM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > Thu, May 30, 2024 at 11:19:29AM +0200, Geert Uytterhoeven kirjoitti:
> > > > > > Use the scoped variant of for_each_child_of_node() to simplify the code.
> > > > >
> > > > > I do not see the point of this patch. This makes code actually more
> > > > > complicated, and I'm not sure the code generation is the same and not worse.
> > > >
> > > > On arm32, a conversion to for_each_child_of_node_scoped() seems to
> > > > cost ca. 48 bytes of additional code.
> > > >
> > > > BTW, the same is true for cases where the conversion does simplify
> > > > cleanup.
> > > >
> > > > I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
> > > > and all but the conversions in *_dt_node_to_map() cost 48 bytes each.
> > >
> > > Yeah. so for the cases where there are no returns from inside the loop
> > > I prefer not to use _scoped.
> >
> > Eventually _scoped() loops will become the norm.  Leaving some unscoped
> > loops will be a fun surprise for the first person to introduce a return
> > -EINVAL.
> 
> It makes no sense when we have no return / goto semantics from inside
> of the loop. I don't know why we should do worse binary code for no
> benefit.

The compiler ought to be able to determine when the cleanup function is
not required and save those 48 bytes.  That's why we have NULL checking
in __free_device_node() instead of using the NULL check in of_node_put().
The compiler is already removing all the calls from the return
statements where p is NULL.  It seems like a small thing to one step
further and delete the cleanup when it's not called on any path?

regards,
dan carpenter

