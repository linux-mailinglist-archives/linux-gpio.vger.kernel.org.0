Return-Path: <linux-gpio+bounces-8304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB6793796A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 16:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0A0283415
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 14:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46426143C5C;
	Fri, 19 Jul 2024 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CmuOcrsT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24C313D63B
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jul 2024 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721401104; cv=none; b=uIdMVkDmkClr9pAVhIoD2MjR6x7R1e3vE7W54DdKNkhsPOT2PzhLcP5wybRf90YV7L9ydZ8CbRniCPfl7ex6mWj4pZgN3jLY/XwL4QHcGIwHCa1tGbOEEN2/taJv+VYGc4pg7ek70EvSsiwYbBdnjZY5UKs+3r/MpC8YXliGS4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721401104; c=relaxed/simple;
	bh=/L0E1OFBSqZHyMIzxrDbyrO/QpR+srDPOrCtc9hLQS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXMJ/iEjqKaRFLeTOP40QNLgMZ+6xsAOFUZIEcQMThptHIRY/JhlBLHIuIFIg1b1sY4zMpEDo3u6OdPoNZba8/f91FIPZ0TkaPvrkzUqZ1VYKaDVfCU9IguHUjAcH1hDD0VI74vOD36Mn3rMe1QUTcy2otnxfpoYZwoMVHLE4UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CmuOcrsT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4266ed6c691so11694245e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jul 2024 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721401101; x=1722005901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQHOTm7Y3ccV/j/KO9p8hVujVUcq/9bgQV6XKF7Ad4o=;
        b=CmuOcrsTDrwAh+n2VSbkagxBqMHCsMg+FX9ycXfIPAVFr3BTp/5++c2OH2quHYmcgh
         0aoRkkUfa5GjBYu+vT3F/yunayqZhKnuf9log3ek2UlGXIhgYBnRamTfVpPLXVCvRg6l
         GeRj0ww0ugEjT4ZTJ3KtJBzgVx9/VLDhG9dJJC9NYYwxvJiMcgY2PlWquenrMIegZ5mu
         WQq1Q2sY3FvzNAMaY7zxavIlqRrhkq/mhbiCcgVrHdGivgCkTvk8KKu3pBHMBmLb/xJ4
         AXswolIhTywnNyz/ZPibVDeNkA/wi/ysVgq2EB2YIobJSsD+qR08fHz/dPeE7sKyYma2
         NTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721401101; x=1722005901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQHOTm7Y3ccV/j/KO9p8hVujVUcq/9bgQV6XKF7Ad4o=;
        b=DN2WFhWGjmfI47dGR8pLcfy38db4+WXJ/s1i/USAusjaWXy4KO6uIiz0rC2PF4kjj9
         sTKJNNRimWqgJ9V++hE7HDrMq5x8nUFIQs8rQG1vjojMb4oFAkVkwiP50o7ly1JwiD9G
         OjtIXkI5f7lHcJuIrfewLjZ0K+gGrZLx5RP3DGxRq8JxkpKoL+V8W//xHQF2ko55EzKB
         uYXEETFZ5Je+5jV9V5rGn/Hpkha402KGwuPweGurdByMheXL1HQBMa5JvuwfLKJkCG7x
         f8MP3swjfjv7CL2I/l/+hKWI2z2DT/7xHDTu73CheymbwbX23SSJGzVGXzkTm7XeOjFM
         TT+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCuHY+mzUzlS+xFMjxvkzmlYlRQAWc77AB4iR3dfRs75CSAQ8YoLmwW2aNRrbVVfzKMLKjKJsURPaAEGvNf0e7QrEWkPbDXuKzRA==
X-Gm-Message-State: AOJu0YwK0ysM3fckvfLXHBFlA7eMMdhLMP0f3j6YdqB+xSWEE9K+oCUn
	/4NeSRA7xMYK90eCzLyLVPhj/1z6V3dZUEKNhORReFLD0PSC1FSCu8iFKRLONMI=
X-Google-Smtp-Source: AGHT+IGntyXO3e7z599v/iJ4YjoQgBgO1EK3mOJ9D514vnBqigaXjO+6vlCUfj0E/lsC2S8/XF8d9Q==
X-Received: by 2002:a05:600c:15cb:b0:426:58cb:8ca3 with SMTP id 5b1f17b1804b1-427d7293d49mr14411955e9.21.1721401100858;
        Fri, 19 Jul 2024 07:58:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2aee:948:fb51:d5a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a8e436sm53905425e9.33.2024.07.19.07.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 07:58:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] gpio: virtuser: avoid non-constant format string
Date: Fri, 19 Jul 2024 16:58:18 +0200
Message-ID: <172140109528.139764.1997443396332853714.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719144422.2082394-1-arnd@kernel.org>
References: <20240719144422.2082394-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 19 Jul 2024 16:44:10 +0200, Arnd Bergmann wrote:
> Using a string variable as an sprintf format is potentially
> dangerous, and gcc can warn about this:
> 
> drivers/gpio/gpio-virtuser.c: In function 'gpio_virtuser_dbgfs_init_line_attrs':
> drivers/gpio/gpio-virtuser.c:808:9: error: format not a string literal and no format arguments [-Werror=format-security]
>   808 |         sprintf(data->consumer, id);
>       |         ^~~~~~~
> 
> [...]

Applied, thanks!

[1/1] gpio: virtuser: avoid non-constant format string
      commit: 3ae08e47742eeebf2190900d31ddac53fdd13a5b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

