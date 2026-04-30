Return-Path: <linux-gpio+bounces-35903-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DTZCq8882mFygEAu9opvQ
	(envelope-from <linux-gpio+bounces-35903-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:27:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B67464A21BB
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B9F63110357
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BCB3FD123;
	Thu, 30 Apr 2026 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rn6zcSXw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D13E717F
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777547872; cv=none; b=s0xQVJ+sD3joRreo5+iPz0BNNnkmRKt/T+HICPuFaHze8+HJIvLIAj2atg63gojjcY+8MVV1wzgcTvk0PBXWYmNKdrhAtfe20JWuAS2/YODwhTQwRLv43uWoLPEj51LI5VYYffK8lqjljeDbVHCmowFDQeOk8d5A8e/wvMlrCjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777547872; c=relaxed/simple;
	bh=PUDOqtoxvsiD7CZ6LXvbfBsm5Ghj9NVPmU5VX/aXFl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0vfH0o3K+PIyvDcAQQJiv0j1YLANgGgurNerUv8ZR5EU/uUGsetuQFG5rGFD8GGz84nYZ2V9lt6/mcmwxBvtyi4eGfg2m9p3U8fzCrHQ/aOJ5OTI5PHVaH1H/tuKBz681WV4WrwiC9foTssOXLbng6p4y1jq9hpeTSow956hWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rn6zcSXw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97414C2BCC7
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777547871;
	bh=PUDOqtoxvsiD7CZ6LXvbfBsm5Ghj9NVPmU5VX/aXFl4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rn6zcSXwFMHz2u+EZwfG4zhu/2I9vgf+7QkbmE5QvYuXjXbAxaOK6+g7jEaxXbJt8
	 KDsgNInn6Mv/gHKDiU9heY4y8W+8T8K8VeAZHMLyopvKMBBAONzzBACQOStOoyuqPS
	 tlbULCS/Kw3uAjMjKvf8LKTI1VpdxIkcJyTtq0dZd86p4GoGFweQsUYTXRIOXbpcBa
	 7b9y7eLl935ffpHPWzafu9QhIg9BNxgX7jEaD006SRwlV+Vyqs/8CKUz1lXWcVKVqL
	 bF2La3pCmSkFeEK5+V4x8m8LrfjfsAeYhy71DymDQSzO5JPtyF7lF7smQp+T2iiX1b
	 NeD9NJod5Sg0Q==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so7449041fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 04:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//TXR5bDOUuEYLluIbEL2BN6q+6Y8tQJYQcJXRNiT/F2pcqAOj8/cLuEigabj3eXqTqdAdnrleld/i@vger.kernel.org
X-Gm-Message-State: AOJu0YyOekxfsRKWf95JsjEOm5zo5hIR6DqSTAcy63qLrFmSCZDNfr9g
	+/MCxKkOjhW/2FCWNvh5YJkAnrFP2Ao3HLcvGJbs8W3tZ/Mgd//MYSgibCqpMafT7umHbuw1H65
	0aYaocW9lzkcqIpWLmPqMBrjwH++n1S4=
X-Received: by 2002:a2e:8a87:0:b0:38a:2776:1484 with SMTP id
 38308e7fff4ca-3934e30721cmr10475791fa.28.1777547870071; Thu, 30 Apr 2026
 04:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427143437.3059210-1-arnd@kernel.org>
In-Reply-To: <20260427143437.3059210-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 30 Apr 2026 13:17:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLmF1L9dM39+M-Yq6EXKn-1zijNdzdqqbb3m0eW0NgvT8g@mail.gmail.com>
X-Gm-Features: AVHnY4I86MzwdcX5dGBhjFvXy0nZzkQE3a2tg4sgxxdF0TLxUgiQTziX71HJOJw
Message-ID: <CAD++jLmF1L9dM39+M-Yq6EXKn-1zijNdzdqqbb3m0eW0NgvT8g@mail.gmail.com>
Subject: Re: [PATCH] mfd: wm8994: remove dead legacy-gpio code
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Thomas Gleixner <tglx@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B67464A21BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35903-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email]

On Mon, Apr 27, 2026 at 4:34=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The old-style gpio handling in wm8994 came from a commit 7c8844481a1c
> ("mfd: wm8994: Emulate level triggered interrupts if required") in
> linux-3.11, but nothing in the kernel ever set the 'irq_gpio' member
> in the wm8994_pdata structure, so this was always dead code.
>
> Remove it now to reduce the dependency on the legacy gpio interfaces.
>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

