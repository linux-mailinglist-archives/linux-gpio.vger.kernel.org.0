Return-Path: <linux-gpio+bounces-15747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC8FA30C4B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B349165F63
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E8122068F;
	Tue, 11 Feb 2025 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MbB/k0Rh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E0D215799
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278789; cv=none; b=lEpqaubLqjlObBTH764OgOclvYrTvExW2/MJuUZjgFZcPD3h6bv5iIKcOKHVG4YbiR9FLcTTiYT4axXj+k5qKDYQbqJ2w6fjbGu1bxIT3SqEBYg09AfagcPH5DL4YuzJSEaJ/WccCp/1uoQbiq8w9ibBO/eYkHLfwecH4RIA7GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278789; c=relaxed/simple;
	bh=WB7fTYVpBhCtObrR7qdfc3t8+TkfB83AoOsP88xUS08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bujbAW8PF/UDH3OP0r5gafyg+9Qm5N1NkYzt0oZWFzHnnM+RhOT3t0J6xcu3H7KqFqwRReVCEvnP05JrOaUmw1CCs6BCsBP48mi0kPyvCGq0V2RegcaTOyM2hyIuZ8ApHx+BqLeasetIyza/93OjcCXqmdpBl3gGcQ5yL+rL7CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MbB/k0Rh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439473da55aso12867675e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278786; x=1739883586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANA/S/Ju/e3qEgT9tA2+KKtVfktLoZrMTODVCC9QX4I=;
        b=MbB/k0RhD/OFsoE17qG88CzyfEs+MD1yWDLR+GmGk1gk4BkYsy5dFkO3/bthpLTLWE
         vIsXJyXfDJvfcLhaZlNZDl32W3DbPH1nzcsXvqyiQBCihj9a2n6JEs+u6qPrOl74RzJA
         JEcpx0j06kKUABm5y5os37CXmh9EgbqFeXEpIwIyHSNKX5hYPM+mdMEpS6QS3n5bvAeO
         qQDFrK2F22EPMca7PXkLcsa9JJsvauueL19eIPvSruZXPbPXePflQlIJPnybDW0b+KcJ
         OZ/u1ocRYvDD65EGQdoK8L2Ao+W/osnkHA0KFA2S2oZEfsylDqm3ZtDlboiwVkS924vB
         lSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278786; x=1739883586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANA/S/Ju/e3qEgT9tA2+KKtVfktLoZrMTODVCC9QX4I=;
        b=Aa5Ein7qjy3x4HePWVUUsm0cvgcKkVG4hTcvYNIeN6PobDAloT5luQ7xJ79JfTP5fO
         1xmJv8E7gR3EbJPb7XmNtqprP3ngRw5Y49R/jgNSl1zffaFQH6tW6nDe6dXVMOWTMIBT
         GFoFMjX1K+pGJLXyig1WGcQuofWgDPG9QFlYffosUnun0ZhjJL0pRMez+5QAVywyKyQb
         qm1ND1nmIdGvHNTwKGi3EW/5yjc8Fja9RsJHSSrEym8mPAMDzr3BbH+WECXTNqA5MFHr
         6jzQjNSLHbuwxI1AoSXNnot12iY5nr5qRmn4kFwUU9TiSrkPlKMPb7m6SK302fPB5gD2
         clmg==
X-Forwarded-Encrypted: i=1; AJvYcCUxhupWPAGA4HL/ir8BpvV7dIZyggQX5gZDXxxfPHFvMx0+PPkk5Na3au9ZDjSkg/KbT9M1h4yxo3c1@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjyZxVLp6sfbAiKuZEOfSinOv6N0Uii1IZNaNZyhQVs+d1L76
	NiLOyGaZg/SftO+he8jSyxT4d3GWoQMEjSd8PhWmz4K0y1MdxTOA6RKMUqVvXrs=
X-Gm-Gg: ASbGncsLe6JHOCqJjmJLtFLiNRbmWOBHCz0M8olmqeHa1oMJMoQ+LZBoWET8O2oh7N+
	PK+0EB1/TAZaWQxOKRdWsSUXrwdmtk7Gji6dGzUE8GhRBrgT519MZy0a3Tm4NjCkmxBzCzH5mtG
	a1qqrXr5cJbTsHHRrsoSTwZGBlhwcxh1SVpU0um4EOSVDgykgzW+0BznOidG0xnb6mS0DGTek0s
	PmPuaGNK8lGGM7eIsUh3Mzu1eRllUW0Au2bO8x27VK8TIULRXV7YzXhcUEJhBhAncfdIwfbgTqx
	/oEMlFw=
X-Google-Smtp-Source: AGHT+IGTEw6f/jMT7Y9rSI+dIIhHfxJew2oPRC6AbWnpy6GzrDxXT8Q3mqnhaIbx4zWaQNwhO7OM1A==
X-Received: by 2002:a05:600c:4f8e:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-43924990be0mr157670735e9.14.1739278785905;
        Tue, 11 Feb 2025 04:59:45 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:44 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:29 +0100
Subject: [PATCH libgpiod v4 08/17] dbus: daemon: add a more detailed
 description to help text
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-8-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=QQqP3yj9obCCv4oCtUXElC79L1Ly6v7DP5+O2kzPRQ0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m2X86mQY7Zd8qlcZ7u/R11otymooEXKcaMH
 gx48EY2oDKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtgAKCRARpy6gFHHX
 cnOGEADLFo4NrwaJWo9cLVw8IfrduzpEoVRTqOFcgAqS6q2jwsqQuoZmm+caeGLiQC3VM6FrhC/
 7HvymMpQRLKYICY/8pWEU4aoPTvOpRqZ155ghtpZQK1w7szSsi14QozRnwtF4ycs8q4bIw/zHIN
 pNE0S4d8E+MbDQl19ojMt+oBTJOInPWBicQouYIX2d5GFUT8QtsxsKCSWZjB7UbTa7H30Z4xbgi
 Dif9/rYr0BHMHEEDKw7b7S2ca4w30ZRh7PaeZHrdHuuNAQaWU41AtXJeCb9Z26AJaLpVJMclMwQ
 YjkYowbRKHk8nao1pxh9vYyfpVTxbA3mUsrQXktbLpFpq5bv9OWprE5G5EEvFJRhTz2FGmqCHya
 VFY0MrqcOoktKC0SzbLhjxN9cPpIi6dWFHsuYjOp3eUfBCjoSA8gv6eEOURiXtvib/Ow+cUcdhg
 RZM5zk5siq8DWzi7zrnyqg80ixA5Tib0nRrweBWaHjAYaNSLGQrG65wcIgzN2iqx4ZT9VPbgk95
 qvKCi8bpUqGwa1GLoldWNEy/D2Wc62XGAcCB6Zb/YSaIOxxCmFHB1od97m708u5aY5xUdp7vtXT
 m1P8WNJjbTg7B2YpthSbeMAyGhRdIduA7HliJym8f9DvFZxehs+IKAaJltisnV8XNLqSBXh6+Hi
 6sNuxnrxxxx7IXQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for adding man pages for the daemon and the command-line
client, add a detailed description of what gpio-manager is and does to
the output presented to user when they pass --help as argument.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/manager/gpio-manager.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/dbus/manager/gpio-manager.c b/dbus/manager/gpio-manager.c
index d34c7ea..03ca7ab 100644
--- a/dbus/manager/gpio-manager.c
+++ b/dbus/manager/gpio-manager.c
@@ -85,6 +85,14 @@ static void print_version_and_exit(void)
 
 static void parse_opts(int argc, char **argv)
 {
+	static const char *const description =
+"The gpio-manager is the reference implementation of the GPIO D-Bus API\n"
+"built on top of libgpiod. It serves as the central authority managing GPIO\n"
+"chips and lines, exposing their functionalities to other applications\n"
+"through the D-Bus interface. It supports operations such as requesting,\n"
+"releasing, and setting line values, as well as monitoring events like rising\n"
+"or falling edges and line property changes.";
+
 	gboolean ret, opt_debug = FALSE, opt_version = FALSE;
 	g_autoptr(GOptionContext) ctx = NULL;
 	g_auto(GStrv) remaining = NULL;
@@ -118,6 +126,7 @@ static void parse_opts(int argc, char **argv)
 
 	ctx = g_option_context_new(NULL);
 	g_option_context_set_summary(ctx, "D-Bus daemon managing GPIOs.");
+	g_option_context_set_description(ctx, description);
 	g_option_context_add_main_entries(ctx, opts, NULL);
 
 	ret = g_option_context_parse(ctx, &argc, &argv, &err);

-- 
2.45.2


