Return-Path: <linux-gpio+bounces-23008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28494AFEC36
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B056173298
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972FD2E7170;
	Wed,  9 Jul 2025 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BcaLtgSK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE402E6106
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071952; cv=none; b=Cl28H6neoFdpIquxNnSy/uXbLRh7A5ZTcMsWDDy49hZdGAn33yLRBFZWJrsFM97PaMrFx7KAPyrgfuPCp+4j29bNzCLNcgzEzVzO2MjtLMu0chuOMVaimNuG+uzndkwJLeMoQzZyxuWnAru0ver60VrWt8klsxzBsCMdETu4Pwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071952; c=relaxed/simple;
	bh=YU96noccr+Pkr/3ojK5mbBvESMGpB63SYl8ohE9H85s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojp5ti7JEG0hhwjVxE+e/FzKjXkxyG2WbhO5dnMNaCLaMECUWFvasAftHqFKGfBa+QoR7vwY6aoJl0+whUEnUc6U5qOaCc3DQ4JsczIYhRRuHA1u2gld7pQE2iphMzAFcVuw49scHU2imd4L8K3eEuC7vR3IxU48NIWVueI/t5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BcaLtgSK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so5090750f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 07:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071948; x=1752676748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxpOHy8IwZabJSI9Yo0OtEtvTBr2VaAlbxuciXaWN/E=;
        b=BcaLtgSKNq75NqDB0yhoeDT/f2tIif6ug53QTYPGc1617mbBN7w9guwG3Ad9qqAMSu
         w69vFsIa9T1ai7VbysDJ7CNH5A+/ZYD/x+U7mp7X6stwbwZ2K3H8pn9bghKVVxsPcKBd
         H6JsP45UQXYdkslmzlN0OfRMiOXeMSA806qJqoRHwsqEGkZrJE+1zFkZg+rjUAywlJVI
         QHjNBnidgcwg9Ooer3GBhZSKUK+RsZG8e+hmRtvYG+w+/3r5qd6PGhjwAS5XC8Elfyf+
         EtsgiPOH/yfDtrlEDzqXPJBC+N2Q12kRsshIUT1h+icN3B8icgpDeBxs+8cyCsBziZm5
         A6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071948; x=1752676748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxpOHy8IwZabJSI9Yo0OtEtvTBr2VaAlbxuciXaWN/E=;
        b=Tb/sEyDCwbZ9Io0ZT+y+JdksLCmfPA20Sg4Iy6phfDfDT+17bxJ+9fsIbjrFRgWcMh
         Cmjcygp56EqUuF7nBA+H6VYwBXEZCTCLkIoNFth7GWcqZPHRUcj7C2UfPn86/LsFjwMB
         9p8kyU/Efc/LHu+SuI1jZnZ/nEIiC3AdoH+edYB98bQ53uD5JpxWsvYV8wvxf8Bno8XH
         B9c2K86JcsTMHf8myNLj+pAljbrBkpv3pU5dp+pNXArsrNxcr/Y+rpVjpKwTjCpxc+MD
         2NFxuc0y4kd9WA2sScrL1LTFZ5Hr1q02R90Z7gzGXo/w31RYQ1xaPnirhQDRRnYKX5wg
         b0GQ==
X-Gm-Message-State: AOJu0YzgN1B7OhUJL1vflrra4fZ8ItAaJJ0davuEPPP4gNYm4wpQXJnj
	ZoFCCO8FODwO3LRWsmqM0Cujlh9srvfpseT5u/RY5TQOsfUTgovewfSL6KN2mDFmW248FvXaa8T
	2SrUyiKQ=
X-Gm-Gg: ASbGnctTr13RU403uR1WO2hd0U4kEu7v/OAhtOKZIPE2+5bT/x54VlzU1NAYzq0AdhX
	sGBeg7BgomgKjfCh2/0QekKUsszkXIvlyZlW6cwLY6SPmli0bBAdMy+26vk7WR/TiL7DU8yENzP
	9Uw05fWzkJAwwg0c8TCdyeLjTqqch99LWhm5qT/4BxPGiQz9zR8DT8x7oXgkknGGVUg6SEZvxVX
	ExIKHRsaknQJ1dOfKjmbg+7dA8P16TvjRAAU1rW9UyPyFfv8StvJauqrdA6GwQVhMQC3ljj00MS
	TiKgK6apeyPngC5TLCGAcUSjqywHjfCJGrY4YBw8o+IcoIsrx5X1il8b1FFn6IjFaA==
X-Google-Smtp-Source: AGHT+IFEibdkioVzNOuoSWG/K6hY+8pugjo2P4TOU047si8DoKyy092CWV0oJfwFHRe0nnQ03dyytA==
X-Received: by 2002:a05:6000:1e4c:b0:3a4:f644:95f0 with SMTP id ffacd0b85a97d-3b5e78ffb54mr139106f8f.54.1752071948244;
        Wed, 09 Jul 2025 07:39:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:38:59 +0200
Subject: [PATCH v2 03/12] pinctrl: equilibrium: use
 pinmux_generic_add_pinfunction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-3-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4MVQFwNoIRV/Ud/LLyOAZ+93HlIl7udseweMC7bu/h8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8Fa4XZ2ghW/kayIDfPhlXAL3YlqwU6Ngi2v
 IjwAbZzzbKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BQAKCRARpy6gFHHX
 ciikEACCh0LQNciBTYPnmuwa2YZbkQokhjIrOxRr1owGq03CeZiPYL7+ysx6BmRb3t3mKykP7Bl
 WfzTGgSSZeDscfRF9rqRRxKymVUakctYhZNhqABFOeSqnK0w8mrnv7+1cRHSt6Dwg22rPuBknF4
 XaVVUG8i9wnEqaVUEXD09i6hE2kGV+ssquoodS0BvjBJar9+ul1V6vALqdLckIArGjCowy80OQq
 SpXXbbDfMJX1K33wbDYk5z/uyvbn/GVYEGF48CNNV2lV9U0F2BiD6hArqBSnBseWrd2ms61sPkt
 +Nk9r4zgJgQ6KT8pfN617hro/Wx3Lii1FIAYx6C41Foj6mKN8bYikDM4nDUSsUSFX2b4i7U8Vx0
 mRGG6OkZ+5NKLe0K7eQpMqk196ijN+RgyYDmDW29P+NAHTGVPaEzxMQQURYvhJ5Qh3wnBk8V2p6
 DRH2sqA5yI+y7VXTY7nJu9FayLkT4zpGkHj0YeN/uQ+w+CC+lBFPC6ouebiniuiHiTRc+vM9oLq
 eNED6Gu3+VQKpwaeJbAw7ZFJDnn9m++413EQZxdxfmy28IAgFw+6qxZbYVMvU7jXxBp2G53lwg6
 PYD57psiOtuhbkv5gqv3X5suK9nDqLGTmuUIuhiODlJVV+IEW/7cLD6poLY7OQAU+bxmLmd8HC7
 hb1bpmiIszOUvng==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 128b7efb110a55066a21afa7bd0744a5fc6332ed..fce804d42e7d7f9233b2da0fb26e482170629424 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -687,11 +687,8 @@ static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 		if (funcs[i].name == NULL)
 			continue;
 
-		ret = pinmux_generic_add_function(drvdata->pctl_dev,
-						  funcs[i].name,
-						  funcs[i].groups,
-						  funcs[i].ngroups,
-						  drvdata);
+		ret = pinmux_generic_add_pinfunction(drvdata->pctl_dev,
+						     &funcs[i], drvdata);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register function %s\n",
 				funcs[i].name);

-- 
2.48.1


