Return-Path: <linux-gpio+bounces-38344-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BfN3EFqqKmqdugMAu9opvQ
	(envelope-from <linux-gpio+bounces-38344-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:30:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 966C9671D86
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:30:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h26pdOCd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38344-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38344-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FCBC304B91B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D63B3DB30C;
	Thu, 11 Jun 2026 12:30:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA203F58EF
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:30:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181014; cv=none; b=rToxttGOkGd/WhxWrWNtY9wRpGbVn8KgMPEsjcXFEt7M9ob/mhqUbWq9DObVGLbsowg9NW0l+XhG0Fy/hlRNY2quQN9sopAPGvjLddgbJIQ19SEbIPYAO2B3eoIXIBnzr7l2CFqs/Pwhwzt2yXA4bj+8rVmGCsA82z/Nyr8EXdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181014; c=relaxed/simple;
	bh=d3mkKBsAWHfA2HFxijjQRqfvgOH5LnPzmEhxfFRY00M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdMyIUJV0afCedvaC7/zEVUZpLkucPWEeFTEKfL7Uh45my3AgkVJ3/M8J6nfkFcYijRQROBDCGA+AzybcOcgifymgnFS/nAEbGeN9tiWSA7xhsSDEGtQxGmekUHNTrDmGGomwXqTzMKhXbSNtFQnhmkLC8nRHLrIilzztfwxg5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h26pdOCd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EB71F0089E
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781181013;
	bh=d3mkKBsAWHfA2HFxijjQRqfvgOH5LnPzmEhxfFRY00M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h26pdOCdrDc+ghC1hZHu5w33OSzLnQmclzLUSsnNK9Gvn+0eR7leIUY49ok44Dyy0
	 WDYhEFJMI139epBU1/MOdYn4kDhKZUwUq3ggUUrjORoiHRCK9aAO5G7hF4GuNufUjs
	 9w/Mym5EfQ/ueBz2STBNdoKwuHwnjnoqCPddUXINxpH0o0wCD8ywhyzVrF4I0+aOib
	 e5xX0/AH8Yw0gI/vuzm4NpJK/IHIiqOnSkgNGaxj7arDUI7ooIFDSB8O14sSXcQ0N6
	 6kdBLLQK6RwFAUwXQPRtrqCRHYPXA5JZ55sHKFH27sgzP/CkL0fk9BvshWZtBkXpC1
	 dFvYv70Ng8GBQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso840969e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:30:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+RTsnJvc9bnlSVKEt5tUcZIZc5mXNZxLDPmD37QeMmBNE8/LE8wEp+9QliLTNlmZJyyTwFgoqHmZMf@vger.kernel.org
X-Gm-Message-State: AOJu0YzIJO/Oa37gU+O1e8Sg1o/mni6i+o+ZB5PxygdzGImpRCcCHTC0
	syZVna4S2/yqM0o0lSjeSDwBzl9XWDt/fdqOXoqLYIhCfM22iLPTzLcy0ef4gFNzZeD34XNcsN6
	O5/iNc2x5f9Xt/KVYG+NtbDrQG0EWaI0=
X-Received: by 2002:a05:6512:110b:b0:5aa:65a3:468c with SMTP id
 2adb3069b0e04-5ad285e7f1amr709976e87.7.1781181012388; Thu, 11 Jun 2026
 05:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <ailxCrCYXPkrKqi-@ashevche-desk.local>
In-Reply-To: <ailxCrCYXPkrKqi-@ashevche-desk.local>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:30:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLkRW+wmf_oFVmmn8bN0ZbS=8vZvV8nWJyy9Zb4O3LP-dg@mail.gmail.com>
X-Gm-Features: AVVi8CduHx3kraOwhZJ2IAuDExQ8qm468u_8xZwuigpHwOuna1EQkJK_8Gk_TYY
Message-ID: <CAD++jLkRW+wmf_oFVmmn8bN0ZbS=8vZvV8nWJyy9Zb4O3LP-dg@mail.gmail.com>
Subject: Re: [PATCH 0/2] upboard pinctrl support for device id INTC1055
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: GaryWang <is0124@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38344-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,bootlin.com,aaeon.eu,aaeon.com.tw,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 966C9671D86

On Wed, Jun 10, 2026 at 4:13=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Wed, Jun 10, 2026 at 04:34:22PM +0800, GaryWang wrote:
> > Add missing groups and functions in Tigerlake's pinctrl driver for INTC=
1055.
> > Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "=
UP 7000" boards.
>
> I can take both via Intel pin control tree, just waiting for Mika's and L=
inus' acks.
> Then I can send PR to Linus to (try to) include this to v7.2-rc2 as it se=
ems close
> enough to the category of adding new HW support without breaking anything=
 else.

Excellent, thanks.
Acked-by: Linus Walleij< linusw@kernel.org>

Yours,
Linus Walleij

