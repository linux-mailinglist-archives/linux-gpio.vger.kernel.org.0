Return-Path: <linux-gpio+bounces-17634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A632A62374
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 01:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0374019C6984
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 00:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA220CA64;
	Sat, 15 Mar 2025 00:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQrFvPT5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C6E10F1;
	Sat, 15 Mar 2025 00:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742000108; cv=none; b=TaZJg274zIYDTGo0PF30tpuX0rAae54okqZElUbvg9w2RuZA6dxwpPdbDsVANCqa9GVJo/F0eUnx9ikc6pl6OXZ3Cmpst3VijDTfjDFqPrH8Cumkue8qyExfAe6oIOD+sXskuWbUUwOP5LgBya0567mbS55qHL80ocRQZ1Ge/9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742000108; c=relaxed/simple;
	bh=AAp65SLb8YaaV88shcTUByEjooxQ3eHmU2isGxo+w7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0vkuLI9nMW07CFGNqNH+dGUhQ6OgcVn0KXWA8vGK1xHRd0lAnJhLe+M4OLwZ5ws7e+gTM3/mwP5L1bGRx+AH03OG+iu9lGGkJIfqaYX1ghrMFOzbPC2LrlJldJRelyid70V/FDf2tIwJDwJ4lSXZ9dEEdexCan17FczQBJ7I6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQrFvPT5; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c0a159ded2so333264185a.0;
        Fri, 14 Mar 2025 17:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742000106; x=1742604906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8qvkRDVRdv9qBia2/dOTQyKzNJ34jMIIljDmJe7gzU=;
        b=jQrFvPT5Qx71z70QPZJ333tvY+bW5V13ZltTYlM7vWhH2LkDbt5caRrk7w2ueGVLEV
         ATB0g/E/otyJRcHpm6j9ENUP75v30pSmZBqY2jGBfYW8ikxqdO9kc1O5ezao4xHKX81o
         ciPUNZMxD+iXIYm1nGlyELKNLmSHF2a+VXBJQjjcQL5+N9yZ4SGsqCqso/ITD2EmwEtn
         2m1cMheuyNpSRvoGXbI9erfYUs+2OTRnJtcn3qb+uAZJMBojfg5osBaxwpdgowDckR6m
         Xh47N+86SnQ8b88tSXYOuuH7v3IDIJlqDAv8NunMhbGaksQayqvNQlKMBMOT2TlyjFUE
         GVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742000106; x=1742604906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8qvkRDVRdv9qBia2/dOTQyKzNJ34jMIIljDmJe7gzU=;
        b=Ho2jy5DVbP8giK92qG3zHnBha+S1xmoEcWyPWonuTxskoigm+XrcFstL7OKTlolAza
         JwKuxvi5kIW8DVcwhhlCqYQZ/JV+ZamDZg1guzh8z3m6pzSXrSLW5Hc9piBal6IzL5qk
         CPC1aM9BXvUsJvj6pAzwwo72ffFMmx+WudNyGdqUZFEOJKPsiOlGdgeGuZ4dqJzdvkFa
         U2HkYtr3UgKIOWg8AHsdqAaqWBTodY2LzgEAPwcd63tzrTvPsN2petQCRAL3wmRclPXl
         nEu0ZRCCvr9zvJ0/1rKqLUVYhiOKpDmUqrKuIHC2lpzaHXKzCg5p1IKtuU6n/NfaGkJI
         qRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJL1oAdslmDWxIoScRAVJp8FnPPt28tUBfzjyvAl5+CN8qu4wI5EO7Vr4KNw8MUcydBiVWFrpslTDw@vger.kernel.org, AJvYcCWdVsYInQV0kMlLWNEvHbGY270CtLtHqUmqhMtWRH0gesReQbtdS32jLANpZzGtP0UCbX84ANZ9hEkx2oSQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17NZ4fzcLjemktF7DnQF+lzNIHTQo3uavL4PCdy8R5wh98Sto
	bD+kmGpZ0xG+gjEd/Iozs19hW0kfb76nm6Mnd/symBb9bWOHJIV+
X-Gm-Gg: ASbGncvNMrr3MTj98YU1rSuZ55uQVGHLbtFEwxaCi9JsRTFfpuLoaekB+4o59/Gk8JP
	yOzNaDF8whJSg7n4xe99rt3Fu6x3QV6xOzfD5p/pU/0Ry2Ic44fFYPRTfn+f80qfbrHcv5z3d7f
	OAD+b5CJkG7PRFK/zhdSyd27ffvfBdHpq158TGbP7GwabKYgff1OdWKQ1hTNL06jS/7OrPUy6Is
	+EcHd4+xiOjnMiUAv7jk+AJzHNmErxX9lwiVuXo7pW/D59bkgd5k/Zy9tijgFdedxsp6ld8DCQB
	UejitrP35ArqlIFljHNx
X-Google-Smtp-Source: AGHT+IGgp1uiZq2qFqYPbOYD3pGMfDQvx5aQCCNWvl6mUfYQooAN1cww4ZHEMX/4ZqxQFR+1JE6iMg==
X-Received: by 2002:a05:620a:1a91:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7c57c7e4c4bmr607862185a.23.1742000105668;
        Fri, 14 Mar 2025 17:55:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573c52246sm320780885a.11.2025.03.14.17.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 17:55:04 -0700 (PDT)
Date: Sat, 15 Mar 2025 08:54:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for
 SG2042
Message-ID: <f5nsx7xaf4hzmtj7zd5yuxbh53e6u6qqze6zhczrvwujt76ccy@3xtjhwtl6uzl>
References: <20250211051801.470800-1-inochiama@gmail.com>
 <174070346793.192886.6076012325463673162.b4-ty@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174070346793.192886.6076012325463673162.b4-ty@gmail.com>

On Fri, Feb 28, 2025 at 08:44:32AM +0800, Inochi Amaoto wrote:
> On Tue, 11 Feb 2025 13:17:48 +0800, Inochi Amaoto wrote:
> > SG2042 has a simple pinctrl device for all configurable pins.
> > It supports setting pull up/down, drive strength and input schmitt
> > trigger.
> > 
> > Add support for SG2042 and SG2044 pinctrl device.
> > 
> > Changed from v1:
> > - https://lore.kernel.org/all/20241024064356.865055-1-inochiama@gmail.com/
> > 1. Fix the binding documentation error.
> > 2. Refactor the cv18xx code so SG2042 can uses the same code.
> > 3. Add SG2044 pinctrl support as it has the same layout.
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [8/8] riscv: dts: sophgo: sg2042: add pinctrl support
>       https://github.com/sophgo/linux/commit/5277657d53834cfbdbb9444088c1448b29bdfe98
> 
> Thanks,
> Inochi
> 

This patch is unapplied temporarily for dependency issue.
I will repick it in the next cycle.

Regards,
Inochi

