Return-Path: <linux-gpio+bounces-27075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260ABD8E10
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 13:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F9DD1924596
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 11:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503AC2DC768;
	Tue, 14 Oct 2025 11:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qgx6USgk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0145428CF49
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 11:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439823; cv=none; b=ecokOLJV9ECoJ1TE/GT8OrR7YjwFp/zJeifn70qp92y7r80xHgmdLmSZQZHbia/ssRB0JekdzQtyqSetkKv6FwWLePL9elczqYwQWQNN92zu2jz0mEDfIg6NWXMrk9K1NJ56TZC07j+1iEImQ/cJo6D0vQPLNHtfwN8PfodknXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439823; c=relaxed/simple;
	bh=fFAnhXo8LRmHKzhsEh1qaQDrn1OVe0MrFACIWbw+AYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gf+oy0vVJ+aWEqDCR9+/amR0CFKIcWbC6zkm5eUsy6KkBu3YXYTDM0Bzxxkm2v4gfUwL/v/45P0LZuegFu+AaLEHTSJIoiaDHjKZgGvMMoJrCXunwF/IFS3bt02Q08WGJbXB/lurpb9yjhyMo06/wI7JdbIaUI6GVB7moJulHZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qgx6USgk; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3696f1d5102so49390471fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760439819; x=1761044619; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aSBg21KwaCQJ3ZbWcTvLnMC5cG6OCieo4NGID6bXT7c=;
        b=Qgx6USgkHScpJj/vUwls46bIalX+blcmqp5RXaBWuvwaB67Z5662i7McnHn9m6qeN3
         XE81tWq2TLZj3XkUCKTevD/F6iNRFgMVqbZvVrSF6R6REQOLFH3e/T6/teue2R3iTbvs
         qRJ92v75dONUbgvg43/jL/V7uOJ7CxtBLg/Pvh8Q+uQ6CAktzioCnQNxImzJ03wlUQDj
         Rh32suneS8JvPvnaHlL/OBc5mN4uOjo0ylMO4Pms66z5gmGU+zATFVS5tEQ8xDla3hPl
         ppvXGFTtxs8XMYDRNs6ixuqB99FcuxLmsMsOw5UwrVjd0A/j7GEuDxa1sIoTcvYIV2nf
         KKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439819; x=1761044619;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSBg21KwaCQJ3ZbWcTvLnMC5cG6OCieo4NGID6bXT7c=;
        b=mE+v1R7I8yFQGYKxgelHKjuI3Ue1keZlw+dVFnJ+QZrMAxO3B1wS40Y8tpeGfVQ7tt
         FdEZ5xnp8tnIikxWixDYXdOKgu4m6Pk91xlJVR3fmBAjoOfilC77m5+pAfRZBlK41vHn
         oeHVRyWJZpMAbMTAEdMymv5x2gLR8HLqWGRQttX1G5UWp7zIj2/LALr9bQbRF4Up9nQn
         0VrvyOKEEtyBlx+H1EhWeuBhfD0tNwNCJYwx5y1xjI1uzJ4vqHNsdPpe9r1nJMnNYOfW
         9rMaBW0xUb3BHftM+rOs2PnvRvwqA7hQ3HMyxCDmyxsdjP5nU/fqeHqoMz+zDWgrhW/z
         SBLg==
X-Gm-Message-State: AOJu0Yy4UDEejND6hsPpYUv2RUHqvMCG0GAQJREf299BNGNf9LC9b9Rc
	uzYCJycZRjHA9i/EAO+ki4fe8M8CUgUr9m6GsTgUH89O/cx5xJTeTapsW+N8UV18157P1BAxftI
	z+Xra
X-Gm-Gg: ASbGncuT5yCMd/ZC7N+KbNMjF9MlNjApckrnFPgSSKxelUJIIEXsmstRYoNMDD2thMH
	VaDF9jGbUatAousOFIjl9+N2pTN2HnhS5Gg6VvZhfjESi8ud/Xu/6EXnjOH/08uhgNLkZOGFqjJ
	sv47Y3uyD2+WgGYPxWLz5hmZW4nsQsqe1Coq9JP0zIMpLYAzBv3lMhTK2f9S6k6r/tl79ixLz2D
	8O46d3sYQ3DW9uKiDfYY1DdCaqntdnrSVtuPE5iqZ+jf5lPRItHVypHCIOb3ZtQfxgGWLtjkH7R
	SCp5ozIWGz2+FqSdMpYW736cLflzRVAAcWX4/oDHyDZfmmR5dYc2yMBVzyzRz7skTjAOPDITOPO
	vf+My8i+IJx/Syc2Mg+aSxm7OA3qzWC6q/3kfP6CJ8ynUZ5q73MY9PxClfoA69lDTxUY=
X-Google-Smtp-Source: AGHT+IH2ijczAGlMkdcVtHMhumPMxN+nEhW+VcsNQy8hdGNG4AwUjqMGXaDoEc2u6oyTt50kuBGjaA==
X-Received: by 2002:a05:651c:1586:b0:355:b3ec:11e2 with SMTP id 38308e7fff4ca-37609c9caddmr69355191fa.8.1760439818882;
        Tue, 14 Oct 2025 04:03:38 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e7b4cddsm39992521fa.19.2025.10.14.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:03:21 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 13:03:21 +0200
Subject: [PATCH] pinctrl: pinmux: Add missing .function_is_gpio kerneldoc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-function-is-gpio-kerneldoc-v1-1-4e6940a2b37f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPgt7mgC/x2MSQqAMAwAvyI5G7BFD/oV8dAl1aC00qoI4t8NM
 qeBYR4olJkKDNUDmS4unKKIqitwi4kzIXtx0I3uVKNaDGd0h0TIBeedE66UI20+OdS9FXzorTY
 ggz1T4Pufj9P7fiIDPm9sAAAA
X-Change-ID: 20251014-function-is-gpio-kerneldoc-29b9b9df9b2a
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This callback was undocumented, add the docs.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/pinctrl/pinmux.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index 6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81..d2da7169b767609682e66700411051e20ba3fed2 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -35,6 +35,13 @@ struct pinctrl_gpio_range;
  *	name can be used with the generic @pinctrl_ops to retrieve the
  *	actual pins affected. The applicable groups will be returned in
  *	@groups and the number of groups in @num_groups
+ * @function_is_gpio: determine, preferably by reading hardware register states
+ *	if the indicates function selector passed corresponds to the GPIO
+ *	function which can also be used by the accelerared GPIO functions
+ *	@gpio_request_enable, @gpio_disable_free and @gpio_set_direction.
+ *	When the pin control core can properly determine if a function is a
+ *	GPIO function, it is much easier to use the @strict mode on the pin
+ *	controller and avoid confusing set-ups.
  * @set_mux: enable a certain muxing function with a certain pin group. The
  *	driver does not need to figure out whether enabling this function
  *	conflicts some other use of the pins in that group, such collisions

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251014-function-is-gpio-kerneldoc-29b9b9df9b2a

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


