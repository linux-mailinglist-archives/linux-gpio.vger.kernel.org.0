Return-Path: <linux-gpio+bounces-16166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76983A38AE4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 18:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2518E188EA84
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 17:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBB7231A55;
	Mon, 17 Feb 2025 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuDgsopI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B71A230D1E;
	Mon, 17 Feb 2025 17:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739814572; cv=none; b=mEZSsft/jcGaJUm4qYfiOm6yG6yZAZMZHrl8VdKyYsH9ITTs43HVuDB7aeTuEgbGFrCpsdek8262er5QukT8Mn9ibZACGn+qzp8Vt6FV1Q0vjHhoOQjJ2uwXkxyaz0bOR+ucN3YKm7upeKzwIG9HPidw/V2W1tI9xhghnn07D3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739814572; c=relaxed/simple;
	bh=kHByGspFJiRQ1LNZ+9pSeEmjvDmOcBORCtMgHN4GZSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQW7DVkNW/wHk9KZZ1GGT5/Ptmi02rYSe4gm0YAmjcJk1etwuPbIEwftMypSxxce7r8h+e+UU51ivOfJBrr8ocKuMQKXRtCG48icYwxwZhzsXp+jOtVEFNTydgmLAmrYDAFgkvxTjCEPu4q/vpexro1diB8uZ5mnLRRTBi7gc2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuDgsopI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4395a06cf43so28805375e9.2;
        Mon, 17 Feb 2025 09:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739814569; x=1740419369; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qc90XIXsoB103cOhgVLB87XYUHoGRkgJHI2JY2UfETo=;
        b=NuDgsopIvAjntm0r55ROQf/JCGgstPsE31gUydAbfbbDeqNAgsWKZVo5jIO5tjEhjB
         LNhnHOkL2+N6lkXVS7mvLSd7PXxaD80+WQNGQggBE/lAccpoeS+bRSAA/nedOz0SL5Oz
         pd1Eg5u93gSX9zmwjr1GtOtVty8RtmUiYsk5O69ymkobkK6MxS0Mqzs8xZsTDA4FLjGN
         JTZ2PrFg1sV7VvbNmOtM5nHjFT92l43YQ1sTN3fs3ub4QXK4wx7oPPKa7t/Oe5FOFQKf
         +sjYCLLV9C4gO8ykB+5cnFwEN3F7MY/IFgutxg0lOM4NeKgpjoEFfHNg2C+EZwYQLd4I
         mryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739814569; x=1740419369;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc90XIXsoB103cOhgVLB87XYUHoGRkgJHI2JY2UfETo=;
        b=btJ6+boawqinw7tUQ4v7NcnAXDxyjG0nXYtTj8OjyKooyLx1cx87B3HZ7DpgcYx9GA
         DyvQ3k906SKhRqHpf1XfQTUhD1SNyeMpq76WI9QST6KgGt6tt2F8ox3EpFTODiXXPOpR
         t7zAWGBDLm9U4cwRgpfKry7sjnOanViNJ3YudVKROzHtUTpDdm6YeD1E0ysdKawntVzv
         ks3D6YGNU2VYauIj9YNLQINGn1mvZIfE8LnJrV4oRg6Vx7IOAyvH1j+MLe2oMmi6vZuS
         cqhCjfIvxlHX0uWHckvTSeWISxss0galI4RumJ83O3PM1aEbDcKmB4WfZktDQxIyyzUq
         o8SA==
X-Forwarded-Encrypted: i=1; AJvYcCUjJH7IuHmMBMoji44coIRDMAOpnkqAsBxU/g2rzAWfcLOn7xboyLjmQB41tyUhOIh1ytr8nEtB4J7+2w==@vger.kernel.org, AJvYcCWVCIaJYlkWPvBKb34vfKnwrUAD1yaKnsIjqh6eAPCTwAH91DnKjyL498h5k7slYNzQUIbC9E63DIH02uKy@vger.kernel.org, AJvYcCXVFGy3RC0+0YZ8ZNBKT1swOvGRPHAr8mUVwDwHgNwAvdoWuvy8P7FYCIQA68fHgXF8Cu9i50x7aDhB@vger.kernel.org
X-Gm-Message-State: AOJu0YzclbvN2iFXssqSIb6D5CXakizXcpJSjcEodLeeI33ozLUBJjdd
	qzkFveKJxSwg2tzqZfm/pqGnezv45nITZBgG0rGXxkDg9gX6NXXm
X-Gm-Gg: ASbGnctuQ87qpJbwlGtsszlBg8MaX1ZmHV/s86BIMiA/2a9wI0vELB3tCShYCndL+fu
	qqkeLAn4T6mzZZsTRQO8ayzIyDlXAd8uzZgOIuhEN21p6euFQx0kGVgwEHwOyFEdK/CduwDejAe
	By6intXYPWYjp2vgZwGk43N6e7+kWeaSkwtEsJkZ5vAk+o294a7YY+aCxF08yR2Mytd/jQlYdob
	zKAj+OrVpp4N/9YA0lOGHC9OHIHgBANvOLrn0Vkwc4/KgwLZYFnbPrxeRUG+WFAqeHv5a/bblqU
	/cy4exR87BBLk6w5onOOBqMF3u6gnUL+r3FSSb3G
X-Google-Smtp-Source: AGHT+IEHKv65qMlegxRO6407Mh2fboKqFE1Ur66euJuVUr/s6sQop1oSVywdneihP9OTWwXzA/3L9Q==
X-Received: by 2002:a05:6000:1844:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-38f4d400751mr2387154f8f.9.1739814568360;
        Mon, 17 Feb 2025 09:49:28 -0800 (PST)
Received: from DESKTOP-L0CEE7S.localdomain ([84.3.41.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43992ad82cfsm945155e9.37.2025.02.17.09.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:49:27 -0800 (PST)
Date: Mon, 17 Feb 2025 18:49:23 +0100
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: gpio: Add support for PCF8574T.
Message-ID: <20250217174923.zifv5oig5waeqedt@DESKTOP-L0CEE7S.localdomain>
References: <20250217-gpio-pcf8574t-v1-0-137e140df5fc@gmail.com>
 <20250217-gpio-pcf8574t-v1-2-137e140df5fc@gmail.com>
 <20250217151336.GA12410@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217151336.GA12410@pendragon.ideasonboard.com>
X-Antivirus: AVG (VPS 250217-8, 2025. 2. 17.), Outbound message
X-Antivirus-Status: Clean

Hi!

> Judging from patch 2/2, the PCF8574T is compatible with the PCF8574, the
> only difference being the package. It makes no difference from a
> software point of view. 

You are absolutely right. I simply thought that, since "PCF8574T" is written
on the chip, this patch would make it easier for the user to identify
the correct driver.

Regards,
Tóth János


-- 
Ezt az e-mailt átvizsgálta az AVG AntiVirus szoftver.
www.avg.com

