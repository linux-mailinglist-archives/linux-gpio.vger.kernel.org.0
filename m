Return-Path: <linux-gpio+bounces-6413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0868C792A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 17:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CB8D1C21CAC
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 15:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE00014D451;
	Thu, 16 May 2024 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3XsSypE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB671E491;
	Thu, 16 May 2024 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872807; cv=none; b=tR/0pyr0xlIWa480O7R7H1K2cpMnFESQ/JAdV/8jP2uDTCWEBBuNBjCCthJWym1DmvFp6jNSd3dNJlSMXe8U+5+4pLfkqYA/K41Lm52tG4JvM5MG8q25A4jV4kNUi1HsOjh1AoQUiDse2XAC9wA4uKEo9QDJJSKxgedmpZhCeD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872807; c=relaxed/simple;
	bh=cYcnc1cDXdLBNxwEdGaY2JFEk1/XkeENBGoZEZ/AD8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6D8f/VqTlXe5WD78oHBRza63obeoT017Dql63awKvroAstOS6OUFc+nj93p4fvO4ZuctHZ7VOdZFyq4diaZKgJXri9ROo2NNqEgy55QmXcjN92KL7kw8dZZbw1sEfk0X2Vzvpm2RliMqte01nkfk/EeB0dy03xWxS0jd+PG1Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3XsSypE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ec486198b6so63826715ad.1;
        Thu, 16 May 2024 08:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715872805; x=1716477605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+vRo+P5ZZ4maVeHMzz6DebiF8p8UkpivTYboSPvkAJM=;
        b=m3XsSypE6oFH9jieul3kXY+7tpiDXTOpFaRG8tzCGGx3lxSkmEnC5dHHEaSE29K5Cm
         QJtMSCPfuRkc/Usho9XSsLTR4kKBzScfgEOLJ+Nimm870x7bN1gIS96NJXtwYcB7HoY5
         WZOD4kSBAy6L5Esc7cnlmzUZgn+Sb/4DA8wFiyZtLMH5ja83NETjLM8acn303J6QZ20N
         pcvEjC5qa+o1eNHdUw2XVQ6G7mNEcemQ+gzFxDUhRKOgKyAwXrs0crP/1hnNzJoeaFQm
         U9kq1cnSskfvhhZuLH2KsdqK8XyxaSrtWEybonugNR/+59ESx505MAkQKtoZmFoTbWvt
         nOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872805; x=1716477605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vRo+P5ZZ4maVeHMzz6DebiF8p8UkpivTYboSPvkAJM=;
        b=Lrm2l+Lntr6Hmj7VpiHpvHRMeKPDwZFG7/zjHeh6AGY4M+9vzVf93zG/1ahiOPZ4cb
         wWLVq1cUBSq6EB3oC/b03j6/Td/eLOAh08Fjbdgtl287nivs+RnZpkabR/Tko8sG4OPn
         la1lwZZd/vTFoPTn8G7TNOKXZIhqiM48CWDFDZjXYLFV5Fh5rSnt1vCp4gKIhEUiRUfo
         gL0QpnlG/iZzOU/ouqV2SVwGsMC0Mw9DIUZH4Q7CwP7gjJ9USq5QKpA8vM338pOVDX8B
         /Wgm29pWSPdlO/txbBDcQngGzgxaPaOXHyzYWxIqtvRmMuvlXHn5Gq+fTKnUCyuMyKVr
         Gm1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTKZ1z1hJbxuldgdj1wiJD3LsdPObM4M/uqhPQxTWbTCdPIQ3R8K6fmURgXyyMNK2zjgLhyFuRExfluwX1kqBDGeSSODsMdVcTqq57UfplDvawkyX6a94TLsdKnNBQ/041jEMvACuX5jonIwuUOAth/mqs/t6DhEWtoGGSZbrk+yTUsg==
X-Gm-Message-State: AOJu0YxFaaewoycNd+EasCDaOLUDKoMmbl/Nzj4oM2XH2klbaeCJ3fmx
	2gIImXbsJSs1GXzslzGQvgx3Lfs8cZDrJ7cql0hKw4y2duilsZnb
X-Google-Smtp-Source: AGHT+IHRlEqJ8rEZ9MqTIWlHoh26EO9q+4Wr/NogN7TOAs7lsgMXfx3kkNBjEgQpJb//B1s6Zr/uaw==
X-Received: by 2002:a17:902:f605:b0:1df:f681:3cd8 with SMTP id d9443c01a7336-1ef43d2e288mr242173465ad.12.1715872805445;
        Thu, 16 May 2024 08:20:05 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c036272sm139542175ad.188.2024.05.16.08.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:20:05 -0700 (PDT)
Date: Thu, 16 May 2024 23:19:58 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v1 1/1] gpio: Remove legacy API documentation
Message-ID: <20240516151958.GA146240@rigel>
References: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com>
 <ZkYQHnF76WLIf8-r@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkYQHnF76WLIf8-r@smile.fi.intel.com>

On Thu, May 16, 2024 at 04:54:38PM +0300, Andy Shevchenko wrote:
> On Wed, May 08, 2024 at 01:17:01PM +0300, Andy Shevchenko wrote:
> > In order to discourage people to use old and legacy GPIO APIs
> > remove the respective documentation completely. It also helps
> > further cleanups of the legacy GPIO API leftovers, which is
> > ongoing task.
>
> Bart, Linus, Kent, what do you think about this?
>

I don't know enough about the situation to provide much of an opinion.
I can say that generally speaking I'm not a fan of removing documentation
for an API until the API itself has been completely removed.

And from my experience users will just Google and find the docs from an
old kernel anyway.  That point could be used to argue both for and
against - if they can find it anyway there is no harm in removing it.
But probably not much benefit either.

Sorry - that probably doesn't help much.
FWIW you can count me as indifferent.

Cheers,
Kent.

