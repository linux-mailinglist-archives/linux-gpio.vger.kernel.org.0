Return-Path: <linux-gpio+bounces-37259-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJz7LJHQDmrOCQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37259-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:29:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E43335A2597
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2893930AAAB8
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 09:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEB336DA1C;
	Thu, 21 May 2026 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxogNg7l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172C936A375
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 09:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354875; cv=none; b=LZTfP6HhsGEjj5/k1UDhtBdkSwgnpHZSv2vBJpj2Fg2NHdoLp5IdeFnUF3pQO9Ri3je092sdx19dWBkCXniOGg4ErJ9LxJNfFKLcE8UFfF3sK9rdXLJr/Wxj4qtljTrahrdyihafBD4R8ziJEQF+4V7/3nlnNNjJWO0M6/RfKgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354875; c=relaxed/simple;
	bh=jNuoxjZvMo6Jgup5tnUJClP0fblgmtv3uErnOkOncoM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+9zOUotu3v6VGTclNybJjjjEych8xD2KkECVjJ97tm62cgmsj4t18tpzCDKdCqrUBoRt2kqJ4GCzMvMBH6AZj3KsJzCfXsfVrUL+xLQPnfeHqMgPauXA17M4O0d0yweT+0rJsaHEa74kqcYEoIQXqjSQ+s01Zqe5Vrh6/t6Mtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxogNg7l; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F3D1F0155F
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354873;
	bh=jNuoxjZvMo6Jgup5tnUJClP0fblgmtv3uErnOkOncoM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cxogNg7l1qXEYFBamqNrd8hkQEn3EoPMaSqcz6iCiEOMVtaOCBn8VTV2GXUUgc9pH
	 td+4rPYZxS/nTAz8Yk5xvRSfvjkN3aK9PTQon7Sr+Jr0Gphd7gYB5XLAbSCK5tzyqe
	 9EWGCTGeCfSDPaIjoJ1MK1QANz711YjSR4NsCTkWQ1xqzmXv239Sy4i8wE2hWfE1BY
	 SXVg5LrQZvkyTMY/PePM+ZnBBdenPak2go4KXtxR7AS0nO1lEwpLvsUO2Zgq7m/Hmb
	 JZyYgFbgxr901p5g+CHSgPDpp5o5gmSeG+QpWJyhSb7Q/Pw8hj47dQh0PO8mgp/Urt
	 9ihffcsEujsbA==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1329fc4bf77so2887781c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 02:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HNjA6IsHIUnsknY4pP7nGrHE0S3U9XddKuaIcPKEbi6ISBYlK+ceDmyNS3B5GucGjqJHJRryERyQZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJV+p726dod9nTI2SB2H8ZuiBGyc69mWdf/58ZAaNZWrJ1jO+4
	L+Jljyr6R21Q4SoE40oJIHlFnkhXEraok9X3QGi6fx4oYsYSFSbUo9ofRxHUt+ascz+4FfcV3ea
	nwqox+XkFM5IZ1JGtM3/W0wkqWTZic39hqECwX0bTIg==
X-Received: by 2002:a05:7022:f312:b0:12b:fc21:874d with SMTP id
 a92af1059eb24-13632d44123mr623001c88.19.1779354873386; Thu, 21 May 2026
 02:14:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 09:14:27 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 09:14:27 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520-rsk7203-properties-v2-5-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com> <20260520-rsk7203-properties-v2-5-465f3308021b@gmail.com>
Date: Thu, 21 May 2026 09:14:27 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfFDeFqo2n44VLZEEFhFOzfKX0bdO3DR08uiNC8LBZLXw@mail.gmail.com>
X-Gm-Features: AVHnY4LoATEnodB_zt-b1si7q7FaQdB8dn4GF6c9ZIQaby5NHH8SRjLCl2kmz7M
Message-ID: <CAMRc=MfFDeFqo2n44VLZEEFhFOzfKX0bdO3DR08uiNC8LBZLXw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] sh: mach-rsk: rsk7203: convert pin configuration
 to using software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37259-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E43335A2597
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 07:13:21 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Replace legacy gpio_request() calls used to configure function pins
> (SCIF0 TXD/RXD and LAN9118 IRQ) with software nodes describing GPIO
> hogs. These hogs are attached to the PFC gpiochip node, allowing the
> GPIO subsystem to automatically configure these pins when the driver is
> registered.
>
> Assisted-by: Gemini:gemini-3.1-pro
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

