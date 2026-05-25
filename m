Return-Path: <linux-gpio+bounces-37441-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAraEBMVFGo4JgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37441-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 11:23:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D515C87B9
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 11:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43F4530137AB
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 09:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45CC3E170E;
	Mon, 25 May 2026 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFyuy8CR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D35D23E325
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700838; cv=none; b=svBr3yiIUYCFqtBRxbiuM0SGx7FjVGv3sDk+lcO8L8hmkL93fVbf9huK1Bvpr0uSDn3FcdDEiSg+DY3s8cqx4Gh1c/jXrQtYLTwBekON1RymVEpI1lL8kPnDLnLmwZXOR56QqmT8x/Vvrq7TnkBCrLksd8LIwTycPsLQKt3Qrfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700838; c=relaxed/simple;
	bh=20EON7IhXxRrup0RT+mkXIm2NM8PLPbbIEx/ylBuATc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F1wx0fauaq53sFulqb4FAwsg2h/LlBJM9+WXaZ4ZG34uzry/BsL2Jq6lDa+DTDyUWS6ZQyKnL7OaNRank1uaGGATIJdnb1FPQGHv9dTav8EsUto4Qp+C/247mGuLtnSeFtzxxhqnNq/ZfAgYQkfhNSuHMZXuHtyEjElR5TJUjxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFyuy8CR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2501F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 09:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779700837;
	bh=20EON7IhXxRrup0RT+mkXIm2NM8PLPbbIEx/ylBuATc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eFyuy8CRisflDJOOtnwG8S5b1hIf5d9Fg88aAgh6rF/WrSv2Y0drtu16Xx8t58od3
	 H53EntScbuHWF4E2lm+Z33byAf7FhltWPNMa+97dcRyFGVWM+Pbn8uf7FcFi5JJDpH
	 V1WF+D8qL9OOrmDtnDiFduA9EjtOiQNOuQRc68dOhsknEiTx/gOVNOdmYn26uDmybD
	 LpYM5IxK12nw9EyWxzirx98vf55WRtfk3ixkcrH8VP0W7RUF8CDhxUbpK8Jen4zk1J
	 zc9PkZ47e6pd/pZ4gBXk+O7/phYOGPz/tS++1G+7LyCBLJMsVNY8k7WSqlZuxGO1A+
	 QvpNepwLQmzXQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso10050204e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 02:20:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9B3kGtlLg+kaSeRtiicf1DE3r893H0A5YeNlhZkPQ2xZZkqxA4a1jN4Ex3a4+5+R1bKe2txhOnlYPF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Mwf1hENdV4iKkHAbepLMngpptxhpa7raA4ysf+myV0TQHiK8
	dEmM2tBXtnaVn+fdlfspa9hph4N3UNrZwzZRf/JsJu/f4HyKr9pBWgRgRCnn5WBfKjdeNDU4upg
	7ePEfmm9wvOHAFdk7V4PGVuCx5raD6x4=
X-Received: by 2002:a05:6512:10c5:b0:5a8:9756:f6b8 with SMTP id
 2adb3069b0e04-5aa323cd97emr4009620e87.35.1779700835914; Mon, 25 May 2026
 02:20:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-gpio-shared-free-vote-v2-1-7d948edfdbde@oss.qualcomm.com>
In-Reply-To: <20260521-gpio-shared-free-vote-v2-1-7d948edfdbde@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 11:20:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLkLtjF0H3hxCMPdYR-XwhDk-ugFDsveemBu+Yh52dfjDA@mail.gmail.com>
X-Gm-Features: AVHnY4INXtqksmBYCko_Zrb9fxtc3YGjRnGBV1zOmSNmVxUZdX8edKnOZ4CZl2c
Message-ID: <CAD++jLkLtjF0H3hxCMPdYR-XwhDk-ugFDsveemBu+Yh52dfjDA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: shared: undo the vote of the proxy on GPIO free
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marek Vasut <marex@nabladev.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37441-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email,sashiko.dev:url]
X-Rspamd-Queue-Id: C0D515C87B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 4:22=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> When the user of a shared GPIO managed by gpio-shared-proxy calls
> gpiod_put() to release it, we never undo the potential "vote" for
> driving the shared line "high". In the free() callback, check if this
> proxy voted for "high" and - if so - decrease the number of votes and
> potentially revert the value to low if this is the last user.
>
> Cc: stable@vger.kernel.org
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy=
 driver")
> Closes: https://sashiko.dev/#/patchset/20260513-gpio-shared-dynamic-votin=
g-v1-1-8e1c49961b7d%40oss.qualcomm.com
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

