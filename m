Return-Path: <linux-gpio+bounces-36096-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM8OIu0Q+Wmj5AIAu9opvQ
	(envelope-from <linux-gpio+bounces-36096-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 23:34:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D20314C4254
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 23:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E300301454A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 21:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AEF35E956;
	Mon,  4 May 2026 21:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbx1ZakF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334A535DA65
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 21:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777930474; cv=none; b=WRmquNr46jY55r00CIRk3cJ/WgKdAgfbfYLlFt2SD2LThWVhdi8n8Pp/PqyNrTipzPGLSxTaHMmQX/XyKacUideJeYEkfUilJo6+tJa8YFfRdY7NuQRVt6mQq+mnulh1k4McTF20/Whl5GVeBfworh1fLQGF6GkhUM4rf22D4VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777930474; c=relaxed/simple;
	bh=CA6FQk89TOA4baC96QtgPVdZS7dng4OcxdsdoWy3+g0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BM9MspGqXbgI0SH4sWKkQx+8LCVtSBMh6TjyuEB5DplSyRrXyBBLyPC68olGpQ6U1cu4gKyTM4+3tb8eQa91JZjHWbvQhmtI9cYLZ7yDMUOuSXb64FNIomJZ7BLgKlAn71R8TsG94qA4ZDTmsXSszWFzVyE7kBmHdog3VlNBrGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbx1ZakF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so2775175e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 14:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777930472; x=1778535272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+yOUy5o4tyUwA3ddWOnmqsznj/i+jEBSQPJyT11Cik=;
        b=dbx1ZakFMV7zayDwBQ2B8c2FMG3tTim2BgICV71DML8T5/VMBjIDaAfKXwbC18DyFm
         sdEdSFfPGCrDR/p7Oogdb+Py4e8QVOYsQsmkBdghHnmYINFVpp5B7EKGhUb/4AurSEkr
         IJ3mZUFsBIbg8T8fP9lCN43xUMNHJdPkd38x8qbTeZyV2gnQkcijQbK2H8a/qAFeVobf
         csdXC2vqV8lju9yggsRziebme8CYoP6uW/nSn/GJryG4057zZmhL8Hnrxw0pRF3jkza9
         syu88EfSmt58MZQFqjbXFnfKhwT9T4Zmcl7rf9APgSQhU3BMss9gdsM9aXR2Y5jtcPtq
         LqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777930472; x=1778535272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+yOUy5o4tyUwA3ddWOnmqsznj/i+jEBSQPJyT11Cik=;
        b=A5C88a4XlJrnfBl9pwQEl1CyyurMAGDSUty7/P0LIxJYU2/fzCURx6vK+Ba9jBBiHz
         TSm69C5HwI50bFoSzZxp/YvSt45KumUnqQc/etu6ZH6aTdJf/5MlTbkUWPYHQmx2+shv
         a7ZjBb/Im57e1eEIgzNe+QZfjBmUx7bn7wkNpxqj8wQ4GfTmaIeCVdVlTyUNLiwSSoLe
         +BAcgdi/6p5k1FguLoigNBUwwGtIBpt0QB3Rs83/V7N+gINew+v38EAOnO68hZtD39P2
         Y68zf8RKWCHZJoLUo7i2CQW73iKrV5rZyKQjhqv82GK46XsajDjM8tRlR8A7TOn4A1BU
         YbCw==
X-Forwarded-Encrypted: i=1; AFNElJ+pncKpmJaed2o5ShbqMczdtGcALTjcfWvsCde8RoJTSR4hEHpbT4SBmyx8j+1gvnfYgJbctJuA4zI4@vger.kernel.org
X-Gm-Message-State: AOJu0YztRh1D5lN55idutwVFe7duFt2CRiSEKWO5YO9hwwx8zmszlXcf
	dt6JIWdksSTxaLKt4V07sPU3kcJHgRRMUO/TKzoQnpWE6ntCvWfTKBcx
X-Gm-Gg: AeBDievTc4QeNmGTFXgWYYiKyu/ACp8UUTNfLMkHxu/cfGFgiaeaAdIJFHLQQnk2Alk
	iaBtrt9qgtWyzDhqScetGuYQe8ttse6uoeh/qlPe1Kmq2cciXj8Qcf2X81K7iwSdRB6l9qfdbgG
	iTrdr2syNO/nw0d4qFa4zFo3zuVTs4lbQRSwnIDbQLbN5AX8XX2YDY1BHevLIVhTSh9iOgejFDK
	t30Dqux6/BqwgUjPhjX066K6BfmoKD2me1j+fzp/Zk9sMrgH/42MEH882aHaKy7CJbGagDXfGAW
	ThqMFHqnz9YOYBQE2Ki07DjMfflN3d1jq5yJ0QL3LR6bXwxg288fL1tbUaRPIoU/MX5zcJaGv97
	xWuf/4BkEFLvZhPxD2tlwGGdyCNRQ2jryoaV7B5XvTHdLr2EJidUfWnw9Dz0/M/oIARzHardHrR
	YB4LFKjcPJ0uvIbGd4BUO+
X-Received: by 2002:a5d:628f:0:b0:446:8299:c109 with SMTP id ffacd0b85a97d-44bb6206f83mr5539654f8f.7.1777930471491;
        Mon, 04 May 2026 14:34:31 -0700 (PDT)
Received: from lucas ([2a01:e0a:354:c290:234c:5dad:48b0:9188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4502b38b5c9sm200274f8f.24.2026.05.04.14.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 14:34:31 -0700 (PDT)
From: Lucas Poupeau <lucasp.linux@gmail.com>
To: acme@kernel.org,
	linux-gpio@vger.kernel.org
Cc: m32285159@gmail.com,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org,
	Lucas Poupeau <lucasp.linux@gmail.com>
Subject: [PATCH v2 2/2] tools: include: add proper strscpy() declaration
Date: Mon,  4 May 2026 23:34:29 +0200
Message-ID: <20260504213429.64596-1-lucasp.linux@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D20314C4254
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-36096-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bgdev.pl,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lucasplinux@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Currently, strscpy() is defined as a macro for strcpy() in the tools
headers. This is unsafe and prevents using the real strscpy() logic
that provides better buffer overflow protection.

Remove the macro hack and add a proper extern declaration for
strscpy(). This allows tools to use the safer string copying API
once the implementation is provided.

Suggested-by: Maxwell Doose <m32285159@gmail.com>
Signed-off-by: Lucas Poupeau <lucasp.linux@gmail.com>
---
 tools/include/linux/string.h |  5 ++++-
 tools/lib/string.c           | 37 ++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/tools/include/linux/string.h b/tools/include/linux/string.h
index 51ad3cf4fa82..4f3547d0cd84 100644
--- a/tools/include/linux/string.h
+++ b/tools/include/linux/string.h
@@ -12,7 +12,6 @@ void argv_free(char **argv);
 
 int strtobool(const char *s, bool *res);
 
-#define strscpy strcpy
 
 /*
  * glibc based builds needs the extern while uClibc doesn't.
@@ -30,6 +29,10 @@ extern size_t strlcpy(char *dest, const char *src, size_t size);
 #endif
 #endif
 
+extern ssize_t strscpy(char *dest, const char *src, size_t count);
+
+char *str_error_r(int errnum, char *buf, size_t buflen);
+
 char *str_error_r(int errnum, char *buf, size_t buflen);
 
 char *strreplace(char *s, char old, char new);
diff --git a/tools/lib/string.c b/tools/lib/string.c
index 3126d2cff716..12fabbe583cf 100644
--- a/tools/lib/string.c
+++ b/tools/lib/string.c
@@ -36,6 +36,43 @@ void *memdup(const void *src, size_t len)
 	return p;
 }
 
+/**
+ * strscpy - Copy a C-string into a sized buffer
+ * @dest: Where to copy the string to
+ * @src: Where to copy the string from
+ * @count: Size of destination buffer
+ *
+ * Copy the source string to the destination buffer. The result is
+ * always a valid NUL-terminated string that fits in the buffer.
+ *
+ * Return:
+ * * The number of characters copied (not including the trailing NUL)
+ * * -E2BIG if count is 0 or @src was truncated.
+ */
+ssize_t strscpy(char *dest, const char *src, size_t count)
+{
+	size_t res = 0;
+
+	if (count == 0)
+		return -E2BIG;
+
+	while (count) {
+		char c = src[res];
+
+		dest[res] = c;
+		if (!c)
+			return res;
+		res++;
+		count--;
+	}
+
+	/* Hit buffer length without finding a NUL; force NUL-termination. */
+	if (res)
+		dest[res-1] = '\0';
+
+	return -E2BIG;
+}
+
 /**
  * strtobool - convert common user inputs into boolean values
  * @s: input string
-- 
2.54.0


