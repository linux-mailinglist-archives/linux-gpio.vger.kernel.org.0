Return-Path: <linux-gpio+bounces-26813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B8EBBDDC6
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 13:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59E8D4E3F2F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 11:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7679C26C3A2;
	Mon,  6 Oct 2025 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sbC3b1dQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16826B95B
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750086; cv=none; b=mtANHLn3XEPrUXYtz3fPx2AH8hrHxMPPIT7bOlppyPGdbe4EbLtOJpEY6tPraP3RhDR5NOX3peIwPSthmv+WIIIsMeJkVJic4SL7IeIFwnd+BEdnZ195iWjOV07yopaIcZB+X23M35US8/HsmMTQgkgQWvqHj6mNpSm+WvwkcrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750086; c=relaxed/simple;
	bh=2XIdHwv1nEZUszW9xBeMlYnzvij5z9mcKsKkkBmhivE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDqFIn6lMke25XACF+xo/xoWr4LiT7kGrRU7svi6hKIEjtlZA6yB5Nr96vUIZ5KUvomTAHrFog3JCnsU6SmV4kyMGUa5x6S1lSDZVuyoj2IYwE0fKgd+JyCZPg7M4baLEUPOSpjd4F4v9mPW9CRREksXV8w/Emsl4lzVIAJ9dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sbC3b1dQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso3543361f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 04:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759750081; x=1760354881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJAqKzH1QVK7HWwQBiaSMWGinR1XPW9DXUXJxSMMk3g=;
        b=sbC3b1dQ9KH7mf/w4G8WBiVv3l5kmvU/TLoH2t6MlpNasOJzNA+bhbk1L02TWsd9L7
         FFEuthJNpPAsWpqUDebPbZyWAoCkDF4d1SDvdYXOaYL7n+TiYbFH58CmWLNPV7BWjnsb
         Uny/LKm4e7HO0kcabGBxcBLrosK6350LOlTCLkgTo4qgf3hAfDTVK1bG9aH2NVwA0F77
         Mec5nzHXHjTjCR8CvdYHh5kGkx/QbEo8+lucFXvC4stVDpZPEdHbrDqXjnP1xK8Gm24g
         cWFpTQqnrdWHSeuU7gvIoIm5rAv/ouLqzKY5wRdxC6oaKEreVbooW8pGNtuP7w5SRv9i
         DqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750081; x=1760354881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJAqKzH1QVK7HWwQBiaSMWGinR1XPW9DXUXJxSMMk3g=;
        b=NkzaP3GoQ10w/TrDMb9Qx0htyeeTkVUwDAeWB4gBYipbsIBvimY6SHipiq7LZYlN7x
         /Nm5zfty+ICZm3in40cnDWvQYmlUOSEO9RHWXUd9rbEla1GbuX5SDe6tEmQPAC6F1KTu
         Le4JeZzEk7cZP8iggvMhWo2jamRUF1hG3SRsZNkC5mVmUxvg+AXev7QzRk/DajTGhgIB
         5AiXkM1232fKO36983bs7ENzqkcipTp+FUFTQqog/fuw7wkmvLV268qu5bOhP6joNi8+
         ywVfcEpFgAiMs/g9eJrFgUcgnFuuxaZ75mt6Ouyl56l7eIDKtlQWcz4+8FrE0N3HVN9D
         1ELg==
X-Gm-Message-State: AOJu0YyksROI7hcNnOWNgcQYt8/jVT8AXoLMQZD8ym77b2hEju43YNhH
	UUpnEm7WcpdLX3WE5u6pznDi91V57LZIk8H+MMeTiSb0rB8zTzUG+OYxDLYC++Ej7R4=
X-Gm-Gg: ASbGnctsabCKQNgJgWgANcvTIKtApWae4QJ2X5e8c5Luk/eHKsrZNCaIejw6+OL/EWb
	sTy0RuONUqizPvG/Da3eUSO7G4ZvwF8+v4YfPijtM9xb413GjecD1mVtXN/NFpo7xserHQnoAWV
	o7FdUqUkuJNJBGAnLFJr6gOhxHA6EavYIFj1uVgw2k8+oJuIG/GSoYE3xf7sjeSZ1P9Eo8TIqeD
	vPBoqeSLiIKxZQIuiPzcwIYKsZgZ2RlgRcynRO+R/SgKzp9/3m5pJuht4kLB5BBk34BJL+oEy29
	cNJw6WUZhdGh8aUho5i4Ud406t0nkxDUczTkzHsLGRSP8zK2Smvn1/pfbH4hgxN1sSUKM/oNNTR
	EfYPU8BJ2q/Yg6e7PVS167YcEvTj8Qq/rwgLs/rg44SdUF3Y8QQUz
X-Google-Smtp-Source: AGHT+IE1gSd13wWcgI7rw9H0nWWkuGiOJxzz+sX7Wfe4/P77XROM/Hlq6KOxzMs/5WOAWdvQ/bAI3w==
X-Received: by 2002:a05:6000:4010:b0:3ee:141a:ede5 with SMTP id ffacd0b85a97d-425671c61admr7836063f8f.57.1759750081147;
        Mon, 06 Oct 2025 04:28:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f017esm21078167f8f.47.2025.10.06.04.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:28:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 13:27:46 +0200
Subject: [PATCH libgpiod 1/7] tests: harness: use correct type to capture a
 boolean retval
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-gpiosim-valid-lines-v1-1-b399373e90a9@linaro.org>
References: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
In-Reply-To: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Su0S6vvP5UN+kIdty+0Mw/LUdrXLRMYBRfqlF1PFyTg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo46e9dNEgDqxwdjvOPG3OPPVYxTE5F+PW+fFr1
 BMZatS20MeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOOnvQAKCRARpy6gFHHX
 csImEAC8/MoRK0g/LDItzKJCAK7y0sSLs58wrI25p6HC3hXuMZWau/FuPNV1gA8WP4B9EyEUiJR
 aGgcfh62TZzVEWAoFSeYhY/aPEXehJ9kqqBsWgplUWCE+nnM5oMTgPQfaoSsuZhAuZQUx+j5jdM
 XRL0f6EB/Gkct5u6enWVFDEvvyNyOxTKEZz0gvX8DLgKoNiwQ/EwJl8jPfndytegfMTjD5vbfLU
 Wlm1TZ3xtgs0a1lujrGQK8QbJiD4lCnf4+CyH0YXk4ntjA0gzlYVjSaEc7A+WK9gv2OdTUVVA4a
 CSCoEavkHWRYAuVIWoQgIbBAud5XbvtefpB54lFPOElkuon38kgQNWagRpaAJ/MR5G23FhEiW2f
 6Dxtz5YOzJV5ZgXfyNby+UbjNDQ/taDJTU55+3tDRs6bbXMuVLKI5AqPj3Hlk42+6hGBvCxIWrG
 8Xq5kzPzmO0mnB6ayzPkumcvbTOtA5KycKc5+WIgWuoxjlnZZgf+eeEzG6stA/ge3M9xgd7a9pj
 a1eHN4iqVMSRUyhx52YwLNidsPIZZ1ZOfONqDQgDwcy0x59l5oK1FwnS77ZjA0SCDPuN5FFhbko
 mV9StF6sL8AKuSkAjNA540MMBG7iUM0FQzyvzw7IzMA2yGFWjudjDrJse75i2KCcXxHBE0xuJ5U
 JCBMQ0hVyEkWmIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unlike the libgpiosim functions used in g_gpiosim_glib_apply_properties(),
the return value of g_gpiosim_chip_apply_line_names() is a gboolean so
add a second local variable of the correct type to capture it.

Fixes: daaa6964c9e5 ("tests: rework error handling and stop overusing g_error()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim-glib/gpiosim-glib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/gpiosim-glib/gpiosim-glib.c b/tests/gpiosim-glib/gpiosim-glib.c
index 27ce019c30515e474c2faa326a9cb40b1af55cd7..dd56d91735cb3e78c219addf44ccd6ddba7fd0d2 100644
--- a/tests/gpiosim-glib/gpiosim-glib.c
+++ b/tests/gpiosim-glib/gpiosim-glib.c
@@ -132,6 +132,7 @@ static gboolean g_gpiosim_chip_apply_hogs(GPIOSimChip *self)
 
 static gboolean g_gpiosim_chip_apply_properties(GPIOSimChip *self)
 {
+	gboolean err;
 	int ret;
 
 	ret = gpiosim_bank_set_num_lines(self->bank, self->num_lines);
@@ -154,8 +155,8 @@ static gboolean g_gpiosim_chip_apply_properties(GPIOSimChip *self)
 		}
 	}
 
-	ret = g_gpiosim_chip_apply_line_names(self);
-	if (!ret)
+	err = g_gpiosim_chip_apply_line_names(self);
+	if (!err)
 		return FALSE;
 
 	return g_gpiosim_chip_apply_hogs(self);

-- 
2.48.1


