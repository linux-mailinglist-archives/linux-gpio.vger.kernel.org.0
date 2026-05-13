Return-Path: <linux-gpio+bounces-36765-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEFJLwWjBGpAMQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36765-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:12:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D577536D3C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5422631562D1
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 15:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C305429800;
	Wed, 13 May 2026 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBvyn4Ba"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D71342501
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778685526; cv=none; b=nwUaDT00adylHG70DCvYYZmNZAJL1Kitk+b5P5lDaLJPb6THusOjzc/kfti6wtoJoQBwi/AlimNLmk505pXf+0niZ8S0Ltf7ycvKBrIBxYs3aeRt3iYAEvwQqjsaEz+9pu7RSmzw82UNfIQ7va19mNjSvCVCeJxxSmdx9oO1J7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778685526; c=relaxed/simple;
	bh=BQ8epdUabLkMJbp8b0yVQndIPSjNnzt8k9uMxeF89xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlVblTPjQECUegz1nHeHA8ZLD/PBdZYr5auyrvTLJBzF/NoAap3BgyhUzbfUaiK8nDq8P2sb7WzSjo7/uNHY7Av7yyCYZvL3jawu6Yf8yHP6ZqksBNg16jJfsHgvfxVrZLhcoR7D3QU11HzOUkE1t8kfAUAUDbhTuc5FxGHrd3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBvyn4Ba; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bc7b311e77so18488075ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 08:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778685525; x=1779290325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0OBfWy7Zm9LeL1Wlq8fvZKKPHn89DsUhdya+NxxenfM=;
        b=iBvyn4BaVt9tdrt64wtqRqP+hS3b3zI/gP/ZPGy9gCcKnCuMlNi3Mk0ApoQ7mqbdHl
         B7jMt9QeECkMMUlp3yCfET3wJ7qEwinbpJTVgUJU+nsOjgLECWLIIf1QEyp8YTgNypVf
         KmgeKx0GXSmeUchPpZRG2AVenryXF+gg8PCfY8Ec3a6hwncHHJ6kLonJO0Ybt50lRBHC
         ovINKZAx7IrunNUPhUQm2FoLMQifIqn89FRtlQV6KfdKNL3qNJMXZnsRduvSjyJHAtP4
         z1E0ECrSVE30iZKiVuq4REyVl+TneFw184NTYWPZrCsFpQGXa5vUM9SzlEe494eVp5dd
         NFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778685525; x=1779290325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OBfWy7Zm9LeL1Wlq8fvZKKPHn89DsUhdya+NxxenfM=;
        b=awp0L+M/U4hSFnhhPnt9GmAJxR0uqkQ6+58P9PDQDVYdYafMZeVGUpGmJgVpzhkQ/e
         u0WAx9KNeTxWeF8WUwJF9mHXm1FZZ6/3lvi/u4Ogm+CyBgq1oWAhm2GgjN5pQghMWOWo
         pGdOjWSo/EDdjaqbOANsBaj4FcPZGqJ09Gip8IFQO0vZmiGzxzcFg6MhJTL9MNYh60BQ
         EL0h+jwPvFXjLFv55UfHInNkZlXzzQxZLZBc5uULE7yP1YbZYCjECvJLB6+VwayaemG8
         AjmGNYoBQjxMyEU/rw9aPBiOwZpx+Ejdo6DfYLQyEMoBdrXRkeQdOZkXkonsQ5U0Zmy/
         wLHw==
X-Forwarded-Encrypted: i=1; AFNElJ8fiiIJzG1btlwlpImb7NmYKvWam6J60VI3RBMolbCHkC09kz3rckI8FtyGKObxuhC3l3yTeexQTWIr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm2RquWf/RpbmU5xFq9XPk9K/sv1joOq610+5YDtizBeSJHLjZ
	Zd6i+CVILu7Fnp/kL3NZwxJ1TRguW+MtM7lMPUVCesRsdss0SD0g116O
X-Gm-Gg: Acq92OFX+1wGkB0TQouR9Idd9ejcf1gTjZzQQIB3P1jBnIQ4AdmvgGUdMxcIlUveUSu
	QIt6ST+yxWulW40iHnk+h5scX3unrhAIj9fK+NnWk5n5TayDD1TJzNcb5rpemOWU5J9uH4QLArt
	VKfM0hzk9vC6MioQFudS95pAW6fV01g2Fel8Ar/WanDZTpkM1D64fKn13sYvtAFk8eWsVFhvhJ0
	zbDWaAElj87cWGHt4sN5cTfw41dChPyy7xnbGru7pOHA3U5vZCYrq6JL862VlO39ZFEhewKA/2V
	EYIH/6nNWT/RhvZkuXFa9gDHch5tR5AorCn/vdcozbpA9/OaAWUA7jMcztpVO841eMHW0FuSZ8g
	aB5XvRBqeBFIPBESKS6IHZIvqPvS/qS2zjtwOvgLm5AXSXzPFsPm9J2HR1mQpGyHVYwSZzNK9GK
	DUh1AxqD0hAJy0IKIExDoj8HMTrm/lGFMfXqlltzR1wJI=
X-Received: by 2002:a17:903:38c3:b0:2bc:977b:846d with SMTP id d9443c01a7336-2bd27118326mr39008335ad.5.1778685524609;
        Wed, 13 May 2026 08:18:44 -0700 (PDT)
Received: from rigel (106-68-217-148.tpgi.com.au. [106.68.217.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd3414b8b6sm25008595ad.30.2026.05.13.08.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:18:44 -0700 (PDT)
Date: Wed, 13 May 2026 23:18:37 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Vincent Fazio <vfazio@xes-inc.com>,
	Alexander Dahl <post@lespocky.de>, brgl@kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/2] tools: provide a shared library with high-level
 functions used by gpio-tools
Message-ID: <20260513151837.GA171694@rigel>
References: <20260513-tools-common-shared-lib-v1-0-58ac28a9f1d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-tools-common-shared-lib-v1-0-58ac28a9f1d5@oss.qualcomm.com>
X-Rspamd-Queue-Id: 1D577536D3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36765-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[warthog618@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:47:11PM +0200, Bartosz Golaszewski wrote:
> The API of libgpiod v2 is a bit more limited than that of v1. Notably:
> the whole category of high-level helpers as well as functions allowing
> to look up lines and chips by names/labels have been removed and replaced
> by low-level interfaces which require users to implement the look-up
> logic locally.
> 
> It's been requested several times that equivalents of these functions
> should be provided in some form. I don't want to expose more
> functionality in libgpiod core API than what the linux kernel uAPI
> provides. However, the gpio-tools already contain a shared library -
> tools-common - which implements the bulk of the desired functions in a
> new form.
> 
> This series splits out parts of tools-common into a new shared library:
> libgpiotools, and reuses it in tools-common while keeping the existing
> interface facing the gpio-tools in order to not have to adapt them to
> the new API.
> 
> Kent: I allowed myself to change the license of the factored out code to
> LGPL-v2.1-or-later to enable linking against libgpiotools in line with
> libgpiod and other shared libraries from this project. Your Ack would be
> appreciated.
> 

Makes sense and works for me.

Acked-by: Kent Gibson <warthog618@gmail.com>

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Bartosz Golaszewski (2):
>       tools: provide the libgpiotools shared library
>       tools: reuse libgpiotools
> 
>  docs/Doxyfile           |   1 +
>  docs/gpio_tools.rst     |  16 ++
>  docs/gpio_tools_lib.rst |  12 ++
>  meson.build             |   3 +
>  tools/gpiotools.c       | 437 ++++++++++++++++++++++++++++++++++++++++++++++++
>  tools/gpiotools.h       | 236 ++++++++++++++++++++++++++
>  tools/meson.build       |  28 +++-
>  tools/tools-common.c    | 316 ++++------------------------------
>  tools/tools-common.h    |  63 +------
>  9 files changed, 772 insertions(+), 340 deletions(-)
> ---
> base-commit: 5eed939e0d544afa311a4dd6dac90833d38d7d29
> change-id: 20260311-tools-common-shared-lib-97b58de050e2
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 

