Return-Path: <linux-gpio+bounces-18147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3020FA77B33
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 14:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B7D93AC4A3
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 12:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9187E202C55;
	Tue,  1 Apr 2025 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eqAcMubW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AB91E47A9
	for <linux-gpio@vger.kernel.org>; Tue,  1 Apr 2025 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511620; cv=none; b=PkQ8Ye+vE6YUKX8WXQpuLOf8O+s90jm09QH340pdVfCVNqk1hlH2QwEh93Z8D37Ivo0jIqvIjiui59kwVhtMxA2vkrVH8H6fA43KlNa4TWsmLtGjotL2qBL7R13qDJEDgEQK+/v7KsFqLXucVW+RK5BeaONhjEHV+Gy00fLF1OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511620; c=relaxed/simple;
	bh=temwGwuAaoC5zTFBClo/qvp6AjaDT4RZkI46P4DarK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnQ0173a1bF/9MFUJvKNJp7RSCJJaU+I1Y/5wUIzGz8LF3vW0Z6W9iJd8iOdIJgcUsi9iYSbCjTTYzKN1yoftRn4ufnP0fRyW+R1eYGs24hfvvram5BO2vBORS25H8rjzbPr9OO0UOH57Z9K1EYsL0RBkpRUoST9Lcfmf+97q/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eqAcMubW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so33684895e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Apr 2025 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743511617; x=1744116417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xe7kdEUowiq8TBvJ84z72BfPVI79Uk7veEXXBETFIOc=;
        b=eqAcMubWKJ4gAC3rO+37fSR7TlLQ7k/fWNGqDef4ArA05UeyAczxmOQcyZ18aFt0wf
         5qLyY/WGRvCEHAogvEVMGTI8GizsByFt4N6RN/VFGCxvc6haqqNYt6PZ5U3vvEvlN2Gy
         vmVRMKj4RpvdZf9GYPMUzGpMWUWwpUmWcb6Pu5L3gDAGrUopJxbga90w69ywmpTXlWA7
         ALwOFCbJTmtzwUrq1h4qS4sCiSUwCjIpSrpvmQI16ye0U1YsNLp7Z38xSxa60KShB/ef
         ObhpWN2A9DATZ3lhIGa8xNdt+d2S70eUxJ0eMKVkNp8fKB5wJmog0TV/O6eGhuVnQ14Q
         h/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511617; x=1744116417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xe7kdEUowiq8TBvJ84z72BfPVI79Uk7veEXXBETFIOc=;
        b=F3IOOPAyc+2OgbqISPqr2wEUY1W5LKagRHQ8tAij37TS/hsMinQa2O8BoWqfsMqWkg
         KH9xBuhI9qUVw4Kehc5pz+S9zNndEyo3OP1jS5RsHZIP/3oRjMUf9naELr/o843pLe41
         R2RngfmrJ+m+rLZWBSAdSZ31pzNdRQD57gaK8vjCEph3P9SZ2lOW4L3seajOPICKFxcK
         vfxejsOfAgHJ0QvZk/oi8st1IwCXJINcYzN2fpF0/X/uyQ3BgztQyigXVPt5bRY5OLRE
         Z+Zm1WnekdCk9szDKDOIi9uH7yA01cIAGjVu4cYR3nuiRnnkmkEtgwFONzINUzVptJeu
         Tcaw==
X-Gm-Message-State: AOJu0YzmfDTKmUpGM883R0/rx1kz4mmOm/VUtiELAqc1vFBJ5BdU7SMm
	er68YfvfNzMKFP1WWTISs2jBlgNW5fCviogo96uAwnB2zQeUlV7VzR0nqih+AzsVoxvnYXYHi3W
	a
X-Gm-Gg: ASbGncsaBJeEmCc0tLkUvNEmeej28ezf93X7z7eJq8Ak5zZhUI99e9TF4J/cxZcoB6u
	+0OyLDsA/Yza1EhdtvUdetQH5F+pbYFW8xY8c/fT3j6NqzpZRFONX5k+OWPZUiOGWqrKi+eecCb
	689XDiWBvLcpsMxVPTGqGy7HOKjuW/mLHwRuGir4Q9USB5kZQ4SCACuQIRrQGelBhrAuoM+A+LD
	wju9DxPvI8KgVIM41VVsMX2o4SnggDCl/qiowxeHiPzDn8BjKC82oWAPjioFSxWnzG0mhWA0fKb
	+J0RwgHS1BZAPqP0m7dybrbQtXqwwNQMZaF7
X-Google-Smtp-Source: AGHT+IGf0u46IWU3CO/BVxxVBOy8SucBu63MYXRuUp8B+WfcdRIPeQ6B7KQe1s4LIVosuvQteU9tqg==
X-Received: by 2002:a05:600c:6b6a:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-43d9118f70cmr145110815e9.14.1743511616731;
        Tue, 01 Apr 2025 05:46:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a1d1:bbb:e2a6:2a9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc1889sm154711095e9.16.2025.04.01.05.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:46:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Apr 2025 14:46:42 +0200
Subject: [PATCH v2 1/4] gpio: deprecate the GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-gpio-todo-remove-nonexclusive-v2-1-7c1380797b0d@linaro.org>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
In-Reply-To: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Q2fStXzgr+tzcMl62MNu7piyURnbnFyqKrL7W40dDzY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn6+A+b3G/t7nNpboJqZXMuCSfP94fJXXp8nKTZ
 eJ1E6+JUW+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ+vgPgAKCRARpy6gFHHX
 cixzD/9nSVZXqJagl5jSQHjbsNryvTmOQsXiTQ0JT42XW8WAgd+yJi+SbFEv+z8viaawLoo6mTf
 Rf7qLG6rhFTV2idbRaXe3/YepxKRfP85PXbPqq8eoKHaruClgNG3x3heEDt1dFqRfuaEbvnovDE
 3awvA2RHnuSWRsiohCpVToG34tUmQhgMRYkqC/fKuHIa5Ie3CDPpygXwDRn0Xbjmahvtt+5HNpT
 HOi8knpnYwRiC3mv29XzJ+YpGPAXuwiRo+HwHBE+9AJ6Yz0L9Fk03Wq7zaOlugwFAZSohhAqRP9
 +EPTRivj40N9t/T4QkBkv3CC7ebd/BkeMowK/2Z8PeuKwWYdxxVdFOMWofyevKYoNmGu1Qzpjrd
 lhiAok2kdsFv0OcqRz16dU/QkcCoi/cpqCuV9umKdXNW4kDld3BmTLw5J5DBEV7mgh2oIYEU/Se
 mDOLE28+QBdylpgcr4F2ZDQtatXvCikmZLpHGe0ChLDDCZxC7oVkf5u2NfymRMO3ZwyV37N62B6
 Reenbux3KkyuLLIpWleo6YLn5fTqENagSjVR6DrACPaSqrKIUjFlQISPn0rIgghzkL+RZVEJjc9
 DDLofhQ8DQ0y0N29vsmymNWW0hzIbHInAfXsVlv4UosMFf0OBx7PG3qsFP8O3Hd1Mfac9k+Zb1m
 iSgISzMBWwYQhvQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The non-exclusive GPIO request flag looks like a functional feature but
is in fact a workaround for a corner-case that got out of hand. It should
be removed so deprecate it officially so that nobody uses it anymore.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/consumer.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 45b651c05b9c..8adc8e9cb4a7 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -31,6 +31,7 @@ struct gpio_descs {
 #define GPIOD_FLAGS_BIT_DIR_OUT		BIT(1)
 #define GPIOD_FLAGS_BIT_DIR_VAL		BIT(2)
 #define GPIOD_FLAGS_BIT_OPEN_DRAIN	BIT(3)
+/* GPIOD_FLAGS_BIT_NONEXCLUSIVE is DEPRECATED, don't use in new code. */
 #define GPIOD_FLAGS_BIT_NONEXCLUSIVE	BIT(4)
 
 /**

-- 
2.45.2


