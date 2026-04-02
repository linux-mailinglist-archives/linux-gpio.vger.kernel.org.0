Return-Path: <linux-gpio+bounces-34577-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH4IIvwkzmnElAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34577-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 10:12:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3821385AE1
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 10:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7E993014C19
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 08:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338D939A04D;
	Thu,  2 Apr 2026 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfwJC4BB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC8F37C0F5
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117417; cv=none; b=QKjRRc1jWGXhc0pKcRqZqWkf7o1yVYsjj+AUqKlSmwLkAGVkm5M4zReqhEc6z0g5qcPkgndRoPDwhzqOeQSMeQh7GAWZpoRJbfVOaJvPicLKgCQX0Vwzj8QZQtKme1c58pZ0DttU2zh7tAbX6UjJGn+jkJqCuGftKqzchvYV7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117417; c=relaxed/simple;
	bh=1ErZZ9iqXxXbtj21h3uqwzu5ceU/lJZe1jJR5txvioo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aV5GEdZws5/ZxTN1PbTqq3ElGM2Nv1rHE6AflrWDGlyxa3VlpVCq+tPtXWvQWfZXBY/L5VlYxboyLQZSBAQNHYBaU92S1w/GVMAqsNlf5JOJ0PKJkO1E5ciRLBAHJzpgZB/FiWxLYHHe/bxVSsFU6+WlKVOt9uCsY7jzu1XIzPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfwJC4BB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9295CC2BC9E
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775117416;
	bh=1ErZZ9iqXxXbtj21h3uqwzu5ceU/lJZe1jJR5txvioo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JfwJC4BBd0/61GAPdIRvIrjnk12ZmB2/RmCTHoDRn3zeaOmL7Y7vTU/f72xrxptx6
	 3UVV0OMRyjO8bHoEXs9/Dtcwy6rU4m75hab9wIjJF6SmnKeE2vDRF9axq8c1yA2cmj
	 57zgYDgnjX++hcU1+GWO7Of4fDL+XelBwe5Ljkz3I6ri6jNHIgX9OVZIGygFhDqghj
	 dFjCE7X2FAQT6jcPl6uPraBKlLX2lQzNVASFOfyFj1kOQkygOOijqfv2BVgJWPeXxF
	 3oPd7HV53mfMJztGW/uBmJoF2Ba9jUFiMbKb5T0+cd/6R86DJABtoMXctG8UxpV3rc
	 fXOPlBISv8uOQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so768109e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 01:10:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUR3JgMOCq6EuZvT8RM9RjGMFFmjIqFtQ+2PFE/oWaN2Ne2w3dnhUQpIUcm7+ET5R/DmylRl8CecVvk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyack3vVu1jU8j/CsD5UqG4HvHOLWbDyUlQ9FPBYYeSIGlO2L9y
	ogjyh7MQ1rXEw9NkXdRyNqfbh8vVgPO/yoEOv7z/5RiO/F/rucx0FhXvNEmrQmKHp6NrKsiz7d9
	nKOoxStErnCu+dLpIICzAhE39lplLrIilWv8Ha1soXA==
X-Received: by 2002:a05:6512:3042:b0:5a2:b3d8:443b with SMTP id
 2adb3069b0e04-5a2c1f2ef47mr2489312e87.43.1775117415273; Thu, 02 Apr 2026
 01:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401133441.47641-1-jonathanh@nvidia.com>
In-Reply-To: <20260401133441.47641-1-jonathanh@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 10:10:03 +0200
X-Gmail-Original-Message-ID: <CAMRc=Me4-KS0=GL8SdwnhzP-YYWoYZpyzciS1L1iF=ip=1FQ9g@mail.gmail.com>
X-Gm-Features: AQROBzDh98KNbk0WwwrvUlSXp1jThukUEEB-lhC1VmD3kvI-VbYGncAo9q_Necg
Message-ID: <CAMRc=Me4-KS0=GL8SdwnhzP-YYWoYZpyzciS1L1iF=ip=1FQ9g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Make deferral warnings debug messages
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34577-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D3821385AE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 3:35=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> wr=
ote:
>
> With the recent addition of the shared GPIO support, warning messages
> such as the following are being observed ...
>
>  reg-fixed-voltage regulator-vdd-3v3-pcie: cannot find GPIO chip
>   gpiolib_shared.proxy.6, deferring
>
> These are seen even with GPIO_SHARED_PROXY=3Dy.
>
> Given that the GPIOs are successfully found a bit later during boot and
> the code is intentionally returning -EPROBE_DEFER when they are not
> found, downgrade these messages to debug prints to avoid unnecessary
> warnings being observed.
>
> Note that although the 'cannot find GPIO line' warning has not been
> observed in this case, it seems reasonable to make this print a debug
> print for consistency too.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Yes, this makes sense. FYI I also have a grand plan of introducing
support for fw_devlink for software nodes and assigning them to shared
proxies with the aim of them respecting the probe order that way.

Bart

