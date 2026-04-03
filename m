Return-Path: <linux-gpio+bounces-34650-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPTPFaXhz2kS1gYAu9opvQ
	(envelope-from <linux-gpio+bounces-34650-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 17:49:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B119F395F52
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 17:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C44C1301ABAD
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 15:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5713CB2F6;
	Fri,  3 Apr 2026 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnK7jxGC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C919C220F3E
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775231188; cv=none; b=Af0mWAFIZzWuKGIlj6ujCWJe5RjTSMmsLZ5OWSmeltZKLcY+eSjROEdBIN+TaDZrpIvsOYIdoPwqlCW54Mmcn3ZZCv2w23OJCYSHK//yi6J52UAGfNxari4MoResxJ85csXFQcIDONnA8vFxscTZiC7Vex7XDM/RD//yLxupshw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775231188; c=relaxed/simple;
	bh=w1Jcj4evadKnHw2+V9YEcsZdhjluYVxC9YWfJQUWgqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETgsAPM2e9j362VO8bJfVVf2fvbS3mwV/65+ZVj2hAxkrmEHaq+ZDIXuDm349zxxLPTItsp/iHNq+Wo/vMG42MX9soOAOf1zu1fR2Qdn0ER6/qV6IM9CCxd6FqJXKn4M1tvwwm+LUec4HTgg4rvN8/ojVQff5i8NsUlUSprjyz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnK7jxGC; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d1872504cbso1926247a34.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775231185; x=1775835985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftAo6h2+Fiym93CxolOgRY8fqwJc6rkVQ6wYUBb4LDg=;
        b=PnK7jxGCbw+G+cJZUb+kXOUFWh1svI1iXrI9w8k7TBVJrJidLBqUSedIBJvL9vev+h
         hC40OP/BB5Q0dLeoH9EJFyw5tdt7cW4qjmPVX8MkjMkUTp1/kPgB3/8GtOmZYEqZNdw7
         PyyBopeRbQNEf/X1wgnYGXpxdF+1hqPKOpAttyOVNtBYNSCu9j7UjO+vqhk4Xi2MGT+K
         OVn5YUJeh8rxWlFSW+xOiAL9gknw+sxOuUZHjyEz4FaBZ9NNHy92FipgGEBTVlqQeNO4
         MU5HM9mC2GY29TCPbXxLihs/hAtNcdWMOkPmgS4jlEIRySkh9/+OfTnbel4UMH7U5dEs
         xLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775231185; x=1775835985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftAo6h2+Fiym93CxolOgRY8fqwJc6rkVQ6wYUBb4LDg=;
        b=ALerH8mz9EF2LGmiKKvyQuetg+STtBFkzsGpXu0vv7fkiuytqiaEcEqmsmVnCnoTzB
         vq+8k1h96N71IA2pKp6rxe9/Cg2rbFmMO5ju1DVu9R66UTm6zmXG0vhKjCOXomcO5gWx
         muvWG6WLrDiTObY+BKW1JSoO+4PoaKqu/N9i+aCZY7lVr7l9kOzjkSITw4VbEBPKEh+B
         zQaKlBzmyUmB87PgVyE502S/n9jrlaqWAKaPflFVOBFU0gJRR8CG7s48T2C/EdWaZmBf
         reF9Pvjs2xVUj/htC1Rpm7utoiJityTlPU9MTf4eYPtup+p+1n795+M5sOh0/020r1fb
         sQXw==
X-Gm-Message-State: AOJu0YwAeWoRCZQ9NIx2Gj8Wbd3SQjUJBaAb1hZr7exbHwMEzArt9F62
	57Loi3fFhMXBvHUV5cnVu78DHE4WYvO7AGooq6BVNYekaAaWVykGVUF52fpdhg==
X-Gm-Gg: ATEYQzzqDYHhvM+nHH1FN1vqsig+Y126SVR0sn+Bopd+BZzD4U7V+S5Ba63TIaPnC+R
	uREchP36Czuvw0qkoDj2/HyFE6HMn+GADBuIw2XwwTUYRJMi1Jg/DVZ/2KLem8PlUBTrNZfhxdw
	uMACJgLDnYHTND+dP3flFfGxkVOSTv0+i3fE9JeKry93LPDH+U+Cc7BJsebsR4N1bSNR/dvkC7I
	TAgZgfhkqiSK1/nEy1hRFeTx89wCLb6cPmNSXQ+1G97ZOYi9AmHo/WqcD7bBsO5GBRDhhbpmsLW
	ZiOau6gELtpk2SXwTLvilY2+w/EKvP5XgudV4OIE1xxX+Z/Ce8DlKTaa7si0ANOpj+EQCIg0f6Q
	adaoTH3ndOQ92HlAz7YHu4RfVUlf7cQgUVtOdeSZuUqi7MwJd5nBoSeYNYhk1H+2WLun6M8BO2c
	S7aBFrzTKQE/nUjaKVyCU2RY8mc24yDIv9LzQT9F+fAOLjK+e3+wKN8WQnXiBI54HFy4dgSV0=
X-Received: by 2002:a05:6830:6313:b0:7d7:ecee:af6b with SMTP id 46e09a7af769-7dbb793f2a4mr2478605a34.2.1775231185533;
        Fri, 03 Apr 2026 08:46:25 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba7126322sm4654515a34.3.2026.04.03.08.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:46:25 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2] bindings: python: allow closing a Chip multiple times
Date: Fri,  3 Apr 2026 10:46:04 -0500
Message-ID: <20260403154604.3944747-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34650-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,python.org:url]
X-Rspamd-Queue-Id: B119F395F52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In Python, it is common for objects to allow their `close` method to be
executed multiple times out of convenience. An example of this is the
`IOBase` class [0] which is the base class of most file-like classes.

Update `Chip.close` to follow this example.

[0]: https://docs.python.org/release/3.10.0/library/io.html#io.IOBase.close

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py       | 6 +++---
 bindings/python/tests/tests_chip.py | 8 --------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 8113fa9..6b7b32b 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -99,9 +99,9 @@ class Chip:
         Close the associated GPIO chip descriptor. The chip object must no
         longer be used after this method is called.
         """
-        self._check_closed()
-        cast("_ext.Chip", self._chip).close()
-        self._chip = None
+        if self._chip is not None:
+            self._chip.close()
+            self._chip = None
 
     def get_info(self) -> ChipInfo:
         """
diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
index d5a64b3..9007885 100644
--- a/bindings/python/tests/tests_chip.py
+++ b/bindings/python/tests/tests_chip.py
@@ -184,14 +184,6 @@ class ClosedChipCannotBeUsed(TestCase):
             with chip:
                 _ = chip.fd
 
-    def test_close_chip_twice(self) -> None:
-        sim = gpiosim.Chip(label="foobar")
-        chip = gpiod.Chip(sim.dev_path)
-        chip.close()
-
-        with self.assertRaises(gpiod.ChipClosedError):
-            chip.close()
-
 
 class StringRepresentation(TestCase):
     def setUp(self) -> None:
-- 
2.43.0


