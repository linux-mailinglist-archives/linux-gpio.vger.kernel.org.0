Return-Path: <linux-gpio+bounces-18112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE18A76018
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 09:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36A20167F77
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 07:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E8D154BF5;
	Mon, 31 Mar 2025 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AVCWPGby"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AAF4A35
	for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406300; cv=none; b=hLtuOmins0l4QVo4FFuI/Ff1yLQZ/qJXDNI+GNqH7PvKuxR5GS0V1BWrx/LX9bltw5WVtv2DwyQg/2pE9aaLRggVe/ryrX9quSmzF4qJVfC8TCckfKFOQVAMrz8jQqSn1J9/5nPJScNhr95zH+uxi+5m8RyCEkDR/VvDpsUgdtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406300; c=relaxed/simple;
	bh=knFhXKvEDJGFbudIXE8JAamNOLcxmYQw+uY+SaVcgvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bVh/fnLcnf1+CCBt1VKvbOlcDLsXPtu1EqrARG9iSkvIHJKdaNsv22Dggx1ddNRZC/QSyRCYbrVRymVZfgKTZNSGKxwR/Jtg4YvWYOtOJ6ZEzvu2l2ANWmelGF3pmbc5xOuPXtZwA8IqFjuqoc4MXh6aWBT4iOLuP++h4b0LRkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AVCWPGby; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso41792775e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 00:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743406296; x=1744011096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqg96z6UKkeg/eLhrotVrzNdlbxewU7sjG7ZfwNa5sg=;
        b=AVCWPGbyxL4kmH7Tyr4elszbpZEgE/aATaGjOVWnsZG/LxFnMT9CSGNY15HiFW5k3T
         S/3pNAppaB1d1qZ7yrpEGnXd6IcUGeSwcQ0Gf0m/C/He1lsbDoA5YaEJ2kocfMkfuyW8
         5YByJegxrxIwJ+e/4PT6gtsBjwfKxfP2ONZI3VUD+1dJWzsMXXtoXSLuPTRF3fMOMXWZ
         ThRLXIbJgRumApZvX8AGxI0CCJyfahy9oGW02HQcUxLSq00MkKFrOyxrSAgIaBNKrUU3
         SiL2Tao4FjuGkEX5bziNtjqBtBsb5gN9yt170Rvo+Y/0TEod9XLii1XOprS6+Thm5bAJ
         4k5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743406296; x=1744011096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqg96z6UKkeg/eLhrotVrzNdlbxewU7sjG7ZfwNa5sg=;
        b=ajnzWIU36UI41DRJTIKv/PRJFK7PCaopa20Tq016SATcqbOSVyDZHHPWbDy4gIbA10
         e4sGb4QGAUxFJyYeTCqPldBD+wBKcrp9UymsqIey9gtqRuo6JQzZ4fmIO0PuD4sxv0eJ
         U9czawE1I6Sw1wLrOm3o9GtkFpvRB0HgKvq1PGR/qX0ZEqZoy1ywkEWE7OawQEQYfsv4
         hiBV6WuRO+hyF8/nsvMUVl3A0+OVh0ExAOlkBq/hQSpTHH60Bj017QZRXM3FX2Sjj5DG
         AyMcbDilsM7zw1PwI0ws9a+GC15iS/PcChIGYbdSBDNYlINR/+cZ9XxT3FI06PeY/N84
         CtKw==
X-Gm-Message-State: AOJu0YzFiJczu/LiX5lxQnoi2dp8BKN3Wm7Df1dt1xG9+aH2wU57vkB7
	QXevk94rcuu6ZfxWE2k+GyB9EvLdfuTCraVl7YWLn+8mY+HWV9XtDbv7opr8DaZKWwanZkewmdY
	z
X-Gm-Gg: ASbGnctz0nwoH80gXI54VDJjKaDTEoJany0xHxlevvrxy5Omc/to3lrrerejXgl4zcS
	c61jecFQSbOzTU9P8MmeEMPYhsfcM71f5RF7IpeK2hwKKmZE8JHQdwFShf7hIqcYHgg5H1hP57s
	YUt8C0IKzxKpz/h9kQv74inei2ktpSiBPIhuZM+1/NO8T6ZUiMQ0Yk0mVMlndhk7XeCWL4deYOq
	KVR3F7Pmkmjjuvk61izrr693zH6ICU6mA6KggVVT4BRAHkNJggIdKhrdbFdT/UIgeFxBhus3Bt1
	dCs5rVKG7+Ruh4BBj9ENZDjh5O6WYt1oKtN7MD7zH8La
X-Google-Smtp-Source: AGHT+IH22iUAuEpbszjp4yQmgXIRXopEtjGeTPEtXCiBv/q/AROK7yZEk83aijY3pW+wBh5cg3M7nQ==
X-Received: by 2002:a05:600c:c0f:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-43db62b7294mr58412855e9.22.1743406296062;
        Mon, 31 Mar 2025 00:31:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c1db:ad07:29d1:fc13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4318sm10329911f8f.87.2025.03.31.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:31:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Rostyslav Lobov <rostyslav@exmakhina.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] examples: reconfigure_input_to_output: Remove useless variable
Date: Mon, 31 Mar 2025 09:31:34 +0200
Message-ID: <174340625335.16309.1378200414248777031.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250329031923.564215-1-rostyslav@exmakhina.com>
References: <20250326041707.GA62833@rigel> <20250329031923.564215-1-rostyslav@exmakhina.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 28 Mar 2025 23:18:07 -0400, Rostyslav Lobov wrote:
> The `req_cfg` is declared to NULL, never used and then freed.
> 
> 

Applied, thanks! Please use the [libgpiod] tag in the email title, I almost
missed this because it doesn't contain any libgpiod keywords.

[1/1] examples: reconfigure_input_to_output: Remove useless variable
      commit: 9f0eca2d7260de1ae22fed3795280bdb14b62e57

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

