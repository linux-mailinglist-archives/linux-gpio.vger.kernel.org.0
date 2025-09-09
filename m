Return-Path: <linux-gpio+bounces-25800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7602B4A82A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0241E446B20
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546282D1303;
	Tue,  9 Sep 2025 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1tiub3o6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D69828BAAC
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409963; cv=none; b=S7KZOpz98oKr1mKbGJOLxhVoVn0bgb2OgXVHQcCmTm9WWjNcoCScewDjzbrsoVbcVTiKuMdwoPHq6EPWQ6uwf+OmUMHdq9GgghGRDzpWfOXmEddUGAP5zEqP2GOSR4VIC7ihGm3X7eTA8wwpJM3MJEefMHOBAZ8Od+iqkWID2lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409963; c=relaxed/simple;
	bh=fu7jCxTeyIFdUqvcfGsLoAATUQSnqpxGVwi0oCNCu7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TXOwkJHUCZT6X/Hnm/I5ccSCDtgXfxsb9dBDDTwZ6QoYc/3cxRY62e0ncCF+YRmN3jskAyL8bJG79JfgiRCmtXH6dvL4Iske7cl0eB1j+wWSj5wefPtYKrJk5RWOVAPTMRKEVwehSru2FWHoEW3uhghI90jJrSD4Kb3WC+oJy0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1tiub3o6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b9853e630so49908085e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409959; x=1758014759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjnIAQ9PEFApJKggVzI/6IudgtVGYPe9svWIothItBU=;
        b=1tiub3o6RFmSVauqdoyHQWvyI5G7FZc88XoJVnW2rYgWrZ/PUVIPDphT7QQrf6LV1r
         9Gahy2DeZvbPNxfXS+kIEuCVh5GygnbMq78i53Xe0HRq66j/yn4Xoaue4Z21wcF8Gzj0
         gVZyrEFd9iSiKsUx/bktV/eWsCUSht+7C104Rpmr1A0ZHOcaGxRb8Wxb7i12RHzZzRnZ
         RQDj2LT838fkoQal37Kcep6btGwRmx8zQ1QGH5nxymEdbNwRCzIGCsp8ojUug7wGWPOQ
         YCpeTzOR18PBi8jWoXYVoHjgPVkvkRDkrgghntY5RYmioNEk9xjAexOCO2Rxkw+2xC5g
         xW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409959; x=1758014759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjnIAQ9PEFApJKggVzI/6IudgtVGYPe9svWIothItBU=;
        b=tRIXSasZ2b2ORyiX40hM8kWFqD9DY+HVWBqmo7WCS6CkIp3nLOqO6CGfGStC2jwk+O
         QfID0EkwJQuLmnZknUmGRsh4MPZYndw1OPr5TOTQpRQaVltWeHfG5qLVh2cQsdtjTtw0
         O8LUe0UcnSf1e5OHKfymJZxNYtYUX9DcclUX+nApE3W7PZSBUGFs5CMedQnxyd+21wLu
         l4I7rOaf+laCbeyRQ125qzS65hFxekCnstcrJW8uE6gX/jHFSx66i0dB778Qzbj0k/H1
         1iGMTSVGuj9UH0Mll9CQ+H7raM6lNWGurInXr+Pni5ZprgfwRf6+H2W+h/4g+nLJunW6
         0UHw==
X-Gm-Message-State: AOJu0Ywp9hIxKKIKDkIstn1smhmiPO37H/+WZLLzpOY8fHRdHDcDErwm
	pSuHw/Kvr79858i5IgJ11DjWeOi5YB5JKVxHBta+6MGNxlXXLS0F0OC9UZZghOaWH3BDL/5GY/f
	I0KW+
X-Gm-Gg: ASbGncslqQlW7bleQRnRWcRHVSSp4pxZeLrmOTnB321mL/qwagyCcf4M89EwlOynpmp
	1FBuHJv56gNWmxTodGC2lPTK25Z01f7sP8cRb+b0oVsL4SI03jI3XsVLlVk3JrFDgOfFu8quQUE
	I+2mSZai81IK58wG+lfCPHumpPigkIuqhutOJnXR287IddQ88qbXViSXpfvxrahLniWuY7ZSgc4
	SoLuUf2m1z161/lypxJt9soRK34reHeC8s2y6KjIS7JiKy1TrKoGfkdWWxrg1xhleqL/CyfJrn+
	zvpCfYGSoYQV+YMcueFzMCmL+AblIE/1SN6hNiV8vhVUFCddQZIIkHAfawhA4EPUQafyI+La2/w
	LSHlguWpL/QK9KkNA+ctmm1s4
X-Google-Smtp-Source: AGHT+IFOqFMrJsKAZvxCfsPdFg21I/pud8keQCIJd8rTWQWuXmO8x2IHK7KoM3gTzWq74YsPc7UdKQ==
X-Received: by 2002:a05:600c:1991:b0:45d:d6fc:24ec with SMTP id 5b1f17b1804b1-45ddde8a579mr90089785e9.1.1757409959100;
        Tue, 09 Sep 2025 02:25:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238760sm1832440f8f.34.2025.09.09.02.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:25:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: Re: [libgpiod][PATCH] bindings: python: disable UP045 linter check
Date: Tue,  9 Sep 2025 11:25:54 +0200
Message-ID: <175740994884.68889.7170949727801674056.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250907142919.1382670-1-vfazio@gmail.com>
References: <20250907142919.1382670-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 07 Sep 2025 09:29:19 -0500, Vincent Fazio wrote:
> Linter check UP045 [0] was recently stabilized in ruff 0.12 [1].
> 
> UP045 suggests using the `X | Y` syntax for files that perform:
> 
>   from __future__ import annotations
> 
> This import drives the Python interpreter to store type annotations as
> strings and defers their evaluation [2] making the new syntax "safe".
> 
> [...]

Applied, thanks!

[1/1] bindings: python: disable UP045 linter check
      https://git.kernel.org/brgl/libgpiod/c/4db87075549ebe3fa6d4d381186e30097f327fc7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

