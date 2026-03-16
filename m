Return-Path: <linux-gpio+bounces-33526-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDcOOX0KuGkWYQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33526-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:49:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A2329ABBB
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E64BC3003D3F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAB2398903;
	Mon, 16 Mar 2026 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUX09udD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F734351C13
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668985; cv=none; b=LBecD2KtMssgqgJCSlHvWtlRFKRq/0qqxxkatQ3KZrN4VO6QHofNkFh15+LXGANEejoufJr1KJJCEOFPZJegmMWkVLEFPZnvGoAf02LvPtN3mxqG4A5G28tMtj+fqbcXfGqjOCn5/3OAEm7Y4AIteAykttP4oKcyfldUzVsmzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668985; c=relaxed/simple;
	bh=A2q9pnOophLnn6caR9j1SFOoQuXMepZD8MjFyVMsVzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlrkKwCnh7VHs+HKidcjfLmvixLav7o4Ukp+eNiXZ11bSM6QWLwlkRYYmbgOr9oo3ZTo71LWghKmeowBWHsegFDFig6hmmS8qDlzctLMFv8jJsJM9jQb9+PdfVsR+3bhHuNRXuGl8s68mZHN/DdB/uc9P1lVPUf+FJ3LUjLACBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUX09udD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268C3C4AF0C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773668985;
	bh=A2q9pnOophLnn6caR9j1SFOoQuXMepZD8MjFyVMsVzA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MUX09udDrhOlLsC8/Q3l+9f7i6j0nw52cG2VBuQE28c0gsMbj/8yPFpkQlm+6qxO7
	 2nwinoqGoDsFAJs6AwnP/BJBlnmpHp0JbD+DDuq3iIulxhKK+Odb/+aKge9jNKDBhh
	 dHuXK87osW9hgYDFcPob13pEGM8QCPS+L8mw4AyRar4BUMhKg1qfF2pNQjd2nyKoN+
	 dDETEbyC+jOHoLgXeCG9I6IKpGPo/YHNaCd+pftyQqQFeKOMf/3SItoyecyJjbrpCZ
	 9xRKsijTcDS430vNPwngFADTRe7LPlJxz67BLKrDf2INqrfy6Aiy3CFrfWPwViujsL
	 2U+USy9pozMzQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79a3ba1653fso10502577b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 06:49:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkE2K406MZw+6RO7fmTe+ckVjpJ/aHash0hGeL5rFK6PrscbmcoYN7kHbXXtdv+h2GWob4O5l2f5Ah@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb6jaPP2tc4jCD96nAVFnGVQ6JSuhXJSkwGUdmnU3yaznQgUZW
	5SHlbgWyvS5Q5Twof552ap+uqJ13z+uuNvrPxMang6hW/RwLEwv5RPawk8m5TfU1qpPMFUqjezP
	MApN4VLSq8ihEeYe+AB6zGeHYP84TKsU=
X-Received: by 2002:a05:690c:9a03:b0:798:58be:324d with SMTP id
 00721157ae682-79a1c1ddd1cmr128701907b3.55.1773668984415; Mon, 16 Mar 2026
 06:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312113040.68189-1-eleanor.lin@realtek.com> <20260312113040.68189-6-eleanor.lin@realtek.com>
In-Reply-To: <20260312113040.68189-6-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 14:49:33 +0100
X-Gmail-Original-Message-ID: <CAD++jL=9J8p7sjfaFN1W_AoDuvJ+6FMXk=Mz6TMFN54VAPtTUQ@mail.gmail.com>
X-Gm-Features: AaiRm53YgIbgRT6duHd0On12WaicPrmfX8KKe4MLPMA8yK6MYMjttB2TeXiF5i8
Message-ID: <CAD++jL=9J8p7sjfaFN1W_AoDuvJ+6FMXk=Mz6TMFN54VAPtTUQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] pinctrl: realtek: add support for slew rate, input
 voltage and high VIL
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33526-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80A2329ABBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 12:30=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for configuring slew rate, input voltage level and high VIL
> mode. This involves updating the pin configuration parsing logic to handl=
e
> PIN_CONFIG_SLEW_RATE, PIN_CONFIG_INPUT_VOLTAGE_UV and the new custom
> property "realtek,high-vil-microvolt".
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

