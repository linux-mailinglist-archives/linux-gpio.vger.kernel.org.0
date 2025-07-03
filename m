Return-Path: <linux-gpio+bounces-22694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 828CBAF6D2A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 10:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38B0F4A54FC
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 08:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5402D1F7C;
	Thu,  3 Jul 2025 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LG6H2IZc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAD42D193F
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531856; cv=none; b=Z4UIKykeWpuw4MdRv0CUGz0NVFPNFIavnqMRKBVYvCGmy92hMV/bXeklsHS739oCSLbXFmszMmAhtbNlIvdKWx0KhhFGqsqgI1BAOKtGrFOiRSL6W2TnzQ775SuDYNIp7g6KuBJZcrWyBgwDK1WvHWk5SG9yYHXnNtEawL3G9ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531856; c=relaxed/simple;
	bh=EL7fxnWzACdRAlqj4sFLAfEFjyx3XEo9qg2XmEeP+os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FI3uXFbtjtl8/765rRrcmI4HXBbpJwxyGEcG3C3qQTGrc47ovc0XJmXLTeeN28WLmMlWEEki/gv1YPnqVMMDAfTEGqB8MU9PSA+njZn3xRrkxdBjYjvJtbWqQOJVWK18CMXV5/BldiLZStit+JyLAgrGTin6mUzgiwH84Dn3DJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LG6H2IZc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ce671a08so35055905e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 01:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751531853; x=1752136653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsnJDjWvIyMRZmla0dgd2yCyYBbavOFlWHTdn8YWhKo=;
        b=LG6H2IZchbVVabyQoQ59afP5JoWgQpqEZqj6eSOoOWUrnJbZGQuk/KWcCiyyiKdmBb
         jfQGFtDJHz8rsk2YEqXkuMoNRi5UwbnXWZPTB8jAhO6+/OvWBWzUXbwYUF/OdsyBCROK
         8SeiDE8+74tXhBOZcSH91ixZLIJ7TbMRNv56qOBGMUgJCQ/uugcST+OdhkWQd1pY7511
         tW+Fa1IZnCwatUKjYZax8Pws4uYCOJPhUq4hOL0Sn7vwDpsPQwLLuCdGOlBlYALX/Efl
         OhYbZ3ueHWCnRuQWO+C4DzOAoqfQhdF+P4MM/avJEJrK9LeohA/GAfULAlicoZqD5yRX
         j93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531853; x=1752136653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsnJDjWvIyMRZmla0dgd2yCyYBbavOFlWHTdn8YWhKo=;
        b=msQ2xmGdIzrECla4vdIwf9doAJX+7bem1in9NEedTQeivmf0mLIyM8ZfA3LoEEgOtZ
         UCn3v5jQ1Xe+knm4bxaQTJ+aCwtT9Tb4VciHLlBT4N4UAdysgid1pucni7TDu6Rz3Hi+
         Vq0IHD6Y4cnQ/m5KNuiKRS4dzu3OA+k64r4wM9WadX4Sg5HQXQ/l2436szuJmv20Oulm
         THgUnrur7MsjCUiE0p6t1JjfVO+ACIkj5nd3N8mHuAONd3xI18+krdaZ120wCXm63UpE
         VZC2w30J16KjGDrRdBIB6x+IlD+2vwfTl8hpbJm+5XahJrAQVjze5MqIK7T0OQ9CqIEy
         emoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVFk/+MkahITF1oFa4pY04VX8ZF+GgyyvTRcZcYwhW3mepGqccHLYHgz0+h2245gbFnTRvfXNg7vMP@vger.kernel.org
X-Gm-Message-State: AOJu0YwcXjuBV3WgHfDmFhLtZnQgo484sbIBzSlk3gwS+z7iZEKmyawO
	kcsWO1IIImrU0xDyguhH50+4dpTiGdrPL+WCmr/RaSiqkvREB6H+YgTdqAOlmK9g0d8=
X-Gm-Gg: ASbGnctL19wCwJcEnnCdwutYZ+vCJR8yg+KzMahZrh29BV+AM34OTgLxd6z+Yni+NRZ
	Q6XG8rWFTc/Uxksjt597BKCpV5Hz4i19r7iO7uuPWqKC7CY2xVmM52qLlVGj9xMuel9hGk+qjyp
	0LhwkvvJY5Cq4HcaDmRMGLYcgUkRKhqOzefKq9lydk15/G1KvbHyBXICkjpYZHjh8LOG0NlrQZL
	hErq/mAiZkEYsWeRfylxR+jF+qXzDn1MtdEwEOgngFLsmSXzJSgjqLkMbYLn97d+XlZ0LMVI5T7
	WaPs3BQwg8JRN1vOvyDWTwm9rlNyiFysoucLTxfkr6n2Reb/+eSzYhGTnIY2OwukNLuvBoUP
X-Google-Smtp-Source: AGHT+IFN8lHhDsBaVBn08/7EGgHGGjhNW+3EUJm67DCN2jPsbrvQ0jZZpq4c1aMyumtQlUjkxIwQ+Q==
X-Received: by 2002:a05:600c:45d2:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-454a36e662cmr63009655e9.13.1751531852971;
        Thu, 03 Jul 2025 01:37:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6c62:b70:3f0c:f58c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997e24bsm20046505e9.16.2025.07.03.01.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:37:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] gpio: palmas: Allow building as a module
Date: Thu,  3 Jul 2025 10:37:28 +0200
Message-ID: <175153184595.16233.13871397507891878072.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702-gpio-palmas-gpio-v4-1-26ba48252f27@gmail.com>
References: <20250702-gpio-palmas-gpio-v4-1-26ba48252f27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 02 Jul 2025 13:22:51 -0500, Aaron Kling wrote:
> The driver works fine as a module, so allowing building as such. This
> adds an exit handler to support module unload.
> 
> 

Applied, thanks!

[1/1] gpio: palmas: Allow building as a module
      https://git.kernel.org/brgl/linux/c/cfbbf275ffcf05c82994b8787b0d1974aa1569d8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

