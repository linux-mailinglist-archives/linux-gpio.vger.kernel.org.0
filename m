Return-Path: <linux-gpio+bounces-29174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7E6C9126B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 09:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 345403ACC62
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 08:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736602DF14B;
	Fri, 28 Nov 2025 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CAyJb1jD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24162D8365
	for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318651; cv=none; b=unbbjFLGbCXzP7J8jWAtxmwSDCuJe1zC8odXGExmhC6pZQ1j2oIGkSlF5CR1jyE41CGXAH5RJmTJj+VRsnki5+VL+p8gyvhZmc6xxVGY+mF6kAVcisJ/njJzabIHzARx3Q2NjxPFQyLfI1fM1LGaxeBZ+TtiLa+oZoA7htgVOf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318651; c=relaxed/simple;
	bh=n2nkl1uiMi8WryiOUahKpUm1XuAqtybGtqVTGjKJh2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JPIC9q+lOp1nUJA1G/KiLIP4MLT3ENc8Vv0c2+zYmhus5DotL8Lg1P70zzTdsq5C10W/t1Fz7HgsjH7CEWvwz0zFHsI9RtY+b+cRdLH7K7gzzmWJI7sciEyIV1gUVGMo1BTT6xmqGfc0ePrz5XUVfhViTvjUGIp3O6rZAZO89Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CAyJb1jD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477a1c28778so17345995e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 00:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764318647; x=1764923447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRXMfEy75y/NxZDGA8xlo16Pf4zHuQdg9p+UpXCn/UM=;
        b=CAyJb1jDF8F/erHFdeTMBWEe2CZupZ++sz3rLBWP6qiU8T2mXmcE2laYi7Lh2qRliQ
         38HW1RjZDONMdx1X0TBl0isygznRk+Kdxb6kJpMolKRnk9kKtBl1BCclNVpRVFzsKAPP
         zwkCXEQ3uGnlkWhb4j8UK24nMhWXgwsVNEAjsjlQ3dXYUNWvDk4qQSEoJxjftFwf/ytO
         opj6LI/qYSPgg9ZM5wichv8Go7NReHTGoaQK9+uh4c1hHQka501d/TlLoJJ4maN3HqYD
         uRPVewSQXWV3qucOXEaSXqeLOy8MYUuFfszt5BCGgiNgSxlUvXNQVt8/g2d9C9V6Q2+z
         kSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318647; x=1764923447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lRXMfEy75y/NxZDGA8xlo16Pf4zHuQdg9p+UpXCn/UM=;
        b=Yh4VfRnhNtOGA6X/y3Lk85TtohOJaGFRFHfVQKRuTLuDHNUzo6CHqdWhjQ0oBC4bO+
         Zz5t+L8Uc9JEMccTH85GK77ACojMtNwiaJWJZqlCzILiceEQ8kE0IWFBkdPurSQxsFyw
         KYEl1wqEHLO7VlbAsPieN04Qj9houBRTP63oj30evEjSToA3F1Omcfh6ykgoXr9P7G5w
         j4bjoZlQXUh3RJGsppsBq24cIjfGsjcsdvlZWV98zmA8ew1498ML/A8GpteNB/8fdGX4
         zof4N6vOvbs1NPEADlOt414atJQ97jbijGI0ujyddkjmrMk8beIkDDcDr9BTMWh2emQx
         NnCA==
X-Forwarded-Encrypted: i=1; AJvYcCWC/X8LdA4Hiks5MAfMkMWQbLvCTTv8Hq3ZP9j2ZpdebrBIIfcFVXNCWLvuaAP/RNUObYtRot8IS5Ms@vger.kernel.org
X-Gm-Message-State: AOJu0YypdHWvgVv6J1GWn2YK+kSPZHKbNBQRfxhNcSOlZaYlaDWXVMbS
	YD8MCGCKXfnA4wnzt1WaJ8HAgqvAR8UqydJF9I2zRX4dbxMEigoeR0Kk7EfrkQFa07E=
X-Gm-Gg: ASbGncvDsyiEeOb/g9avpfscSbrTEaMnf71VuP92RyqeNc/WW9avXu0uRQLqXKo66WH
	jjZRS2C10VS5OzjDGdw3tyAn2VKvsU/witKnFFAIkWCsBFSwa3MovpHJGtTq/QzliVgE1tQwItr
	AuxrdiGpLN/GGqwEGlnmsiieG3/VywpwBkGJZR+eAU78iZv3IV/D5r/VnmmqhMqUyU4fHwgAvB3
	W1MRMK8E81J/+RknKSPlj0xq9Q0Qugv5qkph26xDr7KpI9Sc3FTono7tyhi2nFcgS/OOqjs6ppI
	le4jx5XyiNnvHWvAxVz5/QB5dlkO9TMVb39HVicf7Y6fIKaZ4EcNlX7SGKTnn/Dv4UkOioRq0tf
	fk/3H1EYIR66Zt52Md5/jItO0ySxkd1fnWp6d6y3OBtPZQfBZAjpmfXOQg5xpXwdC5YMRjKVR65
	gtVMJL8g==
X-Google-Smtp-Source: AGHT+IEoaQCVNZw5KbNKZLUOeq9BuPWnM5aIJgZWaTb1cgmIfIfXGKoF0aQ35sFU6bDZbLzlWWR69A==
X-Received: by 2002:a05:600c:c8f:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-47904b160e3mr129248755e9.21.1764318647066;
        Fri, 28 Nov 2025 00:30:47 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm149216315e9.1.2025.11.28.00.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:30:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH 0/2] gpio: shared: fix some corner cases
Date: Fri, 28 Nov 2025 09:30:42 +0100
Message-ID: <176431863833.9553.12908193715947360584.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126-gpio-shared-fixes-v1-0-18309c0e87b5@linaro.org>
References: <20251126-gpio-shared-fixes-v1-0-18309c0e87b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 26 Nov 2025 17:49:04 +0100, Bartosz Golaszewski wrote:
> Here are fixes for two more bugs reported in linux-next.
> 
> 

Applied, thanks!

[1/2] gpio: shared: ignore special __symbols__ node when traversing device tree
      https://git.kernel.org/brgl/linux/c/cfab6dc0700c3b9120dab726fc184c3b4500cc5b
[2/2] gpio: shared: ignore GPIO hogs when traversing the device tree
      https://git.kernel.org/brgl/linux/c/114e594e6cb791ce7c839ccfbe153ecfa3e7abce

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

