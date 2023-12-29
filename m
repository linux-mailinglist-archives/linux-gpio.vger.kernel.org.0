Return-Path: <linux-gpio+bounces-1915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8F081FEB7
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 10:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F545282BC7
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 09:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EE1101F8;
	Fri, 29 Dec 2023 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWOjniMX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A9B10A00
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 09:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9bee259c5so1429151b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 01:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703842441; x=1704447241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vS0Wn45sps+TwL3iN7GzIBr4cClZFxKj71HYPN1OV8=;
        b=XWOjniMXz27sYdOnMvVrfaNvWQu/RaRiS8GzwT+jO9RnEifkERSWp8+kpys8Aawjss
         +OKjFf6HLSrR713WsyKXGu2FUyG0uZ88gO7qfPehGzbdNvrZ5I2tvKs67F8DbYh6ivaH
         0HWQzd8ctk/HORyjds3O2xJc9ShfIgDxjRWbPqB3lqwe/4dZoC883hFU6ikpVgXUSkIz
         PT6CFOPKHQO9mfPlxmYIbKH46pNwhsDk3RhPIM0PRZc5GKkE/1NAt9H8q7Yu5BdavZJp
         j2CbJfoUcTGsZX/TsjqpZzMDI80tYaxan9SmBci+1oAAC0IHgGvUapTI9YYFdOmAEjaY
         24dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703842441; x=1704447241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vS0Wn45sps+TwL3iN7GzIBr4cClZFxKj71HYPN1OV8=;
        b=iB2hniugJpQdhfOHJ8pFb+qkAu0t5b7yhgrVUrYGSA2OQQTtYLK5wTivCcx8XqgSQ6
         liUGzHenoj7HPJT5gzu3zhNDIxfyfV1NMLfdfsZw+s/39phGzZGCmDvECdUFv0NwRcFt
         uQBNRrgABqodWYrM3Sg8XW+Jzca0D+c7Cz911OsEoF7lsuG5YntPN2TlSnoSCSsTXeX+
         d8jrCGi6WhiQdWekR+ram3stayoTyDPV3rloZHroZk9O1olkqYVrqQBJe+St7AyztW92
         bjdmC15lzQf77dti2S6q42EJiumHVqgAjjFhLNkxUQZUmwxeP1n26/qILpDgKZvwAAPo
         xSBA==
X-Gm-Message-State: AOJu0YyPCAocMv5We/vZT74gP9+onJYC0gF9e6vI0jRaSBGpcSJp82AX
	eT6NH+bqupvg/38biaf9B1otIgjcouQ=
X-Google-Smtp-Source: AGHT+IEwOxC5nhpbKQe0gNSU/HkONYN4FE/DVPXEZMsn6aezsLDD8xiy1K1aV/GDvdLbBg8Pz7MtxQ==
X-Received: by 2002:a05:6a20:54a8:b0:196:5720:fbba with SMTP id i40-20020a056a2054a800b001965720fbbamr1391160pzk.62.1703842441080;
        Fri, 29 Dec 2023 01:34:01 -0800 (PST)
Received: from rigel.home.arpa (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id pi15-20020a17090b1e4f00b0028be1aec1b6sm15600907pjb.52.2023.12.29.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 01:34:00 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 2/2] gpioset: improve toggle option help
Date: Fri, 29 Dec 2023 17:33:28 +0800
Message-Id: <20231229093328.62366-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229093328.62366-1-warthog618@gmail.com>
References: <20231229093328.62366-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reword toggle option help to add that a 0 terminated sequence will
exit.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpioset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpioset.c b/tools/gpioset.c
index f2f9a15..863da4a 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -68,7 +68,7 @@ static void print_help(void)
 	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
 	printf("  -t, --toggle <period>[,period]...\n");
 	printf("\t\t\ttoggle the line(s) after the specified period(s)\n");
-	printf("\t\t\tIf the last period is non-zero then the sequence repeats.\n");
+	printf("\t\t\tIf the last period is 0 then gpioset exits else the sequence repeats.\n");
 	printf("      --unquoted\tdon't quote line names\n");
 	printf("  -v, --version\t\toutput version information and exit\n");
 	printf("  -z, --daemonize\tset values then detach from the controlling terminal\n");
-- 
2.39.2


