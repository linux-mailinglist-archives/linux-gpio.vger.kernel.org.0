Return-Path: <linux-gpio+bounces-35322-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKqLN6Ei6GmjFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35322-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5C441122
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B337B3024116
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACBD282F1C;
	Wed, 22 Apr 2026 01:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEIfBZF+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B836317BED0
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820859; cv=none; b=pMbU1F76Jm3FGzNqg5YEf+ba6pd5deqYcjg4jdMg/fSlglnlRQmrDLH4aLSITVlZoGg8Pijal1lzbEiD2wEn+feiyQlXJ3IFBrWmKxDxqQ1/RZX3yc9WcanbqnxGRQ3Og98kBi8wKhOdlMexskNaaH8f2TyjgU0UGg/xTRQ1Uao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820859; c=relaxed/simple;
	bh=i5zZUaKexs+Xza5nnpMyD890+7oJXC4MAm4TG0N5b4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tjst/+jnBMSNi0e2wLiWVkfhFuSEe0lieKt37HHPEjdDqhTeUzg4RgFaw7tPEK4hpD2MYj6Lcd0GtEAUf3rzuzk2qQ866byZyh6CjYbjb993MoQKFcZXDg+MXRo0gYXKuRJ5rj251wMRAIq3Uwcsi22B2PydSrMqnF0WrlIkBCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEIfBZF+; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6948b5b1c53so1436117eaf.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820856; x=1777425656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Qkd49djOm7CHVanzxICHpkmRbKW8wdEns/fRNw6+3c=;
        b=GEIfBZF+oWVboMB8KKYJJDCE+3pKifXESuHp4Dd5LHZpqm+vfljJPSXMgoLs9unYHp
         RGzVSKCVOZVgRa4abPsxBF3lYBaVpZLlgMqTxzGIGUeGUy3C2Nj2jE0W8n84+09LFBFT
         4YCr4L5s0KzVFySDRU6tPpSnEa8OlikwfvUxoFp+BBwzObP5zhC0n9yC/KGt2RB4xEKn
         g5eOYJpl9sUfFoB1bo/HG6LPOLij4rOIEdLAChI9SZCLyuipqUGPefZKd+N0wZO4ZOgT
         u4Bc78jjA8EmwdY/ZRDsxUkoZqJQa96qk3DNRHgpe/O3Yb7494Toh+qaKGRVVmG/CWuY
         xT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820856; x=1777425656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Qkd49djOm7CHVanzxICHpkmRbKW8wdEns/fRNw6+3c=;
        b=ITaqlCFMJoyoaGkH4lj7q3o3qfhHj1laZ4MDrOKrTcWOADcjlmuIunXtdm7zbuhadV
         h+gfTtXVnDUTEw4YpZ1T4Zkey9Y3GFA32UL3ghVRTM+MCfFUEmPHgBNGfLPH6OLaUtJI
         TQZ8+KEhz5BYB9OOPOaF+1Ik94tYzThUVfGKZ8MVOfPHq4KhlbgTFYXdBWB6BbuTGt/b
         lrAi+ETs12YWW+CrXEphBQmADLNmMAEIj+fV5W/lOhJrmuce+5/nzCYUp+8If1zTgfkv
         8CoiQqw3W2C/E6hXpi9+LHuCQ+Nk+a9v8lI63fYCw0kGKNGcBGpTPyLjczR6uGRrBZRc
         xyXA==
X-Gm-Message-State: AOJu0YxSjoUsIRO6AHSoUCvh3udlwlZOSuQRLD6+jdsmBQjNgDSE5BX7
	S/oS16/FD/V6ABfRtaLfOfAi2BI61YF1kPzDvliSBnXZrq7ZZTf9NrmhXr7N8w==
X-Gm-Gg: AeBDieu0OyDizH/LCV0LsPcWuofg5mT7Z//d/D/2/Xa57qWIjA1ijA5G79mfaNBKray
	DiHYgxR5VbA1vLrPNeVmJXUY5XUWSo0eC1vb2NDMQEiBlxMcae6SdY3eigkaZMsTvtj3VTn1Tmb
	6NkG8wwdeYc0eIoug7sWov4uIvUQxAzQWbTjvNAKONcZPI71vluOay0KYiaep9XrUnUDKdTaO6f
	7pXN3SzSExKNmNmgFfyL2DsLqnvUSMKgFfce0/0NFkiCXlLQ1E+D9gmD8v2rkLCesCz1XBKSuOE
	DIGS0PNWADCut5pZs1MLlNsJ06H6tLDvRy+e190HG/99xbfliq5sSroY7mvpBIRyZMhi4lgwGZk
	Hl3683WvZhEY0/vPwGBbhT18Qg6OMCWI55OVOvdbSLFRtBH6qayC/oTCC1uoBSObbJu1eDh1QHr
	Brgyedu4+Hm+D8JlfVfUR74OFLTE2Bm4GAqT+Ft8jdSVc6cNQCaVzmNRNesxVtnnOGeREjJzmI
X-Received: by 2002:a05:6820:82a:b0:685:5300:f1c2 with SMTP id 006d021491bc7-69462ebb6a5mr12023866eaf.28.1776820856433;
        Tue, 21 Apr 2026 18:20:56 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464eeee56sm9876036eaf.8.2026.04.21.18.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:20:55 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 1/9] bindings: python: use Py_RETURN_NONE in chip_get_line_name
Date: Tue, 21 Apr 2026 20:20:33 -0500
Message-ID: <20260422012041.39933-2-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422012041.39933-1-vfazio@gmail.com>
References: <20260422012041.39933-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35322-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86A5C441122
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When commit 0c0993569c54 introduced `chip_get_line_name`, it failed to
utilize the standard `Py_RETURN_NONE` macro used throughout the rest of
the extension.

While commit fbc0a4471215 fixed the underlying reference counting issue,
utilizing the macro is the standard way of managing reference counts,
works across all CPython versions, and brings the function in line with
others in the extension.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/ext/chip.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
index 53c4b80..19b3a4f 100644
--- a/bindings/python/gpiod/ext/chip.c
+++ b/bindings/python/gpiod/ext/chip.c
@@ -152,7 +152,7 @@ static PyObject *chip_get_line_name(chip_object *self, PyObject *args)
 	int ret;
 	unsigned int offset;
 	struct gpiod_line_info *info;
-	PyObject *line_name;
+	PyObject *line_name = NULL;
 	const char *name;
 
 	ret = PyArg_ParseTuple(args, "I", &offset);
@@ -166,16 +166,15 @@ static PyObject *chip_get_line_name(chip_object *self, PyObject *args)
 		return Py_gpiod_SetErrFromErrno();
 
 	name = gpiod_line_info_get_name(info);
-	if (!name) {
-		Py_INCREF(Py_None);
-		line_name = Py_None;
-	} else {
+	if (name)
 		line_name = PyUnicode_FromString(name);
-	}
 
 	gpiod_line_info_free(info);
 
-	return line_name;
+	if (line_name)
+		return line_name;
+
+	Py_RETURN_NONE;
 }
 
 static PyObject *
-- 
2.43.0


