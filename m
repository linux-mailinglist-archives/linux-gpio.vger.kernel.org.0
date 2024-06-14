Return-Path: <linux-gpio+bounces-7441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9D3908496
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 09:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8286C288006
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 07:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A985148849;
	Fri, 14 Jun 2024 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Qndml4xj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EA71487C3
	for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349693; cv=none; b=ne50tootfCjnkaEvAptrMvpU2Lza7uC5dykou3cSdjQqtIiKebAQvz/BNOJXxGUBGCj+uW7c3zsVvDdbyCYLetXKObFHt3ynXxNqt1KFNn/FuSnJbI+GW0GPUVpx8ZD8I6ztIGFiMREJXzeXyMUGXMsOjQdRB5b/0mKPbPIHF5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349693; c=relaxed/simple;
	bh=D2UFP17RmOfStu8LuouQ6JCCNWXup9GL2cfq/wcLMx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fQRHWPi1QC5dF/kHwHpgfixzqs+/5cQ/brwWQhxZjr+xyUlW2MjUku/r9U3QILshpodustD5E7UA8V1xmhbyYgX5AOkhehYHsQOwF8vU72cRbk3689K2uyS1niVTeAG/8NC1tsdGhFkc2qbVV4Vwhpi3vxIHiJvQJswUEmrprWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Qndml4xj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35dc1d8867eso1611666f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 00:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718349690; x=1718954490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWbqemygnhzLKTucsh90Xqc7790YDaQN7hNtKp1oXmE=;
        b=Qndml4xjnX89tEjLwtprUaqwNi2rCviVRHR6BhOwSBS+boxKsvQOYuevZiAtLTSePp
         kkVBv4M4Lw39M15wuLmUZYFa810PY1nzryT8IM9n0httm+LIxndGyndT6VVA2ymBr+SP
         rLNidXO8bzD0A6mFvwFAhtlVEG9jcMzImiJFOF2reRDN+RiaQlNA+7tNs229CzpUJtQK
         IBPR/bR6vvsBLAjGxwton9igLYJTLBMNBqO+9ywVsXzSI2uGFY514UJZ7V4uqCqs7pov
         S+9zuTPZAqJ1frFY2O9vDqJpegoYRk8KtoSRIi6uWHSdq8eN6gx2xd8ySrZGqoQbyUJ6
         rCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349690; x=1718954490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWbqemygnhzLKTucsh90Xqc7790YDaQN7hNtKp1oXmE=;
        b=meNDiOVbGcC/78QbsI9TWcWPrmvTl4tfBw7CH3vLUSIGxuy3Dm0xS/2kHkBmdBO+st
         A12dRMFBwoW5Ei+Vd1U3QYEutO9elj7PjcHi99vCCw6gz1gUFq5o71LhyAYqpsMFVxWb
         bQ/aXDb+EPuM2HI8DnwG2vI8J4q/19RbkRe03UTEYZ9j/0XVS49vlBo02DxzRh28+WWb
         gbJPMtcM/dXU9ywpQT+3Pnjqu/88zL8iVub2LX07zCDXFrMZjHJHlKMu14DSW4aIvKdv
         X5u9rraVCTNhxFxN0bWhoY24rC387T6HkxWsiraf4sP/gPUcG88iUJmwyGyO0t72KVX+
         bqPg==
X-Forwarded-Encrypted: i=1; AJvYcCV5JD3RPlZ2f7rQK4yL76OY+594FD5fKavOLXaxJSpPSf9QMwMTO9FFgEW3VxHzSZcz0WGGjH4Cy41Dp1UihvyqnziRYdoN01+2qQ==
X-Gm-Message-State: AOJu0YymzpDCyYQac/2FELHNx4dOg4Ubp5b8GXOxhqeheZP0qeo0gFec
	4zMXjgcDV79bIJNmidwOmKDrN/iYIeRqsorEdPpRx53c638Yb3LYp6Hd3VaJklw=
X-Google-Smtp-Source: AGHT+IGmxkK/SxRVfHzxcAJODv5pEav6xkbuSwj8RS/K6exrGlCZc3yX4Yn6sN9Q1RWLzmOTAXkJiw==
X-Received: by 2002:a5d:64c1:0:b0:360:8589:37be with SMTP id ffacd0b85a97d-36085893852mr311939f8f.2.1718349689894;
        Fri, 14 Jun 2024 00:21:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:6155:d3bf:61c:c4b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075093a1esm3508033f8f.24.2024.06.14.00.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:21:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@gmail.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] README: add mentions on shellcheck and reuse
Date: Fri, 14 Jun 2024 09:21:28 +0200
Message-ID: <171834968121.6715.11894348970012664142.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613140117.39048-1-brgl@bgdev.pl>
References: <20240613140117.39048-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 13 Jun 2024 16:01:17 +0200, Bartosz Golaszewski wrote:
> Extend the "Contributing" section of the README to include mentions of
> shell scripts having to pass the `shellcheck` test and the entire tree
> having to conform to `reuse lint` requirements.
> 
> 

Applied, thanks!

[1/1] README: add mentions on shellcheck and reuse
      commit: d7f2bb23b532dfcac7f2178abe148f5aed91248b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

