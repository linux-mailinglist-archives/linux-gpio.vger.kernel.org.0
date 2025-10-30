Return-Path: <linux-gpio+bounces-27863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 103CAC1F4D3
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 10:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2314B42079A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 09:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237D0341645;
	Thu, 30 Oct 2025 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WjwJRUkn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E4530E857
	for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816529; cv=none; b=YS/f4IR9kpca7Doo8TPycr1ToZrG5Nm+eSqK1kYECAuYt7HQHJdO2qRnCIQQsD/INLq8sPXVMU8iqlRLE1PzIltydJ3UX+0gez2tdv+ujF+G603k1kuV011tx/f+dieKxb1ZFxyFT8psmqIOzNEolXvHYEDRID8mDvPrn+PgGys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816529; c=relaxed/simple;
	bh=xkvI7JJjRLswA77nMH3pbHH6X0Zj/X1+CJZLyF9Itqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=URj13Xq7Ff2eju1yPauS2KuVUKuisEeC9rZn7UauOYZ7TxIcEx/lEcAff7ikVMfy14De4ifOfA7uermv1gthdsru3//dcH9tQAXM2goGTDyhhZ8cHH4KwWqkIsdH6/riRzic83ln5E+cOyj9Fwf8xbf9HmuPUFNEf04gaAblwL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WjwJRUkn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471191ac79dso8983145e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761816526; x=1762421326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSDNxghdg8zkqAoa5p4bXl7N7lGv4samb2Pk9SkOcB4=;
        b=WjwJRUknVk2EXFM6lQD/IpJO+dPKqhUDOvtpruTH9Fn6okI4/+p0p2v19jbpsedJ3Y
         rZT0Fu4471daVWjLym6yYfgYQLSQwCnYswWpWkemRNTzhVjCyPhibzNkmy7wn4HiwkUC
         p5X0h8H1Iq7yR8Vb8ThZ/W1L0af9MMWnr/ilgMnLRFJDgSGDvxXMcflCGMnmkRT0xMpS
         nr1bnwtm5TQg3jhVOaS9PE1/3rIiyLMP9ctByds4LQACtAxOA1TvIvQIbQkfv3b+aAgo
         QHYtWYJNhEW5ZBayfzc1xIl2PTY/CUpXJcULzXlEUn8rGfFVQTsvB4ew4fbbgSHV0GHF
         N+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816526; x=1762421326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSDNxghdg8zkqAoa5p4bXl7N7lGv4samb2Pk9SkOcB4=;
        b=xRjUNTa3VfUt/agCkgc8deTTds4qBoJJO6SmgFD5FLKatN4HvPuhe4F/VNj5fyM9u8
         vKqIandvsZZwRdP5RhbpjWNGi/6W7gA26KqzCnIt6Z9ETt0h6JiiwJgReOGnITGKHGWp
         fd0G3AkKKU1zkiqkWPnv2TMX9PRM4muTxCQlfIkKd/ba7INAA22Lh12mbdyE0V+HsEPV
         K7x1zlkrarfBU53Le67tZbFtKwWz4Hm/IVa+CeFPgJ3zIlkZaNuaJXSONhUemKYzZWmT
         M6eUg5Otr1v0vwx4JqbWlBtBjoOd+q6wXvlAKzt4QuxVH4hCggSfiU0B1W0YSUcHTXxQ
         8p3g==
X-Forwarded-Encrypted: i=1; AJvYcCXBVqmfQ3gTanLuYn89pRlA/mwsrNI6G7FjEKCSGprIt88330f3vM2DjWDD177pANshNvRtcIxl5s4k@vger.kernel.org
X-Gm-Message-State: AOJu0YyYhtsZrmqT8RK+o//BjIFjbOodDAabN/hbO01LdKkTKgfk4XGO
	8df8sqIRjmE2Eb3Cu4t/7Kw8sFjCfhq8FtZbhpxvhNgLk4V7Vg8cpaj8yOqGLukHusQ=
X-Gm-Gg: ASbGncuPzp+yVhCTqi93lQUEmTOzgEOcedAvW7sRC6BlQ9vY78hul53MwKZsvN4zrpm
	GevfnitvBQrEsb6gGYgIeITw2+DgN+c7kXjT7R2tuDvZn56z0UKRxS9bQowJGs/bRnOQh6KfnRF
	CdwCOdSSoFb5/u/YlCx1UpS3ocmJjqYQDz0YTksoX1DMUtG0bUrwPmXJwKcxh68cbJFbG71FDnV
	MOF93sZoQqE5GmLpmjdcuQwYxqcRM/2N8hbym7JGidMoa73heGRQriO1m2Ntk8eu75x/zrfxCIB
	Dw99Go9tgTPUcfRIeOHbR3gj0t9mEYxraAsbm9Cwkr88sHp+cmnPoKCbe1IgJPTws9LOHYAOaRK
	cUbrwfqQOREw1Gdx5Fj2rzJWZDE7M2u+87xPZHC17l/pRM0FjUgaLLigpin6FuNC86fn0Aw==
X-Google-Smtp-Source: AGHT+IGLIFbBL40DZw4XiGHjdXG6bk7FaQ4ETbbN0uGd8OVFlfoXKEJV2/ulV3+2xAoMbAIYp4+DqQ==
X-Received: by 2002:a05:6000:230a:b0:427:719f:de70 with SMTP id ffacd0b85a97d-429aef81bc8mr5220107f8f.14.1761816526020;
        Thu, 30 Oct 2025 02:28:46 -0700 (PDT)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:4de0:1456:94e9:3a3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d4494sm31524134f8f.21.2025.10.30.02.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:28:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: mm-lantiq: update kernel docs
Date: Thu, 30 Oct 2025 10:28:38 +0100
Message-ID: <176181651570.78037.2946846263283889588.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029091138.7995-1-brgl@bgdev.pl>
References: <20251029091138.7995-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 29 Oct 2025 10:11:38 +0100, Bartosz Golaszewski wrote:
> Update kernel docs which are now outdated following the conversion to
> using the modern GPIO provider API.
> 
> 

Applied, thanks!

[1/1] gpio: mm-lantiq: update kernel docs
      https://git.kernel.org/brgl/linux/c/bac88be0d2a83daf761129828e7ae3c79cc260c2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

