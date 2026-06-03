Return-Path: <linux-gpio+bounces-37879-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RDxRGr/XH2qZqwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37879-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 09:29:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2663536D
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 09:29:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=a2cvCa94;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37879-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37879-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F7E8306C047
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 07:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1262E3F9F51;
	Wed,  3 Jun 2026 07:23:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9223FA5F9
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2026 07:23:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471420; cv=pass; b=Eu1yRCLaFPa3iDcAWi7NMGke7fXPwwc8+nMWO1p+fzXLAWYCqXSfIlNcMZc9g/qBFXPzjgi99ranHSo5fAbtadBaqlGxvSlYzNrD5IBfK5VjU5esMNvn8sR4fTjmJMs8Ck1PV6w/4XiaEdcxrA7UpuPU9A9WAc4Ie6K0oW5bCPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471420; c=relaxed/simple;
	bh=dn4PhtVBZbHd+OEFsc/QHJ+TIDhy5J3acmm7qbaZ+vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBeATy+YZYwuZ1h7UjJTqQYTBf8tY323vwS6EDafglfeXA2AKKmllrUJQZ+peObadTYeGFGl0T6SeE5sPdgUakqb8HO5Ajd3cXL8YgzH3DO8XuA7y9GnjcRJfn5SE3Ey20NPsoldQUg2UZeV95ud4iBtj5JZY0IbUQoBdSHC5es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2cvCa94; arc=pass smtp.client-ip=209.85.128.169
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7ea6923cc94so4285897b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2026 00:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780471418; cv=none;
        d=google.com; s=arc-20240605;
        b=kmXWh/qptnf0sy+i58imwCtbHjeoBRocMQP2paPb9AEmm5rV1L6uobom0ktQi6G66U
         Uc+n/BAmBTJFXSmJ3jyV4YSkK2WtDnXV2NdQQtdCj5/O55FsEuc0brdLsGDMmsdXHyYs
         vXbE6IyRMk7y9/hS+4T7Sk1OQqtn0cIyHECol4ssPG6/8gNVFrGR5ZhuziuLPDa7qCdy
         2LdjPle9Wc+aW3035KeKorbStWp/TulFS7nWS1gLVTL4pHabkmcz78nP06HBm070LC3T
         xr8YdcMQk9ANKydKjtGuo22ZfJCTuKB4ZF5/aRvr4OYTgiijoWDVy//4E9EFKwR8nr6y
         AG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T4GVVEekQoNIGbLibhWR4xkJpEpqVIIm8XMGr+5PR0w=;
        fh=E8+4RFNlTxzeWlMK6BD3mDJi6IlrmqSVkJywLEVpJ+I=;
        b=c9vyfT6B+6YtLSOQxi0Wz3BxCgDaeqp/MqMejVCbbY+r6PDJNEnX+PJ9fvjg4gAcSK
         9yDY8GVm+InsXbPy2MJm++vyp7VfSjaxDS0dHNLWOjGw4x3F8rQ9pZBDR2/KAcPTqxFV
         r86Kog3fiZ+m8HUxDNWmYhG5PHnA8qi/e099L941KyHe9mwAX03HJeW5o0l59+rAEp62
         TV1+VMUKM0sSGUtceMDEfTmPWAjk9ybbZ8o0xa+z+HwdRn93aWJGFzlcaypVrZ0MkaSE
         rJDceTNCbNV7StVytq/cVnZBmrlLIo+B6OOEUNzvXIW0O8aTTwD5BmCfdWWf54sTeR29
         SZvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780471418; x=1781076218; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T4GVVEekQoNIGbLibhWR4xkJpEpqVIIm8XMGr+5PR0w=;
        b=a2cvCa94x0sjL9u9x/YUXNQbw4p1hltXSw3xAuOXvfh43/gkXFXFFqCDoqWFg2gQOb
         uUKqh2JENxs6738rX67fLHawY6st22k5hfhuVviWf6uGlOeZ1iW4vzk8pYf+gB+h9Pzt
         n4LfJGYEeCylpUWAr8OdsJlkAjaQm+Id9MPo1O80Lj2kkGjhnXRt1vPriQUu0VSoGOPo
         +OOJ/MDLt8K+YTyLftMrxfglfKhC6i5BQgr6/+hwNUKAa41zzHoB+jNm+grAHYd4xQjV
         nmHsAxRVNbBGOUoiuC4yR+zEnFpTKH2jQl7xwmK+oHYlj7cFRSXnJX7MesgYMkQMJqYP
         vb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780471418; x=1781076218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4GVVEekQoNIGbLibhWR4xkJpEpqVIIm8XMGr+5PR0w=;
        b=f7mR2rmfj/N2U0vCdvG5Y6tyDj0xcCb/t63jFZ/scG/cpsh8DGlNAPTcKUQaCTF4yQ
         VJuB7BEj0aWcHNez904nk1ypg7QU64JVy3tTiS53IcNiFgnfJpigdyG5AKUSavFIbT53
         YFSgpXW8aKwwBM2jWW5+dT8lRMAmMSgVyDUz4ZMKWhH/cTqFr3W95B+BKyiu9pnmuHgu
         apfNC7lOxB7an/We6NmZA9PBcTH7e1AoY+UyzBbBUPXGq3qFywrYctTyHw+YUVhY54Ua
         B32STSRsXKx5qR+XFu3eOWtFtKtRYjrst+g+gT0UdmX6YuQHLW2TrJ5T1GWAfjMVlSh5
         XTgw==
X-Forwarded-Encrypted: i=1; AFNElJ/LoeIRJxHMDUmXPj45gCKe6NwGgeuP7VOMq5n5HGc6flJyoAmUXmajlnAt71qh9OHYTw2qluPbZQv3@vger.kernel.org
X-Gm-Message-State: AOJu0YwyhmMJTy41CWQagVArAjJxexATWKD3HZd8kkTR0fpSsPcUptVF
	uPNJcfdwww3Wy2U5uGhGkthB0kHKBlxIz0ipDge0S20wGVnXgzpSiJLrp4jSgRfU5X081RRA/c0
	fKNb91o7UacJ0mPdN8VZFQ820lKBXS4w=
X-Gm-Gg: Acq92OHPxt44hAZzxfYs5HfLsTdgeXI5tRL+WoU6dilPcZTntgI2xflsE0iasmX2r9c
	kAr+pJpN4MESISyua71qLh8u2+GKvv5zwTG1m18kdLCs1mG4sD2m2fg0gYHaCt6tc92hX0WrUGd
	r68l0DqXf+sNkbSCjItfgnmUVAmmpopQj2ZVcxMjmk8FgnE0UTkEWwDb+toh3E5xh4Fa9q89J0R
	dIJuKSJBv9cspyCgNE2BsfLvRm/z1R8WAKWqzmYEg1Q2skwzIcXZ5Vy1QAlBuyG98H6KCsCD0rO
	r88TQcw1x3qy8vHCCRENGA1e0ehlPYb891N6NGbsJJmzjdUAdjzAhmB4Zid/EvVoZoKhQh2UAQx
	zW+yNyhUsZvlrpCtZ2exdllSRNV5xcFWL17r7TkGrlLuy5Et0YNyoRtyPJ3c51JEbVC3K5LwPPP
	4D1fPe
X-Received: by 2002:a05:690c:64c9:b0:7cf:af41:50b0 with SMTP id
 00721157ae682-7ea4a6439e0mr19278747b3.36.1780471417863; Wed, 03 Jun 2026
 00:23:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com> <20260602185339.GA404948@ax162>
 <CANTFpSX0Ehpno7b=xrnqzmENn=sfKj1UcyRzXvMyy4Rcyr7NhA@mail.gmail.com>
 <ah9frnHDuIjF_1Su@ashevche-desk.local> <CANTFpSXAXP16TUK7n+pTBgZOYRqCyF4kqkf9X-TK9O_rKWY1VQ@mail.gmail.com>
In-Reply-To: <CANTFpSXAXP16TUK7n+pTBgZOYRqCyF4kqkf9X-TK9O_rKWY1VQ@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Wed, 3 Jun 2026 12:53:26 +0530
X-Gm-Features: AVHnY4KXPpnT8RNq2l5Bx5vXvOHXRel-hX108osiwi8UFQMXKpH1RyRslwThOJ8
Message-ID: <CANTFpSVCjK_JDB-1GhzomnK+c3PqeHGGMPA19-tDRX6_HK=vig@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, mario.limonciello@amd.com, 
	brgl@bgdev.pl, basavaraj.natikar@amd.com, linusw@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:nathan@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:superm1@kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37879-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FD2663536D

On Wed, Jun 03, 2026 at 04:25, Andy Shevchenko wrote:
> Useless data type. You can use list_head directly as a context.
> ...
> Again, a lot of duplication with gpiolib-acpi-core.c. Please, find a
> way how to reuse the code.

1. Remove gpio_dep_ctx, pass struct list_head * directly as void *data
2. const char *path in gpio_controller_ref
3. Use acpi_gpio_get_irq_resource() instead of open-coding the type
   checks -- this removes the duplication with gpiolib-acpi-core.c and
   also requires changing #ifdef CONFIG_ACPI to
   #if defined(CONFIG_ACPI) && defined(CONFIG_GPIOLIB)
4. Add NULL check for resource_source.string_ptr
5. Use return value of acpi_dev_get_resources() in check_child_gpioint()
   instead of ctx->ret
6. Ensure cleanup of partially filled list on all error paths
7. Remove Reported-by and Closes tags (carried over from a previous patch)
8. Fixes: tag on one line
9. {} instead of { .ret = 0 } for zero initialisation
10. Split adev declaration and assignment
11. Remove unneeded blank line after acpi_dev_put()
12. For "Redundant parentheses" on scoped_guard -- I believe you mean
    the bool bound pattern is unnecessary and we should return/goto
    directly from inside the guard instead?

Please correct me if I've misunderstood any point.

Thanks,
Hardik

