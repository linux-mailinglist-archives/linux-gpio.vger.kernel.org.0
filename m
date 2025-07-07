Return-Path: <linux-gpio+bounces-22857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA3AFADBA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 453CC3BFF5B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB08292900;
	Mon,  7 Jul 2025 07:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Kmc+vrTg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A6D290098
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874639; cv=none; b=OLXKpolkNrmZsPwxaeuTlNl7C/ol2WUGwqTD6ui4fTO0BoKmmu/bfw2dp9+ZGgCBX5YkMDwts7zlhIyo/0x6E9LUAC0XYXaxgCQ57zWatVLLrOQRFshCWQ/nuxaRbWsh7tOX28c4KnUuMDAsJPRhQKp9UkGMN/SM0qTbfye4r8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874639; c=relaxed/simple;
	bh=vtL8c3CWHWi7bD8fUICBWVIWkoJx1ZraepAblph5uFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBfqN9iAdMIlavcSUwiZax9qqiZz2dYBV7HfH1hPPTYLiArzMYUbl68sEgSKmHqjw2ZfbavPS4U/G/+81oZxm2Qbf1t+5DrcFZWQfSBLraG+cUqqxJqc5EK5f/YPX1in3xvqq/cuBto4AG/B7AhyPt1E4mauQV+/89O57MfAOHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Kmc+vrTg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45348bff79fso30102395e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874636; x=1752479436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6SWmN0oZOf47ZBuNC1PAZKMF4JI0fWMJVI0uHHLJq/Q=;
        b=Kmc+vrTg2y32tf/b4X8XuZqP4fOWXjlIjOQm2M+k4NVkrT5ZpknvrCcyGWpmaSBpm4
         oJ2hqalOfk8Qy/+Y7ndncEVShlgtLnOsI6oEkRQllRyn/VljUaHlRxwMLH6JvrM3M1ng
         M5d0vMQSuNELSJEaJzpCPtVOlgEVCDZBSDFQFeaQaGh93aR1Gui/yqpeCHo2a8op2zgu
         dJQBrBxjgJ7AnUKyU/jGD6hgqO9261IxOteHpdEfHDHZNWNCteRfRFBJn+ZGf3IeUFo7
         n5FW5EotpaYx2Mn9TC4DVuKSciVi1TUDrpu/p/xeAUEoTvY6Brb04aY/wQQGmKs7mocS
         XurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874636; x=1752479436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SWmN0oZOf47ZBuNC1PAZKMF4JI0fWMJVI0uHHLJq/Q=;
        b=ApTgTfj48bLa0dUTxt91gcDrJOfKpbAklh3MGT1Kw9qbpoeoiIQHorwIvCdDLkWime
         UFpkDF2tvg3769ecEy/s+JnzxYFxcF6QTYKRj9Zq/qfk03CzEmVSKwd0F4QgSHkY0OU5
         IOwZY9L+0RlLv1FoU11Cix1uj6X+wCEYCRCMmp41E9vxPWURF9bsvyrSDdjt3dmKdcdO
         xmzGPqQrcuVCxgkxOFrq9hESHCt5E0yvJaygjfhB3boT4NVHmKwhJUR4hbI93/6IaQ2T
         oS00NiAisz9qPs4vhwxmoXKuQIbP753EUqrwXuQJRasMSOhpHfg1uFWRPl5EU1wWzSA8
         4tkg==
X-Gm-Message-State: AOJu0YyHxnoPtNixMgVHnfj93KeZ0UyrHR9752qxJjBiO7hcWqc7SHur
	vNDTBF4D/euu27IxVHNrsOkM9wnLkKMzZyU/Cz7jLl7IfjZcRsCQqwDUbERfjb4Gqmo=
X-Gm-Gg: ASbGnctp84p2mRv4fluK8JP2zB+D8DC7BQQw8QJZEE/V/ELAFr5f5tF2KNC0Y/Zn8pL
	GzrpgkzAXfntE7AQeRd2UcudWEEI3CrwDzkJ347qpIDdte0A60JlsIJZVCfhonHolayYeYyNuF1
	zRecQM0cacevDHNYol1tO/NHVGKGCtbAFnfQk0soXqE53bDV5358hsY7Lxsh9aPesbVPmc4FUZJ
	8w+3tkBeSGK0SHwgPXRWPfSuaIJHszK5EkTGlLXSx5/gwEF7UXVJqah+zElXiu1ZWoQ4fP25ubc
	WgSB8b9nwN6iit5lZBrCmtCyWRyKF5JULfJi2SdBz3FGh7d2N+P5uPbWxjYQBEZQDoI=
X-Google-Smtp-Source: AGHT+IGkf+l7zAbCVq2RM9nxUZWQcOta3ZZ/CUcd1IUsy3YNoRjJEdd3rGBCVueejV8IrTqJPkhe5A==
X-Received: by 2002:a05:600c:a4b:b0:453:6b3a:6c06 with SMTP id 5b1f17b1804b1-454b4ec3c54mr96906635e9.29.1751874636031;
        Mon, 07 Jul 2025 00:50:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:25 +0200
Subject: [PATCH 12/12] gpio: virtio: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-12-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WBzxcByKBAOQyrVMEQA9NOf7MP8zLdwyhJ5inR/oPcY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w8yxjQpOYow6Ti0FXaO1aSbr77VEqywPKk3
 2RwPz7x3IyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8PAAKCRARpy6gFHHX
 coxND/9dppbq95ielLo9QfHw6O8rAfYnIC/QkOGI1bSRtDxVc8ijvATdgEARXzcG8jLM/e8I2oL
 ksw0hc7ylzWXX8rBjmHKEGYvWg2b7oiQdXuBqzquor1sLAQdezaSegOvOEmiUnA4DmbFu/dv8qR
 uVzn9tyMLNrYL2hOybxGyigDs8RN7e/I9PvsxwqUdiSM+FmltJD6ijePoyL6eDSDxHYz/seDAiT
 N9GD7fxPInPTAir4rIV8s10G/GBlxy5IctmxZ5zmTqVI05P8lrgAEgtY+vghcFtiCg058mfCug9
 cq3Y8sH6uXXxNDds8lbzNx+IvkP+qofDRCF5kyMEexQuB2s1tkWedNxTfUIEAzlbkEleI41OB7s
 q/qsCnoLjx1fio/B0+BBmG/rAyDpoiNl6JLMY0wEC37i+mdVajPwqteVW51UFtX8SpSoLKlDTMM
 mKw0pfW/3cELbn2Br7jE/H+CDShs5JSrBlfpnzozxWBkA5RJJfv9PgxhN3+kH76kJ58vByjHRHy
 ph5cMFrLy1s0HxEfS/ogCykmPLQRwbYPRWeVpsUPC+RmBo6TZTLPBxHTkhTePdPRNQvalymGYce
 pBbzqnznTVCAlkTIxCnXwvRO0fkfGIAuYcLHqZv5Mjfp/MGv+hX/9ppwqbeRVhsacoaaKEHCylA
 uA9yO4B5OLbLQeg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-virtio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ac39da17a29bb844b0dd1e36eaf37670261396e8..92b456475d895912c903ad04a9d101daab5ceb58 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -194,11 +194,12 @@ static int virtio_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return ret ? ret : value;
 }
 
-static void virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
 
-	virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_VALUE, gpio, value, NULL);
+	return virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_VALUE, gpio, value,
+			       NULL);
 }
 
 /* Interrupt handling */
@@ -565,7 +566,7 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 	vgpio->gc.direction_input	= virtio_gpio_direction_input;
 	vgpio->gc.direction_output	= virtio_gpio_direction_output;
 	vgpio->gc.get			= virtio_gpio_get;
-	vgpio->gc.set			= virtio_gpio_set;
+	vgpio->gc.set_rv		= virtio_gpio_set;
 	vgpio->gc.ngpio			= ngpio;
 	vgpio->gc.base			= -1; /* Allocate base dynamically */
 	vgpio->gc.label			= dev_name(dev);

-- 
2.48.1


