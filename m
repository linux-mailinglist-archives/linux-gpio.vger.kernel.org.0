Return-Path: <linux-gpio+bounces-35325-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFtON6ci6GmjFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35325-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84610441137
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0953C303A8C4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8938282F1C;
	Wed, 22 Apr 2026 01:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuO37YcA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615471624C5
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820861; cv=none; b=QCCjNqBAcIszGN46F4rGAWZFUlmWMVcqBNbcSr4n8+uvJqjE+Vp1agfgFC1bFwghCqMFenPf9gSRBQ8NFLSnmtPCE4b9gpFDbTgH/cncBp5oVM3ZWstDCM2tiuXZlTBKjmiGjrEsoerGnx0uoFgo9aw7/SYmur2YQ69klKS8840=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820861; c=relaxed/simple;
	bh=Rr5fC3OlvLpQPdfWMH+2s/akHuGKMp9V2igyEWO0gQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYYExgNeAMTrTrwb+vd5XXB6cJgDPNkwpOl5+5Kkq6lR6Q+Um4mV4jeBsqjx1vv6ovs72rTMc/6sSHceZ1ZPNnTw3BYsj4ZPMOd9cDBaNNbZvpDx49UJzssrpILt9wl67nAJf3+AtYLeAtgTjzHVPN2H9hRAjLCZ/d6oSU8RFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuO37YcA; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d4be94eeacso4914297a34.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820859; x=1777425659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdya5LKZ9ajOlrGY+kF56RDY9LS4ty8P8nqmFYxr6hU=;
        b=IuO37YcAe1ywilyDVbQ6oHX+uUv1X67Ao+YLt5hyoq5HUVVNm2etSrqvw8pDWHSAVQ
         f3vs288uHoFW8T0h0IWDY+poeniILBLfsIriw5npN2OW35GW/vKp+77TGxyjuwkukbtb
         oAaoOMlJ0b0yzmtPRKBZzC7LO11j4t/EujtpRQ+Fv79+NC25UlmzU1aaRewqddwpBUo9
         B4xwmBlXKuRZnGR4l7Nrmwxr9aaLSI979jFy37lLsiqr7jEttoTZx2gYPQmAvz3/2iIB
         u4kyavFc02dg9UenYvM5CeeOjiIs/so+lIpMsYIx1L6KRA18wsOWp+wpa1gho6y80uc4
         Sqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820859; x=1777425659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdya5LKZ9ajOlrGY+kF56RDY9LS4ty8P8nqmFYxr6hU=;
        b=esNinT4UshW4DObje/mRJW2uG7Wpgd4GLhUkbMIFtEzWe/ztyRAEa+Ju6xulnl+ff3
         a4yTXzOrNoQWbKhSGKfB3bWIZqKCYS7LJMUoWix36iIz+4ZeBnoz30iMHeUnoYcqNGu0
         YiI9ifLbgFu0B+mbmCTBM92I3N+s5PUcYg1kWs8XvAMJgb4T7RFH4iXoxej1CbK6T/6t
         1Saf08TD0TgStaal4SUmLxAh9urQZ/xcac8Mf3raNSRFQCEDxd3vTH4Wwoc7d2MMg8gj
         C5iXJQDNgAC3Ax7lmq6XXd+KIVciJ6i0TSOjVwZxGLsMWaqj4ziwMPJuSC+HsC2iVMnY
         ltHA==
X-Gm-Message-State: AOJu0YwHoLHturpY0IxVTYTHcc/caIY0sudIJqMiP9DGTNb+2MXTSurU
	BG3FLsOFX65k3sKzTMicqivW8zfbxjwv4uBtcDC14yIc+qQEGzJqDKXNyxRSlw==
X-Gm-Gg: AeBDietJhqgk14x9oppfdR65wKf7EXBXiiQCdAJ3JOnfZj5bTmAEi8+GR++YF8dMhta
	BcbCOXeTFXnuKHE1BxlRjCcBzrV/eejo97g6zWbpEYoiE2qWUKEDjRYAHcMAl7exBg24yC+RW0k
	waXZrqZ5bcbbFROWwkoZnQHjizlJUCisprzP5ssEgBZiUaInfVLhQZW90LkQuJ1sTu6mBiUUW2E
	myW6KED+sFvn31Mljt7B9ljwdXArOt1xAcjnfLEOah1reoTJgVjVtpu/IefFpSaB6vr39ixLMRL
	P4Li2/jgFgfvV/CM8PiMXS9KsM7uHGW1sLd/sSbusDlEJ5D/L0ZuFKWQGnDB0GgcFzHhzOjLg4c
	QRjOT+JxaUUNdALnKKQ8gGeGi5VKMXL+QMUusIXCNJN3oBlxGesGnXNDrwSJL2cXBnMfMOW/8uq
	gC6kCYIqyh+8mNL+c9TeIMbUXJpzOQhOH2g1UG0sf7Khpb+2HfPHxGtBdRfVhtw5XKcK+1/gI/
X-Received: by 2002:a05:6820:6ae3:b0:694:a362:4b8f with SMTP id 006d021491bc7-694a3624d01mr817731eaf.6.1776820859138;
        Tue, 21 Apr 2026 18:20:59 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464eeee56sm9876036eaf.8.2026.04.21.18.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:20:58 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 4/9] bindings: python: simplify disallowing _ext.Request from being created
Date: Tue, 21 Apr 2026 20:20:36 -0500
Message-ID: <20260422012041.39933-5-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35325-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 84610441137
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Previously, tp_new and tp_init functions were defined for Request with
the tp_init function raising a NotImplementedError to prevent the object
from being initialized (__init__, the stage after __new__).

Similar results can be achieved by removing the tp_new and tp_init
functions which raise a slightly different error:

  TypeError: cannot create 'gpiod._ext.Request' instances

As this is an internal only detail, there should be impact to users.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/ext/request.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index 1e1f65a..9940382 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -12,16 +12,6 @@ typedef struct {
 	struct gpiod_edge_event_buffer *buffer;
 } request_object;
 
-static int request_init(PyObject *Py_UNUSED(ignored0),
-			PyObject *Py_UNUSED(ignored1),
-			PyObject *Py_UNUSED(ignored2))
-{
-	PyErr_SetString(PyExc_NotImplementedError,
-			"_ext.LineRequest cannot be instantiated");
-
-	return -1;
-}
-
 static void internal_request_release(request_object *self)
 {
 	if (self->request){
@@ -390,8 +380,6 @@ PyTypeObject request_type = {
 	.tp_name = "gpiod._ext.Request",
 	.tp_basicsize = sizeof(request_object),
 	.tp_flags = Py_TPFLAGS_DEFAULT,
-	.tp_new = PyType_GenericNew,
-	.tp_init = (initproc)request_init,
 	.tp_finalize = (destructor)request_finalize,
 	.tp_dealloc = (destructor)Py_gpiod_dealloc,
 	.tp_getset = request_getset,
-- 
2.43.0


