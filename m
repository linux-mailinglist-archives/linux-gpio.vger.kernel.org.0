Return-Path: <linux-gpio+bounces-26999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C4DBD1E1C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 09:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30E6A3B02A6
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 07:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C5C2EA47F;
	Mon, 13 Oct 2025 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="caGQ0fmr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9FD28D850
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760342137; cv=none; b=tRcMHcZkylpytohFVUgosDrpmVxMdv9300/JYF9mnu/kO6qHft8aD1unm/ILlaBLA1QwW4DdjnC3d7ZIIgomCOMLFM8uMXW8Jpl2MApG+M+o28s5H+bNBlRh08PIOTwxl8ZnDhyuvbd3SN1mMrwSz9P+ZWFLCuix4v7SHHC/Wsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760342137; c=relaxed/simple;
	bh=lvuVAlTO/cyS9yqEgn5t3/Um8ASSEd57my6/NYq5Dhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bwOhnL0/6TfetwsCjYxNLr/AukAzRimCiP9Vb+kAQq83VjYJ2v4x4FcJxMpWZH27WLTb+GKCrGoyXcN+TcU+LLi1GMBZv2C3bEuUEODFILebw+PlcZyrW0kD0nUh3Rm0q1ff9ecRWKktAtG9rt8jiQ/u1NIM3s7D0JdxsRdsXnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=caGQ0fmr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so22436905e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760342133; x=1760946933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3DtxVRwbZrZc9wwJcHWXp5P6yZbcShuO0Ai/ij5MB4=;
        b=caGQ0fmrm55Xmn5o003qTqBNHx/UoX6s2BI/wf8kO9PvYDDg+7DxTnpfXfbuTM0ECb
         9uv4dGqd0rAr7j14Vm8fOHLYdnKh36sVaHLuHhwX8lKcVBKJupabJGZ+AWDz2BEfaQhV
         PMDyAp8dJf49pJJNCAg5lRhE9IplRJ+ylwvMJosMMEGLzVt591fXAM/xP5dnl784ASZo
         HIu2NhTOB7EiAPUf4tdieS9zU7cH4LPqMHIJ1UwDYv+a5MJFIsyI8sNkQW83jhFORh8N
         YdXru8it/ExoMM6Kzw+srI1ghyIV7AtwFGTkWcCjRJttrLMuPq28qQpgw+nEhK/LM1iJ
         5Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760342133; x=1760946933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3DtxVRwbZrZc9wwJcHWXp5P6yZbcShuO0Ai/ij5MB4=;
        b=p0sCj6vn8qipIHmj4XRWlABVMikVMGgMBY/akN4MWnDNXrCaSPMXYl9R7eWTgkk8pn
         sCacu0Pfp9Uh3cwZrfOfSbPIv9l72D/R8suMsKtl7StzLOyzsG80yvChEYbY4/kiA2Qk
         zoq6fPp6/Kl56fOn0Qs3pxntDBSHdpXIPm0VtLKOVlWSRTaeCsLb/gFr4r35TDlIgp0s
         0u9gGjgcERx6whD6RB64sU060VVngwx9R20ZEBNpi/p7dkjdsAUZL5pjBSMsQmC9AtDt
         yRZWO5UmqMdnJpDyBAAEvBDdOdrGneKGp6cAPfw888OhV8DNNM/EFljhjBuKSNid2Be0
         oq1w==
X-Forwarded-Encrypted: i=1; AJvYcCWo9/5ZPkkwj4nyyemQyAQ8oUEFpeKEG0h0H5kn4E1CRv5a9NOMcRXP6Fp1Qu5nqu6yFXtpVtzi4U/u@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3iou8e7TR1E+xdl5bwPuxaytfkykA10HqL989wNanvcHQ0FSK
	AWUNPNzuq/SKBq0oN8CGH21BEDilGV6osd0e88TxOOTUZAuvWu61bKWNUUC/+Pe+3I8=
X-Gm-Gg: ASbGnctQ8njmoRAaNMCR4nMMQVZXlw36C0yjCH6TwuXpNgkRaI1QJQTXn8DsKakVNxF
	i1mBGVQAhBcZpQvhvdzOwfRhFw/7qtMEZ75VHY3/krJ/2JgbbI2++AcQRwuQumqK4GA05OXSfCA
	TaJ8nVBbiNzhXFPLmMj2wYXionayoqlEXZZ5DJe6tdAOGSGCJNMb6cBlBzlAy2ki9bbK0Zk+OTr
	Z3hFYrHD8CNXafvP5RozzaHJaQflqr8VhYBpCfTMfemTVYgWu1nHD+7X5SjYQwRedjDt96Xl/NZ
	Gq9Ewf519f7Wqstn6+qiDdCiMt96Q2HSbOEYHcJqqmQOyYR7t5KoijTpKbxrlDsQ9VcS+1lGz2m
	n1rhjV/ZErMqf2o0jMAXK53VoFhy0J8Q/zxFiHSM/JTsjBLp3h6Rsaw==
X-Google-Smtp-Source: AGHT+IGOtte47bU+3rZlPNkiIBEEfsBCkx/VvL2jwR7uZI10f8MLjx/9MRkOZNaZkEX4uc8wZ2pdTw==
X-Received: by 2002:a05:600c:4751:b0:46e:72df:a812 with SMTP id 5b1f17b1804b1-46fa9a8641fmr152061525e9.4.1760342132746;
        Mon, 13 Oct 2025 00:55:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fc45:d50e:e755:a6e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57cce5sm17231469f8f.1.2025.10.13.00.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 00:55:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: Re: [PATCH] tests: gpiosim: revert minimum kernel version back to v5.17.4
Date: Mon, 13 Oct 2025 09:55:29 +0200
Message-ID: <176034211107.9316.10396065232423084366.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251010094951.18927-1-brgl@bgdev.pl>
References: <20251010094951.18927-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 10 Oct 2025 11:49:51 +0200, Bartosz Golaszewski wrote:
> Commit b4009e2e6715 ("tests: gpiosim: provide
> gpiosim_bank_set_line_valid()") added support for marking simulated GPIO
> lines as valid/invalid using a new attribute of the kernel configfs
> interface of the gpio-sim module. In the process it bumped the minimum
> kernel version required to use it to v6.17 where this feature first
> appeared. The test cases we added later only appear in gpiod-test which
> is the test suite for the core C library. However with the kernel
> version change in libgpiosim other test suites have also seen their
> minimum kernel versions implicitly increase.
> 
> [...]

Applied, thanks!

[1/1] tests: gpiosim: revert minimum kernel version back to v5.17.4
      https://git.kernel.org/brgl/libgpiod/c/7a768dc5b7cd943e22713c2cb9af283a5bd023f6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

