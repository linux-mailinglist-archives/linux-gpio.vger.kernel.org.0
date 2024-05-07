Return-Path: <linux-gpio+bounces-6186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47F8BDE09
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 11:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32C071F21BFE
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 09:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5041C14D702;
	Tue,  7 May 2024 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QAqP+gFC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AE014D2BF
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 09:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715073792; cv=none; b=SahXemELV9YdGmCLFDT7whB0M12J/Ak+IMOxIdbQ5o00TDElP31ZDwPBILmW4RKgq5coEseNcnuBqRhgD7lQXACqxk6bqBRaEhmyasCWf0sWbBRKdqrRWzICHcQjkBwrq6uf3Ex8Qo1CDVQIovYS9BhDtB1uW2Zz9giScAAjYTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715073792; c=relaxed/simple;
	bh=CIGuCq2oTTXwm7q7c3niN1BzE/WXTnj0SUEts0GDpJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZN12CWl18MYD+Po6dJMkBJAen56ujK1jE4y3dq/Nmb3PWgtUdCOFDU1WslmSeFbwfrrXL9C/VaKrCRl+nPJ/Oo/zJBCyXssM2hmqkZ4g7bm8w+eJ9niwpy5v+6D2PRntpOJq4uLg3sNTun6U7jgUQ2FKAc2HW1SQ++aUW5gIfMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QAqP+gFC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41ecffed96cso15931965e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2024 02:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715073787; x=1715678587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFjudIIJCIn6BXmqH23pk80aftBNCl4jnr2f82+DM9g=;
        b=QAqP+gFCNUZaXnH4+ZAWtzfUdQfAZBlXyPlvi4zUAPQ/0CzKc+FR0EFEsjdEIXzNly
         xAVp8871GBjTYrfU+LP/m02o1D027JAfirjGwCRzaRkLBQpTKdVCeq5XPyrc5WkP2M3l
         Ria2pyLAsPuVOPuSvDVgSO0TJu3X4UevWe4KSevth2fyu2acxmbKTt0NRVenBfda0M2h
         1z/c5+ktaG8VDCSkwkG/hoCZP9vntA8hbvMubeyr/xO/cv6OtAD17QEgNqV0i09E7R2f
         W5DdrFPVPpsLOa6xOt2PtFHFOaXA0p9bVwVH3lxYNvcmHUIb7xJtqdZ848zaiNgwyM3t
         +tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715073787; x=1715678587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFjudIIJCIn6BXmqH23pk80aftBNCl4jnr2f82+DM9g=;
        b=HbvePbhjyGRKfnzeLpS0SRwiPqdmPWMqOX4sZxpCXNY/+ufIC8REKY2r0uR++fWwKU
         ydQy6qU5XE/xMFg2XdqhIdpGfUNFrYm7spiZR8TZ/Bm9OBIBQboAL5r/T1ObmAM5kQys
         IdeKCXa4YEP3eFd/I8vKZTl/l+eAGxZ0Fzg4+KqY0AsYmFtNIKUyEG4eASfLiX0GyRvp
         j9uUXr2jB1kRF48v8t4sv5VeAJr4MnWXHLoqolFsmNevHM8/jftmBdCFS3chzDKuuDdd
         DRHrlU9FU2FPEW5+J+0/RJXeaBoqf28DxNWHBeZhGL+d3dQ2Yzuju/lCt8Ym14GpkEZl
         9j6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkBOm9xT4DkCr5Qz/2yQrecNBzwYROtImL1kRSq6q+gRAmKmDkYPzKpvVouvjCEdf+ZYgWcxV20EO32yCTI34jx/USXQtJp9cJMw==
X-Gm-Message-State: AOJu0YyuBcR/pvu5wIECKHEeS5cVteyLlWpf3B0poXacVxCo9Danzy+c
	XhBKloF0AXwSHRH/cxm92RyQjWST7aSRCe4/vZWvZlilHUpWY4brGI7yU3uToBk=
X-Google-Smtp-Source: AGHT+IFgGFICT5z1wwuCDtlUXT4kqqDcRTZf2OB23oPSpA6AbEz0cXR8GvyCGkxiGKqHE477WHQaVQ==
X-Received: by 2002:a05:600c:4e54:b0:41a:a5ff:ea3a with SMTP id e20-20020a05600c4e5400b0041aa5ffea3amr8548668wmq.19.1715073787307;
        Tue, 07 May 2024 02:23:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:581a:1d:3b79:3b03])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d4903000000b0034dbbcf01f5sm12445048wrq.42.2024.05.07.02.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 02:23:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] tools: tests: accept the new gpio-sim label format in test cases
Date: Tue,  7 May 2024 11:23:06 +0200
Message-Id: <171507378078.10054.11719865059684269343.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240506162506.176935-1-brgl@bgdev.pl>
References: <20240506162506.176935-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 06 May 2024 18:25:06 +0200, Bartosz Golaszewski wrote:
> Since kernel commit 840a97e2fbaf ("gpio: sim: delimit the fwnode name
> with a ":" when generating labels") the gpio-sim automatic labels are
> generated by delimiting the device name and the fwnode name with ':'
> instead of '-' for better readability. This will break the tests once
> linux v6.9 is out. Act in advance and accept both forms.
> 
> 
> [...]

Applied, thanks!

[1/1] tools: tests: accept the new gpio-sim label format in test cases
      commit: 35003a821ed5c6f72043a54f69ad9bb207976ed1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

