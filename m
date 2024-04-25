Return-Path: <linux-gpio+bounces-5854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3876C8B2354
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 16:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46335B215B4
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 14:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C0F14A0B8;
	Thu, 25 Apr 2024 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="UxJThwJg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95751149E17
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714053570; cv=none; b=s72P02lUfsrhN33jMxcimKzWnnuNfdrLEeqGhE4Mj0qsI17L6HXHKPfN5Qusr5HhMeCrjBjQYVWMoFdpzOb+VuYkjvGLfG3/z6HH9zKjS9Hal10TwuAqru5HC8zZxY/URHFzK8hCHrT9haAj4IT+yXAm8bEGohsd1l6Qt5UZB0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714053570; c=relaxed/simple;
	bh=bxaYAw3KFAukICHyA8ZADUCzO0ruG6dtxRHo2LheGEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QIDLDwMEPk6M6V9Bj8zbKmN8Q4KqI1ioyoVVMSn4F8VU16vPT+Mw6o0vzSGlvDEzhzBZ5kjAykvgbGpU7lL0vGd4FCjAjxH32EBkbqdIqTAXNmFXJcVvDr7E2t0nyX20nLTdPCb6SCD8ttLzbRqOUtwcYNvNqWTNgcVlh7eVdvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=UxJThwJg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41b62970084so2432085e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714053566; x=1714658366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/c8R+r2wKwqushYa97j544g6TTlix/kEzEOUalKigY=;
        b=UxJThwJgBtkepgF1e2axhmQymFrdcSCPr3zvjzvCuk7gyndAT79kCcUYiyYx5dN+qP
         4O0sGl/qmW0exa9XtppR3DKQxj0tJgWb+Lpyn4WoVn+CQEVzk6owEyU9JzC0zAslRTp0
         mF0bzrqCVgFvk6c3LX/7VrvPb+g4F852pSTMobrCPfQZzpbX9eJIIhxAVd2hZYi/SNkL
         5nbQ+aYkwYbaK/+jVGgXeNOyrpm/IWdAOY51gqOEU+37RJhneIqE642QjZyUIp92J7/T
         AvIpwpzUn61WykowEgeWlEnrSYEUJTmzAdo3KOImCl2SftlPa7UZjFHJi9TA7nfJRsPP
         4Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714053566; x=1714658366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/c8R+r2wKwqushYa97j544g6TTlix/kEzEOUalKigY=;
        b=ovqkGn4Zsfk3TiirN97CnMsjMSqv4qKY8z2eImjwdZdzmqKruZI8lWKxPQrhuWoWct
         ccEFq90MggRvANukeg+enFz7JVGxtLpbPE6nqtcqMKYMPHjTvtraLSwa/xg39FJQyLTu
         64+2kGjoV4fhEJBMN/FfCe2nlSS1T+Nt3vDYAagWAl+4s9qWNv/vmYz9BarUvrbFGsAf
         C3CthksDpvSVOjsusVT4GMYdkOMhP8VQbNvLT5IHDjWYz2WnmC4K/ecpbnphjhMSyUNo
         QeYfJgluW/UaE9MBBFb+fJbRlr6tyxKRlhw3bZ0xgE/9ANo5P9+LkH6rZb4/FqieZ/fY
         0vIg==
X-Gm-Message-State: AOJu0YykvOK0IExXQHdPB+hdVnlhMW3mjXmgiMuEYmuYAhwz1rBfphPn
	tzWxfGTNANS454Gosn3ImyRKgA15wkRvmWb1hE49QY8yP4xvCXJBCPua3n6Kqpc=
X-Google-Smtp-Source: AGHT+IHcVSLzRPPOv8+VkqJn3b1N+UKHe0ajTrqk97KpyD5BrgPSvbqWpwe4PKtfGo8kjhQZEZa7bQ==
X-Received: by 2002:a05:600c:4f8f:b0:419:f9ae:e50 with SMTP id n15-20020a05600c4f8f00b00419f9ae0e50mr4641377wmq.37.1714053565674;
        Thu, 25 Apr 2024 06:59:25 -0700 (PDT)
Received: from fbxleo.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b00418a6d62ad0sm31479464wmq.34.2024.04.25.06.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 06:59:25 -0700 (PDT)
From: =?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?L=C3=A9o=20DUBOIN?= <lduboin@freebox.fr>
Subject: [PATCH 0/2] pinctrl: core: fix untreated named gpio ranges in pinctrl_pins_show()
Date: Thu, 25 Apr 2024 15:58:00 +0200
Message-ID: <cover.1714049455.git.lduboin@freebox.fr>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series covers errors I encountered with the pinctrl_pins_show()
function when dealing with named gpio ranges generated through the
device tree using 'gpio-ranges-group-names'.

These errors were introduced with the original implementation in 
f1b206cf7c57561ea156798f323b0541a783bd2f.

Léo DUBOIN (2):
  pinctrl: core: take into account the pins array in pinctrl_pins_show()
  pinctrl: core: reset gpio_device in loop in pinctrl_pins_show()

 drivers/pinctrl/core.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.42.0


