Return-Path: <linux-gpio+bounces-10990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF3993758
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 21:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 442111C22CDD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 19:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EC81DE3BE;
	Mon,  7 Oct 2024 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1sXH0n5/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9DF1DE3B2
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728329437; cv=none; b=EdF6unaIU/x/+D09VCCarPAJ6fsQt7i6rMc+Tviyydn7FMkzRNNimW+Il9hdtJJZ50w1zmUPZkzY3waCe8IjvaHp+49u1yJgql8PdvZ01y/draeO1h9Fgp28UYCwV7a4oicmX3x3Tehf5EhQI9HDCAdobUzWac7iUQfQiimz7n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728329437; c=relaxed/simple;
	bh=Ke5voMctP+evAv9bwhIr41QokkWJ7ypFmCI1tpaC7eA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tSAkH2qyKBmqxGNVI3Dilj14h/2Hp9LRMcmhoya9SWXb2NMTDM4QHzwGvEhsH237W/cRiiywLn1vL5r2SdWBU0OKZH0qGkdr/bX8u90dFVNiGogpdY8Mt6QEOCEvhR9wBrlCOKrs3PfqAolFAa9WpfCLoMDXliDD7hovgMTnEz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1sXH0n5/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso64905305e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 12:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728329433; x=1728934233; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0uKMz7NTNHsoRRZGOAQIA9mUkuccuCHOf2V3zNcZk4=;
        b=1sXH0n5/JpiDqAzvEPWl3Rq93kcMeFukX9EWxwg5+8oKwEFqtYOEkFFgT7CZLpHfS6
         zrcF3NmIW/9F51I9ivYVdBxWnjtvIy1zcqSTp4D9hbuhrg0xunVekBXFN3WYXM1Jjsgr
         sIF/hbtC7UEoGClvQjWL5on1BGSjhiZ4OW03FHJlDKY8EPXr4QYkLhSCtlX3MwDgHVlD
         4rl/86683hOD4O93o/6XqACZEoyDNV4Jobfum9JPAUHGyx5tD+5QZfLXDkUnf4g5JvoV
         luGzlUzAZ3Vi/txzOKd4Uipz3KxiH2SaXHyOZsYmye5XtwOD3ofKDheM4t/L+bWg8o7/
         Qhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728329433; x=1728934233;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0uKMz7NTNHsoRRZGOAQIA9mUkuccuCHOf2V3zNcZk4=;
        b=lkpef8LsvA4BVKH5FCY8ULO0wcdKRwDoCmywFQRpz4ZHreHrrEeTnxvPW1FsOYe4E8
         k9DrrAtGF52tWPITskWSf+SpWKHQjhd/cbBybBzhocKvBAyeDlgfoJBcS+kmN9v7PSMk
         WgJYOIx/civWAOTFuSy/2oDPFs73Ztsiv8W+d2sORyysEZK9RYXHISYmHGH7sXFhht9+
         GqnDNRXkDysS89g9QCb7yrgS5saw9EL/J6jj9i+hPGr83jMO18piiprrhSN/lptlpavU
         JFHAEDU/FgsRLeUi41KvWp/cbghsqjmYmp/xui0+UhnB+MXJNzrBFbBJjrlKnY0EnC0Z
         x0Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUBld9KbYSomLqL0Y8rOUypjGGe5vWa2SNaZltHsQsXDwYOHfOOJUIMlPiJdVKJuNhFR3ndw8ejPqE6@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAtHCyRIOqOPGEPFqbGbjOWMOwjA3tgEYXZB4ATFaRZkbp5qX
	mRFFOsiyYSzhNYZMu0c+aSCKIUobvmPaOABk4dc8m0bB+l/+P1pY/J0/SIhKG5w=
X-Google-Smtp-Source: AGHT+IHenSwkFYaDmzhCTlzQ3m/yASGk2SgsONtIWhmfsIVx5EUXtouwwWN4O6D7EdSOpHB3dVL89w==
X-Received: by 2002:a05:600c:1e22:b0:42c:b555:43dd with SMTP id 5b1f17b1804b1-42f85a6e1admr137715205e9.3.1728329433067;
        Mon, 07 Oct 2024 12:30:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a2052asm101321905e9.18.2024.10.07.12.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 12:30:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/3] dbus: client: fix memory leaks and errors
Date: Mon, 07 Oct 2024 21:30:21 +0200
Message-Id: <20241007-dbus-memory-fixes-v1-0-0d56d1aa032d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM02BGcC/x3L0QpAMBSA4VfRuXZqG9K8ilyYHZzCtBORvLvl8
 uvvf0AoMgk02QORThYOW4LOMxjmfpsI2SeDUabUStXo3SG40hrijSNfJFgMtjJWm9KqGtK3R/p
 D2lpY2E07Bw/d+37AybwAbQAAAA==
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=776;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ke5voMctP+evAv9bwhIr41QokkWJ7ypFmCI1tpaC7eA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnBDbTjbegrAuVjuQSI4EGd3qx7V0wzxakvnnRn
 7pOkLsZRtGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZwQ20wAKCRARpy6gFHHX
 cp5HD/4rttgvElRuL+tLrse8dNMvtO8t5qIiMkPtFMKUhvvALZ8GF8qSW2zQfDG5JrpJM+YwmXx
 FD7us6lMRO8yGvm+4MlqjztDo3lqfGNq0qSnFqd3FU9iczVFNOY7XZJRWUDpLn9AU17wkazpoth
 7KPCY2kgtRQbkcS4gx+sOSTszfZM8B7z7zpIEbjCd4S6oJWVTB++DQkTT3noNA/w0z/8sZ7PXag
 LnacLC6nnQjAfueHgxjLDePmJ2hYhKbGtCTG3zG26FQ/S6VuscMuWq9Gtc9iocB05SR29qVf32l
 8Hy4TL8tfnkDKy/OGewIpQhiGwo9i1Dp2cPQw3h6SgJJHuXFHvc7M+kwrYd6HSzZnJuma3SL7IY
 MPXBUxotIOF2gp/P1fJRFAnFraClvKHT4lJVJBvdH5avGIqvl0CDk05xn+RZp4ZYQYhLJbpRsEd
 YcwIUXn52TBNWgae8Kop7QWheX9Jy6RdGPX0mRyAEW1eV2Zj3HEkGrAE7wTvEN+yXe9PWGcBw3M
 /9rrwA76qKPRH0romPam2LM4p0AIVtZmBYSSCzqEOMbHkOEkI/yUbQPsfH35lJAhgjZKiYH/uJM
 lKp5AhuYDRfekNlA4FxiCrUvutuNH3800YR98daH1YdNVfwvRcFPsxltAn5aHVq9zPhxkFq9vJ2
 6RhgS5CvMbs66sQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The daemon gets good memory leak coverage just by running it through
valgrind and executing the gpiocli test-suite. The client is a bit
trickier to test so there sure will be more fixes coming.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      dbus: client: notify: fix reference counting
      dbus: client: notify: free chip and line lists at exit
      dbus: client: monitor: free the line list at exit

 dbus/client/monitor.c | 1 +
 dbus/client/notify.c  | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 0e4198b9eef1eeedf8cf12e970b36d4e50a1da48
change-id: 20241007-dbus-memory-fixes-3c9529124907

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


