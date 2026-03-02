Return-Path: <linux-gpio+bounces-32388-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LscNzBopWmx+wUAu9opvQ
	(envelope-from <linux-gpio+bounces-32388-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:36:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D88E1D6A30
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EF69310560D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 10:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F9739E6E6;
	Mon,  2 Mar 2026 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJbQ0cAF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05A39B95B
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447156; cv=none; b=C1fvM09KnRRaXY1QlcD6ulcMqCDES9qO/XMgloSR4GKiDQSXXMwjcJYL0oXfT+ovIMLb0B2KN4ES5nGewrlQrMVQvR7BILWv5Xo3tkJqRylT56xOntLbfJXePRrsS48WPEgomBgpW0Ox4voPMWNvN3bh9hwclm1QiJO5zcjOPFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447156; c=relaxed/simple;
	bh=h0F508P0vYmvJ5wSXgl1nFa/kXiaLjNfSJTA10TQF3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wk0qVGDs1MdVMDZMq78ED1ztG1pC98ITFjaIZskj4BQt9o152N7Gbhyh4TYWKuzO7TZB4HD83TC2tkZ2eouiE+Pb53DkICt8H1An/hDbnLM3eXIGnYKDf0dUbB/c4M/ez0I0WKYoMXzWPECSXdBKmNNrtBSLSoH+HUP1oOlXEwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJbQ0cAF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F84C2BCAF
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772447156;
	bh=h0F508P0vYmvJ5wSXgl1nFa/kXiaLjNfSJTA10TQF3w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LJbQ0cAFuchBwf2eCA1uYXhtiSSrWZm3upa1o0f+1KJ9uMa6ScWOMq4+Yboq7v9VA
	 cofwe20vHk/FUWIZX1mXfkEK6tnAY4Hwnsg6qgMA3Q1ZBsYlrEakqs57scI1ODVuYq
	 iK8jRd9ls56vYgLLHT9w/GSR3643n+/IMSgqgotgtI5WPJxgUHp7BkikztGL3G7x7z
	 c+GXUDA2NvjQfxfcEFEotCFnCDFsFWKskqzeZm37j0A2DMSecgrHb4EsKMRxKpd5A1
	 oRrBsxbpbp2Exn8l8NZyWPLHfpziJ6q71/I2M6BwwedQLO5GN6BCP1G9gTB+6IGgVP
	 j5DIh+4eBK0rA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64c9ebd1369so3602665d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 02:25:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGKbQ1Q0QS4nyROMymylPehG5k4+3v1F9RCJd7ZBaKXMiQ2pVfuycZ3cyiUGniwwMstEpEklRQ2oLW@vger.kernel.org
X-Gm-Message-State: AOJu0YygylOlYrZIGzdC+c00JK/4Yj+i4p9jy5hG9luUBD9rZyQ8NLht
	/GFvL1Pe91tmYbHRlZLb1cTNLp+y9/9OO4vE/SDCv+K1nbuIlarBn0RUYYmwzyNiIQO33ASY2Ne
	M3uLizQRoF/GMFAQuCb7V/JRnem2I8Cs=
X-Received: by 2002:a53:bb88:0:b0:64a:deac:d943 with SMTP id
 956f58d0204a3-64cc2080bbfmr6946974d50.10.1772447155440; Mon, 02 Mar 2026
 02:25:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301014802.3133231-1-rdunlap@infradead.org>
In-Reply-To: <20260301014802.3133231-1-rdunlap@infradead.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 11:25:44 +0100
X-Gmail-Original-Message-ID: <CAD++jL=7BQ-uAh-GeMtxE3A5XkO4QXDB0YvEqKfPfDJ8ixjiUA@mail.gmail.com>
X-Gm-Features: AaiRm50mZc32e7pGnHNLi3UeLNRBGN-EUiXFSq6Ky0N8472BRf3JQB7TEUJwUjE
Message-ID: <CAD++jL=7BQ-uAh-GeMtxE3A5XkO4QXDB0YvEqKfPfDJ8ixjiUA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: fix an enum name description
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-32388-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D88E1D6A30
X-Rspamd-Action: no action

On Sun, Mar 1, 2026 at 2:48=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:

> Correct an enum name in a kernel-doc comment to avoid kernel-doc
> warnings:
>
> Warning: include/linux/pinctrl/pinconf-generic.h:161 Enum value
>  'PIN_CONFIG_SKEW_DELAY_OUTPUT_PS' not described in enum 'pin_config_para=
m'
> Warning: include/linux/pinctrl/pinconf-generic.h:161 Excess enum value
>  '@PIN_CONFIG_SKEW_DELAY_OUPUT_PS' description in 'pin_config_param'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Patch applied!

Thanks Randy.

Yours,
Linus Walleij

