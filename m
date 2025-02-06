Return-Path: <linux-gpio+bounces-15447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 776A6A2A85D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B85418892F7
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875BE22D4E6;
	Thu,  6 Feb 2025 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WFaAdEfJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF3422AE71
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844541; cv=none; b=hecJatb3ADUlFSyJMTDxRx60WrXlcjsTTStGrbcAJuqEvaAoaBi9M7EYqw14mETWeXpSHPSBF1kl95MjsUnGPLa2O0/7flwAmzCvBYytpmRP2JWvWDB/zhBDRnlfhrEgVeQYthxEvyWUHJKTB+aYRLRZpLEYlNSeeIbwgRDmSIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844541; c=relaxed/simple;
	bh=Xhx8I1RT8tRAlh1w32C6GuYPL3m92Qx4xndok+mVN0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNUqpzzSlGuEW3f7X2/P6MkD9TkPQbhUExiQzLJtcCOrzVSf2/YtmWdGSFU8RcCGOvBlX+ARPuvLQHF+nzQZ/QmwrMh9xCmL2YIBAeAX4F05WCtF0/C1mgeSomh482a40icarA/2QQPdcTx7Rqu6lFi0o1WcxVAlCF/lD+WMis8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WFaAdEfJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4363ae65100so9462585e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844537; x=1739449337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEqkRuUVrt/6To7a12oQ0QZUf+6LHMqjT8FfLiEpQWk=;
        b=WFaAdEfJsuOpMBu6iaSGADH9HNP1/KvzjMqlslg0hHoOAaI1vrT5VpPBqsg6etAmxV
         ZAH0lfbEJdqbiV8lZgAqiT9qwyZ6QVJ1mHx/QH8xIQaQJtj9iJRZoqk4z3Igvp47vgI3
         pJr8FlAWSH77KTO13Yv5/jRMOhf6XzHHcSjFsGY326j0qPLJBvn9SPArpeOJzRR8KLui
         oXgnDCGkEpIp86irv8gUxKvUU1dGrdyAndcwjeQOo0L3nOlzn3W2HqmWO6kihp0prIRs
         E6K0kp2oJrEGxLASawlr/2OudoaDwxcAqY9Ek+93W4YRDHDU4iVxsEH72KQY3mKLmoU8
         Gbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844537; x=1739449337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEqkRuUVrt/6To7a12oQ0QZUf+6LHMqjT8FfLiEpQWk=;
        b=Eiz2atsEn+Uv+S/NK78WzkFO2XiIB/CBqln/EdujhaCiRwUGk6lj3kSYEK/c/zNEiF
         OyP74GKRNbtiugln0efcLZ9ER4hVZi92Fj6wFMSxmtvVXLOxDI19tg/ZDDt43EXZVEvd
         0MhqFJzOY4j9eLeAWk26uM87BSyL8Aw3p+yMYvyD8RrmPmvLKJMTPGq+JPKXav0PIkKC
         IH+raPv8llrHBnGGoW9oWES0G3PEciFNowgZJwjwX4ZpvijtAzN5JwDhuJDL2kDo9ZTv
         S2cut9WjTAQah4DcjzhYFovqaKI+DRrTFZ0vEXcBUncUjuOTsyBg+WCfi8CEimBuqnlD
         mirg==
X-Forwarded-Encrypted: i=1; AJvYcCWV6Icn30IdxB6Me7CGLcwDt2m4pqM4AU3NRARQ/pHDL+rVWjGCUYcEERg/KMN2uKubX2TwbzCSXDE6@vger.kernel.org
X-Gm-Message-State: AOJu0YyIIT1nZu3qZIZ0y/FXL7VxeWZ47sEKxt0WC4mmKruOiqMST9yf
	feIA/0Q7QERPG+d7e2qXAoizpFzR7A5fS9gfSmYVp3K9Zsc5shYA/vqgGDI22B6eozQstQnbtcE
	thCY=
X-Gm-Gg: ASbGncs7D3kQyimTQZVvwxWynbDC3008I4J8wQP9/CO4OgcCw39PQ++3deiGSVhViFA
	scVtk1o+MWk7pYUdiuQN8ktnE0JKlQnCi/qwzmLWp4oJMoyvHkEYgL4BmbojpoJSM+F4YS6UkvR
	JbR0ib5fzXHbwcybfVbL8Ug3RxMOblsqYEwi8m+mYosUU4FBFBplupoG2jDnMBPNwvEd3gBjibQ
	hjUNKLvzI+tHBaWatk3QbnBhDPgk2uWtctXOKe8iPt0692+TVwD2KH9vFbhEPzGavsX4BnQiJs/
	zyBwFg==
X-Google-Smtp-Source: AGHT+IEeowtlsIxV/reCig3GgB86JfqunFCcgAp4LU7zzYfKhu6FHU67IAFksZIvUIyfccdUO7KtBQ==
X-Received: by 2002:a05:600c:4f03:b0:436:2238:97f6 with SMTP id 5b1f17b1804b1-4390d42e6cbmr53142275e9.1.1738844536844;
        Thu, 06 Feb 2025 04:22:16 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:00 +0100
Subject: [PATCH libgpiod v3 03/16] bindings: python: doc: update the
 docstring for gpiod.request_lines()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-3-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JJ3iUo1uXw5+ZWJPe5ttDwDK3Nl44JJtkWrt73AVAtM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlx5JW45M4hspetQ4+InI9DqnsmGUoqlhbKl
 vncJC/S3u6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcQAKCRARpy6gFHHX
 crYQD/9xs8Ucu/gtnAZNYLxZO6xkQpBIyiG/EUzvy6b7QXsU/MnT2wGWPgls1+9EMtKD5SiqsGA
 9dM2Xyg+l8xqy2bPi91v3He5xnKW59p97EpbSwhn5Z2WxrhMKuvn4zTzxEdDL4PWOxUQW2Op3dd
 kgjSSb7/JDZ/zePWuYBJQ6fJ0HoB9zkx9tA/aOLgXZSKCspmc08/z7dYIVajKzXFrypsW5u64JE
 IKBogWKIyu+Mi/8Gq/WPhGL1C7hCG94wKmAOCx1IiYPzUAGc8Xb47w2eTbVSD9oO4aMyADMOqOY
 CuaTvFvPIkacJstAb1j8SExpIIpTnQ3zYFx2a6x3DHq+ZbffwoKdQlbEO4xLPUikjJPHtnGGy9W
 rpWwczsevcT4FbASuwMXCqjuF88Fjs9VcS1zfNq51vsf0fQK1osRBFfCsy/pojaFKzHkEzzt61I
 tn72Tk0v29IrXkGXB85unz5r0s2qp1TiE73uRpV7vgTTAOKwfgkuxJrxOeq0ISUCm8hpWUVRzmY
 WdrAFU/PuSRvZBhq1AAE6Mo+lds/646siC5udxiARq0ZG3bOAXvm7nzz9aBC5pC9weZwZjj6B1f
 BEES2XiOigOgJppijVYFqXL/kVbRoTMW3wLTFQQHlJHLySIEQDhus+8jj++rGQ3L/eB+G1p2CNy
 MrBOkWmfHevYxhA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The global request_lines() function was updated to take explicitly typed
arguments instead of just passing *args and **kwargs down to
Chip.request_lines(). However, the doc remained unchanged. Update it now
to reflect the actual function parameters.

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/__init__.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__init__.py
index 817c755..854e41f 100644
--- a/bindings/python/gpiod/__init__.py
+++ b/bindings/python/gpiod/__init__.py
@@ -99,9 +99,18 @@ def request_lines(
     Args:
       path
         Path to the GPIO character device file.
-      *args
-      **kwargs
-        See Chip.request_lines() for configuration arguments.
+      config:
+        Dictionary mapping offsets or names (or tuples thereof) to
+        LineSettings. If None is passed as the value of the mapping,
+        default settings are used.
+      consumer:
+        Consumer string to use for this request.
+      event_buffer_size:
+        Size of the kernel edge event buffer to configure for this request.
+      output_values:
+        Dictionary mapping offsets or names to line.Value. This can be used
+        to set the desired output values globally while reusing LineSettings
+        for more lines.
 
     Returns:
       Returns a new LineRequest object.

-- 
2.45.2


