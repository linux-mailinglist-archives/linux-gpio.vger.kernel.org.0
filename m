Return-Path: <linux-gpio+bounces-38706-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V50XCY4ENWpYmAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38706-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 10:57:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7092E6A4CCC
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 10:57:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cvyTEC95;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38706-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38706-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F2403031AF3
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 08:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C662635F5F3;
	Fri, 19 Jun 2026 08:57:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EE935AC09
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 08:57:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781859452; cv=none; b=r4g0AAZOJK1vjxR0t9YR0q30Fw4nWxGL99yIu2//xSXi0tev6PF2u2sa0/pYPrPAKZSoiLoBpvcJn1FtrPozivL8qQixNWaecucrpUJLcCSLKwm5pPlpMFJ832rkw0I4iox3WSrcMDvzuTZL0/Y5SyqEn8sJSDkf6cIEnA58oaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781859452; c=relaxed/simple;
	bh=sYicxBoQj3xT1wcQConVHkUzZveQQiDCVQc9+g5MEuU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWANOrPcOkL0/ZBUFJuBWPN7z0gsPHoOfjsNflFRXuan1dONfzBkhVqrGm0OlTI5HWW0qtApgLmUaXQpg+QhbQ5lH9VvCuyVr4czT6xFrH8jb/2mZbqILS0f5qg9OPeorWyJgQbDFC+wRxeA+e+a1Rlf/L0jZNkVA6ZyU5RR97Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvyTEC95; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF8C1F00A3F
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781859450;
	bh=sYicxBoQj3xT1wcQConVHkUzZveQQiDCVQc9+g5MEuU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cvyTEC95kaqZJXZSudrlLrIP4TxnZ+3wh/idNVQ0MDoE2BiS2oMyh/ymAEWsGWc7K
	 O5P2nE4U0wqJ+edAMW8o3QDGVlTC7dxGEho3zYrEF7U9SbY0umvZBt1abkbxe+yojr
	 2hN9s7CINMPaVfrr+5/Jlk4oHbNloIQHJc9sB/938nOHwIPYf/A22R5LzIKRL5zaUo
	 rKiZ4hKePqo0fmkxzx3E3s59m4uxvU/tw0rSYJXfpXEOl4J9ODx2F/TBEMRgKIhoPL
	 Lfp3zif2T1gcEcMT5es+QgGZdxgxISF1QbESMA3CtdGc0E9BhSS3G0eBSECqUYx13l
	 kN5cCPYOW7HUw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ad53c8d4dfso1436583e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 01:57:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+FKTzGCw0NfmfvUddkk+fmYfowH5go/JvNNbWPU6NZztY6r823x1vZtSvXdyV4+qBhETIz53gj0UQN@vger.kernel.org
X-Gm-Message-State: AOJu0YwEBNSVw0l3EnLGMJcIHnAUdntf/XP7XAsPPEJg5QU94Atwti5V
	x64uhBo3msfEDo20h7D3DPf3wbVf/2uHbyNT7fn4+Wx7dVwlFCUpYxBOLG13bH0x/bAS/4xwz/V
	PqqZ4DAjBBLBZU7K5T+ZkIj36IvVlbMGurtbBI8YLXw==
X-Received: by 2002:ac2:5047:0:b0:5aa:65a3:468c with SMTP id
 2adb3069b0e04-5ad571fb69bmr506879e87.7.1781859449099; Fri, 19 Jun 2026
 01:57:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 03:57:27 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 03:57:27 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260619085036.85242-1-architmore303@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619085036.85242-1-architmore303@gmail.com>
Date: Fri, 19 Jun 2026 03:57:27 -0500
X-Gmail-Original-Message-ID: <CAMRc=Me0j-A+u2EoeTJCsQJBvNaogqUMkOoG_0EL58qs9pst9w@mail.gmail.com>
X-Gm-Features: AVVi8CdZTvNhgQSvsAyo7yP7R_40-vdrbBGt7oHLXCVNfqee0Mjm_w6CkOWT4og
Message-ID: <CAMRc=Me0j-A+u2EoeTJCsQJBvNaogqUMkOoG_0EL58qs9pst9w@mail.gmail.com>
Subject: Re: [PATCH] gpio: make gpio_chip_guard accept const gpio_desc
To: Archit More <architmore303@gmail.com>
Cc: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:architmore303@gmail.com,m:linux-kernel@vger.kernel.org,m:linus.walleij@linaro.org,m:brgl@bgdev.pl,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38706-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7092E6A4CCC

On Fri, 19 Jun 2026 10:50:36 +0200, Archit More <architmore303@gmail.com> said:
> Make gpio_chip_guard accept a const struct gpio_desc pointer,
> allowing gpiod_get_raw_value_commit() and gpiod_to_irq() to use
> the helper instead of open-coding SRCU-protected chip lookups.
>
> This removes duplicated code and eliminates the FIXME comments
> about gpio_chip_guard being unusable with const descriptors.
>
> Signed-off-by: Archit More <architmore303@gmail.com>
> ---

This was already done in commit aa7e8b7ef031 ("gpio: core: fix const-correctness
of gpio_chip_guard"). Please always base your work on top of current linux-next.

Bart

