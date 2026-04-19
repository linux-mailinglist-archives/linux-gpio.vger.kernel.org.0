Return-Path: <linux-gpio+bounces-35239-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEhND25M5WnvggEAu9opvQ
	(envelope-from <linux-gpio+bounces-35239-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 23:43:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFE2425956
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 23:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78E0A3004D24
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 21:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BCD730B53E;
	Sun, 19 Apr 2026 21:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqG7Rrti"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F68E1482E8
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776634985; cv=none; b=t40TmFic1zyCAcYqAaUcvXjNP64gWDRzyfntQ43Ed837wJTkLon8i3VodilfXX/XcYdtdfK2RbMA2WDNhu6LzQs4jcNfzmyGt+e0HQR9Zlqin4aJEKYY0Dh7thzC3DTWGE2B7RdNuLTioeCZWREH5tI4H1uLwt2cp3m81P87K9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776634985; c=relaxed/simple;
	bh=4jpSLr3O/lNvtNtYaN3mKKdH9bxXsImrwjUfU90LEqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6msk+aKfP7gDm/Jk4Z5rkYzy/jOtoRAZ7OYRZhCzT2z504iUSJ99RumCSxpKXKdPeNHq6/ZPlydqvMzquw6WY+vEZObgbbWm7FMYWwf62xk1j917LoWVvneJe5VSjWHvzYv1iURcMKWq3Vm7o9/39QfANKGIBxc2Fx0rKKjCi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqG7Rrti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6061C2BCC4
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776634984;
	bh=4jpSLr3O/lNvtNtYaN3mKKdH9bxXsImrwjUfU90LEqA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hqG7RrtihfJdrJ6OZFOR462gSPMnJHMqK+JIR8x0qWYPS9EZ/Bvxqos3Una4AADqK
	 Ij/7OzGmkoPi/M90hGRcdm0syEZCHXcdLmaNcgIVUQeknor10CL21Lz/gK3pIO/YCV
	 WMXpHUq5bjTF83K9fTxRTTdIEdaeZX+B5/rw0lU5S0+YMqF87A81fnY+ZKHadB0bba
	 WKgq/b/mugd3qJXtRbOm/7eF/nZMDMyWJoRyLrRh9brrWcKtCTxRXI5usaG4XBkh5l
	 YHJbsSkWTiZL/Y7MBleNw4AU+atbQUSPAVtCJ6lhD6UTujWoo/OCmmXln70N+SgmW/
	 wQ3tJ8I1AsCcg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a283c44478so4079357e87.3
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 14:43:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/KqR8LNKy42H9vtdp18n2g8TEKT2lBV8J5kE15sGiw0NFjncDFCdMJ6wjx9cZaYXIbiYgQ2g7Jn1BQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Ns7X7Ys45zHI1z2Kj2BRcSLlC+4nkvd8nN44hJ3yTbD+8S++
	KaOMW3aM/asDDsgtVuoQw4HVtcRiza/p5kSN8zP6CTFbzrA1rTwqwtkx7u+7Tz9v4HesbkpJA+B
	FF4g7pD8wOWNJGRoBnk9GRtQR80ZEB1Q=
X-Received: by 2002:a05:6512:220c:b0:5a4:c6f:d43a with SMTP id
 2adb3069b0e04-5a4172de516mr3364349e87.36.1776634983477; Sun, 19 Apr 2026
 14:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416154928.2103388-1-jonas@kwiboo.se>
In-Reply-To: <20260416154928.2103388-1-jonas@kwiboo.se>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 23:42:51 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ETs2q5FYr_zWYFbnqbCx3DmT4MarAHmy_KA1GggnHcw@mail.gmail.com>
X-Gm-Features: AQROBzAepQPgH7Yy776Lv2UHkdRyF0oPi28JCu9KzCWx0YubHgHTG4J0DP8U52E
Message-ID: <CAD++jL=ETs2q5FYr_zWYFbnqbCx3DmT4MarAHmy_KA1GggnHcw@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: Fix GPIO after convert to dynamic base allocation
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Lin <shawn.lin@rock-chips.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
	TAGGED_FROM(0.00)[bounces-35239-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8BFE2425956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for fixing this Jonas,

this also uses the function in the right way: instead of using
gc->base which just happened to match the pin base it passes
bank->pin_base which makes a lot of sense.

(My original response mail was a bit whimsical because I
didn't realize the offset passed as argument 1 is local and not
global.... but you figured that out.)

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

