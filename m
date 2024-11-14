Return-Path: <linux-gpio+bounces-13004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B99D29C8BEA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E738B30B28
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 13:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415F61F9ABF;
	Thu, 14 Nov 2024 13:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Eaa/wNWo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F3018A6A1
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731590343; cv=none; b=uHr0DfhPnknAMEM7rlYegJrscgXUGVUUkCKLn5VfviVa9DsFTh4n2mpS/i3c/t+oEbspUnZNpHkIh1VV5uGFXffNAUgZV1qHx2yXNh19GG512F5mYXT1tpVRBvB1bxKN0fMzM3SPy/xUnuRqfr9Wb9MoSLHucDs17QKcWuymcys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731590343; c=relaxed/simple;
	bh=rky6Al6tCwHSqjpPchDtXXIcpIZhkOHEeHxRpSVbRcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XCxhWTE4xLk7MJeB/8I9n5Ka05wkUHVUBMeahsy71/Z8jtTxun3jweG67E81ChiBYODi122eY/XJ8yhC60TMfx0RDxqsn34bfbk6n2Pv6EOB9i9FOfoUQkJcwc9nKncQ6rJGAYhWEgW0paEjW5OOjVAxgqmMOGDYckbgK6e2T1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Eaa/wNWo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-432d866f70fso5620685e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731590339; x=1732195139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxArqgn6/gN4mn0xG/wanFzlgINLShG3XHL77L/z0zc=;
        b=Eaa/wNWoUcmWqnQo/ckMPiro8SFc2Fg8C0XeVgnxzR30z9WuF2FPwdKVrarFl5plMI
         2Ov9COaJ0JmhWwQXvTthWAXITfOYAMJQEyiHHBiWP6v4gQKgOXDajDQSwEpxu5/pw+S5
         iM9cdjN7QBjijIEiL51DjOFOTWBhR5Kf8mqP9GYkMM5IsH+jwn0LslTb/kNL8L0lgdII
         IhhfZCsuQ8G5J3uSMqSUmzUxlx44UM7embU9r1CnYga94qSKPY0x6Ky2+UzXo057X/Qt
         XmGq1HkcgZR/ONJ7CYfHYBm5gcriwjJkEXyBD0AihYnF1KNDavG+3LdxCNWLf9jcqThv
         q9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731590339; x=1732195139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxArqgn6/gN4mn0xG/wanFzlgINLShG3XHL77L/z0zc=;
        b=gir8F/eOOYWNC3hdphn8EL9upLaMPysyWZeORWPEnYJ8VJMPqtZ2MMy8B4I1kBperG
         WfUK8Af0Nxu9IL/+Uvw7+iSZ7gqhfFMDtX8x6DgAUboXwEBDGWhUEfyH+sC41T8G5Ehs
         nFOcobAdPeUn+LK07lPUNObVspMmwzCiEqHw88pIwSB3j8pulpF9NXpWSyR7FVk25fSK
         NUksCMr7rtNOsb+lJQyi+3Ud7+fjQSCrVM5PVmmNai3NzgDLN4JBBMmbfm1DVnggG2NH
         /EhWw1/05qqC8hmJe4FeUDfHmX8GXCv0W7RoJA4MwYBLrJd4Yb5igv5cN0y/yfxlV/+H
         wkEw==
X-Forwarded-Encrypted: i=1; AJvYcCX+N1Bo25uV6pQlTp2c9cCM+7PHvP+Q3NnQHO5QdNnlHdw1EceBjDqZcGv4VG8RHQO9Xx5nvuK3J7nD@vger.kernel.org
X-Gm-Message-State: AOJu0YzZBNmz39qx52QthLLmF/zV38Pwe//KpfSvZ+dgonAa3GplVj/5
	Q0kZxaYw5iOF/anA+sXdr8OPfagWDgUv4gvKCqnxfFYjpjGK5DBpaOlOCLJGths=
X-Google-Smtp-Source: AGHT+IGe3zy069imwX5uFJ/gzgQAHR86UPZ4C8UNTSm2TUAHO9FBI8bh+1MzkRn5HaXEebPppyMzJw==
X-Received: by 2002:a05:600c:4590:b0:42c:b4f2:7c30 with SMTP id 5b1f17b1804b1-432b7515c33mr190568265e9.23.1731590339495;
        Thu, 14 Nov 2024 05:18:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d8d6:4da5:9533:12ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab788e1sm20247115e9.15.2024.11.14.05.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 05:18:59 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	gregory.0xf0@gmail.com,
	robh@kernel.org,
	Charles Han <hanchunchao@inspur.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: grgpio: Add NULL check in grgpio_probe
Date: Thu, 14 Nov 2024 14:18:57 +0100
Message-ID: <173159028235.42693.15073838123414232690.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114091822.78199-1-hanchunchao@inspur.com>
References: <20241114091822.78199-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 14 Nov 2024 17:18:22 +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in grgpio_probe is not checked.
> Add NULL check in grgpio_probe, to handle kernel NULL
> pointer dereference error.
> 
> 

Good catch. I would typically send it upstream quickly through my fixes
branch but I'm about to make my big PR for Linus so I'l route it together
with stuff aimed for v6.13.

Applied, thanks!

[1/1] gpio: grgpio: Add NULL check in grgpio_probe
      commit: 7445640b245877a8d248b6ca4153dd532e79a5d6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

