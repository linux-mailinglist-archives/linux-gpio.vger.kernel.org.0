Return-Path: <linux-gpio+bounces-13544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEA59E5533
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E907A16A678
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 12:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA7E218AC1;
	Thu,  5 Dec 2024 12:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vMSimtEa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30B218ACA
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733400930; cv=none; b=a606WcOo7k5EibEhgyftpgi9u8pQ0QlHZMTDpL5vf59aFR2CXT7CjjBqUUQCdTQ7RIDZJ40Neo1YEJ8ryP1ipp9nTibMTYcJO+a8MgpSOf2yOtzMjh17ZidpsrN8YpDzBIALfgZLG8CjoK/PhtNh4/pVBTQ77shFs8dEGQW/dOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733400930; c=relaxed/simple;
	bh=UW+ZUpvfcfWDTZpunCNNZkPbNxjdzo6HcjHvWihi3WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MXLHttXn+arjTYIRZszfFzVa0GtiiijK5HO7hdCT+RjvaCtHjF1QlWxQgd2RzjuCebHKrmir5yfaSeCRCIB+a7QeP727ANFLxCzHwIUoruwp2o4gG2AQSsQXMJtG40k/YBlPDD63L1R588Tk5i07psC0+08S9UeDjNLwfs3ch3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vMSimtEa; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e5db74d3so482770f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2024 04:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733400926; x=1734005726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gY4jyriOEKZyLnJE0vGxHVVOzKfqLgdZoGmwsUcarbc=;
        b=vMSimtEahX+HpsJkMIq4mf0f0e6nAYRsHN62OJ9yvgsQYYrSHt+Dp11wonNLx2d7P6
         tafKXoplo2EsvG8Pz4BkcZA5vrvXzaFkN7Oc+9Wlzi0DlZEKi4sEhBSIjqjpSu6OtFp8
         SWnVNmiTsNHOL/GKavEyCeEuW/Qd+kkva3qgJn2tIB+EhT39kCoCBou8MuV9mPX93u6k
         l3ULPMZUnW0g+qVto4Al64ckomTPO+r9PuWMbIf3srWe/Mtxw/0kC1Kty7gwD84SVn2j
         92Z0ugXe8zm2XeucSjA7Zs9LYWevz66PSELrPINdbBtrcwtUAZto/zsg6+j/X9Q4CgJ4
         azOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733400926; x=1734005726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gY4jyriOEKZyLnJE0vGxHVVOzKfqLgdZoGmwsUcarbc=;
        b=eZbF4H6g/X3Z1ue0vLQJAsaps6QpDPWmURA4xbFd4v4ldFUt5Aywtc2bMRdVwLwUHE
         0AGoCr/vp5RlVypcX6ceMiMQkP5sb9xFuG4Qjkkbk8nAEouuRxL8MpuCrdOwjD43wxRY
         cMbxODKaoHAiZY+hV8HU8bJcrORC6WjDxdwE8ed9rb8a1qFHUVgNIRj4iRH6+wbqEN9Y
         a6xwkGFx0VxEe7t/IM7Rkf2w2N9gaCQcqdzL35bFzyBUIxyxxsXsDjnvv+n3ERqEaBPt
         qo9cwZfIEY289Etiz93g5QbKtpI6pqIF3y1UfSFn06rNsGqMKw7afzKGR/m1RDVpLIfZ
         csWQ==
X-Gm-Message-State: AOJu0Yzs8T7suQavpbre8yXVSWQm3mvv/Ic/vfM8Vxajp7d50c5WHnrT
	dHuZigMpoQzYr149WLG2Wgu30nuAmzCHFzpOanMTl+1IUnG/eei1McMxA6/WDjZAUkZmBO0ZREt
	RQDY=
X-Gm-Gg: ASbGncseBqMCya+ofZuzC4b/urDHojS3WRVn8XwpA1pmCWuKIvC3WkU9P/YWs+oKOps
	+Nm0vPWftRNACuZHS3sLZE92ONmq6aOhxQpPvTfE3tJvJ15kxe0y5QyzirF4DBhedbm309J9W1J
	2kZWf94XA2g38qJwgZ0yWlWGfRL8Qc0tQ0Ivxi0Prrddt8u0Z32zzoCv4UBGLodANwfIjvS1lBp
	ODjxUxVZ+7KrTu1b6Qpbs3l7kD+/WmDb46OdVPJbVkzTJ/1
X-Google-Smtp-Source: AGHT+IFneey2lxrLoI9OQR9skYI1bQ3FNZ3tGvEDNgPi29bYBpl/TJVAwIwu1ozM/FxFCYlhT/a/9w==
X-Received: by 2002:a5d:6dae:0:b0:385:e1a8:e2a1 with SMTP id ffacd0b85a97d-385fd3c59a7mr8953328f8f.3.1733400925677;
        Thu, 05 Dec 2024 04:15:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:c2c8:33f:e860])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621909748sm1766386f8f.67.2024.12.05.04.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:15:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: twl4030: use gpiochip_get_data
Date: Thu,  5 Dec 2024 13:15:23 +0100
Message-ID: <173340091124.42145.941891093245304888.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203233354.184404-1-rosenp@gmail.com>
References: <20241203233354.184404-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 03 Dec 2024 15:33:54 -0800, Rosen Penev wrote:
> We can pass the pointer in probe to gpiochip_add_data instead of using
> dev_get_drvdata.
> 
> 

Indeed, looks much nicer.

Applied, thanks!

[1/1] gpio: twl4030: use gpiochip_get_data
      commit: 26a4dedc5f3cdb6e2de79371f57d12e5119f03c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

