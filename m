Return-Path: <linux-gpio+bounces-33849-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HIPFRI/vGn6vgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33849-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:23:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A602D0C1B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B13D300514C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555D53EFD11;
	Thu, 19 Mar 2026 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkLX+xRb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1960F3DCDB1
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944586; cv=none; b=OCvR7ijQ0jhsVjQFV3H2ginsdSigDJnzjvL/jVcqUVAtUL9uOE8fa5F8+z3uHKQaY9wMdcYOjwfLaqy9/F9qVc4faWzUdeq2V9nadi5dIp14P60TaWsXPVI+L3drM0R5fjinu8g1I9Sd+XdS+vB2SRpiLj7Eb1rByHRR/s0YW8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944586; c=relaxed/simple;
	bh=dVzhTVbTuYBquWriKuRJVswURezIBt12qB3T033dPlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/oDllctQFx0IqNROHVWsC7yOmtKL86cSgC/llmzHY3i+BSzsK5sQBDJlehE5TugGkOmRSXtQf87cwLSkihLiOELngH5XkYbmloF8/3oTaFvcZNTAXS7QPFPcX1vnuMod3oiR5IRzbbtrcH5YiHlF7Dxv4pZCw1c2invXxm/G7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkLX+xRb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F367CC2BCB1
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 18:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773944586;
	bh=dVzhTVbTuYBquWriKuRJVswURezIBt12qB3T033dPlk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SkLX+xRbuHy2bNacExc7ncO3ohAPfujMReULhWDYUeChJujEZac2icjZsMsIzRfyd
	 Surc9VMgr+oV1vkra0223oWpBbZ1wXef91XdEWjVMDsk+Iame6OYj+P1k337loZCKa
	 VVl9oCPSNrNaC+fJSo4/O8tSw2kfkfl1Tw1D2QT3QhBmsT24IRQSwCR+OnOFbiFvlU
	 xgcxLixQMdHD8yPL/YB/+tvluuRe7DBB2h/IZM42Yf564UFdHWcdTytr5ShfzqYZda
	 a6hhPTqeHhrMbnPfOsEQ/W5kJi6p0jn0EHUOcITwPQd54kQelIh721wz7KcTq26bRd
	 K2/FUk2i4bJhQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a75818937so13523187b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 11:23:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YwNrdkbWR5DsOt+h2/90wygp29I+kni0jM/kVkyZZGH5SfmvG8T
	g84m5NBUixjqtUmdkWvpgxYcWR7J+w+tsw+6P/74fT32fmR6L56/B/RTTdKahKib7a4KApNeZnt
	bVmwWl60dbQj6lTIkRKy7TTjiCeRZSZU=
X-Received: by 2002:a05:690c:1b:b0:79a:39db:9c8c with SMTP id
 00721157ae682-79a90bf012amr1168757b3.44.1773944585343; Thu, 19 Mar 2026
 11:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317103817.1982584-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260317103817.1982584-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 19:22:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLnCrQ9FHFRpNviDnC4uVRfugjZ1bvbgde94zC414-xqsQ@mail.gmail.com>
X-Gm-Features: AaiRm533mrc6W5fYjRZS6mte-fB1N2d5iFS0niPJs3_6dJAbrAmdjgCtVHLrkCI
Message-ID: <CAD++jLnCrQ9FHFRpNviDnC4uVRfugjZ1bvbgde94zC414-xqsQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: pinconf-generic: More fwnode related conversions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-33849-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 51A602D0C1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:38=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> While I have noticed some inconsistencies in the pinconf-generic code,
> I also found one minor issue and a room to convert the code to use
> fwnode APIs instead of being too OF-centric. This might help in the futur=
e
> to use similar data structures in software nodes.
>
> Andy Shevchenko (3):
>   pinctrl: pinconf-generic: Fully validate 'pinmux' property
>   pinctrl: pinconf-generic: Validate fwnode instead of device node
>   pinctrl: pinconf-generic: Convert ..._parse_dt_pinmux() to fwnode API

Patches applied!

Yours,
Linus Walleij

