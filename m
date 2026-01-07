Return-Path: <linux-gpio+bounces-30215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B268CCFCF7D
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 10:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9808831014DC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 09:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B65E3126CD;
	Wed,  7 Jan 2026 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzLAtdt2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5062FD68B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767778767; cv=none; b=P3iRVvKDJ3jwuHicFE9vfKGcvgiRoKqDKe0sqX73c0agI9X648YsanxZVioD//Pi47ni3MrySGJ6CXQgGOXnn9AAwzEcdTUrFR3dfG+SjyOuZdoD7gnvDTn9Ohct2P7LhMqmzePmk+Pfyg8rTpzlT8ZTKxpOrN8ddwtc+j+rU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767778767; c=relaxed/simple;
	bh=mFfTKWGy2/8GdvzmJusxLGU70jhWsfFF1WYD8dpt+oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZtb+7Vvh40DWeHEihBrF3P25KXhjmSx2rL4sOF28/3c0qSboAWE9CXc5oy6JSV9z8kurumA+deH+j9VJMb9bg7qSU+zLLGIm6xq8aTxsE+Vz9TBvtKkOCUx0G7FsZL+Idm8TFr/cB/PIfUUFxXq2rlp8CgHF1KNm5LfnLOcmx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzLAtdt2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso10246735e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 01:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767778764; x=1768383564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HLO9jLEeIKFkMZhNz0WlQ0jxeeVZOgQbPONWPfd0m0=;
        b=mzLAtdt2o9ptmNXr9WsnEYPdVLEMKyF/Q0UJBCgXRE1eQlYyD98NZ2Cyrq2elP+lkA
         cS++Y+blz2PbtsAppRBVs8Xpabm2ShR0Q0Ka8TfDR1bYPOBvzpgG4sPFapOyvGJBpVBA
         Ha1jjgucJXYt9Gi1cC3ykf3RjVMs4VgSG/9p2Uk2E6SZwuglFpf52HiD+7vgEHexjcMv
         XN6t/0bhkbyeIbXZ0h4WHXKy2QdnL3s05MTg/48mxEgJUJWGoqV0xjZJV+XycgmmYEy/
         YxXJ6gOwVLOyzh0jPp+0kZqAQqxxoyG1QucSMfntrfqrav4QSLJTVF67LFQgBsMNt/v9
         SR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778764; x=1768383564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HLO9jLEeIKFkMZhNz0WlQ0jxeeVZOgQbPONWPfd0m0=;
        b=h8Bzh1dJDDBfYTGBfH1LZxqYzv/8NkSHMBn3VzmF0oiBs4tGw+E20up51YykjAFSF4
         rE4ph0al0WYn6VGgb6W/xLfV9b20+7xii5yopFW6uy7O8vfm9KF3xE9KG1z1DWwCQ1jo
         unGNnCIqDFE8OCe4fxXT1aeLelFDjV4Jk/PZSy/cZJCtByWru7qD8psTxuk9w5PKhSDc
         zw+/n6vJBlvEa4+RfPtLji+4xgdK915IiLfL4oejliDCKYYo5t+N7NqtL2OpBEUCpxoY
         4sRoOfIHp0DWeWAu3kPzeqYISkgNAI1lqm2jQj4mQ+sBORJEnob5dTvU5NL3B1NFtGtY
         Ohng==
X-Forwarded-Encrypted: i=1; AJvYcCV9JHp5n6amAQ3LZAPRFxqjrt2mYsKSMu1v2pzUnqs5tmurJ+A9K62hPK71GX9t/SGC6Ax3+emQQ8MG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5tuBclXz6O3VxFkibmwmBsOaJ2BEpxse76g7X19sMxTfdwRli
	IiLu++pQNh3T8dqgwmx2mk+vKdHK9xMDsR499t8xkqyJ06JFXJxsMIBN
X-Gm-Gg: AY/fxX5ELbjSKRh5kmCC4LJUdzulAEeqR6KNpvSTyUOVGg0GLjyXQO0lRGHQT+UPps8
	JRlaEwAl5NfQAcXdkg0jCCOTc0T7Qw+VIQ/CYlSlnaovnMafiigo0r+w4mKrcFupPFb7yXvGMxt
	nDedFAqDxBPT5oCzcnRjJ8fxHTB4boVUK0Ur4WlZ37Br1sFpugBRTqLp4SBrWX1IcJUGgBLVBRC
	Vxehp/sWMCKYStFnkFOOcBX564sRu/6ns0xsvg45pzbbJ4T994g2mA3TH8td1NFwQiOiLQMa2Q9
	HilD6jaUBTzf6mtdgW2CIzH+es0ACf2AhAvms3CL2u5DzbHUDPS1IaZyamguMj3kMt4D4rbtaFb
	seHQT/TRzCeTzGaFFqAprnLaHileLkpIqMWwJcwtys01+Y9b4/iSLqCWXqPaNqfYDy9e4kPT4Nm
	3l3Ukvk6e4KdR1MKMb+mg7/2TlVOczTV0B+QtKr0hhdBCnsx2VED2QUmPHfbS+oGC6PurYrrQFo
	xf5R9KrLg7iBA==
X-Google-Smtp-Source: AGHT+IFO4rujMWklBKhAmIHOMfpdQW6MCtYaOnTeK2QpXjPznviHc5U00+f6ikCVFNKuIlBEDXHrtA==
X-Received: by 2002:a05:600c:a10e:b0:47d:885d:d2ff with SMTP id 5b1f17b1804b1-47d885dd365mr1226995e9.29.1767778764308;
        Wed, 07 Jan 2026 01:39:24 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d86372c92sm10232515e9.0.2026.01.07.01.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:39:23 -0800 (PST)
Date: Wed, 7 Jan 2026 10:39:23 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	lakabd <lakabd.work@gmail.com>, Yong Li <yong.b.li@intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] gpio: pca953x: handle short interrupt pulses on PCAL
 devices
Message-ID: <vcpab5tjv7k3i4bm4bcugzde4rat5gmoq4yafqipn5xuual4jo@fkkxnnl5776i>
References: <20251217153050.142057-1-ernestvanhoecke@gmail.com>
 <aVF2CIorE5ylV1b4@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVF2CIorE5ylV1b4@smile.fi.intel.com>

On Sun, Dec 28, 2025 at 08:25:12PM +0200, Andy Shevchenko wrote:
> 
> Wow, this is a very good wrap-up of the interrupt behaviour on those chips.
> While I am fully with you on the fix (this patch), can you also add a
> chapter/section about this to the documentation file (now we have it for these
> chips!) Documentation/driver-api/gpio/pca953x.rst?
> 
> (As a separate patch.)
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
Thanks for the review Andy, I'm very glad to read that the wrap-up
proved useful. I submitted a separate patch here:
https://lore.kernel.org/all/20260107093125.4053468-1-ernestvanhoecke@gmail.com/

Kind regards,
Ernest

