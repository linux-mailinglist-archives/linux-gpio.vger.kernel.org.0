Return-Path: <linux-gpio+bounces-25802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF149B4A848
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4F473ACD88
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09C72C11D3;
	Tue,  9 Sep 2025 09:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="smTtIC1H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6E02C031E
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410621; cv=none; b=r7aDOlCogu+5nOLiWuLQ5yaCzH304RIq2HrRIiPCYZcCK6s3TQLEVGlAXvHhXcdnniK0bEHBGp6ReuJSkNFcwht0BcJGGHiUBZHadYDV5iYdNswgQOtjKBp4q2lE4XstPARFnl0Q0JLcttFhwpsRqHTMjqVJKfbVmY6HvTZVI3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410621; c=relaxed/simple;
	bh=Yz6J5XsFeNL8NmPGr7AxBWmV+j5pQO7m4OHjHN7HDcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ecJBtJHQ4pDa4UHU92+MJWay074ySfTboiM10DzeAkAtPX6qH/KcIS95L2zbOO9oq2d/x4KcCSFTDYcpJFe6XybHhMdVkBCsZfSrYo/Rf+egDBdAhqpH7oLv6ctAwJ7E1Vr3sJC406kdCXFQeE+h4Vlawdyh3vElzGNL5mAeABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=smTtIC1H; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45decc9e83dso4404535e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 02:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757410618; x=1758015418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ0scMPLV0oolu3xB65Tra/ziHHTvdwf4gejra+JrpU=;
        b=smTtIC1HdFp4zm7dfNIV8xjkC56KN/e2EsJ/Fqp3zM5Ypn3akxDY6LdwSua08XdtMf
         emQw7AqkqiRgXQcfy5sH4mLNRztbuydR8FZ4FSewpC1SUWricM5WsaH6U86sgPwPR/H+
         WwP91f0RtOPCT97pddA1GawQn0SFfik0EvWAtijfttYA40XIvz4RUTWd1df2JP1h+1WF
         9aKgINXMknvfBdEgWBHtFz1DBSHV4llOOZiiN3nW5Q6PaIQEH7JmRxMK78cGI0hq0RTL
         83ynPtgbVxAj16sdGYTeSx0skWqrhEoNDPYLChmjJM66lm0X6L3uPj5AslqHBiMubXEA
         CzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757410618; x=1758015418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ0scMPLV0oolu3xB65Tra/ziHHTvdwf4gejra+JrpU=;
        b=gwtyJPQ6L/zfwIzKDoeAoZRcXu0DPPEBw91CZB3RVdXCqBnzpASZ1km8TciEGjGlFA
         Dwwua5NwfKLHj0xNMcddSTkxBKuA4LFZow2k9Hwaqld13M9AVZRAm+AtYy6ecqpeCqwy
         WsAYbdPfNAfjHUkDsMFRXj/+h5LRZRbaNm2izFKEqrN+8c4LeBluaIKh/JPWhDuweT/z
         lRDBikI8UH5smVLQluqDkJoJJ6numpheF40O+4K42Eeb/UZ4frHYQCbAuFBtHUJKmz8B
         PGf/Squn/UDQFyXynnETbjnfrJOs2U4GQuDufMUegUTFu/yNpOUK5xjNJwzjesfIBYZU
         tY5g==
X-Forwarded-Encrypted: i=1; AJvYcCUFKmp7pFwI7D87yHamD3hSTJS09Gl5wGORwtoBOPx7vnGVCNbKE4LM59rXft7NwEKKxqk8jm8v65Ne@vger.kernel.org
X-Gm-Message-State: AOJu0YyT9exQ2w33ExXr0BYYRGfpp//G4x3H+TXzedckISXFhdK51MMF
	+IAGwP02EtjVY3LrM76y45cV/hYKgOFLJCuLwhZ39BTuR3XOfQ/BAl5+Ejpzy5Dmz60=
X-Gm-Gg: ASbGncsten7Nxeyc/YyXUfCtAjrtJAutAoXS5Vv3Mfk5cVm+DFGSiQhtF/CSOZ7XNyQ
	yryoG67X5RSLvdezaH46J+xIEhblpHDbxDshJtChrs/5/4LGsF9UsU98C4c1AXCA6vL3KbOU9gf
	gWo0yojnKYqlk+iC9O37ZgffIcGrvocTt++RTGOR5EEciLl+upfi4BjGLOwJQiFEIGYrXGSYjdx
	hWmhT2jciLxxdaVGwxggpzl397YiumlDNud+FijjXNaE5pzpAcWjvWYITWHJWV2xP6qEeiz2ANe
	C0pO+UG8jhQ6jU1e2mpa0ZJ2stjOxXuIAHNEnJ+PvLtDvCFo89oxT2x3P1kWTS7m2pEgCqO+Plj
	oweKF5zSYeiQXWWl4R0P2FoYjW/VW76AjLDc=
X-Google-Smtp-Source: AGHT+IH5058N4Rvd5SjRTCT0K0xTeKjsfyIV1AW6yxL/MErMs8EFAtZAWt/Eh3NEKIOxQKJuvUljOw==
X-Received: by 2002:a05:6000:2f87:b0:3d9:2fa8:1009 with SMTP id ffacd0b85a97d-3e64c3acf34mr8542734f8f.45.1757410618327;
        Tue, 09 Sep 2025 02:36:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df1ba282dsm5478035e9.5.2025.09.09.02.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:36:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: zhuyinbo@loongson.cn,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Chen Ni <nichen@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: loongson-64bit: Remove unneeded semicolon
Date: Tue,  9 Sep 2025 11:36:55 +0200
Message-ID: <175741060875.70455.7070575500700308990.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909065913.4011133-1-nichen@iscas.ac.cn>
References: <20250909065913.4011133-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 09 Sep 2025 14:59:13 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied, thanks!

[1/1] gpio: loongson-64bit: Remove unneeded semicolon
      https://git.kernel.org/brgl/linux/c/52bdd69671b63d5bdac80ed7fdfbad44e915710b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

