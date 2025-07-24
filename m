Return-Path: <linux-gpio+bounces-23767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E46ADB1061E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40D961CE4E7A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 09:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6926F2BD595;
	Thu, 24 Jul 2025 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pZC6z7/L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2091F291C16
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349110; cv=none; b=ufbW1r6wszvZ4AiA55/jzH6GeiM/HgA0Tzogvb79mTra+7misdwVpezc8NS4Q0Um+yc5rcxvHWnGSR1Tc+0jhpzIm85uJS0NUjWC+bfYfvjDym5v0PvQTzQW4onFiJHgrO2FqktJm438hAJrqkhyp1zx8HJzKex+GF7vpRBCp/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349110; c=relaxed/simple;
	bh=j3hEB3uHMyfG6UC6xkEhr2jxijr1UzMwpOtvGPojo1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGJyVbWSDhghKcZ76AuMj8Z2YNYcZgm0GMq3d1OV7+hq6Cf2ZwaOVh9gjx2ANaNzDZOD2DzzEH5yOHtf9WKMVqA7dRqDNeCMvxPari6J2341IeW+t0AppJ5nGurB2CAifIFDqILJfi9ckn9YrdEkAIoscRhiGWlQwIUaccwRsWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pZC6z7/L; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so368320f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 02:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349103; x=1753953903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4a+gzu7f3EwTZaPbk859mLIqTYIGZRRwraHyXMWvss=;
        b=pZC6z7/LGtdQGVWRpYaTHqcqRGRzUPMXs5mzavTko1zC2wIanFvf9U0DddlnTl01By
         l/sg4duxd9Q26ivVXRMiaT7Gp0V4wFOf40Sh8+RIQJPJM4jpUG8ltrQLCu5gF5FvD2mF
         1C3xRF39UubD+CfRVByGnbT0Pgl2q3ySpHnufDVIWhq52ZmeTnfcFz0qb2CTN7DbZrIo
         8WL8Cc7X584qxA+y/UFkNCfh1MduOYnBafRW/uMsR2xU7SoSN1Fe7bqKqGXcBsf6Ostl
         DhWkoqlLqaFvaVAIT/poJa9ZwBo94qHYA2YbhD0aQstzDGRDdRomoIG02mV3uLit5+0b
         pRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349103; x=1753953903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4a+gzu7f3EwTZaPbk859mLIqTYIGZRRwraHyXMWvss=;
        b=vOR3+ePaUo0hwo0gu+yFE9P02iTDq4oaga/VFcHfKzWFo2yi48/X8G0DUDZSmt8SiS
         w5M8tSZpYvyLVVz3xLUSyRVMSM7742uEO8t89iULKVHKFFN2mpj5o4un4TFXdO8cAjUT
         1dmQZb6/1iPS7S5dmIcLrb2DOyNi0EGOa3E1pk0W2Ys0hnzEAb0aBBopT/UQiQbUjO1e
         mUdEGZm/uEwfBUsBxrRMDWdfShxOKJ4tHrjZNoZQDQ0Si1U7syazN6l9WiEeC17p9ccX
         A85soJfIJ+53cqPNO7HY07MQRsvkbYergoCo+7aDb4R3cAkxhF/Xt1sj3kqEwbzBHvSD
         2zOg==
X-Gm-Message-State: AOJu0YyB8AS4M1KkUlmZD5eZe3yuk30GmzImQfL4D0j3yIagbeic1RsU
	onZG6PXh25oQnq0f0x85nw343KgW9syyALhiouXZzCne0FK0kgc1XQW7VfloN9Qr/FU=
X-Gm-Gg: ASbGncu9qmzUnq5UXELQbELrW9Ejl6xS2F2Bf8Ga57XvHUgF72A3jb4QLvy1ghjK1X6
	SYg/h9IbMozXVRBucNmACqBFDwvgYbE5HeYRZ75iOhP7uzz+PTI7XuR4LE91oGdeu+0sRcGZTKy
	E6sL+h5okhgVQcLDia9Hgp8Cx5C7x9mk0f6Z5DznGDIV1Cmoj33yUvDejDsL9Uauqyp7jfyftTH
	5IeGrGXxFdNV3Q9xG/aYGRagevlaOH/+4dCI4o/CVQrj9I9VDBhyiR0ZTHx2H+oK9UuSVjWemWU
	f3fJHGiR3sGmETXQ5z+QDpo6CNHndfJFy+a6DMwicwkn24lt9MM1otJDovooWw0iyN3FVuFD65f
	sC2KzPSghP24lGIpQ
X-Google-Smtp-Source: AGHT+IH0iAkuA6GzMHME9lyvaFVrb9WaSOmQdANpljoKy1DeZvDX7IaJl8X91dcX7f0LjUclpn3P5A==
X-Received: by 2002:a05:6000:1447:b0:3a5:2b75:56cc with SMTP id ffacd0b85a97d-3b768cb3ac1mr4981697f8f.23.1753349103057;
        Thu, 24 Jul 2025 02:25:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:25:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:43 +0200
Subject: [PATCH v3 15/15] pinctrl: qcom: make the pinmuxing strict
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-15-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M36QPREHYk2Y1Ol3wL/sT7z2U9JVD+MimNp7WJSOHU0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvUuNqnvhBaTQ7E02dLbZ93XPdMix/+wojXR
 G62efWlN2eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH71AAKCRARpy6gFHHX
 csIEEACcYzcalCunEHwwLc8fC351P1QZ0/EviGqXfAPEAKDWr3P+rwFdN2Ta12zzVjBkLzjyQ91
 Zv3Pyd8ByzwdIUsKqqnTCqQXU561HpvlpivEPwqQfk2Fv1/z8zXTLdhqLYeWc2DtYwXVL47+ep1
 hvPNS0sKjxZZSbhD2Cv0so7lDbU9TIvO8FfROCo+OUmJ+fNRIHwJdm3DZ3UCBbKrfqj0JKqwStC
 SmdBFpZg+RC6pqBdqVp2puRBkrX4kkPXma3WhGUgbQa/jdRrzeKTzhOecZSN78aF+JYuAOuEWas
 9ZYmbC12bDFImUccK4LcZfdm6UKPE66KoyCTfbJSdLsUaafuNUop1v3HMU+T1Qr/Xjdxcfc1d72
 xDxNII3sKlNkkl6WGjDNi7bqM437VkY4D3MqKo2PdUpL8pWVacs90dpKk/TeHcMZqMlSPpWf6Ir
 w0BoC8kdAtDjE9Xmx8h4NgBJrMuqyRB+w2H/MkSVj85rAH3A8nrxlRd/vqL77bGkehXfVeY7coP
 hWnYxxxDdbXZTNWgEpW4pWcbFrtw2pyKmva81FwQzEbINBVc2nQJQb2Qpd68J7/3170a6GFWyeN
 MElcFiUfHMZhzI5U6MPEUSceL4b9e10SrngoFXdrORgydvHqnRID4/lq5Qv8dryavy2pK7C0AN1
 RovE1kMQsSfBwRA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 7010be8d1ace062fcf7743e539d2065d4aed856b..ad572c923e2ab8caed134207ec02c4107d4dc2bd 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1


