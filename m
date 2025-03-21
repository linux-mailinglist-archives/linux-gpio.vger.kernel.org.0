Return-Path: <linux-gpio+bounces-17848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B40CA6B983
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E08D01890077
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 11:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BA3221578;
	Fri, 21 Mar 2025 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N6EeAS27"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AED1F09A8
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555140; cv=none; b=hh43N7I7LJHxyV6Ha2W7BTdgflVL4Ifcq0gD4b5JTuftsagy4VcFezlj0m71empniM2rtwaWK2TQ+3LkQBEc/c7LdiepKVU3RsdPuuOZADqp1Mjgb7L3AIFiEN6xw3gicCcRNS7ZIfoWrAxu2FmIJ8czf2feYcZi74ovjyvD+hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555140; c=relaxed/simple;
	bh=mERcrkqYtoItofVJpYI0tx3ztSUXWSTF2jM9yRU3s50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9jYTMfBs8DYEjVJd2GBdgVKDww+r0rZipeZSySg73KPxl5tDKwXcs3qHWvj56NYOEjUoo+/yb94Ajo4dQoefOcyBzK6vvR4NKR56tjBbnlDCTHhMWB8lkASDoTBRDCPHf15b4N/GgNR7qahE2xdzx7Hk9tixkTMEB9zJVeb2BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N6EeAS27; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso19179035e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 04:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742555136; x=1743159936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RInPx+qqHlGW1w4b3QFnw8mOIDCfOK+hpaQW0FHKC/0=;
        b=N6EeAS27+Sf6v4iaQvkzrJg9+PLeYqt3LBhOxy+3rwgM0Ez3wortWwt/MuuZdAOVBF
         7yfeEzVo3Bh73CkUMH5ko9PKV6vYIg3ih2ex0wFWErHBCqE+WqghRUqV6R2NhX+v7qUu
         6eg8KYJj9GpROytpGIBAfhwa5Kw46QyTZavqTE/rM0rI2ERtuRKzxRqLM2O3mNxlSPts
         g+6bwfD9XW+r7dZZsmzWJa27DPmL9Swm6mahyT4SXcLLlEJyigmaNdsKV76nuiQduHRF
         Ffj2idF+CAKQRMN9zbrXLXUHTicHafjagXR+8BtnB489Sml3z5Y69GhwMHdzHizZDdZW
         QEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742555136; x=1743159936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RInPx+qqHlGW1w4b3QFnw8mOIDCfOK+hpaQW0FHKC/0=;
        b=PmIT6vKej2bErijUVGnT2gjA5SaP7XCIPQ7H0ihTiZKb2oYS/+IdhqV+5qOjnWsMqG
         ckCZMcXCSmghNs12kMwMnUmWwumVZv25KTJ3zqwQprK+2rqV9KlcdBJLKXvohx09u6Jk
         iiGkyRPZUGbQFNPKYEaslTKjZnP7214OrJquXrzZK76YC1wgc/eY9Zm3nYO01fi7YWXQ
         6++Rj9h4n6b/nw7W4OepjNFBHp53xQPktTEdHfvaOFUlSR0HND5sFbgimB3kpIaGd8YT
         qk/2XzKBBubUOA1hBz7gp1FETpusVvDAhjIIzl01JbuCHTrf8OhJkMo4W6v8tkf5YbX6
         phjA==
X-Forwarded-Encrypted: i=1; AJvYcCW5/zn3yUyI0/l5/GjC0htEKrZsCwIir5e1+W4x9JEWeOEBjnO3xjZ26AbqEjbaQOzXlXdz8A98aWdD@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQehp+lnkasCRRgBvEaIT3cUDBS6g1D6hgekl04QBNX/QqvWm
	ub1OR4bfDTknNPUzHvoggIpnT/6SxW0zOYP4cQrOtGaHLWGqORIyD1osyGhURIWKeiedHGx8YR3
	T
X-Gm-Gg: ASbGnctjbLPooYCVGMREycNI/Gn16ZgjijjthxJ58bUFU8p497/sL1nkR9eVV6+LQ/t
	xOXzT0nJlyexwHWmhPifEv1gYSws8jRjhDehKCupNZA4bo/30a2eh+JpObInh6+D1lRJIk/zYSX
	6PHnW1C27NS+KAz2Vd03Nu8npnseRF8/3IWmf3P8KOjeqVNAmOzmUw5uqaIXfO42qK4ZAuv22sX
	cxIxhVjow+XYP6Efk0Qk59B0hFYv1MQTvaOupxeW+B3Iy34+GHKc4ERjYo+rZDHfLqiWTOkGeoZ
	T/+A4K8aEdjuO4yom9boTq4Lwoyq3e4T7YJw8Q==
X-Google-Smtp-Source: AGHT+IE7SmzDUU//GjYLQSvB44HaAFuYNAnHoUF4PKtSoHrab4IHOL860KOZLfrHaSKvVz1W8v2oFw==
X-Received: by 2002:a05:600c:4f12:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-43d50a35ab9mr18354245e9.25.1742555136377;
        Fri, 21 Mar 2025 04:05:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1aa4:f3ec:847a:32d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef23esm2037797f8f.81.2025.03.21.04.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:05:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 12:05:25 +0100
Subject: [PATCH libgpiod 2/2] tools: tests: add a test case for gpioinfo
 output consistency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-gpioinfo-unnamed-quotes-v1-2-a806e9027adf@linaro.org>
References: <20250321-gpioinfo-unnamed-quotes-v1-0-a806e9027adf@linaro.org>
In-Reply-To: <20250321-gpioinfo-unnamed-quotes-v1-0-a806e9027adf@linaro.org>
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dTU0e84GFbHEzJrhH7JSsPFKlZ2GMA288rwNL++vq4Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn3Uf9LPFHNPNupz46UJl0BwyHNdKmdAzEAOQV3
 LC4z2ZuviCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ91H/QAKCRARpy6gFHHX
 cl6LEACIWFjWQMhg6JOfq3KxLjEMtxH3+bGoJYmuOnMSXTxbMAmFjg3SzqhwHwRqo7QdER8sgeG
 lMhkscm+jBH1erc+jSY34REMX9JBaKsfvHGIPg/Dy2P87cDk/ufitx0Oc3iH8ogzr2qoZxd/pYI
 Lb7QQ4Ck+8ZdHnWuRjK+AFAzfgR8vlFuVRWanaOwFCKF1S8HhMQhOhCPKFRJC5gr/zyAw1NH0rl
 M05CiDRGceDKo2+Ka0j3ZfVMF2AW0zsB1vEr6u6+kr4SHwDcssnjnwilUyAFJhK3hoGZQzWITIT
 IRAAkXh7gdzHrRPbII+4lJifcCvElCp1syT7L2jZF6Cz9ZfUas/1pErm74z1wLpWNe5gEfCrs8+
 M7Z6qze76EjXC9eGDnTgRz3maxrFJoyLZ91W2IduEKhyY1D5iWE9qdp3KfBQVEVVkNl/J26sahz
 aSceLfmeCkMlh+358L73obNlNvjWbJapKxRlspx7JwNJ4g/6VJQIOJpA54tQ1ona4pI9MdupTGA
 RqlTkc+L+OvaY+C6bMjvFFRp/P6em8+xBxrIT6hTJa8Xsh9HbOyJ3SMjIVKKtKhP9UNx4w1evEc
 koEHyjIKodkn1gjyO0dhVVCy5pY5YbA1BeSlAWFFLVpDSsotbHgh1BJ1w3DWiftvyRR9k/yE/I5
 u49+eslT5xkUKzg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a test case making sure that without the `--unquoted` switch, the
consumer name is still quoted both for named and unnamed lines.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 359960a..898b348 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -478,6 +478,24 @@ test_gpioinfo_with_offset_out_of_range() {
 	status_is 1
 }
 
+test_gpioinfo_quoted_output_consistency() {
+	gpiosim_chip sim0 num_lines=2 line_name=0:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpioset --chip=$sim0 0=active 1=active
+
+	run_prog gpioinfo --chip=$sim0
+
+	status_is 0
+	num_lines_is 3
+	output_regex_match "line\\s+0:\\s+\"foo\"\\s+output\\s+consumer=\"gpioset\""
+	output_regex_match "line\\s+1:\\s+unnamed\\s+output\\s+consumer=\"gpioset\""
+
+	dut_kill
+	dut_wait
+}
+
 #
 # gpioget test cases
 #

-- 
2.45.2


