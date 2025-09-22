Return-Path: <linux-gpio+bounces-26438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41603B8FDC6
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 11:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A543E7A581A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 09:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD2B2F3602;
	Mon, 22 Sep 2025 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SA9CVaB/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A72EDD63
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534855; cv=none; b=kgyK+/tTq1EfAMeRDYb6pqW2Ps3UMeyiUIUJ2mjwDnedJ1H3feWRLV+qbv1aBIFDi58+iiSAk89rFu20vg+TsKPkibJVKk6FMfT9NcRXVyPsNwUoSF+adfIlk+CoVmI/dtBqf9E4UEBLz+OvwsZRROXE3Jg7iS3rqX2rZd5YUwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534855; c=relaxed/simple;
	bh=21rEE2DCE/iddzs0IpsByDWe6eGpN8QRk2XQm+cs0yM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lMscymFgy/uT48Oa76Bwq6G07JYUPVa7+bQo9uk6X4ml8b5dQedPTHuFOWZfdNtXKa1Q3PqJRB3fN7mTb3V5WGuX7CiUSrcS0WgzflQIM6FToi0/9IocOqpQpdM+cStp3i4b2ZJRunSBPR5Bg6p/3syCPUOdjzSxKRDWW4SdXnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SA9CVaB/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46cbdf513d7so10079405e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 02:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758534851; x=1759139651; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jGPn1Xmh0w8VB46FGvjEhkh5GTEnQzoq2sK6lBRh7Sk=;
        b=SA9CVaB/see5U6kHFKsPl8Kxzl2Gi+Fg8/zuCgD37kPD4DFoHC4n00evKAil37s4Ce
         5HqyBhICFK2OXZqeeAP/WtgH7EFGHwW26DR1R0QQEHOuPolH91013wM6EpxBtTLNmNo0
         Gqx4CzlF99dbng+ouyJVKGvnd6L1F/AhDLYx9H4Kgj5osFZpEy4o4owvzyDza9OJJ4ru
         G8p3GMzJdSKD6/esSiKJKY2YbqxGeqipucHrGRIPsGJ+26PGK7AHeFyxdtppAknOXffc
         26djNarE+ANWJsTsxQ7VbxSJHhGrk4ad5qQ7AAF9joErF/VMo3CwlB7TmWYHtaNZ9biT
         YDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534851; x=1759139651;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGPn1Xmh0w8VB46FGvjEhkh5GTEnQzoq2sK6lBRh7Sk=;
        b=w+PRGVpSlgajWABSzPVybZ4LHXUQdoPVP4al44CgpDgjPDwATHmfku2umqFdFfFFo8
         U4f6pbXdA8xf7XWWZ3138pvI7Nf85FqBw3x/MRU3ct7bASn55ZtiHVcFZq33UvsR4QzQ
         qNQH7U14SYeMeR4sy+xWnpQBTjEnvYMZl4Nm94IXOccP/VPwjIuEeFZmpstmjBXwzZ/P
         BwCtQxTOa7WgkgV5+zXkqP+9AwsxcyGC90j22nQRgbDJvxZsx3ueAei1o6BgMfMrw321
         5Wmi/rA660i3l/7voKUbTjcax7m+u3zRyOb6UBUVD+bFTvg9IMeJM/Ye6chisCkUlRxv
         eQjA==
X-Gm-Message-State: AOJu0YzA/z+RcZ/Aj6dxwnlO+r9JpsH4oXBEYP2egox+LpDUcjjKw7Bk
	QSGhB4SSL55w4bouZD7cN77I7aU8yq57gKyRBdr8WFbBKZse0YhEoTEQvyahhKEa3t4=
X-Gm-Gg: ASbGncsKeE3UU91a3DrNn7IBmBDBqIUgFe4BSEhpIoK0tySTS6//fFOBOFuKeWgHqGk
	3u5TSlb9PuJkbKwyovFZwbWNLzkC2E7X7OOj/C0H3EIqPwhWrZLw/2ZcnfnokNIrNTTZTqLx1p5
	TbuWlX3O4RcnMWVG6RSSrh9koN85X1NMepy9/VIrvbNoyscJwWnWLquvupxxCLDBw92e1SsseM5
	YSXkybBn8jvFZWsnMcLMdVDEzS5t0OfDsaQus1CPzkFynh5I6R4Ao2H4OtrEB8oQcZotbkxe4g8
	0kavc2PG+8nvdEOD/K1QrsDbHMVEA9q4DD/Kxn2fvCa8PV6TBZo+xfwBtwQsNMY/cmura396hBs
	soMlnga5gWbvwnSSH
X-Google-Smtp-Source: AGHT+IFV6PF5ROv8PYlDC653XbZUMF7iQsokHzi+2spiCTtsixbLzmMM3ODzfEB5kVdivnNPOaRWbg==
X-Received: by 2002:a05:600c:1c83:b0:46d:45e:350a with SMTP id 5b1f17b1804b1-46d045e378bmr35470155e9.17.1758534851305;
        Mon, 22 Sep 2025 02:54:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:824c:ead0:65a5:c51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-467fc818e00sm156496835e9.0.2025.09.22.02.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:54:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] gpio: rework debug macros
Date: Mon, 22 Sep 2025 11:54:01 +0200
Message-Id: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALkc0WgC/x3MQQqAIBBA0avErBuwKYm6SrQwnWwWZShFEN49a
 fkW/7+QOAonGKsXIt+SJBwFTV2B3czhGcUVAynSaiBCf0pAx8vlcTc2hoSu7Uk1WnXWrVC6M/I
 qz/+c5pw/4tQD62MAAAA=
X-Change-ID: 20250922-gpio-debug-macros-d37201504cdf
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=21rEE2DCE/iddzs0IpsByDWe6eGpN8QRk2XQm+cs0yM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo0RzB69gCLNF573w0ylZ7bw8hyh0cXl46Vb65c
 AoAIYvo1zeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNEcwQAKCRARpy6gFHHX
 cu51EADMcrArFCtDwtbTs2nHqsAF7YgoVixhxBKb45164PTD8V3486eqhu56huapMWLts/PcISH
 9yEWL6+rAP7xlBEE+fCODX68tH3cz9xiNGXGi94jdkLVwsNQ7XUrCimoJvULPbvLndt39uhtDLu
 u52P/bK0Z947C9mdpxQ+LV2NlG4ZUD2U8MwqKHvFGi6lYCtvuOgSo9OmGINeOSrK0xLAz95VXbj
 aB3p+izwKtFu9QvgLCyZaM3tU+siK0CW9O8nfzn5VRGrfcMbx9jSwtNM+S0Tu+v24jr7p6xhuIq
 HxYpmUhQMaFt/DTa4hU2nnxyPVuRzfxTdtuOfVhe9nROqlKabpAVaI8WnWMJMXuEOR+8Wj+RFTQ
 JzTqv2Y4b8WEllzxO0VlsxRVr/7TLYwK3FZUqwio0NaFOg6Fa3jbRH2akAY14Bcy5AiQFrFLjeB
 HyfvytDRRO2SXfsMrSb32SWVYdbrtbHFQ+hy3U7KvzQ02P8l4z25ibyr+3VRp6o9AC6dT9jpPO+
 OKxiQMEL19OI13pt72hkYQNuNGmcnvafnMMNWOlyW+wdPvDpRk0yh5Y3uUogtRek10BSkvRga8W
 wgP5/fIFrcC1AG43xC4Z7PJY/H99GzA2+Vy1TmOpcTkmW5hoWc9Pm4FVmtn4rvXsJKR072926KF
 Kb1sEzq7M7uGbBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Rename the chip_$level() macros to gpiochip_$level() and reuse some code
in macro definitions.

No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      gpiolib: remove unnecessary 'out of memory' messages
      gpiolib: rename GPIO chip printk macros
      gpiolib: reuse macro code in GPIO descriptor printk helpers
      gpiolib: reuse macro code in GPIO chip printk helpers

 drivers/gpio/gpiolib-cdev.c  |  2 +-
 drivers/gpio/gpiolib-sysfs.c |  2 +-
 drivers/gpio/gpiolib.c       | 88 +++++++++++++++++++++-----------------------
 drivers/gpio/gpiolib.h       | 41 ++++++++-------------
 4 files changed, 58 insertions(+), 75 deletions(-)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250922-gpio-debug-macros-d37201504cdf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


