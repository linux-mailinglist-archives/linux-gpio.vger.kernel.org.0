Return-Path: <linux-gpio+bounces-8093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F5E929FA4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 11:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 302441F218C9
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 09:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C85E6F2E9;
	Mon,  8 Jul 2024 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RzmCctb0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098AA41C69
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720432486; cv=none; b=Q4q/bHnt6TcLOUo5XljHytyYyVIlYPowKLkh02utngS7EY21EL2f85b1XkVk4opwvskvoyf2mKR3UZyMqt2XbCQ6BxxEtTFDBPIJb64l5GnXj10T1YzfaWdW5YKzprDRUqct0EFcXaHvDj6IeDtTBfDHlmNw+nOvNQ95anfglhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720432486; c=relaxed/simple;
	bh=YXFhwXrZTeT002OvA32onpnVmv+nw1VhbHfCVQydhp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utRFxerz46FwJ5uJ/CCyfXet87VV8ZY/HwGnkA/DbJNtf5dFXU21sIy1px0k5EZJavHyUkiyRAZko6Qr2oQm1MsRxjYr5Okw5dzjmtcDBN82qLfJbT0ObSOmnN2czIx+59jfx5Mm+rO6uED6Rm0fDlZpwmnxNVtiyo69CY6gmjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RzmCctb0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-36798ea618bso2390234f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 02:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720432482; x=1721037282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npstF0FJC1Wnu51NN+/xSkI6xXzylocT46D2Wx7p6P0=;
        b=RzmCctb0Xh8x1SBIswlT+3EXrG44uZsYVkC3/+o9VPNsVds4WF05a9vDCBVdhuHDX6
         Tm9+r5wCgDk4v/vY+2xoBJgHpF/Z1LpYQO5s1XL2HcxODydbMICnNm+6erGSD7IBs1PW
         Jvb9oprwClESRmME6vBKZ/PNGDdDPwEFCBUBHm/4cfKgIyGDvNw2pjonKNbF9RGcGLsJ
         vxlSu4W1+6OhCU8rKfJTWgqmPlh2oanHTaOdjVQFG0FVgBljp24vKhoPxS4+taBKnw55
         ncOVwqQqS/rISuakYldiZ2XoS08NatA5Wvz7rE7qMPVHwXd7KTMGKQT9REqjSGA78Rfx
         iVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720432482; x=1721037282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npstF0FJC1Wnu51NN+/xSkI6xXzylocT46D2Wx7p6P0=;
        b=L6TwgOhv1S1Q5T7wBFWBuC9BanlqjH7tlOZZ/Q+Kt2clGR4ZkShjj9zW3WiimRBe4x
         f3gRxJgYFm/hkI+EUKN0hca2roy0z7xusLvBqVM4Qrx7faurvGhVHzHXLL3E7pn2w0up
         3lcSy8/US0mA5qIozbbPlDNLLA56HgETtRrf9mmSTHpFi0raL3cwcyw7TxW+/04msDpu
         zbtriSYjdGQx6Rzo/s78qNBbDxYU03Hj4VicnZaG2fSmGb6lE/ReamuXwmUhU070Jlij
         oU7p7DMp8tRxl3zr8NI+wnVX+1LVPu6whI5BIZjmcxowSCgwTm9L8T52VQAJqHtvF9Qp
         z78Q==
X-Gm-Message-State: AOJu0YzTciaufsAdljp0b3A8OjPmCk3iN9jYg0WeX/d5sJ57CxhvPO4r
	IAV6rHL7TWA1CaVQDRU+9mKuKY5ccUXwtbbAtn3HzIFv5JvxZgI57SO2mzrsP/W9nVM96gJ+5bP
	4
X-Google-Smtp-Source: AGHT+IGI+Do/WpoibNLBP90hY1hNEFoDZd4T0KFdMKlCj2xxpk6+9liEKkl+7W3rdH8VwXK/annNWw==
X-Received: by 2002:adf:fdcc:0:b0:361:d3ec:1031 with SMTP id ffacd0b85a97d-3679dd31270mr7269076f8f.31.1720432482670;
        Mon, 08 Jul 2024 02:54:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678aa3caccsm14919600f8f.35.2024.07.08.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 02:54:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/3] bindings: python: more flexible reconfigure_lines()
Date: Mon,  8 Jul 2024 11:54:41 +0200
Message-ID: <172043247795.97027.17210630642440117313.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626053808.179457-1-warthog618@gmail.com>
References: <20240626053808.179457-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 26 Jun 2024 13:38:05 +0800, Kent Gibson wrote:
> This series addresses issue #54[1], making reconfigure_lines() less
> restrictive in the configurations it will accept, allowing for
> misordered configurations and reconfiguring a subset of lines.
> 
> Patch 1 adds a set of tests for the new behaviour.  These all fail with
> the existing bindings, but pass after patch 2 is applied.
> 
> [...]

Applied, thanks!

[1/3] bindings: python: tests: extend reconfiguration tests
      commit: 40db20eec045b026fb76089fbf46417bae20026b
[2/3] bindings: python: more flexible reconfigure_lines()
      commit: fd57153ab2ba0d05f359f21eb72765ac1ede8fb5
[3/3] bindings: python: tests: add coverage of kernel reconfigure as-is behaviour
      commit: d2466f5ae2b4541ec6d231e1cb5f00e86ec51195

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

