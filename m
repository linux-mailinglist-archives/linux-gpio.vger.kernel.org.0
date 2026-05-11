Return-Path: <linux-gpio+bounces-36577-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGMAAzzYAWpMlQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36577-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:23:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A492450ECEA
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C387C304DCBF
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA42B3E639B;
	Mon, 11 May 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+CyLtwR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FA83E639E
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505504; cv=none; b=QxPr1hqtuI2i1/2Utpq34WRk3jEEWkzprLuoIWeAeGWCtay0m+cMlZCmqyo6EJDtlVOXefsF/r59GEOeivja6D76ZStRzFNwQN2sfDt2WYxOXnO/HhgOBUDlcUeQw66IPgF0tg6Jzjsy7LlHnz4lvBnAYdfLktUIGyFuDpSDrYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505504; c=relaxed/simple;
	bh=6ww6fy8KHu5Q4r25LD1oz0EJ0eun5LdGvUPbUpVENSw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fy61VQqmWETbnhHe9e3MdsEMiNJK86L3+h2m28ejpfnHBGCwGr2c8coNAEzHWqKcXpoZJYKm8hY9vDq07p+C0J/2nAz8O40Ev6HlHGTXswa4vf7JDIJwdvN7OOCm1Uyx76NPlWVNHCgtR233rwqqarpq/4SayCsD1GKTPOmTAzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+CyLtwR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E410C2BCFC
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778505504;
	bh=6ww6fy8KHu5Q4r25LD1oz0EJ0eun5LdGvUPbUpVENSw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=V+CyLtwRpTOPi3pFnRq2uXpBl3wcm22vl+CncbAS0ZI7EBRMfLRHLsEAloIqRIrV3
	 4WnezmBG3FeVjgvq3nEwpeykbKT2hBFd3fGAjwhcyMV/lHNnF6AMqOtN9cs7Z2y5vP
	 TgHVQV//02XCCETov3XbZGtwyaJOFHCaOzI4WF8G9YkJMcTeX0tEglyADjMGO5iaVR
	 waez7zI86y7zxY2pKWchi0jZ4y8Zb0Yyye/9l3l33fQpl7K+no4Qy7Z4pYkErywVB8
	 YRQ+68olsRZATkq1gm6g2aS8Vef/yO2o8Efrr2IuDwYSYunBHjj+J+9Ec7r3N+zUU9
	 AE7Hyo2Bab7LQ==
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c1a170a50so5611846c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 06:18:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9xYfqEw6oQZF4X0Q48k0aR1NiKoLKbJnyyqoG3VXS27BGt2ny5KWrweH2z2wn3uJqFl2if4rl/36rc@vger.kernel.org
X-Gm-Message-State: AOJu0YwTuZ0Fa1Rhk07cC8ak4zLoduyORG+n7fgZtQQ4WHKYH5q4Chut
	HMiWX+Nd6q1sI57JMrc6Olj0nCnLJJxisZCePOhkq7AJY5mep5MIxjiEO6oxes54O3QkLc9j31e
	m0lEbmxYtP1ue5MTZrXn/L+Rhpi1muT+F+qF095Yocw==
X-Received: by 2002:a05:7022:3881:b0:12d:de3f:f3ec with SMTP id
 a92af1059eb24-131a6af4638mr12966282c88.44.1778505503820; Mon, 11 May 2026
 06:18:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:18:21 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:18:21 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260508105448.31799-8-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508105448.31799-1-tzungbi@kernel.org> <20260508105448.31799-8-tzungbi@kernel.org>
Date: Mon, 11 May 2026 06:18:21 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfZL2ZEmNEdVd6NeZJDjTzh_MbDy2kU+AYi-CmgRnWZmw@mail.gmail.com>
X-Gm-Features: AVHnY4LEB3rFVjF4-wPVWZyZFCnCkvF9FgRQm4PIeEemYGwXCVjb8ySvcJRKDiY
Message-ID: <CAMRc=MfZL2ZEmNEdVd6NeZJDjTzh_MbDy2kU+AYi-CmgRnWZmw@mail.gmail.com>
Subject: Re: [PATCH v10 7/9] gpio: Remove unused `chip` and `srcu` in struct gpio_device
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
X-Rspamd-Queue-Id: A492450ECEA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36577-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

On Fri, 8 May 2026 12:54:46 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> `chip` and `srcu` in struct gpio_device are unused as their usages are
> replaced to use revocable.  Remove them.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

I'm thinking that all the GPIO patches could actually be squashed into one. Is
there any technical reason for the split or is it just for easier review?

Bart

