Return-Path: <linux-gpio+bounces-15451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B24A2A860
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6F021889182
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F43D22DF88;
	Thu,  6 Feb 2025 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="htD1q8DI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0E22D4F2
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844545; cv=none; b=XjYqdbVnYqEDuZFsY2Pxk7MOUa6Y7+ngU6hBPXc5U8n6SHALljv1l4GPyq8AwLNN1G77G5AAdlFqb7wMulyPtuJmN3RfQ3+qE4/wqixKnn9+1bsOYg41Nt4naBND7W18jdS+WTHF5IHEBkGdkwESjNss8mQh2YkyAiceL9FVF6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844545; c=relaxed/simple;
	bh=WB7fTYVpBhCtObrR7qdfc3t8+TkfB83AoOsP88xUS08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iW8RnPAkrO7QFV7p+zc+ca+4TepjO0U+wPJGriKX2oXWdOMKQCRc59HCFtiiylh3nf/1rT09A8CjdhIsbIRUsWDpQQfYaL92CTkyPVfUq8veSNDlHL3+H1Mw6S7fsJgxVK9udzRfMIi5Ip055xOBTcbKljnxE2iNoqBiOGEnlng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=htD1q8DI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43634b570c1so5719645e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844542; x=1739449342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANA/S/Ju/e3qEgT9tA2+KKtVfktLoZrMTODVCC9QX4I=;
        b=htD1q8DIhixy+PKXspxc5l8R2W6b5BaN5KsRXFyjT8RydBb6pd7/DXBhR7ejywJcX3
         MyO7B8zm4zOzM0f7lKFd/Do+SdObciLNNpBq5eRtCOOMGFwI0tETuMewVrr3qPm64Zre
         vkLi3GYNJkTqyU2LQmBeLoDWqXtlgsf5WgLuxcJVPphNlqNNaUtekO/8hf6SGOEqXjqM
         WinJAiCuJec9Hy6bccFXxFkwsXVXIherE3SS9Gmaxb8PP16/ddTqJyfI5lxZRCJkBySM
         Buggp/Ex74S0uKRDrQW3EiUj5lAN387bJHLXIHpkdJbPrlBnkISITFVclpCyBkkqIXB1
         9UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844542; x=1739449342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANA/S/Ju/e3qEgT9tA2+KKtVfktLoZrMTODVCC9QX4I=;
        b=VrIzlMxsUHAl7bhqW/dayksictBslwKtXVw6T6Zc9aMatEpUbSKb7rfxxkfjJscnA2
         OHzkD+Qv6o0ZdyeIOh8YbvNuS7n7eIHfDJKEKnUyCI/vDkl8jG4Oy/lVgpL4h2EE+Vrj
         K2HRLxzoqf7I8qRNMTW8Kig3IoMi7AZGxrhGYy0FQqFlzgy7EuL75Rm2J+gVPo0ppFm1
         IZ3KcqmqxJStusWysUgJnm8tEOllTqVfxPv0W/iDyepp33F0puklRO3ufy8bLG/EvQMz
         1UAoecOYMkmpyyoeCD0OYX48hn86aQOob4zWKD6eXHU1fC+DsVSUP4PnOYRNC8txpGFT
         QmTA==
X-Forwarded-Encrypted: i=1; AJvYcCUNMXiW7uiRy/guQXByOAYIDVNG+0K4/A7xfahtfImz3KGzSPHAB+HE013drL+C1LQESaKIckaP5Fk+@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0EMGX8RTxgYnU1nPdn2wS7/og+yHoHJOJX7D2wp1tQ0fZS2j
	8Rps/X8iQaTSz4bXXXNf/sY7a1iYcPJ5uYTa4V/lHDoNteXDOqOTfgeyT4RLqkQ=
X-Gm-Gg: ASbGnctfuma8675QaoViVo4wPCMS54HVbtKrHeT+u1oeTQFIk+WM5HMPQ0jvxtayUo4
	7aTIRtOSPFwQdLcnfzNwLKLJ7kC+/3VLMcBF41EtY8w2+tvgdZgU2jfyRNi6cQMLakOrDtmaae7
	RQSdtO6rB0jaOKRaeP3BYMmcy8f+wmM/lwbDHzD65rWZVScMbVKFlOCVpZI3+erUTwMsrx5ruLA
	/hLRmFWeMGc+t+LDQSz3+QUiUZfkl/9V3lrqXd7LrL9vnoSjJ2c2Opl+OUMAgIJAWAjjgVumi8g
	O7i6Ig==
X-Google-Smtp-Source: AGHT+IHU4e9j9Ou32yJRqVxT3xxqD6bnT5z+/0labmdZ+UtwE06oWmz+7ieL818aTi7bv+f/blIEag==
X-Received: by 2002:a05:600c:310b:b0:434:eb86:aeca with SMTP id 5b1f17b1804b1-4390d43401bmr57028615e9.10.1738844541641;
        Thu, 06 Feb 2025 04:22:21 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:20 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:04 +0100
Subject: [PATCH libgpiod v3 07/16] dbus: daemon: add a more detailed
 description to help text
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-7-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlyr9dywyY2++x3efiBMMqf/6i1xNYSP4wkL
 5eqwEfAn2SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcgAKCRARpy6gFHHX
 ct5qEADgIn02cxtTzoC8AQ5sbUlHfvNc9ko9bMk7+QxxDJ5zwpTmyqdCdyZVCAFo9hBr3aUKkih
 d20eW194mEsSlrMP9hOKtjNABQImoPn8xzPzu1KCHQx1TNNYaM8Ls1/yv0ajwuQqViUAoBoLjT2
 UZbyg3IpjxG5z5DwaKCWTJBk41UsoBWIwcTtetoymUqT8tPNuAJIav/ig3XeT8SGAKBXRrGlHnS
 eVDzVB5+bNjY/D5wEYJoEoqma3FG8Z5UkrQ0AaZvHwdf/pauzpWT1A0YbpVw4P2Yg0jbF2bhNop
 VvD+a0UdJwJg5rfYQkflUeqTMf4XTQL0i/iaYP2ol3AaiAUuQPui4TfQbLyfza3O7Ym+wAHspUH
 9uCnRBNMOpxErWiQ2RyJMet+83SvGbxL9jWGISj2f9DCnInuiFsOH00deb0bO00qp70KOA37OBv
 cq+9kmzMMjSLqMACV0NNcy4F7JvzG7i1topWVFQTJOGpvQIvoOMBoNNPe7Pv0nBdnUtnaIFGlRh
 ipP9O7c69vUohPWpCoEnYcd8bWCcCNmbdnfKpIaU7hukCoiG6tvxKldaUi0OPc5IaPCl9djzg/s
 xQoJj09gKZPYBBHWMEKNcTbYI2R7P4/rq10SwFCEfBBfNvKD8yTzg8jk5MbBTEyZdrEt3aT4JKf
 Owy3F8xkCwszH/A==
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


