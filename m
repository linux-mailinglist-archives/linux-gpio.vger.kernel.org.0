Return-Path: <linux-gpio+bounces-16186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C925A39920
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 11:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6919F174683
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 10:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3992376F7;
	Tue, 18 Feb 2025 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iHEPd0IS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB93266F11
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874409; cv=none; b=ff8vVTWWaNJUF5G500eGlOTaps1M1yYdpxSA8Vtc1zlj9yDXLpzidf8hGFKlcQt1RoxRP0Kzw6AHAsXjkUWnNQ8Oydj/iGHu3fKAIWkwFCxHCxxn62e0/2D9w2KzpCyCYLuWYcEyqVLWxv9rbmUempJvafg7bhv2/VtMQ9Mze6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874409; c=relaxed/simple;
	bh=R0qIYgCeEQo9kJBLh0KVPhAphFigMXsi3VlgZ5rPKEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUGV01IN6YVo2Dfr/AUKOqVltH2gxQIXzLmuhbMfEq4tEmwdLa17+931VCLK67c9B7jBz7nXqy3PgKeIH4SazIocl7NEi6V3ITnwo2pr0VC4womXjJQq0PM6VCiU85xvSZYWuuR3w1bUv/1epLSVPMFS3H5tYq8q1bJzW45l6L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iHEPd0IS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so54950525e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 02:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739874405; x=1740479205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVuCVswV16narj821ZS0eMp6ZNcBSJyZmwp0vTbPAms=;
        b=iHEPd0ISjShzufzAnl4S/W2Acq02mQ/0dtK1mcV1pmvuXXdXtpXViY42qmVwYuJbU6
         hn7LhjpSROd34fYO1QKGi0PSHOrDvCswWo+u19bi6NQhI1MgNHx7qs9ulnHVNlrUkdMz
         +XAN6l6syHwA1townIBq70PryH+b7leQMqkDCwYQkDvUEmaAC0QA3+NMwSJbDckQFbVw
         Fk2dSxSi+8vPFPGQ4beOKg6QD9MrCyP0UhwsgrdnD3LRazTcbCmSB8YplNSF/KOt7A7n
         t/anZfgkmuWG7OGlpNpECAfSPOtJqbkHObvVvCMqFv9dJTS+sdxISXGRWG7ywOLURvrx
         Rotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739874405; x=1740479205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVuCVswV16narj821ZS0eMp6ZNcBSJyZmwp0vTbPAms=;
        b=G61LUb1vHzxSHEW1p53iSwJYt2OVRLm2RSQKhXdswSZGax/pfgmvXGSt3K+2takG9t
         zYFmDOzEnXSiBa8+azSFpjZwOQBnVxKxr+YOstpO0wZ418QGRj5OWB5SIIyaAmk6PZYO
         Drf1yfFZ1m6ucxrZzJWUhiAvKaXuxh+DmhBbJz/iJUI6EBnnlLgYdKazBVNF0alCGo48
         iIKqCZr5B8P3i1gQiU9BXmu2ktyaweN7F9v4/c/gUwdrpl3BzixAkh3+LQ577kQ9Guvi
         PBrU/LLx3xh6nd6+uDwZszLaQj092HmAa2hfwL5RH1PaA/3U2vPZP8lOT8E+JLGsnRur
         6WFA==
X-Forwarded-Encrypted: i=1; AJvYcCUDI5WQV9weGDBFiXWf8hS8WQIRDn7v7puRtL9pcN+EqlBXxB3gpK720xOgRp+7wXlfiejgOXSM46lR@vger.kernel.org
X-Gm-Message-State: AOJu0YzZCfCB1yx2QFKS15zh0MV+9Up6wv8rvgzERwTd7eLJyvbsYzrI
	buhQTCS2jXwIK3QddhSnJgJeJYC3U2A0HBiDVwQMmy3CKU0511oeZ6zZ0QVq8SQ=
X-Gm-Gg: ASbGncvSKo0b9Zy/2raMDxMr2PaOXmL3wiCkn30CDkh0hc+lt0rydeJEaiwB1lm6aPG
	X3elzmyBGEljax74FLCi84K1MNwKCjLsglZXuV3hJvNNv+h322HzkdN2loX7aNSurn4UEieqSVD
	oWVYbXP+3J8F+mWp9ITSg/+OPakSYA52NgwDPX+sJYGhRR99rkRWfFV3war6W4I59wLq7h06HC7
	1Wnr45kShOQg30l6d44R+PgLzTFH39h2q4c7kBTLElj0jg/W1imwR4H6JArI2ANRiSpD3hBgjwL
	B420crFwBWFTjPg=
X-Google-Smtp-Source: AGHT+IHYrr9CR1u4TX/WgIeANFN3wkpU/AOROz4viH7ujGhFJvNwmMI6SzTG4mXB4Ko99gH55l7OkA==
X-Received: by 2002:a05:600c:1d04:b0:439:5f7a:e254 with SMTP id 5b1f17b1804b1-4396e745a72mr106742665e9.21.1739874405324;
        Tue, 18 Feb 2025 02:26:45 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:30b8:840a:cf5e:6adf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439618262d3sm145793195e9.22.2025.02.18.02.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 02:26:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev
Subject: Re: [PATCH v4 1/2] gpiolib: move all includes to the top of gpio/consumer.h
Date: Tue, 18 Feb 2025 11:26:43 +0100
Message-ID: <173987440185.24201.6935199130548694687.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217103922.151047-1-brgl@bgdev.pl>
References: <20250217103922.151047-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 17 Feb 2025 11:39:21 +0100, Bartosz Golaszewski wrote:
> We have several conditional includes depending on !CONFIG_GPIOLIB. This
> is supposed to reduce compilation time with CONFIG_GPIOLIB=y but in
> practice there's no difference on modern machines. It makes adding new
> stubs that depend on more than just GPIOLIB harder so move them all to
> the top, unduplicate them and replace asm/ with preferred linux/
> alternatives.
> 
> [...]

Applied, thanks!

[1/2] gpiolib: move all includes to the top of gpio/consumer.h
      commit: dea69f2d1cc8d9ecdc72ba350d10a1e71940ef18
[2/2] gpiolib: don't build HTE code with CONFIG_HTE disabled
      commit: 63cdf6241ac7edd94cb4cd9a8f1ba2c3c61ed219

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

