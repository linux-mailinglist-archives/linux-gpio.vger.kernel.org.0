Return-Path: <linux-gpio+bounces-29175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F161FC9126E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 09:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C698D3AD17A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 08:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FE72E06ED;
	Fri, 28 Nov 2025 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oyawolWl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25B2D12EA
	for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318652; cv=none; b=q4w5KVSVoC+80nbWWYkFB2WWu7uBuZZe7BMS7qWmyEX6v90VT73woZWd5C0Ad7/k0vfrAtMB9zJT/4NzpiUf4KvIRACtQAnJMT+WB8N7Cq7Bn31nR1quIhnrZa1FDDcHSDzY8Kdl8WlAfVa2Fb6qozWthIQ2tH8VFpTtsQIVBPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318652; c=relaxed/simple;
	bh=ov0e3kRXB9Cqfx1sd+cQhouwSDIKo+eLTDF97X9IiCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTwYPe0S/VKB9LzPtgYkfcyPPizsNxfiCp6UZyuixm05YkDWbohjVjLoMllznEQs30MYBr/2vxENBVxAEw4GIieHE8WNcWr+x6q+XuHAPqeM8hgD7ZxLdoY3BqD0B8PgZD18Wm/DrqAby4BRM1DRtNAnNyrHus4QqU4Dyd22+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oyawolWl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso14956825e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 00:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764318649; x=1764923449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e05rYsRMs3KsKAjHZRO1hNVR99G16pMzmkBBOPU6ymw=;
        b=oyawolWl+yGXCfWUMepxs1QvT1QrrOqRAl2cCMMHlUF7DLdNbYbINYg2ORK58cjIBJ
         hupaBc9YXHLJk80Gyw/T2X5G1w1KPrTP7LQnBs7L6ktBdjoQp172c/A95z5QCaxqBsMQ
         Bv7V8xH9S10GnHVxpmbofdCNstvDOHjLsSASeFom8DB3iPj8I1LkOGligsKkedlgjyya
         4Rn1ieqCg2UsQ2J2buIlBACakN7DOjVsvdiYfEjbGGIaTHavPuzhMvECO1Akft+SNl8+
         9BRxmehJ9XJAdge/dd9Spp0gOdNW17Cq9HqgdBtvswIo5eSgin1hIz5qRun1BXcwr0W8
         avug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318649; x=1764923449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e05rYsRMs3KsKAjHZRO1hNVR99G16pMzmkBBOPU6ymw=;
        b=TjjKDI3SOZDYJ2vn6R06Dm4SflkoO9aGmi1PVfNUyxWhFHH5jok+fqn02B6I7IQO3E
         TZev4eM7ifxObntZO2EhDc7eq38azkj/sXP+QdlsNJUepm6pxv2zNqMMEPQlL7sDr/dW
         P4XD9h35UA9tl31S8Ik23XG078mVRZbE+grCWYbNmvffSmR2R5+il3thwTnjt7n/4hqv
         yNDLZSZb7nQBEKVQyesWrUl1B3pEYC5YUPGoB9X305v+VuyckFXkpdl3wpZagldq1L7M
         +rOKFK7gmU8uGuYiald+HNyBnz1poUN1YzExYJcMW0IgcBZ6oLIFx/u3K850LCc8nWl0
         m6nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxe6Cv02RJ+JClELbNlhRZcG4g8EVfinoKWUls6PHubs4FMLgAUQic2KXBZ0UwymMQURLDm9S//gOP@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqZwlRHsggy2YmeO3P+T9O8e4Gs4qkm9YPzrXsFXHohKYpHev
	qcwNrCXjSpiCYz+4HCcwqgd5WTkW9BKJjoYFMYo2tml/ITWcNg7bsMUamceEx4W7boCOQq6S4Pi
	aa4tI
X-Gm-Gg: ASbGnct/1irH9P7xDnbYk8GcMLhRmdUZ9Cd+L3uxqKUmbklc+NkbC+SfTYRD2/G3T9P
	ZcNHjM5+kg1WLE0UOTNmHCqUXTB/ZT6C0w1XD+ufFvK/Wihxd1P2iNQJobHVS7ahfLVgPVYX4jI
	9bkUjiqxMKGmsNKtxdjjsZ5InrweGbA2s2E2yLV/RO9BWQubzQwRI0QcYUVT45+xKb7Bl7fq4NN
	y/fbXw6hzMPaEfOXwqHYVIi6Pz8G6bVAvPQerRO7ijKjQEFs0TSL2F9W8HwY9wWAYJ+TIGDO9xp
	vljnb7+3DZI1TlpXRwG6ics18Aer0ZOGqYntPBKCAlADXxd8buwU7t4nCENw+RP4qKcwC16mq0h
	SfMhKyDMOtue4Pye9BrS8Xj2TVs6b4Yzonu05/UVl6eA4nqNuxtfOtODPodeYR3jo2vjhF9lC3w
	3b9YtIIQ==
X-Google-Smtp-Source: AGHT+IGDA9r6C8adsFO+UcoVSveM5AyELafNsRoVuaqVwgZJNV1yRJ0+xslZS/hTOgNXm7JC/VapcQ==
X-Received: by 2002:a05:600c:4e88:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-477c01d4af2mr268464285e9.18.1764318648885;
        Fri, 28 Nov 2025 00:30:48 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm149216315e9.1.2025.11.28.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:30:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: shared-proxy: set suppress_bind_attrs
Date: Fri, 28 Nov 2025 09:30:43 +0100
Message-ID: <176431863833.9553.892131079836881863.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126191730.66277-1-brgl@bgdev.pl>
References: <20251126191730.66277-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 26 Nov 2025 20:17:30 +0100, Bartosz Golaszewski wrote:
> User-space must not fiddle with shared-proxy auxiliary devices. Disable
> bind/unbind attributes in sysfs.
> 
> 

Applied, thanks!

[1/1] gpio: shared-proxy: set suppress_bind_attrs
      https://git.kernel.org/brgl/linux/c/64309e40e357bead3a872db89512df6c071addc5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

