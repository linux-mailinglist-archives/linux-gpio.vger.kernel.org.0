Return-Path: <linux-gpio+bounces-37706-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC/bHrD7GWrB0QgAu9opvQ
	(envelope-from <linux-gpio+bounces-37706-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:48:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4CE608ACD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 458A13011F4D
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 20:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFE33AD539;
	Fri, 29 May 2026 20:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qg3STj7J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45DE2E7377
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780087717; cv=none; b=FZOJwvbRWpQeBUJBMqGkglygPiMaMQr4b2id0JLa7NzYMHl956Oa57U3UGyezpW9f9hNaC2NEHOY+T2fs1CUf9wPZHgVy0w0BR6gPO4hTDCjGI1+igi5vnGSfe1qph7WR4/Pj0zLX8MLWTAmERY2UdZ+7VC9LJxOI7LMFB1ufSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780087717; c=relaxed/simple;
	bh=xYc9LAVWTOK0QKRc6fKihxk0QguYA7yyQkNW5fWBkNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYtMy+CVf4dUBgq/V06KUZoMV7GE2tJGwLQ1ZXm6u7n0KVuhxT910MdQeR+fDcehOF9kg0hVp6i0E0elZ8a2jAli5f8LzQ5hfaGC1Lv90B3Y65mkz/9T/6OfgTcsnU95fkmriTqX1f++Aubzp+eAC6eOuGkHlONOEHgzeyOFYVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qg3STj7J; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93911F008A1
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780087716;
	bh=xYc9LAVWTOK0QKRc6fKihxk0QguYA7yyQkNW5fWBkNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qg3STj7J2z+JAmrN5ej68KKqpli7AJbvRS1gvVEJ7U6l388/4i3UQ4CrFAwTe1IDq
	 rKycGyEzpTqskVJHRJVnFjKtoeJQgD/gSdHHBJMkWqLXxiRJp3pvVBYxEoJx0cURct
	 WCFndU9SUSWPVIfQvxEjNCYmYhvQCHCjmYw+jgSXxLh5mL896TGEl6inF0a1nz2DpL
	 xn8a62SnNU4Oai2qcMJ8EqNBzi56W/wg3AVGR23d2AYMh8YIXu79nem3k0t+nCLu3Y
	 dTcIlKhw/HHXl/lL/jCmmUZHfWx2kO8dO6PlwVLRWjg+PgCvozyVMVyIbBwqnMBg2D
	 QOkX+rqo+NfnA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so129398081fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 13:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/hJpj3reJ2WFjLNZ+HmZoNovV6Nd6k+2U/SjKCLy0Yoy5979pXqbYqJ8HJk1jaqGs4eelsn3DcKYde@vger.kernel.org
X-Gm-Message-State: AOJu0YzO9/9xxiqV4XJK6dBqa8YwdrXz0k1P+GkLFZRatqWs6Pwf7hPG
	Ht60WgLhzL5CCPJJekMmFMxu4V1X7KBd5UeW9kwIMWc7Dldp9W91V96+5+BbpyoWAeiFPLgiDdv
	wI/v0bdgRX3bTyyER0KE+BQ+pKGL2Hfk=
X-Received: by 2002:a05:6512:1048:b0:5a3:6731:910a with SMTP id
 2adb3069b0e04-5aa607be49dmr451085e87.11.1780087715443; Fri, 29 May 2026
 13:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779896151.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1779896151.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:48:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLmi48Vzg0MkpFys11aTEAofSbdoyosmq_fCRe6ZxZ0rQg@mail.gmail.com>
X-Gm-Features: AVHnY4LSQW0p7WEVsPI_87eZk0RifHappy19Y6jZ6wxQZaYafcHFoEXTk66u3jY
Message-ID: <CAD++jLmi48Vzg0MkpFys11aTEAofSbdoyosmq_fCRe6ZxZ0rQg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] pinctrl: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37706-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BD4CE608ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 5:43=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:

> this series targets to use named initializers for platform_device_id
> arrays. In general these are better readable for humans and more robust
> to changes in the respective struct definition.

Patches applied!

Yours,
Linus Walleij

