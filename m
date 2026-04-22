Return-Path: <linux-gpio+bounces-35323-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAajF6Mi6GmjFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35323-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3A441129
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 185B03029247
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7832D3EC7;
	Wed, 22 Apr 2026 01:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIRM6Z06"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792471624C5
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820859; cv=none; b=F/sX6SFSEoCufeRat6YOFR2xQLqk0wegFyMrOgxYhx8CgsvcVpYYb7Oh2Z6S4TR4epTf7XxiGMCUcf4wfRXaYbmS8DiCuCTxtQNTSEBVomvAv3MolZof8TdM8jSMXs6wUzGT8lMeJyKOzhSXUYUr/BWkwzUoznepx5hwQz/uWDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820859; c=relaxed/simple;
	bh=vBQiX4H+Q40tI+kXf7JLgyapPYbs/Gopdyd21AObp6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+mTmedUKxCWinEbarimLmWmQCI9UCsc5CrLVZllwyB+boqu2zxV+8IUtBoUxqQ/AoUamgoq0oKI7WShrmZquFkjwJXjyJPG8F7qLtGfLMWBoVHuZ0peY6/u5dGxHZP3Dz+e8Kr9jd+Ai47ZicEmaYVl4ekb6fmZ/pMULSRYCNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIRM6Z06; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-66ee7b9af94so1862057eaf.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820857; x=1777425657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+oX+8l6WsiYQf+Ry3PGp+nmtNjVHKigsakMJwVqHaQ=;
        b=NIRM6Z06hataCKQ5n/6+RXHJQqwFF3mkYqtUc4pX5WfFSmSCb4hVRDpJOjxStKJEpN
         tVLWN9exYn50fHqQ2i+bsWGwBbpdZ3lcFeROFiVFN2P1IBTnAaCxVc2k7GSdkokMd65K
         EaCbUQjaTrmCvwwi5BuEhv50zvAL6T30XgJNDJyzXRyw6S26WzMJ7wX+RakGSalpW7/Q
         YnUo/Th9QNRm0KKcYeyX4accQVBpgS19Hzt5i0TxI3aac6APbDb7BmrIbDK/SyY2TsA8
         MTcbfKYJcK2JvtyIcchncMWQB4Sjy3BSkP82w1jRzwTqoKk9H8n00g0ZKRYXV1Vm9rig
         K9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820857; x=1777425657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+oX+8l6WsiYQf+Ry3PGp+nmtNjVHKigsakMJwVqHaQ=;
        b=GIu9yYfeW7zFhLuGAr0PRVN/xiGCBUDTfRTMtlZ44fOPZkM9mVwavSX2TAB+qMqMBS
         113e+ZAaFINV1TmvCbxpDCSAZj0CKrbzv1bMTpTGqMWF42kK19rTk131F2+dpT8YXqjf
         IIm2lAWZ08HZSPH4cQ83UM4krA9pk60tJh8n8Dln9in41ErFh+4T1LY7pXWlnxcn4BYj
         V31tSoEdDDG6bW0ueGNzok2FWXzJhdZJdL3hGNHDRbzC6bXVhzQ4W7L0NVWR+K3lSCXX
         qMZ5TBXiFYPbgyrXf8tFLBhWmJqaO/GjRCo8IGUb/WCOjF0n9dCzvxf1lW46tUGNFIJG
         MRtg==
X-Gm-Message-State: AOJu0Yz7/qKCRAQZ4uTWIi0opDa7KzsW4az8jWqcO47ewfNZXbGx5m/1
	qUb96r+SwcHXfPdkZfpMYNkJmYTIeWRSSiZTnEBnSfQL0kHQi6l0QOuYG26LDA==
X-Gm-Gg: AeBDietCwRspTbcl4Soz1FJcvlBAzW5UkhZBPeTw9ligikbS9WrFZX8X53XCU/NHeBu
	/7gSXSzAWJh5K6I9dgibuLwZHLkbycwNCV16WN8Rb5fCW3bl9oZjaLo4SfNuGfG4Z+KfGytn3oJ
	9ZbNVKUrO5XoYbGQL/sPjPF7IBvzmYfnb1ED6Hqdg4o6ICut2YEfsbnJAjriLtv2MFfYldVtSkX
	GkW0OgqXQxIFBBssbgWOhaEhy/MUE1ES9HzHiU0JZjUowgUg/UouSj4yLyiFryp5Al5wN29L3PN
	RR3UreMY+vw1lWYXnbCxkFFK3xutrJm+iTubjksVcuDW1NRXxrJxreY6RMtDQllCGCId7LonpMi
	KLwoEkaCN4sLIiMkpnLv9r4KUT8qZmq5PcuDtbR0OKJO24V3KZ/39SWpJlY3AQF3suIDrpUMuKj
	xXpC+FZLfYO+ulqSSDouHuGD1f6eCxJC4/DqBJuwkXE7if7eYZDqvkYVzeZL0n68S4cTJ21jPf
X-Received: by 2002:a05:6820:1909:b0:685:110:5572 with SMTP id 006d021491bc7-69462ee7145mr11324235eaf.29.1776820857188;
        Tue, 21 Apr 2026 18:20:57 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464eeee56sm9876036eaf.8.2026.04.21.18.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:20:56 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 2/9] bindings: python: avoid PyObject_CallMethod during chip finalize
Date: Tue, 21 Apr 2026 20:20:34 -0500
Message-ID: <20260422012041.39933-3-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35323-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 0BD3A441129
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PyObject_CallMethod function jumps through hoops to find the method
to call and to build a stack (if necessary) to call a given method.

In the case of finalizing the chip object, that overhead can be avoided
by simply sharing a function with `chip_close` to close the underlying
gpiod_chip object.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/ext/chip.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
index 19b3a4f..9061d23 100644
--- a/bindings/python/gpiod/ext/chip.c
+++ b/bindings/python/gpiod/ext/chip.c
@@ -32,10 +32,19 @@ chip_init(chip_object *self, PyObject *args, PyObject *Py_UNUSED(ignored))
 	return 0;
 }
 
+static void internal_chip_close(chip_object *self)
+{
+	if (self->chip) {
+		Py_BEGIN_ALLOW_THREADS;
+		gpiod_chip_close(self->chip);
+		Py_END_ALLOW_THREADS;
+		self->chip = NULL;
+	}
+}
+
 static void chip_finalize(chip_object *self)
 {
-	if (self->chip)
-		PyObject_CallMethod((PyObject *)self, "close", "");
+	internal_chip_close(self);
 }
 
 static PyObject *chip_path(chip_object *self, void *Py_UNUSED(ignored))
@@ -62,10 +71,7 @@ static PyGetSetDef chip_getset[] = {
 
 static PyObject *chip_close(chip_object *self, PyObject *Py_UNUSED(ignored))
 {
-	Py_BEGIN_ALLOW_THREADS;
-	gpiod_chip_close(self->chip);
-	Py_END_ALLOW_THREADS;
-	self->chip = NULL;
+	internal_chip_close(self);
 
 	Py_RETURN_NONE;
 }
-- 
2.43.0


