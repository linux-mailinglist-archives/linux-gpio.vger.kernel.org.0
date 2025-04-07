Return-Path: <linux-gpio+bounces-18397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8A1A7F00E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 00:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAEC216D1BB
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 22:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34A72080EB;
	Mon,  7 Apr 2025 22:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtrU1c/X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC55E222597;
	Mon,  7 Apr 2025 22:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744063203; cv=none; b=skSlWQtLemFaGnsmyl/Bw6pHOTtWTHpahi+c/BRZlDMY1K6SyYm3uMRGAV4SjHtLQM/5j96rv9IX8QvlLikyyxDTgTlDj/6wZ9Yh0IcKlVLzGwweDQplBosuyWjpDsqwd4h6cD47JCa2kGTrr2SxAemw6fPZTFFpQt9kVd1ezp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744063203; c=relaxed/simple;
	bh=T5/Exwnghj91zmb3+TLLB9qPHi3WhTFuRXW4Q0dQSXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9KxIOrbDRIoAQX/ESvlrd/ugQ/SgvDmKjtzyOaXv1dHJNh5s1G8GsuFo6rHkI7AfOiBJT3kYO5U2Nvna3Yc+5QAkmuP25zjZqeMCtTsBLgxImrSHS+8IIQrRNO03D6b4Jllgy/Jo3EwH8LwNGAqFCOhHkKg0QCTgKKVM8uORvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtrU1c/X; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso3245946a91.2;
        Mon, 07 Apr 2025 15:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744063201; x=1744668001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Alsncr83KrcTiA2QIxfUURJ9XNKR9/L2MCro1oyjQD4=;
        b=UtrU1c/XRLucFy5mOFkinzaGMHImcqZIpU/JlZX27xp6BuXYbtttKJF1/ybG3xZubn
         Y7BQJ6y0wcQ+WgIGQUqfL7TM3ZPpQxlvl11pRN9vjALuUXfEtqt0xxcB15UsHxRNgt+Q
         Zk7i79YgbG3hDLBGsu6ZJ/MhE4ea2oufo3teImGs0cXF93Qvr9wr3iKA6/rq5y43kSEW
         7RUv5qX0JQYN/mSheqR5Xe9eO4aLz6Ti7rHZWyDSjwwus8NNlNYqOZIxeB8/NncSrbGZ
         +qgC6oSbgbb5fz+e/mlf2VAwEeSP3QbheE7tI59pf2w+51pWqGS6iHFMPZyFgiIIj+n0
         qPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744063201; x=1744668001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Alsncr83KrcTiA2QIxfUURJ9XNKR9/L2MCro1oyjQD4=;
        b=WJ4rjlzzYhxPi9VbHUpabcpUMpLB4wFI/RHuFzCero0TBTrivvFiAKbdiZIszrhIhT
         pWIQ9cLYOVeyEbav02M8EoYxl6vsGkGCNMwsdPe30FXW4dc7xZhlDzUskOB9fETyCRz0
         KBPeWaQn+FwUB/3jqVNYFwcjfTj0qtLqJ7fjzYRUiHRWx0aAj0YKUEsjLPn+Go7ls0cc
         7QeoKYMExYZREdc6leXOT3/jQmi8E8F1EofJ3w1b6zp6njlsGru+FQezsCEj/6eYbUa8
         WJypFD8KyeguOlpOHyL1TGvBtcL0kt7y0sP0B4uqzsor3eEHdzcscPz3FDxF17rtm+X8
         FGgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk8tXeYhvdjI4TM1kq51XeXWpalBA/PVqrBazWmgpxm7dAqXrgFt5aRoi0NmEa7Luj1YCB76u2oF2a@vger.kernel.org, AJvYcCVSRAr8AkUXAtLqNsnGzQtO2xBEOcws1N8LxfTzIcWDS9gXYdlZ+sz5i1hF5JPZD/edvCe2cYQpnsQemLY=@vger.kernel.org, AJvYcCXEeLe7DYrcCNRicgZ6MJDd2bZ037CKRuXQ40fzmKi2Y+5wlhxqbx9pHytaBhFe9uKEag4H7O6YHF6K5g5c@vger.kernel.org
X-Gm-Message-State: AOJu0YzwuWCv7R3bEihPbw+Cpq46vF/XPuHi7HSqLVbS+jtU84kmypiW
	ovSFjylAlV5O7qLFLE4tyZzCAajjKITfZqtAfKfDvZSpCN6NCC+3mTKIkQ==
X-Gm-Gg: ASbGncvrYiWFkSLgb7H9XSzfEGvOiYp4HLmY9RDIvcDG6gY1PGS9Tc9EtkHW4CcAUVK
	UnP9TVzMvH0DAidEZT+HFKimDAylF5nvMmz9X6JOkVQCIFYLJqjjXsOkOLZXmw+yR0bQD2kHQkv
	IDoErtTfxOFXPTdxX4UNy071bwd2wvPyP+Tgaq9QTx0yoTh/W7AjWgopKpdnoZnrbCKIubwsIL4
	eFG/+jSGQ6i37tURJoQP8SsCkUIxV3C1/hHjzF+bYJakeQn/BAn/I9T945YJfN5Mm3T8KNWe0Ot
	P/5iAFDI7Wf5l2L+R2vBawUSjM0OXF6rwtR/oPG0gTpTDFKYW4PQcSqa5A==
X-Google-Smtp-Source: AGHT+IH3Oetmj3VvNHFsyp058BeY9zk7Dd0sqo7AsFMHGM8yLzHsRxPycACVFpXnKNx5wTAVHZlPYw==
X-Received: by 2002:a17:90b:2e42:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-306a4823704mr19362943a91.4.1744063200879;
        Mon, 07 Apr 2025 15:00:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983b9cfbsm9419689a91.31.2025.04.07.15.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 15:00:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Apr 2025 14:59:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jean Delvare <jdelvare@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] hwmon: (ltc2992) Use new GPIO line value setter
 callbacks
Message-ID: <134ac671-13f1-4d29-a81b-a0b7285fd049@roeck-us.net>
References: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
 <20250407-gpiochip-set-rv-hwmon-v1-1-1fa38f34dc07@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiochip-set-rv-hwmon-v1-1-1fa38f34dc07@linaro.org>

On Mon, Apr 07, 2025 at 09:16:16AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Applied, after fixing the multi-line alignment issue reported by checkpatch.

Guenter

