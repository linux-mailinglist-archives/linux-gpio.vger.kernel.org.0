Return-Path: <linux-gpio+bounces-10660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C41C898C5B8
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 20:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C236283756
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 18:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B32A1CCB49;
	Tue,  1 Oct 2024 18:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C5U9crWm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C71BBBDD
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 18:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727808866; cv=none; b=Dh9qJsDvUWM0rLbYeJrDeO47Oum4jUJrxfYMBX61vCyAUe8LzsdfjWauym85zwn4H+dIMJvXGvtcYb6Zimh3STqlAVPERD3yf+DPIhTUg92LVxObnR+YC5x5R5qk3CBfszvpmXcmzcCIv/q+/im+nmD9kLdDy9pwSHxh25D/uHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727808866; c=relaxed/simple;
	bh=V8rsnEJ/bDDCLpKjRyXRbNxIBoLlbXQh0oG8P+edN9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rD6IclqYnrNTgr5gppxf8keiOhwwboFEBMsR7s4/S0TWX15pvevG9b4ayP8tybReIEOhfoW5NTTu2renVTibHn0BZ1NO+zTCJaI2ACSMX4UZuZnkxak5zjb8nCUq7PeyblY7WD+Ln2c+tRTHnc8R0Km79q9zwW83RlGYzJIYDx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C5U9crWm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so72068985e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 11:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727808863; x=1728413663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1XUtNuiLeh+ZpeCJ4wfUFMYT2T4esx58m8JhM7fcnE=;
        b=C5U9crWm89KVyTfOB/MZISOAIzwzua0JroxrOylcqod7uJEobx2KWkpzDUh4pMorCk
         emYeZp5TkJrGzZ0O/fxtS5dJ9RHkidUbr4D1ckpN0MF8ty6PITat4qNhCx/F39s1HlhO
         q340FcA21HCwBGargw6bnCzydiKwFr0TmS227d0xP3vcjXY4MglqL2TfSs9A09h96OWq
         zdEI3T1p3RWdzrrUSdcje2kCyQUlqFHLt829a8rj6X9fMx3+MOrVL5O3Z8q48wg/Tovo
         7OYZd3ocfOLY2xyygeTFXskouejSXuEEtSd3dbr+PawcKnUdF/yAnxUL4bDz4TXy97aw
         lnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727808863; x=1728413663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1XUtNuiLeh+ZpeCJ4wfUFMYT2T4esx58m8JhM7fcnE=;
        b=fH0KMjXiecbO0uruysqyaLyLlf4E/e+b2pneJaE8YCSTCFuKW3GXfGE4e7EEGEk1WK
         RMDAI9ssPj8+xvtdG/6ojuL+LkPsiuNt50B+63HVfF3eE+EFv1Hi2EOnITxKJ/JO7mVY
         7tvUyPmx99yF9UVlpclwtaGIey0c3uUjpoQpbXRniIBrHsB2cSgLbi2I/tBMBsyF9EOF
         K5TsimkBSym9xOp4FCT/g5d/0CUToG2Hv5Xo2CVGcNuzUSWRBg1vluVCo3vL4bdNx/F6
         sVNk/Dn4jMk2sNz+SiPNKGfcoG5ZyuVI0VOfndaKZAsztdtOx8BIqtvmeFRtM3EkgVpl
         OcQA==
X-Forwarded-Encrypted: i=1; AJvYcCUKboZdgcnGp4CEXI5cz/yOYtkCRD3iv+Wonma5OxksrljxWsx04vZFEt8XEZHrO5PNZMu6GBp75vt3@vger.kernel.org
X-Gm-Message-State: AOJu0YxbE6ksWmI69M7S6CYvi2BHqx9LkuDmi5XFndB50tAuRmzDq4uz
	dUrBdcoyi8/AEpIrz28I1kM4dzCgRXcc+DByEWcLKXXfEi+syxUIt1V3zZCPE/s=
X-Google-Smtp-Source: AGHT+IEhtJhtBwKR2sMbD1VilyL4791eO55gFkuoz0uz1E4J/iEweET1yk4/BmqbRTgoHKbhwpTl/g==
X-Received: by 2002:a05:600c:3581:b0:42c:b508:750e with SMTP id 5b1f17b1804b1-42f777ba30cmr4053475e9.11.1727808862907;
        Tue, 01 Oct 2024 11:54:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b926:7e5e:6e5b:896])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddfc9sm188052035e9.5.2024.10.01.11.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 11:54:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] gpio: switch to device_for_each_chilld_node_scoped()
Date: Tue,  1 Oct 2024 20:54:20 +0200
Message-ID: <172780884672.98871.5009069255744218803.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240928-gpio_device_for_each_child_node_scoped-v1-0-c20eff315f4f@gmail.com>
References: <20240928-gpio_device_for_each_child_node_scoped-v1-0-c20eff315f4f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 28 Sep 2024 21:47:34 +0200, Javier Carrasco wrote:
> This series switches from the device_for_each_child_node() macro to its
> scoped variant. This makes the code more robust if new early exits are
> added to the loops, because there is no need for explicit calls to
> fwnode_handle_put(), which also simplifies existing code.
> 
> The non-scoped macros to walk over nodes turn error-prone as soon as
> the loop contains early exits (break, goto, return), and patches to
> fix them show up regularly, sometimes due to new error paths in an
> existing loop [1].
> 
> [...]

Applied, thanks!

[1/3] gpio: dwapb: switch to device_for_each_child_node_scoped()
      commit: 0a53be8e080b53ef922e90204999f4ccef29cd57
[2/3] gpio: sim: switch to device_for_each_child_node_scoped()
      commit: d64d0287f4bc7013c60b07e34e43c3fc558e3808

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

