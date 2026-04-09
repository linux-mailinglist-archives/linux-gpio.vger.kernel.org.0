Return-Path: <linux-gpio+bounces-34929-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODuBH2Nn12myNggAu9opvQ
	(envelope-from <linux-gpio+bounces-34929-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:46:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3C73C7E91
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11FA53050206
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA12D3A63EB;
	Thu,  9 Apr 2026 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdD8hj67"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6433A6408
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724266; cv=none; b=ScNenEplkdchzT9sXrfTU5SXRmOSsWprdXjw49H2W5jAw14MQjtN7sfc4s8U2ydCBWnZ+VpcgehlnSQesKvwS/3BJoqugw89N+Xt+8Jd9+D34CKdNUfqDMPp1FpzEMRbRk1x3RSesrgr/W7mCevK6igxAucNGQiEEQeQEqaMTVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724266; c=relaxed/simple;
	bh=XSinTqMRk7WKiOjjhU28b38TxCJUDpIkM+UX2/IoucM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ClblgtcvngxRDhOdBPF/I8zXvuvcQNFUYTqOcvvHeLBCd7qiEXr5x6tLzVivpV3IvJyGHsuf3Vp8lUWv/ZXif7KpKdaH2vsvdTfYKiVqergEttrMuAx+EfCM7Md/0JsNF73aClgaX7JRA4Ll4GKBg5Zu8zdO+p47if0jQuzoZkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdD8hj67; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E036C4AF09
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724266;
	bh=XSinTqMRk7WKiOjjhU28b38TxCJUDpIkM+UX2/IoucM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GdD8hj67K/1zLUxPLNVOghF+oCNsAuD1A0dy7Qh5FjOLqX82tXv2tAlxrAIL1Cym0
	 K5m24CruJ3a7d7iCtqkTcYJcWpmkbmHGSxnEfj1KSYokKqXnSVGnQXsfnRwIT2Ozfc
	 JMvBPlNOhp0hB5sd+bS4ZSx/fuwmRG7ahRrvc7CFIDWwHVd0S29Sn4+FnO8QR340kG
	 KndacjW+Lhxiu9+JMDCjKq/LkZYUrj0o2N6q017HKmWZ9+ekOhnYmpJkLgI7vkvbwv
	 /v7F6R4phc0WnpuQWxR71yFVBjasiQcESQ+4tbnbhmzOhEsXK90dUcNBF2JG9eaAQ3
	 GQawv2tQ6TdNA==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a535e7c00so7119537b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:44:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuK4WWv52oattQ4we18TMabBV+FncwGO9pi1c2exkr/wepw5R99O5Q85VoJg84CSHMYqUt9b4/kyVx@vger.kernel.org
X-Gm-Message-State: AOJu0YzA9i6V5owTJyzueQfXN8bgcomv3vKqItJJu1D7IG7tdJGoDkrx
	H7sJuursI1Oh+/E4MZDQlQZ7MAXBCMhh7USWHmYY1Mzey36er12u/IeR0FHwdA/25i765UyfImu
	17/uriSKWIV0rarnShRjvtxyqIo515hA=
X-Received: by 2002:a05:690c:6610:b0:79a:bc1e:a399 with SMTP id
 00721157ae682-7adf2863321mr27613477b3.35.1775724265707; Thu, 09 Apr 2026
 01:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407235611.550515-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260407235611.550515-1-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:44:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLm10MOYt5Xx9Am+Oqs8rOFse+L7WDOc-W_5OS5fXuSSHQ@mail.gmail.com>
X-Gm-Features: AQROBzBBIPyY1s_9tUX4DGpv6VkJc53NEDV7f7YuwDbgIlTf2tXYVbrcG7VMnEM
Message-ID: <CAD++jLm10MOYt5Xx9Am+Oqs8rOFse+L7WDOc-W_5OS5fXuSSHQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Utilize pinctrl-single for bcm7038-style chips
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:PIN CONTROLLER - SINGLE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROLLER - SINGLE" <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34929-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,broadcom.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF3C73C7E91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 8, 2026 at 1:56=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> This patch set allows Broadcom STB chips with the BCM7038-style
> pinmux/configuration blocks to use pinctrl-single. This does not
> preclude us from making use of a more sophisticated driver in the
> future, should we need to.

Patches applied for v7.1!

Yours,
Linus Walleij

