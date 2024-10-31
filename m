Return-Path: <linux-gpio+bounces-12365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B6D9B7A9E
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 13:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8868F281843
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 12:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07B519B3E2;
	Thu, 31 Oct 2024 12:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U0iHJF39"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B921C176242
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730378067; cv=none; b=sWr+DWJBOZ3eHj2WQ8CCaDGvFx1cRofO1Lse79PBBZ9MR+K7H6Gmrj8EtY/0aMzVCVUz6GDObnh+1ew1O6MQ2hUrzO+fsSqVHfRxpTVeN60rFJED8+clHo8ZLkycjBAbyj0H+T5mwzMOJ+f3tKIrWcGBPZvMRYVzw1JcWjew1PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730378067; c=relaxed/simple;
	bh=m48n008ctBtYqrvJex1KITkek7KCiQquXwKklYAXLWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUuj0OYTXNvcoopZYxAYKvV2EMf4a90fLxtpMmbm7ljV8tPPQHJRLtxkT0d5nK2/xN3QO9anO4ZvQeQQgshXcy4iX5MEzYcptj4Zh0pW1tbe4WoTb2Gh37fgEEKOQiGVVr3xsBXg1SGy50L+cPGc5NKG2NGLO5lH4UlKdCR+aAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U0iHJF39; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43193678216so7758825e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 05:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730378064; x=1730982864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fzl3Xa9C7yODRffDmu7ydBj4yLwByepcumnubkJz5KE=;
        b=U0iHJF39Y0H8ZkUEbxZ73rNqxpMIj4sWkjcLpwhRmYrf5uyPV92nYiMZKvleCanWje
         NWd0u9sldlktIXDRYfPRIVkRhVxnuBhUerOaNtaYQAWbFTZSXiLivW341nXd9IZS/G+7
         osvh7Kbf5zWORj462DuCF68sX1UpMkpfzfOgeqUFfNTZfr9BW4RLUfaXpxd29b/+s5lM
         oaduGNkPQl8ZKWkbyacKajLHMLRC74oCE9afVbXGZFMuC/7kVta4ni4DwkNhAUKtpyPB
         IcL+Dit7j9qDNUOA3+eDcKPTGPOqk3/lLg41RhUAZA3wDbBSj+aofa3AR9YzVoLKRKzG
         9CKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378064; x=1730982864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fzl3Xa9C7yODRffDmu7ydBj4yLwByepcumnubkJz5KE=;
        b=BuVpVBNKWK1Lu4oIu8ayzZ/EQXxsAK0aYdYtVElEpctfrEZCCc6Le9jSCa3D88aVIX
         /rCzRTiBLSUv/yD2xHSvZ3ThdX6o7FLcv77cge3Jr2lsXRJXjn1pDJqhfJNQwnypCc+h
         QL3yDy5wtWchpSMiJFA3VfeDLTwuFH79eAL41kzaRK4zJDu60QyznM5esXIo/Ob/8Yf2
         v9VRuCPv/G1pU8gRXnwxRdpCXnGqjV4lFxGxy4d3e8PFh0T82YMmbGBRlNdht1Jckd8U
         JETRb64A/DDhrQBYpzvVb5hkY6I3byEBgB7VsylT3tJuuc+YfWOxFvI1Pu+p5zXQJucO
         4orA==
X-Forwarded-Encrypted: i=1; AJvYcCW9SHB5w5iOs7TTy6HC4BeAuwYF5m7Oz3se8z8Sor6PeAO47TS9/+UlxEUDZSHE11ZXQ6DHIq37z2Im@vger.kernel.org
X-Gm-Message-State: AOJu0YwKaySvQ/oUi5D/JUT4HPcrp44CD0srHKboYi789aqJVLppApMu
	ynYs5zXZXmDCTdcHmtAGKAcSY65sxH3Ui7K1Vm4+ef8JqjLwS4aS6lSzNJBjlRE=
X-Google-Smtp-Source: AGHT+IEEO7DvzSltFuSOOW7tGilfwME6cwZASRB5gd9U1RoN4BL+MSsBkr+M1gSe6V2EUA3IAfJTCg==
X-Received: by 2002:a05:600c:548a:b0:42c:c003:edd1 with SMTP id 5b1f17b1804b1-4319ac9c555mr173232775e9.10.1730378064138;
        Thu, 31 Oct 2024 05:34:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a6bc:32f9:21fc:be97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5abfefsm24871935e9.4.2024.10.31.05.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:34:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: demote warning messages on invalid user input to debug
Date: Thu, 31 Oct 2024 13:34:21 +0100
Message-ID: <173037805747.6410.14300588256259138318.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241021185717.96449-1-brgl@bgdev.pl>
References: <20241021185717.96449-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 21 Oct 2024 20:57:17 +0200, Bartosz Golaszewski wrote:
> We should not emit a non-ratelimited warning everytime a user passes an
> invalid value to /sys/class/gpio/export as it's an easy way to spam the
> kernel log. Change the relevant messages to pr_debug_ratelimited().
> 
> 

Applied, thanks!

[1/1] gpio: sysfs: demote warning messages on invalid user input to debug
      commit: 37d5a6d6f406322ed0850fc2af1d377aced16340

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

