Return-Path: <linux-gpio+bounces-17170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A39ABA552C5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 18:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3EC188C5B3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 17:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB9425BACB;
	Thu,  6 Mar 2025 17:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RAITNAsP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051FA2116F2
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281577; cv=none; b=TaEdhaFA7YeMESiCLdMVk4H4yCuGvsnlDkMe9aWRK8EBXxYKY4Qs+S0yczYmhmLHC+wx8y78MdBTQ8ZoWtufHGK0gmptrINPCAWDBhoYP5MvCiaJTVooM5RkyjBN/ULJS4s7r2kedZvSe8GewqZPWI2JsLNohe4Q85qCapWwxX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281577; c=relaxed/simple;
	bh=vK+5AeBaZnDdQ23qIss95u9Wtz0NcMLwIA36ctMYRjc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KL+oc3PDUdW60ibAlGoWfWT/PGJCFmhFUsfAxvfVHCQ09/0cg9lGz0f+uNAJls4nIt+JzLdFFPxo1n0GAxaeGjDfqdb8X2lX811LXYIThIS3HlpGo17E5z71s0dI1hd7717ZYlLNvgiur3yWahDKAcbs2O+dt1R0zAx2VCTc9dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RAITNAsP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390fb1b987fso1074680f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 09:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741281573; x=1741886373; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s25kzYytfxXR9pSgYBTx1nhtiAoOiQrPPxSqibwddWc=;
        b=RAITNAsPqVBJjtDqkPPsbXjtp+ZJhU/X3EpH+z4Czl/kpukJeGE+wua9iLm9RlXolb
         3MEENRxwBlk1gdg6iaGBQ/kD+CiVeMVeCXeaKmOzmoESsTIVpUnfbf8ISRMxSbJu6qs/
         3Bgvqsao1+Lmk+ORWOrN/ggGoQFEBFTLeoXUJPmOOLnK/0W1lnA368vB1Z5+2go+j6US
         pMFpZoFA94QgYe+Ff29GvmY4i6o7bDAzLjv6AhuzVidHC0cWireL7kEktiJrlGJtnmOl
         Z1iezHH+lmpBVs1vkCuZ6aG7cPPZc4oicpJEkOkg4vitoNXIqU9bYBppa3QZgDYBnKZU
         CJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741281573; x=1741886373;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s25kzYytfxXR9pSgYBTx1nhtiAoOiQrPPxSqibwddWc=;
        b=p81YtX11LMw6ws1QwQ3rHPCSqV9lDqDgIzjGAYn6j+Aiin0W1uCLyItGYpjKEDt1yg
         KX8Ta0yAPU5tnBVv9aaT9o7Hvvfokfga/2vdPbMxyeNB5QhABoKEs205SuQ19OE4Lmur
         +u+5VDzlbRYFXtFdUH7+1GLRnls1CCK0xQcAwzl8JIdnE7pH0BE/MOgo2MCGGw7BF5tA
         nGR5dFveOHYxZ/D4p2ESqjDBR5sq/o0lBammOkxXwUlpU9DwF3tACyi9EdfD+Ydw6PjL
         Wa98CXF6o0zOHiEdip/hQodK80PJv2aU5bpFElHenviNRbhuMXfQaJOqTs+1SbbYHw0I
         cbKg==
X-Gm-Message-State: AOJu0YwM/YTRwigsMfnU5DJBn55gOd2TE81tvap8lbuxecfskX6H93n2
	3yF6rAg8w+Lw1OjIE1XCL76/QPzY5bHYeR+A7+YbXp3okmSPynxavy3FIcZoWvU=
X-Gm-Gg: ASbGnctyvcdRV//t11aLSdBgf+HD/B7npT75WfCPTeyykBq/Hrr45dFLE4Aea4JBmY1
	9DbgQnSgqYujjRI0nIf7wAiAF3UOhZBeobRwItKJ+pvhycgwftdSKohQ2zIvx0rvQMreHGaP7IA
	B9Vgm01yTg8R5AsEBJBI5+ZJhSygF0TDbvhkgdX05QnSx38oAfGZY1VVMc0tJSDfOc8Lae9yRvH
	MAT/FnBXSf8dcTqjBMpibOdqpGM4/5kdYoJ3mIZXHqBmNJkB48F3lFSF6Ztl13IuOhHS7ZgXGlJ
	/oPAPRUxDA4a5ulT03rUmneHi31oQc1IVt14
X-Google-Smtp-Source: AGHT+IFceWf4XUlh2+JMEehSRrh8c8UjCCcNzqqgkJfstjIdQWR01E3taQJhEZ2K/V5QkbLbeT5bUQ==
X-Received: by 2002:a05:6000:1a88:b0:391:2da8:6e26 with SMTP id ffacd0b85a97d-3912da8722bmr2487023f8f.52.1741281572826;
        Thu, 06 Mar 2025 09:19:32 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ce13:b3e4:d0d:c6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426c33asm57673915e9.3.2025.03.06.09.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:19:32 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] gpio: convert more drivers to using the new value
 setters
Date: Thu, 06 Mar 2025 18:19:25 +0100
Message-Id: <20250306-gpiochip-set-conversion-v2-0-a76e72e21425@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB3ZyWcC/4WNQQqDMBBFryKz7pSojdqueo/iwsRRB0oiEwktk
 rs3eoEu34f3/g6BhCnAo9hBKHJg7zJUlwLsMriZkMfMUKlKq1rVOK/s7cIrBtrQehdJDgfbupl
 Mo2/dvdWQ7VVo4s9ZfvWZFw6bl+95FMtj/d+MJSosR20tEZmpM883u0H81csMfUrpB/HiH/i/A
 AAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vK+5AeBaZnDdQ23qIss95u9Wtz0NcMLwIA36ctMYRjc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnydkgmL9yX3Qcne5FZPyGCuWZGjdy9Mwv/Iko5
 yQS3HezxzmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8nZIAAKCRARpy6gFHHX
 cj6tD/49LKbBzG1FOOlAEKjmVqwPPIyjHH+D+bazsJ1g2e1oe79EM71GhyBn+l91sbL7gJki8e0
 t5dss3vmE9QtinR5fIMGYVeytQazDf514D9UCDG0bfSX13LZuogdTpmudHbQkrm6/hNnTpmJPqR
 7ZqbO0lBQVoP6ETJNDsmFH7IQsmJZHk9l3Ti1gTngmfBbyWk5/UTEaXLuqii9Wf5vU+v8pgruwh
 ihEwaNWffHQF/AEMQUADjusuYtbJ6ZILFwQZFWhOnx82Mhp07BqtYzLJiIOf+ykrpinbsdMQS59
 XEMYYJaWeOjLCWfaR1/HT23b4e4A6G4VSUGE34pWpAjQGHOmh3pqm4DNycQ1mtKR8jJvimcAgZy
 Amc7nBDG0ZpAH10N7nTgzr6eytNoo0K9XZqugvqcMeGqv2Ksihk8AYRhsiHU5wnWpU4QitOMinQ
 /+Xvt+ot+B/TajSDs1DosBWZj+F93Ckj5857qg4SfD+C5F7TyRA54Gxty9Y/Ux2OLeegOgksQAC
 VfTUJdjgjGTdj4WjBcNTIl18XAwBLSNRRX+0kcIxh08XMGiwuG3ddVGGZd2GYfZhPcPxRurvEK5
 MwJjMBJxJbaF5VaEq+hYy7nSU82sRKVhnDwfqxw3o2epHyo0u00oNpDl3bHbYjxf73SiwGGWLCh
 CqT3MdnSygKEk7A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

I don't want to spam people's inboxes so I'm resending just the patches
that caused build warnings. The other ones will be picked up from v1.

New variants of set() and set_multiple() callbacks allow drivers to
indicate failures back to callers. Convert more GPIO drivers to using
them as the old ones are now deprecated.

This series also contains some additional refactoring to the affected
drivers wherever it makes the conversion easier.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- drop patches that don't trigger build bot warnings
- rework the gpio-adnp patch: we need to initialize variables modified
  within scoped_guard() as it's implemented using a for loop and
  triggers warnings due to the compiler thinking we're using variables
  that may be uninitialized
- Link to v1: https://lore.kernel.org/r/20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org

---
Bartosz Golaszewski (2):
      gpio: adnp: use lock guards for the I2C lock
      gpio: adnp: use new line value setter callbacks

 drivers/gpio/gpio-adnp.c | 134 +++++++++++++++++++----------------------------
 1 file changed, 55 insertions(+), 79 deletions(-)
---
base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
change-id: 20250303-gpiochip-set-conversion-736fb6548975

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


