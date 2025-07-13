Return-Path: <linux-gpio+bounces-23194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E7DB0303E
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jul 2025 10:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E3823AF5E9
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jul 2025 08:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1842E259CBC;
	Sun, 13 Jul 2025 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c9LOeKuy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63786255F56
	for <linux-gpio@vger.kernel.org>; Sun, 13 Jul 2025 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752396249; cv=none; b=g0XjwtzCBf52KFNHBAtKpwz/TMcYv/B7G74+CJiJLYfKOoxFmbHw4HBGB6KZGY7CPAFfIIDxKNYk5pMXUKNrkrRn/+gHmERXTpkyDf5yATYRAblLawe10P0xQoFdDsV2Oo7z/APkgLOdY4OEA0P+BI8MtYXlU1kdFXPnFW7/w28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752396249; c=relaxed/simple;
	bh=VjJoXm/OtEzd6WSH8LX9mgg5zlg7VGtKg6xCGq03KOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hKvjxsf6ruGG6hAvW/VVhW8F9rvb20Q08tlczhiDmI1bUArLaJU9mzOCY21m/qxN0c7DwvSihq0+mIV/FvGQHQ8GHVYBwMnqVPamt+MHC3d5zOtz81d3ULW+0R7+8jHHfDGs0pxIMP2Up2OMu0s3p5Y/7n7r54X+xxhHga7IUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c9LOeKuy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a522224582so1684926f8f.3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Jul 2025 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396247; x=1753001047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yoBxPNWdp6682YcqAmqYQy7nMoXgZ5Ir0h8JOXzX/E=;
        b=c9LOeKuyPbPVWiD9M6nvg3aqksWP16qfV/cf778nOcIsLW98/Hp1zlLDTcBZrdRhBM
         NNQEVnTKTvO27YqP7f+qSOYZByQ+R9FzTY5KAcLVGzBb2eL7gJM6zUWBmR9Dn0upLIrO
         q+pyYiv0bTYdudOst4QG0iM3HX6M6RzkQE7rW9JQ1FxYZKo8nKLBUJQcCecQTLaRoM0e
         XRl3brF+yFg4gPECZoFssVJx3XUhdSBrBcpIVSKP2xsaOQQXhbGtZvgnr/cWgZGof7zz
         fPyPdJoOpFm68ipFaXTyCsDopYaDtNToKaa8SqdRDyvWw65FlEixDJYhIlM9WeTPiTuO
         3auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396247; x=1753001047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3yoBxPNWdp6682YcqAmqYQy7nMoXgZ5Ir0h8JOXzX/E=;
        b=PnniADYVtRj4qTwidWi1Z7kfchXNDggqMQ82uCrFSRDscKY1pwbbIIyx4+CVB/cX9E
         W1YiFunNFTqup5w2EAWXIAfgnflqe8Oi7L7w1xgMdUDVJrahMwV0YfO5ktktwPRNKUe6
         fnEq7h02hHB9jzYYTpYen4YzEMz4nYqbGlfwaAFrXtaCZHKcPd/Xjh13qxyggYr8gASK
         3YYxwbfjXbj0zw9UL7t+hGCxBIrfukjljycgzr+Jn4sBeannZtMNylQZluM60RHbm1ss
         9IXHiI3KqiYxIFiCoRncrFxt8UOf4dKHb/8cGKwqfZ78fpks9V+AmoW1oTTvPdawA2zX
         UbIg==
X-Forwarded-Encrypted: i=1; AJvYcCW49M+MQim1cllbome8mYB2KnLg0U2BV8DsoXB0+q7L0coLTryUTVmFsaNC3RK7QpFQeMoVOxg/GSfB@vger.kernel.org
X-Gm-Message-State: AOJu0YwnUTLchUYU9U2wcFoCospinU1LwddgNMnmD+a6572L0XbCxcvu
	tVcgBtH2QyYKCj1NW5woCEh+GYNHg/ZLJgNaRSwJmTIrKoxKmpk296KzkgFmfke0Uuc=
X-Gm-Gg: ASbGncvuwJayAZ5TTQw5k2mJEj75AJTkd/0i7hNB9ZKsaMGNjtsIiTkEGgtZdC11aqn
	rDe23z4MFu3I2oqca122VJTwxjcktn9RJzx4pFgkM2QZx6SS8m4XfyKWz3OiSICWVeLBVckgqfn
	chlJ9iPZuxHUUZaveWRkDE152YBa3Xk2XhRMiUWS9X/sqr/wxY9kmwER4pefkWP0psW3HCYsx2m
	y1H6fHq7iA0AIxiywxeV4lIYNzizxJK+Cu4vperlg6eoiutcqjoA9gYtk04UJfbR+HcaWP5LusK
	X1XcusbVaBGVrSdj8zGmgyi9wdLP+GOuw3pd56D3+acZPabdi5yg9308Z3GiZ4jJaUZSA12QvWh
	QSo8KpPspRbcfk4sxsBDOypc=
X-Google-Smtp-Source: AGHT+IGyIlgk1OerLolTNkIA3PzN0cspSFYNQycDdCytpPtQS8uH98PKP9muX0TGzImEZz6zJlr4Uw==
X-Received: by 2002:a05:6000:230f:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3b5f351dea6mr6874812f8f.10.1752396246529;
        Sun, 13 Jul 2025 01:44:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f695:8645:1433:4418])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26daasm9445615f8f.91.2025.07.13.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:44:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: don't use GPIO global numbers in debugfs output
Date: Sun, 13 Jul 2025 10:44:04 +0200
Message-ID: <175239624288.6032.7125676131677562075.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250707141313.73169-1-brgl@bgdev.pl>
References: <20250707141313.73169-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Jul 2025 16:13:13 +0200, Bartosz Golaszewski wrote:
> One of the users of global GPIO numbers in the kernel are the debugfs
> callbacks in GPIO drivers. Before converting any custom .dbg_show()
> callbacks in individual modules, let's first make GPIO core stop using
> GPIO base in debugfs output. Use hardware offsets instead.
> 
> 

Applied, thanks!

[1/1] gpiolib: don't use GPIO global numbers in debugfs output
      https://git.kernel.org/brgl/linux/c/1bec20dfa3d81be716e7ff5a6343bdec1d29b828

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

