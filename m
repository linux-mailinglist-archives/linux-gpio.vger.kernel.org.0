Return-Path: <linux-gpio+bounces-32251-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lyfiBKXMoGkomwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32251-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 23:43:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B31B07E6
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 23:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DB1E305D1EC
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 22:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74F23B8BBC;
	Thu, 26 Feb 2026 22:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fo82+lXb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB0D2236F0
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772145825; cv=none; b=PivieTKFDYfC+127DJJcmpFmP5ZwaporihVzzjq5IEr4xnZTKLDVrtLt8f6yMe9dAEUJp1G/J+UN9sWiGK4Y2XQrqewJcjjfNmFa/sga6/jxMr5qOojYzAXhg8rG7e1FLdhrAHT44C4KsXgVxclAF6NKfAiLrCwShsFeM2x8pKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772145825; c=relaxed/simple;
	bh=FZH0ikxL28q8cXgkSYSFB0jqKJEa6OIchRU8MvHNFWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MB2ntS+HMLRg0BrkIFg6MqYxgFbdvYKwhKd4IXmjx96J0UJ4kKERJKLxxOvmccdu9gy+7zbY4VXw2F8oUkamkLDT906ZS6ACZKv66vFgO5RzZ0t0+R4OArLkGhtui4mPbTPkJqdyXaJa/NmUSC7wwwsoc2paPd5b+Z9jKhypBHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fo82+lXb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5D1C116C6
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772145825;
	bh=FZH0ikxL28q8cXgkSYSFB0jqKJEa6OIchRU8MvHNFWQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Fo82+lXb7wIFuvk0rhI/bK0PHXMXI5LNYlMzOirAyzn7EUHFDyEDb9YfAy2vxVJTw
	 q36kAzu3COXKmbYIbQsbQiQjKfpG8koV0uHC3p7vBKnkXL4ZneK/+kHlitTAIWsoJh
	 iVvII8sccFxVHtN5EkCijoxVy/Mkyj8awD7aOFr9HlAc1Jv7juXDlQniEsyvnVqAZg
	 9GNVymLRsWmOib6fCG7uo0NA/Yexm74BBRRvsIJ5Nv4uaghpiSwlgZTNPxKRnf3zZK
	 qDI+cWCjzBv+PfSu7jD+MLrDQEZZxPo2Ifn3jlno35KWxsbKRmsLdOlcArDS+aqgoJ
	 naaPICpAY/hQg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7986c7b8076so14074127b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 14:43:45 -0800 (PST)
X-Gm-Message-State: AOJu0YynJ5HQADHtrOAf58ZmqKrEjaNbtYYP/tc+qs7bunN+OkmNfxWM
	TOgL1FxHSJoANP6birS3S51jkiO4dNXv4cJhyXJndM0lMtHJ0bmsl3Jnpx+Px4OX5K99G41ViAA
	8aR8c3kVFwBcbC33gsYDYRQpqaDV8cKI=
X-Received: by 2002:a05:690c:102:b0:78f:bcc1:88e0 with SMTP id
 00721157ae682-79885470d4emr9097907b3.1.1772145824523; Thu, 26 Feb 2026
 14:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Feb 2026 23:43:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLkFBo6O7L2KpQPF=dzUFprPw4CS7h=oP0ccY0_k_UtW5A@mail.gmail.com>
X-Gm-Features: AaiRm52PLk2j1gRRnPs0dLTV5w_PyBnVemDSQQWwkxzWwMCgb9z-y5uCN6Q4VqI
Message-ID: <CAD++jLkFBo6O7L2KpQPF=dzUFprPw4CS7h=oP0ccY0_k_UtW5A@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] pinctrl: cy8c95x0: Yet another cleanup series and
 a fix
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32251-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5C4B31B07E6
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 7:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> While playing on with Intel Galileo board again, I found that I messed up=
 a bit
> with the driver. Here is a fix followed by a set of ad-hoc cleanups. Obvi=
ously
> tested on the above mentioned board.
>
> Andy Shevchenko (8):
>   pinctrl: cy8c95x0: Don't miss reading the last bank registers

This patch applied for fixes!

> pinctrl: cy8c95x0: Use devm_mutex_init() for mutex initialization
> pinctrl: cy8c95x0: remove duplicate error message
> pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
> pinctrl: cy8c95x0: Move driver data to the local variable in ->probe()
> pinctrl: cy8c95x0: Drop unused 'name' in struct cy8c95x0_pinctrl
> pinctrl: cy8c95x0: Eliminate fragile use of I=C2=B2C ID table
> pinctrl: cy8c95x0: Gather ID tables in one place

The rest 7 for next.

Yours,
Linus Walleij

