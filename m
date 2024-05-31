Return-Path: <linux-gpio+bounces-6993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A372B8D5C2B
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 10:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0C45B22246
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 08:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7F7762DF;
	Fri, 31 May 2024 08:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0INGMgJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1842F7407B
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717142508; cv=none; b=FMDL5CbZsi9md58We1vrMZCbLWbDnZHbzXGEt+9oFWsDDMF9fJ4FpbxdRxN2hKANIZ5qNqKIKWrp9SUMm9pgE5JzYDRsaM/EyaPKIxOtRaEEQcqYbQSe4S6IujYN9s5VrArQufYBF/Ojbd+4WEzRhTz2yW29Vhj4KtrTwL/7IIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717142508; c=relaxed/simple;
	bh=kvVPwSeJwasT8CK/Asv91/QGbkrXxOSg5SN57SDZ6Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNNQza/cFO1a0r58Pr1gwDWdSEDWmhhANPg02D6ClZ52Dblm+8ZNRGatM6LZsfMq71bVYyPMHdFoM6XmsPyGvm1ht0LMdUnn7qJ06jAZSjMnkNQCPsdA1lKyOVaZsdnU32qE+bBfuju2ZH1LUzGlPF5OTAVAmwrdOLb7dh/Fr8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O0INGMgJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a62ef52e837so187274666b.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 01:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717142505; x=1717747305; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kws+h4+u90sJL9kYZ453YSqIAF3ITKBvVIj77h37Npo=;
        b=O0INGMgJvZmu5iwpGBcNZNlV+h/Id5mAIJGnwnpNJLzvxOALnL6jkRQy/CAlgRgDEx
         +wVWLpi+NBzwfMTEyeBKT1ShQncyh6mj6RFSuc5e0eNcRv31E0mOMnx4kx/xbaVY/+03
         RFSYTjAQ76YWWh7Bc3i2AI/vt77nJ61V2L+CVOSCdkXZNcOw5uJdRGO3UUsxdRgs2VzE
         b0x5Qqu9yjmwP+E0uSk4AfVM4WrNYFpO/bGC3uKfPqp6FZeqDYQXPeTB3LsPfeRTGuf1
         INP8oXUVcRLBIHlfhEEK/OxYBb5j2yLu8L1QHDgd1E2znDLcaphCA7PTY89bz3VKQYpg
         dOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717142505; x=1717747305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kws+h4+u90sJL9kYZ453YSqIAF3ITKBvVIj77h37Npo=;
        b=YpIZ7X+BVgfRTIXNcILjnx4G1V89RQVnAG0cCmbR309YHMsERASzoCyXLqh4R1NB49
         JTjmDvZG3hWLNY654VZIrqZoKosZ+t0mcpQ5W3NrRE4Q9wvcTgu/FwtIOclXE0+l6RDY
         N/a0tRwQJCnBMnPRMirz9UT13U5YCI/0WkvnD1w5YmYERaV+kMpXkrX3fY05pE+WgDW+
         pBEoSRNGXlJ8A90Mcj4lSDwtvSWNHQ11g/7vXO+dMpV/497VQcYWKNOTSAn5ZzdIuB85
         6yrXu4d1N1+ohkDD/VXwsp1a8GYOU5DFUfNc2teIpUqhp8lLqWawm7mA1JGnXVUGGxNf
         T5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKrJ+l0q6bnzglS6XJTNE0pIGgJI7NG/tpM4T/zG/tvBc9yE4ZUzb9axrj4VgVMDxOMqNANadWKxTYCAof+bNx2aNfwM6x4jFCdQ==
X-Gm-Message-State: AOJu0Yy+MffSFrTFqZcKKAsC8uUmPT7kq+LksDWT2CzagFHe2DF2leyc
	mC+hfML6RMAcSo2qpvwpCkgRbJz0Tdw1hqJuDngfWwrz4m+gAH0P2BH0uqlofZg=
X-Google-Smtp-Source: AGHT+IFgs2Y0mRlpN9fAzbrNITytfa2iiTCw/kxq4cb2oAWQMnnGOPxnJQdkRcoUaMHrA/saWequpw==
X-Received: by 2002:a17:907:9158:b0:a65:dea3:bbbd with SMTP id a640c23a62f3a-a6821f4e379mr60730666b.60.1717142505160;
        Fri, 31 May 2024 01:01:45 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e6f03b71sm59616566b.9.2024.05.31.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 01:01:44 -0700 (PDT)
Date: Fri, 31 May 2024 11:01:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use
 for_each_child_of_node_scoped()
Message-ID: <7f4ef893-5ab6-4a9e-ad54-4b3587516bcf@moroto.mountain>
References: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>
 <ZlhGYFM6iVlGjZk-@surfacebook.localdomain>
 <CAMuHMdU6V4Ooit7P5pqUFXOZawiZj7TjXY7t=KVk84xPZ0PR+A@mail.gmail.com>
 <CAHp75Vd3ke3_bxwsxzSVzjnNW-6aYDTYHvZ-+B9nJtAJR1fX=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vd3ke3_bxwsxzSVzjnNW-6aYDTYHvZ-+B9nJtAJR1fX=g@mail.gmail.com>

On Thu, May 30, 2024 at 04:36:59PM +0300, Andy Shevchenko wrote:
> On Thu, May 30, 2024 at 2:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, May 30, 2024 at 11:26 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > Thu, May 30, 2024 at 11:19:29AM +0200, Geert Uytterhoeven kirjoitti:
> > > > Use the scoped variant of for_each_child_of_node() to simplify the code.
> > >
> > > I do not see the point of this patch. This makes code actually more
> > > complicated, and I'm not sure the code generation is the same and not worse.
> >
> > On arm32, a conversion to for_each_child_of_node_scoped() seems to
> > cost ca. 48 bytes of additional code.
> >
> > BTW, the same is true for cases where the conversion does simplify
> > cleanup.
> >
> > I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
> > and all but the conversions in *_dt_node_to_map() cost 48 bytes each.
> 
> Yeah. so for the cases where there are no returns from inside the loop
> I prefer not to use _scoped.

Eventually _scoped() loops will become the norm.  Leaving some unscoped
loops will be a fun surprise for the first person to introduce a return
-EINVAL.

regards,
dan carpenter

