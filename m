Return-Path: <linux-gpio+bounces-10937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 178DD9926A9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 10:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99835B207EA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 08:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BE6187FFE;
	Mon,  7 Oct 2024 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AUOol7Fd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92D118732B
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728288477; cv=none; b=mryqp0RI/JFt+bAyF49GLvpIYnICShaaGgd1beLyUPpSke9/cADr0hc51oKPnPz2dR6s9lwDS3VnBgpxdy1mh0xYst85wqLjXTjoXM2FKeqFPrObCuGGfWOa1Z7Fq0cN+RnZjIWiRKVzrFIbXiSX42If/9GuNSmwwyBfgaVEQh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728288477; c=relaxed/simple;
	bh=kJWWVXOCsx8fa7OAzWgc//qVFMR32lxp7qnQNANCDvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sKGO98UDGclnDY5xVOXAbKnnyY5aev7Krqqp5PFvZcTrkHjGqZ8laIt2EWE9uIbG6e6AQ8R+OOBbSdfqtBouPnlV7lTWBxzVBwDvV1lsyDFWLJLt/ge+0sOPaKiR7kiKTY1i+w+btsRsq/EQT08RD3mKqq2EfwTP4R7O4eIRj7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AUOol7Fd; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37cfa129074so2813678f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728288473; x=1728893273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx4TvGH9/V8R3PhexnxWzN7IdPfRg4ORCvalmzoBz3c=;
        b=AUOol7Fd3khYq2Sevs80IHsM8YJJZ/ipTCo6InsZDmu0vxL9zPtZMoxnmR5EZ1MlCQ
         1ye8F1MWBqAxRD5Fb8Lt+HF4vcXfeNnt+aVvuSj4lJXxBdA45b7rM297Q0Tx7OAko5AC
         MK7SK7XXTPk8emrW+tJMavJYvOupBaqlx7JrfoqexUf7p/R6QPTFmZGN4sekVuTYbDAT
         h8XQm2h7EZl+CymnXgBE+kD3ImgNhXlMrxVhHp8CRxeHdtspJqyhJOFkxLgCjq4otzQf
         7EdJpfLZr1iAizi+0AcKX6LXW/IfQl0JH3gXHV+QKyjiKHLj8GA+gZkOmbJWwclS/MBL
         Lqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728288473; x=1728893273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx4TvGH9/V8R3PhexnxWzN7IdPfRg4ORCvalmzoBz3c=;
        b=ovILQbGvtaqntr8SsvLber+diN8IGc4gZWNMHnoYXeUIV/qfWcyxhhUYcbDbC+cwqI
         +hqYNH/2hG9dLcARMvgYUvMtXZ5BCuHku9IrkCt79QwYFdhS80B8ZHVaw3uAOv1+lQKg
         /M6SycXf89rEU9dJhUNyRhXslu9PHLp9m9ixIZujmZ1mhRk0FW7RurBd2mkITfBHZgZL
         IkCV5W+gYMp3SGm1CvGmlNs/693Yt2KSA8nXscHWmipMEXEPXDuGipcQbfB0RghQ1Y0f
         IBGQ+h46kS3tk4gx7DPSfDfqL6lC5JMKF0L0PAYFMP6uKr3aOPnu8ZRUog9QWiOTcuZ5
         LNVA==
X-Forwarded-Encrypted: i=1; AJvYcCVoPT9NhFiSAEh/QJNdCPgNh4e64k15St8+8PSrOH1BzKLCc2S9rrfFQMzfM7RI9Gk+l+W5FilMsYTI@vger.kernel.org
X-Gm-Message-State: AOJu0YxCKnHt3MFhlXIwhSFFIGDq6D0ypZ/S7qP0NST2zm7k/bXKid1D
	b+47+pViXIgHf4msoD2J7SrOlqMXyZj+mVB7/zzVqJlIsC0Amb5joJQLjhQoOVVxGfjClA/LrKu
	2
X-Google-Smtp-Source: AGHT+IGOPEUqEycwGFsioyvhCo9SFFVzb0h+jRThDGvSRm6g3HKuY3qX7QZ/3L7EaHul2v1THwQQRA==
X-Received: by 2002:a5d:4d06:0:b0:374:c17a:55b5 with SMTP id ffacd0b85a97d-37d0e6f8eccmr7106780f8f.14.1728288472931;
        Mon, 07 Oct 2024 01:07:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16972dfcsm5109684f8f.102.2024.10.07.01.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 01:07:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] build: add an additional check for glib-mkenums
Date: Mon,  7 Oct 2024 10:07:49 +0200
Message-ID: <172828846716.6781.5221719847247062844.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004092533.34368-1-brgl@bgdev.pl>
References: <20241004092533.34368-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 04 Oct 2024 11:25:33 +0200, Bartosz Golaszewski wrote:
> Some distros split glib-mkenums and other GLib build utilities into a
> separate package but the glib-2.0 pkgconfig file pointing to it is
> typically shipped as part of the -dev package. This can lead to a
> situation where configure thinks it knows where glib-mkenums is but make
> then fails because it's not really installed on the system. Check the
> existence of the actual executable in addition to querying pkgconfig.
> 
> [...]

Applied, thanks!

[1/1] build: add an additional check for glib-mkenums
      commit: 0e4198b9eef1eeedf8cf12e970b36d4e50a1da48

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

