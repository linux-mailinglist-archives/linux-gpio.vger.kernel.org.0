Return-Path: <linux-gpio+bounces-9819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AC196D06E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 09:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B99A11C22A87
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 07:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63902192D8D;
	Thu,  5 Sep 2024 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tKoE5MQX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111E9191F75
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 07:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521536; cv=none; b=IME+B/UbXfg7171YogXETlpgV9bGRzxxToq4Nv3IqPt8NTSU46jXkSPOeSaKy0SL6imIRm98JQCHKt+UzYZEpaSZXrBuURJCaXFb7zIf6P4F6CO0Fcv4MNwKdb2FqFuDTBDB0Xsn/9v5cRHeVbyRXU8rKb6M1QxDjXUCskebQZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521536; c=relaxed/simple;
	bh=07LyEjLoLPZVdgtIJLm5NvHyq+qHkk7yk+RcTCmEKK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iuU25V84U+ji1bC5nPnvFa5KEIacc6d8egQPQpUkp6SaqTOa6nLFKksnb0oafnnN0HgY7EXCxnYdWEmuUfK0Gwn9RDec3WVO2phAO0uiU3PgXeTQw4Zs0LmyisZZ8YPNQqXBDy28imeTDccOtRbIGtszP5KDTuV1NUwfn3VX0QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tKoE5MQX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42bbf138477so3421735e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 00:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725521532; x=1726126332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSWbI6Eqq5HcSONzah2Np5jzTtTLfUZaHGaSo5eynqE=;
        b=tKoE5MQXMkNNPDOF46SB85Ix6onmXsARjA3efkWfh7SaPL09oPnm6nQ5tAvrxXIf8u
         LaZgXPEFd4uXuItnptBmX18OFnJX2LHEmQbqpD1B0Y0mau9DVu/XTtNHSDqtFWDJNUN4
         4KbK3RwxHjcKT24Qy7U2qus5vNHEkyUI5GEIu8f8WeFy5EYqjH2nT3iMyDXSmRPQIunJ
         ZSGdXXPNluLGPBst+i5nKrae0KEV97aDaaEMeE6E6Vp3OYl801Ghlkw+IgPsBt/9Bf4U
         3IbDruDI5QLF0tQyTlkANvwJqkyu4mVcA7NiuP2B0TPr7B9CN1yuhMSpDGJudHwIuzXR
         p+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725521532; x=1726126332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSWbI6Eqq5HcSONzah2Np5jzTtTLfUZaHGaSo5eynqE=;
        b=vMCjJodAImWqtEFI4a8pxpkt2fY/XiOY1e1gKak1HWDm8Pm2sqPJ5FIPVJ7eBdyv23
         5LYgO7zjKTsA9ydsxDN6mbslwOpbDbqeIHtrgDlqDQxLqotpLYaVm6DVjs1djejCXUKI
         5IhVzX33rJc6fjhBJs7XzyAqa/7PUzcfXi6kdEF01p+VIsu9LeDjdzRj1gFboL5RHi6r
         n/eq4mVCMRL6ikVSRgyI36VZjvVskP7WSscIjuzVEG3ptQ3POeLcJX/tmtgCj5iAckl+
         k1IQiE3fDfLckEQw4BxF86jfgW5VJY04EbOvHzvKxr8flfhL6GEb4UTmpE2W7QWivw7r
         kWBQ==
X-Gm-Message-State: AOJu0Yy9i92Ims6XM6/bGcmm/kguiTvelHBfOpn/YG5udbGTm7o21+R9
	ztjfgChVDPyYZ34dpT9pAFMSB9SKOkU80dmAd6KoVfffuZoA5i3vTwf756oUcEnnxlLYXC/tUWS
	f
X-Google-Smtp-Source: AGHT+IF1DSMGNW/NWv+S4HLAJnnZDF7oMqOZSET3XRgu1ibEtCYadJGHWVTMX08w+sDJt6R1aL4irw==
X-Received: by 2002:a05:600c:4ecb:b0:428:e09d:3c with SMTP id 5b1f17b1804b1-42c88108630mr71988195e9.33.1725521531265;
        Thu, 05 Sep 2024 00:32:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:cbe4:ce99:cb33:eb1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c1de81b2sm13109379f8f.30.2024.09.05.00.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 00:32:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] dbus: update glib dependency to 2.80
Date: Thu,  5 Sep 2024 09:32:08 +0200
Message-ID: <172552147923.27752.3912375960672619101.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904125014.262715-1-warthog618@gmail.com>
References: <20240904125014.262715-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 04 Sep 2024 20:50:14 +0800, Kent Gibson wrote:
> The gpio-manager makes use of g_log_writer_default_set_debug_domains()
> which was added in glib 2.80, but the dependency in configure.ac is only
> glib 2.54. This results in compile errors when built with glib between 2.54
> and 2.80.
> 
> Update the glib dependency, and related dependencies, to 2.80.
> 
> [...]

Applied, thanks!

[1/1] dbus: update glib dependency to 2.80
      commit: a726309792cfb89f96a79146bc13484509e39436

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

