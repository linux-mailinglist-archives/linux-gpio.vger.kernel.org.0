Return-Path: <linux-gpio+bounces-4233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C387705D
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Mar 2024 11:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B54F1F21642
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Mar 2024 10:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A438125DC;
	Sat,  9 Mar 2024 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T140UAcT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF4C3FE1
	for <linux-gpio@vger.kernel.org>; Sat,  9 Mar 2024 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709980260; cv=none; b=nI7mCJe3/gzBhRYmIVOs6T0Rw217qgeKFVOI0I3wJ0Oukxh1XqLacV6R3LGUiFfGBoQqlefRsykMfo8vWprRJX73alhKdF+NLDKgo4XOk3xuYmeEbiLKfzwwS6CLyfpLyDtnsZzRJUSXVJCbnwcqRQUKICLKjzX876zEKlDUceI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709980260; c=relaxed/simple;
	bh=/w8KesGuP7MkeFy7DS3K6jtbaeccxDXeLA9FS1MAMws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PQLcIsRbaJHV6KzgvL7/fvLMeuFtDMrqpVtc7klivAZMpGtCH3FNgA6KknapXb70+/oAsFIhEHCY0s8+Iu3zFaO8NkIcwMqfvfFH4LYcMOhfYtn7SvcD/F5Lzz86LoL5CWmvL5PzXU0DPHGMVq5AvJVrn1t9nmJwYWlQ6Ywb6uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T140UAcT; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e5a232fe80so2047583b3a.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 Mar 2024 02:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709980258; x=1710585058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D4ktnVnn+QPuRVT3FwvmxdOhBS2RwDhlPSlEEAR/Jhw=;
        b=T140UAcTzDVSYVY4qTdjHbfXrpQ/kxQ2hJPZ5/rIWyGRNMobuYZjb/32DqeEYz8TUA
         U9h/hxH3xbLyNbW7+TIhu2msn1m7aDd1ENQM9qBQj/T8dBOfgz+tsvFitkmWGzhCMJkF
         +Rr8ErKEhILcNv6HiGmZHvSsvYlh99f9GuWidwrh4sdfkjHDuxC9JfnpQ6RSKzetAYMT
         TlmLt6Z2UDfU+DhR50+/B1I1djXobu0VQCRugQ+U/m3hLal0b8j+cblHex9/+Po2tBhO
         qFIe0jaoHV9BjVh5nRf0DC4Jl5d4ZHo5fmQCKlEnD33IKIARsqjA4l+hbh6OhxXNbnHX
         VQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709980258; x=1710585058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4ktnVnn+QPuRVT3FwvmxdOhBS2RwDhlPSlEEAR/Jhw=;
        b=NcsF1rVc0RxqEFoFJs4geuMLjjUjnEd8egmLtgy00MEQ0/2QrOBTvV++Igfe7r9LZq
         EhImpS4qwJBByLZBw8u4nkMaCGmksss1AtzeAfzXaolkv+OgJPtPrkHErYSqYLzUQMGy
         yiORORU19vVM3FScR4ExjAHBAwW3DgF3AMkMWwMeslK3uwLPN9Aw7JsH++IydGGqtJrE
         BtO4N5x6Zpus+Dpg/r/DQ/a8kzyeQtQXuBzuOZc/Qz76P5/l/PzY5iOMJpo8rvA7tn6k
         p8w9PeGoYork0cPkBbQBsGE8S8ZzRq7aLterI+qrNpz0vEt1MDGpDwySr3n8WcbGR3VH
         SeZw==
X-Gm-Message-State: AOJu0YxoFEPyDUDY9b6JQjQz43zbYp2zbhMPn7huj7hcstQ+MH/73+yh
	9LC06i55ouU1V2uf+cJz2qRp0f0JQfuUyTZlodXviJLbBoFqxOrJM+wvw3cx
X-Google-Smtp-Source: AGHT+IGLyfIc7MnaVMaLfENpYhNUN/337Y2rHbGJtg9K5u6Vd+oMk0mms0u268C66vCv2yhGQ5IRfw==
X-Received: by 2002:a05:6a00:180f:b0:6e6:4dfe:a4c8 with SMTP id y15-20020a056a00180f00b006e64dfea4c8mr2396653pfa.4.1709980257792;
        Sat, 09 Mar 2024 02:30:57 -0800 (PST)
Received: from rigel.home.arpa (110-175-159-48.tpgi.com.au. [110.175.159.48])
        by smtp.gmail.com with ESMTPSA id b19-20020a631b13000000b005dc36761ad1sm1036248pgb.33.2024.03.09.02.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 02:30:57 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] bindings: cxx: examples:  fix typo in comment
Date: Sat,  9 Mar 2024 18:30:41 +0800
Message-Id: <20240309103041.168095-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in comment in watch_multiple_line_values.cpp.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/examples/watch_multiple_line_values.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/cxx/examples/watch_multiple_line_values.cpp b/bindings/cxx/examples/watch_multiple_line_values.cpp
index fb71fb2..ea78667 100644
--- a/bindings/cxx/examples/watch_multiple_line_values.cpp
+++ b/bindings/cxx/examples/watch_multiple_line_values.cpp
@@ -46,7 +46,7 @@ int main()
 	::gpiod::edge_event_buffer buffer;
 
 	for (;;) {
-		/* Blocks until at leat one event available */
+		/* Blocks until at least one event available */
 		request.read_edge_events(buffer);
 
 		for (const auto &event : buffer)
-- 
2.39.2


