Return-Path: <linux-gpio+bounces-6719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D77868D1701
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 11:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 149031C22C8A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 09:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9163613D618;
	Tue, 28 May 2024 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ye/7+DK5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6219F73474
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716887672; cv=none; b=OKj5Meh+Jk+kvPvEyGd5F0zgaPO01bxNmk1dPTDW0FHgoN+ZWjdw0HdvWArUSGS8Z6/9okA9x7mwkm+bZ5oPn4os09bTYmDQ+RjygIQoOcU7alTSW/3Wz8qCEXmiJ2MTeOAXBWjQLaHffWICqzjoVtUnL49/f8yy7sUa9ksBcN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716887672; c=relaxed/simple;
	bh=jKQCs4D4V9knEPuqqeVO+i3nqP2WfwbPVJ82OkWSexc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WEk4d77hwgXRxJizrB3+B4u1o4ZJL61bveVdYgdP9s+Hn5EhFlF5aK64+n01eqAZ+L9tBgR1j5TsyL/qcSoZNuO8GE+rWyE9cCOmNZSE/KQbubAtAG5FNT38swhPWpWBuPRA2bSyC7VY2WNWHxwljSE+ym2qq1E/0FbhmHEFxhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ye/7+DK5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-357d533b744so523498f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716887668; x=1717492468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln8YvVhf/nOTdvHmWQXA5NgQG0yGaru+0KQ7MY0vvfY=;
        b=ye/7+DK52kPKk9KPX/yjjnJNMVqWKlFolfde99x7Dgozf9eQVGJBNp8NDE6FmFKoIJ
         LWjM75yPM4mUR8ZtCQ1KprYEmOx1v6UqGfETgbKbNDY5lv5atY/PGRz4/8bQnaAutNkY
         k8vkUEAlVXqwYu7FWmtdwlHusybsaAMl3AZh4coBlCP+MiQkXKj1NypITfrUQKL4rvfL
         2kG8EKMiqjplwv6Beg0DY+ioC+CTEp8h13aHx69rskkCQ80yOdBk4j4pjQ6Vkby5qsIs
         bKGUhGIGXpDZKnT/CfkOH5YCDY8fvQ1uIhyTNFnPvl4yOp/UVGK/tYQLCWqnu06thBzr
         DQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716887668; x=1717492468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln8YvVhf/nOTdvHmWQXA5NgQG0yGaru+0KQ7MY0vvfY=;
        b=q84/Ps+V/2JcKMXy++73jblSPKK8LhkUKvHVaMk0Thxv4CLF12e1WsSMmXvFhJw4CU
         Z5myRkTzFIoU1qq8W0hFh6MxvQv1AcaSo4DgdoIyEmbLMuvq9PM2pDcztJIlg8ZzDdmR
         Dbbp9Ho8RE9cyOwTt8/ieEAjHessrLRg12Sylm2UwvV+U4fmIq9ErsNvL2rS1KC/eNgd
         B4cQeFyD8uUiGB4egQD+WX3IswU0qZmQuwftmiyuTwDFHsi3+f2TmPBfy2vNATuvIigH
         95GSyO1zee9l27JsVly4igrQ3AaSfRbRfa1hF4wwp7hsY6P44ELapV7ExzynNiA9sy7O
         vNZg==
X-Gm-Message-State: AOJu0YzdmPbrOxHNcDZlCjJ7UTUdS/E3aH54xT/w8qyxqDP/SUN41syU
	zfJpJg3UcEAQkG92eAlvJ1s7dlgh3XL2I3Ah6KMu59BEZVkmDqFxDhUUoD02k5SrPNZZBPtJPLw
	d
X-Google-Smtp-Source: AGHT+IEsohdcRideuLmQtDW+bKkAcorqFWxQRN/m4SN0rnFcM37kqzKpNlB3K+DEvixiceLUrfXHQQ==
X-Received: by 2002:adf:a34a:0:b0:354:eb2d:be00 with SMTP id ffacd0b85a97d-3552fdf235fmr7171655f8f.62.1716887668287;
        Tue, 28 May 2024 02:14:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35b2500e0dbsm1294065f8f.86.2024.05.28.02.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 02:14:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/2] bindings: python: fix running tests via Makefile
Date: Tue, 28 May 2024 11:14:26 +0200
Message-ID: <171688766294.44697.16948097872903942955.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240526113234.253859-1-warthog618@gmail.com>
References: <20240526113234.253859-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 26 May 2024 19:32:32 +0800, Kent Gibson wrote:
> Recently I couldn't work out how to run the test suite for the Python
> bindings.  There were two problems, the make target did not run the
> tests correctly, and the tests need to be run as root.  This series
> fixes the Makefile so the tests can be run via the make target, and
> documents how to call it as it isn't totally obvious.
> 
> Patch 1 adds a Testing section to the README to clarify how to run the
> tests.
> 
> [...]

Applied, thanks!

[1/2] bindings: python: add Testing section to README
      commit: 8635780c1c21d7833c960d49a796be5553b3f624
[2/2] bindings: python: fix python-tests-run make target
      commit: dee10f08070d97d9dc8b1dfde7576fb1a8d81cc6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

