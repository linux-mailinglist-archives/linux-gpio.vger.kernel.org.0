Return-Path: <linux-gpio+bounces-8088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E9929E4A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 10:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5FA280C08
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 08:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A938D3FB1B;
	Mon,  8 Jul 2024 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IMDZk9Fs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028DF38FB0
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720427240; cv=none; b=nZNcvsaGKd9rXKgMF3EUs7ZbjmudFBD1Etr/vzkZG1m1GhTMXStiTVgU5BQNEMq2Wy1JMnv/OIIXq5195BQ7xdQhowAC1nDU8jWa2q0Q3r1PuZdKrDEFf1eetjlYiaKXjSGkUrUFGy2Q9qck6Sd/phhfnox2hg9ZTpKdQR8oK0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720427240; c=relaxed/simple;
	bh=YX3K9QoCWzNZff9uMuOLqqZmixFZ6Zh5S0PcfSoyi7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EViQX/QHhW6cWUQRQNDID6J+NJTVwJvJaSopMn8/kuwK9Q0howVCLpUdwDFeGIiFy85DR+xSsKGDZxDGjs2RJr0M9c6p5BgR9pzc+krXLTryv5ORTy8H4XjpuuEgA/8XVLpdtcGp7aFSSw5KFw+NkEAZNklfQXQ/vlFtyWWcPck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IMDZk9Fs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4266bb98b4aso3627935e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720427237; x=1721032037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqWQVdHO+aL9sRjJ+leEKZothBpneGJaFH9mgptqiH0=;
        b=IMDZk9FsJxdeJIJHcBNvtRP7OI6+xoZSk6+m9ZZBukLRPyYb3BNKhjqiUDh6+hEeSb
         LM0HE3zC4fOSUovDQEDBGYm2gtLUFQb496PskvZQ4pFit0anzzROgN68VpVSyJM2/j4e
         pG+hyI3mBWtMBYMsyQ2g+5d3ffEpf8IgBaup2xeodqUevbquTJyBDenvmLyL3YTa6Bp5
         56+bRqYvE3gzpZMxcEWkGJbVyRxTt1V7mONCqYc0lWnR8lSBMc+phVHQU1f6N1Ddwebz
         /yJewLl+6Wg1rWcnMj3OCYiBgNejl3vDugMOlQFeTL/WkfytbqqYjQ+X2bSsRoBoLDCa
         1MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720427237; x=1721032037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqWQVdHO+aL9sRjJ+leEKZothBpneGJaFH9mgptqiH0=;
        b=Y15RQkesqWL1cq27Gd+BhbN0h3+q9XZnXh3GJODNFVekMiD6HMqfp2bWex5xA4i0nA
         sCZXXAEvArfSb8LRmISjnG4FWRZDDi/BDhZ5/PFcUlSO/QMfj3KCZKK7bsEoMw4POGYI
         zTrjxr9wZwzTkJIFon+LN1Oo4d3IPTen3pW5DzM+Y6hMb4laCmZIJE+PtGFN9jTpuqC8
         OjKnLTYSTGfuPgcZhEi+DvbOW+sBpnC/KFLi3NYmKROTLalRJ3XyNMirz2oHLKdZngKq
         MJ9oy47U97V55pw0uRpMPwp2ovOl65PjnC5sTfhiIUrAoU1oT3NxJ9Ak5w46zdMcGLV/
         Bb8g==
X-Forwarded-Encrypted: i=1; AJvYcCUajdijIzV+C1fw2t6PXunXUTtbcu5TQK5U409HDbKrjarCd55TMWe7eMMp1XA6AApYa2FDIuKRh+WfF5bm3IypioN+xR4jYgdCqw==
X-Gm-Message-State: AOJu0YyKItcwUQnNxBe7J0UW5OmzQL04+0wbI/Q/nTUi/XZN2DtQcGC+
	uwvDak7kTN1Ln19tvlQouNOfCp0n/9pgO35P9JUsxDnEfysVEznbqo+PG3P1E9g=
X-Google-Smtp-Source: AGHT+IG4+eVdg/D79Rysc4TB5JnYLu83zPddq1Tpw9ngA/CWvX25ChhLETeqBmpxJYJmNNRoFI48LA==
X-Received: by 2002:a05:6000:d4a:b0:367:955b:b8b2 with SMTP id ffacd0b85a97d-3679dd277femr9085557f8f.18.1720427237377;
        Mon, 08 Jul 2024 01:27:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678ec6ff64sm14370341f8f.3.2024.07.08.01.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 01:27:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH v2] README: list the development packages required to build the library
Date: Mon,  8 Jul 2024 10:27:15 +0200
Message-ID: <172042723224.19049.17572818519052303074.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240705073314.5728-1-brgl@bgdev.pl>
References: <20240705073314.5728-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 05 Jul 2024 09:33:14 +0200, Bartosz Golaszewski wrote:
> The error messages emitted by configure when either libtool, pkg-config
> or autoconf-archive packages are missing on the host are not very clear
> and seem to cause confusion among users building the project from
> sources. List the required packages in the README.
> 
> 

Applied, thanks!

[1/1] README: list the development packages required to build the library
      commit: 099697530033ceec583b67abfda1df152430fae3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

