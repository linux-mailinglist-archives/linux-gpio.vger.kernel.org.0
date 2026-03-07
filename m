Return-Path: <linux-gpio+bounces-32715-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMouB4kPrGlIjgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32715-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 12:44:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B8722B889
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 12:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65BBD30338A2
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 11:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE609358395;
	Sat,  7 Mar 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOLoUDpA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E735838C;
	Sat,  7 Mar 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883741; cv=none; b=eA3iv2bqJg7honYBhoGwZlcXM/ewzQDLZQ9wjJkUTUnJiBXh+ImLXGPC1YEp0UEQei7T7evQLeJTb4w3SESkqIoomLc2Inn6GTmMMTmJ5vnwd5W6jBOyUxNSAlrTtzli68cYV0W20gvv1JB8WL1pez6ExDFFTwzfi4NieJUSruU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883741; c=relaxed/simple;
	bh=qNsxtdfBK2pWpemA/Ju6s8rlhRJmP6/DDZxdnQLFxCY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PexzJCDM4WqRy8HJWtTEr4UZhPgegdH93lWI78GDnvoVhHtNu+vtEt5m1HPXslTWli6X6fwl9vl9FinRUUecvo+vsh4f71kdpzDa3iXoUTkp0Uj5B8YutdDj99LayPDTgnO7zqf4RiscX6HnKHXvWPvUib3Wl6ByRxyr6eVUjow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOLoUDpA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BA6C2BC86;
	Sat,  7 Mar 2026 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772883741;
	bh=qNsxtdfBK2pWpemA/Ju6s8rlhRJmP6/DDZxdnQLFxCY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rOLoUDpAZk1tZI/xXdWoKpaBhatnsufSMRr23TeuwwCqAqZj66GNZ+0/JLxOgCqiT
	 HDFAtHA3swPnEE7yD4fPPDpeejPSQjITr+0hEVkl2+4SdQb0JEnBiC1vBmSyd04y9v
	 20RJ5CmVTQS4ldsmiVXExUs8m1Oi4PzrlQunOQQMqMSpDOKJkE5ojrCMyAZgpzpl1i
	 o2o72lU3Se9EoIvA7h2w2TjG+I16u9kyTlBE8Qc5th7MIHAgsWuL4ilmdUKzmAgC3X
	 GDeGSQ8CgRgo+dE90hm5AByw+UAJ5t9FxZjU0fyhjGIfP34tCigJFHVttJqgt7E406
	 Fb5uv6GNVvg8g==
Date: Sat, 7 Mar 2026 11:42:11 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] ti-ads7950: fix gpio handling and facelift
Message-ID: <20260307114211.771bc710@jic23-huawei>
In-Reply-To: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A1B8722B889
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32715-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, 05 Mar 2026 11:21:51 -0800
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> The original reason for this series is to make sure ti_ads7950_get()
> returns result in range [0, 1] or a negative error code to comply with
> gpiolib requirement.
> 
> During review David noticed the fact that the function also clobbers
> gpio state. Fixing that lead to adding cleanups using guard() and devm.
> 
Applied patches 1 and 2 to the fixes-togreg branch of iio.git and marked
them for stable.

The rest will need to wait for those to be upstream.  Given I have the
memory of a goldfish and there will it seems be a v4, please mention
that in the cover letter.

Thanks,

Jonathan

> v3:
> 
> - Added "Fixes" tags
> - Picked up reviewed-by tags for #1 and #2
> - Dropped the conversion to "error" variables
> - Avoid using scoped_guard (per David)
> - directly return results of function calls at the end of function (David)
> - Split spi_sync() error handling into a new patxch (Andy)
> - Switch to using devm_regulator_get_enable_read_voltage() (David)
> 
> v2:
> 
> - style fixes in #1 (per David)
> - fix to not clobber state (#2, new)
> - #3 and #4 (new)
> 
> ---
> Dmitry Torokhov (6):
>       iio: adc: ti-ads7950: normalize return value of gpio_get
>       iio: adc: ti-ads7950: do not clobber gpio state in ti_ads7950_get()
>       iio: adc: ti-ads7950: switch to using guard() notation
>       iio: adc: ti-ads7950: simplify check for spi_setup() failures
>       iio: adc: ti-ads7950: switch to using devm_regulator_get_enable_read_voltage()
>       iio: adc: ti-ads7950: complete conversion to using managed resources
> 
>  drivers/iio/adc/ti-ads7950.c | 188 ++++++++++++++-----------------------------
>  1 file changed, 59 insertions(+), 129 deletions(-)
> ---
> base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
> change-id: 20260220-ti-ads7950-facelift-ad8b5390a654
> 
> Thanks.
> 


