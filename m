Return-Path: <linux-gpio+bounces-39454-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QNLrGdsLSmo29wAAu9opvQ
	(envelope-from <linux-gpio+bounces-39454-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 09:46:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AE47093CF
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 09:46:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HqQeKiy4;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39454-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39454-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A4B4300DDD0
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 07:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9DF35F602;
	Sun,  5 Jul 2026 07:46:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4983542CF
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 07:46:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783237590; cv=none; b=kLC8kxbFyls3fcibUL9T+yMErMv3do2OANFZOrtSzJpf3VEkFYEq0JczD38QMjk/qp0A/yu+koruERD/1gPQmaEujiSIpdXU+dOE3fhNuiDJw6wG8J58BVIVWsjEX1JYDDPVbFcsJGX52ozMPznMz/Elp76uBlUZj2WjZO7QW88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783237590; c=relaxed/simple;
	bh=Z6qxfLB0hQ60ZJc/fcwtlCkLOpCr27Eeo1hSX068R4w=;
	h=From:Date:Message-ID:To:Cc:Subject:In-Reply-To:References; b=RtB9wo27al7gYXxX9moHOEVDhDvrm0AOjZlJ/T9VaTh08rSq1XG/1a9rb446McuATbL7v31mlKEloZdqJ5lLaG/2jnDo6hTOc9x60wByJoZfFQKY6YfAIaHFctGXNLZvn9dneTyYz9N9Cp8ZVdThugEQL5clxmj+5fpBPRmDOU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqQeKiy4; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84347ad88edso2763304b3a.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783237589; x=1783842389; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:message-id:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z6qxfLB0hQ60ZJc/fcwtlCkLOpCr27Eeo1hSX068R4w=;
        b=HqQeKiy4Pxhp3aeACNmAZuIYpiWUn33FNL9w7YaCNPluyXFKmmkvASDCx/rrZsl1x7
         7ba1uoeAFKYEJ+g6piaAD7JNK1Sc2w+NcHeZqe2+rgnBYdJ9lnHNwORH9Ua1CEht9bXG
         F451fvs+xnTKlZnCEA7F3fxd1EcFxQBblTzWsOgIwTnJL0ZsvZ3jn3XMm+XoHRn+jRji
         bJRiJx3jjaCiHG/qC3QVvheeepOZ+WX7FuIf+y9tfF+ce/Sms0PM9RKhPhPMd9hFwM8r
         mn1rmnayiX0VeGcUe/m+zJ8+srHN0/0nwbtjFKX3bZ+bANrvg3f75MxTvcpOfZ1KV3nA
         xKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783237589; x=1783842389;
        h=references:in-reply-to:subject:cc:to:message-id:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6qxfLB0hQ60ZJc/fcwtlCkLOpCr27Eeo1hSX068R4w=;
        b=ZhAsOxNQEQgyG9TCCkb4dioGMx4sEzUGr+qGJ8OnnJR6eBMB//f9IiQdD/+jQ6QXTQ
         O1aGz9iVvsp80Humot2+luVTX5LoY2/XxyqkhYOlJqhjzqdLSAigtosr5gkWplJnp+K7
         TgAqIkij5cPZ5fNa2G1djIlrdn+8vb3yUgOnLPms6rpWLWXIXwI0saLURNYjOxD5HYGT
         tIVM91bl6X7eP/UkY1cFjGlz8ziiVgHvAxQvVaGZb5Mv73nNA25e8UH3L6ZDjK8Nh1+U
         CqotxGw2XqV5HoY8zWUvMZxm4fr+XfoAls+s9tWiSPnD5PHXwwOCDMpQzaTfMNTYWoJU
         oMWA==
X-Forwarded-Encrypted: i=1; AHgh+Ro++JVGXsBS+4NNnaYZcs8un0pEXi13yyUa0P6+3V280h5IMk56hVW439SItZu2Pg1sfgNTr3HZhKon@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf+WAZrwUXOYxgU51u2wqN+41ZuSbE4RB7o8GWdNiJr4j6j5tC
	TSSH7hj4qLLUcAM0mJVYgvAY1gJRAi+/PnNx9GFjNSW+1JV7i5IPIT89
X-Gm-Gg: AfdE7cmCL9hPF3l8xxckFqn6qR3iAlCJXR5/WnFz0RCsjecQbodtHygjMacQDrrP7HH
	83OAtYr6Iq7MRnNGjJzQrnyE/Qb4G4PgRFcbKg2WccpIXEgVGh/Kcv+OCl1kNf0TMJfsP29oR/M
	ywHjVYyY3d7U7/IuUK+sN42wVlF3845hDI+c/ltqJ6zhR6kvkK8rHB3GgDBzXbrbvZ/EaJBbr89
	HScCk+RSkCb46/uZXgd8v0IE3xAXDcjX7JNSCqjgka0cKCtZBJlBfZYO2kl7WTrCxni0YgSOeRk
	B16gXbNkrdpIuWgoupfIk9SWzUzTJCqqu7+t/EisAKxKBiDxeV2GpPEUoTwlZpFZxptRVQs6Hd+
	5YrvBk8x7GPxoKvnuitYW+S2hZ5SpD4W1hshgmMwR3RrsRKOE7BC5fHroPmIBFFzYjLHcSltAsE
	e5VZOwX1Zhhl+WRhHfSxfZIiXYkSoulwEsIJg=
X-Received: by 2002:a05:6a00:13aa:b0:845:d650:b75f with SMTP id d2e1a72fcca58-847f6d5a1e8mr5176306b3a.8.1783237588849;
        Sun, 05 Jul 2026 00:46:28 -0700 (PDT)
Received: from localhost ([112.65.12.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4edb4sm2028187b3a.33.2026.07.05.00.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:46:28 -0700 (PDT)
From: haohlliang@gmail.com
Date: Sun, 05 Jul 2026 15:46:25 +0800
Message-ID: <26c872506bd87b969a84c91d0a7dea9f@gmail.com>
To: tglx@kernel.org
Cc: linusw@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: dwapb: Add robust error handling in interrupt handler
In-Reply-To: <875x2vlpjx.ffs@fw13>
References: <875x2vlpjx.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39454-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[haohlliang@gmail.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haohlliang@gmail.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90AE47093CF

Hi tglx,

Thank you for the thorough review. You're absolutely right that my
previous approach was limited to handling the symptom at the crash
site without investigating the root cause.

After your explanation, I realized the real problem is that the GPIO
controller does not properly initialize its interrupt state, and stale
interrupt configuration can persist across warm reboots when
peripherals remain powered.

I'll send a v4 that masks all interrupts at hardware initialization
time via the init_hw() callback, which addresses the root cause
rather than the symptom.

Thanks,
Liang

