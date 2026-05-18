Return-Path: <linux-gpio+bounces-37111-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGe5BjrgC2qzPwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37111-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 05:59:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 642935770DE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 05:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31B85302A6C5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 03:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672A42EAB6F;
	Tue, 19 May 2026 03:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ZBeiXxko"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB9A2C21D0;
	Tue, 19 May 2026 03:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163187; cv=none; b=ClusmCL7KZ32eqZaoVaHvSntTam0bm0+BmLLJaInUGhOYMudkrrbwFulrAZTXO4WqKMoeiYvDCU/bEVtoDdGlKCZnjNcbVxWFwFaG+yDkHZrey5hCjyY4cM8ZXIyE065ou3d9lLh8H48Bx99aSZzgwwJNP1lHaewqK+wem1lmVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163187; c=relaxed/simple;
	bh=+EKhPB0op5eF5whcf6k/JmiCiY0qlQfP4Onm0LgaO8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVlChDCmiUasr+wnzy4wsngimFsyyxGFKxdzjx/cQISaZE8RlyLjoFYMggiXelNd8mkCqfUOJkFbZem2wGDFFLDdLi71b/6oPfIftwhqjqaXcE62v0zaGIx/WJZS6xx4eN6pA7f2NAB9LLtpTtXXdohsoW6TwthHXNrrgsIO4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ZBeiXxko; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23CA9114613;
	Tue, 19 May 2026 05:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1779163177;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qmJs5US+/rH1nCX4Uj+ki/3ilrQeeUX3cODn7cVnq6I=;
	b=ZBeiXxkoe3MwzbN4QzNb8Eb9xugzS8GPyEK7WQWBkjDNZe2mfu0jkeUSZYAG+XKIVniVZV
	2aej5YRxjO7O24qdPNDM0HXlb+pTPg8wDOkxfN91/YkemZ9uUqamDG6zS7HK1CKHEUC/Wu
	LFv3pvOn6Ut/gZ6Uf6HUjOCK0hnZIgWv01XHXGsqYpTpnzBNaI8cbDhtsHErU1N5wICHjE
	Hw58TSARxvJG8DaikNCXHgc2K22FrVMl2VLmBDkgXWuazAAgAymA7uzq99tCdiqfDVmrs1
	eaYzvqZUujAHpGfNJkZ6uiUaBZUbXTKbmAvIMdhwkc+tdTbEZGiVdCUR9KrbJQ==
Message-ID: <3612f5f6-eeca-49e5-9662-72729bb48c9f@nabladev.com>
Date: Mon, 18 May 2026 21:20:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: make the voting mechanism adaptable
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Srinivas Kandagatla <srini@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37111-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nabladev.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:email,nabladev.com:mid,nabladev.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 642935770DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/13/26 11:13 AM, Bartosz Golaszewski wrote:
> The current voting mechanism in GPIO shared proxy assumes that "low" is
> always the default value and users can only vote for driving the GPIO
> "high" in which case it will remain high as long as there's at least one
> user voting.
> 
> This makes it impossible to use the automatic sharing management for
> certain use-cases such as the write-protect GPIOs of EEPROMs which are
> requested "high" and driven "low" to enable writing. In this case, if
> the WP GPIO is shared by multiple EEPROMs, and at least one of them
> wants to enable writing, the pin must be set to "low".
> 
> Modify the voting heuristic to assume the value set by the first user on
> request to be the "default" and subseqent calls to gpiod_set_value()
> will constitute votes for a change of the value to the opposite. In the
> wp-gpios case it will mean that the nvmem core requests the GPIO as
> "out-high" for all EEPROMs sharing the pin, and when one of them wants
> to write, the pin will be driven low, enabling it.

Shouldn't this polarity inversion be handled by DT GPIO_ACTIVE_* flag ?

> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Reported-by: Marek Vasut <marex@nabladev.com>
> Closes: https://lore.kernel.org/all/20260511163518.51104-1-marex@nabladev.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Hi Marek!
> 
> Please see if you can make your setup work with shared GPIOs with this
> patch. You need to enable CONFIG_HAVE_SHARED_GPIOS on your platform.

Why can this shared GPIO not be enabled generically for any GPIO 
controller ?

[...]

