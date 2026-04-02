Return-Path: <linux-gpio+bounces-34621-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKNRCL71zmnTsAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34621-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 01:03:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97E38EF54
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 01:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43389303101C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 23:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212343370EA;
	Thu,  2 Apr 2026 23:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIGKo1oB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A41A6825
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 23:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775171000; cv=none; b=d6GnYFxPW2HP8/HeSsCz6mOIUNHpEl1h7UO/IWhkA24MOqWBnPay+B8pavw3pIRHJNPsxYWzItHUKuzR/ZVdisyQ5q8/gxgZ6UGJJRGV/t7LWKoTIP4YD76Uz7R+lkuyZyZGitUhIvzZ4pc223BG7aaONbgsljtePY9GxhfVwr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775171000; c=relaxed/simple;
	bh=8FQO4M5dyAjgxX+o/CyHskFfh+i0c9weSwdG9dip35I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J62Efn84CoQqn+Pr51GSs3OkOseDgKIaRq3S5B0xNnGW9h91bwTiSBr2vjK/uSYjT1vDCLF2cOs5gCKkm/QwImmtDb7Vg1h9QPXYoMbv1niIVcqaONTDPJpvDaHEoh+6g4pVpS89lbCc9+F5UDayAbVLHnYpEPVuEcJpWAGk0L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIGKo1oB; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4670464029eso839649b6e.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 16:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775170998; x=1775775798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rqjkeVly6X+nXBuyA4NDGDCxgrqfG9zYTkKJXm8+2sc=;
        b=AIGKo1oByykc8tjQrup5TCJQOIwDqxD4Si2Z6qpmuyL433/0Yyzx1gdPCVHcny/UZo
         k0DcJjrVDBuaVhKSbMuBzxI9BXVOX6YApuqqJPd0zOP7ONcWbI+VPeJlloLl0VbKBm7g
         RCrIcXrptKhu6Ysc+fbVhpVLUF4ad1usvZVPDrFCOD1LpUaWASZmOuHUpvJAg/YwJqdD
         MzFw0sttal0PoEDjnTJYhh9zn1byLZ7I2N/cpIhWfQVo5q0NdBkjyYazcJSbcnnRgzCr
         NoRXijHjpuCiaFC+zowjDBmFmas6DLXtIiZyfxjV4tpoksCMyeMm5M7sUB4hBLDMPWay
         XRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775170998; x=1775775798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqjkeVly6X+nXBuyA4NDGDCxgrqfG9zYTkKJXm8+2sc=;
        b=BtklRD5WKR8bBYX2CJ56fmIbFgH9iq5JoPdDbqrHTFFpjF5aCkMJQiZJlSit0067cw
         sw4ecR19Z/DuqfalU6jtrXRcqzZpZnrivD4TzRMLIgxQghvb74BtKFxOJ6cuvWqG4L4n
         V51z3V9DF2c2YMtx4qaWE1plSWbSA9cAxw+jNFUgiPpD1Qglru0JX7bvoZQqqCrYV2w1
         pFHKIun2J/+sf2Mqq70cOohqclQMEeVgOnm89FRw4HE0OIBKSm2ZpVUd+SCuI7Q9TrL6
         VaVBf7+OmjoRe4UCvuGdtDDbtZL2zQrO8zG94WFCJMkT2dKcgH7vLdybgmNn57169UoQ
         YB2A==
X-Gm-Message-State: AOJu0YzBDPIUroH4ZvYpiFipqyg+exc1TlQeLTXh/bLwD1Eo/9xzilCx
	kX+QBQIqOA3DByT6BHEgcnzsYH86YB+ITpCj5fcpT4sm6b8FBd0duaGSpkAITA==
X-Gm-Gg: ATEYQzyp+E0JQ6/bR9cKSWkurCALVOlgNk2NrpGlzGn8vc+MUT+Qe+x9NEYoyoV8wbh
	YtLMXDkRzHtkRFtmRA+zbJNd9XxhxDFOT5AQoaZ681WnYX9UGa8UsrBqKkw9rG3qzQcivI5qe5z
	Uc/EegBprcH+de/iVouzPp3A7CCSpRNzYyQozLYNFjFHeVXALR+36xboyCSNzhukF/kLs79tAwO
	nQToaHnunQQIx+ZmKTSnHe7WxR51btLKXo2i5eALdz+TbNJuoGg5sdtKdG5LC5f9nTwV9cioaYk
	EB+oE/QrW9YD4eklpbXZxmZ43nbPxJQb2TMMzc5YMUSddGBQ/bicxTkjYWpg63DA+EmTpt49L8R
	WHQxNgy7dXpXlBXzn906cZZtxhfWnrODoTVV8gVAtIE5NmomfPNnexF/bj6GxU1n51wXLFKfd29
	HOX9PYZf0MtEbzEInhs+EPMBAQR4RfaYrNPZaR4+LPvh+0dAcHVambPsIpaSMvJw==
X-Received: by 2002:a05:6820:188a:b0:67e:4140:769a with SMTP id 006d021491bc7-6821d24030dmr551027eaf.7.1775170998225;
        Thu, 02 Apr 2026 16:03:18 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a882d96dsm2779753eaf.9.2026.04.02.16.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 16:03:17 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: allow closing Chip multiple times
Date: Thu,  2 Apr 2026 18:03:14 -0500
Message-ID: <20260402230315.6501-1-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34621-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D97E38EF54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow closing a Chip mulitple times without throwing a ChipClosedError
to adhere to common Python semantics.

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


