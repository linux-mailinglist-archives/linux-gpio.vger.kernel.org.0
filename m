Return-Path: <linux-gpio+bounces-26546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC1B9A688
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 16:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31CE6380B5B
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 14:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB6330F55C;
	Wed, 24 Sep 2025 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nV/E1HNy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647EA30C352
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725522; cv=none; b=P5WOeDTQlFpqNalAlggoFoa+t7RVo+pXcVFld99p1ObqfRIWUr2tsoPzEV53UtJ1BM81tFLGkednPEvXcr43avZg8jUjsVY+0pYGJsGtxK4VEG64B01LkH/WhgiuulP4MDLjuklxyWRyRzDvLyVvzDeU/+ZpUYvCewWiRHjjFKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725522; c=relaxed/simple;
	bh=2qMqnWq/naOFzTCUU9EEKFnLmItDIx+R8oO+Cct9CwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QAzWCU1Q/5qipuLgjNH48eabGTHHUsJX/v+6++9+d5V4c2+zW62sBIrmnIQHrGE6IN6QRYS8hpzbCZQufiGClryPQGE0mpyeIH/xIUUlxe30OmNv4BoMyOODpONeq+ztiBDYpCJC/F57Lhq26B5l8eQCY8aG3NzhiA8x2141Vxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nV/E1HNy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso48272155e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725519; x=1759330319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhDMW9EyWA9awJNXX9Q3cXommnoch0fAiufj04SUcx0=;
        b=nV/E1HNyV+9QN7xEVB5QfDKrjBv/H4MFWv88Wqrt+kquUk/2YqkG7g79aCYpyW9FK4
         s5KrBrYL48LPPP4XaBevW4C/aiTY4znvn5ymgvd+gDtz4B6K8bWVYicqK64kWRaHTIUG
         EzlOoJ1cX7aMkAgR1phQfeIn3nsUrVkdKpkxoyigoo9O6rx2nnkUmOD5I0DK+LEpajMr
         K+XT1iZhTrKmISOV5V51LoGUuKTSfAmWyk7Gtao8uvgXOArgD8ZO651Tfec7hy47JT5H
         KnsTVh99zFFWcI0JNKEeaa4YAsO4xE+V33xwQLxckJsLjwTXNVEGJgHtyJXAkhDp+RvD
         y1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725519; x=1759330319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhDMW9EyWA9awJNXX9Q3cXommnoch0fAiufj04SUcx0=;
        b=IESttCwXDbom0Z67CdudSkrG3JXiIWU365XphOLjWzJb9mFRPElcjYxCJ6kKmVFNFB
         zxttDY4hGy7yRF+AIb0MYNhKNbMar8MPQzlqLWDMXDTgNm1Xc5zVMMBOy73lx+piuIvx
         5flvZfI8v6fOqqqaKr7Yd4PdgYXM2WDSYz8zM+Pq4j3p3LPTVRgVv68mi6hsDT7cmM2q
         f7MdCRnhQeEHV/7a6k/BavCybgiwQgVRd6HAnccIIPt60ih03uGf53yHy9hY6vGqMqkd
         he2JDj1GPxI2eON//Ak5SWI216A7/i2IWjMDVj67yNCEK3f2//4G8US/OuXg0nIS3+8k
         p2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzAKBNzCryW5ZoXLzyxQ8lqE7qCVuzWWy8aVklhLaLSrzZAbSDRtnWn16Mhv9Yr7EGFk1GdtLKef5r@vger.kernel.org
X-Gm-Message-State: AOJu0YxH0hPuaLKV8jaUrAG1WO1y1ihiIVAMxw3qCNLvrDtI98gFej9D
	IhrhrBe88FDvtsfG/vqSBAbiZtVTTGGK/iaIGuwF3LGTXL2VDsiHf5hkiXptjTzYuXA=
X-Gm-Gg: ASbGncsk2hnGVXMpyilOhYx0G+nxCPvr8X6reu6/uqRhllfdb3EAyfWmrB9HNDv0IgY
	uoRHsDeWgdi52TdHRIqJOa16aFlXyvpgFDAuG9killvGF/Uyg4OF/5ByDBBOKZ2Tfl3KI1ZpQf/
	tcal2meVPLnjc+YhQPp7hsIvY6IKgenoOoShsly7lXKCtd3I3izf7ScLl/4CIedhxZlYIR7ARL4
	wbwCjaXAIEDZ8AvpsHTxEq2OX5qD7mjnzSF6KBDlVSU/kwFiBBp087iXy/Q4TZXtBuWdISG1Rjy
	iVgoOCQ+tGV6Tpj7/6ZuJ0Wp0CWWWrNAOoKLNq3eHP/EruqPhAvrdX490XIx9wNcfEZ/gIiFxA7
	R+ADfx/Pft56Q2CnUlQ==
X-Google-Smtp-Source: AGHT+IEXQ1OsqbaopW/81AV01FMskOhevY3liqHQ+TaZzWyXAp5VdKtAaaFJhzum2Q2RFl6zG/ksTg==
X-Received: by 2002:a05:600c:c168:b0:45d:f897:fbe1 with SMTP id 5b1f17b1804b1-46e32a0de18mr1279345e9.32.1758725518644;
        Wed, 24 Sep 2025 07:51:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:51:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:31 +0200
Subject: [PATCH RFC 3/9] gpiolib: define GPIOD_FLAG_SHARED
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-3-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=der9rbuzwFrj8Ks9ulK3QjlAd3x3WVP4lOrBQ5vkuIQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWF7GWhBGJxTAGF0PPNPgubeRhYpSPwz8NCv
 Nvi6uNAKwmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhQAKCRARpy6gFHHX
 clM3EADgqkPo+x/ufaWkg/WHiN9hw/cvQg7FiJdhEdeFpxtrREOwOstiUn/WMlvJf2D4BMLn7cu
 mokj2sl9AHpKriv5ymzg4FA1FGhJEgjkK46mjC6T56uk4Lj9yapACQkatEbVat7XhRM8PnBgluX
 Jc+89aNvU/Dx088tAolt+UYFAl+45zfiOJEARt1xuEWwW8P/26l93XIE+bDy0qu9fGkKuWiRiec
 5PdwrLSNmbfVKAra7sRgOFFBewIJM2rhf9J34K74Y3g4fM9WjzeTKconSAaEHPSkgUzxHn2Q8Bo
 sSz2uatngoMnPxxCaiAuGawKLv90e+HbbLng9dghn5mD9Espf42WF6cqI5EJ1kbl76L1Xv4oiue
 4RnSq6pmGN3nL+LQg99+Yv2BmrBcQsjFh5vIuLyKyCGI7YLSssw+V5trZHExBH3knl1QCTqHCNH
 V3CU9z91FC4t5KeEimKB2XzTMj6XkCOI5YUN3iau8Od1M16+qMysica7cKJ6L+gPMKCrgkLVfqP
 DV6Y3x/EvuCr1EbBd2jXOdBJ0vxxBXrwn4+N1KFQR3AyEkhgar155iTpZRzVjehN0VABnc/eJCp
 sRS11jZ1qiNgb7iCtv05Cc3QFmyId9CcL8ck/LYyTKXH2HqwC9kuIWvmrc27II/8qMFiGJZM5tT
 G4vQ94hkIbTiDFw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Define a new GPIO descriptor flag for marking pins that are shared by
multiple consumer. This flag will be used in several places so we need
to do it in advance and separately from other changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2a003a7311e7ac5beeaa1c947d921149ad991acf..09ac92ed0853f2ff0013d1b16a5dd082c9fd162e 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -204,6 +204,7 @@ struct gpio_desc {
 #define GPIOD_FLAG_EDGE_FALLING		17 /* GPIO CDEV detects falling edge events */
 #define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 #define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
+#define GPIOD_FLAG_SHARED		20 /* GPIO is shared by multiple consumers */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;

-- 
2.48.1


