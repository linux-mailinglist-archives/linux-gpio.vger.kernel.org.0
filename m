Return-Path: <linux-gpio+bounces-7302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 412A0901E08
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 11:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE4D8B272E3
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 09:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D4F74062;
	Mon, 10 Jun 2024 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8lmwmSj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AFD74054;
	Mon, 10 Jun 2024 09:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011391; cv=none; b=VHq8ePDFJTYrAewYzAT0JRcosTR1FtDnMfPFNcNPRYLTvu0W8INfZJ2UkIZtg5Vg8f+qFnFexbQi9oeh4B8dNlYu+ueZQ9+T4lpDbQFfnV4dcc36X32/1zj797HakKjO3UkyCpzt/FzfJMPqvTSMehEg7I+wbokdGjH00N7XV7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011391; c=relaxed/simple;
	bh=2UiqJBiAjg925Mv8BoowfUF9MSCJtuTrlQ3zMSsUDyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QDVQFwhZwIMcU6UpSQdpBUaeIIDkUiu/RQpcjAAIGBDUBMXyqk3hDuDwr2KKFPVPJPlx4CvwYF1625CJxLa0Ymn7n4pkChNAZM6W/puZ01+NQan5nTRyogvwJMp2Sm5gRV/6S9Zm5tJSuc9JaIYOSwBhrA4N3GDk97qJGdZpSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8lmwmSj; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f4a0050b9aso34848495ad.2;
        Mon, 10 Jun 2024 02:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718011388; x=1718616188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBBzEslwLKDs7+wwf/Rd0uuhAioTAEZ+jnOaZqf3V2M=;
        b=c8lmwmSjLtdAm0mvpsq6ffQDae6DXhPgBVtaGypPAo8C8TGJGFP+5pRefjQ4f9NiHl
         biK50hqEudKjG3uaiTvoeCXRuHuFdEYkf9jbwsAwBRz/Xy6EtdDnqEB5qddRMsutgW+p
         EKJXlsk+KnQFe+KYgOcfL932hnr5J0augr5gPgPUn9eSksNK16Ig+LJqxe3qa9DB9wDv
         xF3aXwuXbA9erpDRMGRgSPi7/e1sDFT+3zdHyj1R9qKQS/8WNbKmsLfN0ZP8YjpYJCgF
         oDXvteG2UgAdgaKXImuXDbVRCf3h40GGmj2M9LCWukyC2ni7Lt/1rYS7IB+6k9TjrWMt
         eIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718011388; x=1718616188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBBzEslwLKDs7+wwf/Rd0uuhAioTAEZ+jnOaZqf3V2M=;
        b=msVOai0LO3nHMfRJ1IZbHWbnDzp0XWe5ugVRz89AUPlsPi2UVEO91dQ6sPTUbxPNqS
         FSe60I6Zd5k32k5clp8LRQWF13KwdNbORThpEdMwuzyC+9+aGey5q5MCpXLc9dGtG9ee
         5KmOIa2lUA3TOcpXKY/Nz+4FtFKwHVzSoCTre4IHb93JSIwfNt/lNhBWw7gi9uvR7ojg
         X9m4dSMuYUCP2kBo7zl6JnQrDDvnUsAJQCMOdw+nL7pj8mspb3teqcSliTjVCdc/u9so
         UDnE9e8gFl4vxftBnvmoY0C0dMvYE9Chol1B4c024E1zGTMg1XT6eftucMzjNLrFo1sp
         2cvg==
X-Forwarded-Encrypted: i=1; AJvYcCUJZsCJ9jqSQACuKzfLRq7n0h0r9Xs6f8DIfyD6/s1QVRAKzb/TtmQPGeOsL5X2gZ7WaTiq9RQgw3SUceDojnFE/eJmV9jNDyn01yskuYzbMpAlMMTOTRRsA0kOZeuWe0rg4/W0mg==
X-Gm-Message-State: AOJu0YwWS5/sD8S93+YX4G79LSVuoRFMziHoF1gm4rMBJrFY34ckFBbh
	tsloiKefUA+CEwr5ibfBIxcgj1KsxXdmE/LWwi4u4T1rEKD5wX8fHhDmCQ==
X-Google-Smtp-Source: AGHT+IEhVekrwr8a8hID/dU1DA8uY+yhBliXrdKeDmzy/Xx+MqoIFAjee9VwRsS7wjU8WrVFLjjNIQ==
X-Received: by 2002:a17:903:230c:b0:1f7:2134:e8a4 with SMTP id d9443c01a7336-1f72134eaeamr2835145ad.49.1718011388292;
        Mon, 10 Jun 2024 02:23:08 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6efa2a319sm41318395ad.108.2024.06.10.02.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:23:07 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	brgl@bgdev.pl,
	corbet@lwn.net,
	drankinatty@gmail.com
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/2] Documentation: gpio: clarify that line values are logical
Date: Mon, 10 Jun 2024 17:21:55 +0800
Message-Id: <20240610092157.9147-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The line values passed by the GPIO uAPI are logical values, and the edges
returned are based on changes to logical line values.  While the
documentation consistently uses active/inactive terminology to identify
the values as logical, this is never explicitly spelt out.
This series clarifies those points, with paricular emphasis on the
effect the active low flag has on values and edge polarity.

Patch 1 provides clarification for ioctls passing line values.

Patch 2 provides clarification for functions returning edge events.

Cheers,
Kent.

Kent Gibson (2):
  Documentation: gpio: Clarify effect of active low flag on line values
  Documentation: gpio: Clarify effect of active low flag on line edges

 .../gpio/gpio-handle-get-line-values-ioctl.rst             | 7 +++++++
 .../gpio/gpio-handle-set-line-values-ioctl.rst             | 7 +++++++
 .../userspace-api/gpio/gpio-lineevent-data-read.rst        | 5 +++++
 .../userspace-api/gpio/gpio-v2-line-event-read.rst         | 5 +++++
 .../userspace-api/gpio/gpio-v2-line-get-values-ioctl.rst   | 7 +++++++
 .../userspace-api/gpio/gpio-v2-line-set-values-ioctl.rst   | 7 +++++++
 6 files changed, 38 insertions(+)

--
2.39.2


