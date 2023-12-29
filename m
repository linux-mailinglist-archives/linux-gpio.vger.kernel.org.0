Return-Path: <linux-gpio+bounces-1913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 315AA81FEB5
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 10:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7F2E1F233F5
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 09:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25517101F8;
	Fri, 29 Dec 2023 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQnsy9Xr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF0910A07
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28bcc273833so5612550a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 01:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703842418; x=1704447218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NnBf7ReCY+g23tob722YJCXfDr+g1uDDFKIljC6TW1Q=;
        b=QQnsy9XrPM5RquLyfOevI1Fp+cXCm9y++H9C753HO5QPCpQRb72mYIv+q3s8t2adDu
         6yfAHy2KWwaTUgFC4ugxNUdpaajJCJBtk6uenPUxupbjaYOR9Q59witVzevI2YJusHV0
         jpQIdaBwm5dBESoIK6dJciD7y+CF9s1riV1ET9tlIhEE/pLy8a1odzL5jgFkir3vWQC9
         nDAKi4HImGURIB2r/ODcF2P/7w5paGUurSmDrG2YVo+oobalIokKGvKgGiBrcmx/wNoU
         rxfIkwkobAR6JIUAAIVqXrVdhtlc5YMQAfELbmHfAeACsMVwgss5GaxE0cvl1df7oY90
         21tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703842418; x=1704447218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnBf7ReCY+g23tob722YJCXfDr+g1uDDFKIljC6TW1Q=;
        b=ZSpmntHGwYcCOc2c3xh9du8q9ZEV0PDU8lIKtkNuq0ntD+vQ2jhESNi6X+STm0ckc1
         k73LoAp1QzcY4ORNo9/dgIJuoWsIZ4dMkEBGhwYQh4MBcihcmIUJ6Ax1bMAEaqT7z/4Q
         3jOZjEJOb8j9XZ9ho7n1Ezj6jA6b1Aym+hqBKI5eKqWIchvsKshvrzUNkh9dSlJUYtuD
         qtD8vOGgNaj5GVpJyI6KjR/bN6rbNwKyb4MRO9Wx0z/a/VaAgsQ2KITMK4Hwg8QJ4rhv
         yFifjmBAM+8jvPeyz1ahMocdl0/1vgC4LhV/dj5tUMP5kdkNIVJET10BhrLJqnhWIM0c
         WhOg==
X-Gm-Message-State: AOJu0YxnF2SnNXI3M0h/9AgdYnv/pZhi5kND0WQfc7xIsN9YDNn6fYP4
	LKcxkK9+9K5fZT5V49mvm58GyPlYI/4=
X-Google-Smtp-Source: AGHT+IEFwygujVpbPs4CC+lZrY0i3h3XQw3Q0f8LAHS1ErhiHq17aMUT/v4XFDWq6X4RY6yMqz8qTQ==
X-Received: by 2002:a17:90a:f289:b0:28b:f362:ca83 with SMTP id fs9-20020a17090af28900b0028bf362ca83mr6101462pjb.88.1703842417738;
        Fri, 29 Dec 2023 01:33:37 -0800 (PST)
Received: from rigel.home.arpa (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id pi15-20020a17090b1e4f00b0028be1aec1b6sm15600907pjb.52.2023.12.29.01.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 01:33:37 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 0/2] gpioset: improve help
Date: Fri, 29 Dec 2023 17:33:26 +0800
Message-Id: <20231229093328.62366-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of improvements to gpioset help.

The first is another swing at improving the description of the
behaviour when gpioset exits.

The second patch better describes the zero-terminated
sequence behaviour in the toggle option help.

Cheers,
Kent.

Changes v1 -> v2:
 - fixed the subject prefix.
 - added patch 2.

Kent Gibson (2):
  gpioset: reword note on post-exit behaviour
  gpioset: improve toggle option help

 tools/gpioset.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

--
2.39.2


