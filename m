Return-Path: <linux-gpio+bounces-11258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC499C0C4
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8005B245AB
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 07:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F312B145FEB;
	Mon, 14 Oct 2024 07:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UIe6mdvn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6F613FD83
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728889686; cv=none; b=VqCuaWmrlgEG4Bl4qAy3fGAnhLcE9XZZOu1Z73DIh1q5pXZLqf6yZcGdt/Hc4GgsPenwM+oRVYxWrL+YCRNP1J3eIZBgNEA+iKGGLekudFnxr0AwiQZ2VLrhYV2/xqfphqz08fwUImiauht+bj2tvhiImsJ+9wk1hMGbDGGKZGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728889686; c=relaxed/simple;
	bh=TZT5ebTH4CWOODZg+D+9Sjwtb3acqHmA1Pt8CHZZZl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVQbJxub26JSkaq77TzwTBqRHsjDKDvfUNbL+Rtco8741WiGLFTMRzSKOO6dFfraDE3kONOH+dg+aLvMUXsD7aDAvwpPUwJtphCC7uBmdX3XVflQDCFjCeSx+RbdgCPfHE2ZBYyTMtZwrQ5EweEz5fSS2qz4HgTNbWW7rw603Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UIe6mdvn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d47b38336so2353008f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 00:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728889683; x=1729494483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM0jUdvS8vQBIEphJOaQZGfTYWr3V+a1MBHvwLc6Urs=;
        b=UIe6mdvnEKnJ9o8Xukaa5YcyFzgn8UK3MZZsqi4N9EKrzGWz4f2H7eV8LoWpI+JFD6
         NRYsxhoyAGK2qNMv1CopXThoP55ywWfx/IM1/zhSheF8GRxFIrl2SQMXhfnXrEWuCrex
         8J8icmdGxA4FDnYY6E3+iTCIF3SsKXRrfqOgxZv1BtSvRkW6m3YDZN2h747Jw0/L716X
         GUGoQnfup5zIjiDBgurYh1Bjp+oYNs8lONQHWmJZgocHk2dfFNm2i20QZfIh4xLcdMOj
         zMNOl//8f/iwJUaaF31c/VQ3jKYKpxrdfMI7aNR7W1gml6fq+nt0WGycYwR49FPQLLvo
         /k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728889683; x=1729494483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rM0jUdvS8vQBIEphJOaQZGfTYWr3V+a1MBHvwLc6Urs=;
        b=mnPGVhPbMNIe2NREI9wZh3t+V2ZKEtI51nQLsWFYfPo+g8xrGIVVnfGFbJmYcCKfeE
         hZ12d7Z6qd14o5XfaXlyS4dlScoKecIpCAFlAJP4Z96gWW2Lpe0zb9QFe7Lgc4mArEqC
         lKqJTiR3sA6PsDEQZaGMyBsN2il9jf5pmMxRa5gNNQyMqJxqOnJZZ7NKNLV+5Do/eODR
         soKZb93FX1zePIlM0ubzvy4dOtKIMRvwWISYr1XM6boMmtzs/dYpvV2oGp/qf/BkllRm
         AZxjkUbC9Cby6yk+2iMvxsJxo5WCtXokPEdIPqn/H+V/JsWrETDIBGrMG5VYLpXyot+K
         R/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyrP+62PrECNIXUqFieU6bd80cumgTt0uXjS+f5hhpq5QUch6naxxKm/lSSlx940ZJqQnZdBk8YFN6@vger.kernel.org
X-Gm-Message-State: AOJu0YwQeGT/JAptRoUcDO7S/nrhPpW+twLJQhO2c95WkUp9xVzlTOrk
	bQvzg4nZCU15wHlOyPeX/LQux4fpydcf6zjMynsCsUHyM3QEG1Y0aiwUJ8M72pM=
X-Google-Smtp-Source: AGHT+IEulhkp3fHYNj6rK+6qh0DQ6WJT7inEyVJtW4BCAUPfjcjoN4OMC9Wck5BHBW9Ov4L58jMYTQ==
X-Received: by 2002:a5d:6843:0:b0:37d:43ad:14eb with SMTP id ffacd0b85a97d-37d551b7365mr6149072f8f.14.1728889683363;
        Mon, 14 Oct 2024 00:08:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b2780c1sm10642161f8f.0.2024.10.14.00.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 00:08:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v5] gpio: add support for FTDI's MPSSE as GPIO
Date: Mon, 14 Oct 2024 09:08:01 +0200
Message-ID: <172888967999.6626.5327506199486226336.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009131131.1618329-1-mstrodl@csh.rit.edu>
References: <20241009131131.1618329-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 09 Oct 2024 09:11:31 -0400, Mary Strodl wrote:
> FTDI FT2232H is a USB to GPIO chip. Sealevel produces some devices
> with this chip. FT2232H presents itself as a composite device with two
> interfaces (each is an "MPSSE"). Each MPSSE has two banks (high and low)
> of 8 GPIO each. I believe some MPSSE's have only one bank, but I don't
> know how to identify them (I don't have any for testing) and as a result
> are unsupported for the time being.
> 
> [...]

Applied, thanks!

[1/1] gpio: add support for FTDI's MPSSE as GPIO
      commit: c46a74ff05c0ac76ba11ef21c930c3b447abf31a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

