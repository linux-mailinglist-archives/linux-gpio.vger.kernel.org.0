Return-Path: <linux-gpio+bounces-31802-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 10SkDmH/lWlHYAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31802-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 19:05:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B3B158814
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 19:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D77E13014660
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 18:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6112B330B04;
	Wed, 18 Feb 2026 18:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ey6tV7lg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61C82638BA
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771437918; cv=none; b=SbcVX8xPWVNrbkW5X8LsNySg2QzRfjtmQgW2JlBml2EdzrfQ0hcBy6QwJLnXY0fUGICj1FDZWT+/WC8uHVWzyFqQbOyPEbYDNTtX99EWvxszjWnWpPksUZGud7VloIJbwk+E9AvExAyCeoI4ygtBb1MK3LPrbTc3vUeUeU/RIv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771437918; c=relaxed/simple;
	bh=56jXtMLUDKd8sv9xvPYj+y2FcY6Uzz0bJzYJ6dMNuSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qBxByg+Co7zwj6BrqGQiVfifQv0ZkB/k9D4RZA46q5f2FCLlZAhM7VjmYEYUhz5axXR5TBRdgWJ/ECXwY5VGWuSIxDELfiOxxny9psEn5mu8UnzE/gJ57GqedYAYNCgB603i1jn0d0DpW1HmJWtajAQMSfvHYHh83tSG8IWA5Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ey6tV7lg; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-46391e91e16so41147b6e.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 10:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771437914; x=1772042714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAkPY4XYtB58h+yIk4xO7Fk2pos/YipiQk239weGiGk=;
        b=Ey6tV7lg3CZPryQ4UPx5uXScr2J+VJGYGs+0NnQE7DvOzYie1PE93dr2DQU0xLSYUx
         /ZQGR6kczetlJEUzspw0UB7IYBBVnYb806Ui2AD+/hFmOjGExO5FbRpJGrfUAfZ255AZ
         OA0Pc4HmbdzPyfydFI0G/JlliL8bOf2HkHPwLuXC2Juo+9g5yMCCd0DfBBp4nr917P5z
         vvVug7xHpS/QtbcLSeLstlVUb8EgppystkLklPrIqfH/ovtBkRs/KhzVIeVv/skEwX59
         mI8A5jyDd1m6N07DwIszvuTunmz8nC+gg62FpnNulCvqaOTh5QZjmX54n5r/UNRoTzh6
         o/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771437914; x=1772042714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAkPY4XYtB58h+yIk4xO7Fk2pos/YipiQk239weGiGk=;
        b=nROT2sljjbiHBUPDfDAbx0LVZU+8tfHe1YLOJGhZp8ZS3Qla1QYW+Fl4A10THd5wJv
         sv31nImsEXgiFT0mp2DsGAsSyyUJAiVVyRqciuMR6Q5bGNI6ewyEeasyBw77CE3OiPjs
         9n0tYwvJyd1P7H2F/jQW+hikEt3f1OhIy0wfeG+ctAswfnHe/aIxpdm9slUqC7jo1pan
         gVjMJQqOrPq+P42LkaZGUmUndNWNliLBdFN5+jYop1mxHYzHF+Q2WrkzN7IbjjBx6jHC
         kRbBethMpQqjuXJD71I0QKyjy7wrlU5q7H+7q9ZVzHFDe2lSFYIc3uxMFT9/zbDF+RGB
         AOyA==
X-Gm-Message-State: AOJu0YwKBIvkuWZfUmdKMcFD5yChtj+Do5BDorntdjOKgbuGYXiHU6ef
	bLiDR+C9Jmd2BcaF0psBmYrp6D+UPNWYTa5h+eAGdI7eRUfoFmLoxmKFdIRPKwi7Gi4=
X-Gm-Gg: AZuq6aJPWyN4iAKRSeLhy3vwG7tqYzqexkAIHz2YjgygDUtEesnHj+4cTkFGKh6zM5U
	tb5pjuaJFDAFL9w8r004Lq8mK2lWNYZwYfpdyBtKiCImY4hCQIUJsKuOe0QDdhaVGc3txeV84LZ
	Y5SHpAsH5ygP5Z6aGJdIIukyu2gUNRblS3wCvu4f6Z89CUWne89MMwwSHXKA1ue3CI0Ql/Jiytu
	/Mn/6HYtektbJnPfbDkXyywhtjMkHswentz5vQFAxLw1bhqAuTJv9LXywYlS1D9xOEj5AkdXjHF
	gMVgWDjjt6ckq49BiTkBphV11ov2aATgUMf3ySTg8c6by5LBxdawoh5eEOdbVXBXeuVhf3xlan4
	oniQhpG/9rMYNbIdIPdhr+5gA2vlH/qL8YEohw5UXCh0Os1gYWhVrpNKkfQ0564FrpYvLFunV0l
	ysEQHrmwR/cpgeQfY83fkn2SCOL3uH+/9ypeJxGxpEzhaYkxTfqgsQeGkyOUm/K9W8b2Tut1y0
X-Received: by 2002:a05:6808:181f:b0:45a:552f:cbc3 with SMTP id 5614622812f47-46410d3ff75mr1284891b6e.61.1771437914622;
        Wed, 18 Feb 2026 10:05:14 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:ab87:97b2:3c7b:da2f? ([2600:8803:e7e4:500:ab87:97b2:3c7b:da2f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf178c1fsm21455300fac.17.2026.02.18.10.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 10:05:12 -0800 (PST)
Message-ID: <d63e251e-03cb-4c76-aa96-f8550a43c7d8@baylibre.com>
Date: Wed, 18 Feb 2026 12:05:11 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH libgpiod] dbus: daemon: watch for "add"/"remove" uevents
 instead of "bind"/"unbind"
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
References: <20260218-gpio-manager-bind-vs-add-v1-1-0fb22c448de3@oss.qualcomm.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260218-gpio-manager-bind-vs-add-v1-1-0fb22c448de3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-31802-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 86B3B158814
X-Rspamd-Action: no action

On 2/18/26 2:50 AM, Bartosz Golaszewski wrote:
> Linux has a stub driver for GPIO devices (the ones on the GPIO bus, not
> their parent devices!) but it only actually *binds* to it those devices
> that don't have a firmware node attached. This means that in some cases,
> a "dynamic" GPIO controller can remain unnoticed by gpio-manager.
> 
> This behavior is related to fw_devlink handling and - even if we changed
> the kernel to bind all GPIO devices to the stub driver - a fix in
> gpio-manager is easier to distribute than a kernel fix.
> 
> Since an *added* GPIO device is considered functional, even without
> binding to the stub driver, we can rely on the "add"/"remove" uevent
> pair when detecting when GPIO chips come and go.

Would this also be true if a device was added at runtime using a dynamic
devicetree overlay, i.e. it would still have to bind to a real driver and
not the stub?

> 
> Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
> Reported-by: David Lechner <dlechner@baylibre.com>
> Closes: https://github.com/brgl/libgpiod/issues/175
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Resending with proper prefix.
> ---
>  dbus/manager/daemon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/dbus/manager/daemon.c b/dbus/manager/daemon.c
> index 4627e8c96b420b8ad9e36bf7b884a702490d53f7..b9c295a55751d7d37d8a93033e9e1ad7ec8ac5af 100644
> --- a/dbus/manager/daemon.c
> +++ b/dbus/manager/daemon.c
> @@ -785,9 +785,9 @@ static void gpiodbus_daemon_on_uevent(GUdevClient *udev G_GNUC_UNUSED,
>  	g_debug("uevent: %s action on %s device",
>  		action, g_udev_device_get_name(dev));
>  
> -	if (g_strcmp0(action, "bind") == 0)
> +	if (g_strcmp0(action, "add") == 0)
>  		gpiodbus_daemon_export_chip(self, dev);
> -	else if (g_strcmp0(action, "unbind") == 0)
> +	else if (g_strcmp0(action, "remove") == 0)
>  		gpiodbus_daemon_unexport_chip(self, dev);

I supposed doing something like this to use the "bind" event if possible
would be too fragile (since condition_exists_that_would_prevent_bind could
be different depending on kernel version)?

	if (condition_exists_that_would_prevent_bind ?
	    action == "add" : action == "bind")

>  }
>  
> 
> ---
> base-commit: ff267fb439b5c307fe75b47bed4db11148b29ff1
> change-id: 20260218-gpio-manager-bind-vs-add-44450137603c
> 
> Best regards,


