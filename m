Return-Path: <linux-gpio+bounces-35321-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AkuMqAi6GmjFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35321-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5544111A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A3F5302297F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32373275870;
	Wed, 22 Apr 2026 01:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCi2ESLP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FA71624C5
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820858; cv=none; b=GGSzwnWQ3S6ZRKSjoY7CwgItkhDRKd9mhEkaeZTQqIC6MT1gjh5kH0h/5PLstyXsdp5RUT+I0iSOpMNQQNzpD2Ai9w+tw8UYS/A9zcsFEd0LyUO7CZxKfIckqkUgX7b8MsR7JxHBiNU8ZCUv1jxce1eoX9uaOSuWbYchLLx+s3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820858; c=relaxed/simple;
	bh=oSRxT/cv3h/E1PLyEkK8E6gxJF8QJms9k9oqry5h70U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S0FgFigspUuxERBH6nv4NTOAb1HIwHbpgz749BFUO9L3Qyl2AWvhh+A1WCMwbMoMR7OHniu/IsT4oXc6Z1RKnsFdhmGI60FvKrgUuHc+GSJE7dLcZBhu2SjbWGOknsvcMWs4Rum/VwbP9QzqLq8Wrq9zhpPWVFl9p/BNshYgtWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCi2ESLP; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d4be94eeacso4914262a34.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820855; x=1777425655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eBcw60sRfgDz9cjspwXBwAnDTvVQRLJYYLalj6KXa6w=;
        b=PCi2ESLPxEWfMzYdwM+5hQYhDjuBPmi9DhuJe/ySsXl5c79HCOBjzbz0vcGUW/0JpV
         +Rz6/XmZ2u2j5xCUUFnP7LZlUJd3Acaob+h2jHh/stmnX/tebefMcVI8tyyidPhkKiK7
         A1hPgXPgxPir5MsS/qFfmKPbxI8ighcbiiGapqWj80nA3IVacXu5iEf6C9XwVFR9Nntm
         H3Js4IZIHP2Iv7di4JVVBrq3bRNv+UAmfBG8hJKRexRSH0UKX+euvbBHPqeqqJdXEqUf
         3fCAb4iy+f1nYFsa3vrWtLgbgJi0x9Y0n6s6BD3vzFPPvpu5vxBgAwQTuKKL1SltAVAL
         EaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820855; x=1777425655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBcw60sRfgDz9cjspwXBwAnDTvVQRLJYYLalj6KXa6w=;
        b=rXLk4AQrm9meq0k8aKHp5w8ueFOp4Sbk+PTV04qggZR56/C08cK6PL9oUw8MLL4krl
         C7Wl2mswzmQBYN26qi2tZH8PoWSxqDzmZb7C3Qm6KQ3wFpFCGW0qO2w1k7aDVT62bQSU
         2eqM51D7iASUPJgXJj4oWf21BH8kZ2dID5akJKm0q3j/EGD9Z7qIb5OhBSXtWjhpQtwW
         H9f55Q3nlXOsjXydD1GNONQiN3ZJHt5vXtPzCh2HOtJ9jbai9bGn0qHrRfq1EGBz/DKT
         G6malU+DWmIrEN5R8Zj2p8mURpOcNDQdDr3WC63CppZTLTY7nLr7WDjv18k1mRKLtZSA
         XyEg==
X-Gm-Message-State: AOJu0YxnPrRtCF7UyJ8yXo7CgNMHeXxkb/g5Mtxpk5AtIzaVBQUIbNIE
	7Cf22tPaM86PiSn94WQtxd+0v/a1mJG/VDNS4A52g59P5so1qpnWBHBeuh9pUw==
X-Gm-Gg: AeBDieuibgl0/SuwuxRbRFVZVY6cyLhGjANsQgRrQsXTs8Mz9U1XgbvlDbiJ3Vg16tL
	1OtWTqc+5VcEZyEFlxixHRWMCGGzn3YLJP0CQMty8MUmxJYQs6hOaf+Olo/1kEklGaRWtgz4js9
	HCMOKKxrxp2TJkOul/Ibc1CLmgENZ33duEmbZBc3kzAYo+v7bBn3dOlBs4qSS70xkj0k8kVR/31
	j1eOdjtYq57GuRCFyyaj+5XOKj212yxlsKB6neTUqs/WTSBJt3Pj/5KWqkYvgnxb0WA8Cuyotxy
	lpok//OdA2vy80M0/dw0NgRGiBcFGTPnsNaG49LC4vhy/B2nexsmR/8mkwk6ZG8gVh4YZuNNbqP
	oVPC+7wiankWNLoWjCIt7bI+VjeOJFtu9DqF9HSVLrRTgfJtT7JCoRRNBf6L+c49vW1LDWmQ2td
	hwMIyzIZ22FjWiVEj1K1i7UPZkXWDGquOtvtpWb8VIpwnmNGqGASNE3VFDZ5BHeCnsI7EyYo/h
X-Received: by 2002:a4a:e90e:0:b0:685:e786:bfb5 with SMTP id 006d021491bc7-69462ed385amr11396655eaf.39.1776820855284;
        Tue, 21 Apr 2026 18:20:55 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464eeee56sm9876036eaf.8.2026.04.21.18.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:20:54 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 0/9] bindings: python: modernize C extensions
Date: Tue, 21 Apr 2026 20:20:32 -0500
Message-ID: <20260422012041.39933-1-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35321-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[python.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 28A5544111A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series performs some minor cleanup of the C extension modules and
migrates the module defintions to multi-phase intitialization (PEP 489).

Patch 1 makes `chip_get_line_name` consistent with other functions.

Patches 2 & 3 avoid calling back into python to perform C level object
cleanup.

Patch 4 introduces no real functional change but simplifies the code to
get the same result.

Patch 5 applies suggestions from from a utility maintained by a CPython
core developer to help modernize macro/function usage.

Patch 6 conditionally compiles support for using a standard CPython
function over a backported version bundled within the C extension.

Patches 7-9 migrate the C extensions to use multi-phase initialization
as described in PEP 489 [0]. While not strictly necessary for enabling
free-threaded builds, it makes adding support more straighforward and
sets the stage for both PEP 793 [1] which soft-deprecates PyInit_* and
PEP 803 [2] which could simplify wheel builds.

Patches have been tested against the full matrix of supported versions:
  https://github.com/vfazio/libgpiod/actions/runs/24752901690

[0]: https://peps.python.org/pep-0489/
[1]: https://peps.python.org/pep-0793/
[2]: https://peps.python.org/pep-0803/

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Vincent Fazio (9):
  bindings: python: use Py_RETURN_NONE in chip_get_line_name
  bindings: python: avoid PyObject_CallMethod during chip finalize
  bindings: python: avoid PyObject_CallMethod during request finalize
  bindings: python: simplify disallowing _ext.Request from being created
  bindings: python: use suggestions from upgrade_pythoncapi.py
  bindings: python: use PyImport_ImportModuleAttrString when available
  bindings: python: migrate the gpiod._ext module to multi-phase init
  bindings: python: tests: migrate the system module to multi-phase init
  bindings: python: tests: migrate the gpiosim module to multi-phase
    init

 bindings/python/gpiod/ext/chip.c     |  35 +++---
 bindings/python/gpiod/ext/common.c   |   5 +-
 bindings/python/gpiod/ext/internal.h |  10 +-
 bindings/python/gpiod/ext/module.c   |  68 ++++++------
 bindings/python/gpiod/ext/request.c  |  26 ++---
 bindings/python/tests/gpiosim/ext.c  | 153 +++++++++++++++++----------
 bindings/python/tests/system/ext.c   |   7 +-
 7 files changed, 176 insertions(+), 128 deletions(-)

-- 
2.43.0


