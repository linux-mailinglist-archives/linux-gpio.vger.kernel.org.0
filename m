Return-Path: <linux-gpio+bounces-15404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0706FA28BCD
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 14:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54BF01888B65
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 13:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14326127E18;
	Wed,  5 Feb 2025 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YOiJ70FM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E42BA2E
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762552; cv=none; b=OYLuuvK8ghmsUwO16xJ+jEAVQBcBRVLHsH8NBsoowzckEu/AHf9Eo5W4Ec6exYbBUwimDarTZFfZcWViO71uKe0x1ny6KALwMu79SV/bNammi+58zlaFUqZcrfjxKFAGc/CS374LAAzFnXAIy95OxliCojDC6VvmRezpHBQOF3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762552; c=relaxed/simple;
	bh=y9ycWnG5NeqFpsSA1cS8CN18X/ab+Pf1hVPyz0T/c3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b3NzVnqZRYCsWyIwxjEHpNAMr075Tt+4qIXA0T/LuXzrM+76OFvzkq1munpcVE9sKhqa2p+6gOCspUbvXUGQTufWdwYlhMI0PzmSHeLmRbBq8PtUAY3j5r/ngvfAAANJA70GsOq1GWNODeoL/v3Jmzw4CtmfHE5u0cOS2lmgYMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YOiJ70FM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso47305685e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2025 05:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738762549; x=1739367349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2SibwQagJw6zZu0aEsiPinFgopd0Qlau6nwJscIltk=;
        b=YOiJ70FMTtjQBfiYCFcp0ZVx5DcoyDpsnwShd4xf6I1s7B7Npuj1/nhkoXxpL2HQ5q
         VUZzEUGpVkljzXhG9H4XgUVNVkrMIYico/vjc9TssmuRDM1ci5MuopnXReRHicrUIb6F
         ySftE83GAxpoAf4JUZ1qMdXrpQabs/uElGtELLbdgKxT+G6/e5d93vlCLVSaTTZWMokS
         SVLy2d3+Y7jSxA0kSzuoAvfoKS4uz+pDuowGZG09tK+VPVJkONK3e8tzTN38OvfvsBtp
         Ehkhfd2g9AvMSVMw0qrXpN2io/b9eILNrtVKFKpsve8X9oU+xbA/EGlpE5eiconfGPB3
         ViEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762549; x=1739367349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2SibwQagJw6zZu0aEsiPinFgopd0Qlau6nwJscIltk=;
        b=J2gu7F2Ly82PrYbaBkrM6S7hINyHLKLeO6q7tQy2iQa+I+0P+Stdxlu5xJ0WiAnnPP
         joECoJL57CWD1Mv4S/nYaSwAxmvU2isG1G9cSXc9ozYlgKmfiRZTOofXrnnmGi7YqF2x
         3uFpAOi3UvA9WDdPL/BW6U3hYlgCooWk5+vW040nqh3e9j/zTBnjDUf2i8BAvsio/P79
         JPRAQlSxRM8wcBJbND74JFbcT0q5V5EQYikaUR+dZiyHn7txWJ16/OdeKFOo35Gw2EKK
         HiFkBZDGQEqJQiOVtA5xvQ9BwvMPJ1bGrAiIZFFIzMqFPz3cicO0oZ1QZErPwcgWZGME
         qKcw==
X-Forwarded-Encrypted: i=1; AJvYcCXeo2CE7ip+Qg6qZ9+1ZRsQy94Kyuo3j8yzx/Luvcb/FEAyrtjcs7FxSAMcuPB5C3FsZVIzzjf0xaJK@vger.kernel.org
X-Gm-Message-State: AOJu0YyjPWLHfmJnRyyKwgZ/SnNiBr8mmBc++iDKHblZYhz1GxwjWV73
	xXWiOANo094ZyIt1SAJThbFHsVUmRmBHap9nKqNsk6/2woRpMTpPRBcOTBb89iA=
X-Gm-Gg: ASbGncuDOL6tpWVAbl6i0jr7EL5LHEZW6qHwzyMLIH9ideJrmiM6LmwYStwxIOP/ekD
	eP+6r02GvGwvRZ8oA7qFo0MPOir0sgcaDPqB2EkMCfF0NBkuPiFZyDSBiZzdGCLOhjwUVDx8obs
	wUzCZdgw8mGtlirnYQZTwgFXPrvddBT4ZjUWS3v8JKU1dq7dwrHXd/xyW0vMLEL/WxddewGWVc/
	PKtuNfzWuQqvbWSPpKjdykziEgELY3BTZfXqjDvPLl8z7stzLxZaL8z/h1Buf5X3qvZU1rCUETp
	Unn6AP1C2ggDmBI=
X-Google-Smtp-Source: AGHT+IEyRzgK+VRbtiKZ67rWdMxXspG1uEJm7O9Ja3ULuWLyZR88UeDuj0QL/mX78/Kjmzoc1FHEQQ==
X-Received: by 2002:a05:600c:1c87:b0:431:44fe:fd9f with SMTP id 5b1f17b1804b1-4390d560fc9mr21656245e9.23.1738762549219;
        Wed, 05 Feb 2025 05:35:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3239:b668:f15e:fed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d966faasm22045115e9.23.2025.02.05.05.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:35:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] dbus: client: tests: fix the way we wait for simulated chips to appear
Date: Wed,  5 Feb 2025 14:35:45 +0100
Message-ID: <173876253650.17639.7498935091403278246.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203-fix-dbus-wait-for-chip-v1-1-563f7132c04f@linaro.org>
References: <20250203-fix-dbus-wait-for-chip-v1-1-563f7132c04f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Feb 2025 18:20:27 +0100, Bartosz Golaszewski wrote:
> The org.freedesktop.DBus.Peer.Ping() method isn't correct for checking
> if a given object is exposed by a service. It only lets us know if the
> service is available no matter the object on which it's called (in fact:
> it will not return an error even if it's called on a nonexistent object).
> 
> While this has worked for most part by accident, if the timing isn't
> right, we may start calling methods in chips which are not yet fully
> registered. We should try to read the chip's property instead and keep
> on waiting for as long as org.freedesktop.DBus.Properties.Get() returns
> an error.
> 
> [...]

Applied, thanks!

[1/1] dbus: client: tests: fix the way we wait for simulated chips to appear
      commit: f52874b19beab4d0a1cfc076f7a0eb7d6df5d1e1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

