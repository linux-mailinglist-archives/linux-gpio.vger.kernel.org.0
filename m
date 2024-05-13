Return-Path: <linux-gpio+bounces-6338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8DE8C41DE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 15:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86205B21045
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 13:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC62152199;
	Mon, 13 May 2024 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oeRQKCeI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C451514C7
	for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715606816; cv=none; b=JewK1EzGtOUu1FdSPoCMbOnjbCfEHbLh+5N2B6lfr/NDIWhATcEyuoBejjdnMvF28CJW9Wf8MFIuCm8Jp9dtRL5yhCLYO8/hpBk7n90RWh6OqozMusIWc7Gr6PotmrV2/ETsAZfJoG87NcCUHsD/jT+vUnLFVmma2lrt7oMQYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715606816; c=relaxed/simple;
	bh=b7K7kPrdH0lk2Did9nbk2rhIphWevYOhfPILVbZs3WI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=MTgwLF+qV5wUB0PvjQlrpq+RBmIrCtcFJD8vycE90Y6QwMcBa2V+EqqNXBbOvx84DUnNnKELYheXWlVnxP9+k7ByQcw/nLGtpl8oLJYXZquOx67cevqXy4zQ7AY9jkNfMzpZRuUR9IQ9bai9wFvfL/GqILsPwLSuPs0kbl2PVYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oeRQKCeI; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f0602bc58so4840853e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715606813; x=1716211613; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b7K7kPrdH0lk2Did9nbk2rhIphWevYOhfPILVbZs3WI=;
        b=oeRQKCeIbRUfDUDOyt6l8fmf+xwPyj/ahWyUbaUZ3iFKjsZ6yXKtoSYBSTcZgMkb5N
         7IQGD7gbW3r1nmUhBMYq92CYaa6KSPcJMHk1EHxPpREC6SL0nFacRinQbINZV/iwPUEf
         iSVOdLtRzi4vXXO2V6MFMJh0Xci/kM+gpSbKxcjrdeSwBVOlZ7lWa0kFOE2Jgiqqp2iK
         Xwn6sO2qa6LeLlN/ZM4gkNOigCQWxV+PjTdAHgzxUrQFDndo9+jQdPL7hMik+PY0wL1Y
         SWtIeDeNPZNfcOQ/KdRFDXTDd7y6bTOKetQhi/rU27lul+p/hUjiS5g1l7xZTC2LnOcm
         31Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715606813; x=1716211613;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7K7kPrdH0lk2Did9nbk2rhIphWevYOhfPILVbZs3WI=;
        b=BJbvQfWizo2lH3Fb20iYUEujqEyCJ5Xj/igH/Rvzj6gcyk9FWtG9TKtnEBVbTsvMv3
         MYMmgFxURJJHvTkAig7bF6fXta7F1LOxXWdJ9HkxgNdSatp7axHn2t+nuL9bt8QqIiCZ
         z085/UeJui1rypMF3OHnMrKcmyj3YlAN4r2W/fbOSZsg9P7wOGve0U0V9A504JwUlzPt
         mmYZ5lmRXvemgFNZ6DTPjtvS1ZB6jVgaKQsZ5oqb0oWzpuB00bLtW+uVQdUmKcXofg2o
         M47TyZuouM4Mwz+ZBvn06Y5AZ2EIBVRoeGFKpChptNvDjxLXe9nvCPBe85jmX27wLpZS
         Q21Q==
X-Gm-Message-State: AOJu0YwNKpEIwlpYfBNWH8OBpQt3EuV9MmiapjmAA9fLMS6RZuBoqfs2
	8IHVm7P+9uZ796vy0/qpg2QFLZHcExeePPKYzF5LEDJwb6m+K1lT9At2S+f619xfo3JoTJ0fzrA
	3/C7MfKjcckBBY1wQytxlAzJOK3lV/+cMJFLwvRmf1H5/k5RqnTy92Q==
X-Google-Smtp-Source: AGHT+IEgbcYKeKadY90hQFQLAWTpyLcPLDm22VUYfnMmUokIN8/BP+hqoa9BH1auSpPqREeMczvEADKbQ8IDppeKF2Q=
X-Received: by 2002:a19:e00c:0:b0:51f:b186:8247 with SMTP id
 2adb3069b0e04-5220e373b52mr2852013e87.12.1715606812421; Mon, 13 May 2024
 06:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 13 May 2024 15:26:40 +0200
Message-ID: <CAMRc=Mev8M_jHw_zP7ETkmdoK5JzGTKBCS75Evt_445YHJVpxw@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.1.2 released
To: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I've released libgpiod v2.1.2. This is a bugfix release containing a
build fix with slibtool, relicensing the C++ under LGPL-2.0-or-later
and preemptively addressing changed labeling in gpio-sim that will
cause failures in bash tests of gpio-tools starting with linux v6.9.

Details can be found in NEWS and the tarball and git tag in their
usual places[1][2].

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

