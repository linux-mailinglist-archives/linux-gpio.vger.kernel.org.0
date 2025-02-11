Return-Path: <linux-gpio+bounces-15745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335ADA30C48
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B25A4165C3B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184C1215F42;
	Tue, 11 Feb 2025 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QhHTKaa/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3819A21C160
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278786; cv=none; b=Vk7c977/nxsmRE0PsERe4rra3b914jjW2iKnhlOVfoE5Hy+U/uGfRFMPY8KiiLLRhHneXLfWz5QJcMD1HQ6tnDcFgOdkXgc3CEF60iVt8DFESs5h5dsL7Q1W96OIuLyEVQIaldd/5liVPPJytyJ/xH1ANmXNfqEyyaDep2Ka8yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278786; c=relaxed/simple;
	bh=vXMfyBfCwmcZlImNds2ZpYink8E1dU2CJwjZR7ffIw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/ZjDQnbQt5bgO1kG8Zho33JCtiteLMVnXeucoNgqBIXLScO3O/Ce3tqlNXbT2yU3XMZVinExUkg02OSDPGbYVSawUX3e2fNDotA//PoqgG7seRwrsE2yM+6ttvRa2AeMv9EeGBxTwJ+Zig0nw3nLyBRVznFvwJNflMAR8L7KNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QhHTKaa/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-439554db49dso4994115e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278783; x=1739883583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8qQEfIoZcd5BDP5Ke0I95QrBh0088wo5gqTeCrW8Rw=;
        b=QhHTKaa/KG7pyuxBEtBe82b1MoBJG2JjhQzPWORJ95JbnkBNJa3WK/4/kmrqz/obPw
         fdL64upSrzMVPHQnBhnVylv7kvKEp60F5wnYuPuLxL36K7XGX8Rr0awgzhCx0X8ZwTIg
         554U9WohEfBwGwMe4HF8SXcWLFXCEnwlY+l/hxKEwUMn1IwTKGLb2Fdncycu/kwFG80R
         JnfxrydO4GfGqrzc/ni3wUZBWVJTIZAMWuktfsDmBEH5Kn1FVmkOuIu7zruasOj5GAI7
         Qi/REdGBg55L3vu1lJuIEHvjfDDjLKd3JAj3EvEMg78nzgvce4I4yDhUWWNM/MrHgOb4
         eHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278783; x=1739883583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8qQEfIoZcd5BDP5Ke0I95QrBh0088wo5gqTeCrW8Rw=;
        b=TpdwCESN1f9HQZBCq/eWaIFFx9QlX7+m6pp10eW+N1BC7tjRJvHTuPNbcXyJCy977p
         ZhdxxpZDN53nDtet4oSClj4f/Ok8Xwxn+eO6WImYofSe6rrU+i5gwmOa4l0tTLqaWM9o
         UA4J90IttWomABklQJnunQJuRPvmlyMsCWQ4LUc9RM143YxoTFhj+sXIw7O8+OGfXPDz
         tGTTwHf80HipQ8gkjTayvt1OIzv2iLE2ha1gVJUZ3SOSQN98ZUw3vZfYvJAygZFkqxxt
         uLGkgTXpt4tbtWjVMmtsWRC3IkemDQErx1jkA2toBHuY5ckVzYC7lR6XqtUMF0+0CoOX
         gSxA==
X-Forwarded-Encrypted: i=1; AJvYcCUWZny+WBm0h7ceALfw9QJUa4ZnjacsGUwIpDEpmhsV6X0tyniapSOTyLdVCCR5JbBg7fw9AR9J2WMa@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkWMFMEx3aROwB8t0YJ6BEkvz01jJPf+tMjywJzJblMizW7iF
	Hdf+NVuKTBEhdYwekn9gCEFf0fzRmdK7l21LIjQ82AzaUxBxFNZKw0xaRtWotdA=
X-Gm-Gg: ASbGncuBQObp8GohRUiash9jrgqNA/09F1T1DSE1BA6oOjFNj5kj3OD8FrJFv03qqLe
	IkndR8+SlBrhmPMLF38CDKcSdfHeEFslZX/zOJpV7UaRHBrTL1+xDmgS+7VZBOvDlBZ8kGs9HOA
	VYf0Hrq9b1t3EX6Vg7HbQT5W7V/pSqmfTY8amvQV3h6DfpkYeA5KXDAU3yrQC2d6s4DRHwsOKRp
	vOidkk4s2tGtqcywELWUZa5uXYyMwXIZ/T+CT2wL2RYx/ViEU5V4YMDL1kxnEBeed7SxQZa4Mqv
	Yvb5xuA=
X-Google-Smtp-Source: AGHT+IHtsJiD9q1DTOGuUYTybUn61NdajyZA6ML2JQ1VzrVJ3A2Wd4BSNw/Pkbe/tbz/QZVrb+JAaQ==
X-Received: by 2002:a5d:588d:0:b0:38d:da11:df19 with SMTP id ffacd0b85a97d-38dda11dff7mr8857122f8f.41.1739278783598;
        Tue, 11 Feb 2025 04:59:43 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:43 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:27 +0100
Subject: [PATCH libgpiod v4 06/17] bindings: gpiod: reword the docstring
 for LineRequest.__init__()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-6-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Y3gP+fQVa5ArhZWS64HI2dWPlLIXS38f6AQEio17tIg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m1gE4DUKmjXrphsOh7IPgvrel9r+3Gft32a
 bUL27phs+mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtQAKCRARpy6gFHHX
 clI9D/wKkqVjcti+7zK7hCf5DJW2dfqcREwH0HgU9BqF8sMXMbagdSTsz4A30GAe0JD5YchA3eD
 VqQO0A/YaLZenMGh4t36rTMJch+K2bfQPoGT3dPATEUyHLJTxpyPjZHhd696/pxpZPuOqw68Sgz
 YN/RutLFIKh9wfcgux+NbIuj7xNFYUfvZh3RhPYybEV8YHnpw9ryP0yTOPMP/8b5P/TQOAYX9X+
 wXPILXsIaS0PGdxGbfcoXmRhG4A05+FuRuz6GgMmfQ8DuKgXCf8J02BTIEzli53qNCR/cTuGh/7
 usYOHF6oVX9VZG2mKHWHpFtWPJxzBNapySi8m2JF2uRIGvsVuRwVjd66T/fE0S+IqEiuaksJKII
 D5J50LJu816VBLyAWXHyqUr4/c6IigIz28NUsmoUxSQSlxQTTVgCnJKQT2wLUMLbr9S+xOjphLi
 E+Nl6DhACYWuny0SZupdCUVyzyV67abhw9lK25TFZ+Rf6x7B1RiLOe+5xkuweF+fZBochM1CNAM
 xVOHtf5KkBI3ANYTH4B+2SEfBiy+eggKdjUUJaRpB5RS2qeynjX+N+DgOM/s5ejTd5PRBiE7uXJ
 XpynJHB28pvHExGCEKlU+vGijhw4KSAjqfc03ClVAZEsi9YO6YXl8pogNnYkTq90/rMudV5s80V
 epByD5VGJocKTCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Change the docstring for LineRequest.__init__() so that when it appears
in sphinx docs as part of the class description, it won't sound as if
the class was not to be used at all.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/line_request.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index ef53e16..0220ba3 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -29,10 +29,8 @@ class LineRequest:
 
     def __init__(self, req: _ext.Request):
         """
-        DON'T USE
-
-        LineRequest objects can only be instantiated by a Chip parent. This is
-        not part of stable API.
+        Note: LineRequest objects can only be instantiated by a Chip parent.
+        LineRequest.__init__() is not part of stable API.
         """
         self._req: Union[_ext.Request, None] = req
         self._chip_name: str

-- 
2.45.2


