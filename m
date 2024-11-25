Return-Path: <linux-gpio+bounces-13265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D19D81A2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 10:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41CE1B241D9
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BA718FDAA;
	Mon, 25 Nov 2024 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0oXw1wrL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F3018FC85
	for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2024 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525805; cv=none; b=EtSedviDSf/IFYETnY+6W139egOAoalMhdMGaLypa0v6JQLcRqjPdzZJuoF3dWcM+lly/9GQTmVEkzj1ShvJ6yGO++6slgnUhoGpeCEP7drdX+hintsTypyA1J0VnpE8ZsmJ4/Hj1xZxG5ltMZfBP2jr3uiedYEYa2DqgmsRpJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525805; c=relaxed/simple;
	bh=zyZwo5F/JUa1QG6wIJWBnmrfL5bogD/64xtReqJLU8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=esk8UQW5eOW25GL1w/Pc9caI7qmJ6hq8iJMqQ5OOB7hqBthQQv2Oc/Bnc7MaOAR6I2XjboSfn8ptm6fzRCVrVu5KlVopa5HnnmwNplO35RllOSVAq/EM3Rlon8Peu3NS/GwcazE44IBGQutqi36zyb0aRC5vLh+YjhlmN5y6+ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0oXw1wrL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315abed18aso37425045e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2024 01:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732525802; x=1733130602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oc6YSqvAElWEqwOfiyA8SlCcfP+dhZTEN27sjuIPEIc=;
        b=0oXw1wrL9G245iImvgBffIjyGHz9hn6rX6L//3yzfO0WrgKKipimCiAge8Bt6gRole
         lKvXbnjsnUvKxUQf8vrO3aK/4cZxGp2GRgcTw+leev6V99m6rpaZPuhFsu+19eR3CYom
         jIz/CHI0bjh3pDi4+rnmUcusq8NMfVrRM1Lguir6crmRwF/nKj7Pj5gyov4OwxOlvHSy
         mNvRF2n/ZTyvZwx1CHkh7CAEnnCfN2kKCpw84xKvyqkxbmygJi4xmCseVoabdpMKE1QX
         kGqw7NfpqtC5zJKMXyMm8A8tgzjRtuHJagQVnn3qQfyquMHKWyW0uEJdriMClHQaXnAI
         ySIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732525802; x=1733130602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oc6YSqvAElWEqwOfiyA8SlCcfP+dhZTEN27sjuIPEIc=;
        b=iNA85SCe8197E3lSrhYaFKqE4kjw9zjufXu8muqTbZVzwc9b8lfw9ut1cHw5kLKYIv
         7GvJVqLO4lFQPIODnWiR8gZv0H66PhAQxEnFEg/VdwNaz82YI0on6mXI7Q4XvCmkOLf0
         fHg4KaqRMxTU8cROSo6lOcWLwjjtUAOiEbjt0H2MoTLGm9ItXoeXlCURb6osHpTi3sgX
         VxQ56YsDv1frTGvyGV83/zBytfUmLowtE8ZwHOX7/a6iMUIGHDAHZEAY8NwPJRzm2dnO
         7XIDe3Jn4z4JP3Iv3EXTVEhGXvnminhdtm5Vzd5dYnUqhl1lXvUNepL9BepWOq0otrDi
         nzFw==
X-Forwarded-Encrypted: i=1; AJvYcCXiR87Eb8SmdLrXTbWtdYnjORoXzLnilXCmVD0LNPWhr/5JBpblcrDOi6ARzCJAdUwI6b2wiTeUxBQe@vger.kernel.org
X-Gm-Message-State: AOJu0YwIHM8nNmWjO0DngQ03s0tEPuMlyKmCymF13wot8rAbsebeRs0c
	OnYp7pxxVzE6twsXgi1AOvkTUCK6V7xgtY6AtUx+UD4XnAsLU/JlOVqsOCEbgfs=
X-Gm-Gg: ASbGnctoQjCe4vYPef+uSxeH5oL6D4xMDZTxA10JIZDlwFhT4mQP7gwUETOUbmUGhYC
	X3pImyOi85GDsR7t/BY7YCiEHUuCrd24OOPzT/OS4rJo20wck5WnvPlJDrpPtnDiowhYhtqpy+N
	UqIQvmKCqiqyUdc8bR0Nt1JDlpcXrt9pRKYoejcueyWTxwLcObyCUT05xep6BLitPUjrvVTMFhT
	zRE2Id3lV+UdyLFMCb5DqKygQPMd4aXc1gyhuLOu15ECer49g==
X-Google-Smtp-Source: AGHT+IE1oK+xjMZLqvaOP8UuJxmhWZbZGsSne3huONFeVhpp95MuCKh77q8U9cRrGRwSdzNZVm9hfg==
X-Received: by 2002:a05:600c:3b94:b0:431:51c0:c90f with SMTP id 5b1f17b1804b1-433ce4c1e59mr94686945e9.21.1732525801717;
        Mon, 25 Nov 2024 01:10:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4196:88f8:950f:1f40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349ea54e13sm39445865e9.34.2024.11.25.01.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 01:10:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Phil Howard <phil@gadgetoid.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/3] bindings: python: drop dependency on distutils
Date: Mon, 25 Nov 2024 10:10:00 +0100
Message-ID: <173252579782.29180.4710468881991559450.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120-drop-distutils-v1-0-7498e8b3babe@linaro.org>
References: <20241120-drop-distutils-v1-0-7498e8b3babe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 20 Nov 2024 14:18:17 +0100, Bartosz Golaszewski wrote:
> Python tests depend on the distutils package which not only is an
> external dependency but is also deprecated. This series replaces it with
> version parsing implemented in the C extension.
> 
> 

Applied, thanks!

[1/3] bindings: python: add .pyi files to EXTRA_DIST
      commit: 93613618d25d257d387fe146cb5e8edb1da728b0
[2/3] bindings: python: tests: rename procname to system
      commit: aa5a1e92b1487f8ebaa71e78537226a36dd70632
[3/3] bindings: python: tests: provide and use system.check_kernel_version()
      commit: db19ece3c5d5cf5f4f9af6473285de84a6a7e388

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

