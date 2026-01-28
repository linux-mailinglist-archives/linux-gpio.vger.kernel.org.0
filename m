Return-Path: <linux-gpio+bounces-31204-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C9pEPPPeWnezgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31204-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:59:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B09E890
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3ECCA3007B85
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277E133B6E8;
	Wed, 28 Jan 2026 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avByFv9h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD79933ADA7
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590765; cv=none; b=cmSljyJLmkMs4TyXxRRtDEEMz14+BiEKqmF36s2MCjCZtzOMdZLgF0YcgdP9516wACnMWy0mhzkoQOLqX/7lguqdBSQdcioFG2PONrl0n2w8DEFojCCbOUiAkACGil3ASrQtV47VVDNtBAh4Qz1l2TNkJGtXxfkN2gjGAoIv+Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590765; c=relaxed/simple;
	bh=wtvDd4MG/vh5GJn296e4lYBpyntlnwuO2E7usxFRFEg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhUHUexsCRObY3qZPjr9sO7NXfHqHCC51XGXtLbZisRU1iafXm7BVk4sruPLNcjGDj5TqHgWPnJZYQEJyGb9kNIK5NYgnWVUVbnb6Nne1ju8CsKZl2iaGV6+Up5KgEFsz/hHLt72K7lo9Zs4jV1sg1ezir7uUEsdBmg8PrTHb04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avByFv9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B85C2BCB1
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590765;
	bh=wtvDd4MG/vh5GJn296e4lYBpyntlnwuO2E7usxFRFEg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=avByFv9h76VnvwxsQUhTkFn1M4gxKh/ZJLDu+7ZjlBeULoa7R/fGLkdfTR/4mjP+d
	 gCDd5ACf5HbebyTD3edQVTjRfqzQyJaXhJlKHcA8U3TyZVOypSMEXU7J6Y/kBmHal9
	 55q6KM1TGbQRsQUiQAgTMGvM9i49fvW2R1MyKZFj228QPYALmRc9qL5W8LzidAKKgl
	 cTb80S9iOdJ2vksskUeJrfJzGBKNP3gljf6s0DJ72dKrKsxihGjEKZ+gLaVHCDGeQP
	 L1jA6Rv4SK+zINXGD15pYaXZmHsXbZP2fT5Xx02McoZyShnXnYckWbn/3uXMPjXEsd
	 lI97tNJqZ+UNQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b77f2e43aso810450e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 00:59:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbAZq/Ol4iybRERaUtpwFUnQpJLnMWDxWx7ihLC3Km9jW053a75EUM/WLK+494c7yuxUp3q+v9bUYm@vger.kernel.org
X-Gm-Message-State: AOJu0YwrzMzlZ/4C69u64i5QNe+x/bsD7VV82CbO0MoUlPwwFua2MJVi
	Fl6H9BZyCm5LOwOAbJKu2S0Y4ckS4AAevTUG3VI7dyWUezUbgRty/Us/OmoYyXQZsr+8RE6cstu
	4s4VuHWWDbZmTAZg4lU/UiUQRFBsYZozZjXSr0cDezA==
X-Received: by 2002:a05:6512:3f1c:b0:59d:e304:e2b8 with SMTP id
 2adb3069b0e04-59e04131834mr1970520e87.19.1769590764296; Wed, 28 Jan 2026
 00:59:24 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 03:59:23 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 03:59:23 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260127103325.3925173-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com> <20260127103325.3925173-3-andriy.shevchenko@linux.intel.com>
Date: Wed, 28 Jan 2026 03:59:23 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mdub_CPeSCZPBNFQ0DMsnA6M2dcqvak9Ti6zU2aGsE-aA@mail.gmail.com>
X-Gm-Features: AZwV_Qipf9Bp4DggIomqpSFspQZHJWvAFfy5uZW0t7mARTIvjyslg0Y9hWMsW5s
Message-ID: <CAMRc=Mdub_CPeSCZPBNFQ0DMsnA6M2dcqvak9Ti6zU2aGsE-aA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] pinctrl: core: Simplify devm_pinctrl_*()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Philipp Stanner <phasta@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31204-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,qualcomm.com:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB9B09E890
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 11:32:07 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> Use devm_add_action_or_reset() instead of devres_alloc() and
> devres_add(), which works the same. This will simplify the
> code. There is no functional changes.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Makes sense, we don't have a custom struct here.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

