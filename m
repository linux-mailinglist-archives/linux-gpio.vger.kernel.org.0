Return-Path: <linux-gpio+bounces-10306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579497D38D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 11:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8595C1C23B52
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 09:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674AE13AA3E;
	Fri, 20 Sep 2024 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2fBI+dUV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DC513A3F9
	for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2024 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726824107; cv=none; b=qWAVy1L1OFIiO7X1ImDaOpIzY/3g05ylWt6Om8iXZKIQPOn/npZH3mEUZ3NchAKcA1Z/21mr2taP4+rnFZkc26cZ265g0Dw8EH4oQ6bQFjKRkWcGjYhJ5PMY2v3G30LaiSditLvBdw/RM2/0lBOpHil5CFSZevX0Dbna6r6p7r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726824107; c=relaxed/simple;
	bh=VWt+VluonzgNoagNdOSSXZm5Z5bcZSq1LIyja1vkkKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tkVrHqdPpYDuBaMKY3ME1WkZs9tIVvX31pEaDHfunu/5aUHVt8Z4Do4jUhYXgnYs4TLUNohvcYqqINlhb11qMF+CqPUd5U5VFLd477OwW2wx7WckLf9zsgX5vyZuDeyYc56vd+UzU/GG6ucLSIflzfAj9VaxTKlW2BswheyJnAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2fBI+dUV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso264654466b.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2024 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726824101; x=1727428901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqtjT5nTinZCTpuG6d6cUFlTwHJ/G0KHZvQWHnKM+Cw=;
        b=2fBI+dUVGGnnB3Ze/fMeQSFGISb23ZNDPEYe7I8Fjubc5HCJTYcMyvJwbriMkfc/oy
         bnlPCHQtqyEyzsMqOLuf2junsyW/OyEvvw32jxAmJhOyekHroehu/iLugW8o6wX+gmp1
         jMVk5Qo1gzJ+joYYAhr2+bKM/6BCintsHNF4p1xKlp+LhzzBD5eBd0KhgYJPWVp8jtb4
         ub5DjMJPIxLRgWRdmOV7MUGreJj7SUxkXKHB+NSJyTvqT3kXy/0o8KYJXh16ZYRPwMNt
         k9n5Qf2hVburKadry03hAwOZgqDac7OpnB+LDcxDSD3PsujT1xnOzCNnev3kvcTJ3ufY
         BMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726824101; x=1727428901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqtjT5nTinZCTpuG6d6cUFlTwHJ/G0KHZvQWHnKM+Cw=;
        b=t5ozA2bMKq4THQ8IxVqL19CkvE/zUbufnZmbtzmkMCf+6CnH1dKBB4j5WNO5tHLCLq
         NvjPbrFV2RZLGAL0//jD1tgeyifXJuqLMUbjC2ESBRGbThl09LwSNLygp5/63LPejRoD
         UzDzrQ4YON8xmFBckESZdUEl9r7jCOW7u5G9Ab7ZK9vzihgXHjn+BUOAtOo1Nmh3A2x1
         KcMy54I/4XL1LVGxZU1wlRi7RwLbLhnz2pfvlNb+qIshJ1yE0MTwndNljVdHqfbC/5O1
         GvrmcHz5IlgH4c2V3OqLGcD8CzlVWSgbZ3HwSvjfKbuw7g16bXthFNUB/perTJRFBVM2
         Ff/Q==
X-Gm-Message-State: AOJu0YyZbq6aCe27k899zrmA0BjupWp9oJ6BO88GnoHAqreV5gGpECT5
	AMQo3rdXrzqN/u9ZRgqmLSsANkqe33hxkc0bIdzSYwSwddpeqoxsnib8LQm7V9PS0vnPvX2yrv2
	180Q=
X-Google-Smtp-Source: AGHT+IHzlWdRkkleiHyGS8e7FOyfhLe/xvCK/M8YSPpv0Dv86RO+kK3Swv5PqKR+4Xn0safQjmHKTw==
X-Received: by 2002:a17:907:94c7:b0:a8d:1774:eb73 with SMTP id a640c23a62f3a-a90d51841d8mr170475466b.57.1726824100617;
        Fri, 20 Sep 2024 02:21:40 -0700 (PDT)
Received: from brgl-uxlite.. ([185.44.53.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3ffesm824514766b.134.2024.09.20.02.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 02:21:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: python: examples: Add graceful exit to async_watch_line_value
Date: Fri, 20 Sep 2024 11:21:38 +0200
Message-ID: <172682409161.15070.12026283838631796538.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917125455.324551-1-warthog618@gmail.com>
References: <20240917125455.324551-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 17 Sep 2024 20:54:55 +0800, Kent Gibson wrote:
> The purpose of the example is demonstrate using a request with poll().
> It provides a hint as to how the poll can be combined with other fds but,
> as Python comes with batteries included, the Python version of the example
> can be readily extended to actually demonstrate this, as well as how it
> can be used in multi-threaded environments.
> 
> Extend the example to use an eventfd to allow the poll() to be run in
> a background thread and be gracefully terminated by the main thread.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: examples: Add graceful exit to async_watch_line_value
      commit: 5715f61fd204d232925b30c26e20cce4993ddf5a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

