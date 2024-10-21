Return-Path: <linux-gpio+bounces-11707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B85B9A5CCF
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 09:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2501C20D0A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 07:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0CD1D1741;
	Mon, 21 Oct 2024 07:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vvXqehF2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7059194A75
	for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2024 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495450; cv=none; b=MU9gNMkAOkE3a3qo9qbek/iiL1eZieJf/fcPaYhBYeGRIn9yg5jFB8qYOiMzC2xLMMcXbnS2IOxTGaofMemK0hNxO5NC7sq+Crj5UcydlBRDQpPj2IieWn/nYaMWz5R7ZfZpGMi9TOfPhpBmAWTHdRrGwFj4hE1QUzKa9slK588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495450; c=relaxed/simple;
	bh=ygHe1yo5X739Z2i0Ht+sxKKseZPcO8V+yuvdzl79y7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BeDoNC1kNDFGxvRDY7+OzUj3HoKEvCMAh/7gyhYLvAxqCQTmBY1yph+e9Ttet3D/MXINnQoG3Hk7lgnEoKMwASGL1ukxeX0LtXv2hXtV7XHlkGZCuhn0znTor3oZXj1KuRxpHua0M7d13nIWh9Ysi7irGRAOMtyCo1v8dE9VxyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vvXqehF2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d808ae924so2829102f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2024 00:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729495447; x=1730100247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5salKsabN8xZGbaO2w6FXXUjXajRUy3N4MSiiDUzaYU=;
        b=vvXqehF2p80+65CeYCy5ITrcyXSbrYtFaIXFQMBysKbtCwDsEWpEysRiJJoDRI3jJS
         j56G3NrXt4UvHjxJC5TvdcsioPmm7GIWsReKH6wrcPIAuG6VCc/pAk6QuEutjvfhgpaU
         4U+fqI6oF/kHP7v3Pcy/Py2P1ZJDGruTk7MOV2t8oVWP3n3VwM5SISv5RuKDt4O4qeka
         6EQGaSZcvQ6lZpWORSeJXo8M2qxXK2XjEIbILn8Z0ObtSfV2ipjcn9FYID5vM9xqO2rf
         THG4/RVHV9PATihCKGIOy26xNNZ+cD9ZSy7ZiBoHsFgcPXXVrbBwHujv6pS06dcUqXrc
         uUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495447; x=1730100247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5salKsabN8xZGbaO2w6FXXUjXajRUy3N4MSiiDUzaYU=;
        b=l3Rse2/VDdyavrkjAJm8syGBuIjehyuMT+14rfXdn97MqKX8IKwEPPosvLzt9tiBpw
         8A0N/hZMAb0bAvRlXOoFpb9aVIC/V9P3unI8YP7nsqn7T22GoPegr5yL7zqGxhLfTcZA
         AoVYcSNJjPjlcJICuWV5rHKwhBWc4leRVMO5tERzrlbS3nJhCdPYG/kOJj9O3cT6OUMU
         chzD6Xwpjh+8dLXdx9BdR+ZDCg9Hyuah1rwfPqk51LFQMdwVi2IVAYyEI7R/sGi+JF9p
         idBiWzijahel1vjRuxki4+DalCL/qjgLyeDJZ5XMlhKwUgdqgxCWlSn0Qs4wcCuOFt7q
         r+mA==
X-Forwarded-Encrypted: i=1; AJvYcCVvWLE8VZzgP8cHHaUX9MI+zlPkBhpI1BctqQLI9eM+L2CM7blMb+Cb8kla/Iz2Nt5RTQG1LlifjPoN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqqo8EuzPhtE2M8mcocxjRU0ZcqBa7lCRGeH0TNPilJoUilCzD
	lot5oUpFC2zEJ3ZnaU5qF6JZToVq2syGztgc18dvro+jMm0HFCZMwHZXy1IQNsI=
X-Google-Smtp-Source: AGHT+IG++WeipqGBQQNCcEKr5JN6eLYexT/EEKA4ma7iNQ3SGDigtEokdh0sGBQw23WeSwQDhh6aLQ==
X-Received: by 2002:a5d:4150:0:b0:37d:481e:fca with SMTP id ffacd0b85a97d-37eab709614mr5918091f8f.27.1729495447127;
        Mon, 21 Oct 2024 00:24:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b40b:61e8:fa25:f97b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9baa7sm3517954f8f.96.2024.10.21.00.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:24:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: 74x164: shrink code
Date: Mon, 21 Oct 2024 09:24:03 +0200
Message-ID: <172949543974.8769.15579843866127795628.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241017150835.105676-1-brgl@bgdev.pl>
References: <20241017150835.105676-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 17 Oct 2024 17:08:35 +0200, Bartosz Golaszewski wrote:
> Use managed helpers to drop the goto label from probe() and shrink the
> remove() callback.
> 
> 

Applied, thanks!

[1/1] gpio: 74x164: shrink code
      commit: dacd8ed24c01e26c9b1f76189222cac8982fb75f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

