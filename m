Return-Path: <linux-gpio+bounces-13043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC519CDDDB
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 12:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F639B232FD
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 11:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0965D1B6D17;
	Fri, 15 Nov 2024 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x58n/RLg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A351B218E
	for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2024 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731671719; cv=none; b=hXSaIx0/ltuhDjmDABWXruPPNk9TE5mN3a7NVz5btOMGW5Ms2OmE94HjwjlrDAK+KPRiqHE94cw8hDQBiLEU0QPlCEKnchYWXlvH77EuPOSlv7WXvF7VpUCgrxn0nCwE6MfDasTk6KA8uRIul3EN0Tf5uN1FTCexQECVFzZF8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731671719; c=relaxed/simple;
	bh=N0Dlcy4ODEyINkyFqZ4OExz3WI7d7VOMlLyb9BnaUkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZfcX/79M6XIam5C93vN3bs1ONrweB/0w1//TI5BKNC+sjOtxncOYhr+jCQka6rcS0THDr4rOWxXZ7XR77Bt1KNmwTrpC6DS7P6r14JDqldIGT4pLn1JI7vDg+H9wAM2bBoOcMC7G89zFaFxuRKVVbxcSmzMCvbTBR6CaPUD9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x58n/RLg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso1208579f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2024 03:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731671716; x=1732276516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xNxG4xdSJv0mTSk+keMrkENbnyIHTmTRRxL8dSugZL0=;
        b=x58n/RLgHNQVi8T8uD+0EkC3Uyd/vNRlfKMXlvxVhpGR5bPI5lASaWhDHQLsgOoz+p
         hrvHf7KA92HiZH+wcCFUkLE0mBpwg1Foj7CEZzoDDwE39N5fqg1CITNAlqW+0iMoLrvJ
         dlG4yq4GfAUam4qIBp74tGLUiULdz4oD2At2EW8+V3I6iT5KjA7AAhQVNoZCRj2WNdRW
         V7yCmKQr5TydMyAOJYKzb37OoCPjwyspt2iwz2ur5+rn8RUHdf2exMT+s4CwiX93aVYC
         MWRmIDO48IjE9laFA+3VcOIMA6gI7CTiW4r8EAUS/3+VD9AExaLMVC5eBT50A0z+RSHf
         MNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671716; x=1732276516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNxG4xdSJv0mTSk+keMrkENbnyIHTmTRRxL8dSugZL0=;
        b=YFpX/oJ9NL2ddXEPZXlLthZcyO16CD076SFs86odw1luK2tza3HqCQ6Vn33w+2Y0TH
         bbR3HTLYoRbxGRtUW7EgS8fzEozGrdB04N6ce7fKV8WNtIMY/N+3Sj2JRLVPe5r6Z9dX
         p/51nduOy60OqKlZkEvxmKODoq3u7NgKEo4yPYR8gCuYHQTtjNvBoP2slcdBH21B0BkD
         KgLNGVqtUiGBVjlvdJWE/uq5i9Hgzcx4B6+9nudjWB6hYSX+xW5pECbshC/yQJu1lG7O
         KmlTsO5Lmgd4As+BRGA9Sf/Lrmg2M+E+bfedJpX1ZWbJtpBkLvW7HN+iZbCixiX+vzKe
         53lg==
X-Forwarded-Encrypted: i=1; AJvYcCUPw318lG+Hz01E/H1H4/OwPB8QXVHTNvd9YA/mnwc/W6ihEBdGfF7aZ/DzghXDeMe/RpLaT0FvGGBn@vger.kernel.org
X-Gm-Message-State: AOJu0YzzjfbwEOYYr/UO2nG0KdpFxYV7SMzK+6RpuPfV7vSyC2tZtBBW
	WXSwHvaBapckaHfES6S6J7vYCKcANXcDboTCVhvh43LMhl5rmj88iQMexV896pM=
X-Google-Smtp-Source: AGHT+IEDrFmWkNJyBlQfh9eLZ6iUWVe1jY5a4fTFgja8Q/hvy4vO1xvurXhI1C3fDweeY77TtX07yQ==
X-Received: by 2002:a05:6000:1f8b:b0:37d:4fab:c194 with SMTP id ffacd0b85a97d-38225a29fe4mr1936660f8f.25.1731671716421;
        Fri, 15 Nov 2024 03:55:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae2f602sm4157425f8f.90.2024.11.15.03.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 03:55:15 -0800 (PST)
Date: Fri, 15 Nov 2024 14:55:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Suraj Sonawane <surajsonawane0215@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: gpio-exar: replace division condition with direct
 comparison
Message-ID: <f9daa71f-cba7-4086-a523-a2e6aa526ff3@stanley.mountain>
References: <20241112201659.16785-1-surajsonawane0215@gmail.com>
 <ZzcWGJxqMJVYd4Tp@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzcWGJxqMJVYd4Tp@black.fi.intel.com>

Uh, I had to think back...  I had forgotten that I actually published that
check.  I can unpublish it.

I wrote it based on a real issue, and then when I looked at the warnings quite
a few places wrote code like "if (x / 4)" where they had intended to write if
if ((x % 4) == 0).  So it seemed like a good idea.

But in the two years since I published the warning, it has mostly been false
positives.

regards,
dan carpenter


