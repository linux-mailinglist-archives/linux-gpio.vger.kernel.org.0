Return-Path: <linux-gpio+bounces-7403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF28905A95
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 20:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F2A1C21C4D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 18:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A06439FEC;
	Wed, 12 Jun 2024 18:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Uo96lmR8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330763D967
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718216192; cv=none; b=c8Kdth7EUSwiH70o2UqnE7xxbI/w/6+C6NGzclaIbospuWlNhMVMhGuxUj22oyojRxSx2HKOIojkxyA6lqNPko/Rh+OOL7iLXwSPHgNMx5UnhqB6fr9VvwIoINjDZ+WHtFj1oktZ8mU2Naz9S5teG1VcmC3owyQFIzz72dUNrhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718216192; c=relaxed/simple;
	bh=S5HZWxddfgi+SEMgm+98zdrKnVwYUBU9vRQKyM07BVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8KVzuateCxVRWry/ZtT1tUt/nMU9bBzSAn1gfSYbjCNxD/olHu3iu7vrcfuz7b28zaZ+G4YOJeieydVUAbbmDJpCAdYu8WxHtS8guXulIF2VKjxbPE9I5hJdzGrNZDEZNY3J7SMrE6QKSvlMwztfQI+4HhgwUoiXWgW8i7Wp7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Uo96lmR8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-421cd1e5f93so1460245e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718216187; x=1718820987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daCM+Ahbd90e4miZHKBtV2v+dtY5C7Shxw/FivV53G4=;
        b=Uo96lmR8CHf9F55WcSdhvOy82XUz4ohdurJ0oX+eIAa50+FobD85EDS0qsF5sn3w4C
         rhBKDAPTMuxEKV9mmfdCX5Su8v1S+y8Hb1JGxc8OlshB63EolFhG8LQrKuhdFRoLT7i5
         ox2QongN8qeO8jLuzC6r9WSTSj31oVsSvWQCgpcvgte1s4ud750l67CLQmC6tQ70GSF+
         TgApFdK0qRCJx4XC1uas4Pc6c8Ay/kw4J5CERemzJRn1+Z+1p1xns/Np2j5/prImRE9o
         zTkyZUO2cUKiLBvZ1wIoxiRzCXp9RfsmVdU23b1/Oc2VgrBvGL7Qv7xUkjxNTreqMHL2
         bo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718216187; x=1718820987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daCM+Ahbd90e4miZHKBtV2v+dtY5C7Shxw/FivV53G4=;
        b=VdfYCHFb1ZchFi2PDhmoNJx+JjYcpHGNRi0PeG/jCetecxn/4Ps2SmYIzCzBmu5f+6
         Ddw5KVdFtC3uSRMkEfnXhv/BStQfLTXNgEZvRlVE7n4eIP6XuUIGG8hwrLN9POPf5ptz
         Os6xK0DMeXldRbcBtOLOFkWbQ25FSnrVBKlowoZaBWf9cN34nT3iytrPndYX/ZkFQg6O
         7k/0jfsZV1itYChax9EgEwVgCeLbS5oaH7XEa5FH38kNWrlGO5aiOqICFQAudqg7IYgx
         kjb6YZw7nkmYC7PZyxJ16TydFqgD2BBDC+dz2Re+3Jg2ORLWgqu8Jql6oVXZ1xDk4ycr
         YAnw==
X-Gm-Message-State: AOJu0YxpKZlDkM/Zji5RSO+5mHVOL3NYoiqWtAdpfuF+wzYlrsbaCiyq
	XOVcf6EbPH9lhx26qmB/jwTQbJRj6qhwH0KcP7HG4rfb8DtteMfOPxePOUr/D0Zqm2UAXG9MAn7
	f
X-Google-Smtp-Source: AGHT+IFGWw/vmi3Fw1GPpO28E1BIHb8ehzoc21vxWSNa3wVOgEBuDj3m4kwv+yawOuZeoTBAc/zpnA==
X-Received: by 2002:a05:600c:1ca7:b0:421:8143:6206 with SMTP id 5b1f17b1804b1-42285c6bc0amr28469205e9.0.1718216187085;
        Wed, 12 Jun 2024 11:16:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:a172:4e8b:453e:2f03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4228801dfd9sm33621165e9.30.2024.06.12.11.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 11:16:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v3] bindings: python: add script to generate sdist and wheels
Date: Wed, 12 Jun 2024 20:16:24 +0200
Message-ID: <171821618069.51271.13809961248339118777.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611205041.1448276-1-vfazio@gmail.com>
References: <20240611205041.1448276-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 11 Jun 2024 15:50:41 -0500, Vincent Fazio wrote:
> Introduce a shell script that generates an sdist tarball and PEP 600/656
> conformant wheels.
> 
> The wheels are generated via cibuildwheel, a tool provided by the Python
> Packaging Authority (PyPA) [0]. The tool leverages toolchains within
> containers maintained by PyPA [1] to generate wheels that are runnable
> on hosts that meet the platform compatibility tag [2] requirements.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: add script to generate sdist and wheels
      commit: 72d2fa01a2c1ed8b13d54a5a33f54babe979eacc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

