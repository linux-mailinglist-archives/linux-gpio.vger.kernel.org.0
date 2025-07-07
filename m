Return-Path: <linux-gpio+bounces-22843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA00AFAD78
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766413B3117
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6388D289340;
	Mon,  7 Jul 2025 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3AtB7+I/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E7C13A3F7
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874264; cv=none; b=Vg1a0ujHonIG5Vu5DKrXjCsTd3+oKR08KxYO97ZklqA46Ud8n08cLvWP3/j1oRMquYtcuYUVqYb8DOSRjdISHvxylVd4qgpvVkYF3dGBJDi2T3wNY0HVzz7TvWfrw6t3PWElf9Fiy3qDLyRcl7HzhMh/G/2hiVdtOPteCgMjbvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874264; c=relaxed/simple;
	bh=a/aBuw6eSYxUiqduVM8v7MQHhm9JI8Hc4Nzy/q2H5zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vk51ZGD96OFmOoDvCpfWXZ8uzVl8HXXgQwPs88PddKNz0Bi/CD7Q40+t9qeFyKrSbzj0fKhRjkq2M/wu1oWMvuCgKd7EvEZzr1UZP9oAcmiBibmpxAn5xYWzLIuXMBGowg5ORIbw7nEfRCRhvyY25sKwiINN3lMYUSQPsMaoHdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3AtB7+I/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453643020bdso20546205e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874261; x=1752479061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ywzRjmVlyGLID/ZIJbfZI0O4b8LZWe/3Tlbj+llTQg=;
        b=3AtB7+I/2vBd3XJtjUqcnEZeY/7Ep8EcsHPb0GJEwE6DMknouoyHueJ6jhaEf/SwpT
         inNkFRVHj3wRIGJAG80M9wEBt3+sbOyjLrg29Lmwr/0MP+Klcb1uYQn/apm9ZESu2PzE
         GPEiaaun9a0ZMKBgp3JQ9kEAzW6Dve6rqffBUmJBluvG840QyF2M0Vm9+1ssUQO+WVoe
         +KvOsYB0SaMKLfJKrq8Hfa8kN9M1vi/xi6kOxlj9/oU7TaC6kztKWQ/J8d2EZGtvARal
         URjFYpV9AiVd/Ziz5EGsmDr/kdpuFSdn3C/9uI6dcXli2Lh2wNZlJy2AB+e87HexoOyL
         AZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874261; x=1752479061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ywzRjmVlyGLID/ZIJbfZI0O4b8LZWe/3Tlbj+llTQg=;
        b=LTqbLcEVXIHP2dYbAZadpOIXtYccDRmurI/WWGSByK7VmEkyKFae6+jUA+qocjvfYh
         jbrW3otIR6dfYy26eWk1K3H5vVReCdeW3QaB2RA1iMbGMA54FFCe9oqvPBo69866PTE0
         m6FbEAmhcWsHkh03h6MGpF9ciTQITYQV2W+ix7cmGMwjOcbROFk7k97Gr6M3zqciqCYA
         K3h7dPnlEdbRJv7YJPcjO66j2duGTa5Uujt08/hLTQpRufhwTHDGa6y3UYwEq+RXHCnX
         RizBaqAS7G2o3O+oD/86VeUZL7rjDFvahG7y1brVQR/pbqtmRfSSgHURCLsW3KCnXYC6
         Ypaw==
X-Forwarded-Encrypted: i=1; AJvYcCUvlkiDAvtNbQsANR+9P68JOIMCZrSSvuMKk2CIcrigxFw+7jCMQlJM/+BNyvAhjEGZp5u1aktiFHW2@vger.kernel.org
X-Gm-Message-State: AOJu0YzCrjEEW/4FJVibDySgcOtG4y5bxHrQCA5/nbbsjM4DItClsc6Z
	pkC3w1E2X741nqBWi9fqYREYe9+G4oS0zZo54F19ED+GppNJ6479tO9qD2jTymVpsHo=
X-Gm-Gg: ASbGncuvJlM8euv1tluWBYl2bXffwyDmYgotfP8KCDK6fS0WCsrgH0BEnMxyxzzRtuF
	zdrKjNgqKgGJz+4kw3XlPfULDwBL4ASwBH08KMbgILJN74pi4+HwcTJgntbAtTq28qW8BI6TqoA
	J1HZ/h9CxryZdCSr6xnGjghDrgW+PDxZ08GbJVInvwlqzAaaGMBrq1U0QpaBhx4oPA4Ub2VIe5q
	JdC0qBW3EYS528SeUmt2WjQOuTHDElRizt1N9RmZ87Le1pugsTt61p/VxbbQS4HFVxH7xdA9N8G
	8u/APyty7FbOIxmmubbyMTewT9hZk2ZvCI40ga7ExXVVrPdVULBMyKVxsIdbskE=
X-Google-Smtp-Source: AGHT+IHTukiObLm9v3Qws0DGAdo+R1EltNu3P4uRttEma+tA+Aqku3e4Jro5pb0JFOVJRpGK9M86QQ==
X-Received: by 2002:a05:600c:c109:b0:442:f482:c421 with SMTP id 5b1f17b1804b1-454bc5c2fbcmr36096125e9.22.1751874260966;
        Mon, 07 Jul 2025 00:44:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1628d60sm102884855e9.13.2025.07.07.00.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:44:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/8] gpio: move generic GPIO chip fields out of the top-level gpio_chip struct
Date: Mon,  7 Jul 2025 09:44:17 +0200
Message-ID: <175187425322.11592.10235201169353837001.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 02 Jul 2025 11:22:07 +0200, Bartosz Golaszewski wrote:
> The conversion of GPIO drivers to using the new line value setters is
> moving nicely along and we're on track to have all the existing
> providers converted upstream after the next merge window. There's
> another piece of technical debt that bothers me - the fact that struct
> gpio_chip contains a bunch of fields that are only relevant to the
> generic GPIO chip implementation from gpio-mmio.c.
> 
> [...]

Applied, thanks!

[1/8] gpio: generic: add new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/8595375e4fded27de24b189c692c2c50051a7b3b
[2/8] gpio: mxc: use lock guards for the generic GPIO chip lock
      https://git.kernel.org/brgl/linux/c/ba441322c7aac4735d78fc6781e497a01fb8eac7
[3/8] gpio: mxc: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/1f129b15c2dea84ce12ee3120c7fffdb7bfc7395
[4/8] gpio: clps711x: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/fd0f0d1a1e71d736deed3593470b3b03f8e76df7
[5/8] gpio: cadence: use lock guards
      https://git.kernel.org/brgl/linux/c/76045e90400b7ecc60a33526a505124b0cce1d7a
[6/8] gpio: cadence: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/47ecff3839cac71c6b7f89b7860f6f76a4c07b65
[7/8] gpio: 74xx-mmio: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/bd9a0dec2d49836e7d186642600e0f668fab33ed
[8/8] gpio: en7523: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/34c029c20300b9b3072f40875b899ef9c40e69cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

