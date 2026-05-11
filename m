Return-Path: <linux-gpio+bounces-36574-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCAcLRXXAWryjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36574-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:18:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF2050EB9C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D7AF3029944
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AFB3D5244;
	Mon, 11 May 2026 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ab9Hpr10"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5F8372EF0
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505035; cv=none; b=HvhkgR+gYrNIwaJ4xIFULJxuWaebTwho4J3YyCskziUklE+jLtLSSMV5MDNreSsgArbJZe1DzVOigkC1ijxNtVfq5SqvUO7k4GCj7OZYSeEERQ+VV8mfrQUjdjuM1NieE02O4sGeMLcgUFCAq/X14KzA0MLzcX7tlqN6yHithu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505035; c=relaxed/simple;
	bh=RJmAU8Xm5a8eeec1e82BQsegJUkIaJkwUrllB2D/02Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICJj6XXiYOCGz7WczpeYNUjRRBr1Po2Y4Nb/iSphDwtGngVmE41K4mXx3w5/ANsY58ij8psABb+UtoVGI7ZL4PwDD4m0PaUAzQhSwSy75IzG/wjX6A5sAshScYMsvEI+nH3paP5D4cC+x8pEurEhTtnxg9q5G9qV+0IWWWWUU5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ab9Hpr10; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBECC2BCFB
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778505035;
	bh=RJmAU8Xm5a8eeec1e82BQsegJUkIaJkwUrllB2D/02Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Ab9Hpr103rovvA8//n/aB6bbKLkL9ZvZz03H7gaJEtxiCDpRs0nmuJSCCviPhBxLY
	 MQgSmb0+Vn21Sg7a5oejZqWsP7GUoA41BzxXKcl2H/6hKTqW2UjQysxm0nBnDth+bR
	 zsVMtheLXi0X57Ds1NXGSwuOt8YLwhncQ/FVilnaffXjRAcgXIzWs4ZykT1WxNl+VN
	 RWahbpwc0VR40PoHkyv0u8i4yt0KKJ6NIqefZn8BTgIhhgciVc5xfPgaBrgfSm509a
	 IrolISyKdRGDg/v7KDRRrSsg38PNt688ZH7EzWB5z6yuS5YuDYSKpn8/GcgJ4Dd/s1
	 xaK+IcJiiEu4w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso40806881fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 06:10:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+po/pGRarY6kbtQ664cOP8GQBTRq0oZeVg0pg5u+DJSo6Dg3MJnbsUSbC0XX7IoNSARXfrS5kK+dCi@vger.kernel.org
X-Gm-Message-State: AOJu0YwPCdXrx0qp8QyW3bNnr5i7vhrIkcrMdmOCiK6KwLR0S4iNS/eF
	wcBUUArefseO9hgac8VGjanKnsZBlfKnj2grdHkiiO5rHlyFfazWlFl9G2NOnfej+bSrAS0qZ4J
	UswNDa0OXvZ1XExNxQuXXvJjDSjzWLUUwyL//r/f6ww==
X-Received: by 2002:a2e:3a05:0:b0:38e:2aa7:3984 with SMTP id
 38308e7fff4ca-393c4126752mr63885091fa.11.1778505033770; Mon, 11 May 2026
 06:10:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:10:32 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:10:32 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260508105448.31799-3-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508105448.31799-1-tzungbi@kernel.org> <20260508105448.31799-3-tzungbi@kernel.org>
Date: Mon, 11 May 2026 06:10:32 -0700
X-Gmail-Original-Message-ID: <CAMRc=McPez6Ver5NgrDPnM9YDb7cPonWE7BBsS_5AnY9tGf3xQ@mail.gmail.com>
X-Gm-Features: AVHnY4IhmzoJd3wLNYsrAs66xOTMErOgy7HuqiZ7uCrCAjxL0Y1y70L8YCPCxdU
Message-ID: <CAMRc=McPez6Ver5NgrDPnM9YDb7cPonWE7BBsS_5AnY9tGf3xQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/9] revocable: Add KUnit test cases
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: ABF2050EB9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36574-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, 8 May 2026 12:54:41 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> Add KUnit test cases for the revocable API.
>
> The test cases cover the following scenarios:
>
> - Basic: Verifies that a consumer can successfully access the resource.
> - Revocation: Verifies that after the provider revokes the resource,
>   the consumer correctly receives a NULL pointer on a subsequent access.
> - Try Access Macro: Same as "Revocation" but uses the macro level
>   helpers.
> - Concurrent Access: Verifies multiple threads can access the resource.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

...

> +
> +config REVOCABLE_KUNIT_TEST
> +	tristate "KUnit tests for revocable" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index bdf854694e39..5fd19abbc83e 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -35,3 +35,6 @@ ccflags-$(CONFIG_DEBUG_DRIVER) := -DDEBUG
>  # define_trace.h needs to know how to find our header
>  CFLAGS_trace.o		:= -I$(src)
>  obj-$(CONFIG_TRACING)	+= trace.o
> +
> +# KUnit test cases
> +obj-$(CONFIG_REVOCABLE_KUNIT_TEST)	+= revocable_test.o
> diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c

Please move this under drivers/base/tests/ where the rest of kunit modules
live and name it revocable-test.c for consistency with the existing ones.

> new file mode 100644
> index 000000000000..bb776a747ff7
> --- /dev/null
> +++ b/drivers/base/revocable_test.c
> @@ -0,0 +1,405 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026 Google LLC
> + *
> + * KUnit tests for the revocable API.
> + *
> + * The test cases cover the following scenarios:
> + *
> + * - Basic: Verifies that a consumer can successfully access the resource.
> + *
> + * - Revocation: Verifies that after the provider revokes the resource,
> + *   the consumer correctly receives a NULL pointer on a subsequent access.
> + *
> + * - Try Access Macro: Same as "Revocation" but uses the macro level
> + *   helpers.
> + *
> + * - Concurrent Access: Verifies multiple threads can access the resource.
> + */
> +
> +#include <kunit/test.h>

Add a newline here as do other kunit modules.

> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/kthread.h>
> +#include <linux/refcount.h>
> +#include <linux/revocable.h>
> +

Otherwise looks good, with the above:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks,
Bartosz

