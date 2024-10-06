Return-Path: <linux-gpio+bounces-10906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1A7992012
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 19:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57FBE1F2173D
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 17:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028AA18A6B2;
	Sun,  6 Oct 2024 17:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="HtgOCbPE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A268189F43
	for <linux-gpio@vger.kernel.org>; Sun,  6 Oct 2024 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728236606; cv=none; b=sDrwbwot+lxcFcudSJLXoaoWEaP3/Irj8yfTiayvHpoaOdL5+9uC0lmd12sbHgeDsEAWDhOxW6QO/U+9bmXQ+ROGNpS97ItfGmd2d5GrjKF08EXhKakpqgri8roXHlxkmy9WzzC/NRgaOAe8SkGCKcOTzs0mIi3mDgjypFhLiXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728236606; c=relaxed/simple;
	bh=F0fzJk3goWwHbOnHvEHn53C9HzZ826eUmoIuPWYk1H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i4Hx62ulbBbH+vfLs8MulEO1JYBRdEHmB76A3tiKxxgDcT49u84QM6E0yv/6sxTd8QntzGKyrI7G/a7gU22EFrwWWQSX9DyJ16F40STUZb+w6kzzesjldIzQcW1C1w+ZbtjzVFxtntx9YU/bPZ0gOfKaE8C6Ga833xHtu9NkNdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=HtgOCbPE; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71dfe07489dso407047b3a.3
        for <linux-gpio@vger.kernel.org>; Sun, 06 Oct 2024 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728236604; x=1728841404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0aqH8Nz3YTxyf3WOUwJPMSHP7Sz01anRaWLkW9KhzE=;
        b=HtgOCbPE1dVQ9uW+WNMQp6KdjucYMffvWeEGtq3GBC/ldFRWrfhaQZdz+G5EtG0omI
         L93pk8csjQgNsd2gHWDx7CSyF2Xt88odrNPIGKEIcdruGc/ha2gV7hCyWEy6HhY1FTEl
         9tmpkOv9Q0yxpttSFjThntYLkbWGr2UjU9EC3SJEDqtikfOqhuUA58/ny6BQRGAQVe0R
         uLGuWeFjiiHycYoyIlyQ6mDwCKtQiRDChEZmnAoKy0ip5SQsXPbBhCmI871W7/Rb3ZMT
         fV4szf7YUrUc/3kBPyLhJ098JbQL62gkNsO5svK0Ig7D1UwsPmV6atT8hKsJWHCD9Q4i
         LqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728236604; x=1728841404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0aqH8Nz3YTxyf3WOUwJPMSHP7Sz01anRaWLkW9KhzE=;
        b=X5bGtgmNmyeB+66kERrDaacOX5Wd2tH3ijQ6kKhvkJERL7T8g06o3Q6LUqyeQdV4xt
         6ekIVH/lYl84GvQ2hCAIq0KAMGRVEFa5qxId0hJNNikIu9CqdI9bCPCjZmkPO1kTquaf
         0D3mcJ8o2KbkLWvK3eHFUKOO8IYCDFCeEYZJMMLASQrpIuKnMetk9eG9/90PqZeNs6Mr
         vkhtj5N1hkWIxB7jzZEnc9aiZFCMZI7Y1ZdT4SaYogrNKnyxnqV4CcGU2/Zab7uecGcS
         T/CPbjcDHIJN8lQEn254YZMjB9dsjb/uLdY58dmtUpEmlKKn3wOGvtbMhOoMWG6xx+Ku
         qjaA==
X-Forwarded-Encrypted: i=1; AJvYcCXbfyKpXNQsviOBtpZnAoXx8IjmQhhg0PKX/2p1jAd2z9QRy7GIm06S8mrin2nWtksk0JQt6zr1Jvxq@vger.kernel.org
X-Gm-Message-State: AOJu0YxqzuhvvefEg+bb3OVvoKd/kIDYf4zHD7ofMOmwo6mLyQUoppWu
	LL9xbzgXg6HHj9BwQuOU/IvxIAJ5PA5OLzbnmaFzFb0brB/S2ZsCnOss+5gtKSQ=
X-Google-Smtp-Source: AGHT+IHVc4JR7QyWPEo99nCtTOnKJvnv2SE8G5Rtxbg+iGO4JRlQKbzCRbb7fdIDCqesN12taDtiuQ==
X-Received: by 2002:a05:6a20:1a9d:b0:1d6:e61c:23ec with SMTP id adf61e73a8af0-1d6e61c33e0mr7436331637.6.1728236604624;
        Sun, 06 Oct 2024 10:43:24 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d6526bsm2999591b3a.159.2024.10.06.10.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:43:24 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 06 Oct 2024 10:43:22 -0700
Subject: [PATCH v2 2/3] pinctrl: th1520: Convert thp->mutex to guarded
 mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241006-th1520-pinctrl-fixes-v2-2-b1822ae3a6d7@tenstorrent.com>
References: <20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com>
In-Reply-To: <20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

Convert th1520_pinctrl_dt_node_to_map() to use guarded mutex for
thp->mutex.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 265a75a78d5a..7ed3f82b9339 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -444,7 +444,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		return -ENOMEM;
 
 	nmaps = 0;
-	mutex_lock(&thp->mutex);
+	guard(mutex)(&thp->mutex);
 	for_each_available_child_of_node(np, child) {
 		unsigned int rollback = nmaps;
 		enum th1520_muxtype muxtype;
@@ -531,7 +531,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	*maps = map;
 	*num_maps = nmaps;
-	mutex_unlock(&thp->mutex);
 	return 0;
 
 free_configs:
@@ -539,7 +538,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 put_child:
 	of_node_put(child);
 	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
-	mutex_unlock(&thp->mutex);
 	return ret;
 }
 

-- 
2.34.1


