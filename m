Return-Path: <linux-gpio+bounces-10455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B540F987525
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 16:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B9AD1F22674
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 14:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E63976410;
	Thu, 26 Sep 2024 14:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdyhqOXG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852BC1C6B2;
	Thu, 26 Sep 2024 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727359875; cv=none; b=LS2UbbiyUNDFgJN0Cm/AmpnYPpIaWNewhNgIKXQZPDRFmSnVXtzEVCIg3Wuz91Fv83pMohWqiSRi9Q2VBQ9f3InmHd4QqFp5R/QE93XOlrKVp0R62otBm+urQd1a9DVcOw+uuclLa0eGccv61uUs0CMb8W8aKxkxaTBAsHHt+Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727359875; c=relaxed/simple;
	bh=zX3vHfR8xbWntn/vpFvoUpImdYIX8C5SEnXFhPjoFwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lTs21p1iyVBmQ76Xcdg1C/WnAuPLbyLCY+XGlImAW9F/QFLz0DBL7mgXuaz1tDe3DLwmsHmNdMVjIeCA7tlrxSrQ+rLt5cdsFK1a2aUlB8bpHudX8oiwOE+bWrsI5VCD2mu6ARENOpEuT4AVrUhN++FY1LuyU+EnE19ouSoMe+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdyhqOXG; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso149783566b.3;
        Thu, 26 Sep 2024 07:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727359872; x=1727964672; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDj3iawezG7IzycZoHk/gCboN7MNfLe3KE8kce4C2MA=;
        b=jdyhqOXG94YcXT9vf6kEvAuEDfqyBF0iSNdppXDrfPuidS8R/jkm42spFgILtHF5yN
         N/GvGCfPb/oswLUd2YXoIebV2Gnav+RBHMkgRUSvyuXX2I2MRHe7JLfUYLdylhii/FrY
         3xR3cmG9VSKkNYF22YOYq5RvXqXyoQ9AUIirD9d/++69zejNOf3RzpFS7OK7BfWG6ZIn
         XikizxKVeamdoQCZQPYlHJis58DSXfthGUXjaDwCL0xO9P1J/lHE5RRSyZzAxRN0Ig8f
         SWHI3nJuIMVfVjTxq5oGZ7Cgzzcx2NTHJSkwe5QwBZ39SRJgupa7fbnd/ljKi8gzdGWZ
         kVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727359872; x=1727964672;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDj3iawezG7IzycZoHk/gCboN7MNfLe3KE8kce4C2MA=;
        b=NRHBUaI8sn0i6K4LnWfS9hZuI4iBK5Scag4JJf0kIKHTEaf7YbiPhSJ0ZKSdQy1bIy
         q3pUUEsuq3UNbiDsRESKek9xkf7G/Y+OPIjXAgk6PDqIAEBjv2taZB0eI8HA/MF1PTZz
         e/QV1YijbjdBjgGaLIs0PL2ysNSXflX+ZeGGJN/m150cF0E6QOnA4J7mz+h1EDZxQvWu
         xhPBjdLHpQMgVVsT0Slvm2t2N0pjd+ENY7g1/damtPF94XsJsetarsIuVP1T2oPgL8ML
         tf1c2Zy6OuO1DYeXjZ4RwZyGeIvB2d3JqUMRYBmWcgwBIbDwqNSfDtC0HU0Fr14lcIA+
         pOyA==
X-Forwarded-Encrypted: i=1; AJvYcCVCGdd+qwlR7654fsud01drabpd21jHnvL1u3KNlMcY13M8BY9jkdNmHJcbTU1D8fyNck/6v+pNh0Gn@vger.kernel.org, AJvYcCVnw6KksbcpRKYTryIeyYFkOyi5Y/1uSOMj2B0C6V7RWlRyfnDPlmceGPqzqXz914xY7tazviIW@vger.kernel.org, AJvYcCW/baiGFox+mSY44Oct6cmcZ/WsbM2zkM0rh50cpvMLg0aodBUcyI+hWuj6Uejbps/17NdgFGJYjJmB4Tib@vger.kernel.org
X-Gm-Message-State: AOJu0YzzyC54Fmk1lxpPwu9NQIaoT5zhnhIZih5iPUm+MniveO64GUJp
	hBXHY9pC8n3Kn90CRpk6DZCnD7CE66bPGoOoUgqnaMQowywoHcXl
X-Google-Smtp-Source: AGHT+IEJb7XaJlOyGAXgo4sI5OC/CcIgkPFEegV3xD2va6CSXOVueTeYr2vjusIwWyYsCnGaAlw3AQ==
X-Received: by 2002:a17:907:6d1c:b0:a86:a41c:29b with SMTP id a640c23a62f3a-a93a033ca24mr744169766b.8.1727359871465;
        Thu, 26 Sep 2024 07:11:11 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-4e5f-6907-08e4-04ed.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:4e5f:6907:8e4:4ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776cesm2498866b.40.2024.09.26.07.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:11:10 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] pinctrl: intel: platform: fix error path in
 device_for_each_child_node()
Date: Thu, 26 Sep 2024 16:11:01 +0200
Message-Id: <20240926-intel-pinctrl-platform-scoped-v1-0-5ee4c936eea3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVr9WYC/x3MQQqEMAxA0atI1gZiR8SZqwwuOm3UgNOWtIgg3
 t3i6vM2/4TMKpzh05ygvEuWGCq6tgG32rAwiq8GQ6antxlQQuENkwRXtHazZY76x+xiYo/D6In
 oZ1+u81AfSXmW4/l/p+u6AQMeVcpvAAAA
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727359869; l=790;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=zX3vHfR8xbWntn/vpFvoUpImdYIX8C5SEnXFhPjoFwQ=;
 b=AncAm9sbDoMww99+F+bbJP7+u6lAot2aqR+ssyXHKRxuYz5ZCoHIRGRbFdje/0GHgSTYViWAB
 PWjHHlKYhrzD5IQAeEpVejnBNay4VsoG8PviAMOJHZKvNswj+EL9fNj
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series fixes an error path where the reference of a child node is
not decremented upon early return. When at it, a trivial comma/semicolon
substitution I found by chance has been added to improve code clarity.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      pinctrl: intel: platform: fix error path in device_for_each_child_node()
      pinctrl: intel: platform: use semicolon instead of comma in ncommunities assignment

 drivers/pinctrl/intel/pinctrl-intel-platform.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 92fc9636d1471b7f68bfee70c776f7f77e747b97
change-id: 20240926-intel-pinctrl-platform-scoped-68d000ba3c1d

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


