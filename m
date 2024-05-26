Return-Path: <linux-gpio+bounces-6621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F428CF417
	for <lists+linux-gpio@lfdr.de>; Sun, 26 May 2024 13:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 147272813E3
	for <lists+linux-gpio@lfdr.de>; Sun, 26 May 2024 11:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5038C11;
	Sun, 26 May 2024 11:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSLZq/TQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D7DC133
	for <linux-gpio@vger.kernel.org>; Sun, 26 May 2024 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716723172; cv=none; b=IRfm9o4DURxsvrjH76tP36SqSjmBd6XRwzxi57DmdUTsMhfVOSckObufPTfma3wMJyd3XPNs94TVj4FBa6Kp3Entu4UfUFtAS6U9ahqSAdDTRgFzOyoGkHtj/6yNfFOToqYz9yT5B/1Pl42lCqZMJWacdiFlq+mU8WTnLB+8lQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716723172; c=relaxed/simple;
	bh=+7qDLwf0y4oo+70FQGtumqK8YMJU0IlI0GjlGQ7GjOA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QUGYKfqSaFTQxGhu8iGK2ghb1SI0mOoccmEO9k0QHQqKJpOvyn5RYr5Pq3vigXFbGZrM9RJPIcb91GMZ3OzHq72/5Go9Z2BYyhAmQcRGIkJFpO1AdzpsonWeC5O4VNFI1ahOKuwMXNdXqT2lk6lS+9bopFpjFxkM8u0v75F1/XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSLZq/TQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6fcbd812b33so996331b3a.3
        for <linux-gpio@vger.kernel.org>; Sun, 26 May 2024 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716723170; x=1717327970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9EvTMW4FBIQFf5df7t10amF0DrmjgI+lhScRrDnEwzw=;
        b=GSLZq/TQJDgyGjrn0Cmw87L6joGAoOYMXk3NYnR49ybcdMStw9gWqtUQEsR0PjD0Y2
         w+450q0EKgAS+DfNsSUtWFrWInmgu0Z6yFky1p7j3WtWFKM9mm28+hiBXPaCWhV+LnxU
         QsHa28lUhMcaqT2Iy2XsNP3XymqDrzcM02t5/nW3SZPlc/c6xq5yZ0LArdCaSYulDrZ5
         DaTH4qNDffZC99gmOJW8OOCTup9zfAKTpVSIB9PHCnAkCMACSVTY7pP7VyndS/zu/63F
         ZJxQVdQToK3ZoNV2CIIyVWKIJ/+ijDNv+UTZJ4ORPGa4Jl1GlI86wbe3hJ11i6csT2a9
         tkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716723170; x=1717327970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EvTMW4FBIQFf5df7t10amF0DrmjgI+lhScRrDnEwzw=;
        b=eO3OHTZ6QiIZm0QkYZhq+7yaqMLttvFfoO9osCSC9hBB8NkRqpidI5xVRa7ye7dJ+n
         vJ4Qv5QSC2o1CthZ09Hdoq87bb3lf+3SY3JW5ttrmxJS/0B5yPIFrkUC7wkfvxuksBBR
         ILYdNtZbWduvVYk36vXupRQLcRKS+i/cyjZjHpUXvJvmBSEarPj6Lervn1Sj2089PwgB
         1DFa+nrPggMGSlwV2G4mwNAXoS6OB9Tcgb/L1iMUgiXoHwH85a2IcM0bVzVCdHFIApOO
         360quU4fRJtuYF3vdjMPDqjb44CgXQSAYs7OUIjol7tijRUP3+xVhsV5D604+tA/hDsZ
         JeWQ==
X-Gm-Message-State: AOJu0YzmS+DeMzWo3xpM5+gKgy9PPDKBbBm8ecf9PLCoHix5KGhQpG3u
	ZTbaYuNfpZBLEO99L1qrEBQuq153A6NYOniIAAQwor0O3iVn7ly7qACn8Q==
X-Google-Smtp-Source: AGHT+IEYMVabJDGG+1a6p/jIgEQOCbPIymVXVdsn+m8MNgSfmViSFr6dn1HOQx+sEEwRxNFhkB0OWg==
X-Received: by 2002:a05:6a00:4405:b0:6f3:ef58:2dd0 with SMTP id d2e1a72fcca58-6f8f307619amr7741970b3a.8.1716723169431;
        Sun, 26 May 2024 04:32:49 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6fd94372addsm1793646b3a.186.2024.05.26.04.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 04:32:46 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/2] bindings: python: fix running tests via Makefile
Date: Sun, 26 May 2024 19:32:32 +0800
Message-Id: <20240526113234.253859-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently I couldn't work out how to run the test suite for the Python
bindings.  There were two problems, the make target did not run the
tests correctly, and the tests need to be run as root.  This series
fixes the Makefile so the tests can be run via the make target, and
documents how to call it as it isn't totally obvious.

Patch 1 adds a Testing section to the README to clarify how to run the
tests.

Patch 2 fixes the python-tests-run make target so it will run the tests
as intended.

Kent Gibson (2):
  bindings: python: add Testing section to README
  bindings: python: fix python-tests-run make target

 bindings/python/Makefile.am |  6 +++---
 bindings/python/README.md   | 10 ++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

--
2.39.2


