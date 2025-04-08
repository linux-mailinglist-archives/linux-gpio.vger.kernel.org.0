Return-Path: <linux-gpio+bounces-18445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBF0A7F68E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEAA41891D78
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326E92641EA;
	Tue,  8 Apr 2025 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cS8c49fc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428662620CB
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097911; cv=none; b=kQQtlftUuHrK/suzrm/MvFixem5MQFQ7mAeuFm6S8Ix7A9Lk8ajCHKvy6R6phCvRtf3+eeAnmG2SGqgpQm9ZiFOeMD/tWKJ2oGSEO5KxFmO2BJM3qlqv8/0EVb71Q7IXFkBuuE4qT0OL32ox6y6NGp82tPJHv/3b6X/BbzP97sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097911; c=relaxed/simple;
	bh=odvVZUrS3dbzVw9lDvpqQQ/85WCUEdMbQVAmeGMYZGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFXTuAQCI8cU8jtljQkCFQrTsNgcNW9UEE2wrC1HC2c6IGuInzJwWvm4blNbWbLu0V5LJ7MVUI8ia4STfqrfTj4H0JZgu+kK5M7pSb27RG0e9oNKemGTrxeVwscdGC0ETIflD2VlopXOL2XcspTuFqxX/wSY6v4/wXegLuo9nm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cS8c49fc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3078111f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097907; x=1744702707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vM8Qea3FMtrgDWi17clkzSyShy7K/VLobQ3OM+BTpzw=;
        b=cS8c49fcSq74m4mT1naL6gWvEmKjSeAr7iW2/xt5Nk/3Lj30pEIpnZW3iAnFq2caxV
         ecdhc0IuzAgjU4zoWZvdre7KT67w4aqAlVl4NAcVn/tjQ/jYaClaBbRa4Qd83AMaMgYQ
         W4QmfWMhbblZ37x2z030M80yUu1ue3qYQEf5wHpL/RAtWC4DhQ56KK5xeL0lqcpf2pGo
         57ab9YayAFdA55lIcifcJrLl03yQqwK0UQ7s8wOJEJeUSs6NqgVhyVC3f/VP269W0yE0
         plWxOUxkbncvsFVS2IahiXM6KYc+lLbc+Nr8jTcgfWQifIU7axjttaH1R6N7zcIh+FNT
         E34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097907; x=1744702707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vM8Qea3FMtrgDWi17clkzSyShy7K/VLobQ3OM+BTpzw=;
        b=Sd6X8i7mZYRLFQ7xEhqgMPTNM6H6/sR6Tgsyf+wxJCY6vSxxO66zo9OAxtwP0IY2DG
         myH3qUpjWUM8/ijWQfx6YQDby4vWvl42O6LPA3Fp07Mb6wVguXjHgsRHWSfdjofcPcdc
         6jVAVE0dsUIc5JLa+n8VOmFc7MfMDsxyjUnmPVnqpPCmar8Ds3RfSrqApYYTrKXGi5cO
         myT2CuB/Z47zFRi6BqnwVjUicE8PSRAPK750PWQFme1hXGiA2+pQTipp0c/mCCJ37XNe
         4BhbxQKWehkCzWs+K25xASYKUtQTrb1CrHwTpLpl80iPEruUnG75fboRlwjnfR2zZuCZ
         iFfg==
X-Forwarded-Encrypted: i=1; AJvYcCU8xY69cYRzOZ2P8a9ttoTJL71xDHCtBqaVVyBI/lFvXfw5sSFxLRR3/tB3MxcXGC3z5RZS0tME5bZc@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNx6SlTACW+96A1CEujquMJwq29bVY9bHnmhmGshNe84RJtj3
	oeMm4zEF7aAEgYqbLO83HenIXxnhluuFkp1CcXRnVlG9y34Y5Csft29PfzR+qEo=
X-Gm-Gg: ASbGncs9/YaCesnK1YZmn58FIHM7Io/nXAoojQaSKaEo72CNtLlztlpKi42TOnY3H/7
	Q3cDod4YOZ6z1J67r5EAASjzN7H9QX9MNXHv+SJ9Dbgjb/RJ/LBbU1XcfGTjnTIqruRtbHpsu4c
	aJqrsuAIQ9Znx4EhjvNRryNUvlxgl1I8aF6HJMj9fYx9wk8BfR9NsGcbcIys/wR844L9Fed9xSS
	IOCa3vvqJ627iodW63QD9fk7lTmXooqOD5r9rDyGXNxsRWekeUVDn2+E+OVHloLDQKwUxxsPzDr
	16WiEm1iL9SU3SYZHVFN1E5nH0pvsCot98epWcEZG830NEMb
X-Google-Smtp-Source: AGHT+IHG4Z/ZuFphLMM4BLXvIJni9vAF4RZfbvwi7RnlWhP+eHtEE8msr2+s9dSB8JIiVDJomM+vzA==
X-Received: by 2002:a05:6000:2512:b0:391:253b:405d with SMTP id ffacd0b85a97d-39d0de62927mr12155263f8f.41.1744097907542;
        Tue, 08 Apr 2025 00:38:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:20 +0200
Subject: [PATCH 02/12] ASoC: ti: davinci-mcasp:: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-2-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4r1nNQSWxtmth2sTRGpaUPwZfF0gETP2bZXWejf1QY4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJtxz6edE9QBclqAj6Xs4+ohVR6fblexPUix
 T1DRmXYfQCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbQAKCRARpy6gFHHX
 cn5dEACtbJfAMR6blmJ5wZcZOFlii3iInTRZzxbZjFSWOCktnBrvaRB+jeqQ3IZxcM4fzKhQHs6
 N3KJTejg3lD5nx5JVxxA9FRJDkXlDOzpJa/5/eobsWgmQOtYyD2edbPb//P1qw5f0F2G6k+7cET
 CQ8DZFfEvRtULbVjWYkufogdf6u+2oPkLlsicSTyuH5zouYuKanlMmQXwaZntrm4QgRhe7m8q7b
 adhDH5smg3VjX3GqZBA4BsfI0fLWJHpp8gtVn9ck85B/l4hXhaoxcAv4EaOZiDSamljQOk6+3l7
 D8m7hQTMuB2DmVTypZe4f6hptW+oiIqnrhcO/8dAZZJFBgCYnV11Wdbx9tZjiAvT2yvShU9H2ae
 GvMZTUu8277850aaeuD6Ig438+uY3Z1F7TtVBBRs/gurlaEcl+hHP9/OfOWVeKf0yIlXFq4H0FK
 jUCe2rYGiEzQRrJUHgAAj3tY9t0Jge2Yev0Lv9LebKQVxNzB1xVdM418dKMTQOh7xe4meV9YMIU
 asJa6U6nBxsZyJs4ZZOS7TWzLJTUssSXguWW7ITmLEAwavxzDfV2OlMU04xULphX1f6QaOibmjt
 +kkXlVFP/GA+1mfY89eommtJmf2iBx/O7Z9j/vKwN9LfxJS9v/hK57pPhqXVat/pH6Cg/ATvSJX
 RlU2bZozo648+fw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/ti/davinci-mcasp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index a0b8cca31cba..caf1887cc9d1 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2157,8 +2157,8 @@ static int davinci_mcasp_gpio_direction_out(struct gpio_chip *chip,
 	return 0;
 }
 
-static void davinci_mcasp_gpio_set(struct gpio_chip *chip, unsigned offset,
-				  int value)
+static int davinci_mcasp_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				 int value)
 {
 	struct davinci_mcasp *mcasp = gpiochip_get_data(chip);
 
@@ -2166,6 +2166,8 @@ static void davinci_mcasp_gpio_set(struct gpio_chip *chip, unsigned offset,
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_PDOUT_REG, BIT(offset));
 	else
 		mcasp_clr_bits(mcasp, DAVINCI_MCASP_PDOUT_REG, BIT(offset));
+
+	return 0;
 }
 
 static int davinci_mcasp_gpio_direction_in(struct gpio_chip *chip,
@@ -2216,7 +2218,7 @@ static const struct gpio_chip davinci_mcasp_template_chip = {
 	.request		= davinci_mcasp_gpio_request,
 	.free			= davinci_mcasp_gpio_free,
 	.direction_output	= davinci_mcasp_gpio_direction_out,
-	.set			= davinci_mcasp_gpio_set,
+	.set_rv			= davinci_mcasp_gpio_set,
 	.direction_input	= davinci_mcasp_gpio_direction_in,
 	.get			= davinci_mcasp_gpio_get,
 	.get_direction		= davinci_mcasp_gpio_get_direction,

-- 
2.45.2


