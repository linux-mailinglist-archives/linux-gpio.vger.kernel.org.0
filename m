Return-Path: <linux-gpio+bounces-35626-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ChHEHnH72knGAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35626-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:30:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A5247A084
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F6AE30166E2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 20:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8891136D517;
	Mon, 27 Apr 2026 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLp1nX9I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4422E2DF2
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321566; cv=none; b=fmAA+gxIIiAKfFYujkw4LkcETEUuu39T7I/ZlUQALrxxdClm+ZqUiS+ZAp07JNETPc5zQKkFhkrJBIybl2GxUr0a/0FAQnlFNkFKs35xD0eKFqnWTMiXPY09e5Fyqc44yLEMwN9ix64TmwFj1WCqgNfI3Ur7CepaLCGVx7xuodU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321566; c=relaxed/simple;
	bh=IJpREljCv+tCpa781iljVxrdidqfIWDfk9Kom6HM/kI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CI3xf8y6GcoglqMqCFymCwe0lPANtpgaKhequu9wnp5PQFGfIc35Amls5HZuP1lSTtlAzwttgSbRdrKkIQ48scFEs/j84YOAuOYAvC1ZtbMo2DBXtElX+hXQJ2JdqC5yj9pxEc1S8B5RrZLOj4pVg93o5+FxmC0mZWtptj8W04o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLp1nX9I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31342C2BCF7
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321566;
	bh=IJpREljCv+tCpa781iljVxrdidqfIWDfk9Kom6HM/kI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cLp1nX9IP0AAxlM54rpfQSxvMtM0GJuKgJ0Rr7uahgmmifGFPAq9ZYsJuTZ9b+q65
	 bNyVcBmpZqK7nVld/6mypC8uGCCSli40mbn8yO8vhshOh6/deK5ltUJOR3txLDm4Fy
	 OeKfIINot/T4hfAtyJ4mNQpxM+6bmK6OHpuRFBj9f398XRR53PjQR3X+hG77N2sCd+
	 ESlNbVKXs7Gneam50UUYItDfGlSyVTRRsxwBCeYzy7ssVbouxBNE4+jtC0i1FKQSCQ
	 TNnSrGuCJYVrtTiG1K1xW2wDY5bvzH/yTuBIymW7aYRWPMm3dXTrNSkdtPfA0Iapm7
	 f/xT8+KBPGk+Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a415fd6bceso11759155e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 13:26:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8U3U1O3P362YJO1MzfeLCjwEpVDZWxVZZXTJBLa2X5lSym7DKoBUwxxwZl93aW2sDXG/kH7TkB64Hq@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIr+bpXpBRwRBeMYYRppk4y+ofmWQ9ypdDHso5yUzAN+8lVlA
	wwJN/R3U5iRUMofnqpd6xYSQi0m6GCXa2kc1RiljfMBtzMAeSXfj+RtB2H8pC3i8nsLb93INWWq
	PqdrKetFVrlr+3nb0hgKCl6QRQvDWUYA=
X-Received: by 2002:a05:6512:3dab:b0:5a4:178c:62b7 with SMTP id
 2adb3069b0e04-5a7468b5f60mr46249e87.20.1777321564779; Mon, 27 Apr 2026
 13:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427143020.2800317-1-arnd@kernel.org>
In-Reply-To: <20260427143020.2800317-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:25:52 +0200
X-Gmail-Original-Message-ID: <CAD++jLnLDTe6eP7UP7ryRwC9R7=7PNMuaqYzsVezsKFRpZtS8g@mail.gmail.com>
X-Gm-Features: AVHnY4K-oubdFI7rdfxfc9VDXytCd_jxlAbKESpT-vV_8bgvOKkOnhWhSdHLMnw
Message-ID: <CAD++jLnLDTe6eP7UP7ryRwC9R7=7PNMuaqYzsVezsKFRpZtS8g@mail.gmail.com>
Subject: Re: [PATCH] dsa: b53: hide legacy gpiolib usage on non-mips
To: Arnd Bergmann <arnd@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	Kyle Hendry <kylehendrydev@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 92A5247A084
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35626-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,arndb.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,arndb.de:email]

On Mon, Apr 27, 2026 at 4:30=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The MIPS bcm53xx platform still uses the legacy gpiolib interfaces based
> on gpio numbers, but other platforms do not.
>
> Hide these interfaces inside of the existing #ifdef block and use the
> modern interfaces in the common parts of the driver to allow building
> it when the gpio_set_value() is left out of the kernel.
>
> Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

