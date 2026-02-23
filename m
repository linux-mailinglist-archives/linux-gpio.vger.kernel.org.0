Return-Path: <linux-gpio+bounces-32039-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ5BA2VgnGnpFQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32039-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 15:12:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62396177D77
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 15:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDB6E3053E24
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 14:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD1C281503;
	Mon, 23 Feb 2026 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahIzqiN0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5506279DAF;
	Mon, 23 Feb 2026 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771855880; cv=none; b=fUqVhLOj0CwHTN7NUA8iwE7iqrcIn7Sm5z4L95rnLDg6qR662SP2fgBWPSkc512PuRJpKy5uP+IPC01tvelrRrCWcNEhCojxjvii3T3ik+D023OHC3u7KLj40ofH23jIn6no6XWMqYRTPJEhgBFkiywjQVygVvdFRKb7RaNxVIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771855880; c=relaxed/simple;
	bh=qYU1s60hp1xsrvrQIDyri9DXX8TGN3txtmiM1KgvIZc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B7iwURMhEv9Olv6pb6iuLJ86LMACvOvzxnmga2KhJ7e1i7CZEO5jT36BJsZfi/YJeHdqwkdx5RjomzNi+lO8jQIH5lOM2Z6GYbQ+w0Pg6Hdm7TFj2iMVQafxM9Lp/0dWYBxhDj1CWxxCAvbw7Ap4JAH18qhSEi29G5fEoIbrkPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahIzqiN0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771855878; x=1803391878;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qYU1s60hp1xsrvrQIDyri9DXX8TGN3txtmiM1KgvIZc=;
  b=ahIzqiN03uzyWx/Z/2hNgmKq2ph9w2Uryvu+G4ID3YQz9YfkKX1Uppza
   5XBV42f4G+FUCZYpXQ3v7ikw9Xd7T5zJgkexU8UE+t2f+cvx28y0+DA2l
   jFiqycrQY639hMWpwM8IdJ/tHGxaX3obK+RiiMije4SL/N39YC1HP6kNj
   wyphvxZS0aNqOSeMkflUOyrAs6wGIy3P5LbYT7m6Uqp95B0/mtS4dfTAH
   Ki1Yhil6ebTnol7Mz+eCN8rnjcL3H6Nhh+O878lwqPAXeHWFE2z4UrAGs
   D2WDaI7VGvu6mwqzRwk7qdCwU57wvOr7Ms9Xn2bTyCfZKDnJ/TXRXzj5d
   g==;
X-CSE-ConnectionGUID: HnIKFQatSGi4E6ss6xGB5g==
X-CSE-MsgGUID: BtAQSrlfQ+y7UAz7djEomw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76462094"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="76462094"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:11:17 -0800
X-CSE-ConnectionGUID: f3o+FMfdR7uEYwSgKQCwkw==
X-CSE-MsgGUID: xWXF4gOfRmmeqBHa/dCp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="214801782"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:11:14 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Feb 2026 16:11:10 +0200 (EET)
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
    Peter Korsgaard <peter.korsgaard@barco.com>, 
    Hans de Goede <hansg@kernel.org>, Linus Walleij <linusw@kernel.org>, 
    Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: normalize return value of
 gpio_get
In-Reply-To: <aZYn_xDxBXn_Ijem@google.com>
Message-ID: <5d561d59-1691-fcd0-868c-fc44db1dac92@linux.intel.com>
References: <aZYn_xDxBXn_Ijem@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32039-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 62396177D77
X-Rspamd-Action: no action

On Wed, 18 Feb 2026, Dmitry Torokhov wrote:

> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by p50_gpio_get() is normalized
> to the [0, 1] range.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/barco-p50-gpio.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
> index 6f13e81f98fb..360ffd8505d6 100644
> --- a/drivers/platform/x86/barco-p50-gpio.c
> +++ b/drivers/platform/x86/barco-p50-gpio.c
> @@ -275,8 +275,11 @@ static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
>  	mutex_lock(&p50->lock);
>  
>  	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
> -	if (ret == 0)
> +	if (ret == 0) {
>  		ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
> +		if (ret >= 0)
> +			ret = !!ret;
> +	}
>  
>  	mutex_unlock(&p50->lock);

A simpler flow would be preferrable over all that nesting. Is this 
logically correct:

	guard(mutex)(p50->lock);
	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
	if (ret < 0)
		return ret;

	ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
	if (ret < 0)
		return ret;

	return !!ret;

?

-- 
 i.


