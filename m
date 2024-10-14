Return-Path: <linux-gpio+bounces-11284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D4099C368
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4249A1F20CD6
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929D2158875;
	Mon, 14 Oct 2024 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0gZOtEED"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A4A158533
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 08:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894718; cv=none; b=DaS1zckdlKMe+iwUHHv7Uc1o8Zi6ALIjD8SnjBqkCAvru4dQav/g4qhJCJuhTkPkM93mpA8xeM+ykPcOIOw6fs4dJIByZBuMVnSGIiwR3k298shdtLtoOX1k2uIqY04lVlzmf/83Jn7jTGnnFZBBtn9O+Ceu51pP7vGbkORUQo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894718; c=relaxed/simple;
	bh=ERtyTosM76vUpxtmF4Cy1QAhArlJoqd656AhoSYKEzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ni+rc8DUaKJYXxTToUvhjbKYEP1YOBXtG5wPLhQwy7Mguz9xSBh1J7wYOSVCoSFkocodlwlidCVO3E8Yfy918Fpf9FUAt9CWfH2jZki+RJxViRKIYbGf1lx9cVfxeVDqPMPC3zZ7dfB1aIcPg0EnuECVucM+UsJBNGes5yOMIq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0gZOtEED; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4311c575172so28746005e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728894715; x=1729499515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2r6ByVWzke2vujVQcymK2DMK6uDZmMPvMtc2XOTnxDw=;
        b=0gZOtEED6HsDq8akqOvGp/rDB2gabwUUKjgwsZ1EKIOL+vHF7Ye/m3WPL+bDxuErsM
         Ys5IXgxzcK5RRNKLx9rmvf3eu5cKaNil+1W8kfIRdAGIse/GjezWKu5LwLbpEJpNRs2N
         p0MziFQKG3zk0N8avzm9u4smxiKxTEan2/m1zeBd0HHRnvEQgqxoMOYxMFO1tezWDJSw
         4Ck1xJi9FbMBiGYpLclZCEdbYU9ryGdPdjgXg27sb7dGCx0S8pEWvwsTiNxX3fHFvVPt
         F96Sh888z84i9lU96uC3mBLtB6PQ3ZCO3VR5dIaH3hn8bpnJfQ7rq6ccPg4TGN4Cr0mY
         65mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894715; x=1729499515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2r6ByVWzke2vujVQcymK2DMK6uDZmMPvMtc2XOTnxDw=;
        b=RxnXUnaXw8j2k/oq+bregWv0Tq5s49A6Ai9o514J+RsR9BTSXXKGUKrQrow+KM3/NI
         mlBBfUCjlBb5q+45U2pI40FlhM/UBXvSWA6u0ZqjG1rLTI6qAjBbhcUTB46yEdU5OjNv
         +ftboCvg1lEMXjgFzk4QU5WBh96/R7o/vVUVRx7Hk+C74YxHYGVuwNz9qV5fb0dmvsma
         WAl0CZDSOXo3dvmN0si1Gd/obf2MZChAnQhJVXszWBuTUUq4+flAFllrK7tWH5EVZ842
         acGSjROLCJhXpIQMVTJdFkgXPFJchQYfSQsBWrYNqbTm794ozI/LdDw7ZpBhDMfnrBLp
         auxg==
X-Forwarded-Encrypted: i=1; AJvYcCUFQbE7/9od/nDH/8Xd1z/shaJs1ScJVLoaHXbFcakTL/N8SV9KDGkyHTOXXDiP8+beH513YbeEisyx@vger.kernel.org
X-Gm-Message-State: AOJu0YxHQLnmEIzsVIsd1enm7ua4k0FAxlW3UFrkW1Oij0+2q32SM0Ze
	qigsyQ/+sv8M6eWS9EH88pD10867zbwaNAL3ngaHfJ03JxGTdBQbPKCm1s4eAO8=
X-Google-Smtp-Source: AGHT+IGIOdFxLJHhDKqHPfpJzhzMoyFRXNhpGgdVWJc0mwOlZYlsCxtQM3/3LF+Q+9Wuxo6GXajhpg==
X-Received: by 2002:adf:f3d2:0:b0:37d:37b8:3778 with SMTP id ffacd0b85a97d-37d5529e7dcmr7002601f8f.45.1728894715399;
        Mon, 14 Oct 2024 01:31:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ed69dsm10737698f8f.92.2024.10.14.01.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:31:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ts4900: use generic device properties
Date: Mon, 14 Oct 2024 10:31:35 +0200
Message-ID: <172889468795.57095.2124355920743532392.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007104052.39374-1-brgl@bgdev.pl>
References: <20241007104052.39374-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Oct 2024 12:40:52 +0200, Bartosz Golaszewski wrote:
> There's no reason to use OF-specific variants of property getters.
> Switch to using the preferred, generic device property helpers.
> 
> 

Applied, thanks!

[1/1] gpio: ts4900: use generic device properties
      commit: 16de489e3a3009e027a86858bfd645126d391502

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

