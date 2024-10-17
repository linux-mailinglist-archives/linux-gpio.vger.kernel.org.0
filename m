Return-Path: <linux-gpio+bounces-11495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B99A1B24
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2E48289DA0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 06:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DD51C1724;
	Thu, 17 Oct 2024 06:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e5P9AM5G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1407D192D69
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 06:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729148281; cv=none; b=CpcZHRRkpVKDXpKx9Mr7ydqh/wpmSc1WNYVPKyeoItOCZRQ82O68uKF02PGE+x23zzMwMndJ9uh/Cckfkph++kKnrCj2aysOAFA2Xf/x+d40j8qiAqa3x46BnDngTdiMoKwzhRLExexzZ4rYVQh7jT3Rofom/d6nFjsuhJGsq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729148281; c=relaxed/simple;
	bh=9PbfSRqIXFlwYhoX9bW5L1LVRxrN+vMPwwuGbqGJ/S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m3zdxVoys/2mAhSvSlIrltm4CQKmUXOYEcKpgGiqHr3xfG5ewmC1Q0yaD2PiN7AlexvdPBqWVyLy7kDtU+mOxLYVUfT1t5i/riLWQ1CnMhHH9pyjgXlnxWIggcP5SvUYwuOqafkTRIpe9axqlCEunVZqvuSAGnctgpwhJ0Q0aN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e5P9AM5G; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso412004f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 23:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729148277; x=1729753077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsVxKNaCOUPIwvV/JXBrrJwghFlIic3EFjT3Sx4al/4=;
        b=e5P9AM5GCRY76Nh0zxawgS4QiCjbScVRh23yTZA1IpKy4mmiacs0Oh2EnQ8caPAiCw
         Sd5gkn9wdyrbSBZ/cYJqXY9SBTFhMfuf9nFid4u5K9TFwmjyApP7eHozjRFNjcjvu8w8
         r6uT/llf+i2JjqxCkNMwemPuGKMuTd5Y6ZPfKLzs+XEt08YbQ7DjkSLDjhOS3qZNqPVZ
         A3qXAAW2uJBmT4wcIDtfO1828xxGSFdh9WDzofz69aCsORjxcrMHumoXcuF06o5AHpwr
         jrx8sm9WX2c1I6xz7OciibH3gJfoAm+EwSQf0djgtkBrA8S9HFQK1JAAvMnzk6OpXk6q
         AYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729148277; x=1729753077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsVxKNaCOUPIwvV/JXBrrJwghFlIic3EFjT3Sx4al/4=;
        b=lM1RNVhLjAPMsHge1cHgJP6Kg1w8aoRUiwqwMhtzUyIRwcqjQL0HI5dvVTJFgN11gh
         sXey/kxwbvfT2u8LXNsRTrqG7uugNOD4fnEPjMqICPEknKmm2EmvyKwjwC6MMZxwYMxk
         156mOMzIFO3fb/vOXkkTrC6SJF469DSldI+bdLuZ+M2G9G3tGC4DZhnEa+GuXMhOipTW
         +7tLQRWv9O2hqZXedatkVVd9EPrBZ4D8E1pAEQDHdx/7cX0N1hwuXqBHbIVjHewja150
         dISI1WTngFM7lj85c4Yr91EeSpHvAsQ98o4iY9opJQkrG82WxjAR003QiVFxO6WiBNRo
         LFkw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+mVazjmTpseqzSxjXHh20JqOExd2LyjS1Aranq8nFaGCOHW2wJozWiNa4yOE2KqpV9kgfUS4iW4J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1rijj5MHhEDW4ai6X9p8zH7hdezcUjtycKdBDwO+D+wcVXx8F
	vYNgNIjvPuSfvVSipCGf2cVISzcatwHwCWAF/7S38SIZpdFh4GKyQoML8BWKlD4=
X-Google-Smtp-Source: AGHT+IEtYf+6+JZ8RLzaXHf/9kDuV4vdC65QlGCnnohbNUZKjscouGvfPWgxqcZTV5jDTXH1TpWWhg==
X-Received: by 2002:adf:ce83:0:b0:37d:480f:9a6c with SMTP id ffacd0b85a97d-37d86c02a75mr4142670f8f.25.1729148277158;
        Wed, 16 Oct 2024 23:57:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa87adasm6260026f8f.29.2024.10.16.23.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:57:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: fold the Kconfig prompt into the option type for GPIO CDEV
Date: Thu, 17 Oct 2024 08:57:50 +0200
Message-ID: <172914826142.5858.5149802789967077947.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014110707.101320-1-brgl@bgdev.pl>
References: <20241014110707.101320-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Oct 2024 13:07:07 +0200, Bartosz Golaszewski wrote:
> The 'if !EXPERT' bit will work fine if it follows the 'bool "foobar"'
> declaration. No need to have separate entries for it.
> 
> 

Applied, thanks!

[1/1] gpio: fold the Kconfig prompt into the option type for GPIO CDEV
      commit: 3dcf0643fa5cd65e667057cfa11d6e54ac36f2ff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

