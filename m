Return-Path: <linux-gpio+bounces-21214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56530AD384B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13A8A17BAD6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 13:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D39B2BCF7B;
	Tue, 10 Jun 2025 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UNPnTrAN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2F529615E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560336; cv=none; b=GGZhQG4fDtWByL+3vccqiiqOTvRg6gEtRTSr/ggaLjJhqSSpG4j144JgDpNF1N7fcUurqpdjPAyJ6pJhYdcpNNRohky48CdFvvpMhLpiX6eNaJDDiitWFP3beJQGb09YGgQLTzaRMVHk5LLBh6gHHCbA59Q704HeePeT8PrVeuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560336; c=relaxed/simple;
	bh=05OIsI59Mrk5Bva8tD3Tj97OCifK3I9bavdc5XUI98c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MOmf3RYRiilbPcuF4Kv0PzyHjUhYky+rRJpvgBPk8+vAmMq2B85KJDc6qBiETNyh3wA3DlXXQJHbgogcAP8j+t8888XCP5mwCjz/gUwKLZC0ms8bQM8HIxAUdx7IiA85g3nd3QHLemqAoh4nCn7lccZfSpN2Pe3UTt7RRn8WrjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UNPnTrAN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so29314515e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749560333; x=1750165133; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5x+mnEUir4fkDc+MLWw6JgW3TRK970S3tDGL3/yrdqE=;
        b=UNPnTrANHP+tbU4brgORZEYbqIkIZFC/oOQYz/qxyRmvB+DuTPgiyc2MEmeigRirok
         DF7V47AxfOH6pvGhwX0CaXwXDdzR+n4VOG+wRqgozGLWWMsx0RSh1n/GZIfjFry8/xYV
         /74v6k54Yi0Pj24XTZmk1svoxbvdCJA9TqCawoCdqpLgVHWKVIbmYefV+QzjlAVnzUHu
         2OoLXLrCScMCXUvFkwDeJuh0Pm+Al1JfTahbZSPCWtRtE9L1QC/UjQWYkXTlq4hgRP/t
         VhRyvG5IMSz08FTnhJvi4vHQMKqSt/G/u7Hv3ZEkeDze/JOwR/0enZTeHjRZghTfpyr5
         Dw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560333; x=1750165133;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5x+mnEUir4fkDc+MLWw6JgW3TRK970S3tDGL3/yrdqE=;
        b=JuqbxrQQmK/QyG6TDyInFnDtnFsaxfpo2DocY1Uubp3TWXazeVkfcdpDnO0OjtQwQy
         qktGazIWAl7guC2htvSDM+XfLYmH4LigZawHiBoNh1Li0n90o+0H0a+HSu6dEzJnCXaw
         iY4fqp8aznUkylWPAJ7ZBS1P1dTPu7n4mIQ2KKRNNI4rN/rvfJfTtB7m58HL+WTJY4UF
         HcstXckA6ju7F60wDMW3S3xUH7Ki+uKfDLRuU7FA/FwhLAufcdMPFjHeGRF05s7N3whm
         VVLdl5F0YzRjHd9jNxregURO6BySydmi0oIpmQkNIVNDvlZs79fWN+kFImNYTZe8yvPG
         b7/g==
X-Gm-Message-State: AOJu0YySn7YuSUq2JLW6ezaH571epQFcLSoTgADT4wHxbl2i4E0rNJ0S
	FinVmVguPSJZydbM7Irw7yd0OkQo3qEXjMgMSLijULfeuuUg7alHHZhHhan+H1zwEns=
X-Gm-Gg: ASbGncuKF7cDxZkcN+TtfIMpWEOnkSBT+JeLnu5Dh5Rl1ur812FVpKO4hE5NX7abnFz
	lC92RNGfHEbMenVDIBJjKixyxcNxkxvf+LfAtnG6297tsLMKQETi4hqE7cx3qGvmU5/eG0iXrp9
	PjYbTuwSPVakNGH/dcs0IkPBfsq6t+CPbKP3uI6E0oeydbIsZVBywWH975sCasaVVCL+V//Fkuj
	35I5YWWtlLMYKSRbOjfsAHmGnfvXrJOESQGgJB5gqXNc9oRpzkQj3Xl6BuTU5Yz1yNZI3WEiHrb
	fj39G+Gxxdzm7dmtbA8Wp8rXZfijnOfLP4xyWwC12qXzJrnNqzTLVw==
X-Google-Smtp-Source: AGHT+IEDGhvv2nDonOgnsKogzyq+swTtYxyvrREWxOsZO7ZfnDXOt861Hu1/sqcb1L9f+E/RkUy0oA==
X-Received: by 2002:a05:600c:6388:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-4531d6fdab8mr27771825e9.5.1749560333059;
        Tue, 10 Jun 2025 05:58:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce17f9sm143671135e9.11.2025.06.10.05.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:58:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] pinctrl: intel: use new GPIO line value setter
 callbacks
Date: Tue, 10 Jun 2025 14:58:46 +0200
Message-Id: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYsSGgC/x3MQQqDMBAF0KvIrDuQBG3Vq5QuJE7iB4lhEqQg3
 r2hy7d5FxVRSKG5u0jlRMGRGuyjI78tKQpjbSZn3GCe1nDMOPyGzEUq68kZyVfdGanKztL712S
 Dm5axp3ZklYDv/39/7vsH9i9Hjm8AAAA=
X-Change-ID: 20250610-gpiochip-set-rv-pinctrl-intel-e4c791f29a84
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=05OIsI59Mrk5Bva8tD3Tj97OCifK3I9bavdc5XUI98c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCwIneW7R5vtD6ViY12SUc5xejQd1zdzdl6kq
 JkcgsdGZ8aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgsCAAKCRARpy6gFHHX
 cp6qD/9MjPEZOmQOG41wPugteoUMZCe9ji/YPVIB6hjg7fEVeqvtgIHdllHZ8TCpTjzpR3t0pFk
 JzCJnYI5d9xlRpRT+mvtcL5NDADpPBF9AARaWSNhhSC31Oh+4y+I/4buapM/IA+eWxgKT2jW9Dk
 RNO1JNnmDWkShDyf0H0NetzDjQbKZ7GtFGORGjpmyXmHwX8L4PHFG7h7uFx4dp0at2iFNRTfFhM
 FZGvuNpR/rcf5wm+ScScdRqDbmK/+lGhp5f9VIQH1jvgPcks897XRiQpFdBpYHWs3jQrizqt9R5
 q2ZWeafbI3un1twJ3DxP0Ui7W9iCE/nHtRFpYY8mPxcHDl82Hjg+tMCE/ZgfSQ6YsEFe29Sgjij
 Y90NMpeZ0shXHExstEBdEQi7Fe39TBRLT1em0Z25LwaP2kQnYR/+GaGd4BBc/ZOWdCEjk7UfFJM
 thEGGx15Gmm23lsHSXM4rjE2DSiKHISzqUeBmZYTFlOEPnCqyh+rNFkbCPM68TGvVmPejB1iOAp
 NmF494nukwcKtVrh/JG5+lMOHVr8+ITVMrvFth9fvtZNfuJIW3Pdjpw/USJ9iT/vnEuyaetJat2
 bC9GEo8OVogqBJHcpS8kNV8LcIeSXFJzmvKYRDKHeYw0m7U6/6PhkLP+BD4+MXjTDBvEUoVYof1
 VT10eaWljz+Sfig==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips in intel pin control drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      pinctrl: baytrail: use new GPIO line value setter callbacks
      pinctrl: cherryview: use new GPIO line value setter callbacks
      pinctrl: intel: use new GPIO line value setter callbacks
      pinctrl: lynxpoint: use new GPIO line value setter callbacks

 drivers/pinctrl/intel/pinctrl-baytrail.c   |  8 +++++---
 drivers/pinctrl/intel/pinctrl-cherryview.c |  6 ++++--
 drivers/pinctrl/intel/pinctrl-intel.c      | 19 +++++++++++++------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c  |  6 ++++--
 4 files changed, 26 insertions(+), 13 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250610-gpiochip-set-rv-pinctrl-intel-e4c791f29a84

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


