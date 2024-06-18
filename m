Return-Path: <linux-gpio+bounces-7551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C486090DAFC
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 19:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99537B2169C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 17:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFDC146580;
	Tue, 18 Jun 2024 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqblZ/Gn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A63F1CAB3;
	Tue, 18 Jun 2024 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718732934; cv=none; b=m7CCPgxueGT9CH3d6Yd0Eo3iOLglAqO7wKOq2kLqclaGGd7pKK9aDVc6h5tvf7PkQ2uCZ7hy9/n+EaNude1u3jGS1ga0fFUHxNIcgBe2bs8DFX6aVB8Un2Rkd73MMOLsN81wSXEZ0UqtSaR6XCpHLFR7N8EGS0scDKzgzx+u8WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718732934; c=relaxed/simple;
	bh=83KueWuF69bcrQYC/+irrjopSPrUgxVb3Yjezczm0Zk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V5qgP/66N0tt3LiqMaREMVfl52wbUT1ESClqSnnce3uS1NHqpBjMK6shhANwf0kM/ymyR4op+rK0TkCK87DX6ckuDLVwiYUFbHDqvNlJk+Zg+xxrxxEns7eqnFnNavv+epcniAsV4AfjfEc5U99EDuTWVKBCfjSryWGtKCOoskM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqblZ/Gn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421820fc26dso44886095e9.2;
        Tue, 18 Jun 2024 10:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718732931; x=1719337731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPPc6JgDH2AdkCQWb3jSis24LYSdpaEfrT8uwjdGIKU=;
        b=IqblZ/GnI+K4pSs2gvGbrOIdWsQUvshstPbRe0kPJkXZnc+KN6WprKWWdYAW4Vuqyq
         baKW90rsvCmWj/lkZbtoeF9jb8rPbbjrMewcKarqxZm3eIdXpNlku/o6fzIyEYT+wO/M
         1QtlsSk7Fm0qhdmVAk+7qHtEbHUOLC0imt5crcpbyxei1im/ypteT+uNvVIuX6p098Gf
         kgNDwoJhzkCJTaz7MyRA5ED+ZQXO6Vz/Lsg1s/36aQkDGJcoXSE5LEgnAvx5yMk05qJU
         dYSIJUhehXaqaqKnJJEpXQbe6olB4UPyf5klVryPqmFJvT8j0mzxwN+KObPjiIwtMVsr
         MmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718732931; x=1719337731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPPc6JgDH2AdkCQWb3jSis24LYSdpaEfrT8uwjdGIKU=;
        b=ovg4PiMSD0a61bZ3wvDicgEkadrrNOZ2sTzEjFtOqm8Zkq+Dd17TwbLMG4MFTdNLue
         ZvDpZh6Jc2wyfQCXV2xGqQBFAlXclKZkpq8dkP7t6nuI+co4BVPz3YoGl85vNDK50FoF
         i2q5ABwG7rrAXGWfdgf8L4/68BZFi4wRZV+Eb1H9FKTTIrODRWuq6nINFkvWvbiyWFGx
         1FTs+6q8b7vLDBDi6v9yxtEzlevzkjrsb3JdJkcRpANWWCfih+1bUYHHKemtkU7uNQFN
         31APqgZcuoe/CJ+SjjeNwLtrBjK3JB3OFXAzCRdXl8RraDZuJu4Umc1vM7DjdK1go3kR
         T2GA==
X-Forwarded-Encrypted: i=1; AJvYcCVrCkY3xa4T00zopfHPklRyD9QoIGsshU8XIsOLYSSJ1hNrXpwOHPv2v1oyzIxbIuR6ayvW1jqJDVvEmTfYdFGNW8jUvJYZ3St9FOP+zR5DHRjN/v2cjVtfVFJgyAGpYK0KYlKQqa3Png==
X-Gm-Message-State: AOJu0Yxu7SEk+62gYlQf9GZC0DmxKzDAu/lnFyGeti3Eiz+RnNoxU9KY
	yEb+Mdr8NCbLDqlLCPIv5z1lzKbWii7ZWog2JRsZqvN1rGn021zN
X-Google-Smtp-Source: AGHT+IHR8VmbHYZ9D4l4SUfDQ0rC1PSQYFfJr5GUUQJ/VA8xU+FAcZMP7dOJd776FbfRzvmpCRJU2Q==
X-Received: by 2002:a05:600c:1c8e:b0:423:b631:24e2 with SMTP id 5b1f17b1804b1-42475293225mr1284665e9.29.1718732930943;
        Tue, 18 Jun 2024 10:48:50 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:d6f0:b448:a40c:81a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36289a4faeasm1253644f8f.95.2024.06.18.10.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:48:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] pinctrl: renesas: rzg2l: Macro Updates and Reorganization for Pin Configuration
Date: Tue, 18 Jun 2024 18:48:27 +0100
Message-Id: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series updates and reorganizes several macros in the
Renesas RZ/G2L pinctrl driver to enhance clarity, align with the
current configuration requirements, and address code structure
improvements.

Cheers,
Prabhakar

Lad Prabhakar (4):
  pinctrl: renesas: rzg2l: Update PIN_CFG_MASK() macro to be 32-bit wide
  pinctrl: renesas: rzg2l: Adjust bit masks for PIN_CFG_VARIABLE to use
    BIT(62)
  pinctrl: renesas: rzg2l: Move RZG2L_SINGLE_PIN definition to top of
    the file
  pinctrl: renesas: rzg2l: Reorganize variable configuration macro

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 59 ++++++++++++++-----------
 1 file changed, 32 insertions(+), 27 deletions(-)

-- 
2.34.1


