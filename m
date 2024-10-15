Return-Path: <linux-gpio+bounces-11314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B8899DC2D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 04:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E66B31F21E96
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 02:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0845C166F14;
	Tue, 15 Oct 2024 02:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itaC/tq9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B81157A6B;
	Tue, 15 Oct 2024 02:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728958811; cv=none; b=Px8RNzmd1xyjPFBPFGks1iWyGIkf1u+eQkzYujmeMzMToo/0zmQH7Wqeml58pgIKZUL1egCRL/Dp7zLg405ZIVgbwfIWyd6e5O75AEM/dcvXcN51h2XP8AqFmkekCn4Jhn4FKHOztjIJUu8XUENcDSjzmovuwCb5p7fkLrhn7aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728958811; c=relaxed/simple;
	bh=HS2thc/vvNiAP7WYGVy//vM2M7+3/EAEcq+ADqWi2wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG034mtkkl30GUErT2TwToRNFTsicHpxuYlBcvZ1rganuEjP6swKOzIfWr8KdCvxMCWF3j9vpgJl9cINwIdyMKfJpbWv5Z5EodKDVfiudM8P+aaHb1KuoeLaMulQz3STfhVzrVw1W3h4i33G+eDlHw4ymNDS1eXFQK/e4qp/iPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itaC/tq9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b5affde14so28726975ad.3;
        Mon, 14 Oct 2024 19:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728958810; x=1729563610; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HS2thc/vvNiAP7WYGVy//vM2M7+3/EAEcq+ADqWi2wc=;
        b=itaC/tq9574Ij/NN3ZARQRgd9K/1T5TudGXw7M+vfQ4uy1Y/Qn24Q7GE999Vgxb52R
         SWnrdcGagjUxN56mm9cnhK7Lk78lfrvcd3bUVbUWTPMahlFXxk1f2PzAueSEVItC6fkJ
         e3KSG27BDW5W1QiQ1ehOFzOwj4X9++WXVISEVskEEp2UFr1WjuPzRFnh3/cxRe4MxLHO
         yBSkl2TGMfD7XlkcYn2ENcE+kagVRyYZ/RwK9dHkdEwiVeAGroN0L4MoNYdivA4gQdB2
         N1r3fuA414U64a7z1qUjFuxzWUkLAIYxpt+fOaT0WXuIVCLwWT0ps8XlEAV0ucTGn/ZE
         s1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728958810; x=1729563610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HS2thc/vvNiAP7WYGVy//vM2M7+3/EAEcq+ADqWi2wc=;
        b=YnbL1CKM2/FudQG3pU0mi680FZpScFlCknL0bYJuGaKk/cqvCdTdDekP87Kgvi67UE
         ElCM3U/P751OkZthyFNwQYXeqmZnstpndBzJPPJfXBIC7sCzd9W2a0KFZxyu7Gk7UJw4
         Xdxy7RvMSnbKHJ0sxe7r7Ne+7xs/RCzhwelqLmlRhdXq0ow5xzjiY+PGqLZyONK0tAV0
         1uIEPcDfKnNm9cuu0DAES6VZcN6XPS1UgXhDcPhNgR0aJwBX/rbdAh2bfxKhOb5KXHUO
         8kpK7zS4Q3wVd1M2CW16uPnXZf4BUu5F5ZA0gELxyp+WZgAj8xApyIjcGotPdtk2ZyTr
         FuPQ==
X-Forwarded-Encrypted: i=1; AJvYcCViyUydl668AAS32tOcpKh3t/0j9of718lu/EETAKjHpQk5HCU/2PC1xAnx1I87JGQn0MF2GMhaeboi@vger.kernel.org, AJvYcCVuJNlk5957pmZIV9dUtd6t5dsXhQDujmUxzLO7OGBug9pOG2lFZfBBxX/wRgXUl644q2M5AzAchyKRIxwz@vger.kernel.org
X-Gm-Message-State: AOJu0YxZR0HICChNcVyXJnEW9pfoyeqb12Are2TkwJAD+sG+ntrlh/G0
	e6yNP7EnhW0FVpJHpKmqVaXMsGIcChIrMRoBapxn1bVtrrT3WJwj
X-Google-Smtp-Source: AGHT+IGaKnw5lCo2Cleg0RPJQEGqdhSS+nxpd5GlbGADLOn+8UHhAFJbAoIilQZgcKT2Re/a9Z/bxw==
X-Received: by 2002:a17:902:fc8f:b0:20b:cae5:dec4 with SMTP id d9443c01a7336-20ca146699emr195294395ad.24.1728958809744;
        Mon, 14 Oct 2024 19:20:09 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f9d932sm2168495ad.90.2024.10.14.19.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 19:20:09 -0700 (PDT)
Date: Tue, 15 Oct 2024 10:20:04 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: create empty /sys/class/gpio with SYSFS disabled
Message-ID: <20241015022004.GA10899@rigel>
References: <20241014121047.103179-1-brgl@bgdev.pl>
 <CAMRc=McG9a9CKXAdyAwQ=65SUOg32ExgY-YGyCs7Rxb_XjEqDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McG9a9CKXAdyAwQ=65SUOg32ExgY-YGyCs7Rxb_XjEqDg@mail.gmail.com>

On Mon, Oct 14, 2024 at 04:50:09PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 14, 2024 at 2:10 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
>
> In any case: please let me know what you think about this change in general.
>

I've got no strong opinions either way.

Cheers,
Kent.

