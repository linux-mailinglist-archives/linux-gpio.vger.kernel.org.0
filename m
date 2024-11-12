Return-Path: <linux-gpio+bounces-12863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BACA59C5821
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F4D1F22C76
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 12:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3401FA82C;
	Tue, 12 Nov 2024 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1bv8jJjz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0DD1F77AB
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 12:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415469; cv=none; b=O4WO+GTO0SBVKAvsaqQpSC/KWdeiYGfKGhtnrqltO39Y/0EdryvQc9wjomFoapW1jwlYLr76GpFEUaLwXCL9s0/IPu+ew84GnG1ed1fwxF3rwEBNIZAssJIYaBHT/9yRFPG7upo1OJVT3zt/zZHcFiSfoAC8uI+7apxUDHzgWwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415469; c=relaxed/simple;
	bh=1DcQAuJtcl+n4C7sRLuc/K/Pk5xbKGuGI/vmSuhEAqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AC8LXsm6VDzF+M2imUtGEoD/hj8j8+cJhUEaUo5fWzUMRcE2LBwJyhqJbyVVOnQC2ytkVyt1z/7xtanDSQr4OMFzwxCAdOBtLcrSeLpJeB8YSA2CMowHIspf8S9MrGUd9tc8+8xpt+ptm9XTyq5zzOw93OvtKI3fc2/bSiT1sJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1bv8jJjz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431695fa98bso44246685e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 04:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731415465; x=1732020265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRNafw60/idnuf98xxQe9kEjUqrljPlQJTzcImYVT48=;
        b=1bv8jJjzaoPi4x24jj3Aczqmiv03amRaJprcgKUnhhUNXRWt8TFRd/k5SoPrAav1L0
         3WX93oi3iXq1Hb4GaIPOPK1fmP9uPury0EMDMHanDkXVxPtQVJKrERO9lvFscEEq2ztI
         oCHa19SiAnNd+sNqetM+LCVBYIiIO3wHT++PincuFw2YDRYLRX7R2GsaYbzySbHfl9JW
         POGwH9OebsrOJz8LCamrIqGn3/Z5vP27kxc7UyKzNf6va/p/BHFicTRQ9rvoIM+PsX7Q
         w0HhzdJOLDTGM0CfX4E9GPP2G1BsnrwZ64d9NgCJvUbtDQlZGnhuUID4FvQZpLDmBs+h
         LTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731415465; x=1732020265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRNafw60/idnuf98xxQe9kEjUqrljPlQJTzcImYVT48=;
        b=EljqtPx5BRerhKCXUq6oAO5dWxJmNy6Pe+XnFHhpKPGGMcKj+YKRMBIQ2l1tdCUhRS
         7G8gbdk2SGlsKYIR7Mthd/JtCuEPmOqRuSRcK6gWSxcDApps5v59cYdlKfYDltx2H3dC
         SF/9C0hH9KrcnuweKXMqjITqGgF2s2TNLlDe3sSFD5oy/srlxkvCvr8cAfdNq0gypIaq
         uNPTbrcs3e3UvvJTx55E9adOPZW63vtROT4gxR2N/GawGKwmZAeyr+VYv9zqDaJw8NdM
         OfIEHU7CSxRjp4vxhZ5TlcXulL3j+7ilkwWS48gQ3i/m08nuJRFVo6O9npp6iBcEN8S5
         C6vw==
X-Gm-Message-State: AOJu0Yz3j5S9FveP0x51K+zjdoo/nnrEjYtcXDfo2rNV4MCu14fuIyVO
	Ink0ym/7LyEnKnf6N3XIKqZoTN2bCfQCHcWCxufNcSITPESYF6MaoeaUJEv4lF32vxlJrwU1I4G
	5
X-Google-Smtp-Source: AGHT+IGb1RF2CgnoSwaMzFrH7fetYC1vGzOlmRkeJDZEyySeZt4SbwWR/ND1LII8+T5CclgBfCdCgA==
X-Received: by 2002:a05:600c:3b82:b0:431:50fa:89c4 with SMTP id 5b1f17b1804b1-432b74fdef5mr142858445e9.3.1731415464973;
        Tue, 12 Nov 2024 04:44:24 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:94a5:ced7:f64:fdaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432cf116bc7sm14768435e9.0.2024.11.12.04.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 04:44:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@xes-inc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	vfazio@gmail.com
Subject: Re: [libgpiod][PATCH] bindings: python: specify a tar extract filter
Date: Tue, 12 Nov 2024 13:44:23 +0100
Message-ID: <173141546104.40049.12455787437684528122.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107205001.574426-1-vfazio@xes-inc.com>
References: <20241107205001.574426-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 07 Nov 2024 14:50:01 -0600, Vincent Fazio wrote:
> Starting in Python 3.12, extracting files from tarballs without a filter
> specified generates a DeprecationWarning [0].
> 
> For Python >= 3.12, specify the `fully_trusted_filter` filter which
> replicates the behavior from previous versions.
> 
> This filter also makes sense as we should be able to trust the tarball
> the maintainers generate after the hash has been verified.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: specify a tar extract filter
      commit: b66ebbbcf96f104b5d1d8f66c272f737cd8eed90

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

