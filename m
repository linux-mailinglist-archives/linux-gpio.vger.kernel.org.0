Return-Path: <linux-gpio+bounces-9556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5BA9684BF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE25D1C22B6F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8662015FD13;
	Mon,  2 Sep 2024 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iZ0ySCTP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E294E74063
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273249; cv=none; b=M7trAilvA/s77b9aJvqyp/yc7kydWj+bpGVr+tLVepN+Nw6J4isw5ZytacUS+0YVwYKrUR1wy3QIv8PTekOBHFU4GBoW4LgwZvhpfiGdCaZ52qIqSGqTU/fojilo+nW9KpdqP+FSgeRm1KhkSn0boA51WQiw+rslzWpnvZOUfFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273249; c=relaxed/simple;
	bh=thNj+m9tysdWqjtQSV+YNo4/kN/AS2FzgErK1XihFw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RZRwK2LVmqlNT1HHa4qMrWeCwVeDPcIe9QHaqYk3ebmcFneAgB8Se5Ino0GvwTJ4uJhAg6x95W7V1Ui+gLAySmFt6l37uqEIQz01t8SKwZHUdC6PE7w/VACIwL3LdMVSvZPGSMachM86vxJZLr/6XaXqGtv8FFl5bkt2goe3jrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iZ0ySCTP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42bb4f8a4bfso21769655e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725273246; x=1725878046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfnknnSI88SMEAmIK9ZIqu4FUp3tloSoVvgrsROObkc=;
        b=iZ0ySCTPKMVrA5sRakqEgSqSdfMzqrTKrVrKBgJCse14fx1PKv7RdonTwxIVlu2bCp
         IjhFWvLC84U+0fFGIm9Rr5Nq9uem7ML6ujpc1IcptYnT5HNolruguDoBsDgnPgDaJXuw
         aod518deaAioQfKAWt2gGUF1fsxbBBsojUNbnf8hCTmXxwcChLKWkPJx1ci0vY/KMQQV
         RD/PWoaRHmO2XhK0kHBDBRpgohnCM/g7gaQ2s+nBnnVoJ0rH5p5X7nbkuONj2VtMyYfR
         u9UCeDA9w6JB60wjWOuRVYnct6lldhk/ZLTAy1y3iqb95Wyqm0Z9evyZr3amLC5cWfBX
         PAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273246; x=1725878046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfnknnSI88SMEAmIK9ZIqu4FUp3tloSoVvgrsROObkc=;
        b=ZkFhbozVChxsoQtLWiSIJV3HZKxAoUmKKWToLPg8PQa7W2AyjPMUoeX7wfBDVPtL9Q
         8L23Ub1j/TbqG8XCeulA+j6abBIQzGvDjxMybQnP0rxl4qyCTLzE8NQ+cqKEJvXFBEXC
         EZzrpY4vfljRslzCoS36+f3yxg4WFnen0DwtXczLufLM9UEE6HWbpb3UUhdM+LZxSwMD
         kHDXork10GdK6Xdydxxct/9YSQgClk+Dtxxtol9VcUOWqmbb4rbzlKx7JqRmfxdzkK30
         FpKq/D6DLIopRLI37uy8UlS8TT7MQvsaKrqWxLN/CDbJsJbYZ8LeqFxtbbe+QZz+RxaD
         juPw==
X-Forwarded-Encrypted: i=1; AJvYcCVuqhGVjNQHfvRqrOjQTPOUswLT2+0yXdCASF1d9NfG99D5uhThd94h9Q7OGoE6HSXf3ynXoTEKe4vX@vger.kernel.org
X-Gm-Message-State: AOJu0YzBRVzpDCKvH5QvtUKu+jOtFVy/a1Qfbgm5k7a5tPD4iL48Hdc7
	Q+KzUK2Xp5D5sKyEZeV/udwd+solIAdh6kbfkajCSWV1CQnXEZ+UtiZEhLTKYqM=
X-Google-Smtp-Source: AGHT+IFdFPgO+oZwmws/3Yz5eXsbV5a/tr2eiQTpD1UeVF7Ht5uaERbyauIo9GDIAHqXqR8KYzVoRQ==
X-Received: by 2002:a05:600c:4584:b0:42a:b32b:cc65 with SMTP id 5b1f17b1804b1-42bb4c4058fmr83572515e9.2.1725273245644;
        Mon, 02 Sep 2024 03:34:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c32793b4sm5085844f8f.7.2024.09.02.03.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:34:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dhruva Gole <d-gole@ti.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio-syscon: fix excess struct member build warning
Date: Mon,  2 Sep 2024 12:34:03 +0200
Message-ID: <172527323991.25859.15792653428426761773.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902-b4-gpio-fix-v1-1-49a997994fa5@ti.com>
References: <20240902-b4-gpio-fix-v1-1-49a997994fa5@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 02 Sep 2024 16:00:02 +0530, Dhruva Gole wrote:
> Fix the build warning with W=1 flag,
> "Excess struct member 'compatible' description in 'syscon_gpio_data' "
> by removing the documentation for the non existent member.
> 
> 

Applied, thanks!

[1/1] gpio-syscon: fix excess struct member build warning
      commit: 3cbf09bfb6162a90bda5e1228d0c46ad3e4c0d6c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

