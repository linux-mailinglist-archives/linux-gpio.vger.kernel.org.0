Return-Path: <linux-gpio+bounces-5712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E234B8ACC73
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 14:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FE53285ADB
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 12:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE9B1474CD;
	Mon, 22 Apr 2024 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AdNDRKaU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C308B1465AB
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713787582; cv=none; b=LKgrjz5qJ2S5ytXQ3qrRV8F1vtvBOc2cxnArCFiGJfoSAbsNoRee7GWE2bHsEo6JKae3pPB9Bz60xFIT4TeiMsQFTFBvkNyEyKFj9girmSFLQLNJ3O45TBnhbFVwpE1FAQIfvvQowzG9Dqz0B54H7D5CWZBk8+7IFjH8jlxYDbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713787582; c=relaxed/simple;
	bh=nt8SuAjDu9lSUiM7xJCv8gjVKj/J6jCWA9Ey9lPAVmI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RymXR4ZOUaN7DKOkX8OVB0dgMmFSUZmyULfJhLmgLUIjiSMEV+vVACOzOv+pZ6+FTXed9M3JAB8ATW3XJ9HCYn7fVr8VHiPNJRO/0EerzxfAzNI5xcK90aODYSXaHfja+c4Zcx4CW2A+ZZI/VzYsWEJZ/EbwLJ1Uv7VRroR40f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AdNDRKaU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41a0979b9aeso10372695e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713787577; x=1714392377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dL75+bt+LCH9J8Wki2dK7PCZU942EatcVTtQnIkonfs=;
        b=AdNDRKaUfb96Ok9uu6qkExNx773Uv9CwxN+K+zZHxtvkhUZu0NFJ6Urh9jDuMdbDdk
         vGVN2brxQpWmFb0RAmdezAy77G6Hxb70Aerv/PFsHTxcryAPM+Yz34cno/lv2MPSnb+K
         cIixIevFvq8rG6ve0kWGDlpSqehISq17lIhxpbpx1+2C9ZZKCV76+370OBXxe7uewo+J
         frB+SRBwnPQXj9AmsOv7E/jq3HqvKkoBS5y6c0Ny/lOdkyJArC2UdW99iMV2jumIiCt1
         FZ2jESsmzeuuvMHzuj02ZlqqAqTgjosBHxRL91F1MxDeWdOBQjcTa1BnDIv28d2t6gYa
         uAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713787577; x=1714392377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL75+bt+LCH9J8Wki2dK7PCZU942EatcVTtQnIkonfs=;
        b=UNv3b6Ub3KLjLD2gjPfPlIKK8cEMuLaV4SGfbOvUlv2MRFKnx4o5DVP1cB6Zh6sRqH
         inHNz/jZDkNW2k2lSflYs2AEa5mkPqjqt1kpT2Hox/yHLrvk/YYZq2/ZbUt4UVcl4APl
         wHE6SLGld2q2MqErYp/L34J9pkgxXJKM1vDVZU5TmF3pSEKFTuiPpUQeSL5exVXszsZA
         xUDVWN5GQwsC3uG5AhgrSow5Bm6yg8r/RoySSIkyiBEUDrW3VHxt4r38kDs5PRhU0uLH
         Cj6H/kK4iVEEJGb1QIbp8s9GKRpbwp1LPaQ6Lv9nYQd/OqPjL5s4UppL/1xrITmhEI6L
         lluw==
X-Forwarded-Encrypted: i=1; AJvYcCWfrHhG4Ap3TyueLZCqI0cBNcKnCvoopmLQX83czo/xaJgNnOh1asq275YItIs/oI8BdD51SIkCKS6Dp8iz0CRbJYD24aYla6tkPQ==
X-Gm-Message-State: AOJu0YwZgYvkgUPnj97/k2x0Ay7uPQCSyU971qBdgJlYTVOsxeSdB0Px
	ElnpBmfIDoInTguf6LhvM3Qvu3sLWYA4ZmvHT7QoIIpg601nZSRKxIVQsScNbos=
X-Google-Smtp-Source: AGHT+IGLAZpNMIH6q+aW9/SZKc4rqAB9A5Vgq5CbA52AGTiBkBek8cN9OoGfd3YH8puvpKVWIykBzQ==
X-Received: by 2002:a05:600c:54c4:b0:417:d4f6:22eb with SMTP id iw4-20020a05600c54c400b00417d4f622ebmr7842942wmb.24.1713787577166;
        Mon, 22 Apr 2024 05:06:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:6981:a121:4529:6e42])
        by smtp.gmail.com with ESMTPSA id iv19-20020a05600c549300b004186c58a9b5sm16276486wmb.44.2024.04.22.05.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:06:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Grant Likely <grant.likely@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/2] licensing: relicense C++ bindings and add a document on contributing
Date: Mon, 22 Apr 2024 14:06:14 +0200
Message-Id: <171378755033.26060.4989867661663667111.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416212141.6683-1-brgl@bgdev.pl>
References: <20240416212141.6683-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 16 Apr 2024 23:21:39 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> I'm Cc'ing all copyright holders for this project's C++ source code since
> the last license change which are Linaro, BayLibre and Kent Gibson. Please
> kindly leave your Acks.
> 
> Bartosz Golaszewski (2):
>   licensing: relicense C++ bindings under LGPL-2.1-or-later
>   doc: add a file explaining the contribution process in detail
> 
> [...]

Applied, thanks!

[1/2] licensing: relicense C++ bindings under LGPL-2.1-or-later
      commit: 76ecc337c519d65c16e331343c9402f176eead5a
[2/2] doc: add a file explaining the contribution process in detail
      commit: 2bcc49ed325ea19a04aba4cc0aedb742b51f779b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

