Return-Path: <linux-gpio+bounces-35432-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HJgWH4Gb6mnF1QIAu9opvQ
	(envelope-from <linux-gpio+bounces-35432-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00D458109
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B10B7301C5AC
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 22:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF60733EAEC;
	Thu, 23 Apr 2026 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGYr+H72"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB62D6407
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 22:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982909; cv=none; b=vCEJbDQ4smK25CW8NXp8hPEwpB3SLWbwIc0KmcGWJMgnNNynByRwRM2kTuVU7CitJU83PQ9JhQ2s4B/yxDz7xUmkRCjk8Hl72PYm4Iqk+hNs1Vlg47kzwjeqkPkK7IJEuVqnmmQFLFk8vv6XUftytOTWrDc2GSFQF4RW2Up1wyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982909; c=relaxed/simple;
	bh=XgyeyPimgkNpizlW638YP4I86xaSrI+4b/FsVNHNFQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IepH81A3mE9bcZhSXD95FkNWWyUdGSc2H53dxxKMTik0h59WVulUb1OwhozL0uBv5abKZKGOSaxRqGJH1l+0LieaXlnVZb9i2TpyhVSWH/hFJLukvatZqkLzDcOXucTEGmwbnM56b4gnMeDAGGeJi5ysePkW/WFosDKzne4/eeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGYr+H72; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40427db1300so5455929fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 15:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776982907; x=1777587707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvRqQz28GgwGSdDRIEbbeoOKkXVV3dg0BBIJfA0mca4=;
        b=AGYr+H72JvXTr9EtfD8P5FRi65L9eacf4ulbvKeZSebZeeiaQtGAgdIAs0vJPePPLm
         uqyRwBEmgMxL67pu+MUdufrop9zYYZBFH3is/1vflpKjFOYmuA9mYtgOPofsbgkCsigv
         HuLUcqRG0Xzrj+ybxmiQ7YKCcS51/kKBEHj5kV0pVJLykal+jH1uGirXXSSxhMr2UxZY
         enjrWh1UhGzz5Qb1UyLZJf1jsq+vDoXMOgUinoR6LIgq5r3F9gHuW1mXlqwykuroNudN
         pZvl0vuENxlTp4E9/4kODik5i/0Fs/xRLUrlX2q2pJCP0YCY+Tkl8B+n3MztjY/oDV98
         xXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776982907; x=1777587707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvRqQz28GgwGSdDRIEbbeoOKkXVV3dg0BBIJfA0mca4=;
        b=OUBvLupWcLOeBznO1TRCMK8Imm9Doha+8V28tWxwIDCRhbHYXhI4ejovQnoXBjnfPy
         gh4mNpLgByiQBtefeOlVCdnxXAcjXENDtwv7LVDuEIXOSE8fPImIVvuBta4/aG1xv7Vp
         PGJvL/l0AjBrOkT1rKuQkjVpxIPnowK9cd1fHXifHv/5IwciXTrUQjpHiEMcfB8M95rZ
         pgP/zfjpNa3TKrpBA6e3JrANwIu/JLckobCyWRbFod+9UNgkErx6MiZshaVVpcadHhvT
         q8VA7IB7rOfzIqBW4o/kQV4wAafeSHCVVYZtapPxcwpG5RNXMXdCBruYO+ycA4azNYhB
         icfg==
X-Gm-Message-State: AOJu0YyXRXFUBEUv0Rc5tA+wbglchnsKFsjJFGIEglML5/DY9XBbkcB3
	OHEnbR0MJwLfnegJxsuZWAzDZiRMknweDBhvFML7k7Zlc0zAwXcqN9n5VPFqUw==
X-Gm-Gg: AeBDiet0gIQNUfTb8iPf3fN33GWJ75ViPMr+QtEU4JuM7efyFy5MpJFx9Qdonz2CZnP
	cNvK7W+OjngbKwYmd/gA3hEmoq84sv4QuiADJGSkbKyvKyPi3IYn8v5G/lYNY/oZ973d6TeUdCp
	/MYoAUpFQ+jr2KK1kqanz8vhou5zIjGPYQKVTio8Htpk7rZ+L3jT+eqL5WJvEJ0mU0XveVt+sgJ
	A4Rv3yxWxkd3SBEr3Dy2qQWPDLShyqtivN9iN7tZrKgKSolOc8f4BFBNEyQPi7OqHQyNCe2edsG
	7CCzdUOGmctuJVCHKnt5cPazWAkqA3FG/Khs4taJSNbd8tf1qIN8s3vSOv4d3pDRmkORf0icK1h
	eYB6Xc+jovEYBAxL/mcPDvLsFN7eML7hiDh5OKbDdfOCFM2I4jsJa78en9xmV2qS7Z/huetHznd
	pZDHWBYkihCcGOqZETK8RmPbT6s0VhvoeKXVz/ztS4Fz7qJBRgN7Fp+bE7DJH7ZwHBGdmpqE9X
X-Received: by 2002:a05:6870:7a0f:b0:41c:bab:5f9d with SMTP id 586e51a60fabf-42abf23972amr19016731fac.4.1776982906898;
        Thu, 23 Apr 2026 15:21:46 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930afa63sm17784598fac.5.2026.04.23.15.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:21:46 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 0/8] bindings: python: modernize C extensions
Date: Thu, 23 Apr 2026 17:21:17 -0500
Message-ID: <20260423222125.29097-1-vfazio@gmail.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35432-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9D00D458109
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series performs some minor cleanup of the C extension modules and
migrates the module defintions to multi-phase intitialization (PEP 489).

Patches 1 & 2 avoid calling back into python to perform C level object
cleanup.

Patch 3 introduces no real functional change but simplifies the code to
get the same result.

Patch 4 applies suggestions from from a utility maintained by a CPython
core developer to help modernize macro/function usage.

Patch 5 conditionally compiles support for using a standard CPython
function over a backported version bundled within the C extension.

Patches 6-8 migrate the C extensions to use multi-phase initialization
as described in PEP 489 [0]. While not strictly necessary for enabling
free-threaded builds, it makes adding support more straighforward and
sets the stage for both PEP 793 [1] which soft-deprecates PyInit_* and
PEP 803 [2] which could simplify wheel builds.

Patches have been tested against the full matrix of supported versions:
  https://github.com/vfazio/libgpiod/actions/runs/24860932220

[0]: https://peps.python.org/pep-0489/
[1]: https://peps.python.org/pep-0793/
[2]: https://peps.python.org/pep-0803/

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Changes in v2:
- Dropped "bindings: python: use Py_RETURN_NONE in chip_get_line_name" (Bartosz)
- Adjusted patch 4 to simplify Py_None strong reference acquisition
- Updated link to passing pipeline
- Link to v1: https://lore.kernel.org/all/20260422012041.39933-1-vfazio@gmail.com/
---

Vincent Fazio (8):
  bindings: python: avoid PyObject_CallMethod during chip finalize
  bindings: python: avoid PyObject_CallMethod during request finalize
  bindings: python: simplify disallowing _ext.Request from being created
  bindings: python: use suggestions from upgrade_pythoncapi.py
  bindings: python: use PyImport_ImportModuleAttrString when available
  bindings: python: migrate the gpiod._ext module to multi-phase init
  bindings: python: tests: migrate the system module to multi-phase init
  bindings: python: tests: migrate the gpiosim module to multi-phase
    init

 bindings/python/gpiod/ext/chip.c     |  29 ++---
 bindings/python/gpiod/ext/common.c   |   5 +-
 bindings/python/gpiod/ext/internal.h |  10 +-
 bindings/python/gpiod/ext/module.c   |  68 ++++++------
 bindings/python/gpiod/ext/request.c  |  26 ++---
 bindings/python/tests/gpiosim/ext.c  | 153 +++++++++++++++++----------
 bindings/python/tests/system/ext.c   |   7 +-
 7 files changed, 171 insertions(+), 127 deletions(-)

-- 
2.43.0


