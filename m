Return-Path: <linux-gpio+bounces-8053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F42927D3E
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 20:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 126231F21C1F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 18:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5402613AD03;
	Thu,  4 Jul 2024 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIYcCoW3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978A0131736;
	Thu,  4 Jul 2024 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720118219; cv=none; b=r0UwKYOpyizfrp3wKpBDIb4fXIS6NJD6XrVeEjKGgbfpQQdf+7Hw1Sb21/nrlHlQ+FAeP/ab5hWMdNhBd2Hu2vmQaD3fNvPvpFnderavL6YDDVN6JZQrY71afaLNN+sG/7eSggMt7iZW68sZVlMsVjCsZWbjKVn55O0+P2f2EAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720118219; c=relaxed/simple;
	bh=Y53Q/T/fuLbEh7wWjD5G1enpjBzQbtnONr6j89ypyW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPwv7ij3U/PF8UgEvzQjES1taV0kqz4u1ptqOICdda5NYvANOT0BVb1EPoVd0QBw9swQUmuABF51bf/vQHsiNfF4QwF3vNH4iTtkDZVSyB4AuwuuCP/2j8gC759RRH54g0d+yLNExehqU+KJABW9Jy8Rl3usE7353THFAJPx4wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIYcCoW3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42562e4b5d1so6123235e9.1;
        Thu, 04 Jul 2024 11:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720118216; x=1720723016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3VvNKkzsu8gPwxh9V6GDq6OKl9DellqqDzdq2dyxII=;
        b=mIYcCoW3S6vapgrVkYQXsUVrnl6devvvcX4Ic5WTfWNUMs1w1cEWzWXoU2YphB89Zz
         OJig1qLKqBHmfm0FCRc2cLtE6OXBwTA3Tj+N+rmw7korYnBXiZketkRnJoLl+bTz3HYB
         yHkapyX5ogpHL8iklC8ZVXtoc/7C+GNiNpUI9jbDYN9YNNFu41vyXBI8wr2IY1OrcRE5
         84mp2/UHD2xqle9SoZQPHN7jc48/VtZCBANDnOlOr3xib+yZRJ92RegWA0g4ri1Ec7yo
         HwBecXg6hlLKaugHnJxCemP+vk6x6rjY+dECUGKJFrlDmvk6ULzi1G2j3W0hsI6ckY7w
         qV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720118216; x=1720723016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3VvNKkzsu8gPwxh9V6GDq6OKl9DellqqDzdq2dyxII=;
        b=j5DWWXqwAp+Pzepr2ZTxXmL4+fPUiBKnbtVgg4F4D1gYMNIH7VzVpnbwv8hYSkxxbV
         iSgxbxH4AULi5+a3e+V7XdHc6VPEy9kZRYLhccRAMxvmcXcl3XX8aqLaLrqEumSGiwL8
         q+hRNjXG9VLNxv0LVLOkaGVEu82KPjb3D6YeFFrPNIge3/X7zhljw18XYyc5h278nB0B
         7N3ZLY6UHJZGU1/ch+1kVWEQZR7tHtK8C0FohWW4cSZ7IfqgS1WWWBRm6mweaKclWXq6
         dshuCy8U/k/XEGaxiy7/K2PH2zqh4WHD9Uk29bjJSM713/kxm7gJvhExFBzZqxrQtiFd
         DiHA==
X-Forwarded-Encrypted: i=1; AJvYcCUCOgHkJA2n5t3DTEz0wCNXGj5M0R8bTNgPGhW2fqR9zhY4ryas9oRkw57RaSouVOxrlbkcwf9y/D+YrG8FgonkyoXnN+WWSvM4Mdfu
X-Gm-Message-State: AOJu0YyJzboHTsqW9n4krVsSHJHPGxurYHIOPnAubiKQdx8xSbRWFzl8
	zTRcb4Nf/n45bAr03CO9ylLkh6PKopW18yjODkvZ6J41R0jxPY0ZHvGHl9bn
X-Google-Smtp-Source: AGHT+IHGVFN/WNB1xDM0kbxb0JUixv8Fa00JriXAi1hZAE6k58GN0z4DMPti3xBxP1W/R48nEKhwNA==
X-Received: by 2002:a05:600c:12cc:b0:425:65b1:abbc with SMTP id 5b1f17b1804b1-4264a3d96f8mr17468195e9.1.1720118215730;
        Thu, 04 Jul 2024 11:36:55 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-0b06-a203-2f25-a0f6.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b06:a203:2f25:a0f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a28333dsm33823075e9.40.2024.07.04.11.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:36:55 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 20:36:44 +0200
Subject: [PATCH 2/2] pinctrl: realtek: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-pinctrl-const-regmap_config-v1-2-9d5570f0b9f3@gmail.com>
References: <20240704-pinctrl-const-regmap_config-v1-0-9d5570f0b9f3@gmail.com>
In-Reply-To: <20240704-pinctrl-const-regmap_config-v1-0-9d5570f0b9f3@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720118212; l=841;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Y53Q/T/fuLbEh7wWjD5G1enpjBzQbtnONr6j89ypyW0=;
 b=szkwson3fK65ZvDNZzu8hNCgmpAZ9YoFEsE/eFKR7IpOpFGq8KIICZBiJWavFKb/ZHBlvCiaC
 rxFojJTqHGwBaRE76kn3zxVin+tYJ+JWGN1AepHZ4QM/is0OnXXVZeF
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`rtd_pinctrl_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 208896593b61..244060486332 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -533,7 +533,7 @@ static const struct pinconf_ops rtd_pinconf_ops = {
 	.pin_config_group_set = rtd_pin_config_group_set,
 };
 
-static struct regmap_config rtd_pinctrl_regmap_config = {
+static const struct regmap_config rtd_pinctrl_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,

-- 
2.40.1


