Return-Path: <linux-gpio+bounces-25509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F2B4205C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFD491BA7A23
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F08246BA4;
	Wed,  3 Sep 2025 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sG2edROb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE865302756
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904536; cv=none; b=lqkdcPEChTF/8Nv7sZVjC8M0mkhVhLdnsZI4JPSSZ6J1N0NDhNZRPjQMcihUwXf5Y87YlQL6L1b+8AI7VLSpN1UPKM2+M98C2C//2+rzWHqrQnLnq6Rp0kvzrlxeMaSw9Kfbdam1eL4qndeDSgqM5ZXJGpfpLSmZ3e+tGhjyzCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904536; c=relaxed/simple;
	bh=2VDlb87stosb9Scxvmf7LAmC5JiKyXnu4vGqU+gG8xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cw3xIbTqmpKlJ5DXU/hvn0sd8Mdlq5lpyPN2FHI05ur0yV5Mh7EOJTtH+jKpJ4MtZ9ydxW16eYaBcnjUSH1nUF1sqT6KuU2s1PPn8XjCUel5cDsY9Z21DrVlaiul53LlLDIppOXb/tBqnuacnY3DZWdZppEAwDyP27KdkxmjOso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sG2edROb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso3974775e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756904533; x=1757509333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1jrwQeb8NsG1WqhQDzprD0MXFvspxsQXTHfCEfquEI=;
        b=sG2edRObGqQt8+2Fa7ho6KsWMIGfwVz5n8tSrlP2ggdO8wZ8/DkzDv1nrZ3QPrbSkY
         70k1CLCt4GwcCP4wobOCsCvv/Llt0zmIJI12J4Ittr9YNczottKjtLaf7kr4BGrTHx6y
         QpzpsS2XJw8iDwtwC5oPgRF4EgqaeTX4HWlj2+syt56kLEAIpvdB9rnYgzG1lqpGukM+
         4cRfIzSAnN2qUeG/Zcb3DXaRKEl9fC2XtrIgNeodC7VAPWGTwk322jHNHHx0h9WwatB/
         IlPrLlxZFt6T58p7FDqWt08GysLZR1DEuuaTiCD68h2C8NSrQv8Gp/JAKBppgP20RRfC
         UXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904533; x=1757509333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1jrwQeb8NsG1WqhQDzprD0MXFvspxsQXTHfCEfquEI=;
        b=ajwjNUCnkPM6bu0272asJVDuuyhQkExQ+ubopkj5BArFLdiyhru+plxJ4VAaYWv5zj
         nXkkfp564Nwz2ejnw+iokHbdvyrIlCu/vcAYBwUCkXuRlbOULbjK90nyC3g4n78D6dZK
         Lz3BUqrf4bcN65OB1xo2O1/pMLb1iiMHYX6wKFbeATODKzQimKpJDbkmpvgcN9lt9OZ+
         D4OjWTSMtJbd7tmWMDiiHJyrYgQMN3TmIeFSzsHR1ubh22H+vTCZ08Bcj2zl2J7yNutd
         8cNs5GPtA0TDVulvsude4Md3VUHyqnVCe2g844eFma6qAuSjL2NWXkvdqtx++7qW2sKy
         k5hg==
X-Gm-Message-State: AOJu0Yxv98Wu25LCqBib9MrEBaRqZQkqpt/XJh4BB+v5V3cf3MRWOu0p
	o/TqOM4CZbOCxH4HHP5xPxxX09x/wvOYiMdMfqJVpily80/ewI2nbnle+MqQnUHr9Lo=
X-Gm-Gg: ASbGncvhdbljTfSWnrXrjvoTrpI+zUubwyKAA8KP+s3c/fEB/MhUgNMza9JiOdTV5M4
	aFpr07JVPeSQm91EfwYYgXILpN+fKXusd+YkcMsHgVTllnbGt9KOMC0m2Hpme4XxVXZ6MOdb0KP
	ON735BHXtFrjTPNqUz8QyXRLMH0pX3CG+rmfX2Bp2JK0h6F1vwfqAPaJZ+Jt/Kf2TMGipKGw8HM
	YLlLy1uugENOKkfPmztMZBD7JdGrZi0dD4n1hpd954H1NlCdcF43VP4FhMZ5eGKhMfy6JfuwwZa
	YJHa4V6Z/M7/07BDpii2YlBpws0DKJTSOOWyrDzwSAXYNcAyztpwqLtWgzpzAMS1sdPoQse1Gfa
	LaVlSeWKZY8WqnDkfRWN1pjYXkwg=
X-Google-Smtp-Source: AGHT+IGWzYqRSqjPWocv2Vc2Pe7bIvqEs3e9IkrXFln5QzMeh0VCEuDtq6MKbZ20rj29e2N35kxREQ==
X-Received: by 2002:a05:600c:3ba3:b0:45c:b66d:352c with SMTP id 5b1f17b1804b1-45cb66d3816mr17461625e9.5.1756904532929;
        Wed, 03 Sep 2025 06:02:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm13280178f8f.3.2025.09.03.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:02:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 15:02:05 +0200
Subject: [PATCH libgpiod 7/7] dbus: gpiocli: display the libgpiod package
 version for --version
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-api-version-detach-v1-7-027ca5928518@linaro.org>
References: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
In-Reply-To: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>, 
 Erik Wierich <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J1Z+iIHmWnQpYdVP7LoKULGy4HAE9+loWvZyHtuIcb4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBouDxMyUp7DC3Vg7logclC2neTSCclYUDIXewzN
 zo0XYAsLVGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLg8TAAKCRARpy6gFHHX
 ciQtD/9cuyy7mM/j8nlFDNtW0xSTABTfn1Vibm9T5NKpr9P/4iZ81Ku6NcGwFSiGcg0S9MzbX9C
 yzUw7NkCtwZofM+yi9U69Zj3cVfmActvkuaAyYxJ4V+6Y1DaDvNv7Pn12bY76sKNlHi2qclUPlr
 H0yvT/JB2nIkBYpGuv7ezu1HlrEuX5kA27Ttmf9SL5aZ9nTVlYKlAiSvUosYPyYYALeyRtaws/o
 6L/1nslpIV1b3xa90QUYbcuCJ0tip7LcUu5NJHb0dXp8rM7X71IsvoTVGi2ulKa3o9oCf08vqXL
 8LSOo/8SAt6DtPKOxDzPP/vm4cErRrApGICYAR96cyfBM0/Gwm/Xo0Ucf1ITJpObrEX2S988Yqn
 MkcX7Ig35acJON16nJV9C2SAfo6cXSSMluKpPmnouxA3P6M/x0w8zZpptyORtDfxHwFUFLNkqsC
 b/+lEoZLZZ9rJDudNAFqBr2MfCdLRr99OuogItv6nmZa5R44DRWnCg8MicEyckI0FalkfqQogIU
 fL9KDZKXM9gjdCKvuPAoSvNapWh8SJHSvMUSrmYr0YAz2HECwvFwlwMMogZceU1IE19SgjaMR+I
 eKNuYLVs5D48PAlktla5x8Xt5PnRlYAj5B4cculTdTbSB+bQE0uWZNJrWBbSQuyn9Gk5Z3I02eW
 yH/YK4f+TFRqIsA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently gpiocli does not display the libgpiod API version in the
output of gpiocli --version because it's not linked against libgpiod -
it's only a consumer of the DBus API.

However, with the recent changes to the versioning scheme and the
disassociation of the core C API from the libgpiod package version, it
now makes sense to display the latter so add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/client/gpiocli.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dbus/client/gpiocli.c b/dbus/client/gpiocli.c
index 26d641be570b0508d87dee1c17e197b2ccff2d7d..4ab5d3f9bb24f0d1cdef20e369ab00de097a4674 100644
--- a/dbus/client/gpiocli.c
+++ b/dbus/client/gpiocli.c
@@ -116,7 +116,7 @@ static gchar *make_description(void)
 
 static void show_version_and_exit(void)
 {
-	g_print("gpiocli (libgpiod) v%s\nD-Bus API version: %d\n",
+	g_print("gpiocli v%s\nD-Bus API version: %d\n",
 		GPIOD_VERSION_STR, GPIODBUS_API_VERSION);
 
 	exit(EXIT_SUCCESS);

-- 
2.48.1


