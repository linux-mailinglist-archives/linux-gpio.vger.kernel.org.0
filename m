Return-Path: <linux-gpio+bounces-32909-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJHkGkjpr2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32909-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:50:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 192CD248D1C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20184302F9AA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8763DA7F3;
	Tue, 10 Mar 2026 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKKpp7AJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CC225A645
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136109; cv=none; b=pNS5Qf76LCA1I7CSLbTj9lvFzrP7kL3+aS2gtIxJkiZiLB9uHYYrJN2UzvASDE91KaHU8kFh5Qsb3/SNvBJP1ygWCdOlsRAwqAJqfUjGHuL0FJrbOSDMePDm5FE2XKRjWhoVsi722w92C6yfY6KimpFHM+fvv33XwUVXE3k1TwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136109; c=relaxed/simple;
	bh=Roe9unAo8hOJOYXIhe8DUoLAPPzE+T4k5irAoUIjGx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7vDy1OxSHxbVlwynzICxlZWYAG5WkWbS9mTZJ5dIxlc/lMdPSqffen46L3JDGq2DRXOgwJZ/0AJIYiUzYT+jjXoA35PPweSh7dqsYtXNitXOWiDLNqGqdMukFrdDr2jhatJ+NqeuzsskANQhF9v7lHQ5T1BtwshLsHri3W8IBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKKpp7AJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1558AC2BC87
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773136109;
	bh=Roe9unAo8hOJOYXIhe8DUoLAPPzE+T4k5irAoUIjGx0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hKKpp7AJqAo7Koe0cv080aODLoHhDy+zToDtu2e+kTaKN3IVVgmW/OhYSVBStJKfZ
	 95uyyPPQ8K279PtJg7y5ewvus0X5vtchWf8suUmQQpklTcyWKcranCRzKHl1f0ylxh
	 Mr30ablAAsL1neO4S5UYPcqDjqD0hIyqEALJX/FAWBnqoTTGNv+rkNUvPmgIIYsPXA
	 AeE3kUOmYYHrfbFYF4yXh2CX7yN7BTvygBJ/FqaJNO3V/jc3eIpqE6m4F6BaxrgSJk
	 QvJUj8ToiO+O2Nu+1mEbob7juhQVsbraSL3zFm8sFkQoE0awtVTBqYAl71gScz8b2v
	 mI0ZcsJIQdgdg==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7986d231b3cso157874577b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5hb8xmFRGcLpANFBQrEubogi7K0r5INQLtH7pXlfHFERhsh23etA7fyUNcFuG3oa06RL08xYAqpfO@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4eII2TxtZuwQS18Wq/YaT+uljwiU2TupTGTiqBsG2RYizG0F
	m1wqGWjwTK+Taj8PzETS7KBug9SWeLUOPuVyeJ2du9V81o3bcHb/30AvglIuwDpJiNWzzPg1IN4
	ujgU2w4Z9VKcBECXPaMuO6z1zEnglVYU=
X-Received: by 2002:a53:b1d4:0:b0:64c:ec13:e57c with SMTP id
 956f58d0204a3-64d5a235c7cmr1854690d50.39.1773136108443; Tue, 10 Mar 2026
 02:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306075244.1170399-1-eleanor.lin@realtek.com> <20260306075244.1170399-14-eleanor.lin@realtek.com>
In-Reply-To: <20260306075244.1170399-14-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:48:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLkWXGpphaO6my9ovge4e+1pD-ij9c+A1bH24mUa54mujw@mail.gmail.com>
X-Gm-Features: AaiRm52V87Yakq-T4nHCULwmCLhHG_reQHf2OvwkK_dAKKmOkDgws3_XIZX46TI
Message-ID: <CAD++jLkWXGpphaO6my9ovge4e+1pD-ij9c+A1bH24mUa54mujw@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] pinctrl: realtek: Add rtd1625 pinctrl driver
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, afaerber@suse.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 192CD248D1C
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
	TAGGED_FROM(0.00)[bounces-32909-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,realtek.com:email]
X-Rspamd-Action: no action

Hi Yu-Chun,

On Fri, Mar 6, 2026 at 8:53=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.com=
> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for Realtek RTD1625 SoC using the realtek common pinctrl driv=
er.
>
> This patch introduces the RTK_PIN_CONFIG_V2 and RTK_PIN_CONFIG_I2C macros=
,
> which are required to describe the specific register layout and electrica=
l
> features (such as slew rate and high VIL) of the RTD1625 pins.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
(...)
> +static int __init rtd1625_pinctrl_init(void)
> +{
> +       return platform_driver_register(&rtd1625_pinctrl_driver);
> +}
> +arch_initcall(rtd1625_pinctrl_init);

Do you really need the driver to be initialized at arch_initcall()
level? Can't it just be an ordinary module?

Yours,
Linus Walleij

