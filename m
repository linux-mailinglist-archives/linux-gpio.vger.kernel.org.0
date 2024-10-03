Return-Path: <linux-gpio+bounces-10780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D79998EBF6
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 10:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9211F23B28
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 08:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10D113DDA7;
	Thu,  3 Oct 2024 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wAYfAHsz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F5813664E
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727945951; cv=none; b=BcTr+/HTTtUDGwat+bg0Vn4mFG1Ue+BcSffBC2iKQCQDOc/eEbEzWT6X2Y/GmOsaUPf98zwZq2dxclQQUPEanSLe8rshxEs6O0F62eQpir46I7fM0fdTrBkruBCkH8fV60xCfVtb/EWA6iqtp1dcXgJAtk8NDPL2mWuW/HRNSZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727945951; c=relaxed/simple;
	bh=z7XnV08Ua6Aa6A7lA3xNC2if7kvQHIDZ9lwtvoSGsPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTfXwxM+V9ED8p9IjiIs0x6xyqq/o64k2ODOd3HMMk8cAZU8LXUb8ZWh7+KIrZygpxEudj1OLrMWHzhWwk7nPt26Tc2+3HTRL0JZah55xFS75njtlsiBhy4P7CRmEIANNBRXxIWfNAxoupzlTkmcOqTbJqYFDq47sFtA4XK/ijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wAYfAHsz; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so950018e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727945948; x=1728550748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kYGk7GZ2dJHgeys1hkaLX2excaWw85sc4TsoL6y3nU=;
        b=wAYfAHszK0r73KhlDsQjuBcL8UbeJMReGnI8DBHDPaL7LnLC73MWjMvFtl53dmCKu6
         Ry1llGjJSbDw9GFWyQIdyBL/c8RLSqqiA6cQe33xUySBQlfdCEu7g469/H0Nk1Kgn7gG
         ZxXo8Lrfpysk2TukJ6s9ryVr9a5hNMbEwzKVb/RVOI7+BsteWNm9hTrZBFfjdfsD2Sjo
         Q4fd2eK66bQSbKDE1SO7QFgWHtW2bkP5qJ5cBI/SJme9mQ12c4ZU09YD3Dvnt7QFsfGI
         R2kqShRS7Cqj4gxowCPN+tIcYIQGr0u3gQJRZnCMS/kwFQs3vygrWlKY0AW1+z3ACVej
         +BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727945948; x=1728550748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kYGk7GZ2dJHgeys1hkaLX2excaWw85sc4TsoL6y3nU=;
        b=J3nGmHQaF5H/L17t4IelPKL6Ve7htFWDBl0jN98COEZ457tm1UdGd907m1Cd7flJAf
         Z+SvYgW7stIximQs7M99TsVJnC+PAz+AgrJsOmV68PV5CPgDsAttN6ToDqV19I4ofCeb
         5acWuPONRdsnw1pbcQz+xYyV6PovP+ucX57xtzx7TU5j1NPhEIwgForaTQCZ0rGl13MV
         OICgIfQDBqGhI8+4a9CYUXyA6/Esp68aEWOTJFv+Y2e2BE9p8HIxNPPdkp0J8hEwvtf8
         FHSzzUPhHBAzEcrRlHC+8ca/ESlGUgHCpksjaHUjKwvf181Fm/L1mlU1a1n7FpziXQ+y
         LOFw==
X-Gm-Message-State: AOJu0Ywb1Id+LjOrVWdA/rsaXk5JrGEqhovJSaoQ1LpYTnBkn/4tDIph
	8C/HBqPA58CuFdX4rRM5WfhNlatGlMBc+cmkKDSZLU5K6vxtBFVnObD6enpG4eyq6/jz3BJY+8j
	E
X-Google-Smtp-Source: AGHT+IFB6+OaAU0xjafGr/uaE8xgcbAaraThfWO00ImdF5t1gbGeGIzVBoIb/k8AF4Pbl9STAqn0Bg==
X-Received: by 2002:a5d:4ec3:0:b0:374:c90c:226 with SMTP id ffacd0b85a97d-37cfb8aa840mr3844894f8f.9.1727945448883;
        Thu, 03 Oct 2024 01:50:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d16b:3a82:8bfb:222a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d081f7012sm782799f8f.10.2024.10.03.01.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 01:50:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: line wrap period help
Date: Thu,  3 Oct 2024 10:50:46 +0200
Message-ID: <172794542679.27791.10531237486467230140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003020743.27194-1-warthog618@gmail.com>
References: <20241003020743.27194-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 03 Oct 2024 10:07:43 +0800, Kent Gibson wrote:
> The help for periods is overly long so wrap it to make it more
> consistent with other help lines.
> 
> 

Come on, I don't see how this is "quite soon". :)

Applied, thanks!

[1/1] tools: line wrap period help
      commit: 07c5c49862961f24863128c46de41dbd1b1c7e16

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

